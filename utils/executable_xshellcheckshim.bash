#!/bin/bash
# this file is for use by xshellcheck from xtools
#
# by assigning and using every variable templates should contain,
# it suppresses SC2034 (unused variable) and SC2154 (possibly unassigned
# variable). set -e suppresses errors like SC2164 (use cd ... || exit).

set -e

# TODO: do other variables need handling?
# _*
# *_descr
# *_groups
# *_homedir
# *_pgroup
# *_shell
# desc_option_*
# build_option_*

# global variables
CHROOT_READY=
CROSS_BUILD=
DESTDIR=
FILESDIR=
PKGDESTDIR=
XBPS_BUILDDIR=
XBPS_BUILD_ENVIRONMENT=
XBPS_CHECK_PKGS=
XBPS_CROSS_BASE=
XBPS_ENDIAN=
XBPS_FETCH_CMD=
XBPS_LIBC=
XBPS_MACHINE=
XBPS_MAKEJOBS=
XBPS_NO_ATOMIC8=
XBPS_RUST_TARGET=
XBPS_SRCDISTDIR=
XBPS_SRCPKGDIR=
XBPS_TARGET_ENDIAN=
XBPS_TARGET_LIBC=
XBPS_TARGET_MACHINE=
XBPS_TARGET_NO_ATOMIC8=
XBPS_TARGET_WORDSIZE=
XBPS_WORDSIZE=
XBPS_WRAPPERDIR=
makejobs=
sourcepkg=

# toolchain variables
AR=
AS=
CC=
CFLAGS=
CPP=
CPPFLAGS=
CXX=
CXXFLAGS=
GCC=
LD=
LDFLAGS=
LD_LIBRARY_PATH=
NM=
OBJCOPY=
OBJDUMP=
RANLIB=
READELF=
STRIP=

# available variables
allow_unknown_shlibs=
alternatives=
archs=
binfmts=
bootstrap=
broken=
build_helper=
build_options=
build_options_default=
build_style=
build_wrksrc=
changelog=
checkdepends=
checksum=
conf_files=
configure_args=
configure_script=
conflicts=
create_wrksrc=
depends=
disable_parallel_build=
disable_parallel_check=
distfiles=
dkms_modules=
fetch_cmd=
font_dirs=
force_debug_pkgs=
gconf_entries=
gconf_schemas=
homepage=
hostmakedepends=
ignore_elf_dirs=
ignore_elf_files=
keep_libtool_archives=
kernel_hooks_version=
lib32depends=
lib32disabled=
lib32files=
lib32mode=
lib32symlinks=
license=
maintainer=
make_build_args=
make_build_target=
make_check=
make_check_args=
make_check_pre=
make_check_target=
make_cmd=
make_dirs=
make_install_args=
make_install_target=
make_use_env=
makedepends=
mutable_files=
no_generic_pkgconfig_link=
nocheckperms=
nocross=
nodebug=
nofixperms=
nopie=
nopie_files=
noshlibprovides=
nostrip=
nostrip_files=
noverifyrdeps=
patch_args=
perl_configure_dirs=
pkgname=
preserve=
provides=
register_shell=
replaces=
repository=
restricted=
reverts=
revision=
sgml_entries=
shlib_provides=
shlib_requires=
short_desc=
skip_extraction=
skiprdeps=
subpackages=
system_accounts=
system_groups=
tags=
triggers=
version=
wrksrc=
xml_catalogs=
xml_entries=

# go
go_build_tags=
go_import_path=
go_ldflags=
go_mod_mode=
go_package=

# cmake
cmake_builddir=

# gemspec
gem_cmd=

# haskell-stack
stackage=

# meson
meson_builddir=
meson_cmd=
meson_crossfile=

# python*
py2_inc=
py2_lib=
py2_sitelib=
py2_ver=
py3_inc=
py3_lib=
py3_sitelib=
py3_ver=
pycompile_dirs=
pycompile_module=
python_version=

# void-cross
cross_binutils_configure_args=
cross_gcc_bootstrap_configure_args=
cross_gcc_configure_args=
cross_gcc_skip_go=
cross_glibc_cflags=
cross_glibc_configure_args=
cross_glibc_ldflags=
cross_musl_cflags=
cross_musl_configure_args=
cross_musl_ldflags=

. template

