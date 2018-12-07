# dramatist.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with git. Tested only on Ubuntu 16.04 (till now).

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#   fino-time
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '⠠⠵' && return
    echo '○'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}


# local rvm_ruby='‹$(rvm-prompt i v g)›%{$reset_color%}'
local current_dir='%c' # For only dir #'${PWD/#$HOME/~}' # For full path
local git_info='$(git_prompt_info)'


PROMPT=" %{$FG[202]%}╭─ %{$FG[040]%}$terminfo[bold]%n%{$reset_color%} %{$FG[202]%}at%{$reset_color%} %{$FG[033]%}$terminfo[bold]$(box_name)%{$reset_color%} %{$FG[202]%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}${git_info} %{$FG[202]%}using%{$FG[040]%} %D{%f/%m} %*
 %{$FG[202]%}╰─$(virtualenv_info)$(prompt_char) %{$FG[114]%}"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[202]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[009]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
