if [ ! -d ./tmp ]; then mkdir ./tmp; fi

emacs -Q --batch --load genfile.el
