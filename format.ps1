# Format Typst files according to the project's style
#
# Usage:
#
#   .\format.ps1 -i|--inplace <path>... Format the files in place
#   .\format.ps1 --check <path>...      Only check, and list unformatted files
#   .\format.ps1 < file.typ             Format standard input to standard output
#
# A path is a .typ file or a folder, which is searched recursively for .typ
# files. --check exits with 1 if any file is not formatted. Formatting through
# standard input allows using the script with the Custom Local Formatters
# extension in VS Code.
#
# The script runs typstyle and then applies the whitespace rules in the order
# listed below. The result still passes typstyle --check. A file keeps its line
# endings, LF or CRLF.
#
# - A file does not start with a blank line
# - A line comment has a space after its slashes
# - One blank line separates the top-level comment from the imports
# - No blank lines separate preceding comments from imports, except for the
#   top-level comment
# - At most one blank line separates groups of imports
# - Two blank lines follow the last import
# - A heading has two blank lines above it. Comments directly above a heading
#   stay with it.
# - A heading has one blank line below it
# - A content block has no blank lines at its start or end
# - At most two blank lines follow each other
# - A file ends with exactly one newline
#
# For simplicity, raw text is formatted like everything else, and headings
# require a blank line, a line ending in "[", or another heading, possibly
# followed by comments, above them. The latter is a heuristic to distinguish the
# start of headings from equality operators.

$typstyleOptions = @(
    '--line-width', '80'
    '--indent-width', '2'
    '--wrap-text=fill'
)

# Windows PowerShell would otherwise read and write text in the console's code
# page and add a byte order mark to the files it writes
$utf8 = New-Object System.Text.UTF8Encoding $false


function Exit-WithUsageError([string]$message) {
    Write-Host "format.ps1: $message"
    Write-Host 'Usage: .\format.ps1 -i|--inplace <path>... | --check <path>... | < file.typ'
    exit 2
}


# Reads the arguments into the mode, which is inplace, check, or stdin, and the
# paths to format
function Read-Arguments([string[]]$arguments) {
    $modes = @()
    $paths = @()
    foreach ($argument in $arguments) {
        if ($argument -ceq '-i' -or $argument -ceq '--inplace') {
            $modes += 'inplace'
        } elseif ($argument -ceq '--check') {
            $modes += 'check'
        } elseif ($argument -like '-*') {
            Exit-WithUsageError "unknown option $argument"
        } else {
            $paths += $argument
        }
    }
    $modes = @($modes | Select-Object -Unique)
    if ($modes.Count -gt 1) {
        Exit-WithUsageError '-i and --check exclude each other'
    }
    if ($modes.Count -eq 1 -and $paths.Count -eq 0) {
        Exit-WithUsageError 'no path given'
    }
    if ($modes.Count -eq 0 -and $paths.Count -gt 0) {
        Exit-WithUsageError 'give -i or --check with paths'
    }
    $mode = if ($modes.Count -eq 1) { $modes[0] } else { 'stdin' }
    @{ Mode = $mode; Paths = $paths }
}


# Finds the .typ files among the given paths, searching folders recursively
function Find-TypstFiles([string[]]$paths) {
    $files = foreach ($path in $paths) {
        if (-not (Test-Path $path)) {
            Exit-WithUsageError "$path does not exist"
        }
        if (Test-Path $path -PathType Container) {
            # -Filter alone would also match longer extensions like .typst
            Get-ChildItem $path -Recurse -File -Filter '*.typ' |
                Where-Object { $_.Extension -eq '.typ' }
        } elseif ((Get-Item $path).Extension -ne '.typ') {
            Exit-WithUsageError "$path is not a .typ file"
        } else {
            Get-Item $path
        }
    }
    @($files | Sort-Object FullName -Unique)
}


function Read-StandardInput {
    $standardInput = New-Object System.IO.MemoryStream
    [Console]::OpenStandardInput().CopyTo($standardInput)
    # Remove byte order mark (U+FEFF) if present
    $utf8.GetString($standardInput.ToArray()).TrimStart([char]0xFEFF)
}


function Write-StandardOutput([string]$text) {
    $bytes = $utf8.GetBytes($text)
    [Console]::OpenStandardOutput().Write($bytes, 0, $bytes.Length)
}


# .NET resolves relative paths against the process' working directory, which
# Windows PowerShell does not keep in sync with the current location, so both
# functions take full paths
function Read-TextFile([string]$fullPath) {
    [System.IO.File]::ReadAllText($fullPath)
}


