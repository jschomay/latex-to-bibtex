R = require "ramda"
titleCase = require "titlecase"

authorFormatter = (value) ->
    formatName = (name) ->
      nameParts = name.split(" ")
      abbrv = (value) ->
        value.split().join(". ") + ". "
      first = R.map abbrv, nameParts[1]
      first + nameParts[0]
    authors = value.split(", ")
    authors = R.map formatName, authors
    authors.join(" and ")

titleFormatter = (value) ->
  formatWords = (word) ->
    if (/[A-Z]/.test word.slice(1)) or (word.length < 2)
      word = "{" + word + "}"
    # if word not in ["in", "of", "a", "the", "it", "on", "if", "to", "be", "with", "and", "but", "that", "an", "are", "will", "have"]
    #   word.slice(0, 1).toUpperCase() + word.slice(1)
    # else
    #   word
    titleCase.toLaxTitleCase word
  return if not value
  words = value.split(" ")
  words = R.map formatWords, words
  words.join(" ")


module.exports = [
  prop: "tag"
  format: (value) ->
    value.slice(0,3) + value.slice(-4)
,
  prop: "author"
  format: authorFormatter
,
  prop: "title"
  format: titleFormatter
,
  prop: "journal"
  format: titleFormatter
]

