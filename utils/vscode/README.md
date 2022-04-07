# Vscode instalation tools

Run `update-vscode.py` as root. If you don't have python3, use the sh version
instead.

Installs from tarball. The target dir is `/opt/vscode/`.


## Desktop files

Copy both `.desktop` files to `~/.local/share/applications`.

Wihtout the url handler, many things like the Github authentication flow and the
ability to join Live Share sessions by url will break completely.