function Write-TextFile([string]$fullPath, [string]$text) {
    [System.IO.File]::WriteAllText($fullPath, $text, $utf8)
}


# Applies the rules for comments and blank lines (see the top of this script)
function Format-Whitespace([string]$text) {
    # The rules work on LF line endings, so CRLF line endings are converted to
    # LF here and restored at the end
    $crlf = $text.Contains("`r`n")
    $text = $text -replace "`r`n", "`n"

    # A file does not start with a blank line. This comes first, so that later
    # rules that require \A work correctly.
    $text = $text.TrimStart("`n")
    # A line comment has a space after its slashes
    $text = $text -replace '(?m)^([ \t]*//)(?=[^\s/])', '$1 '

    $comment = '[ \t]*//.*\n'
    $comments = "(?:$comment)*"

    # One blank line separates the top-level comment from the imports
    $text = $text -replace "\A((?:$comment)+)\n*(?=$comments#import)", "`$1`n"
    # No blank lines separate preceding comments from imports, except for the
    # top-level comment
    $text = $text -replace "(?m)(?<!\A$comments)^($comment)\n+(?=(?:$comment|\n)*#import)", '$1'
    # At most one blank line separates groups of imports
    $text = $text -replace "\n{3,}(?=$comments#import)", "`n`n"
    # Two blank lines follow the last import
    $import = '#import(?>.*\(\n(?:[ \t]+.*\n)*\).*|.*)\n'
    $text = $text -replace "(?m)^($import)\n*(?=[^\n])(?!$comments#import)", "`$1`n`n"

    $heading = '[ \t]*=+ .*\n'
    # A heading has two blank lines above it. Comments directly above a heading
    # stay with it.
    $newlinesCommentsAndHeadings = "(?<=[^\n])\n\n+($comments)($heading)"
    $text = $text -replace $newlinesCommentsAndHeadings, "`n`n`n`$1`$2"
    # A heading has one blank line below it. The lookbehind also accepts
    # headings above it, so that headings directly below each other are all
    # formatted in one run.
    $headingsAndNewlines = "(?<=(?:\A|\n\n|\[\n)(?:$comments$heading)*$comments)($heading)\n*"
    $text = $text -replace $headingsAndNewlines, "`$1`n"

    # A content block has no blank lines at its start or end
    $text = $text -replace '\[\n\n+', "[`n"
    $text = $text -replace '\n\n+([ \t]*\])', "`n`$1"
    # At most two blank lines follow each other
    $text = $text -replace '\n{4,}', "`n`n`n"
    # A file ends with exactly one newline
    $text = $text.TrimEnd("`n") + "`n"

    if ($crlf) {
        $text = $text -replace "`n", "`r`n"
    }
    $text
}


# Formats the text of a Typst file with typstyle and the rules of this script.
# Typstyle formats a copy in a temporary folder, which avoids passing the text
# through a PowerShell pipe, and the copy has the file's name, so that
# typstyle's error messages name it. Returns $null if typstyle fails.
function Format-Typst([string]$text, [string]$fileName) {
    $folder = Join-Path ([System.IO.Path]::GetTempPath()) "format-$([guid]::NewGuid())"
    $null = New-Item -ItemType Directory $folder
    try {
        $copy = Join-Path $folder $fileName
        Write-TextFile $copy $text
        $null = typstyle @typstyleOptions -i $copy
        $succeeded = $LASTEXITCODE -eq 0
        $formatted = Read-TextFile $copy
    } finally {
        Remove-Item -Recurse $folder
    }
    if ($succeeded) {
        Format-Whitespace $formatted
    }
}


$arguments = Read-Arguments $args

if ($arguments.Mode -eq 'stdin') {
    $formatted = Format-Typst (Read-StandardInput) 'stdin.typ'
    if ($null -eq $formatted) {
        exit 1
    }
    Write-StandardOutput $formatted
    exit 0
}

$anyFailed = $false
$anyUnformatted = $false
foreach ($file in Find-TypstFiles $arguments.Paths) {
    $relativePath = Resolve-Path -Relative $file.FullName
    $text = Read-TextFile $file.FullName
    $formatted = Format-Typst $text $file.Name
    if ($null -eq $formatted) {
        Write-Host "format.ps1: typstyle could not format $relativePath"
        $anyFailed = $true
    } elseif ($formatted -cne $text) {
        if ($arguments.Mode -eq 'inplace') {
            Write-TextFile $file.FullName $formatted
        } else {
            Write-Host "Would reformat: $relativePath"
            $anyUnformatted = $true
        }
    }
}
if ($anyFailed -or $anyUnformatted) {
    exit 1
}
exit 0
