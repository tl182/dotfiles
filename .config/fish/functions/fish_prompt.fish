function fish_prompt --description 'Write out the prompt'
	# Set colors
	set -l normal (set_color normal)
	set -l usercolor (set_color cyan)
	set -l hostcolor (set_color yellow)
	set -l red (set_color red)

	# Color prompot red if last command failed
	set -l promptcolor $normal
	if [ $status -ne 0 ]
		set promptcolor $red
	end


	# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	# Set appropriate prompt char and cwd color
	set -l suffix
	set -l color_cwd
	switch $USER
		case root toor
			if set -q fish_color_cwd_root
				set color_cwd $fish_color_cwd_root
			else
				set color_cwd $fish_color_cwd
			end
			set suffix '#'
		case '*'
			set color_cwd $fish_color_cwd
			set suffix '$'
	end

	# First line, adds newline
	echo -s "$usercolor$USER" \
		"$normal@" \
		"$hostcolor$__fish_prompt_hostname" "$normal: " \
		(set_color $color_cwd) (prompt_pwd) \
		"$normal" (__fish_git_prompt)

	# Second line
	echo -n -s "$promptcolor$suffix " "$normal"
end
