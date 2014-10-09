jade -o public -p templates/includes -P templates
stylus -I styl < styl/main.styl > public/css/main.css
coffee -o public/js -c js/main.coffee
rsync -av assets/ public/
