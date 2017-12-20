library(dasher)

# 'import' ComponentBlock() function
source("utils/component_block.R")

ui <- htmlDiv(
  className = "gallery",
  htmlH1('Dash Core Components'),

  coreMarkdown(
    "
Dasher ships with supercharged components for interactive user interfaces.
A core set of components, written and maintained by the Dash team,
is available in the `dash-core-components` library.
The source is on GitHub at [plotly/dash-core-components](https://github.com/plotly/dash-core-components).
"
  ),
  ComponentBlock(~ as.character(packageVersion("dashCoreComponents"))),

  htmlBr(),
  htmlH3(coreLink('Dropdown', href = '/dasher/dash-core-components/dropdown')),
  ComponentBlock(
    ~coreDropdown(
      options = c(
        'New York City' = 'NYC',
        'Montréal' = 'MTL',
        'San Francisco' = 'SF'
      ),
      value = "MTL"
    )
  ),

  coreLink(
    htmlA('More Dropdown Examples and Reference'),
    href = "/dasher/dash-core-components/dropdown"
  ),

  htmlHr(),

  htmlH3(
    coreLink('Slider', href = '/dasher/dash-core-components/slider')
  ),
  ComponentBlock(
    ~coreSlider(
      min = -5,
      max = 10,
      step = 0.5,
      value = -3
    )
  ),

  ComponentBlock(
    ~coreSlider(
      min = 0,
      max = 9,
      marks = setNames(0:9, paste("Label", 0:9)),
      value = 5
    )
  ),

  htmlHr(),
  coreLink(
    htmlA('More Slider Examples and Reference'),
    href = "/dasher/dash-core-components/slider"),

  htmlHr(),

  htmlH3(coreLink('RangeSlider', href = '/dasher/dash-core-components/rangeslider')),
  ComponentBlock(
    ~coreRangeSlider(
      count = 1,
      min = -5,
      max = 10,
      step = 0.5,
      value = c(-3, 7)
    )
  ),

  ComponentBlock(
    ~coreRangeSlider(
      marks = setNames(-5:6, paste("Label", -5:6)),
      min = -5,
      max = 6,
      value = c(-3, 4)
    )
  ),

  htmlHr(),
  coreLink(htmlA('More RangeSlider Examples and Reference'),
           href = "/dasher/dash-core-components/rangeslider"),

  htmlHr(),

  htmlH3(coreLink('Input', href = '/dasher/dash-core-components/input')),
  ComponentBlock(
    ~coreInput(
      placeholder = 'Enter a value...',
      type = 'text',
      value = ''
    )
  ),

  htmlHr(),
  coreLink(htmlA('Input Reference'),
           href = "/dasher/dash-core-components/input"),

  htmlHr(),

  htmlH3(coreLink('Textarea', href = '/dasher/dash-core-components/textarea')),
  ComponentBlock(
    ~coreTextarea(
      placeholder = 'Enter a value...',
      value = 'This is a TextArea component',
      style = list(width = '100%')
    )
  ),

  htmlHr(),
  coreLink(htmlA('Textarea Reference'),
           href = "/dasher/dash-core-components/textarea"),

  htmlHr(),

  htmlH3(coreLink('Checkboxes', href = '/dasher/dash-core-components/checklist')),
  ComponentBlock(
    ~coreChecklist(
      options = c(
        'New York City' = 'NYC',
        'Montréal' = 'MTL',
        'San Francisco' = 'SF'
      )
      values = c('MTL', 'SF')
    )
  ),

  ComponentBlock(
    ~coreChecklist(
      options = c(
        'New York City' = 'NYC',
        'Montréal' = 'MTL',
        'San Francisco' = 'SF'
      ),
      values = c('MTL', 'SF'),
      labelStyle = list(display = 'inline-block')
    )
  ),

  htmlHr(),
  coreLink(htmlA('Checklist Properties'),
           href = "/dasher/dash-core-components/checklist"),
  htmlHr(),
  htmlH3(coreLink('Radio Items', href = '/dasher/dash-core-components/radioitems')),
  ComponentBlock(
    ~coreRadioItems(
      options = c(
        'New York City' = 'NYC',
        'Montréal' = 'MTL',
        'San Francisco' = 'SF'
      ),
      value = 'MTL'
    )
  ),

  ComponentBlock(
    ~coreRadioItems(
      options = c(
        'New York City' = 'NYC',
        'Montréal' = 'MTL',
        'San Francisco' = 'SF'
      ),
      value = 'MTL',
      labelStyle = list(display = 'inline-block')
    )
  ),
  htmlHr(),
  coreLink(htmlA('RadioItems Reference'),
           href = "/dasher/dash-core-components/radioitems"),

  htmlHr(),

  htmlH3("Button"),


  #coreSyntaxHighlighter(
  #  examples['button'][0],
  #  customStyle = styles.code_container, language = 'python'
  #),
  #htmlDiv(examples['button'][1], className = 'example-container'),

  htmlA(
    "For more on `state()`, see the tutorial on ",
    coreLink('Dasher State', href = '/dasher/state'),
    '.'
  ),

  htmlHr(),

  htmlH3(coreLink('DatePickerSingle', href = '/dasher/dash-core-components/datepickersingle')),
  ComponentBlock(
    ~coreDatePickerSingle(
      id = 'date-picker-single',
      date = lubridate::ymd("1997-05-10")
    )
  ),
  coreLink(htmlA('More DatePickerSingle Examples and Reference'),
           href = "/dasher/dash-core-components/datepickersingle"),
  htmlHr(),

  htmlH3(coreLink('DatePickerRange', href = '/dasher/dash-core-components/datepickerrange')),
  ComponentBlock(
    ~coreDatePickerRange(
      id = 'date-picker-range',
      start_date = lubridate::ymd("1997-05-03"),
      end_date_placeholder_text = 'Select a date!'
    )
  ),
  htmlHr(),
  coreLink(htmlA('More DatePickerRange Examples and Reference'),
           href = "/dasher/dash-core-components/datepickerrange"),

  htmlHr(),

  htmlH3(coreLink('Markdown', href = '/dasher/dash-core-components/markdown')),
  ComponentBlock(
    ~coreMarkdown("
#### Dash and Markdown

Dash supports [Markdown](http://commonmark.org/help).

Markdown is a simple way to write and format text.
It includes a syntax for things like **bold text** and *italics*,
[links](http://commonmark.org/help), inline `code` snippets, lists,
quotes, and more."
    )
  ),

  htmlHr(),
  coreLink(htmlA('More Markdown Examples and Reference'),
           href = "/dasher/dash-core-components/markdown"),

  htmlHr(),

  htmlH3('Interactive Tables'),
  coreMarkdown(
    "
               The `dash_html_components` library exposes all of the html tags.
               This includes the `Table`, `Tr`, and `Tbody` tags that can be used
               to create an html table. See
               [Create Your First Dash App, Part 1](https://plot.ly/dasher/getting-started-part-1)
               for an example.

               Dash is currently incubating an interactive table component that provides
               built-in filtering, row-selection, editing, and sorting.
               Prototypes of this component are being developed in the
               [`dash-table-experiments`](https://github.com/plotly/dash-table-experiments)
               repository. Join the discussion in the
               [Dash Community Forum](https://community.plot.ly/t/display-tables-in-dash/4707/38)."
  ),

  htmlA(
    className = "image-link",
    href = "https://github.com/plotly/dash-table-experiments",
    children = htmlImg(
      src = "https://github.com/plotly/dash-table-experiments/raw/master/images/DataTable.gif",
      alt = "Example of a Dash Interactive Table"
    )
  ),

  coreMarkdown(
    "[View the Dash Table Experiments Project](https://github.com/plotly/dash-table-experiments) | [Join the discussion](https://community.plot.ly/t/display-tables-in-dash/4707/38)

               ***"),

  htmlH3(coreLink('Upload Component', href = '/dasher/dash-core-components/upload')),
  coreMarkdown(
    "The `coreUpload` component allows users to upload files into your app through
drag-and-drop or the system's native file explorer."
  ),

  htmlA(
    className = "image-link",
    href = "https://github.com/plotly/dash-core-components/pull/73",
    children = htmlImg(
      src = "https://user-images.githubusercontent.com/1280389/30351245-6b93ee62-97e8-11e7-8e85-0411e9d6c98c.gif",
      alt = "Dash Upload Component"
    )
  ),

  coreLink(htmlA('More Upload Examples and Reference'),
           href = "/dasher/dash-core-components/upload"),

  htmlH3('Tabs'),
  coreMarkdown(
    "The `coreTabs` component is currently available in the prerelease
               channel of the `dash-core-components` package.
               To try it out, see the tab component
               [Pull Request on GitHub](https://github.com/plotly/dash-core-components/pull/74)."
  ),

  htmlA(
    className = "image-link",
    href = "https://github.com/plotly/dash-core-components/pull/74",
    children = htmlImg(
      src = "https://user-images.githubusercontent.com/1280389/30461515-0022526c-998d-11e7-8fcc-66ba308c8b38.gif",
      alt = "Dash Vertical Tabs Component"
    )
  ),

  htmlA(
    className = "image-link",
    href = "https://github.com/plotly/dash-core-components/pull/74",
    children = htmlImg(
      src = "https://user-images.githubusercontent.com/1280389/30497812-46cc1910-9a22-11e7-8baa-9df0191bc828.png",
      alt = "Dash Horizontal Tabs Component"
    )
  ),

  coreMarkdown("[Tab Component Pre-Release](https://github.com/plotly/dash-core-components/pull/74)

               ***"
  ),

  htmlH3('Graphs'),
  coreMarkdown(
    "The `Graph` component shares the same syntax as the open-source `plotly.js` library. View the [plotly.js docs](https://plot.ly/javascript) to learn more."
  ),
  ComponentBlock(
    ~coreGraph(
      figure = list(
        data = list(
          list(
            x = c(1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003,
                  2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012),
            y = c(219, 146, 112, 127, 124, 180, 236, 207, 236, 263,
                  350, 430, 474, 526, 488, 537, 500, 439),
            name = 'Rest of world',
            marker = list(color = 'rgb(55, 83, 109)')
          ),
          list(
            x = c(1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003,
                  2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012),
            y = c(16, 13, 10, 11, 28, 37, 43, 55, 56, 88, 105, 156, 270,
                  299, 340, 403, 549, 499),
            name = 'China',
            marker = list(color = 'rgb(26, 118, 255)')
          )
        ),
        layout = list(
          title = 'US Export of Plastic Scrap',
          showlegend = TRUE,
          legend = list(
            x = 0,
            y = 1.0
          ),
          margin = list(l = 40, r = 0, t = 40, b = 30)
        )
      ),
      style = list(height = 300),
      id = 'my-graph'
    )
  ),

  htmlBr(),

  htmlDiv(id = 'hidden', style = list(display = 'none'))

)

app <- Dash$new()
app$layout_set(ui)
app
