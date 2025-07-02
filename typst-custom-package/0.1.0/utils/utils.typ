#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"
#import cetz: draw, canvas, vector

#let head(show_outline: true, outline_depth: 1) = {
  context [
      #align(center, box(text(document.title, size: 2em), inset: 1em, stroke: black))
  ]

  v(1em)
  
  if show_outline {
    outline(title: none, depth: outline_depth, indent: auto, target: heading.where())
    v(1em)
    pagebreak()
  }
}

#let inv_head(body, num: 0) = {
  counter(heading).update(num)
  heading(body, outlined: false, numbering: none)
  counter(heading).update(0)
}

#let und(x) = math.underline($#x$)
#let Tilde(it) = math.accent(it, math.tilde, size: 1.2em)
#let Vect(it) = math.accent(it, math.arrow)
#let D1(it) = math.accent(it, math.dot)
#let D2(it) = math.accent(it, math.dot.double)

#let result(c) = align(center, (box(c, inset: 1em, stroke: 1.5pt +  rgb("#ff2929"))))
#let todo(c) = align(center, (box(c, inset: 1em, stroke: 2pt + rgb("#3344e2"))))

#let figcan(body, caption: none) = {
  figure(caption: caption, canvas(body))
}

#let eq = math.arrow.l.r.double.long;

#let lim = $stretch(limits(-->))$