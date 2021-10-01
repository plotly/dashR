const {dest, parallel, series, src} = require('gulp');
const print = require('gulp-print').default;
const fs = require('fs-extra');
const replace = require('gulp-replace');
const path = require('path');
const log = require('fancy-log');
const rename = require('gulp-rename');
const shell = require('shelljs');

// Task to git clone and build the component packages to retrieve build artifacts.
const retrieveAssets = async () => {
    const assetsPath = path.resolve(__dirname, 'gulp-assets');
    const packages = [
        'dash-core-components',
        'dash-html-components',
        'dash-table',
    ];

    shell.cd(assetsPath);
    shell.exec('git clone --depth=1 https://github.com/plotly/dash');
    shell.cd(path.resolve(assetsPath, 'dash'));
    shell.exec('npm i && npm run build');
    shell.exec(
        'pip install -r requires-dev.txt && pip install black && pip install -e .'
    );
    shell.mv(
        path.resolve(assetsPath, 'dash', 'components', '*'),
        path.resolve(assetsPath)
    );
    shell.cd(assetsPath);

    for (const element of packages) {
        shell.cd(path.resolve(assetsPath, element));
        shell.exec('npm run build');
    }
};

// Update the inst directories for each of the component packages.
function copyCoreInstDirectory() {
    if (
        fs.existsSync(
            path.resolve(__dirname, 'gulp-assets/dash-core-components/inst')
        )
    ) {
        return src([
            'gulp-assets/dash-core-components/inst/deps/**/*'
        ])
            .pipe(print())
            .pipe(dest('inst/deps/dcc', {overwrite: true}));
    }
    return log('Unable to find dash-core-components inst directory.');
}

function copyHtmlInstDirectory() {
    if (
        fs.existsSync(
            path.resolve(__dirname, 'gulp-assets/dash-html-components/inst')
        )
    ) {
        return src('gulp-assets/dash-html-components/inst/deps/**/*')
            .pipe(print())
            .pipe(dest('inst/deps/html', {overwrite: true}));
    }
    return log('Unable to find dash-html-components inst directory.');
}

function copyTableInstDirectory() {
    if (fs.existsSync(path.resolve(__dirname, 'gulp-assets/dash-table/inst'))) {
        return src([
            'gulp-assets/dash-table/inst/deps/**/*',
            '!gulp-assets/dash-table/inst/deps/index.html',
        ])
            .pipe(print())
            .pipe(dest('inst/deps/dash_table', {overwrite: true}));
    }
    return log('Unable to find dash-table `inst` directory.');
}

// Update the man directories for each of the component packages.
function copyCoreManDirectory() {
    if (
        fs.existsSync(
            path.relative(__dirname, 'gulp-assets/dash-core-components/man')
        )
    ) {
        return src([
            'gulp-assets/dash-core-components/man/**/*',
            '!gulp-assets/dash-core-components/man/*-package.Rd',
        ]).pipe(dest('man/', {overwrite: true}));
    }
    return log('Unable to find dash-core-components `man` directory.');
}

function copyHtmlManDirectory() {
    if (
        fs.existsSync(
            path.relative(__dirname, 'gulp-assets/dash-html-components/man')
        )
    ) {
        return src([
            'gulp-assets/dash-html-components/man/**/*',
            '!gulp-assets/dash-html-components/man/*-package.Rd',
        ]).pipe(dest('man/', {overwrite: true}));
    }
    return log('Unable to find dash-html-components `man` directory.');
}

function copyTableManDirectory() {
    if (fs.existsSync(path.relative(__dirname, 'gulp-assets/dash-table/man'))) {
        return src([
            'gulp-assets/dash-table/man/**/*',
            '!gulp-assets/dash-table/man/*-package.Rd',
        ]).pipe(dest('man/', {overwrite: true}));
    }
    return log('Unable to find dash-table `man` directory.');
}

// Update the R directories for each of the component packages.
function copyCoreRDirectory() {
    if (
        fs.existsSync(
            path.relative(__dirname, 'gulp-assets/dash-core-components/R')
        )
    ) {
        return src([
            'gulp-assets/dash-core-components/R/**/*',
            '!gulp-assets/dash-core-components/R/internal.R',
        ])
            .pipe(print())
            .pipe(dest('R/', {overwrite: true}));
    }
    return log('Unable to find dash-core-components `R` directory.');
}

function copyHtmlRDirectory() {
    if (
        fs.existsSync(
            path.relative(__dirname, 'gulp-assets/dash-html-components/R')
        )
    ) {
        return src([
            'gulp-assets/dash-html-components/R/**/*',
            '!gulp-assets/dash-html-components/R/internal.R',
        ])
            .pipe(print())
            .pipe(dest('R/', {overwrite: true}));
    }
    return log('Unable to find dash-html-components `R` directory.');
}

function copyTableRDirectory() {
    if (fs.existsSync(path.relative(__dirname, 'gulp-assets/dash-table/R'))) {
        return src([
            'gulp-assets/dash-table/R/**/*',
            '!gulp-assets/dash-table/R/internal.R',
        ])
            .pipe(print())
            .pipe(dest('R/', {overwrite: true}));
    }
    return log('Unable to find dash-core-components `R` directory.');
}

