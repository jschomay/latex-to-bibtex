R = require "ramda"

authorFormatter = (value) ->
  return if not value
  formatName = (name) ->
    nameParts = name.split(" ")
    abbrv = (value) ->
      value?.split("").join(". ") + ". "
    first = abbrv nameParts[1]
    first + nameParts[0]
  authors = value.split(", ")
  authors = R.map formatName, authors
  authors.join(" and ")

titleFormatter = (value) ->
  return if not value
  formatWords = (word) ->
    if (/[A-Z]/.test word.slice(1)) or (word.length < 2)
      word = "{" + word + "}"
    if word not in ["in", "of", "a", "the", "it", "on", "if", "to", "be", "with", "and", "but", "that", "an", "are", "will", "have"]
      word.slice(0, 1).toUpperCase() + word.slice(1)
    else
      word
  words = value.split(" ")
  words = R.map formatWords, words
  words.join(" ")


module.exports = [
  prop: "author"
  format: authorFormatter
,
  prop: "title"
  format: titleFormatter
,
  prop: "journal"
  format: titleFormatter
]

