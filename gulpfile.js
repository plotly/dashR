const {dest, parallel, series, src} = require('gulp');
const del = require('del');
const mkdirp = require('mkdirp');
const footer = require('gulp-footer');
const print = require('gulp-print').default;
const fs = require('fs-extra');
const replace = require('gulp-replace')

// Copy the inst directories for each of the component packages.
function copyCoreInstDirectory() {
  return src('gulp-assets/dash-core-components/inst/**/*')
    .pipe(print())
    .pipe(dest('inst/'));
}

function copyHtmlInstDirectory() {
  return src('gulp-assets/dash-html-components/inst/**/*')
    .pipe(print())
    .pipe(dest('inst/'));
}

function copyTableInstDirectory() {
  return src('gulp-assets/dash-table/inst/**/*')
    .pipe(print())
    .pipe(dest('inst/'));
}

// Copy the man directories for each of the component packages.
function copyCoreManDirectory() {
  return src('gulp-assets/dash-core-components/man/**/*')
    .pipe(dest('man/'));
}

function copyHtmlManDirectory() {
  return src('gulp-assets/dash-html-components/man/**/*')
    .pipe(dest('man/'));
}

function copyTableManDirectory() {
  return src('gulp-assets/dash-table/man/**/*')
    .pipe(dest('man/'));
}

// Copy the R directories for each of the component packages.
function copyCoreRDirectory() {
  return src(['gulp-assets/dash-core-components/R/**/*', '!gulp-assets/dash-core-components/R/internal.R'])
    .pipe(print())
    .pipe(dest('R/'));
}

function copyHtmlRDirectory() {
  return src(['gulp-assets/dash-html-components/R/**/*', '!gulp-assets/dash-html-components/R/internal.R'])
    .pipe(print())
    .pipe(dest('R/'));
}

function copyTableRDirectory() {
  return src(['gulp-assets/dash-table/R/**/*', '!gulp-assets/dash-table/R/internal.R'])
    .pipe(print())
    .pipe(dest('R/'));
}

// Append the NAMESPACE for each of the component packages to the DashR NAMESPACE.
function appendCoreNamespace() {
  var namespace = fs.readFileSync('gulp-assets/dash-core-components/NAMESPACE').toString().split('\n');
  namespace.shift();
  namespace = namespace.join('\n')
  return src('./NAMESPACE')
    .pipe(print())
    .pipe(footer("# dashCoreComponents exports appended by `npm unify` command: do not edit by hand\n"))
    .pipe(footer(namespace))
    .pipe(dest('.', { overwrite: true }));
}

function appendHtmlNamespace() {
  var namespace = fs.readFileSync('gulp-assets/dash-html-components/NAMESPACE').toString().split('\n');
  namespace.shift();
  namespace = namespace.join('\n')
  return src('./NAMESPACE')
    .pipe(print())
    .pipe(footer("# dashHtmlComponents exports appended by `npm unify` command: do not edit by hand\n"))
    .pipe(footer(namespace))
    .pipe(dest('.', { overwrite: true }));
}

function appendTableNamespace() {
  var namespace = fs.readFileSync('gulp-assets/dash-table/NAMESPACE').toString().split('\n');
  namespace.shift();
  namespace = namespace.join('\n')
  return src('./NAMESPACE')
    .pipe(print())
    .pipe(footer("# dashTable exports appended by `npm unify` command: do not edit by hand\n"))
    .pipe(footer(namespace))
    .pipe(dest('.', { overwrite: true }));
}


// Append the internal.R for each of the component packages to the DashR internal.R.
function appendCoreInternal() {
  return src('R/internal.R')
    .pipe(print())
    .pipe(footer("# dashCoreComponents metadata appended by `npm unify` command\n"))
    .pipe(footer(fs.readFileSync('gulp-assets/dash-core-components/R/internal.R')))
    .pipe(dest('R/', { overwrite : true }));
}

