// htmlwidgets isn't on npm, so we do some hackery to make sure it exists
// TODO: look into maybe importing from htmlwidgets.js
var HTMLWidgets = window.HTMLwidgets || {};
if (Object.keys(HTMLWidgets).length) {
  throw new Error("HTMLWidgets library not found");
}

// because
var React = window.React || {};
if (Object.keys(HTMLWidgets).length) {
  throw new Error("React library not found.");
}

// register the component with dash-renderer
// https://github.com/plotly/dash-renderer/blob/b11b5e25df642ea13d5456f1d8187d2af9314be5/src/registry.js
var ns = "dash_html_components";
var componentName = "Htmlwidget";

// I feel sorry for front-end web developers...
// http://blog.krawaller.se/posts/5-reasons-not-to-use-es6-classes-in-react/
window[ns] = {};
window[ns][componentName] = React.createClass({

  propTypes: {
    id: React.PropTypes.string.isRequired,

    // The htmlwidget's 'data', see http://www.htmlwidgets.org/develop_intro.html
    x: React.PropTypes.object.isRequired,

    style: React.PropTypes.string,

    className: React.PropTypes.string
  },

  componentWillMount: function() {

    console.log("Setting up your widget", props);

    // query the htmlwidget DOM container
    this.el = this.querySelector("." + props.name);

    // query the htmlwidget 'instance'
    // https://github.com/ramnathv/htmlwidgets/blob/6f4101d0/inst/www/htmlwidgets.js#L747-L767
    this.instance = HTMLWidgets.find(this, "." + props.name);

  },

  // https://facebook.github.io/react/docs/react-component.html
  componentDidMount: function() {
    // TODO:
    // (1) where is x coming from?
    // (2) how to implement sizingPolicy?
    // (3) how to ensure additional dependencies are included properly, like this
    // https://github.com/ramnathv/htmlwidgets/blob/6f4101d0/inst/www/htmlwidgets.js#L492
    HTMLWidgets.renderValue(this.el, this.props.x, this.instance);
  },

  render: function() {
    console.log("Setting up your widget");
    var props = {id: this.props.id, style: this.props.style, class: this.props.className};
    return React.createElement('div', props);
  }

});


//constructor: function(props) {
    // a trigger that let's us know when the widget is done rendering
    // TODO: does htmlwidgets.js trigger a relevant event that we can listen to?
    // TODO: why do the react docs say: "If you don't use something in render(), it shouldn't be in the state."
    // https://facebook.github.io/react/docs/state-and-lifecycle.html#adding-lifecycle-methods-to-a-class
    // this.state = {hasRendered: false};

    // some react 'boilerplate' for registering methods on this class
    // basically, allows one to call `method()` instead of `this.method()`, I think?
    // https://facebook.github.io/react/docs/handling-events.html
    // this.bindEvents = this.bindEvents.bind(this);
  //},

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
