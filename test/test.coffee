{expect} = require "chai"

{latexToArray, parseLatexItem, parseLatexArray} = require "../parse"

latexArray = latexToArray "test/sample.tex", "bibitem"

describe "latexToArray", ->

  it "changes latex to an array", ->
    expect(latexArray).to.be.an "Array"
    expect(latexArray).to.have.length 3
    expect(latexArray[0]).to.have.length.gt 100
    expect(latexArray[0]).to.match /^{/

describe "parseLatexItem", ->

  parseRules = [
    property: "tag"
    matcher: /^\{(\w+\d+)\}/
    matchGroup: 1
  ,
    property: "year"
    matcher: /\((\d*)\)/
    matchGroup: 1
  ]

  latexObject = parseLatexItem(parseRules, latexArray[0])

  it "generates an object", ->
    expect(latexObject).to.be.an "Object"

  describe "with properties derived from parseRules:", ->

    it "tag", ->
      expect(latexObject).to.have.property "tag", "Acar2009"

    it "year", ->
      expect(latexObject).to.have.property "year", "2009"

###
  year
  month
  publisher
  volume
  number
  pages
  author
  title
  journal
###
