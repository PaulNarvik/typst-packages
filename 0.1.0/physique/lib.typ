#import "utils.typ": *
#import "elec.typ"

#let def(x) = underline([*#x*])
#let ov = math.overline
#let arw(x) = math.accent(x, math.arrow)

#let half_mark = (end: "straight", pos: -63%)

#let resultb(c) = align(center, (box(c, inset: 0.7em, stroke: rgb("#ee3050"))))
#let titleb(c, show_outline: true) = {
	set document(title: c)
	align(center, box(text(c, size: 2em), inset: 1em, stroke: black))
	if show_outline {
		outline(title: none, depth: 1)
	}
}

#let infobox(symbol: none, info_text: "", color: black) = c => [
	#pad(left: 2em, box(stroke: color, width: 80%, inset: 10pt, [
		#text(fill: color, [#symbol #info_text]) \ 
		#c
	]))
	#parbreak()
]

#let note = infobox(symbol: $Phi$, info_text: "Note:", color: blue)
#let tip = infobox(symbol: $checkmark$, info_text: "Tip:", color: green)
#let caution = infobox(symbol: $excl.double$, info_text: "Caution:", color: red)
#let warn = infobox(symbol: $minus.triangle$, info_text: "Warn:", color: orange)
#let todo = infobox(symbol: $supset.double$, info_text: text(fill: teal)[TODO:], color: teal)
#let hp = infobox(symbol: $alpha$, color: yellow, info_text: text(fill: yellow)[
	Hors-programme:
])

#let parachute = infobox(symbol: "🪂", color: navy, info_text: text(fill: navy)[Parachutage: ])

#let tation = infobox(symbol: "🗣️", color: maroon, info_text: text(fill: maroon)[Citation: ])

#let principe = infobox(symbol: $phi.alt$, color: gradient.linear(..color.map.turbo), info_text: smallcaps[Principe: ])

#let theorem = infobox(symbol: $Theta$, color: gradient.linear(..color.map.rainbow), info_text: smallcaps[Théorème: ])

#let gridpat = tiling(size: (10pt, 10pt))[
	#place(line(start: (0%, 0%), end: (100%, 100%)))
	#place(line(start: (0%, 100%), end: (100%, 0%)))
]

// Sir Lanceléthanol le best <3 -U
