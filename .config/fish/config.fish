# Disable fish greeting
set fish_greeting

# Set default editor
set --export EDITOR nvim
set --export VISUAL nvim

# Aliases
alias vi 'nvim'
alias vim 'nvim'
alias vimdiff 'nvim -d'
alias vimbigfile 'vim -n -u NONE -i NONE -N'

# Set pyenv
set -x PATH "/home/asleap/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

# Show virtualenv
functions -c fish_prompt _old_fish_prompt
function fish_prompt
    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
    end
    _old_fish_prompt
end
