// Template for bachelor and master thesis in Public Management (PUMA) at
// Hochschule Campus Wien
//
// The template only provides styles and building blocks. The document puts
// them together:
//
//   #show: template          Styles for the whole document
//   #title-page(...)
//   #show: front-matter      Roman page numbers, unnumbered headings
//   ...                      Vorwort, #table-of-contents(), ...
//   #show: main-matter       Arabic page numbers from 1, numbered headings
//   ...                      Chapters
//   #show: back-matter       Unnumbered headings again
//   ...                      Literaturverzeichnis, Anhang, ...

#import "@preview/glossy:0.9.2": glossary


#let template(body) = {
  set page(
    paper: "a4",
    margin: (top: 26.1mm, bottom: 28mm, left: 30mm, right: 26mm),
    footer: context align(right, text(size: 10pt, counter(page).display())),
    footer-descent: 4mm,
  )
  set text(
    font: "Arial",
    size: 12pt,
    lang: "de",
    region: "AT",
    // TODO: Should we enable this? Word does not hyphenate by default, but
    // Typst does and it usually improves text justification.
    hyphenate: false,
  )
  set par(
    justify: true,
    leading: 0.664em,
    spacing: 14pt,
    first-line-indent: (amount: 7.5mm, all: true),
  )

  // TODO: Add named constants for reused leading values like this
  show heading: set par(leading: 0.43em)
  show heading: set block(above: 20pt, below: 11.3pt)
  show heading.where(level: 1): set text(size: 14pt)
  show heading.where(level: 1): set par(leading: 0.6em)
  show heading.where(level: 1): set block(below: 14pt)
  show heading.where(level: 2): set text(size: 13pt)
  show heading.where(level: 3): set text(size: 12pt)
  // Unnumbered headings: table of contents, bibliography, etc.
  show heading.where(numbering: none): set text(size: 12pt)
  show heading.where(numbering: none): set block(below: 13.3pt)
  // Chapters start on a new page, numbered ones in capital letters
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    if it.numbering == none { it } else { upper(it) }
  }

  set figure(gap: 10.4pt)
  show figure: set block(above: 25pt, below: 25pt)
  show figure.where(kind: table): set figure.caption(position: bottom)
  show figure.caption: set text(size: 10pt)
  show figure.caption: set par(
    leading: 0.43em,
    first-line-indent: 0mm,
    justify: false,
  )

  set table(
    stroke: 0.5pt + rgb("#808080"),
    inset: (x: 5pt, y: 8pt),
    fill: (x, y) => if y == 0 { rgb("#4C4C4C") },
  )
  show table: set text(size: 10pt)
  show table: set par(leading: 0.43em, first-line-indent: 0mm, justify: false)
  show table.cell.where(y: 0): set text(fill: white, weight: "bold")

  set list(
    marker: ([•], [‒], [•]),
    indent: 10mm,
    body-indent: 3.5mm,
    spacing: 11.3pt,
  )
  // TODO: Why a different body-indent?
  set enum(indent: 10mm, body-indent: 2.8mm)
  // A bullet list follows its introducing sentence without paragraph spacing
  show list: set block(above: 8pt)
  show list: set par(leading: 0.61em, first-line-indent: 0mm)
  show enum: set par(first-line-indent: 0mm)

  set quote(block: true, quotes: false)
  show quote: set par(first-line-indent: 0mm)
  show quote: set pad(left: 7.5mm, right: 6.5mm)
  show quote: set block(above: 30.5pt, below: 30.5pt)

  set bibliography(title: none, style: "chicago-author-date")
  show bibliography: set text(size: 10pt)
  show bibliography: set par(
    leading: 0.61em,
    spacing: 10.1pt,
    first-line-indent: 0mm,
    hanging-indent: 7.5mm,
    justify: false,
  )

  set math.equation(numbering: "(1)")
  show math.equation.where(block: true): set block(above: 10.8pt, below: 9.2pt)

  show footnote.entry: set text(size: 8pt)
  show footnote.entry: set par(leading: 0.91em)
  // Keeps the last footnote clear of the page number, like in Word
  show footnote.entry: it => pad(bottom: 5.2pt, it)
  set footnote.entry(gap: 6pt, indent: 7.5mm)

  body
}


