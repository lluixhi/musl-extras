# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit autotools eutils flag-o-matic

DESCRIPTION="Standalone argp library for use with uclibc"
HOMEPAGE="http://www.lysator.liu.se/~nisse/misc/"
SRC_URI="http://www.lysator.liu.se/~nisse/misc/argp-standalone-1.3.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~m68k ~mips ~ppc ~s390 ~sh ~x86"
IUSE="static-libs"

DEPEND="!sys-libs/glibc"

src_prepare() {
	epatch "${FILESDIR}/${P}-throw-in-funcdef.patch"
	epatch "${FILESDIR}/${P}-shared.patch"

	eautoreconf
}

src_configure() {
	append-cflags -fgnu89-inline
	econf \
	$(use_enable static-libs static)
}

src_install() {
	default
	insinto /usr/include
	doins argp.h
}
