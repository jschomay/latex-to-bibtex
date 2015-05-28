fs = require "fs"
path = require "path"

latextToBibtex = require "../index"

parseRules = require "./parseRules"
formattingRules = require "./formattingrules"
template = require "./template"


config =
  inputFile: path.join(__dirname, "/sample.tex")
  itemTag: "bibitem"
  parseRules: parseRules
  formattingRules: formattingRules
  sortProp: "tag"
  template: template

parsed = latextToBibtex config

fs.writeFile path.join(__dirname, "/parsed-output.bib"), parsed, (err) ->
  if err
    throw err

  console.log "File written to \"example/parsed-output.bib\""
