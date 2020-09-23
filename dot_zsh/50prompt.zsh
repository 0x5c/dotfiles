# A colourful prompt with git and venv
# 2020 - 0x5c


# --- Setup ---

# Enables variable reëvaluation each time the prompt is displayed
setopt prompt_subst

# Prevents venv activation from operwriting the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1


# --- Prompt Components ---

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
    [[ -n "$VIRTUAL_ENV" ]] && echo "%F{12}v:${VIRTUAL_ENV##*/}%f "
}


# The actual prompt line
# Variables to reëvaluate each time must be \escaped
PROMPT="${exit_code} ${user_host}${separator}${path_text} \$(virtualenv_info)${promptsign} "
