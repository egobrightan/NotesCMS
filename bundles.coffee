gulp = require('gulp')
$ = require('gulp-load-plugins')()

gulp.task 'bundle-libs', ->
    gulp.src [
                'public/vendor/arrive/src/arrive.js'
                'public/vendor/bootstrap/dist/js/bootstrap.min.js'
                'public/vendor/bootstrap-material-design/dist/js/material.js'
                'public/vendor/bootstrap-material-design/dist/js/ripples.js'
                'public/vendor/sweetalert/dist/sweetalert.min.js'
                'public/vendor/angularjs-bootstrap-tagsinput/dist/angularjs-bootstrap-tagsinput.js'
                'public/vendor/dropdown.js/jquery.dropdown.js'
                'public/vendor/textAngular/dist/textAngular-rangy.min.js'
                'public/vendor/textAngular/dist/textAngular-sanitize.min.js'
                'public/vendor/textAngular/dist/textAngular.min.js'
                'public/vendor/offline/offline.min.js'
            ]
        .pipe $.concat 'libs.min.js'
        .pipe $.ngAnnotate()
        .pipe $.uglify()
        .pipe gulp.dest 'public/dest/min'

gulp.task 'bundle-app', ['coffee', 'jade'], ->
    gulp.src [
                'public/dest/app/app.js'
                'public/dest/app/templates.js'
                'public/dest/app/utils/ErrorHandler.js'
                'public/dest/app/layout/Layout.js'
                'public/dest/app/layout/SubjectTabs.js'
                'public/dest/app/note/NoteContentGenerator.js'
                'public/dest/app/note/NoteFactory.js'
                'public/dest/app/note/NoteList.js'
                'public/dest/app/note/NotePreview.js'
                'public/dest/app/user/UserProfile.js'
            ]
        .pipe $.concat 'app.min.js'
        .pipe $.ngAnnotate()
        .pipe $.uglify()
        .pipe gulp.dest 'public/dest/min'

gulp.task 'bundle-styles', ['sass'], ->
    gulp.src [
                'public/vendor/bootstrap/dist/css/bootstrap.min.css'
                'public/vendor/bootstrap-material-design/dist/css/material.min.css'
                'public/vendor/bootstrap-material-design/dist/css/ripples.min.css'
                'public/vendor/dropdown.js/jquery.dropdown.css'
                'public/vendor/sweetalert/dist/sweetalert.css'
                'public/vendor/angularjs/angular-csp.css'
                
                'public/dest/styles/site.css'
            ]
        .pipe $.concat 'all.min.css'
        .pipe $.cssmin()
        .pipe gulp.dest 'public/dest/min'
        
    gulp.src 'public/vendor/bootstrap-material-design/dist/fonts/Material*.*'
        .pipe gulp.dest 'public/dest/fonts'


gulp.task 'bundle', ['bundle-libs', 'bundle-app', 'bundle-styles']
