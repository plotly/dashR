library(dasher)

# 'import' ComponentBlock() function
source("utils/component_block.R")

ui <- htmlDiv(

  coreMarkdown(
    "
# Dasher HTML Components

Dasher is a web application framework that provides pure R abstraction
around HTML, CSS, and JavaScript.

Instead of writing HTML or using an HTML templating engine, you compose your
layout using R with the `dashHtmlComponents` library.

The source for this library is on GitHub: [plotly/dash-html-components](https://github.com/plotly/dash-html-components).

Here is an example of a simple HTML structure:
"),

  coreSyntaxHighlighter(
    "htmlDiv(
  htmlH1('Hello Dash'),
  htmlDiv(
    htmlP('Dash converts Python classes into HTML'),
    htmlP('This conversion happens behind the scenes by Dash\'s JavaScript front-end')
  )
)", language = "r"
  ),
  htmlDiv("which gets converted (behind the scenes) into the following HTML in your web-app:"),
  coreSyntaxHighlighter(
    "<div>
  <h1>Hello</h1>
  <div>
    <p>Dash converts Python classes into HTML</p>
    <p>This conversion happens behind the scenes by Dash's JavaScript front-end</p>
  </div>
</div>", language = "html"
  ),

  coreMarkdown(
    "
If you're not comfortable with HTML, don't worry!
You can get 95% of the way there with just a few elements
and attributes.
Dash's [core component library](/dash/dash-core-components) also supports
[Markdown](http://commonmark.org/help)."
  ),

  ComponentBlock(
    ~coreMarkdown(
      '#### Dash and Markdown

    Dash supports [Markdown](http://commonmark.org/help).

    Markdown is a simple way to write and format text.
    It includes a syntax for things like **bold text** and *italics*,
    [links](http://commonmark.org/help), inline `code` snippets, lists,
    quotes, and more.'
    )
  ),

  coreMarkdown(
    "If you're using HTML components, then you also access to properties like
`style`, `class`, and `id`. All of these attributes are available as arguments.

The HTML elements and Dasher functions are mostly the same but there are
a few key differences:
    - The `style` property is a named list
- Properties in the `style` dictionary are camelCased
- The `class` key is renamed as `className`
- Style properties in pixel units can be supplied as just numbers without the `px` unit

Let's take a look at an example."
  ),

  coreSyntaxHighlighter(
    "
htmlDiv(
  style = list(marginBottom = 50, marginTop = 25),
  htmlDiv(
    style = list(color = 'blue', fontSize = 14),
    'Example Div'
  ),
  htmlP(
    className = 'my-class',
    id = 'my-p-element',
    'Example P'
  )
)"),

  htmlDiv('That dash code will render this HTML markup:'),

  coreSyntaxHighlighter(
    '
<div style="margin-bottom: 50px; margin-top: 25px;">

  <div style="color: blue; font-size: 14px">
    Example Div
  </div>

  <p class="my-class", id="my-p-element">
    Example P
  </p>

</div>',
    language = 'html'
  )
)



app <- Dash$new()
app$layout_set(ui)
app

