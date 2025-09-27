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

// Déclarer les compteurs dans un dictionnaire
#let counters = (
  defi: counter("defi"),
  prop: counter("prop"),
  coro: counter("coro"),
  lemm: counter("lemm"),
  theo: counter("theo"),
  rema: counter("rema"),
  exem: counter("exem"),
)

// Fonction pour convertir le type en nom lisible
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

#let lighten-color(color, diff: 80%) = {
  color.transparentize(diff)
}

// Fonction générique pour créer un élément avec label automatique
#let item(type, color, title, content) = {
  if type not in counters {
    text(fill: red)[Erreur : Type #type inconnu]
    return
  }

  // Incrémenter le compteur
  counters.at(type).step()

  // Contenu avec barre verticale
  block(
    width: 100%,
    outset: (left: -2pt, top: 2pt, right: 0pt),
    inset: (left: 10pt, top: 5pt, bottom: 8pt, right: 10pt),
    stroke: (
      left: 3pt + color,
      right: 1pt + color,
      top: 1pt + color,
      bottom: 1pt + color,
    ),
    fill: lighten-color(color),
    radius: 5pt,
  )[

    // Récupérer le numéro du compteur dans un contexte
    #context {
      text(weight: "bold", [
        #underline()[
          #conv-type(type) #counters.at(type).display() #if title == "" {} else [(#title)] :
        ]
      ])
      linebreak()
    }
    #content
  ]
}

// Fonctions spécifiques pour chaque type
#let defi(title, content) = { item("defi", blue, title, content) }
#let prop(title, content) = { item("prop", green, title, content) }
#let coro(title, content) = { item("coro", green, title, content) }
#let lemm(title, content) = { item("lemm", green, title, content) }
#let theo(title, content) = { item("theo", red, title, content) }
#let rema(title, content) = { item("rema", yellow, title, content) }
#let exem(title, content) = { item("exem", black, title, content) }

#let preu(content) = {
  text(weight: "bold", "Preuve :")
  block(
    width: 100%,
    outset: (left: -2pt, top: 5pt),
    inset: (left: 10pt, top: 5pt, bottom: 8pt),
    stroke: (left: 2pt + black),
  )[
    #content
  ]
}

#theo("Test", "J'ai perdu \n ddd Uwu\n xD")
#defi("Toto", "Coubeh")
