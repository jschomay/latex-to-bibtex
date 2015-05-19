{expect} = require "chai"

{latexToArray
  parseLatexItem
  parseLatexArray
  formatParsedItem
  formatParsedArray
  renderItemToTemplate
  renderArrayToTemplate
} = require "../parse"

parseRules = require "../parseRules"
formattingRules = require "../formattingrules"
template = require "../template"

latexArray = latexToArray "test/sample.tex", "bibitem"

describe "latexToArray", ->

  it "changes latex to an array", ->
    expect(latexArray).to.be.an "Array"
    expect(latexArray).to.have.length 3
    expect(latexArray[0]).to.be.a "String"
    expect(latexArray[0]).to.have.length.gt 100
    expect(latexArray[0]).to.match /^{/

describe "parseLatexItem", ->

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
      expect(latexObject).to.have.property "title", "Unsupervised multiway data analysis: A literature survey"

    it "journal", ->
      expect(latexObject).to.have.property "journal", "IEEE Trans Knowl Data Engin"

describe "parseLatexArray", ->

  it "maps the raw latex array items to parsed objects", ->

    parsedLatex = parseLatexArray(parseRules, latexArray)

    expect(parsedLatex).to.be.an "Array"
    expect(parsedLatex).to.have.length 3
    expect(parsedLatex[0]).to.have.property "year"
    expect(parsedLatex[1]).to.have.property "year"
    expect(parsedLatex[2]).to.have.property "year"


describe "formatParsedItem", ->

  parsedItem = parseLatexItem(parseRules, latexArray[0])
  formattedItem = formatParsedItem(formattingRules, parsedItem)

  it "returns an object", ->

    expect(formattedItem).to.be.an "Object"

  describe "with modified properties based on formatRules", ->

    it "tag", ->
      expect(formattedItem).to.have.property "tag", "Aca2009"

    it "year", ->
      expect(formattedItem).to.have.property "year", "2009"

    it.skip "publisher", ->
      expect(formattedItem).to.have.property "publisher", "todo"

    it "volume", ->
      expect(formattedItem).to.have.property "volume", "21"

    it.skip "number", ->
      expect(formattedItem).to.have.property "number", "1"

    it "pages", ->
      expect(formattedItem).to.have.property "pages", "6--20"

    it "author", ->
      expect(formattedItem).to.have.property "author", "E. Acar and B. Yener"

    it "title", ->
      expect(formattedItem).to.have.property "title", "Unsupervised Multiway Data Analysis: {A} Literature Survey"

    it "journal", ->
      expect(formattedItem).to.have.property "journal", "{IEEE} Trans Knowl Data Engin"

describe "formatParsedArray", ->

  it "formats each item in the parsed array", ->
    parsedLatex = parseLatexArray(parseRules, latexArray)
    formattedAndParsedObject = formatParsedArray formattingRules, parsedLatex
    expect(formattedAndParsedObject).to.be.an "Array"
    expect(formattedAndParsedObject).to.have.length 3
    expect(formattedAndParsedObject[0]).to.have.property "tag", "Aca2009"
    expect(formattedAndParsedObject[1]).to.have.property "tag", "Agr2014"
    expect(formattedAndParsedObject[2]).to.have.property "tag", "Alb2003"


describe "renderItemToTemplate", ->

  it "passes the data into the template", ->
    parsedLatex = parseLatexArray(parseRules, latexArray)
    formattedAndParsedObject = formatParsedArray formattingRules, parsedLatex

    rendered = renderItemToTemplate template, formattedAndParsedObject[0]

    expected =
      """
      @Article{OA:Aca2009,
        year =         "2009",
        month =        "undefined",
        publisher =    "undefined",
        volume =       "21",
        number =       "undefined",
        pages =        "6--20",
        author =       "E. Acar and B. Yener",
        title =        "Unsupervised Multiway Data Analysis: {A} Literature Survey",
        journal =      "{IEEE} Trans Knowl Data Engin",
      }
      """

    expect(rendered).to.equal expected

describe "renderArrayToTemplate", ->

  it "renders all items in array to a single string", ->
    parsedLatex = parseLatexArray(parseRules, latexArray)
    formattedAndParsedObject = formatParsedArray formattingRules, parsedLatex

    rendered = renderArrayToTemplate template, formattedAndParsedObject

    expect(rendered).to.be.a "String"
    expect(rendered.split("\n\n")).to.have.length 3
    expect(rendered.split("\n")).to.have.length.gte 35
