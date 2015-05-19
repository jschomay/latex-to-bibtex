fs = require 'fs'

latexToArray = (fileName, tagToSplitOn) ->
  latex = fs.readFileSync(fileName)
  latex
    .toString()
    .replace(/\n/g, "")
    .split("\\#{tagToSplitOn}")
    .slice 1

parseLatexItem = (latexItem) ->
  year: latexItem.match(/\((\d*)\)/)[1]

module.exports = {
  latexToArray
  parseLatexItem
}
