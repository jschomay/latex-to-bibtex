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
    parseObject[rule.property] = latexItem.match(rule.matcher)?[rule.matchGroup or 0]
    parseObject

  R.reduce buildParsedObject, {}, parsingRules


parseLatexArray = (parsingRules, latexArray) ->
  R.map(R.partial(parseLatexItem, parsingRules)) latexArray

module.exports = {
  latexToArray
  parseLatexItem
  parseLatexArray
}