function appendHtmlInternal() {
  return src('R/internal.R')
    .pipe(print())
    .pipe(footer("# dashHtmlComponents metadata appended by `npm unify` command\n"))
    .pipe(footer(fs.readFileSync('gulp-assets/dash-html-components/R/internal.R')))
    .pipe(dest('R/', { overwrite: true }));
}

function appendTableInternal() {
  return src('R/internal.R')
    .pipe(print())
    .pipe(footer("# dashTable metadata appended by `npm unify` command\n"))
    .pipe(footer(fs.readFileSync('gulp-assets/dash-table/R/internal.R')))
    .pipe(dest('R/', { overwrite: true }));
}

// Remove component package imports from NAMESPACE.
function replaceComponentImports() {
  return src('./NAMESPACE')
    .pipe(print())
    .pipe(replace(/import\(dashCoreComponents\)\n/, '#import(dashCoreComponents)'))
    .pipe(replace(/import\(dashHtmlComponents\)\n/, '#import(dashHtmlComponents)'))
    .pipe(dest('.'));
}

// Remove component package imports and collate from DESCRIPTION.
function replaceDescriptionImports() {
  return src('./DESCRIPTION')
    .pipe(print())
    .pipe(replace(/  dashHtmlComponents \(== \d+.\d+.\d+\),\n/, ''))
    .pipe(replace(/  dashCoreComponents \(== \d+.\d+.\d+\),\n/, ''))
    .pipe(replace(/  dashTable \(== \d+.\d+.\d+\),\n/, ''))
    .pipe(replace(/Collate:/, '#Collate:'))
    .pipe(dest('.'));
}

// Point dependency sourcing to Dash package.
function replacePackageDependency() {
  return src('R/internal.R')
    .pipe(print())
    .pipe(replace(/package = "dashCoreComponents"/g, 'package = "dash"'))
    .pipe(replace(/package = "dashHtmlComponents"/g, 'package = "dash"'))
    .pipe(replace(/package = "dashTable"/g, 'package = "dash"'))
    .pipe(dest('R/'));
}

// Remove require(dash) from all examples.
function removeRequireDash() {
  return src('./**/*')
    .pipe(replace(/&& require\(dash\)/g, ''))
    .pipe(dest('.'));
}


// Clean unification changes from DESCRIPTION.
function cleanDescriptionImports() {
  return src('./DESCRIPTION')
    .pipe(print())
    .pipe(replace(/Imports:/, 'Imports:\n  dashHtmlComponents (== 1.1.1),\n  dashCoreComponents (== 1.13.0),\n  dashTable (== 4.11.0),'))
    .pipe(replace(/#Collate:/, 'Collate:'))
    .pipe(dest('.'));
}

// Clean unification changes from internal.R.
function cleanInternal() {
  return src('R/internal.R')
    .pipe(print())
    .pipe(replace(/# dashCoreComponents metadata.*/s, ''))
    .pipe(dest('R/'));
}

// Clean component function files from R directory.
function cleanR() {
  return del([
    'R/(dcc|html|dashDataTable)*.R',
    'man/(dcc|html|dashCoreComponents|dashHtmlComponents|dashDataTable|dashTable)*.Rd'
  ]);
}


exports.unify = series(
  parallel(
    copyCoreInstDirectory,
    copyHtmlInstDirectory,
    copyTableInstDirectory
  ),
  parallel(
    copyCoreManDirectory,
    copyHtmlManDirectory,
    copyTableManDirectory
  ),
  parallel(
    copyCoreRDirectory,
    copyHtmlRDirectory,
    copyTableRDirectory
  ),
  appendCoreNamespace,
  appendHtmlNamespace,
  appendTableNamespace,
  replaceComponentImports,
  appendCoreInternal,
  appendHtmlInternal,
  appendTableInternal,
  replacePackageDependency,
  replaceDescriptionImports,
  removeRequireDash
);

exports.clean = series(
  cleanNamespace,
  cleanInternal,
  cleanR,
  cleanDescriptionImports
);
