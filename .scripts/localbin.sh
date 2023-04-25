#!/bin/bash

# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in ${PREFIX}/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

PREFIX=$HOME/.Local
TEMP_FOLDER=$HOME/Downloads/localbin

# create our directories
mkdir -p ${PREFIX} ${TEMP_FOLDER}
cd ${TEMP_FOLDER}


function openssl () {
    [[ -e ${PREFIX}/lib64/pkgconfig/openssl.pc ]] || [[ -e ${PREFIX}/lib/pkgconfig/openssl.pc ]] && return

    # OPENSSL_VERSION=3.1.0
    # OPENSSL_VERSION=1.1.1t
    OPENSSL_VERSION=$(ssh -V 2>&1 | awk '{ print $4 }')
    if [[ ${OPENSSL_VERSION:0:1} == '3' ]]; then
        OPENSSL_VERSION=openssl-${OPENSSL_VERSION}
    elif [[ ${OPENSSL_VERSION:0:1} == '1' ]]; then
        OPENSSL_VERSION=OpenSSL_${OPENSSL_VERSION//./_}
    fi

    [[ ! -e openssl ]] && git clone -b ${OPENSSL_VERSION} --depth=1 https://gitee.com/mirrors/openssl.git
    cd openssl
    ./config shared --prefix=${PREFIX} --openssldir=${PREFIX}/ssl
    make
    make install
    make clean
    cd ..
    [[ -e ${PREFIX}/ssl/certs ]] && rm -rf ${PREFIX}/ssl/certs
    ln -s /etc/ssl/certs ${PREFIX}/ssl/certs
}


function libevent () {
    [[ -e ${PREFIX}/lib/pkgconfig/libevent.pc ]] && return

    openssl

    LIBEVENT_VERSION=2.1.12-stable
    [[ ! -e libevent-${LIBEVENT_VERSION}.tar.gz ]] && wget https://ghproxy.com/https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}/libevent-${LIBEVENT_VERSION}.tar.gz
    tar xvzf libevent-${LIBEVENT_VERSION}.tar.gz
    cd libevent-${LIBEVENT_VERSION}
    # Need to install pkg-config: sudo apt install pkg-config
    # ./configure PKG_CONFIG_PATH=${PREFIX}/lib64/pkgconfig --prefix=${PREFIX} --disable-shared
    ./configure \
        CFLAGS="-I${PREFIX}/include -I${PREFIX}/include/openssl" \
        LDFLAGS="-L${PREFIX}/lib -L${PREFIX}/lib64" \
        --prefix=${PREFIX}
    make
    make install
    make clean
    cd ..
}


function ncurses () {

    function _ncurses () {
        NCURSES_VERSION=$1

        [[ -e ${PREFIX}/lib/libncurses.so.${NCURSES_VERSION} ]] && [[ -e ${PREFIX}/lib/libncursesw.so.${NCURSES_VERSION} ]] && return

        [[ ! -e ncurses-${NCURSES_VERSION}.tar.gz ]] && wget -O ncurses-${NCURSES_VERSION}.tar.gz https://ghproxy.com/https://github.com/mirror/ncurses/archive/refs/tags/v${NCURSES_VERSION}.tar.gz
        tar xvzf ncurses-${NCURSES_VERSION}.tar.gz
        cd ncurses-${NCURSES_VERSION}
        _CONFIGURE_COMMAND='./configure'
        _CONFIGURE_COMMAND="$_CONFIGURE_COMMAND CPPFLAGS='-P'"
        _CONFIGURE_COMMAND="$_CONFIGURE_COMMAND --with-shared --with-termlib --prefix=${PREFIX}"
        # _CONFIGURE_COMMAND="$_CONFIGURE_COMMAND --disable-tic-depends --with-ticlib"
        _CONFIGURE_COMMAND="$_CONFIGURE_COMMAND --with-versioned-syms"
        if [[ ${1:0:1} == '5' ]]; then
            _CONFIGURE_COMMAND="$_CONFIGURE_COMMAND --without-cxx-binding"  # Ref: https://git.pengutronix.de/cgit/ptxdist/commit/?id=b6036e7ce2ce791087694ca19a771168ac7fc9f6
        fi
        if [[ ! -e ${PREFIX}/lib/libncurses.so.${NCURSES_VERSION} ]]; then
            CONFIGURE_COMMAND=$_CONFIGURE_COMMAND
            CONFIGURE_COMMAND="$_CONFIGURE_COMMAND --disable-widec"
            eval "$CONFIGURE_COMMAND"
            make
            make install
            make clean
        fi
        if [[ ! -e ${PREFIX}/lib/libncursesw.so.${NCURSES_VERSION} ]]; then
            CONFIGURE_COMMAND=$_CONFIGURE_COMMAND
            CONFIGURE_COMMAND="$_CONFIGURE_COMMAND --enable-widec"
            eval "$CONFIGURE_COMMAND"
            make
            make install
            make clean
        fi
        cd ..
    }

    # _ncurses 5.9
    _ncurses 6.4
}


function fuse () {
    [[ -e ${PREFIX}/lib/pkgconfig/fuse3.pc ]] && return

    pip install meson ninja

    FUSE_VERSION=3.14.1
    [[ ! -e fuse-${FUSE_VERSION}.tar.xz ]] && wget https://ghproxy.com/https://github.com/libfuse/libfuse/releases/download/fuse-${FUSE_VERSION}/fuse-${FUSE_VERSION}.tar.xz
    tar xvf fuse-${FUSE_VERSION}.tar.xz
    cd fuse-${FUSE_VERSION}
    mkdir build
    cd build
    meson setup .. \
        -Duseroot=false \
        -Dbindir=${PREFIX}/bin \
        -Ddatadir=${PREFIX}/share \
        -Dincludedir=${PREFIX}/include \
        -Dlibdir=${PREFIX}/lib \
        -Dmandir=${PREFIX}/share/man \
        -Dsbindir=${PREFIX}/sbin \
        -Dsysconfdir=${PREFIX}/etc \
        -Dudevrulesdir=${PREFIX}/lib/udev/rules.d \
        -Dinitscriptdir=
    ninja
    ninja install
    cd ..
}


function tmux () {
    [[ -e ${PREFIX}/bin/tmux ]] && return

    libevent
    ncurses

    TMUX_VERSION=3.3a
    [[ ! -e tmux-${TMUX_VERSION}.tar.gz ]] && wget https://ghproxy.com/https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
    tar xvzf tmux-${TMUX_VERSION}.tar.gz
    cd tmux-${TMUX_VERSION}
    # ./configure CFLAGS="-I${PREFIX}/include -I${PREFIX}/include/ncurses" LDFLAGS="-L${PREFIX}/lib -L${PREFIX}/include/ncurses -L${PREFIX}/include"
    # CPPFLAGS="-I${PREFIX}/include -I${PREFIX}/include/ncurses" LDFLAGS="-static -L${PREFIX}/include -L${PREFIX}/include/ncurses -L${PREFIX}/lib" make
    ./configure \
        CFLAGS="-I${PREFIX}/include -I${PREFIX}/include/ncurses" \
        LDFLAGS="-static -L${PREFIX}/include -L${PREFIX}/include/ncurses -L${PREFIX}/lib " \
        --prefix=${PREFIX}
    make
    cp tmux ${PREFIX}/bin
    make clean
    cd ..
}


function ncdu () {
    [[ -e ${PREFIX}/bin/ncdu ]] && return

    ncurses

    NCDU_VERSION=1.18.1
    [[ ! -e ncdu-${NCDU_VERSION}.tar.gz ]] && wget https://ghproxy.com/https://github.com/ysl2/ncdu/releases/download/v${NCDU_VERSION}/ncdu-${NCDU_VERSION}.tar.gz
    tar xvzf ncdu-${NCDU_VERSION}.tar.gz
    cd ncdu-${NCDU_VERSION}
    ./configure \
        CFLAGS="-I${PREFIX}/include -I${PREFIX}/include/ncurses" \
        CPPFLAGS="-I${PREFIX}/include -I${PREFIX}/include/ncurses" \
        CXXFLAGS="-I${PREFIX}/include -I${PREFIX}/include/ncurses" \
        LDFLAGS="-L${PREFIX}/lib -Wl,--no-as-needed -ltinfow" \
        --prefix=${PREFIX}
    make
    make install
    make clean
    cd ..
}


function lf () {
    [[ -e ${PREFIX}/bin/lf ]] && return

    LF_VERSION=r28
    [[ ! -e lf-linux-amd64.tar.gz ]] && wget https://ghproxy.com/https://github.com/gokcehan/lf/releases/download/${LF_VERSION}/lf-linux-amd64.tar.gz
    tar xvzf lf-linux-amd64.tar.gz
    mkdir -p ${PREFIX}/bin
    mv lf ${PREFIX}/bin
}


function htop () {
    [[ -e ${PREFIX}/bin/htop ]] && return

    ncurses

    HTOP_VERSION=3.2.2
    [[ ! -e htop-${HTOP_VERSION}.tar.xz ]] && wget https://ghproxy.com/https://github.com/htop-dev/htop/releases/download/${HTOP_VERSION}/htop-${HTOP_VERSION}.tar.xz
    tar xvf htop-${HTOP_VERSION}.tar.xz
    cd htop-${HTOP_VERSION}
    ./configure CFLAGS="-I${PREFIX}/include -I${PREFIX}/include/ncurses" LDFLAGS="-L${PREFIX}/lib -L${PREFIX}/include/ncurses -L${PREFIX}/include" --disable-unicode --prefix=${PREFIX}
    CPPFLAGS="-I${PREFIX}/include -I${PREFIX}/include/ncurses" LDFLAGS="-static -L${PREFIX}/include -L${PREFIX}/include/ncurses -L${PREFIX}/lib" make
    make install
    make clean
    cd ..
}


function gcc8 () {
    echo 'Bug here: gcc'
    return

    # wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-8/gcc-8_8.4.0-3ubuntu2_amd64.deb
    # wget http://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcc-8/gcc-8-base_8.4.0-3ubuntu2_amd64.deb
    # wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-8/libgcc-8-dev_8.4.0-3ubuntu2_amd64.deb
    # wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-8/cpp-8_8.4.0-3ubuntu2_amd64.deb
    # wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-8/libmpx2_8.4.0-3ubuntu2_amd64.deb
    # wget http://mirrors.kernel.org/ubuntu/pool/main/i/isl/libisl22_0.22.1-1_amd64.deb

    # wget https://mirror.bjtu.edu.cn/ubuntu/pool/universe/g/gcc-8/gcc-8_8.4.0-3ubuntu2_amd64.deb
    # wget https://mirror.bjtu.edu.cn/ubuntu/pool/universe/g/gcc-8/gcc-8-base_8.4.0-3ubuntu2_amd64.deb
    # wget https://mirror.bjtu.edu.cn/ubuntu/pool/universe/g/gcc-8/libgcc-8-dev_8.4.0-3ubuntu2_amd64.deb
    # wget https://mirror.bjtu.edu.cn/ubuntu/pool/universe/g/gcc-8/cpp-8_8.4.0-3ubuntu2_amd64.deb
    # wget https://mirror.bjtu.edu.cn/ubuntu/pool/universe/g/gcc-8/libmpx2_8.4.0-3ubuntu2_amd64.deb
    # wget https://mirror.bjtu.edu.cn/ubuntu/pool/universe/g/gcc-8/libisl22_0.22.1-1_amd64.deb
    # sudo apt update
    # sudo apt install ./libisl22_0.22.1-1_amd64.deb ./libmpx2_8.4.0-3ubuntu2_amd64.deb ./cpp-8_8.4.0-3ubuntu2_amd64.deb ./libgcc-8-dev_8.4.0-3ubuntu2_amd64.deb ./gcc-8-base_8.4.0-3ubuntu2_amd64.deb ./gcc-8_8.4.0-3ubuntu2_amd64.deb

    # wget https://mirrors.tuna.tsinghua.edu.cn/gnu/gcc/gcc-9.3.0/gcc-9.3.0.tar.gz
    # wget https://mirrors.tuna.tsinghua.edu.cn/gnu/mpc/mpc-1.1.0.tar.gz
    # wget https://mirrors.tuna.tsinghua.edu.cn/gnu/mpfr/mpfr-4.0.2.tar.gz
    # wget https://mirrors.tuna.tsinghua.edu.cn/gnu/gmp/gmp-6.1.2.tar.gz

    # binutils: https://mirrors.tuna.tsinghua.edu.cn/gnu/binutils/
    # gcc: https://mirrors.tuna.tsinghua.edu.cn/gnu/gcc/
    # gmp: https://mirrors.tuna.tsinghua.edu.cn/gnu/gmp/
    # mpfr: https://mirrors.tuna.tsinghua.edu.cn/gnu/mpfr/
    # mpc: https://mirrors.tuna.tsinghua.edu.cn/gnu/mpc/
    # isl: https://mirrors.tuna.tsinghua.edu.cn/ubuntu/pool/main/i/isl-0.18/

    # https://www.ivistang.com/articles/336/
}


function lazygit () {
    [[ -e ${PREFIX}/bin/lazygit ]] && return

    LAZYGIT_VERSION=0.37.0
    mkdir lazygit-${LAZYGIT_VERSION}
    cd lazygit-${LAZYGIT_VERSION}
    [[ ! -e lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz ]] && wget https://ghproxy.com/https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz
    tar xvzf lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz
    mkdir -p ${PREFIX}/bin
    mv lazygit ${PREFIX}/bin
    cd ..
}


function nvim () {
    [[ -e ${PREFIX}/bin/nvim ]] && return

    # fuse

    [[ ! -e ${PREFIX}/bin/nvim ]] && wget -O ${PREFIX}/bin/nvim https://ghproxy.com/https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    chmod 777 ${PREFIX}/bin/nvim
}


function termscp () {
    [[ -e ${PREFIX}/bin/termscp ]] && return

    TERMSCP_VERSION=v0.11.1
    [[ ! -e termscp-${TERMSCP_VERSION}-x86_64-unknown-linux-gnu.tar.gz ]] && wget https://ghproxy.com/https://github.com/veeso/termscp/releases/download/${TERMSCP_VERSION}/termscp-${TERMSCP_VERSION}-x86_64-unknown-linux-gnu.tar.gz
    tar xzvf termscp-${TERMSCP_VERSION}-x86_64-unknown-linux-gnu.tar.gz
    mkdir -p ${PREFIX}/bin
    mv termscp ${PREFIX}/bin
}


function brew () {
    # Judge if Linux or Mac
    OS="$(uname)"
    if [[ "$OS" == "Linux" ]]; then
      HOMEBREW_ON_LINUX=1
    elif [[ "$OS" != "Darwin" ]]; then
      echo "Homebrew 只运行在 Mac OS 或 Linux."
    fi

    # Set architecture information
    if [[ -z "${HOMEBREW_ON_LINUX-}" ]]; then
      #Mac
      if [[ "$UNAME_MACHINE" == "arm64" ]]; then
        #M1
        HOMEBREW_PREFIX="/opt/homebrew"
        HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
      else
        #Inter
        HOMEBREW_PREFIX="/usr/local"
        HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
      fi
    else
      HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
      HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
    fi

    if [[ ! -e ${HOMEBREW_REPOSITORY}/bin/brew ]]; then
      echo ""${NOTICE}": Start installing brew..."
      THIS=$(pwd)
      cd
      [[ -e ~/.zprofile ]] && mv ~/.zprofile ~/.zprofile_bak
      rm Homebrew.sh
      wget https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh
      sed -i 's/mirrors\.tuna\.tsinghua\.edu\.cn\\\/linuxbrew-bottles\\\/bottles-portable-ruby/mirrors.ustc.edu.cn\\\/linuxbrew-bottles\\\/bottles-portable-ruby/' Homebrew.sh
      sed -i 's/mirrors\.tuna\.tsinghua\.edu\.cn\\\/homebrew-bottles\\\/bottles-portable-ruby/mirrors.ustc.edu.cn\\\/homebrew-bottles\\\/bottles-portable-ruby/' Homebrew.sh
      bash Homebrew.sh
      rm Homebrew.sh
      if [[ -e ~/.zprofile && -e ~/.zprofile_bak ]]; then
        rm ~/.zprofile
        mv ~/.zprofile_bak ~/.zprofile
      fi
      cd "${THIS}"
    fi
}


function firacode () {
    fonts_dir="/usr/share/fonts/firacode"
    [[ -e $fonts_dir ]]; return

    echo "sudo mkdir -p $fonts_dir"
    sudo mkdir -p "${fonts_dir}"

    version=6.2
    zip=Fira_Code_v${version}.zip
    sudo curl --fail --location --show-error https://ghproxy.com/https://github.com/tonsky/FiraCode/releases/download/${version}/${zip} --output ${zip}
    sudo unzip -o -q -d ${fonts_dir} ${zip}
    sudo rm ${zip}
    sudo mv /usr/share/fonts/firacode/**/*.ttf /usr/share/fonts/firacode

    echo "sudo fc-cache -f -v"
    sudo fc-cache -f -v
}


if [[ -z $1 ]]; then
    echo 'Please select an item to install.'
fi

while [[ ! -z $1 ]]; do
    eval "$1"
    shift
done

# cleanup
# rm -rf ${TEMP_FOLDER}
