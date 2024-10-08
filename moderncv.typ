/*
 * Customizations on this template:
 *
 * - headings (h1..h4)
 *
 * - `datebox` function: provides content with stacked year above (big) and month below (tinier)
 *
 * - `daterange` function: two `datebox`es separated by an em dash
 *
 * - `xdot`: function, adds a trailing dot to a string only if it's not already present
 *
 * - `cvgrid`: basic layout function that wraps a grid. Controlled by two parameters `left_column_size` (default: 25%) and `grid_column_gutter` (default: 8pt) which control the left column size and the column gutter respectively.
 *
 * - `cvcol`: used to write in the rightmost column only. Builds on `cvgrid`
 *
 * - `cventry`: used to write a CV entry. Builds on `cvgrid`
 *
 * - `cvlangauge`: used to write a language entry. Builds on `cvgrid`
 *
 */

#let left_column_size = 25%
#let grid_column_gutter = 8pt

#let main_color = rgb("#3873b2")
#let heading_color = main_color
// #let job_color = rgb("#737373")
#let familyname_color = rgb("#737373")
#let firstname_color = rgb("#b9b9b9")

#let project(
  title: "",
  familyname: [],
  firstname: [],
  phone: "",
  email: "",
  github: "",
  left_column_size: left_column_size,
  grid_column_gutter: grid_column_gutter,
  main_color: main_color,
  heading_color: heading_color,
  firstname_color: firstname_color,
  familyname_color: familyname_color,
  body
) = {
  let author = firstname + familyname
  set document(author: author, title: title)
  set page(
    numbering: "1/1", 
    margin: (top: 1.5cm, left: 2cm, right: 2cm),
    footer: [
      #set block(below: 0.5em)

      #if github != "" {
        align(top)[
          #box(height: 1em, baseline: 20%)[#pad(right: 0.4em)[#image("icons/github.svg")]]
          #link("https://github.com/" + github)[#github]
        ]
      }

      #if phone != "" {
        align(top)[
          #box(height: 1em, baseline: 20%)[#pad(right: 0.4em)[#image("icons/phone-solid.svg")]]
          #link("tel:" + phone)[#phone]
        ]
      }

      #if email != "" {
        align(top)[
          #box(height: 1em, baseline: 20%)[#pad(right: 0.4em)[#image("icons/envelope-regular.svg")]]
          #link("mailto:" + email)
        ]
      }
    ]
  )
  set text(font: ("Latin Modern Sans", "Inria Sans"), lang: "en", fallback: true)
  show math.equation: set text(weight: 400)

  /*
   * How headings are used:
   * - h1: section (colored, prominent, with colored rectangle, spans two columns)
   * - h2: role (bold)
   * - h3: place (italic)
   * - h4: generic heading (normal, colored)
   */
  show heading.where(level: 1): element => [
    #v(0em)
    #box(
      inset: (right: grid_column_gutter, bottom: 0.1em),
      rect(fill: main_color, width: left_column_size, height: 0.25em)
    )
    #text(element.body, fill: heading_color, weight: 400)
  ]

  show heading.where(level: 2): element => [
    #text(element.body + ",", size: 0.8em)
  ]

  show heading.where(level: 3): element => [
    #text(element.body, size: 1em, weight: 400, style: "italic")
  ]

  show heading.where(level: 4): element => block[#text(element.body, size: 1em, weight: 400, fill: heading_color)]

  set list(marker: box(circle(radius: 0.2em, stroke: heading_color), inset: (top: 0.15em)))

  set enum(numbering: (n) => text(fill: heading_color, [#n.]))

  align(right+top)[
      // Author information.
      #text([#text(firstname, fill: firstname_color) #text(familyname, fill: familyname_color)], weight: 400, 3.4em)
      
      #v(-3.2em)

      #line(length:100%, stroke: firstname_color)
    
      // Title row.
      #block(text(weight: 400, 1.5em, title, style: "italic", fill: familyname_color))
  ]
  
  v(3em)

  // Main body.
  set par(justify: true, leading: 0.5em)

  body
}

#let datebox(month: "", year: []) = box(
  align(center,
    stack(
      dir: ttb,
      spacing: 0.4em,
      text(size: 1em, [#year]),
      text(size: 0.75em, month),
    )
  )
)

#let daterange(start: (month: "", year: []), end: (month: "", year: [])) = box(
  stack(dir: ltr,
    spacing: 0.75em,
    datebox(month: start.month, year: start.year),
    [--],
    datebox(month: end.month, year: end.year)
  )
)

#let cvgrid(..cells) = pad(bottom: 0.8em)[#grid(
  columns: (left_column_size, auto),
  row-gutter: 0em,
  column-gutter: grid_column_gutter,
  ..cells
)]

#let cvcol(content) = cvgrid([], content)

#let xdot(s) = {
  if s.ends-with(".") {
    s
  } else {
    s + "."
  }
}

#let cventry(
  description,
  start: (month: "", year: ""),
  end: (month: "", year: ""),
  place: "",
  role: []
) = cvgrid(
  align(center, daterange(start: start, end: end)),
  [
    == #role
    === #xdot(place)
  ],
  [],
  description
)

#let cvlanguage(
  language: [],
  description: [],
  certificate: [],
) = cvgrid(
  align(right, language),
  [#description #h(3em) #text(style: "italic", certificate)],
)

#let cvline(
  left: [],
  text: [],
) = cvgrid(
  align(center, left),
  text,
)

#let textit(content) = (
  text(content, style: "italic")
)


// Link Definitions:

#let iconlink(
  icon: "",
  url: "",
  linktext: [],
) = [
  #box[
    #pad(right: 0.5em)[
      #box(height: 1em, baseline: 20%)[#image("icons/" + icon + ".svg")]
      #link(url, linktext)
    ]
  ]
]

#let sourcelink(
  url,
) = iconlink(
  icon: "git-alt-brands-solid",
  url: url,
  linktext: "Source",
)

#let projectlink(
  url,
) = iconlink(
  icon: "file-lines-solid",
  url: url,
  linktext: "Project",
)

#let paperlink(
  url,
) = iconlink(
  icon: "file-pdf-solid",
  url: url,
  linktext: "Paper",
)


#let cvpub(
  title: "",
  authors: [],
  venue: "",
  icons: [],
  project: "",
  paper: "",
) = cvgrid(
  align(center, []),
  [
    == #title
    
    #authors

    #if venue != "" {
      [#venue]
    }

    #if project != "" {
      [#projectlink(project)]
    }
    #if paper != "" {
      [#paperlink(paper)]
    }
  ],
)

#let cvproject(
  title: "",
  git: "",
  description,
) = cvgrid(
  [],
  [
    == #title
    #description
    
    #if git != "" {
      [#sourcelink(git)]
    }
  ]
)

