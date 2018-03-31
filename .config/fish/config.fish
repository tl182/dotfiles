# Disable fish greeting
set fish_greeting

# Show full path
set -g fish_prompt_pwd_dir_length 0

# Set git prompt
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1

# Set editor
set -x EDITOR nvim
set -x VISUAL nvim

# Aliases
alias vi "nvim"
alias vim "nvim"
alias vimdiff "nvim -d"
alias emacs "emacs --no-window-system"
alias ls "ls -a --color=auto"

# Setup paths
set -x PATH "~/.local/bin" $PATH

# Setup pyenv
set -x PYENV_ROOT "/home/asleap/.pyenv"
set -x PATH "/home/asleap/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

# Setup direnv
eval (direnv hook fish)
