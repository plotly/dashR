# Change Log for Dash for R
All notable changes to this project will be documented in this file.

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
