# Installation

- Pour Windows, cloner le repository dans `C:\Users\User\AppData\Local\typst\packages\local\`

- Pour Linux, cloner le repository dans `~/.local/share/typst/packages/local/`

# Configuration

Pensez à créer le fichier `default.typ` en mettant vos informations plutôt que les miennes. Un exemple est fourni dans `example.typ`

# Utilisation 

Pour utiliser le template, mettre `#show: doc => template(doc, vos arguments non par défaut)` dans votre fichier Typst 

Les arguments sont :

- `doc` le contenu du document, obligatoire pour avoir un rendu
- `title` le titre du document
- `subtitle` le sous-titre du document
- `author` l'auteur principal du document (*)
- `collaborators` des collaborateurs éventuels (*)
- `show_outline` présence ou non d'un sommaire (*)
- `outline_depth` la profondeur maximale à laquelle le sommaire affiche les titres (*)
- `footer` le contenu du pied de page (*)
- `subtitle_header` si le sous-titre doit apparaître en haut de page (*)
- `all_num` numérotation commune pour les définitions, lemmes, propositions, etc (*)

Les arguments marqués d'une étoile doivent apparaître dans le `default.typ`