const {dest, parallel, series, src} = require('gulp');
const del = require('del');
const mkdirp = require('mkdirp');
const footer = require('gulp-footer');
const print = require('gulp-print').default;
const fs = require('fs-extra');
const replace = require('gulp-replace');
const path = require('path');
const log = require('fancy-log');

//TODO: Add job to git clone and build the component packages to retrieve build artifacts.

// Update the inst directories for each of the component packages.
function copyCoreInstDirectory() {
    if (
        fs.existsSync(
            path.resolve(__dirname, 'gulp-assets/dash-core-components/inst')
        )
    ) {
        return src('gulp-assets/dash-core-components/inst/**/*')
            .pipe(print())
            .pipe(dest('inst/'));
    } else {
        return log('Unable to find dash-core-components inst directory.');
    }
}

function copyHtmlInstDirectory() {
  if (
    fs.existsSync(
        path.resolve(__dirname, 'gulp-assets/dash-html-components/inst')
    )
    ) {
        return src('gulp-assets/dash-html-components/inst/**/*')
            .pipe(print())
            .pipe(dest('inst/'));
    } else {
        return log('Unable to find dash-html-components inst directory.');
    }
}

function copyTableInstDirectory() {
  if (
        fs.existsSync(
            path.resolve(__dirname, 'gulp-assets/dash-table/inst')
        )
    ) {
        return src('gulp-assets/dash-table/**/*')
            .pipe(print())
            .pipe(dest('inst/'));
    } else {
        return log('Unable to find dash-table `inst` directory.');
    }
}

// Update the man directories for each of the component packages.
function copyCoreManDirectory() {
    if (
      fs.existsSync(
        path.relative(__dirname, 'gulp-assets/dash-core-components/man')
      )
    ) {
      return src(['gulp-assets/dash-core-components/man/**/*', '!gulp-assets/dash-core-components/man/*-package.Rd']).pipe(dest('man/'));
    } else {
      return log('Unable to find dash-core-components `man` directory.')
    }
}

function copyHtmlManDirectory() {
  if (
    fs.existsSync(
      path.relative(__dirname, 'gulp-assets/dash-html-components/man')
    )
  ) {
    return src(['gulp-assets/dash-html-components/man/**/*', '!gulp-assets/dash-html-components/man/*-package.Rd']).pipe(dest('man/'));
  } else {
    return log('Unable to find dash-html-components `man` directory.')
  }
}

function copyTableManDirectory() {
  if (
    fs.existsSync(
      path.relative(__dirname, 'gulp-assets/dash-table/man')
    )
  ) {
    return src(['gulp-assets/dash-table/man/**/*', '!gulp-assets/dash-table/man/*-package.Rd']).pipe(dest('man/'));
  } else {
    return log('Unable to find dash-table `man` directory.')
  }
}

// Update the R directories for each of the component packages.
function copyCoreRDirectory() {
    if (fs.existsSync(
      path.relative(__dirname, 'gulp-assets/dash-core-components/R')
    )) {
      return src([
        'gulp-assets/dash-core-components/R/**/*',
        '!gulp-assets/dash-core-components/R/internal.R',
    ])
        .pipe(print())
        .pipe(dest('R/'));
    } else {
      return log('Unable to find dash-core-components `R` directory.')
    }
}

function copyHtmlRDirectory() {
  if (fs.existsSync(
    path.relative(__dirname, 'gulp-assets/dash-html-components/R')
  )) {
    return src([
      'gulp-assets/dash-html-components/R/**/*',
      '!gulp-assets/dash-html-components/R/internal.R',
  ])
      .pipe(print())
      .pipe(dest('R/'));
  } else {
    return log('Unable to find dash-html-components `R` directory.')
  }
}

function copyTableRDirectory() {
  if (fs.existsSync(
    path.relative(__dirname, 'gulp-assets/dash-table/R')
  )) {
    return src([
      'gulp-assets/dash-table/R/**/*',
      '!gulp-assets/dash-table/R/internal.R',
  ])
      .pipe(print())
      .pipe(dest('R/'));
  } else {
    return log('Unable to find dash-core-components `R` directory.')
  }
}

// Append the NAMESPACE for each of the component packages to the DashR NAMESPACE.
function appendCoreNamespace() {
    var namespace = fs
        .readFileSync('gulp-assets/dash-core-components/NAMESPACE')
        .toString()
        .split('\n');
    namespace.shift();
    namespace.unshift('# dashCoreComponents exports appended by `npm unify` command: do not edit by hand\n')
    namespace = namespace.join('\n');
    return src('gulp-assets/NAMESPACE.template')
        .pipe(print())
        .pipe(
            replace("{dcc_exports}", namespace)
        )
        .pipe(dest('./NAMESPACE', {overwrite: true}));
}

function appendHtmlNamespace() {
    var namespace = fs
        .readFileSync('gulp-assets/dash-html-components/NAMESPACE')
        .toString()
        .split('\n');
    namespace.shift();
    namespace.unshift('# dashHtmlComponents exports appended by `npm unify` command: do not edit by hand\n')
    namespace = namespace.join('\n');
    return src('./NAMESPACE')
        .pipe(print())
        .pipe(
            replace("{html_exports}", namespace)
        )
        .pipe(dest('./NAMESPACE', {overwrite: true}));
}

function appendTableNamespace() {
    var namespace = fs
        .readFileSync('gulp-assets/dash-table/NAMESPACE')
        .toString()
        .split('\n');
    namespace.shift();
    namespace.unshift('# dashTable exports appended by `npm unify` command: do not edit by hand\n')
    namespace = namespace.join('\n');
    return src('./NAMESPACE')
        .pipe(print())
        .pipe(
            replace("{table_exports}", namespace)
        )
        .pipe(dest('./NAMESPACE', {overwrite: true}));
}

// Append the internal.R for each of the component packages to the DashR internal.R.
function appendCoreInternal() {
    return src('gulp-assets/internal.template')
        .pipe(print())
        .pipe(
            replace("{dcc_deps}", fs.readFileSync('gulp-assets/dash-core-components/R/internal.R'))
        )
        .pipe(dest('R/internal.R', {overwrite: true}));
}

function appendHtmlInternal() {
    return src('R/internal.R')
        .pipe(print())
        .pipe(
            replace("{html_deps}", fs.readFileSync('gulp-assets/dash-html-components/R/internal.R'))
        )
        .pipe(dest('R/internal.R', {overwrite: true}));
}

function appendTableInternal() {
    return src('R/internal.R')
        .pipe(print())
        .pipe(
            replace("{table_deps}", fs.readFileSync('gulp-assets/dash-table/R/internal.R'))
        )
        .pipe(dest('R/internal.R', {overwrite: true}));
}


exports.unify = series(
    parallel(
        copyCoreInstDirectory,
        copyHtmlInstDirectory,
        copyTableInstDirectory
    ),
    parallel(copyCoreManDirectory, copyHtmlManDirectory, copyTableManDirectory),
    parallel(copyCoreRDirectory, copyHtmlRDirectory, copyTableRDirectory)
);

exports.updateNamespace = series(
    appendCoreNamespace,
    appendHtmlNamespace,
    appendTableNamespace,
    appendCoreInternal,
    appendHtmlInternal,
    appendTableInternal
);
