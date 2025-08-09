#import "default.typ": *

#let currentH(level: 1)={
  let elems = query(selector(heading.where(level: level)).after(here()))

  if elems.len() != 0 and elems.first().location().page() == here().page() {
    return [#elems.first().body] 
  } else {
    elems = query(selector(heading.where(level: level)).before(here()))
    if elems.len() != 0 {
      return [#elems.last().body] 
    }
  }
  return "Sommaire"
}

#let convert_months(num) = {
  ( (num == 1 , "janvier"),
    (num == 2 , "février"),
    (num == 3 , "mars"),
    (num == 4 , "avril"),
    (num == 5 , "mai"),
    (num == 6 , "juin"),
    (num == 7 , "juillet"),
    (num == 8 , "août"),
    (num == 9 , "septembre"),
    (num == 10, "octobre"),
    (num == 11, "novembre"),
    (num == 12, "décembre")).find(t => t.at(0)).at(1)
}

#let convert_days(name) = {
  ( (name == "Monday", "Lundi"),
    (name == "Tuesday", "Mardi"),
    (name == "Wednesday", "Mercredi"),
    (name == "Thursday", "Jeudi"),
    (name == "Friday", "Vendredi"),
    (name == "Saturday", "Samedi"),
    (name == "Sunday", "Dimanche")).find(t => t.at(0)).at(1)
}

#let template(
  doc, 
  title: "",
  author: default_author,
  collaborators: default_collaborators,
  show_outline: default_show_outline,
  outline_depth: default_outline_depth
) = {[
  #let collaborators = if type(collaborators) == array {collaborators.join(", ")} else {collaborators}
  #let author = if type(author) == array {author.join(", ")} else {author}

  #set text(lang: "fr")

  #set document(title: title, author: author, date: datetime.today())

  #set par(
    justify: true,
    spacing: 1em
  )

  #set page(
    header: context {
      let chapter = currentH()
      if counter(page).get().first() > 1 [
        #set text(size: 9pt)
        #title -- #chapter
        #h(1fr)
        #author
        #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
      ]
    },

    footer: context [
      #set text(9pt)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align: (left, center, right),
        smallcaps[Lycée du Parc],
        counter(page).display(
          "— 1/1 —",
          both: true
        ),
        smallcaps[861 - $upright(H X) i^2$]
      )
    ]
  )

  #set heading(numbering: "1.")

  #let header_counter(level) = context {
    counter(heading).display((..nums) => {
      let c = nums.pos().last()
      if level == 1 { numbering("I -", c) }
      else if level == 2 { numbering("1)", c) }
      else if level == 3 { numbering("a.", c) }
      else { numbering("(i)", c) }
    })
  }

  #show heading: it => {
    par()[
      #header_counter(it.level)
      #it.body
    ]
  }

  #show heading.where(level: 1): it => {
  v(0.5em)
    set text(18pt, font: "Leckerli One")
    it
    counter(math.equation).update(0) // reset equation counter for each chapter  
  }

  #show heading.where(level: 2): it => {
    stack(
      spacing: 0.32em,
      it,
      align(center, line(length: 100%, stroke: (paint: gray, thickness: 0.8pt)))
    )
  }	

  #set math.equation(numbering: "(1)", supplement: [])

  #set math.equation(
    numbering: it => {
      let count = counter(heading.where(level: 1)).at(here()).first()
      if count > 0 {
        numbering("(1.1)", count, it)
      } else {
        numbering("(1)",it)
      }
    }
  )

  #show math.equation: it => {
    math.display(it)
  }

  // Page content

  #v(0.8fr)
  #align(center)[
    #text(size: 30pt, weight: "bold")[#title]

    #text(size: 18pt, weight: "semibold")[#author #if collaborators != none {[, #collaborators]}]

    #v(10pt)

    #let day(str) = datetime.today().display(str)
    #text(size: 12pt)[#convert_days(day("[weekday]")) #day("[day]") #convert_months(int(day("[month]"))) #day("[year]")]
  ]
  #v(1fr)
  #pagebreak()

  // Outline

  #if show_outline {
    align(center, {text(size: 25pt)[Sommaire]})
    v(1.5em)
    outline(title: none, depth: outline_depth, indent: auto, target: heading.where())
    pagebreak()
  }
  
  #doc
]}