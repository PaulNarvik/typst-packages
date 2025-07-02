#let template(doc, author: "Paul Chaudagne", title: "") = {
    set text(lang: "fr")

    set document(author: author, title: title)

    set par(
        justify: true,
		spacing: 1em
    )

    set page(
        footer: context [
            #set text(8pt)
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
        ],

        header: context [
            #set text(8pt)
            #grid(
                columns: (1fr, 1fr),
                align: (left, right),
                smallcaps(document.title),
                smallcaps(document.author.join(""))
            )
            #align(center, line(length: 100%, stroke: 1pt + black))
        ]
    )

    set heading(numbering: "1.")

    let header_counter(level) = context {
        counter(heading).display((..nums) => {
            let c = nums.pos().last()
            if level == 1 { numbering("I -", c) }
            else if level == 2 { numbering("1)", c) }
            else if level == 3 { numbering("a.", c) }
            else { numbering("(i)", c) }
        })
    }

    show heading: it => {
        par()[
            #header_counter(it.level)
            #it.body
        ]
    }

    show heading.where(level: 1): it => {
		v(0.5em)
        set text(18pt, font: "Leckerli One")
        it
        counter(math.equation).update(0) // reset equation counter for each chapter
        
    }

    show heading.where(level: 2): it => {
        stack(
            spacing: 0.32em,
            it,
            align(center, line(length: 100%, stroke: (paint: gray, thickness: 0.8pt)))
        )
    }	

    set math.equation(numbering: "(1)", supplement: [])

    set math.equation(
        numbering: it => {
            let count = counter(heading.where(level: 1)).at(here()).first()
                if count >0 {
                    numbering("(1.1)", count, it)
            } else {
               numbering("(1)",it)
            }
        }
    )

    show math.equation: it => {
        math.display(it)
    }

    doc
}
