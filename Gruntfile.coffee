path = require "path"
module.exports = (grunt) ->
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-stylus"
    grunt.loadNpmTasks "grunt-contrib-jade"

    grunt.loadNpmTasks "grunt-bower-concat"

    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-concurrent"
    grunt.loadNpmTasks "grunt-nodemon"

    grunt.registerTask "default", ["compile", "concurrent:dev"]
    grunt.registerTask "compile", ["coffee:compile", "stylus:compile", "jade:compile"]

    grunt.initConfig
        srcDir: path.join __dirname, "src"
        distDir: path.join __dirname, "dist"

        coffee:
            options: {}
            compile:
                files:
                    "dist/app/server.js": ["src/server.coffee"]
                    "dist/public/js/main.js": ["src/coffee/main.coffee"]

        stylus:
            options: {}
            compile:
                files:
                    "dist/public/css/main.css": ["src/styl/main.styl"]

        jade:
            options: {}
            compile:
                files:
                    "dist/public/index.html": ["src/templates/index.jade"]
                    "dist/public/design_team.html": ["src/templates/design_team.jade"]

        bower_concat:
            compile:
                cssDest: "dist/public/css/vendor/deps.css"
                dest: "dist/public/js/vendor/deps.js"
                mainFiles:
                    "blueimp-gallery": [
                        "css/blueimp-gallery.css",
                        "css/blueimp-gallery-indicator.css",
                        "css/blueimp-gallery-video.css",
                        "img/error.png",
                        "img/error.svg",
                        "img/loading.gif",
                        "img/play-pause.png",
                        "img/play-pause.svg",
                        "img/video-play.png",
                        "img/video-play.svg",
                        "js/blueimp-helper.js",
                        "js/blueimp-gallery.js",
                        "js/blueimp-gallery-fullscreen.js",
                        "js/blueimp-gallery-indicator.js",
                        "js/blueimp-gallery-video.js",
                        "js/blueimp-gallery-vimeo.js",
                        "js/blueimp-gallery-youtube.js",
                        "js/jquery.blueimp-gallery.min.js"
                    ]

        watch:
            options: {}
            bower:
                files: ["bower_components"]
                tasks: ["bower_concat"]

            coffee:
                files: ["src/**/*.coffee"]
                tasks: ["coffee:compile"]

            stylus:
                files: ["src/styl/*.styl"]
                tasks: ["stylus:compile"]

            jade:
                files: ["src/templates/**/*.jade"]
                tasks: ["jade:compile"]

        nodemon:
            options:
                ignore: ["node_modules/**"]

            dev:
                script: "dist/app/server.js"
                watch: ["dist"]
                env:
                    PORT: process.env.PORT or 3000
                    HOST: process.env.HOST or "127.0.0.1"

        concurrent:
            options:
                logConcurrentOutput: true

            dev:
                tasks: ["nodemon", "watch"]
