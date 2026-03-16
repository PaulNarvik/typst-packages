#import "./example.typ": *
#import "./default.typ": *

#import "@preview/touying:0.6.3": *
#import themes.metropolis: *

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
  all_num: default_all_num,
) = {
  show: metropolis-theme.with(
    aspect-ratio: "4-3",
    footer: self => self.info.institution,
    config-info(
      title: title,
      subtitle: subtitle,
      author: author,
      institution: footer.at(0),
    ),
  )
 
  doc

  [#metadata(all_num) <all_num>]
} 
