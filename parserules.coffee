module.exports = [
  prop: "tag"
  matcher: /^\{(\w+\d+)\}/
  matchGroup: 1
,
  prop: "year"
  matcher: /\((\d*)\)/
  matchGroup: 1
,
  prop: "publisher"
  matcher: /todo/
  matchGroup: null
,
  prop: "volume"
  matcher: /\\underline\{(\d+)\}/
  matchGroup: 1
,
  prop: "number"
  matcher: /todo/
  matchGroup: null
,
  prop: "pages"
  matcher: /\d+--\d+/
  matchGroup: null
,
  prop: "author"
  matcher: /}(.+),\s*``/
  matchGroup: 1
,
  prop: "title"
  matcher: /``(.+),''/
  matchGroup: 1
,
  prop: "journal"
  matcher: /\{\\em\s([^}]+)\}/
  matchGroup: 1
]
