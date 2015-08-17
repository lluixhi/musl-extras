# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lua/lpeg/lpeg-0.12.2.ebuild,v 1.1 2015/03/08 16:57:50 radhermit Exp $

EAPI=5

inherit flag-o-matic toolchain-funcs eutils multilib

DESCRIPTION="Parsing Expression Grammars for Lua"
HOMEPAGE="http://www.inf.puc-rio.br/~roberto/lpeg/"
SRC_URI="http://www.inf.puc-rio.br/~roberto/${PN}/${PN}-0.12.2.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~mips ~x86"
IUSE="debug doc luajit"

RDEPEND="
	luajit? ( dev-lang/luajit:2 )
	!luajit? ( >=dev-lang/lua-5.1 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.12.1-makefile.patch
	use debug && append-cflags -DLPEG_DEBUG
}

src_compile() {
	if use luajit; then
		emake CC="$(tc-getCC)" LUADIR="/usr/include/luajit-2.0"
	else
		emake CC="$(tc-getCC)"
	fi
}

src_test() {
	if use luajit; then
		luajit test.lua || die
	else
		lua test.lua || die
	fi
}

src_install() {
	if use luajit; then
		exeinto "$($(tc-getPKG_CONFIG) --variable INSTALL_CMOD luajit)"
	else
		exeinto "$($(tc-getPKG_CONFIG) --variable INSTALL_CMOD lua)"
	fi

	doexe lpeg.so

	dodoc HISTORY

	use doc && dohtml *
}
