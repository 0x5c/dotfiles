# Sets the terminal title to
# user@host pwd (pty)


function precmd_term_title() {
    print -nP -u2 "\033]0;%n@%m: %3~ (%l)\007"
}

precmd_functions+=( precmd_term_title )
