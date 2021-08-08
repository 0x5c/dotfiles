# A colourful prompt with git and venv
# 2020 - 0x5c


# --- Setup ---

# Loads the vcs_info module for the git branch info
autoload -Uz vcs_info

# Enables variable reëvaluation each time the prompt is displayed
setopt prompt_subst

# Prevents venv activation from operwriting the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1


# --- Prompt Components ---

# Shell level
# Magenta
local shell_level="%(2L.%F{5}%L%f .)"

# Exit code
# show a green if 0, red otherwise
local exit_code="%(?.%F{2}.%F{1})%?%f"

# Username and hostname
# Bright magenta and magenta
local user_host="%F{13}%n%F{5}@%m"

# Separator between the user/host and path
# Bright black
local separator="%F{8}:%f"

# Path
# Light teal
local path_text="%F{14}%~%f"

# Prompt symbol
# Bright magenta '$' for normal users, bright red '#' for root
if [[ $UID -eq 0 ]]; then
    local promptsign="%F{9}#%f"
else
    local promptsign="%F{13}$%f"
fi

# Venv info, if applicable
# Bright blue
function virtualenv_info {
    [[ -n "$VIRTUAL_ENV" ]] && echo "%F{6}v:${VIRTUAL_ENV##*/}%f "
}

# Git branch info, if applicable
# Teal
function precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '%F{12}g:%b%m%u%c%f '
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
       git status --porcelain | grep -m 1 '^??' &>/dev/null
    then
        hook_com[misc]='?'
    else
        hook_com[misc]=''
    fi
}

NEWLINE=$'\n'

SEP='%F{234}------'

# The actual prompt line
# Variables to reëvaluate each time must be \escaped
PROMPT="${SEP}${NEWLINE}${shell_level}${exit_code} ${user_host}${separator}${path_text} \$(virtualenv_info)\$vcs_info_msg_0_${promptsign} "