// Horizontal positions are measured from the left margin, vertical ones from
// the top of the page.
#let title-page(
  thesis-type: none,
  title: none,
  subtitle: none,
  english-title: none,
  english-subtitle: none,
  authors: (),
  degree: none,
  program: none,
  supervisors: (),
  date: none,
) = page(
  numbering: none,
  footer: none,
  margin: (y: 0mm, left: 30mm, right: 26mm),
)[
  #set par(justify: false, first-line-indent: 0mm, spacing: 0pt)

  #place(top + left, dx: -12.8mm, dy: 9.3mm, image(
    "Logo.png",
    width: 67.5mm,
  ))

  #place(top + left, dy: 78mm)[
    #text(size: 20pt, thesis-type)
    #v(13.3mm)
    #text(size: 14pt, weight: "bold", title)
    #v(3mm)
    #subtitle
    #v(11.9mm)
    #text(size: 14pt, weight: "bold", english-title)
    #v(4.9mm)
    #english-subtitle
  ]

  #place(top + left, dx: 7.5mm, dy: 195.9mm)[
    verfasst von #strong(authors.join(", "))
    #v(7.9mm)
    zur Erlangung des akademischen Grades
    #v(2.6mm)
    #strong(degree)
  ]

  #place(top + left, dx: 7.5mm, dy: 246.5mm, {
    set text(size: 10pt)
    set par(leading: 0.61em)
    grid(
      columns: (53.5mm, 1fr),
      row-gutter: 4.3mm,
      grid.cell(colspan: 2)[Wien, #date],
      [Studiengang -- Lehrgang:], program,
      [an:], [Hochschule Campus Wien],
      [betreut von:], supervisors.join(linebreak()),
    )
  })
]


// Everything before the first chapter
#let front-matter(body) = {
  set page(numbering: "i")
  set heading(numbering: none)
  counter(page).update(1)
  body
}


// The chapters
#let main-matter(body) = {
  pagebreak(weak: true)
  set page(
    numbering: "1",
    header: context {
      let page-number = here().page()
      let chapter-headings = query(heading.where(level: 1)).filter(h => (
        h.location().page() <= page-number
      ))
      if chapter-headings.len() > 0 {
        set text(size: 10pt)
        set par(first-line-indent: 0mm, justify: false)
        chapter-headings.last().body
      }
    },
    header-ascent: 10.5mm,
  )
  set heading(numbering: "1.1.")
  counter(page).update(1)
  body
}


// Everything after the last chapter
//
// TODO: Think about removing the chapter headings from the header in the
// backmatter. The Formatvorlage is inconsistent here.
#let back-matter(body) = {
  set heading(numbering: none)
  body
}


#let table-of-contents() = {
  heading(level: 1, numbering: none)[Inhaltsverzeichnis]
  v(22.5pt)
  {
    set outline(indent: _ => 5mm)
    set outline.entry(fill: box(inset: (x: 4pt), repeat(justify: false)[.]))
    show outline.entry: set par(leading: 0.61em, justify: false)
    show outline.entry: set block(below: 0pt)
    show outline.entry.where(level: 1): set text(weight: "bold")
    show outline.entry.where(level: 1): set block(above: 13.3pt)
    show outline.entry.where(level: 2): set text(size: 11pt, weight: "bold")
    show outline.entry.where(level: 2): set block(above: 12.7pt)
    show outline.entry.where(level: 3): set text(size: 10pt)
    show outline.entry.where(level: 3): set block(above: 12.1pt)
    // The title starts at a fixed position per level, like at Word's tab stops
    show outline.entry: it => {
      let number-width = (12.5mm, 17.5mm, 24.6mm).at(it.level - 1)
      let number = if it.prefix() != none {
        box(width: number-width, it.prefix())
      }
      link(it.element.location(), it.indented(number, it.inner(), gap: 0pt))
    }
    // Must come after the rule above to wrap its result
    show outline.entry.where(level: 1): upper
    outline(title: none, depth: 3)
  }
}


#let list-of-abbreviations(show-all: false) = {
  // Glossy sets the title as a `heading(level: 1, title)` which would be
  // numbered in the main matter
  set heading(numbering: none)
  glossary(
    title: "Abkürzungsverzeichnis",
    // One paragraph per entry, the long form at a fixed position
    theme: (
      section: (title, body) => heading(level: 1, title) + body,
      group: (name, index, total, body) => body,
      entry: (entry, index, total) => par[
        #box(width: 20mm, entry.short)#entry.long#entry.label
      ],
    ),
    sort: true,
    ignore-case: false, // When sorting
    // Lists all entries, also the ones not used in the text
    show-all: show-all,
  )
}


// A list of figures of the given kind. It only appears if there is more than
// one such figure. An entry reads "Abbildung 1: Title" and shows only the
// caption's first line.
#let figure-list(kind, title) = context {
  if query(figure.where(kind: kind)).len() > 1 {
    heading(level: 1, numbering: none, title)
    show outline.entry: set block(spacing: 14pt)
    show outline.entry: set par(
      first-line-indent: 0mm,
      hanging-indent: 8.5mm,
      justify: false,
    )
    let first-line(caption) = if caption.has("children") {
      caption.children.split(linebreak()).first().join()
    } else { caption }
    show outline.entry: it => link(it.element.location())[
      #it.prefix(): #first-line(it.body()) #h(1fr) #it.page()
    ]
    outline(title: none, target: figure.where(kind: kind))
  }
}


#let list-of-figures() = figure-list(image, [Abbildungsverzeichnis])
#let list-of-tables() = figure-list(table, [Tabellenverzeichnis])
