#import "@preview/cetz:0.4.1"
#import "@preview/cetz-plot:0.1.0"
#import "@preview/colorful-boxes:1.4.3": *
#import cetz: canvas, draw, vector
#import draw: *

#import "./template.typ": *
#import "./template-slide.typ": *

#let inv_head(body) = {
  counter(heading).update(0)
  heading(body, outlined: false, numbering: none)
  counter(heading).update(0)
}

#let arrow_fig(start, end, style: 1pt + black) = {
  line(start, end, stroke: style, mark: (end: "straight"))
}

#let und(x) = math.underline($#x$)
#let Tilde(it) = math.accent(it, math.tilde, size: 1.2em)
#let Vect(it) = math.accent(it, math.arrow)
#let D1(it) = math.accent(it, math.dot)
#let D2(it) = math.accent(it, math.dot.double)

#let result(c) = align(center, (box(c, inset: 1em, stroke: 1.5pt + rgb("#ff2929"))))
#let todo(c) = align(center, (box(c, inset: 1em, stroke: 2pt + rgb("#3344e2"))))

#let figcan(body, caption: none) = {
  figure(caption: caption, canvas(body))
}

#let equ = math.arrow.l.r.double.long;

#let lim = $stretch(limits(-->))$

#let counters = (
  defi: counter("defi"),
  prop: counter("prop"),
  coro: counter("coro"),
  lemm: counter("lemm"),
  theo: counter("theo"),
  rema: counter("rema"),
  exem: counter("exem"),
  quot: counter("quot"),
)

#let conv-type(type) = {
  (
    (type == "defi", "Définition"),
    (type == "prop", "Proposition"),
    (type == "coro", "Corollaire"),
    (type == "lemm", "Lemme"),
    (type == "theo", "Théorème"),
    (type == "rema", "Remarque"),
    (type == "exem", "Exemple"),
    (type == "quot", "Citation"),
  )
    .find(t => t.at(0))
    .at(1)
}

#let lighten-color(color, diff: 80%) = {
  color.lighten(diff)
}

#let item(type, color, title, content) = {
  if type not in counters {
    text(fill: red)[erreur : type #type inconnu]
    return
  }

  context {
    if query(<all_num>).first().value {
      for count in counters.keys() {
        counters.at(count).step()
      }
    } else {
      counters.at(type).step()
    }
  }

  context {
    outline-colorbox(
      title: [#conv-type(type) #counters.at(type).display() #if (title == "") {} else [\- #title]],
      color: color,
      width: auto,
      radius: 5pt,
      centering:false,
    )[
      #content
    ]
  }
}

#let defi(title, content) = { item("defi", "green", title, content) }
#let prop(title, content) = { item("prop", "blue", title, content) }
#let coro(title, content) = { item("coro", "blue", title, content) }
#let lemm(title, content) = { item("lemm", "blue", title, content) }
#let theo(title, content) = { item("theo", "red", title, content) }
#let rema(title, content) = { item("rema", "yellow", title, content) }
#let exem(title, content) = { item("exem", "black", title, content) }

#let preu(content) = {
  block(breakable: false)[
    #underline[#text(weight: "bold", "Preuve :")]
    #block(
      width: 100%,
      outset: (left: -2pt, top: 6pt),
      inset: (left: 10pt, top: -2pt, bottom: 5pt),
      stroke: (left: 2pt + black),
      breakable: true,
    )[
      #content
    ]
  ]
}

#let quot(quote, author, expl) = {
  item(
    "quot",
    purple,
    "",
    [
      #align(center)[
        #block[
          #place(top + left, dy: -8pt, dx: -15pt, text(font: "FiraCode Nerd Font", size: 14pt, "\u{F10D}"))
          #text(weight: "bold", quote)
          #place(top + right, dy: 6pt, dx: 13pt, text(font: "FiraCode Nerd Font", size: 14pt, "\u{F10E}"))
        ]
        #v(3pt)
        #text(font: "FiraCode Nerd Font", style: "italic", "\u{F304}   " + author + "  \u{F304}")
        #v(6pt)
      ]
      #expl
    ],
  )
}