# global variables
: "$CHROOT_READY"
: "$CROSS_BUILD"
: "$DESTDIR"
: "$FILESDIR"
: "$PKGDESTDIR"
: "$XBPS_BUILDDIR"
: "$XBPS_BUILD_ENVIRONMENT"
: "$XBPS_CHECK_PKGS"
: "$XBPS_CROSS_BASE"
: "$XBPS_ENDIAN"
: "$XBPS_FETCH_CMD"
: "$XBPS_LIBC"
: "$XBPS_MACHINE"
: "$XBPS_MAKEJOBS"
: "$XBPS_NO_ATOMIC8"
: "$XBPS_RUST_TARGET"
: "$XBPS_SRCDISTDIR"
: "$XBPS_SRCPKGDIR"
: "$XBPS_TARGET_ENDIAN"
: "$XBPS_TARGET_LIBC"
: "$XBPS_TARGET_MACHINE"
: "$XBPS_TARGET_NO_ATOMIC8"
: "$XBPS_TARGET_WORDSIZE"
: "$XBPS_WORDSIZE"
: "$XBPS_WRAPPERDIR"
: "$makejobs"
: "$sourcepkg"

# toolchain variables
: "$AR"
: "$AS"
: "$CC"
: "$CFLAGS"
: "$CPP"
: "$CPPFLAGS"
: "$CXX"
: "$CXXFLAGS"
: "$GCC"
: "$LD"
: "$LDFLAGS"
: "$LD_LIBRARY_PATH"
: "$NM"
: "$OBJCOPY"
: "$OBJDUMP"
: "$RANLIB"
: "$READELF"
: "$STRIP"

# available variables
: "$allow_unknown_shlibs"
: "$alternatives"
: "$archs"
: "$binfmts"
: "$bootstrap"
: "$broken"
: "$build_helper"
: "$build_options"
: "$build_options_default"
: "$build_style"
: "$build_wrksrc"
: "$changelog"
: "$checkdepends"
: "$checksum"
: "$conf_files"
: "$configure_args"
: "$configure_script"
: "$conflicts"
: "$create_wrksrc"
: "$depends"
: "$disable_parallel_build"
: "$disable_parallel_check"
: "$distfiles"
: "$dkms_modules"
: "$fetch_cmd"
: "$font_dirs"
: "$force_debug_pkgs"
: "$gconf_entries"
: "$gconf_schemas"
: "$homepage"
: "$hostmakedepends"
: "$ignore_elf_dirs"
: "$ignore_elf_files"
: "$keep_libtool_archives"
: "$kernel_hooks_version"
: "$lib32depends"
: "$lib32disabled"
: "$lib32files"
: "$lib32mode"
: "$lib32symlinks"
: "$license"
: "$maintainer"
: "$make_build_args"
: "$make_build_target"
: "$make_check"
: "$make_check_args"
: "$make_check_pre"
: "$make_check_target"
: "$make_cmd"
: "$make_dirs"
: "$make_install_args"
: "$make_install_target"
: "$make_use_env"
: "$makedepends"
: "$mutable_files"
: "$no_generic_pkgconfig_link"
: "$nocheckperms"
: "$nocross"
: "$nodebug"
: "$nofixperms"
: "$nopie"
: "$nopie_files"
: "$noshlibprovides"
: "$nostrip"
: "$nostrip_files"
: "$noverifyrdeps"
: "$patch_args"
: "$perl_configure_dirs"
: "$pkgname"
: "$preserve"
: "$provides"
: "$register_shell"
: "$replaces"
: "$repository"
: "$restricted"
: "$reverts"
: "$revision"
: "$sgml_entries"
: "$shlib_provides"
: "$shlib_requires"
: "$short_desc"
: "$skip_extraction"
: "$skiprdeps"
: "$subpackages"
: "$system_accounts"
: "$system_groups"
: "$tags"
: "$triggers"
: "$version"
: "$wrksrc"
: "$xml_catalogs"
: "$xml_entries"

# go
: "$go_build_tags"
: "$go_import_path"
: "$go_ldflags"
: "$go_mod_mode"
: "$go_package"

# cmake
: "$cmake_builddir"

# gemspec
: "$gem_cmd"

# haskell-stack
: "$stackage"

# meson
: "$meson_builddir"
: "$meson_cmd"
: "$meson_crossfile"

# python*
: "$py2_inc"
: "$py2_lib"
: "$py2_sitelib"
: "$py2_ver"
: "$py3_inc"
: "$py3_lib"
: "$py3_sitelib"
: "$py3_ver"
: "$pycompile_dirs"
: "$pycompile_module"
: "$python_version"

# void-cross
: "$cross_binutils_configure_args"
: "$cross_gcc_bootstrap_configure_args"
: "$cross_gcc_configure_args"
: "$cross_gcc_skip_go"
: "$cross_glibc_cflags"
: "$cross_glibc_configure_args"
: "$cross_glibc_ldflags"
: "$cross_musl_cflags"
: "$cross_musl_configure_args"
: "$cross_musl_ldflags"

