{expect} = require "chai"

{latexToArray, parseLatexItem} = require "../parse"

latexArray = latexToArray "test/sample.tex", "bibitem"

describe "latexToArray", ->

  it "changes latex to an array", ->
    expect(latexArray).to.be.an "Array"
    expect(latexArray).to.have.length 3
    expect(latexArray[0]).to.have.length.gt 100
    expect(latexArray[0]).to.match /^{/

describe "parseLatexItem", ->

  latexObject = parseLatexItem(latexArray[0])

  it "generates an object", ->
    expect(latexObject).to.be.an "Object"

  describe "with properties", ->

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
