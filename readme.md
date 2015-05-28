Custom Latex to Bibtex converter
================================

Customizable parser intended to generate bibtex files from latex files based on loaded-in parsing and formatting rules.

By supplying your own parsing rules, formatting rules, and template, this parser could be used for other purposes as well.

Usage
-----

Please see `example.coffee` and supporting files in the `example/` directory for full usage, and to use as a template for your own custom rules/template.

```coffeescript
latextToBibtex = require "latex-to-bibtex"

config =
  inputFile: path.join(__dirname, "/sample.tex")
  itemTag: "bibitem"
  parseRules: parseRules
  formattingRules: formattingRules
  sortProp: "tag"
  template: template

parsed = latextToBibtex config
# write parsed out to file system
```

Example input:

```latex
\bibitem{Acar2009}
Acar E, Yener B, ``Unsupervised multiway data analysis: a literature survey,'' {\em IEEE Trans Knowl Data Engin} \underline{21}, 6--20 (2009).
```

Example output:

```bibtex
@Article{OA:Acar2009,
  year =         "2009",
  month =        jan,
  publisher =    "Institute of Electrical {\&} Electronics Engineers ({IEEE})",
  volume =       "21",
  number =       "1",
  pages =        "6--20",
  author =       "E. Acar and B. Yener",
  title =        "Unsupervised Multiway Data Analysis: {A} Literature Survey",
  journal =      "{IEEE} Transactions on Knowledge and Data Engineering",
}
```
