library(dasher)

ui <- coreMarkdown(
"
# Dasher Support and Contact

Dasher is an open-source product that is
developed and maintained by [Plotly](https://plot.ly).

### Dasher Demos and Enterprise Trials

If you would like to trial or purchase a Dasher On-Premises server,
[get in touch with us directly](https://plotly.typeform.com/to/seG7Vb).

Our sales engineering team is happy to give you or your team
a demo of Dasher and Dasher On-Premises too.

### Dasher Workshops

We regularly run workshops on both dasher and dash. Register and see more
information at <https://plotcon.plot.ly/workshops>.

Last Fall's workshops sold out, so if you are interested,
[register soon](https://plotcon.plot.ly/workshops)!

### Sponsored Feature Requests and Customizations

If you or your company would like to sponsor a specific feature or enterprise
customization, get in touch with our
[advanced development team](http://plot.ly/products/consulting-and-oem/).

### Community Support

Our community forum at [community.plot.ly](https://community.plot.ly) has
a topic dedicated on [Dash](https://community.plot.ly/c/dash).
This forum is great for showing off projects, feature requests,
and general questions.

If you have found a bug, you can open an issue on GitHub at
[plotly/dasher](https://github.com/plotly/dasher).

### Direct Contact

If you would like to reach out to me directly,
you can email me at <chris@plot.ly> or on
Twitter at [@cpsievert](https://twitter.com/cpsievert).

Plotly is also on Twitter at [@plotlygraphs](https://twitter.com/plotlygraphs).

We are based in Montréal, Canada and our headquarters are in the Mile End.
If you're in the neighborhood, come say hi!
"
)

app <- Dash$new()
app$layout_set(ui)
app
