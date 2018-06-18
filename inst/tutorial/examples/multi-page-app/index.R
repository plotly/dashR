library(dashR)
library(modules)

import("app", attach = "app")
app1 <- import("apps/app1")
app2 <- import("apps/app2")

app$layout_set(
  coreLocation(id = 'url', refresh = FALSE),
  htmlDiv(id = 'page-content')
)

app$callback(
  function(pathname = input('url', 'pathname')) {
    if (identical('/apps/app1', pathname)) return(app1$layout)
    if (identical('/apps/app2', pathname)) return(app2$layout)
    htmlDiv(
      'Nothing to see here. Go to ',
      coreLink("app1", href = "/apps/app1"),
      ' or ', coreLink("app2", href = "/apps/app2")
    )
  }, output('page-content')
)

app
