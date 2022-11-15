# commandline syntax highlighting

fshpath=$HOME/.local/share/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
slow_sh_path=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ -f "$fshpath" ]; then
    source $fshpath || true
    return
fi

if [ -f "$slow_sh_path" ]; then
    source $slow_sh_path &>/dev/null || true
fi
