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
    parseObject[rule.prop] = latexItem.match(rule.matcher)?[rule.matchGroup or 0]
    parseObject

  R.reduce buildParsedObject, {}, parsingRules


parseLatexArray = (parsingRules, latexArray) ->
  R.map(R.partial(parseLatexItem, parsingRules)) latexArray


formatParsedItem = (formattingRules, parsedItem) ->
  format = (formatted, item) ->
    formatted[item.prop] = item.format parsedItem[item.prop]
    formatted

  formattedObject = R.reduce format, {}, formattingRules

  R.merge parsedItem, formattedObject


formatParsedArray = (formattingRules, parsedObject) ->
  R.map(R.partial(formatParsedItem, formattingRules)) parsedObject


renderItemToTemplate = (template, data) ->
  template data

renderArrayToTemplate = (template, array) ->
  renderedArray = R.map(R.partial(renderItemToTemplate, template)) array
  renderedArray.join("\n\n")

module.exports = {
  latexToArray
  parseLatexItem
  parseLatexArray
  formatParsedItem
  formatParsedArray
  renderItemToTemplate
  renderArrayToTemplate
}
