R = require "ramda"

{latexToArray
  parseLatexItem
  parseLatexArray
  formatParsedItem
  formatParsedArray
  renderItemToTemplate
  renderArrayToTemplate
  sortBy
} = require "./parse"

module.exports = ({inputFile, itemTag, parseRules, formattingRules, template, sortProp}) ->
  R.compose(
    R.partial(renderArrayToTemplate, template)
    R.partial(sortBy, sortProp)
    R.partial(formatParsedArray, formattingRules)
    R.partial(parseLatexArray, parseRules)
    R.partial(latexToArray, inputFile, itemTag)
  )()
