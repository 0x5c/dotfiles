# Additions to the path

# Properly setting the type so that entries aren't duplicated for each subshell invocation
typeset -aU path

# Managed user bin
path=("$HOME/bin" $path)

# Local user bin
path=("$HOME/.local/bin" $path)


# Exporting the path
export PATH
