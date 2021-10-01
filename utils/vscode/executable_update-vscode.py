#!/bin/env python3

import os
import subprocess
import sys
import tarfile
from pathlib import Path, PurePath


# TODO: argparse


archive_path = Path("/tmp/code-stable-x64.tar.gz")
dest_dir = Path("/opt/vscode")
archive_link = "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
wget_command = f"wget --no-verbose --show-progress --timeout=30 --continue --output-document='{archive_path}' '{archive_link}'"


def step(t):
    return f"\033[94m==> {t}...\033[0m"


def red(t):
    return f"\033[91m{t}\033[0m"

def error(t):
    return red(f"==> Error: {t}")


def done():
    return f"\033[92m==> Done!\033[0m"


def strip_components(tarfile: tarfile.TarFile, level = 1):
    members = tarfile.getmembers()
    total = len(members)
    for num, member in enumerate(members):
        member.path = "/".join(PurePath(member.path).parts[1:])
        print(f"\rExtracting  {num/total:>3.0%}  {num:>4}/{total}", end="")
        yield member
    print()
    print(f"Done extracting")


def main():
    if os.geteuid() != 0:
        print(red("Must be run as root!"), file=sys.stderr)
        raise SystemExit(1)

    print(step("Downloading the latest vscode version"))
    try:
        wget = subprocess.run(wget_command, shell=True)
    except Exception as ex:
        print(error(f"failed to run wget: {ex}"), file=sys.stderr)
        raise SystemExit(1)
    if wget.returncode != 0:
        print(error("failed to download archive"), file=sys.stderr)
        print(red("Archive URL:"), red(archive_link), file=sys.stderr)
        print(red("If the download was interrupted, it will be resumed when running again."), file=sys.stderr)
        raise SystemExit(1)

    print(step("Unpacking"))
    # Destdir creation
    try:
        dest_dir.mkdir(parents=True, exist_ok=True)
    except FileExistsError as ex:
        print(error(f"failed to create destination directory: {ex}"))
        print(red("Destination dir:"), red(dest_dir))
    # Actual unpacking
    try:
        with tarfile.open(archive_path, "r") as file:
            print(f"Extracting to {dest_dir}")
            try:
                file.extractall(dest_dir, members=strip_components(file))
            except OSError as ex:
                print()
                print(error(f"failed to extract tar file: {ex}"), file=sys.stderr)
                raise SystemExit(1)
    except tarfile.ReadError as ex:
        print(error(f"failed to open tar file: {ex}"), file=sys.stderr)

    print(step("Cleaning up"))
    try:
        archive_path.unlink(missing_ok=True)
    except OSError as ex:
        print(error(f"failed to clean up: {ex}"), file=sys.stderr)
        raise SystemExit(1)

    print(done())
    raise SystemExit(0)



if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print()
        raise SystemExit(1)