// Append the NAMESPACE for each of the component packages to the DashR NAMESPACE.
function appendCoreNamespace() {
    var namespace = fs
        .readFileSync('gulp-assets/dash-core-components/NAMESPACE')
        .toString()
        .split('\n');
    namespace.shift();
    namespace.unshift(
        '# dashCoreComponents exports appended by `npm unify` command: do not edit by hand'
    );
    namespace = namespace.join('\n');
    return src('gulp-assets/NAMESPACE.template')
        .pipe(print())
        .pipe(replace('{dcc_exports}', namespace))
        .pipe(rename('NAMESPACE'))
        .pipe(dest('./', {overwrite: true}));
}

function appendHtmlNamespace() {
    var namespace = fs
        .readFileSync('gulp-assets/dash-html-components/NAMESPACE')
        .toString()
        .split('\n');
    namespace.shift();
    namespace.unshift(
        '# dashHtmlComponents exports appended by `npm unify` command: do not edit by hand'
    );
    namespace = namespace.join('\n');
    return src('./NAMESPACE')
        .pipe(print())
        .pipe(replace('{html_exports}', namespace))
        .pipe(dest('./', {overwrite: true}));
}

function appendTableNamespace() {
    var namespace = fs
        .readFileSync('gulp-assets/dash-table/NAMESPACE')
        .toString()
        .split('\n');
    namespace.shift();
    namespace.push('export(df_to_list)');
    namespace.unshift(
        '# dashTable exports appended by `npm unify` command: do not edit by hand'
    );
    namespace = namespace.join('\n');
    return src('./NAMESPACE')
        .pipe(print())
        .pipe(replace('{table_exports}', namespace))
        .pipe(dest('./', {overwrite: true}));
}

// Append the internal.R for each of the component packages to the DashR internal.R.
function appendCoreInternal() {
    return src('gulp-assets/internal.template')
        .pipe(print())
        .pipe(
            replace(
                '{dcc_deps}',
                fs.readFileSync('gulp-assets/dash-core-components/R/internal.R')
            )
        )
        .pipe(rename('internal.R'))
        .pipe(dest('R/', {overwrite: true}));
}

function appendHtmlInternal() {
    return src('R/internal.R')
        .pipe(print())
        .pipe(
            replace(
                '{html_deps}',
                fs.readFileSync('gulp-assets/dash-html-components/R/internal.R')
            )
        )
        .pipe(dest('R/', {overwrite: true}));
}

function appendTableInternal() {
    return src('R/internal.R')
        .pipe(print())
        .pipe(
            replace(
                '{table_deps}',
                fs.readFileSync('gulp-assets/dash-table/R/internal.R')
            )
        )
        .pipe(dest('R/', {overwrite: true}));
}

// Point dependency sourcing to Dash package.
function replacePackageDependency() {
    return src('R/internal.R')
        .pipe(print())
        .pipe(replace(/package = "dashCoreComponents"/g, 'package = "dash"'))
        .pipe(replace(/package = "dashHtmlComponents"/g, 'package = "dash"'))
        .pipe(replace(/package = "dashTable"/g, 'package = "dash"'))
        .pipe(replace(/name = "dcc\//g, 'name = "'))
        .pipe(replace(/`dash_core_components.+name\s=\s.+",$/gm, '`dash_core_components` = structure(list(name = "dash_core_components",'))
        .pipe(replace(/`dcc\/dash_core_components.+name\s=\s.+",$/gm, '`dash_core_components` = structure(list(name = "dash_core_components",'))
        .pipe(replace(/`html\/dash_html_components.+name\s=\s.+",$/gm, '`dash_html_components` = structure(list(name = "dash_html_components",'))
        .pipe(replace(/`dash_table.+name\s=\s.+",$/gm, '`dash_table` = structure(list(name = "dash_table",'))
        .pipe(dest('R/'));
}

// Task to clean build artifacts from gulp-assets
const cleanAssets = async () => {
    const assetsPath = path.resolve(__dirname, 'gulp-assets');
    shell.cd(assetsPath);
    shell.exec(
        'rm -rfv dash-core-components dash-html-components dash-table dash'
    );
};

exports.unify = series(
    parallel(
        copyCoreInstDirectory,
        copyHtmlInstDirectory,
        copyTableInstDirectory
    ),
    parallel(copyCoreManDirectory, copyHtmlManDirectory, copyTableManDirectory),
    parallel(copyCoreRDirectory, copyHtmlRDirectory, copyTableRDirectory)
);

exports.update = series(
    appendCoreNamespace,
    appendHtmlNamespace,
    appendTableNamespace,
    appendCoreInternal,
    appendHtmlInternal,
    appendTableInternal,
    replacePackageDependency
);

exports.clone = series(retrieveAssets);

exports.test = series(replacePackageDependency)

exports.clean = series(cleanAssets);
