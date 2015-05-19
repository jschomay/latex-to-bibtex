Latex to Bibtex converter
=========================

Somewhat generalised parser that builds bibtex files from latex files based on loaded in parsing rules.

Converts something like this:

```latex
\bibitem{Acar2009}
Acar E, Yener B, ``Unsupervised multiway data analysis: a literature survey,'' {\em IEEE Trans Knowl Data Engin} \underline{21}, 6--20 (2009).
``

Into this:

```bibtex
@Article{OA:Aca2009,
  year =         "2009",
  month =        jan,
  publisher =    "Institute of Electrical {\&} Electronics Engineers
                 ({IEEE})",
  volume =       "21",
  number =       "1",
  pages =        "6--20",
  author =       "E. Acar and B. Yener",
  title =        "Unsupervised Multiway Data Analysis: {A} Literature
                 Survey",
  journal =      "{IEEE} Transactions on Knowledge and Data
                 Engineering",
}
```
