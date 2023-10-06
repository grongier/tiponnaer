# tiponnaer

 > tiponnaer (se): se pomponner en normand

tiponnaer is a LaTeX class to give scientific articles a nice formatting (at least according to its author's taste) using either pdfTeX or LuaTeX. It is based on the [Koma-Script *article* class](https://ctan.org/pkg/scrartcl?lang=en) and can use the same options. An extra option specific to tiponnaer is *style*, which can take the following values:
 * transitional (default), which uses a Charter-like body font and a Franklin-like title font.
 * oldstyle, which uses a Palatino-like body font and a Bookman-like or Century Schoolbook-like title font.
 * traditional, which uses a Garamond-like body font and a Franklin-like title font.
 * magazine (only available with LuaTeX), which uses a Caslon-like body font and a Franklin-like title font.

 To use any of those styles, simply add it to the options when setting the document class, for instance `\documentclass[traditional]{tiponnaer}`.

 tiponnaer also defines a set of commands to add highlights, abstract, keywords, journal, volume, number, pages, year, and DOI. Three extra commands are:
  * `\License{...}` to explicitly mention the document's license.
  * `\Disclaimer` to add a disclaimer if the document hasn't been peer-reviewed (if it's a preprint for instance).
  * `\FullText{...}` to add a link to a freely available, full-text version of the document.

You'll find two examples showing how to use tiponnaer:
 * [example_article](example_article.tex) shows how to format an article published in a journal and mention that the document has a CC BY license.
 * [example_abstract](example_abstract.tex) shows how to format an abstract for an article published in a journal. It also shows how to switch to a single-column format (default is two columns).
