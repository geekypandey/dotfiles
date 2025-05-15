# common mistypes
alias sl='ls'
alias dc='cd'
alias iv='vi'

alias ..='cd ..'
alias ....='cd ../../'


# run tests
alias ut='python -m unittest'


# create and move into that directory
function md() {
	mkdir $1 && cd $1;
}

# borrowed from https://github.com/nibalizer/bash-tricks/blob/master/bash_tricks.sh
function ,cdp() {
	TEMP_PWD=$(pwd)
	while ! [ -d .git ]; do
		cd ..
	done
	OLDPWD=$TEMP_PWD
}

# Validate things
alias yamlcheck='python -c "import sys, yaml as y; y.safe_load(open(sys.argv[1]))"'

# git aliases
alias gst='git status'
alias grhh='git reset --hard HEAD'
alias glog='git log --oneline --decorate --graph'
alias gd='git diff'
alias gds='git diff --staged'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb='git branch'
alias gp='git push'
alias gba='git branch -a'
alias gpl='git pull'
alias gcp='git cherry-pick'
alias gdsw='git diff --staged -w'
alias gdw='git diff -w'
alias gsh='git show HEAD'
