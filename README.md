# HCW PUMA thesis template

A Typst template for bachelor and master theses in Public Management (PUMA) at
the Hochschule Campus Wien. [Template/](Template/) contains the template, and
[WordFormatvorlage/](WordFormatvorlage/) recreates the official Word
Formatvorlage with it.


## Setup

Install:

- [Typst](https://github.com/typst/typst)
- [typstyle](https://github.com/typstyle-rs/typstyle)
- The VS Code extensions
  [Tinymist](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)
  and [Custom Local
  Formatters](https://marketplace.visualstudio.com/items?itemName=jkillian.custom-local-formatters)

Then create `.vscode/settings.json` so that VS Code formats with `format.ps1`:

~~~json
{
  "[typst]": {
    "editor.defaultFormatter": "jkillian.custom-local-formatters"
  },
  "customLocalFormatters.formatters": [
    {
      "command": "powershell -NoProfile -File format.ps1",
      "languages": [
        "typst"
      ]
    }
  ],
}
~~~


## Building

Run from the repository root:

~~~powershell
# Compile once
typst compile --root . WordFormatvorlage/WordFormatvorlage.typ Output/WordFormatvorlage.pdf
# Recompile whenever the source file is saved
typst watch --root . WordFormatvorlage/WordFormatvorlage.typ Output/WordFormatvorlage.pdf
~~~


## Formatting

In VS Code, press <kbd>Alt</kbd>+<kbd>Shift</kbd>+<kbd>F</kbd> to format the
current file. To format all files at once, run:

~~~powershell
.\format.ps1 -i .
~~~
