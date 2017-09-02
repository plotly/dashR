// htmlwidgets isn't on npm, so we do some hackery to make sure it exists
// TODO: look into maybe importing from htmlwidgets.js
var HTMLWidgets = window.HTMLwidgets || {};

if (Object.keys(HTMLWidgets).length) {
  throw new Error("HTMLWidgets library not found");
}

var React = window.React || {};

if (Object.keys(HTMLWidgets).length) {
  throw new Error("React library not found.");
}


// style somewhat adopted from https://github.com/plotly/dash-core-components/blob/master/src/components/Graph.react.js
React.createClass({

  constructor(props) {
    super(props);

    // query the htmlwidget DOM container
    this.el = this.querySelector("." + props.name);

    // query the htmlwidget 'instance'
    // https://github.com/ramnathv/htmlwidgets/blob/6f4101d0/inst/www/htmlwidgets.js#L747-L767
    this.instance = HTMLWidgets.find(this, "." + props.name);

    // a trigger that let's us know when the widget is done rendering
    // TODO: does htmlwidgets.js trigger a relevant event that we can listen to?
    // TODO: why do the react docs say: "If you don't use something in render(), it shouldn't be in the state."
    // https://facebook.github.io/react/docs/state-and-lifecycle.html#adding-lifecycle-methods-to-a-class
    // this.state = {hasRendered: false};

    // some react 'boilerplate' for registering methods on this class
    // basically, allows one to call `method()` instead of `this.method()`, I think?
    // https://facebook.github.io/react/docs/handling-events.html
    // this.bindEvents = this.bindEvents.bind(this);
  }

  componentDidMount() {
    // TODO:
    // (1) where is x coming from?
    // (2) how to implement sizingPolicy?
    // (3) how to ensure additional dependencies are included properly, like this
    // https://github.com/ramnathv/htmlwidgets/blob/6f4101d0/inst/www/htmlwidgets.js#L492
    HTMLWidgets.renderValue(this.el, this.props.x, this.instance);
  }

  render() {
    return (
        <div id={this.props.id} style={this.props.style} class={this.props.className}> </div>
    );
  }

});

Htmlwidget.propTypes = {
  id: PropTypes.string.isRequired,

  // The htmlwidget's 'data', see http://www.htmlwidgets.org/develop_intro.html
  x: PropTypes.object.isRequired,

  style: PropTypes.string,

  className: PropTypes.string
}


/*
// htmlwidget(s) should already be registered/rendered before this script
// becomes necessary
// https://github.com/ramnathv/htmlwidgets/blob/master/inst/www/htmlwidgets.js
const queryWidget = (widgetName) => {
  window.HTMLWidgets = window.HTMLWidgets || {};
  var widgets = window.HTMLWidgets.widgets || [];
  var widget = widgets.filter(function(w) { return w.name === widgetName; })[0];
  if (widget === undefined) {
    throw new Error("Couldn't find widget");
  }
  return widget;
};
*/
