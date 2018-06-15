library(dashR)

# import Syntax() and Example()
source("components.R")
source("tools.R")
source("styles.R")

exfiles <- c(
  'getting-started-part-2-interactive-simple.R',
  'getting-started-part-2-graph.R',
  'getting-started-part-2-multiple-viz.R',
  'getting-started-part-2-multiple-outputs-1.R',
  'getting-started-part-2-callback-chain.R'
)
examples <- lapply(file.path("examples", exfiles), load_example)


ui <- htmlDiv(

  htmlH1("Tutorial - Part 2: Interactivity"),

  coreMarkdown(
    "This tutorial will walk you through the fundamentals of creating dashR",
    sprintf("apps through '%s' self-contained apps.", length(exfiles))
  ),

  htmlHr(),

  coreMarkdown(
    "1. [Dash App Layout](/dashR/getting-started-part-1)",
    "  - Generating HTML",
    "  - Data Visualization",
    "  - Markdown",
    "  - Core Components",
    "  - Calling `help`",
    "2. [Interactivity](#interactivity)",
    "  - Fundamentals",
    "  - Multiple Inputs",
    "  - Multiple Outputs",
    "  - Graph Crossfiltering"
  ),

  htmlHr(),

  htmlH2("Interactivity", id = 'interactivity'),

  coreMarkdown(
    "The [first part](/dash/getting-started) of this tutorial covered the `layout` of",
    "DashR apps. The `layout` of a DashR app describes what the app looks like.",
    "It is a hierarchical tree of components. The `dash_html_components` library",
    "provides classes for all of the HTML tags and the keyword arguments describe",
    "the HTML attributes like `style`, `className`, and `id`. The",
    "`dash_core_components` library generates higher-level components like",
    "controls and graphs.",
    "",
    "The second part of the tutorial describes how to make your DashR apps interactive.",
    "",
    "Let's get started with a simple example."
  ),

  htmlH4("DashR App Layout", id = 'dash-app-layout'),

  Syntax(examples[[1]]$source),

  Example(examples[[1]]$layout),

  coreMarkdown(
    "Try typing in the text box. The children of the output component updates",
    "right away. Let's break down what's happening here:",
    "               1. The inputs and outputs of our application interface are described",
    "declaratively through the `app$callback` method.",
    "2. In DashR, the inputs and outputs are the",
    "properties of a particular component. In this example,",
    "our input is the `value` property of the component that has the ID",
    "`'my-id'`. Our output is the `children` property of the",
    "component with the ID `'my-div'`.",
    "3. Whenever an input property changes, the function that the",
    "callback decorator wraps will get called automatically.",
    "Dash provides the function with the new value of the input property as",
    "an input argument and Dash updates the property of the output component",
    "with whatever was returned by the function.",
    "4. The `component_id` and `component_property` keywords are optional",
    "(there are only two arguments for each of those objects).",
    "I have included them here for clarity but I will omit them from here on",
    "out for brevity and readability.",
    "5. Don't confuse the `dash.dependencies.Input` object from the",
    "`dash_core_components.Input` object. The former is just used in these",
    "callbacks and the latter is an actual component.",
    "6. Notice how we don't set a value for the `children` property of the",
    "`my-div` component in the `layout`. When the Dash app starts, it",
    "automatically calls all of the callbacks with the initial values of the",
    "input components in order to populate the initial state of the output",
    "components. In this example, if you specified something like",
    "`htmlDiv(id='my-div', children='Hello world')`, it would get overwritten",
    "when the app starts.",
    "",
    "It's sort of like programming with Microsoft Excel:",
    "whenever an input cell changes, all of the cells that depend on that cell",
    "will get updated automatically. This is called 'Reactive Programming'.",
    "",
    "Remember how every component was described entirely through its set of",
    "keyword arguments? Those properties are important now.",
    "With Dash interactivity, we can dynamically update any of those properties",
    "through a callback function. Frequently we'll update the `children` of a",
    "component to display new text or the `figure` of a `coreGraph` component",
    "to display new data, but we could also update the `style` of a component or",
    "even the available `options` of a `coreDropdown` component!",
    "",
    "***",
    "",
    "Let's take a look at another example where a `coreSlider()` updates a `coreGraph()`."
  ),

  Syntax(examples[[2]]$source),

  Example(examples[[2]]$layout),

  coreMarkdown(
    "In this example, the `'value'` property of the `Slider` is the input of the app",
    "and the output of the app is the `'figure'` property of the `Graph`.",
    "Whenever the `value` of the `Slider` changes, Dash calls the callback",
    "function `update_figure` with the new value. The function filters the",
    "dataframe with this new value, constructs a `figure` object,",
    "and returns it to the Dash application.",
    "",
    "There are a few nice patterns in this example:",
    "1. We're using the [Pandas](http://pandas.pydata.org/) library for importing",
    "and filtering datasets in memory.",
    "2. We load our dataframe at the start of the app: `df = pd.read_csv('...')`.",
    "This dataframe `df` is in the global state of the app and can be",
    "read inside the callback functions.",
    "3. Loading data into memory can be expensive. By loading querying data at",
    "the start of the app instead of inside the callback functions, we ensure",
    "that this operation is only done when the app server starts. When a user",
    "visits the app or interacts with the app, that data (the `df`)",
    "is already in memory.",
    "If possible, expensive initialization (like downloading or querying data)",
    "should be done in the global scope of the app instead of within the",
    "callback functions.",
    "4. The callback does not modify the original data, it just creates copies",
    "of the dataframe by filtered through pandas filters.",
    "This is important: *your callbacks should never mutate variables",
    "outside of their scope*. If your callbacks modify global state, then one",
    "user's session might affect the next user's session and when the app is",
    "deployed on multiple processes or threads, those modifications will not",
    "be shared across sessions.",
    "",
    "#### Multiple inputs",
    "",
    "In DashR, an output can depend on multiple inputs.",
    "Here's a simple example that binds 5 `input()`s",
    "(the `value` property of 2 `Dropdown` components, 2 `RadioItems` components,",
    "and 1 `Slider` component) to 1 Output component",
    "(the `figure` property of the `Graph` component).",
    "Notice how the `app.callback` lists all 5 `dash.dependencies.Input` inside",
    "a list in the second argument."
  ),

  Syntax(examples[[3]]$source),

  Example(examples[[3]]$layout),

  coreMarkdown(
    "In this example, the `update_graph()` function gets called whenever the",
    "`value` property of the `coreDropdown()`, `coreSlider()`, or `coreRadioItems()`",
    "components change.",
    "",
    "The input arguments of the `update_graph` function are the new or current",
    "value of the each of the `Input` properties, in the order that they were",
    "specified.",
    "",
    "Even though only a single `Input` changes at a time (a user can only change",
    "the value of a single Dropdown in a given moment), Dash collects the current",
    "state of all of the specified `Input` properties and passes them into your",
    "function for you. Your callback functions are always guarenteed to be passed",
    "the representative state of the app.",
    "",
    "Let's extend our example to include multiple outputs.",
    "",
    "#### Multiple Outputs",
    "",
    "Each Dash callback function can only update a single Output property.",
    "To update multiple Outputs, just write multiple functions."
  ),

  Syntax(examples[[4]]$source),

  Example(examples[[4]]$layout),

  coreMarkdown(
    "You can also chain outputs and inputs together: the output of one callback",
    "function could be the input of another callback function.",
    "",
    "This pattern can be used to create dynamic UIs where one input component",
    "updates the available options of the next input component.",
    "Here's a simple example."
  ),

  Syntax(examples[[5]]$source),

  Example(examples[[5]]$layout),

  coreMarkdown(
    "The first callback updates the available options in the second `RadioItems`",
    "component based off of the selected value in the first `RadioItems` component.",
    "",
    "The second callback sets an initial value when the `options` property changes:",
    "it sets it to the first value in that `options` array.",
    "",
    "The final callback displays the selected `value` of each component.",
    "If you change the `value` of the countries `RadioItems` component, Dash",
    "will wait until the `value` of the cities component is updated",
    "before calling the final callback. This prevents your callbacks from being",
    "called with inconsistent state like with `'USA'` and `'Montréal'`."
  ),

  htmlH3("Summary"),

  coreMarkdown(
    "We've covered the fundamentals of callbacks in dashR. DashR apps are built",
    "off of a set of simple but powerful principles: declarative UIs that are",
    "customizable through reactive and functional R callbacks.",
    "Every element attribute of the declarative components can be updated through",
    "a callback and a subset of the attributes, like the `value` properties of",
    "the `coreDropdown()`, are editable by the user in the interface."
  ),
  htmlHr(),

  coreMarkdown(
    "The next chapter explains how to use these principles with the `coreGraph()`",
    "component to make applications that respond to interactions with graphs on the page."
  ),

  coreLink(
    htmlA('Part 3 - Interactive Graphing'),
    href = '/dash/interactive-graphing'
  )
)


app <- Dash$new()
app$layout_set(ui)
app
