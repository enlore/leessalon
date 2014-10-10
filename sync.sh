if [ $# -ne 1 ]; then
    echo "Usage: ./sync.sh <sshc config'd host>"
    exit 1
fi;

rsync -rvz public $1:/var/www/lee.elcreativegroup.com
