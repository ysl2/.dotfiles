#!/bin/bash

# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in ${PREFIX}/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

PREFIX=$HOME/.Local
TMUX_TMP=$HOME/tmux_tmp

OPENSSL_VERSION=3.1.0
LIBEVENT_VERSION=2.1.12-stable
NCURSES_VERSION=6.4
TMUX_VERSION=3.3a

# create our directories
mkdir -p ${PREFIX} ${TMUX_TMP}
cd ${TMUX_TMP}

# download source files for tmux, libevent, and ncurses
[[ ! -e openssl-${OPENSSL_VERSION}.tar.gz ]] && wget https://ghproxy.com/https://github.com/openssl/openssl/releases/download/openssl-3.1.0/openssl-${OPENSSL_VERSION}.tar.gz
[[ ! -e libevent-${LIBEVENT_VERSION}.tar.gz ]] && wget https://ghproxy.com/https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}/libevent-${LIBEVENT_VERSION}.tar.gz
[[ ! -e v${NCURSES_VERSION}.tar.gz ]] && wget https://ghproxy.com/https://github.com/mirror/ncurses/archive/refs/tags/v${NCURSES_VERSION}.tar.gz
[[ ! -e tmux-${TMUX_VERSION}.tar.gz ]] && wget https://ghproxy.com/https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz

# extract files, configure, and compile


# ================
# === libevent ===
# ================

# ===
# === openssl
# ===
tar xvzf openssl-${OPENSSL_VERSION}.tar.gz
cd openssl-${OPENSSL_VERSION}
./Configure --prefix=${PREFIX}
make
make install
cd ..

# ===
# === libevent
# ===
tar xvzf libevent-${LIBEVENT_VERSION}.tar.gz
cd libevent-${LIBEVENT_VERSION}
./configure PKG_CONFIG_PATH=${PREFIX}/lib64/pkgconfig --prefix=${PREFIX} --disable-shared
make
make install
cd ..


# ===============
# === ncurses ===
# ===============
tar xvzf v${NCURSES_VERSION}.tar.gz
cd ncurses-${NCURSES_VERSION}
./configure --prefix=${PREFIX} CPPFLAGS="-P"
make
make install
cd ..


# ============
# === tmux ===
# ============
tar xvzf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure CFLAGS="-I${PREFIX}/include -I${PREFIX}/include/ncurses" LDFLAGS="-L${PREFIX}/lib -L${PREFIX}/include/ncurses -L${PREFIX}/include"
CPPFLAGS="-I${PREFIX}/include -I${PREFIX}/include/ncurses" LDFLAGS="-static -L${PREFIX}/include -L${PREFIX}/include/ncurses -L${PREFIX}/lib" make
cp tmux ${PREFIX}/bin
cd ..

# cleanup
rm -rf ${TMUX_TMP}

echo "Tmux is now available. You can add tmux location to your PATH."
