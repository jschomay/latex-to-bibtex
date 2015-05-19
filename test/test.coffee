{expect} = require "chai"

{latexToArray} = require "../parse"

describe "latexToArray", ->

  it "changes latex to an array", ->
    file = latexToArray "test/sample.tex", "bibitem"
    expect(file).to.be.an "Array"
    expect(file).to.have.length 3
    expect(file[0]).to.have.length.gt 100
    expect(file[0]).to.match /^{/
