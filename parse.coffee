fs = require "fs"
R = require "ramda"

latexToArray = (fileName, tagToSplitOn) ->
  latex = fs.readFileSync(fileName)
  latex
    .toString()
    .replace(/\n/g, "")
    .split("\\#{tagToSplitOn}")
    .slice 1


parseLatexItem = (parsingRules, latexItem) ->
  buildParsedObject = (parseObject, rule) ->
    parseObject[rule.property] = latexItem.match(rule.matcher)[rule.matchGroup]
    parseObject

  R.reduce buildParsedObject, {}, parsingRules


parseLatexArray = () ->
module.exports = {
  latexToArray
  parseLatexItem
  parseLatexArray
}
