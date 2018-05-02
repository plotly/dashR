library(dashR)

source("styles.R")

ui <- htmlDiv(

  coreMarkdown(
    "# Writing your own components",
    "",
    "One of the really cool things about dash & dashR is that",
    "they both leverage [React.js](https://facebook.github.io/react/),",
    "a JavaScript library for building web components.",
    "",
    "The React community is huge. Thousands of components have been built and",
    "released with open source licenses. For example, here are just some of the",
    "[slider components](https://react.rocks/?q=slider) and",
    "[table components](https://react.rocks/?q=tables) that have been published",
    "by the community.",
    "",
    "## From React.js to dashR",
    "",
    "The dashRtranspile package provides a way to",
    "[transpile](https://en.wikipedia.org/wiki/Source-to-source_compiler) React",
    "components (written in JavaScript) into R functions that are compatible with",
    "the dashR ecosystem. If you're already familiar with",
    "[transpiling to dash](https://plot.ly/dash/plugins), you'll find that",
    "transpiling to dashR is _very_ similar (in fact, if you've already followed",
    "that tutorial to create a dash (python) component, you can add dashR (R)",
    "support by doing `npm run install-local-r`).",
    "",
    "On a high level, transpiling from JS to R works like so:",
    "",
    "- Components in dashR are serialized as [JSON](www.json.org).",
    "To write a dashR compatible component, all of the properties",
    "of the component must be serializable as JSON. For example,",
    "JavaScript functions are not valid input arguments.",
    "",
    "- By annotating components with React docstrings, dashR extracts",
    "the information about the component's name, properties, and a description",
    "of the components through [React Docgen](https://github.com/reactjs/react-docgen).",
    "This is exported as a JSON file.",
    "",
    "- dashRtranspile reads this JSON file and dynamically creates R functions that return",
    "objects that dashR understands. _These functions and their documentation are",
    "generated entirely automatically from the react docstring._",
    "",
    "- The JS bundle and any extra files are symlinked to the",
    "[`inst/` folder](http://r-pkgs.had.co.nz/inst.html) so they are available to",
    "the installed version of the R package.",
    "",
    "- At runtime, dashR crawls through an app's layout and finds which R package",
    "each component belongs to so that it can serve the necessary CSS/JS bundles to the front-end.",
    "",
    "- The layout is serialized as JSON, served to dashR's front-end",
    "(you can check this yourself by visiting the `/_dash-layout` endpoint of an app),",
    "and recursively rendered with these bundles and React.",
    "",
    "",
    "## Step-by-step guide",
    "",
    "The dashR ecosystem includes a command-line tool for",
    "generating component package templates with all of the necessary",
    "boiler plate.",
    "",
    "We use the package [builder](https://github.com/FormidableLabs/builder) built by",
    "the excellent team at [Formidable Labs](https://formidable.com/) to manage",
    "these templates.",
    "",
    "The code behind the template is available in the",
    "[plotly/dash-components-archetype](https://github.com/plotly/dash-components-archetype)",
    "repository on GitHub.",
    "",
    "### Step 1 - Prerequisites",
    "",
    "You'll need Node, NPM, and R installed.",
    "Components are built with [React.js](https://facebook.github.io/react/).",
    "",
    "> If you're just getting started, we've written a great",
    "[React.js tutorial](https://academy.plot.ly/) as part of our open source academy.",
    "",
    "### Step 2 - Install Builder"
  ),

  coreSyntaxHighlighter(
    "$ npm install -g builder-init",
    language = 'bash',
    customStyle = styles$code_container
  ),

  coreMarkdown("### Step 3 - Initialize a Project"),

  coreSyntaxHighlighter(
    "$ builder-init dash-components-archetype",
    language = 'bash',
    customStyle = styles$code_container
  ),

  coreMarkdown(
    "This command asks you a series of questions (e.g., name and description)",
    "about your component like a name and description (if you don't have these",
    "answers yet, don't worry, we'll walk through an example).",
    "Since the name of the project is used for the name of the",
    "R package, we recommend using camelCase or hyphens to separate words in your",
    "name. If, the name is `acme-components`, for example,",
    "then the R package will end up being `library(acmeComponents)` because R package",
    "names can't contain hyphens or underscores (this differs from the python (dash)",
    "package name, which would be `import acme_components`).",
    "",
    "> One cool thing about this Builder archetype is that it will",
    "> template in the name of your package in the files and folders that it",
    "> generates. This requires way less work than say cloning a boilerplate Git Repo.",
    "",
    "This will end up looking _something_ like:"
  ),

  coreSyntaxHighlighter(
    "
$ builder-init dash-components-archetype
  dash-components-archetype-0.2.11.tgz
  [builder-init] Preparing templates for: dash-components-archetype
  ? Please name your component suite. acme-components
  ? Enter a description Components used by the Acme Corp
  ? GitHub organization or user name acme-corp
  ? License organization (e.g., you or your company) acme-corp
  ? A contact email acme-corp@server.com
  ? Destination directory to write acme-components

  [builder-init] Wrote files:
  - acme-components/.Rbuildignore
  - acme-components/.babelrc
  - acme-components/.builderrc
  - acme-components/CHANGELOG.md
  - acme-components/DESCRIPTION
  - acme-components/LICENSE
  - acme-components/LICENSE.txt
  - acme-components/MANIFEST.in
  - acme-components/README.md
  - acme-components/package.json
  - acme-components/requirements.txt
  - acme-components/setup.py
  - acme-components/usage.py
  - acme-components/.eslintrc
  - acme-components/.gitignore
  - acme-components/.npmignore
  - acme-components/demo/Demo.react.js
  - acme-components/demo/index.html
  - acme-components/demo/index.js
  - acme-components/inst/USAGE-R.md
  - acme-components/inst/transpile.R
  - acme-components/src/index.js
  - acme-components/test/main.js
  - acme-components/tests/testthat.R
  - acme-components/acme_components/__init__.py
  - acme-components/acme_components/version.py
  - acme-components/src/components/ExampleComponent.react.js
  - acme-components/tests/testthat/test-basic.R
  - acme-components/src/components/__tests__/.eslintrc
  - acme-components/src/components/__tests__/ExampleComponent.test.js

  [builder-init] New dash-components-archetype project is ready at: acme-components
",
    language = 'bash',
    customStyle = styles$code_container
  ),

  coreMarkdown(
    "### Step 4 - Install the example component",
    "",
    "At this point, Builder has created a folder (named `acme-components` in this",
    "case) that contains JavaScript, Python, and R files necessary to generate",
    "functional dash and/or dashR components. Located in the",
    "`acme-components/src/components/ExampleComponent.react.js` file is a working",
    "example component that I'd recommending looking at first.",
    "",
    "The first thing to notice is that the example component uses",
    "[React the ES6+ way](https://babeljs.io/blog/2015/06/07/react-on-es6-plus).",
    "Not all browsers have support for ES6+, so we 'build' a JavaScript",
    "bundle that will be more widely supported via `npm install`. In addition to",
    "creating a build, this command install necessary packages (be patient!), check",
    "the JavaScript source code syntax for common issues, and run a few tests",
    "(which are located in `acme-components/test`). Go ahead and build the example",
    "component:"
  ),

  coreSyntaxHighlighter(
    "
$ cd acme-components
$ npm install
",
    language = 'bash',
    customStyle = styles$code_container
  ),

  coreMarkdown(
    "The JavaScript bundle and the react-docgen JSON file will be in a folder named",
    "after (the underscored version of) your package (in this case,",
    "`acme_components/`). To transpile this example into an R package, and check that",
    "it's working:"
  ),

  coreSyntaxHighlighter(
    "
$ npm run install-local-r
$ R -q -e 'library(acmeComponents); help(ExampleComponent)'

ExampleComponent        package:acmeComponents         R Documentation

ExampleComponent acme-components component

Description:

ExampleComponent is an example component. It takes a property,
`label`, and displays it. It renders an input with the property
`value` which is editable by the user.

Usage:

ExampleComponent(id = NULL, label = NULL, value = NULL, setProps = NULL)

Arguments:

id: The ID used to identify this compnent in Dash callbacks

label: A label that will be printed when this component is rendered.
(required)

value: The value displayed in the input

setProps: Dash-assigned callback that should be called whenever any of
the properties change

",
    language = 'bash',
    customStyle = styles$code_container
  ),

  coreMarkdown(
    "### Step 5 - View the component in a dashR app",
    "",
    "Open the `inst/USAGE-R.md` file. This has information about how to install and",
    "use your package. Go ahead and copy the example R code into an R session to see",
    "the component in a dashR app."
  ),

  coreMarkdown(
    "#### Step 6 - Develop your component",
    "",
    "Now that we've confirmed the example component works, it's time to develop your",
    "own component. I recommend using a workflow similar to this:",
    "",
    "1. Open and edit the `src/components/ExampleComponent.react.js` file. You're",
    "encouraged to change this filename (the dash/dashR component name derives from",
    "it), but when you do, make sure to change the code in `src/index.js` to reflect",
    "this change. You're also enouraged to create new files with",
    "different components -- just make sure that when you edit/add new components,",
    "you declare their `propTypes` appropriately as these are vital to the downstream",
    "R functionality.",
    "",
    "2. Update `demo/Demo.react.js` to show-off your new component. You can also",
    "'live edit' (i.e., changes to source are automatically reloaded in your browser)",
    "via `builder run demo`.",
    "",
    "3. Update the tests `test/main.js`.",
    "",
    "4. When you're happy with the changes, run `npm install` to produce a new bundle",
    "with these changes.",
    "",
    "5. Run `npm run install-local-r` and modify `inst/USAGE-R.md` to reflect dashR",
    "usage. You could also (optionally) modify the `inst/transpile.R` script to",
    "enhance the transpiling from JS to R. Here, you could, for example, add a prefix",
    "to function names, add roxygen2 specific documentation, and/or modify the",
    "R function signatures (for inspiration and examples, see",
    "[dash-core-components](https://github.com/plotly/dash-core-components) and",
    "[dash-html-components](https://github.com/plotly/dash-html-components))",
    "",
    "6. Go back to 1."
  ),

  coreMarkdown(
    "Remember that all dashR components are described declaratively through a set of",
    "component properties (i.e., props). Some of these props are editable by the user",
    "(for example, the `value` property in `ExampleComponent`).",
    "To propagate changes that are made to properties through the user",
    "interface to dashR, your component code must call",
    "`props.setProps({name_of_the_property: new_value_of_the_property})`.",
    "This will update the property of that component, will re-render the component",
    "with that property, and will send that new value to the appropriate dashR",
    "callback."
  ),

  coreMarkdown(
    "#### Step 7 - Publish Your Component",
    "",
    "Finally, you can publish your component to both NPM and CRAN by running",
    "`npm run publish-cran`. Note that the version of the R package derives from the",
    "version specified in the package.json file. By convention, dashR components",
    "should adhere to [semver](http://semver.org/). Finally, if you'd like, share",
    "your component suite with other DashR users in the",
    "[DashR community forum](https://community.plot.ly/c/dash)!"
  )

)

app <- Dash$new()
app$layout_set(ui)
app
