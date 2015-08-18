# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"

inherit eutils autotools flag-o-matic

DESCRIPTION="Standalone argp library for use with uclibc"
HOMEPAGE="http://www.lysator.liu.se/~nisse/misc/"
SRC_URI="http://www.lysator.liu.se/~nisse/misc/argp-standalone-1.3.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 ~mips ~ppc x86"
IUSE=""

DEPEND="!sys-libs/glibc"

src_prepare() {
	epatch "${FILESDIR}/${P}-throw-in-funcdef.patch"

	# Fix for linking against elfutils
	epatch "${FILESDIR}/${P}-gnu89-inline.patch"
	append-flags "-fPIC"

	eautoreconf
}

src_install() {
	dolib.a libargp.a

	insinto /usr/include
	doins argp.h
}
