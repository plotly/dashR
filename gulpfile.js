const {dest, parallel, series, src} = require('gulp');
const del = require('del');
const mkdirp = require('mkdirp');
const rename = require('gulp-rename');
const footer = require('gulp-footer');
const simpleGit = require('simple-git');

const git = simpleGit();

function loadCoreComponents() {
  mkdirp.sync('lib');
  return del(['lib/*']);
}

function copyInstDirectory() {
  return src('gulp-assets/dash-core-components/inst/*')
    .pipe(src('gulp-assets/dash-html-components/inst/*'))
    .pipe(dest('inst/'));
}

exports.loadDashFiles = series(loadCoreComponents);
