# History settings for zsh


# Max size of internal history
HISTSIZE=1000

# Ignore duplicated when searching the history
setopt HIST_FIND_NO_DUPS

# History file
HISTFILE=~/.histfile

# Max histfile size
SAVEHIST=5000

# Ignores lines that start by a space
setopt HIST_IGNORE_SPACE

# Adds start and duration ot history
setopt EXTENDED_HISTORY

# Immediate append to file with time
setopt INC_APPEND_HISTORY_TIME

