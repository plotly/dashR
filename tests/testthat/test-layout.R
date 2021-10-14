test_that("layout IDs must be unique", {

 app <- Dash$new()

 expect_error(
   app$layout(html$Div(list(html$A(id = "a"), html$A(id = "a"), html$P(id="b"), html$P(id="c"), html$A(id="c")))),
   "layout ids must be unique -- please check the following list of duplicated ids: 'a, c'"
  )

})

test_that("app$layout() only accepts components, or functions that return components", {
 app <- Dash$new()

 expect_error(
   app$layout(html$A(id = "a"), html$A(id = "a")),
   'unused argument (htmlA(id = "a"))',
  fixed = TRUE)

})

# Simplified layout syntax unittests

test_app <- dash_app()
set_get_layout_new <- function(..., app = test_app) set_layout(app, ...)$layout_get()
set_get_layout_old <- function(..., app = test_app) { app$layout(...); app$layout_get() }

test_that("Can set empty layout, couldn't before", {
   expect_error(set_get_layout_new(), NA)
   expect_error(set_get_layout_old())
})

test_that("Layout errors", {
   expect_error(set_get_layout_new("test", app = "not a dash app"))
   expect_error(set_get_layout_new(foo = "test"))
   expect_error(set_get_layout_new(div("one"), h2("two"), id = "test"))
})

test_that("Layout basics", {
   expect_identical(
      set_get_layout_new(div("one"), h2("two")),
      set_get_layout_old(html$Div(list(
         html$Div("one"), html$H2("two")
      )))
   )
   expect_identical(set_get_layout_new("one", "two"), set_get_layout_new(list("one", "two")))
   expect_identical(
      set_get_layout_new(function() div("one", "two")),
      set_get_layout_old(function() html$Div(list("one", "two")))
   )
})

test_that("set_layout replaces previous layout", {
   expect_identical(
      (dash_app() %>% set_layout("foo") %>% set_layout("bar"))$layout_get(),
      (dash_app() %>% set_layout("bar"))$layout_get()
   )
})

test_that("NULL layout elements", {
   expect_identical(
      set_get_layout_new("one", if (TRUE) "two", "three"),
      set_get_layout_new("one", "two", "three")
   )
   expect_identical(
      set_get_layout_new("one", if (FALSE) "two", "three"),
      set_get_layout_new("one", "three")
   )
})

test_that("No need to place everything in containers and lists", {
   expect_error(set_get_layout_new("test"), NA)
   expect_error(set_get_layout_old("test"))
   expect_identical(
      set_get_layout_new(div("one", "two")),
      set_get_layout_old(html$Div(list("one", "two")))
   )
   expect_identical(set_get_layout_new("test"), set_get_layout_old(html$Span("test")))
   expect_identical(
      set_get_layout_new("one", 5, TRUE),
      set_get_layout_old(html$Div(list(
         html$Span("one"),
         html$Span(5),
         html$Span(TRUE)
      )))
   )
})

test_that("Function as layout works", {
   app1 <- Dash$new()
   set.seed(1000)
   # Need to move to the next random int because the function version of layout
   # runs the code in the layout once before requesting the layout_get()
   runif(1)
   set_layout(app1, div(runif(1)))
   app1_layout1 <- app1$layout_get()
   app1_layout2 <- app1$layout_get()
   expect_identical(app1_layout1, app1_layout2)
   app2 <- Dash$new()
   set.seed(1000)
   runif(1)
   app2$layout(html$Div(runif(1)))
   app2_layout <- app2$layout_get()
   expect_identical(app1_layout1, app2_layout)

   app1_fx <- Dash$new()
   set.seed(1000)
   set_layout(app1_fx, function() div(runif(1)))
   app1_fx_layout1 <- app1_fx$layout_get()
   app1_fx_layout2 <- app1_fx$layout_get()
   expect_identical(app1_layout1, app1_fx_layout1)
   expect_false(identical(app1_fx_layout1, app1_fx_layout2))
   app2_fx <- Dash$new()
   set.seed(1000)
   app2_fx$layout(function() html$Div(runif(1)))
   app2_fx_layout1 <- app2_fx$layout_get()
   app2_fx_layout2 <- app2_fx$layout_get()
   expect_identical(app1_fx_layout1, app2_fx_layout1)
   expect_identical(app1_fx_layout2, app2_fx_layout2)
})

test_that("Sample apps layout are identical with the compact syntax", {
   expect_identical(
      set_get_layout_old(
         html$Div(list(
            html$Div('Dash To-Do List'),
            dccInput(id = 'new-item'),
            html$Button("Add", id = "add"),
            html$Button("Clear Done", id = "clear-done"),
            html$Div(id = "list-container"),
            html$Div(id = "totals")
         ))
      ),

      set_get_layout_new(
         div('Dash To-Do List'),
         dccInput(id = 'new-item'),
         button("Add", id = "add"),
         button("Clear Done", id = "clear-done"),
         div(id = "list-container"),
         div(id = "totals")
      )
   )

   expect_identical(
      set_get_layout_old(
         html$Div(
            list(
               html$H1('Hello Dash'),
               html$Div(children = "Dash: A web application framework for R."),
               dccGraph(
                  figure=list(
                     data=list(
                        list(
                           x=list(1, 2, 3),
                           y=list(4, 1, 2),
                           type='bar',
                           name='SF'
                        ),
                        list(
                           x=list(1, 2, 3),
                           y=list(2, 4, 5),
                           type='bar',
                           name='Montreal'
                        )
                     ),
                     layout = list(title='Dash Data Visualization')
                  )
               )
            )
         )
      ),

      set_get_layout_new(
         h1('Hello Dash'),
         div("Dash: A web application framework for R."),
         dccGraph(
            figure=list(
               data=list(
                  list(
                     x=list(1, 2, 3),
                     y=list(4, 1, 2),
                     type='bar',
                     name='SF'
                  ),
                  list(
                     x=list(1, 2, 3),
                     y=list(2, 4, 5),
                     type='bar',
                     name='Montreal'
                  )
               ),
               layout = list(title='Dash Data Visualization')
            )
         )
      )
   )
})
