#
# Init file for fish
#

# The hg-prompt command can be found at https://bitbucket.org/sjl/hg-prompt

set fish_greeting ""

function fish_prompt
    set_color -ob black yellow
    echo -n (pwd|sed 's/.*.\///')

    set_color normal
    echo -n ' '

    set_color red
    hg prompt '{status}{branch}' 2>/dev/null

    set_color normal
    echo '% '
end

set -x EDITOR vim
set -x VISUAL vim

# Python Google App Engine root directory
set -x PY_GAE_ROOT /home/benoit/vendor/gae-py/

# Go variables needed for correct execution
set -x GOROOT $HOME/vendor/go
set -x PATH $PATH $GOROOT/bin

# Nodejs and NPM should be in the path
set -x PATH $PATH $HOME/vendor/node/bin
set -x PATH $PATH $HOME/vendor/leiningen
set -x PATH $PATH $HOME/vendor/iReport-3.7.6/bin

set -x PATH $PATH ./node_modules/.bin

# Add ~/bin to the path; comes last as to not shadow any system-wide command
set -x PATH $PATH ~/bin

set -x TZ Asia/Bangkok
