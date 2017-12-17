# Disable fish greeting
set fish_greeting

# Show full path
set -g fish_prompt_pwd_dir_length 0

# Set git prompt
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1

# Set default editor
set -Ux EDITOR nvim
set -Ux VISUAL nvim

# Aliases
alias vi 'nvim'
alias vim 'nvim'
alias vimdiff 'nvim -d'

# Add paths
# set -gx PATH "~/.local/bin" $PATH

# Set pyenv
set -x PATH "/home/asleap/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

# set --export VIRTUAL_ENV_DISABLE_PROMPT 1
# Show virtualenv
# functions -c fish_prompt _old_fish_prompt
# function fish_prompt
#     if set -q VIRTUAL_ENV
#         echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
#     end
#     _old_fish_prompt
# end
