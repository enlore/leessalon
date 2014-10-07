jade -o public -p templates/includes -P templates
stylus -I styl < styl/main.styl > public/css/main.css
rsync -av assets/ public/
