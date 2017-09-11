context("html-dependencies")

test_that("Can set/get dependencies", {

  app <- Dash$new()
  depsBasic <- app$dependencies_get(all = TRUE)

  # the core components shouldn't included by default, but we could add it!
  app$dependencies_set(deps[["dash-core-components"]])
  depsWithCore <- app$dependencies_get(all = TRUE)
  expect_equal(nrow(depsBasic) + 1, nrow(depsWithCore))

  # we reference these variables internally in the package several times
  expect_identical(
    names(dependency_tbl()), c('dependencies', 'section', 'priority')
  )
  expect_identical(names(deps), c('dependencies', 'section', 'priority', 'name'))
  expect_true("dash-core-components" %in% names(deps$dependencies))

})
