# Change Log for Dash for R
All notable changes to this project will be documented in this file.

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