const {dest, parallel, series, src} = require('gulp');
const print = require('gulp-print').default;
const replace = require('gulp-replace');
const rename = require('gulp-rename');
const concat = require('gulp-concat');
const fs = require('fs-extra');
const path = require('path');
const log = require('fancy-log');
const shell = require('shelljs');

// Task to git clone and build the component packages to retrieve build artifacts.
const retrieveAssets = async () => {
    const assetsPath = path.resolve(__dirname, 'gulp-assets');
    const packages = [
        'dash-core-components',
        'dash-html-components',
        'dash-table',
        'dash-bootstrap-components',
    ];

    shell.cd(assetsPath);
    shell.exec('git clone --single-branch --branch fix-prop-order https://github.com/plotly/dash');
    shell.exec(
        'git clone https://github.com/facultyai/dash-bootstrap-components && cd dash-bootstrap-components && npm i && pip install -r requirements-dev.txt && cd ../'
    );
    shell.cd(path.resolve(assetsPath, 'dash'));
    shell.exec('npm i && npm run build');
    shell.exec(
        'pip install -r requires-dev.txt -r requires-ci.txt && pip install -e .'
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
        return src(['gulp-assets/dash-core-components/inst/deps/**/*'])
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

function copyBootstrapInstDirectory() {
    if (
        fs.existsSync(
            path.resolve(
                __dirname,
                'gulp-assets/dash-bootstrap-components/inst'
            )
        )
    ) {
        return src(['gulp-assets/dash-bootstrap-components/inst/deps/**/*'])
            .pipe(print())
            .pipe(dest('inst/deps', {overwrite: true}));
    }
    return log('Unable to find dash-bootstrap-components `inst` directory.');
}

// // Update the man directories for each of the component packages.
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

function copyBootstrapManDirectory() {
    if (
        fs.existsSync(
            path.relative(
                __dirname,
                'gulp-assets/dash-bootstrap-components/man'
            )
        )
    ) {
        return src([
            'gulp-assets/dash-bootstrap-components/man/**/*',
            '!gulp-assets/dash-bootstrap-components/man/*-package.Rd',
        ]).pipe(dest('man/', {overwrite: true}));
    }
    return log('Unable to find dash-bootstrap-components `man` directory.');
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
            .pipe(concat('dashCoreComponents.R'))
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
            .pipe(concat('dashHtmlComponents.R'))
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
            .pipe(concat('dashTable.R'))
            .pipe(dest('R/', {overwrite: true}));
    }
    return log('Unable to find dash-table `R` directory.');
}

function copyBootstrapRDirectory() {
    if (
        fs.existsSync(
            path.relative(__dirname, 'gulp-assets/dash-bootstrap-components/R')
        )
    ) {
        return src([
            'gulp-assets/dash-bootstrap-components/R/**/*',
            '!gulp-assets/dash-bootstrap-components/R/internal.R',
        ])
            .pipe(print())
            .pipe(concat('dashBootstrapComponents.R'))
            .pipe(replace(/#'\s@export'/g, "#' @export"))
            .pipe(dest('R/', {overwrite: true}));
    }
    return log('Unable to find dash-bootstrap-components `R` directory.');
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

function appendBootstrapInternal() {
    return src('R/internal.R')
        .pipe(print())
        .pipe(
            replace(
                '{dbc_deps}',
                fs.readFileSync(
                    'gulp-assets/dash-bootstrap-components/R/internal.R'
                )
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
        .pipe(
            replace(/package = "dashBootstrapComponents"/g, 'package = "dash"')
        )
        .pipe(replace(/name = "dcc\//g, 'name = "'))
        .pipe(
            replace(
                /`dash_core_components.+name\s=\s.+",$/gm,
                '`dash_core_components` = structure(list(name = "dash_core_components",'
            )
        )
        .pipe(
            replace(
                /`dcc\/dash_core_components.+name\s=\s.+",$/gm,
                '`dash_core_components` = structure(list(name = "dash_core_components",'
            )
        )
        .pipe(
            replace(
                /`html\/dash_html_components.+name\s=\s.+",$/gm,
                '`dash_html_components` = structure(list(name = "dash_html_components",'
            )
        )
        .pipe(
            replace(
                /`dash_table.+name\s=\s.+",$/gm,
                '`dash_table` = structure(list(name = "dash_table",'
            )
        )
        .pipe(
            replace(
                /`html\/dash_bootstrap_components.+name\s=\s.+",$/gm,
                '`dash_bootstrap_components` = structure(list(name = "dash_bootstrap_components",'
            )
        )
        .pipe(dest('R/'));
}

// Task to clean build artifacts from gulp-assets
const cleanAssets = async () => {
    const assetsPath = path.resolve(__dirname, 'gulp-assets');
    shell.cd(assetsPath);
    shell.exec(
        'rm -rfv dash-core-components dash-html-components dash-table dash-bootstrap-components dash'
    );
};

// Document package
const document = async () => {
    shell.exec('Rscript -e "devtools::document()"');
};

exports.unify = series(
    parallel(
        copyCoreInstDirectory,
        copyHtmlInstDirectory,
        copyTableInstDirectory,
        copyBootstrapInstDirectory
    ),
    parallel(
        copyCoreManDirectory,
        copyHtmlManDirectory,
        copyTableManDirectory,
        copyBootstrapManDirectory
    ),
    parallel(
        copyCoreRDirectory,
        copyHtmlRDirectory,
        copyTableRDirectory,
        copyBootstrapRDirectory
    )
);

exports.update = series(
    appendCoreInternal,
    appendHtmlInternal,
    appendTableInternal,
    appendBootstrapInternal,
    replacePackageDependency,
    document
);

exports.clone = series(retrieveAssets);

exports.test = series(replacePackageDependency);

exports.clean = series(cleanAssets);
