module.exports = (data) ->
  """
  @Article{OA:Aca2009,
    year =         "#{data.year}",
    month =        "#{data.month}",
    publisher =    "#{data.publisher}",
    volume =       "#{data.volume}",
    number =       "#{data.number}",
    pages =        "#{data.pages}",
    author =       "#{data.author}",
    title =        "#{data.title}",
    journal =      "#{data.journal}",
  }
  """
