#' a component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param download Indicates that the hyperlink is to be used for downloading a resource.  
#' @param href The URL of a linked resource.  
#' @param hrefLang Specifies the language of the linked resource.  
#' @param media Specifies a hint of the media for which the linked resource was designed.  
#' @param rel Specifies the relationship of the target object to the link object.  
#' @param shape   
#' @param target   
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_a <- function(id = NULL, children = NULL, n_clicks = NULL, download = NULL, href = NULL, hrefLang = NULL, media = NULL, rel = NULL, shape = NULL, target = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, download=download, href=href, hrefLang=hrefLang, media=media, rel=rel, shape=shape, target=target, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'a')
)
}
#' abbr component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_abbr <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'abbr')
)
}
#' acronym component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_acronym <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'acronym')
)
}
#' address component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_address <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'address')
)
}
#' applet component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param alt Alternative text in case an image can't be displayed.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_applet <- function(id = NULL, children = NULL, n_clicks = NULL, alt = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, alt=alt, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'applet')
)
}
#' area component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param alt Alternative text in case an image can't be displayed.  
#' @param coords A set of values specifying the coordinates of the hot-spot region.  
#' @param download Indicates that the hyperlink is to be used for downloading a resource.  
#' @param href The URL of a linked resource.  
#' @param hrefLang Specifies the language of the linked resource.  
#' @param media Specifies a hint of the media for which the linked resource was designed.  
#' @param rel Specifies the relationship of the target object to the link object.  
#' @param shape   
#' @param target   
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_area <- function(id = NULL, children = NULL, n_clicks = NULL, alt = NULL, coords = NULL, download = NULL, href = NULL, hrefLang = NULL, media = NULL, rel = NULL, shape = NULL, target = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, alt=alt, coords=coords, download=download, href=href, hrefLang=hrefLang, media=media, rel=rel, shape=shape, target=target, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'area')
)
}
#' article component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_article <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'article')
)
}
#' aside component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_aside <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'aside')
)
}
#' audio component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param autoPlay The audio or video should play as soon as possible.  
#' @param controls Indicates whether the browser should show playback controls to the user.  
#' @param crossOrigin How the element handles cross-origin requests  
#' @param loop Indicates whether the media should start playing from the start when it's finished.  
#' @param preload Indicates whether the whole resource, parts of it or nothing should be preloaded.  
#' @param src The URL of the embeddable content.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_audio <- function(id = NULL, children = NULL, n_clicks = NULL, autoPlay = NULL, controls = NULL, crossOrigin = NULL, loop = NULL, preload = NULL, src = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, autoPlay=autoPlay, controls=controls, crossOrigin=crossOrigin, loop=loop, preload=preload, src=src, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'audio')
)
}
#' b component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_b <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'b')
)
}
#' base component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param href The URL of a linked resource.  
#' @param target   
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_base <- function(id = NULL, children = NULL, n_clicks = NULL, href = NULL, target = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, href=href, target=target, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'base')
)
}
#' basefont component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_basefont <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'basefont')
)
}
#' bdi component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_bdi <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'bdi')
)
}
#' bdo component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_bdo <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'bdo')
)
}
#' big component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_big <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'big')
)
}
#' blink component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_blink <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'blink')
)
}
#' blockquote component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param cite Contains a URI which points to the source of the quote or change.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_blockquote <- function(id = NULL, children = NULL, n_clicks = NULL, cite = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, cite=cite, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'blockquote')
)
}
#' br component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_br <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'br')
)
}
#' button component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param autoFocus The element should be automatically focused after the page loaded.  
#' @param disabled Indicates whether the user can interact with the element.  
#' @param form Indicates the form that is the owner of the element.  
#' @param formAction Indicates the action of the element, overriding the action defined in the <form>.  
#' @param name Name of the element. For example used by the server to identify the fields in form submits.  
#' @param type Defines the type of the element.  
#' @param value Defines a default value which will be displayed in the element on page load.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_button <- function(id = NULL, children = NULL, n_clicks = NULL, autoFocus = NULL, disabled = NULL, form = NULL, formAction = NULL, name = NULL, type = NULL, value = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, autoFocus=autoFocus, disabled=disabled, form=form, formAction=formAction, name=name, type=type, value=value, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'button')
)
}
#' canvas component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param height Specifies the height of elements listed here. For all other elements, use the CSS height property.        Note: In some instances, such as <div>, this is a legacy attribute, in which case the CSS height property should be used instead.  
#' @param width For the elements listed here, this establishes the element's width.        Note: For all other instances, such as <div>, this is a legacy attribute, in which case the CSS width property should be used instead.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_canvas <- function(id = NULL, children = NULL, n_clicks = NULL, height = NULL, width = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, height=height, width=width, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'canvas')
)
}
#' caption component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_caption <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'caption')
)
}
#' center component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_center <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'center')
)
}
#' cite component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_cite <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'cite')
)
}
#' code component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_code <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'code')
)
}
#' col component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param span   
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_col <- function(id = NULL, children = NULL, n_clicks = NULL, span = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, span=span, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'col')
)
}
#' colgroup component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param span   
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_colgroup <- function(id = NULL, children = NULL, n_clicks = NULL, span = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, span=span, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'colgroup')
)
}
#' command component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param checked Indicates whether the element should be checked on page load.  
#' @param disabled Indicates whether the user can interact with the element.  
#' @param icon Specifies a picture which represents the command.  
#' @param radioGroup   
#' @param type Defines the type of the element.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_command <- function(id = NULL, children = NULL, n_clicks = NULL, checked = NULL, disabled = NULL, icon = NULL, radioGroup = NULL, type = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, checked=checked, disabled=disabled, icon=icon, radioGroup=radioGroup, type=type, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'command')
)
}
#' content component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_content <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'content')
)
}
#' data component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_data <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'data')
)
}
#' datalist component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_datalist <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'datalist')
)
}
#' dd component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_dd <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'dd')
)
}
#' del component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param cite Contains a URI which points to the source of the quote or change.  
#' @param dateTime Indicates the date and time associated with the element.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_del <- function(id = NULL, children = NULL, n_clicks = NULL, cite = NULL, dateTime = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, cite=cite, dateTime=dateTime, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'del')
)
}
#' details component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param open Indicates whether the details will be shown on page load.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_details <- function(id = NULL, children = NULL, n_clicks = NULL, open = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, open=open, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'details')
)
}
#' dfn component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_dfn <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'dfn')
)
}
#' dialog component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_dialog <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'dialog')
)
}
#' dir component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_dir <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'dir')
)
}
#' div component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_div <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'div')
)
}
#' dl component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_dl <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'dl')
)
}
#' dt component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_dt <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'dt')
)
}
#' element component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_element <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'element')
)
}
#' em component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_em <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'em')
)
}
#' embed component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param height Specifies the height of elements listed here. For all other elements, use the CSS height property.        Note: In some instances, such as <div>, this is a legacy attribute, in which case the CSS height property should be used instead.  
#' @param src The URL of the embeddable content.  
#' @param type Defines the type of the element.  
#' @param width For the elements listed here, this establishes the element's width.        Note: For all other instances, such as <div>, this is a legacy attribute, in which case the CSS width property should be used instead.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_embed <- function(id = NULL, children = NULL, n_clicks = NULL, height = NULL, src = NULL, type = NULL, width = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, height=height, src=src, type=type, width=width, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'embed')
)
}
#' fieldset component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param disabled Indicates whether the user can interact with the element.  
#' @param form Indicates the form that is the owner of the element.  
#' @param name Name of the element. For example used by the server to identify the fields in form submits.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_fieldset <- function(id = NULL, children = NULL, n_clicks = NULL, disabled = NULL, form = NULL, name = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, disabled=disabled, form=form, name=name, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'fieldset')
)
}
#' figcaption component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_figcaption <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'figcaption')
)
}
#' figure component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_figure <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'figure')
)
}
#' font component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_font <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'font')
)
}
#' footer component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_footer <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'footer')
)
}
#' form component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accept List of types the server accepts, typically a file type.  
#' @param acceptCharset List of supported charsets.  
#' @param action The URI of a program that processes the information submitted via the form.  
#' @param autoComplete Indicates whether controls in this form can by default have their values automatically completed by the browser.  
#' @param encType Defines the content type of the form date when the method is POST.  
#' @param method Defines which HTTP method to use when submitting the form. Can be GET (default) or POST.  
#' @param name Name of the element. For example used by the server to identify the fields in form submits.  
#' @param noValidate This attribute indicates that the form shouldn't be validated when submitted.  
#' @param target   
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_form <- function(id = NULL, children = NULL, n_clicks = NULL, accept = NULL, acceptCharset = NULL, action = NULL, autoComplete = NULL, encType = NULL, method = NULL, name = NULL, noValidate = NULL, target = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accept=accept, acceptCharset=acceptCharset, action=action, autoComplete=autoComplete, encType=encType, method=method, name=name, noValidate=noValidate, target=target, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'form')
)
}
#' frame component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_frame <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'frame')
)
}
#' frameset component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_frameset <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'frameset')
)
}
#' h1 component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_h1 <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'h1')
)
}
#' h2 component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_h2 <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'h2')
)
}
#' h3 component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_h3 <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'h3')
)
}
#' h4 component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_h4 <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'h4')
)
}
#' h5 component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_h5 <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'h5')
)
}
#' h6 component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_h6 <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'h6')
)
}
#' header component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_header <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'header')
)
}
#' hgroup component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_hgroup <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'hgroup')
)
}
#' hr component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_hr <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'hr')
)
}
#' i component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_i <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'i')
)
}
#' iframe component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param height Specifies the height of elements listed here. For all other elements, use the CSS height property.        Note: In some instances, such as <div>, this is a legacy attribute, in which case the CSS height property should be used instead.  
#' @param name Name of the element. For example used by the server to identify the fields in form submits.  
#' @param sandbox   
#' @param seamless   
#' @param src The URL of the embeddable content.  
#' @param srcDoc   
#' @param width For the elements listed here, this establishes the element's width.        Note: For all other instances, such as <div>, this is a legacy attribute, in which case the CSS width property should be used instead.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_iframe <- function(id = NULL, children = NULL, n_clicks = NULL, height = NULL, name = NULL, sandbox = NULL, seamless = NULL, src = NULL, srcDoc = NULL, width = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, height=height, name=name, sandbox=sandbox, seamless=seamless, src=src, srcDoc=srcDoc, width=width, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'iframe')
)
}
#' img component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param alt Alternative text in case an image can't be displayed.  
#' @param crossOrigin How the element handles cross-origin requests  
#' @param height Specifies the height of elements listed here. For all other elements, use the CSS height property.        Note: In some instances, such as <div>, this is a legacy attribute, in which case the CSS height property should be used instead.  
#' @param sizes   
#' @param src The URL of the embeddable content.  
#' @param srcSet   
#' @param useMap   
#' @param width For the elements listed here, this establishes the element's width.        Note: For all other instances, such as <div>, this is a legacy attribute, in which case the CSS width property should be used instead.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_img <- function(id = NULL, children = NULL, n_clicks = NULL, alt = NULL, crossOrigin = NULL, height = NULL, sizes = NULL, src = NULL, srcSet = NULL, useMap = NULL, width = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, alt=alt, crossOrigin=crossOrigin, height=height, sizes=sizes, src=src, srcSet=srcSet, useMap=useMap, width=width, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'img')
)
}
#' ins component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param cite Contains a URI which points to the source of the quote or change.  
#' @param dateTime Indicates the date and time associated with the element.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_ins <- function(id = NULL, children = NULL, n_clicks = NULL, cite = NULL, dateTime = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, cite=cite, dateTime=dateTime, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'ins')
)
}
#' isindex component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_isindex <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'isindex')
)
}
#' kbd component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_kbd <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'kbd')
)
}
#' keygen component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param autoFocus The element should be automatically focused after the page loaded.  
#' @param challenge A challenge string that is submitted along with the public key.  
#' @param disabled Indicates whether the user can interact with the element.  
#' @param form Indicates the form that is the owner of the element.  
#' @param keyType Specifies the type of key generated.  
#' @param name Name of the element. For example used by the server to identify the fields in form submits.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_keygen <- function(id = NULL, children = NULL, n_clicks = NULL, autoFocus = NULL, challenge = NULL, disabled = NULL, form = NULL, keyType = NULL, name = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, autoFocus=autoFocus, challenge=challenge, disabled=disabled, form=form, keyType=keyType, name=name, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'keygen')
)
}
#' label component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param htmlFor Describes elements which belongs to this one.  
#' @param form Indicates the form that is the owner of the element.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_label <- function(id = NULL, children = NULL, n_clicks = NULL, htmlFor = NULL, form = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, htmlFor=htmlFor, form=form, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'label')
)
}
#' legend component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_legend <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'legend')
)
}
#' li component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param value Defines a default value which will be displayed in the element on page load.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_li <- function(id = NULL, children = NULL, n_clicks = NULL, value = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, value=value, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'li')
)
}
#' link component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param crossOrigin How the element handles cross-origin requests  
#' @param href The URL of a linked resource.  
#' @param hrefLang Specifies the language of the linked resource.  
#' @param integrity Security Feature that allows browsers to verify what they fetch.     MDN Link  
#' @param media Specifies a hint of the media for which the linked resource was designed.  
#' @param rel Specifies the relationship of the target object to the link object.  
#' @param sizes   
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_link <- function(id = NULL, children = NULL, n_clicks = NULL, crossOrigin = NULL, href = NULL, hrefLang = NULL, integrity = NULL, media = NULL, rel = NULL, sizes = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, crossOrigin=crossOrigin, href=href, hrefLang=hrefLang, integrity=integrity, media=media, rel=rel, sizes=sizes, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'link')
)
}
#' listing component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_listing <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'listing')
)
}
#' main component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_main <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'main')
)
}
#' mapel component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param name Name of the element. For example used by the server to identify the fields in form submits.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_mapel <- function(id = NULL, children = NULL, n_clicks = NULL, name = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, name=name, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'mapel')
)
}
#' mark component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_mark <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'mark')
)
}
#' marquee component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param loop Indicates whether the media should start playing from the start when it's finished.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_marquee <- function(id = NULL, children = NULL, n_clicks = NULL, loop = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, loop=loop, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'marquee')
)
}
#' menu component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param type Defines the type of the element.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_menu <- function(id = NULL, children = NULL, n_clicks = NULL, type = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, type=type, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'menu')
)
}
#' menuitem component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_menuitem <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'menuitem')
)
}
#' meta component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param charSet Declares the character encoding of the page or script.  
#' @param content A value associated with http-equiv or name depending on the context.  
#' @param httpEquiv   
#' @param name Name of the element. For example used by the server to identify the fields in form submits.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_meta <- function(id = NULL, children = NULL, n_clicks = NULL, charSet = NULL, content = NULL, httpEquiv = NULL, name = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, charSet=charSet, content=content, httpEquiv=httpEquiv, name=name, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'meta')
)
}
#' meter component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param form Indicates the form that is the owner of the element.  
#' @param high Indicates the lower bound of the upper range.  
#' @param low Indicates the upper bound of the lower range.  
#' @param max Indicates the maximum value allowed.  
#' @param min Indicates the minimum value allowed.  
#' @param optimum Indicates the optimal numeric value.  
#' @param value Defines a default value which will be displayed in the element on page load.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_meter <- function(id = NULL, children = NULL, n_clicks = NULL, form = NULL, high = NULL, low = NULL, max = NULL, min = NULL, optimum = NULL, value = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, form=form, high=high, low=low, max=max, min=min, optimum=optimum, value=value, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'meter')
)
}
#' multicol component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_multicol <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'multicol')
)
}
#' nav component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_nav <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'nav')
)
}
#' nextid component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_nextid <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'nextid')
)
}
#' noembed component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_noembed <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'noembed')
)
}
#' noscript component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_noscript <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'noscript')
)
}
#' objectel component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param form Indicates the form that is the owner of the element.  
#' @param height Specifies the height of elements listed here. For all other elements, use the CSS height property.        Note: In some instances, such as <div>, this is a legacy attribute, in which case the CSS height property should be used instead.  
#' @param name Name of the element. For example used by the server to identify the fields in form submits.  
#' @param type Defines the type of the element.  
#' @param useMap   
#' @param width For the elements listed here, this establishes the element's width.        Note: For all other instances, such as <div>, this is a legacy attribute, in which case the CSS width property should be used instead.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_objectel <- function(id = NULL, children = NULL, n_clicks = NULL, form = NULL, height = NULL, name = NULL, type = NULL, useMap = NULL, width = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, form=form, height=height, name=name, type=type, useMap=useMap, width=width, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'objectel')
)
}
#' ol component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param reversed Indicates whether the list should be displayed in a descending order instead of a ascending.  
#' @param start Defines the first number if other than 1.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_ol <- function(id = NULL, children = NULL, n_clicks = NULL, reversed = NULL, start = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, reversed=reversed, start=start, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'ol')
)
}
#' optgroup component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param disabled Indicates whether the user can interact with the element.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_optgroup <- function(id = NULL, children = NULL, n_clicks = NULL, disabled = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, disabled=disabled, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'optgroup')
)
}
#' option component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param disabled Indicates whether the user can interact with the element.  
#' @param selected Defines a value which will be selected on page load.  
#' @param value Defines a default value which will be displayed in the element on page load.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_option <- function(id = NULL, children = NULL, n_clicks = NULL, disabled = NULL, selected = NULL, value = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, disabled=disabled, selected=selected, value=value, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'option')
)
}
#' output component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param htmlFor Describes elements which belongs to this one.  
#' @param form Indicates the form that is the owner of the element.  
#' @param name Name of the element. For example used by the server to identify the fields in form submits.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_output <- function(id = NULL, children = NULL, n_clicks = NULL, htmlFor = NULL, form = NULL, name = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, htmlFor=htmlFor, form=form, name=name, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'output')
)
}
#' p component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_p <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'p')
)
}
#' param component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param name Name of the element. For example used by the server to identify the fields in form submits.  
#' @param value Defines a default value which will be displayed in the element on page load.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_param <- function(id = NULL, children = NULL, n_clicks = NULL, name = NULL, value = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, name=name, value=value, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'param')
)
}
#' plaintext component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_plaintext <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'plaintext')
)
}
#' pre component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_pre <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'pre')
)
}
#' progress component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param form Indicates the form that is the owner of the element.  
#' @param max Indicates the maximum value allowed.  
#' @param value Defines a default value which will be displayed in the element on page load.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_progress <- function(id = NULL, children = NULL, n_clicks = NULL, form = NULL, max = NULL, value = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, form=form, max=max, value=value, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'progress')
)
}
#' q component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param cite Contains a URI which points to the source of the quote or change.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_q <- function(id = NULL, children = NULL, n_clicks = NULL, cite = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, cite=cite, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'q')
)
}
#' rp component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_rp <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'rp')
)
}
#' rt component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_rt <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'rt')
)
}
#' rtc component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_rtc <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'rtc')
)
}
#' ruby component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_ruby <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'ruby')
)
}
#' s component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_s <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 's')
)
}
#' samp component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_samp <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'samp')
)
}
#' script component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param async Indicates that the script should be executed asynchronously.  
#' @param charSet Declares the character encoding of the page or script.  
#' @param crossOrigin How the element handles cross-origin requests  
#' @param defer Indicates that the script should be executed after the page has been parsed.  
#' @param integrity Security Feature that allows browsers to verify what they fetch.     MDN Link  
#' @param src The URL of the embeddable content.  
#' @param type Defines the type of the element.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_script <- function(id = NULL, children = NULL, n_clicks = NULL, async = NULL, charSet = NULL, crossOrigin = NULL, defer = NULL, integrity = NULL, src = NULL, type = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, async=async, charSet=charSet, crossOrigin=crossOrigin, defer=defer, integrity=integrity, src=src, type=type, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'script')
)
}
#' section component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_section <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'section')
)
}
#' select component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param autoFocus The element should be automatically focused after the page loaded.  
#' @param disabled Indicates whether the user can interact with the element.  
#' @param form Indicates the form that is the owner of the element.  
#' @param multiple Indicates whether multiple values can be entered in an input of the type email or file.  
#' @param name Name of the element. For example used by the server to identify the fields in form submits.  
#' @param required Indicates whether this element is required to fill out or not.  
#' @param size Defines the width of the element (in pixels). If the element's type attribute is text or password then it's the number of characters.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_select <- function(id = NULL, children = NULL, n_clicks = NULL, autoFocus = NULL, disabled = NULL, form = NULL, multiple = NULL, name = NULL, required = NULL, size = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, autoFocus=autoFocus, disabled=disabled, form=form, multiple=multiple, name=name, required=required, size=size, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'select')
)
}
#' shadow component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_shadow <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'shadow')
)
}
#' slot component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_slot <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'slot')
)
}
#' small component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_small <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'small')
)
}
#' source component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param media Specifies a hint of the media for which the linked resource was designed.  
#' @param sizes   
#' @param src The URL of the embeddable content.  
#' @param type Defines the type of the element.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_source <- function(id = NULL, children = NULL, n_clicks = NULL, media = NULL, sizes = NULL, src = NULL, type = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, media=media, sizes=sizes, src=src, type=type, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'source')
)
}
#' spacer component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_spacer <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'spacer')
)
}
#' span component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_span <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'span')
)
}
#' strike component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_strike <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'strike')
)
}
#' strong component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_strong <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'strong')
)
}
#' sub component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_sub <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'sub')
)
}
#' summary component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_summary <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'summary')
)
}
#' sup component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_sup <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'sup')
)
}
#' table component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param summary   
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_table <- function(id = NULL, children = NULL, n_clicks = NULL, summary = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, summary=summary, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'table')
)
}
#' tbody component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_tbody <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'tbody')
)
}
#' td component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param colSpan The colspan attribute defines the number of columns a cell should span.  
#' @param headers IDs of the <th> elements which applies to this element.  
#' @param rowSpan Defines the number of rows a table cell should span over.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_td <- function(id = NULL, children = NULL, n_clicks = NULL, colSpan = NULL, headers = NULL, rowSpan = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, colSpan=colSpan, headers=headers, rowSpan=rowSpan, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'td')
)
}
#' template component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_template <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'template')
)
}
#' textarea component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param autoFocus The element should be automatically focused after the page loaded.  
#' @param cols Defines the number of columns in a textarea.  
#' @param disabled Indicates whether the user can interact with the element.  
#' @param form Indicates the form that is the owner of the element.  
#' @param maxLength Defines the maximum number of characters allowed in the element.  
#' @param minLength Defines the minimum number of characters allowed in the element.  
#' @param name Name of the element. For example used by the server to identify the fields in form submits.  
#' @param placeholder Provides a hint to the user of what can be entered in the field.  
#' @param readOnly Indicates whether the element can be edited.  
#' @param required Indicates whether this element is required to fill out or not.  
#' @param rows Defines the number of rows in a text area.  
#' @param wrap Indicates whether the text should be wrapped.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_textarea <- function(id = NULL, children = NULL, n_clicks = NULL, autoFocus = NULL, cols = NULL, disabled = NULL, form = NULL, maxLength = NULL, minLength = NULL, name = NULL, placeholder = NULL, readOnly = NULL, required = NULL, rows = NULL, wrap = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, autoFocus=autoFocus, cols=cols, disabled=disabled, form=form, maxLength=maxLength, minLength=minLength, name=name, placeholder=placeholder, readOnly=readOnly, required=required, rows=rows, wrap=wrap, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'textarea')
)
}
#' tfoot component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_tfoot <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'tfoot')
)
}
#' th component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param colSpan The colspan attribute defines the number of columns a cell should span.  
#' @param headers IDs of the <th> elements which applies to this element.  
#' @param rowSpan Defines the number of rows a table cell should span over.  
#' @param scope   
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_th <- function(id = NULL, children = NULL, n_clicks = NULL, colSpan = NULL, headers = NULL, rowSpan = NULL, scope = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, colSpan=colSpan, headers=headers, rowSpan=rowSpan, scope=scope, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'th')
)
}
#' thead component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_thead <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'thead')
)
}
#' time component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param dateTime Indicates the date and time associated with the element.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_time <- function(id = NULL, children = NULL, n_clicks = NULL, dateTime = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, dateTime=dateTime, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'time')
)
}
#' title component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_title <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'title')
)
}
#' tr component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_tr <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'tr')
)
}
#' track component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param default Indicates that the track should be enabled unless the user's preferences indicate something different.  
#' @param kind Specifies the kind of text track.  
#' @param label Specifies a user-readable title of the text track.  
#' @param src The URL of the embeddable content.  
#' @param srcLang   
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_track <- function(id = NULL, children = NULL, n_clicks = NULL, default = NULL, kind = NULL, label = NULL, src = NULL, srcLang = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, default=default, kind=kind, label=label, src=src, srcLang=srcLang, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'track')
)
}
#' tt component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_tt <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'tt')
)
}
#' u component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_u <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'u')
)
}
#' ul component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_ul <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'ul')
)
}
#' var component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_var <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'var')
)
}
#' video component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param autoPlay The audio or video should play as soon as possible.  
#' @param controls Indicates whether the browser should show playback controls to the user.  
#' @param crossOrigin How the element handles cross-origin requests  
#' @param height Specifies the height of elements listed here. For all other elements, use the CSS height property.        Note: In some instances, such as <div>, this is a legacy attribute, in which case the CSS height property should be used instead.  
#' @param loop Indicates whether the media should start playing from the start when it's finished.  
#' @param muted Indicates whether the audio will be initially silenced on page load.  
#' @param poster A URL indicating a poster frame to show until the user plays or seeks.  
#' @param preload Indicates whether the whole resource, parts of it or nothing should be preloaded.  
#' @param src The URL of the embeddable content.  
#' @param width For the elements listed here, this establishes the element's width.        Note: For all other instances, such as <div>, this is a legacy attribute, in which case the CSS width property should be used instead.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_video <- function(id = NULL, children = NULL, n_clicks = NULL, autoPlay = NULL, controls = NULL, crossOrigin = NULL, height = NULL, loop = NULL, muted = NULL, poster = NULL, preload = NULL, src = NULL, width = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, autoPlay=autoPlay, controls=controls, crossOrigin=crossOrigin, height=height, loop=loop, muted=muted, poster=poster, preload=preload, src=src, width=width, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'video')
)
}
#' wbr component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_wbr <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'wbr')
)
}
#' xmp component 
#' @description  
#' 
#' @export
#' @param id The ID of this component, used to identify dash components in callbacks. The ID needs to be unique across all of the components in an app.  
#' @param children The children of this component  
#' @param n_clicks An integer that represents the number of times that this element has been clicked on.  
#' @param accessKey Defines a keyboard shortcut to activate or add focus to the element.  
#' @param className Often used with CSS to style elements with common properties.  
#' @param contentEditable Indicates whether the element's content is editable.  
#' @param contextMenu Defines the ID of a <menu> element which will serve as the element's context menu.  
#' @param dir Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)  
#' @param draggable Defines whether the element can be dragged.  
#' @param hidden Prevents rendering of given element, while keeping child elements, e.g. script elements, active.  
#' @param lang Defines the language used in the element.  
#' @param spellCheck Indicates whether spell checking is allowed for the element.  
#' @param style Defines CSS styles which will override styles previously set.  
#' @param tabIndex Overrides the browser's default tab order and follows the one specified instead.  
#' @param title Text to be displayed in a tooltip when hovering over the element.  
#' @param fireEvent A callback for firing events to dash.  
#' @param dashEvents  
html_xmp <- function(id = NULL, children = NULL, n_clicks = NULL, accessKey = NULL, className = NULL, contentEditable = NULL, contextMenu = NULL, dir = NULL, draggable = NULL, hidden = NULL, lang = NULL, spellCheck = NULL, style = NULL, tabIndex = NULL, title = NULL, fireEvent = NULL, dashEvents = NULL) {
structure(
list(id=id, children=children, n_clicks=n_clicks, accessKey=accessKey, className=className, contentEditable=contentEditable, contextMenu=contextMenu, dir=dir, draggable=draggable, hidden=hidden, lang=lang, spellCheck=spellCheck, style=style, tabIndex=tabIndex, title=title, fireEvent=fireEvent, dashEvents=dashEvents),
class = c('component', 'html', 'xmp')
)
}
