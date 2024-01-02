# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="zita-convolver"
PKG_VERSION="4.0.3"
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="Proprietary"
PKG_SITE="https://kokkinizita.linuxaudio.org/linuxaudio/"
PKG_URL="https://kokkinizita.linuxaudio.org/linuxaudio/downloads/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_SHA256="9aa11484fb30b4e6ef00c8a3281eebcfad9221e3937b1beb5fe21b748d89325f"
PKG_MAINTAINER="chipfunk" # Full name or forum/GitHub nickname, if you want to be identified as the addon maintainer
PKG_DEPENDS_TARGET="glibc"
PKG_SECTION="service/system"
PKG_SHORTDESC="Zita convolver"
PKG_LONGDESC="convolution engine, a program for applying long FIR filters to multi-channel digital audio."
PKG_TOOLCHAIN="make" # or one of auto, meson, cmake, cmake-make, configure, make, ninja, autotools, manual

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="zita convolver"
PKG_ADDON_TYPE="xbmc.service"

pre_make_target() {
  mv ${PKG_BUILD}/source/* ${PKG_BUILD}
}

post_make_target() {
  cd ${PKG_BUILD}/
  ln -sf libzita-convolver.so.${PKG_VERSION} libzita-convolver.so
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/usr/lib
  cp ${PKG_BUILD}/libzita-convolver.so* ${ADDON_BUILD}/${PKG_ADDON_ID}/usr/lib

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/usr/include
  cp ${PKG_BUILD}/zita-convolver.h ${ADDON_BUILD}/${PKG_ADDON_ID}/usr/include
}
