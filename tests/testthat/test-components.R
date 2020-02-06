context("components")

test_that("Components work recursively (components can be children of components)", {
  
  # div inside of a div
  outer <- htmlDiv(id = "one", children = htmlDiv(id = "two"))
  expect_true(is.component(outer))
  expect_true(outer$props$id == "one")
  inner <- outer$props$children
  expect_true(is_component(inner))
  expect_true(inner$props$id == "two")
  
  # slider inside of a div
  outer <- htmlDiv(
    dccSlider(
      id = "slider",
      min = 1,
      max = 100,
      value = 48
    )
  )
  
  expect_true(is.component(outer))
  slider <- outer$props$children
  expect_true(is_component(slider))
  expect_true(slider$props$id == "slider")
  expect_true(slider$props$min == 1)
  expect_true(slider$props$max == 100)
  expect_true(slider$props$value == 48)
})

test_that("Component constructors behave as intended", {
  
  # components have three main keys
  # (1) props: or the main properties, which are recursive (component)
  # (2) type: or the 'name' of the component
  # (3) namespace: is this a core/html component?
  
  expect_component_names <- function(component) {
    setdiffsym <- function(x, y) {
      setdiff(union(x, y), intersect(x, y))
    }
    diff <- setdiffsym(names(component), c("props", "type", "namespace", "propNames", "package"))
    expect_length(diff, 0)
  }
  
  expect_component_names(htmlA())
  expect_component_names(dccDropdown())
  
  # check if the children of a component are as they were set.
  expect_equal(
    htmlH2("A header")$props$children, "A header"
  )
  
  # test akin to this one https://github.com/plotly/dash-renderer/blob/851d717b/tests/test_render.py#L25-L38
  vals <- list("Basic string", 3.14, NULL, htmlDiv("Just a test"))
  prop_vals <- htmlH2(vals)$props
  expect_identical(prop_vals$children[[1]], vals[[1]])
  
  # test with rendered DOM - Work in Progress
  
  rendered_dom = '
            <div>
                Basic string
                3.14
                <div PERMUTE>
                    Child div with basic string
                </div>
                <div id="p.c.4">
                </div>
                <div id="p.c.5">
                    <div id="p.c.5.p.c.0">
                        Grandchild div
                    </div>
                    <div id="p.c.5.p.c.1">
                        <div id="p.c.5.p.c.1.p.c.0">
                            Great grandchild
                        </div>
                        3.14159
                        another basic string
                    </div>
                    <div id="p.c.5.p.c.2">
                        <div id="p.c.5.p.c.2.p.c.0">
                            <div id="p.c.5.p.c.2.p.c.0.p.c">
                                <div id="p.c.5.p.c.2.p.c.0.p.c.p.c.0">
                                    <div id="p.c.5.p.c.2.p.c.0.p.c.p.c.0.p.c.0">
                                    </div>
                                    <div id="p.c.5.p.c.2.p.c.0.p.c.p.c.0.p.c.2">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       ' 
  comment_regex <- '<!--[^\[](.*?)-->'
})

test_that("Giving nonsense arguments to components yields error", {
  expect_error(
    htmlA(nonsense = "string"),
    "Error: The following props are not valid in this component: 'nonsense'",
    fixed = TRUE
  )
})

test_that("Can identify whether a component contains a component of a given type", {
  graph <- dccGraph()
  slider <- dccSlider()
  
  expect_true(component_contains_type(graph, "dashCoreComponents", "Graph"))
  expect_false(component_contains_type(graph, "dash", "Graph"))
  expect_false(component_contains_type(slider, "dashCoreComponents", "Graph"))
  expect_true(component_contains_type(htmlDiv(list(slider, graph)), "dashCoreComponents", "Graph"))
})

test_that("Wildcard attributes work with children", {
  s1 <- htmlSpan(children = list(`data-icon` = "fa-pencil"), id="hmm", className = "value-output")
  s2 <- htmlSpan(children = list("hmm"), className = "value-output", `data-icon` = "fa-pencil")
  
  expect_equal(s1$props$children, s2$props[3])
  expect_equal(s1$props$children[[1]], "fa-pencil")
  expect_equal(s2$props$children, list("hmm"))
  expect_equal(s2$props$`data-icon`, "fa-pencil")
})

test_that("Can translate arbitrary HTML string", {
  skip_if_not_installed("dashDangerouslySetInnerHtml")
  
  html <- "<div> 1 </div>"
  expect_is(
    dashDangerouslySetInnerHtml::DangerouslySetInnerHTML(HTML(html)),
    "dash_component"
  )
})
