#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"
#import cetz: canvas, draw, vector

#let inv_head(body) = {
  counter(heading).update(0)
  heading(body, outlined: false, numbering: none)
  counter(heading).update(0)
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

#counter("defi")
#counter("prop")
#counter("coro")
#counter("lemm")
#counter("theo")
#counter("rema")
#counter("exem")

#let conv-type(type) = {
  (
    (type == "defi", "Définition"),
    (type == "prop", "Proposition"),
    (type == "coro", "Corollaire"),
    (type == "lemm", "Lemme"),
    (type == "theo", "Théorème"),
    (type == "rema", "Remarque"),
    (type == "exem", "Exemple"),
  )
    .find(t => t.at(0))
    .at(1)
}

#let item(type, title, content) = {
  counter(type).step()


  text(weight: "bold")[#conv-type(type) #context counter(type).display() #if title == "" {} else [(#title)]]

  block(
    width: 100%,
    outset: (left: -2pt),
    inset: (left: 10pt, top: 5pt, bottom: 8pt),
    above: 5pt,
    stroke: (left: 2pt + black),
  )[
    #content
  ]
}

#let def(title: "", content: "") = {
  item("defi", title: title, content: content)
}
#let prop(title: "", content: "") = {
  item("prop", title: title, content: content)
}
#let coro(title: "", content: "") = {
  item("coro", title: title, content: content)
}
#let lemm(title: "", content: "") = {
  item("lemm", title: title, content: content)
}
#let theo(title: "", content: "") = {
  item("theo", title: title, content: content)
}
#let rem(title: "", content: "") = {
  item("rema", title: title, content: content)
}
#let exem(title: "", content: "") = {
  item("exem", title: title, content: content)
}