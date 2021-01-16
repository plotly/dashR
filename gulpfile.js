const {dest, parallel, series, src} = require('gulp');
const del = require('del');
const mkdirp = require('mkdirp');
const rename = require('gulp-rename');
const footer = require('gulp-footer');