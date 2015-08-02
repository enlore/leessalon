if [ $# -ne 1 ]; then
    echo "Usage: ./sync.sh <ssh config'd host>"
    exit 1
fi;

rsync -rvzp dist/public $1:/var/www/lee.elcreativegroup.com
