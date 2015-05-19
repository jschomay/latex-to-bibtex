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
  ,
    property: "publisher"
    matcher: /todo/
    matchGroup: null
  ,
    property: "volume"
    matcher: /\\underline\{(\d+)\}/
    matchGroup: 1
  ,
    property: "number"
    matcher: /todo/
    matchGroup: null
  ,
    property: "pages"
    matcher: /\d+--\d+/
    matchGroup: null
  ,
    property: "author"
    matcher: /}(.+),\s*``/
    matchGroup: 1
  ,
    property: "title"
    matcher: /``(.+),''/
    matchGroup: 1
  ,
    property: "journal"
    matcher: /\{\\em\s([^}]+)\}/
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

    it.skip "publisher", ->
      expect(latexObject).to.have.property "publisher", "todo"

    it "volume", ->
      expect(latexObject).to.have.property "volume", "21"

    it.skip "number", ->
      expect(latexObject).to.have.property "number", "1"

    it "pages", ->
      expect(latexObject).to.have.property "pages", "6--20"

    it "author", ->
      expect(latexObject).to.have.property "author", "Acar E, Yener B"

    it "title", ->
      expect(latexObject).to.have.property "title", "Unsupervised multiway data analysis: a literature survey"

    it "journal", ->
      expect(latexObject).to.have.property "journal", "IEEE Trans Knowl Data Engin"

