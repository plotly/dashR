# Change Log for Dash for R
All notable changes to `dash` will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [1.0.0] - 2021-10-04
### Added
- Dash layout wrapper functions are included, which simplify the layout syntax for writing Dash apps. This includes the ability to pipe in the `app` object to layout and meta functions, as well as tags which simplify `html` component arguments and children. [#265](https://github.com/plotly/dashR/pull/265)

- Added simplified and flexible callbacks with the `add_callback` helper function. Included in this change are multiple additional helper functions to simplify Dash app configuration and tag usage. [#270](https://github.com/plotly/dashR/pull/270)

### Changed
- Unified the core Dash packages (dash, dashCoreComponents, dashHtmlComponents, dashTable) for streamlined maintenance and accessibility. The namespaces of these packages will be combined under the `dash` namespace, and all artifacts from the ancillary dash packages will be included with Dash for R. [#243](https://github.com/plotly/dashr/pull/243)

### Fixed
- Minor fix for favicon issue continued from [#240](https://github.com/plotly/dashr/pull/240) (for more details, see [#243](https://github.com/plotly/dashR/pull/243#issuecomment-842813526)).
- Minor fix to enable `suppress_callback_exceptions` configuration option when creating a Dash app. [#268](https://github.com/plotly/dashr/pull/268)


## [0.9.1] - 2020-11-16
### Fixed
- A regression which prevented favicons from displaying properly has been resolved, and a default Dash favicon is now supplied when none is provided in the `assets` directory. [#240](https://github.com/plotly/dashr/pull/240)

## [0.9.0] - 2020-10-31
### Fixed
- Fixes a minor bug in `setCallbackContext` (described in [#236](https://github.com/plotly/dashR/issues/236)) which prevented pattern-matching callbacks from working properly if one or more `input` statements did not include a selector. [#237](https://github.com/plotly/dashR/pull/237)

### Changed

- Dash for R now depends on v1.1.1 of `dashHtmlComponents`
- Dash for R now depends on v1.13.0 of `dashCoreComponents`
- Dash for R now depends on v4.11.0 of `dashTable`
- `dash-renderer` version is now v1.8.3

## [0.8.0] - 2020-10-27
### Fixed
- Usage of `glue` has been corrected to address [#232](https://github.com/plotly/dashR/issues/232) via [#233](https://github.com/plotly/dashR/pull/233).

### Added
- Pattern-matching IDs and callbacks. Component IDs can be lists, and callbacks can reference patterns of components, using three different wildcards: `ALL`, `MATCH`, and `ALLSMALLER`. This lets you create components on demand, and have callbacks respond to any and all of them. To help with this, `app$callback_context` gets three new entries: `outputs_list`, `inputs_list`, and `states_list`, which contain all the ids, properties, and except for the outputs, the property values from all matched components. [#228](https://github.com/plotly/dashR/pull/228)
- New and improved callback graph in the debug menu. Now based on Cytoscape for much more interactivity, plus callback profiling including number of calls, fine-grained time information, bytes sent and received, and more. You can even add custom timing information on the server with `callback_context.record_timing(name, duration, description)` [#224](https://github.com/plotly/dashR/pull/224)
- Support for setting attributes on `external_scripts` and `external_stylesheets`, and validation for the parameters passed (attributes are verified, and elements that are lists themselves must be named). [#226](https://github.com/plotly/dashR/pull/226)
- Dash for R now supports user-defined routes and redirects via the `app$server_route` and `app$redirect` methods. [#225](https://github.com/plotly/dashR/pull/225)

### Changed
- `dash-renderer` updated to v1.8.2

## [0.7.1] - 2020-07-30
### Fixed
- Fixes a minor bug in debug mode that prevented display of user-defined error messages when induced by invoking the `stop` function. [#220](https://github.com/plotly/dashR/pull/220).
- URLs for unpkg.com for dash-renderer were outdated, and now fetch v1.6.0 also; `dash-renderer` v1.5.1 has been removed from `inst/lib`.

## [0.7.0] - 2020-07-28
### Added
- Dash for R now supports an `update_title` parameter, as in Dash for Python. [#218](https://github.com/plotly/dashR/pull/218)

### Changed
- `dash-renderer` updated to v1.6.0
- Dash for R now depends on v4.9.0 of `dashTable` (provides several fixes from [#806](https://github.com/plotly/dash-table/pull/806), [#808](https://github.com/plotly/dash-table/pull/808) and [#809](https://github.com/plotly/dash-table/pull/809)) and v1.10.2 of `dashCoreComponents` (which updates Plotly.js to 1.54.7 via [#835](https://github.com/plotly/dash-core-components/pull/835)).

### Removed
- Dash for R no longer produces a warning when callbacks with no IDs are declared; see [#216](https://github.com/plotly/dashR/pull/216).

## [0.6.3] - 2020-06-25
### Changed
- `dash-renderer` updated to v1.5.1

### Fixed
- Resolves a regression that prevented multiple loading states from displaying concurrently when a callback updates multiple outputs (for more details, see [#1310](https://github.com/plotly/dash/pull/1310)).

## [0.6.2] - 2020-06-19
### Fixed
- Dash for R now depends on v4.8.1 of `dashTable`, which fixes a bug where headers are unaligned with columns following an update (for more details, see [#797](https://github.com/plotly/dash-table/issues/797)).

## [0.6.1] - 2020-06-17
### Fixed
- Dash for R now depends on v1.10.1 of `dashCoreComponents`, which provides v1.54 of Plotly.js (for more details, see [CHANGELOG.md](https://github.com/plotly/plotly.js/blob/master/CHANGELOG.md)).

## [0.6.0] - 2020-06-17
### Changed
- Dash for R now depends on v4.8.0 of `dashTable`, which incorporates changes and bug fixes summarized in <https://github.com/plotly/dash-table/pull/787>, <https://github.com/plotly/dash-table/pull/785>, and <https://github.com/plotly/dash-table/pull/793>.

## [0.5.0] - 2020-05-28
### Added
- Dash for R now depends on the `brotli` package explicitly; previously it was loaded when importing `reqres`. [#204](https://github.com/plotly/dashR/pull/204)

### Changed
- Dash for R no longer wraps the layout in an `htmlDiv` internally, for parity with Dash for Python. Starting in v0.5.0, the `layout` method only accepts a single argument, and that argument must be a Dash component or a function that returns a Dash component. [#121](https://github.com/plotly/dashR/pull/121)
- Package documentation has been significantly refactored to use new features of `roxygen2` when documenting R6 classes
- The `title` method now specifies `Dash` as the default application title instead of `dash`. [#200](https://github.com/plotly/dashR/pull/200)

### Fixed
- A minor bug in `validate_keys` which prevented `interpolate_index` from working as intended has been resolved

## [0.4.1] - 2020-05-08
### Fixed
- Callbacks with multiple outputs which return one or more components are now permitted; a bug previously prevented their use, fixed in [#198](https://github.com/plotly/dashR/pull/198)

## [0.4.0] - 2020-05-05
### Added
- Support for inline clientside callbacks in JavaScript [#140](https://github.com/plotly/dashR/pull/140)
- Support for arbitrary file extensions for assets within component libraries [#186](https://github.com/plotly/dashR/pull/186)
- Dash for R now provides a `show_undo_redo` parameter as in Dash for Python [#194](https://github.com/plotly/dashR/pull/194)

### Changed
- `dash-renderer` updated to v1.4.1 [#195](https://github.com/plotly/dashR/pull/195)
- `dashHtmlComponents` updated to v1.0.3
- `dashCoreComponents` updated to v1.10.0
- `dashTable` updated to v4.7.0

## [0.3.1] - 2020-02-14
### Fixed
- License file in `dashHtmlComponents` now loads properly when installing Dash for R on systems running Microsoft Windows [#150](https://github.com/plotly/dash-html-components/pull/150)

## [0.3.0] - 2020-02-12
### Added
- Support for config-aware relative paths [#172](https://github.com/plotly/dashR/pull/172)
- Support index customization and index templates [#168](https://github.com/plotly/dashR/pull/168)
- Application titles may be set using the `app$title()` method, for parity with Dash for Python's `app.title` syntax [#168](https://github.com/plotly/dashR/pull/168)

### Changed
- Dash for R now requires `dashCoreComponents` v1.8.0
- Dash for R now requires `dashTable` v4.6.0
- Automatically set routes and requests pathname prefixes if `DASH_APP_NAME` environment variable has been set [#165](https://github.com/plotly/dashR/pull/165)

### Deprecated
- Application titles can no longer be set using `name` parameter, which is now deprecated with a warning, for parity with Dash for Python [#168](https://github.com/plotly/dashR/pull/168)
- Removed `DASH_HOST` and `DASH_PORT`, Dash for R now respects `HOST` and `PORT` [#167](https://github.com/plotly/dashR/pull/167)

## [0.2.0] - 2020-01-03
### Added
- Support for asynchronous/dynamic loading of dependencies, resource caching, and asset fingerprinting [#157](https://github.com/plotly/dashR/pull/157)
- Compression of text resources using `brotli`, `gzip`, or `deflate` [#157](https://github.com/plotly/dashR/pull/157)
- Support for adding `<meta>` tags to index [#142](https://github.com/plotly/dashR/pull/142)
- Hot reloading now supported in debug mode [#127](https://github.com/plotly/dashR/pull/127)
- Support for displaying Dash for R applications within RStudio's viewer pane when `use_viewer = TRUE`
- Clientside callbacks written in JavaScript are now supported [#130](https://github.com/plotly/dashR/pull/130)
- Multiple outputs are now supported [#119](https://github.com/plotly/dashR/pull/119)
- Selective callback updates to properties now supported with `dashNoUpdate()` [#111](https://github.com/plotly/dashR/pull/111)
- Additional line number context inserted when available within stack traces [#133](https://github.com/plotly/dashR/pull/133)
- Integration and unit tests are now performed when commits are made to open pull requests
- Support returning asset URLs via `app$get_asset_url` when app is loaded via `source()` or `APP_ROOT_PATH` environment variable is defined [#160](https://github.com/plotly/dashR/pull/160)
- `url_base_pathname` added; mimics functionality in Dash for Python, sets defaults for `routes_pathname_prefix` and `requests_pathname_prefix` when not otherwise provided [#161](https://github.com/plotly/dashR/pull/161)

### Changed
- `dash-renderer` updated to v1.2.2 [#137](https://github.com/plotly/dashR/pull/137)
- Dash for R no longer requires forked `reqres`, patch applied upstream [thomasp85/reqres#9](https://github.com/thomasp85/reqres/pull/9)
- The `pruned_errors` parameter has been renamed to `dev_tools_prune_errors` [#113](https://github.com/plotly/dashR/pull/113)

### Fixed
- Stack traces now display properly within viewer pane when `debug = TRUE` and `use_viewer = TRUE` [#137](https://github.com/plotly/dashR/pull/137)
- Patch for `reqres` package to handle cookies containing multiple "=" [#122](https://github.com/plotly/dashR/pull/122)
- Handling for user-defined errors in callbacks implemented [#116](https://github.com/plotly/dashR/pull/116)
- Fixes for hot reloading interval handling and refreshing apps within viewer pane [#148](https://github.com/plotly/dashR/pull/148)
- `get_asset_url` checks `getAppPath()` as well as `DASH_APP_ROOT_PATH` environment variable when invoked [#161](https://github.com/plotly/dashR/pull/161)

## [0.1.0] - 2019-07-10
### Added
- Initial release
    - Support for `plot_ly` and `ggplotly` "subplots" [#84](https://github.com/plotly/dashR/pull/84)
    - Improved debugging support [#87](https://github.com/plotly/dashR/pull/87), including Dash Dev Tools and `debug` mode
    - Provide a useful warning message when JS dependencies cannot be found [#81](https://github.com/plotly/dashR/pull/81)
    - Support for externalized PropTypes introduced
    - Support for `callback_context` added
    - Options to set `dev_tools_ui` and `dev_tools_props_check` added

### Changed
- Package renamed from `dashR` to `dash` [#93](https://github.com/plotly/dashR/pull/93)
- Dash dependencies are now identified by crawling attached package namespaces for metadata
- `dash_renderer` updated to 0.23.0

### Removed
- `filter_null` has been excised and its logic integrated into generated components
- `assert_valid_wildcards` has been relocated into generated component libraries, and only for those which support wildcards

### Fixed
- CSS dependencies are now properly loaded [#94](https://github.com/plotly/dashR/pull/94)

## [0.0.7] - 2019-04-09
### Removed
- `dependencies_set`, `dependencies_get`, and `dependencies_get_internal` methods removed from package

### [0.0.6] - 2019-04-08
### Added
- Local asset serving implemented [#64](https://github.com/plotly/dashR/pull/64)

### [0.0.5] - 2019-04-01
### Added
- Support for direct import of `plot_ly` and `ggplotly` figures [#71](https://github.com/plotly/dashR/pull/71)

### Changed
- `layout_set` method renamed to `layout` for parity with Dash for Python

### [0.0.4] - 2019-03-14
### Added
- Support for externally hosted CSS via `external_stylesheets`
- Validation of dependencies prior to construction of package map [#57](https://github.com/plotly/dashR/pull/57)
- Inspect local environment variables to set routing and request prefixes, add `get_package_mapping` to retrieve
  dependency map, introduce "catchall" handler, `_dash-component-suites` handler [#53](https://github.com/plotly/dashR/pull/53)

### Removed
- Eliminated `resolve_dependencies` and `register_dependencies`
- Tags now constructed internally, rather than using `htmltools`

### Fixed
- Bug preventing remotely hosted JS resolved
- Local serving of dependencies fixed when `href` attributes also present

### [0.0.3] - 2019-03-08
### Added
- `assert_valid_callbacks` to validate callback handler definitions and ordering of `input` and `state` using
  new `valid_seq` function

### Changed
- Callback method and handling refactored to match current Dash for Python API [#51](https://github.com/plotly/dashR/pull/51)
- Handler function for callbacks now passed via `func` argument to `app$callback()`
- `dash_renderer` updated to v0.18.0

### [0.0.0.9000] - 2018-07-25
- Initial development version
