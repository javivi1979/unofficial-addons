################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2011 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="imlib2"
PKG_VERSION="1.4.9"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://web.enlightenment.org/"
PKG_URL="$SOURCEFORGE_SRC/enlightenment/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libjpeg-turbo libpng tiff zlib bzip2 libX11 libXext"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="Imlib2 is a graphics library."
PKG_LONGDESC="Imlib2 is a graphics library for file loading, saving, rendering, manipulation."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_MAINTAINER="vpeter4 (peter.vicman@gmail.com)"

case "$TARGET_ARCH" in
  x86_64)
    MMX_ARG="--enable-mmx --enable-amd64"
    ;;
  *)
    MMX_ARG="--disable-mmx --disable-amd64"
    ;;
esac

PKG_CONFIGURE_OPTS_TARGET="$MMX_ARG \
                          --with-jpeg \
                          --with-png \
                          --with-tiff \
                          --with-gif \
                          --with-zlib \
                          --with-bzip2 \
                          --without-id3"

pre_build_target() {
  sed -i "s|#define SYS_LOADERS_PATH .*|#define SYS_LOADERS_PATH \"$VDR_ADDON_DIR/lib/imlib2\"|" $PKG_BUILD/src/lib/loaderpath.h
}
