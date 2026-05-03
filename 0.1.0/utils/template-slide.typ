#import "./example.typ": *
#import "./default.typ": *

#import "@local/touying-simpl-swufe:0.2.0": *

#let template-slide(
  doc,
  title: "",
  subtitle: "",
  author: default_author,
  collaborators: default_collaborators,
  show_outline: default_show_outline,
  outline_depth: default_outline_depth,
  footer: default_footer,
  subtitle_header: default_subtitle_header,
) = {
  show: swufe-theme.with(
    aspect-ratio: "4-3",
    lang: "fr",
    footer: self => self.info.institution,
    config-info(
      title: title,
      subtitle: subtitle,
      author: author,
      institution: footer.at(0),
      banner: image("knight-2.jpg")
    ),
    config-colors(
      primary: rgb(1, 83, 139),
      primary-dark: rgb(0, 42, 70),
      secondary: rgb(255, 255, 255),
      neutral-lightest: rgb(255, 255, 255),
      neutral-darkest: rgb(0, 0, 0),
    ),
  )

 
  doc
} 
