function fish_prompt
  # Cache exit status
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
        set -g __fish_prompt_char \#
      case '*'
        set -g __fish_prompt_char \$
    end
  end

  # Setup colors
  set -l normal (set_color normal)
  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l bgreen (set_color -o green)
  set -l red (set_color red)

  # Color prompt char red for non-zero exit status
  set -l pcolor $normal
  if [ $last_status -ne 0 ]
    set pcolor $red
  end

  # Top
  echo -n $cyan$USER$normal@$yellow$__fish_prompt_hostname$normal: $bgreen(prompt_pwd)$normal
  __fish_git_prompt

  echo

  # Bottom
  echo -n $pcolor$__fish_prompt_char $normal
end
