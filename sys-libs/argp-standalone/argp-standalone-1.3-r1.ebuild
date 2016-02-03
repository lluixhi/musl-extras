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
IUSE="static-libs"

DEPEND="!sys-libs/glibc"

src_prepare() {
	epatch "${FILESDIR}/${P}-shared.patch"
	epatch "${FILESDIR}/${P}-throw-in-funcdef.patch"

	# Fix for linking against elfutils
	epatch "${FILESDIR}/${P}-gnu89-inline.patch"

	eautoreconf
}

src_configure() {
	econf \
	$(use_enable static-libs static)
}

src_install() {
	default
	insinto /usr/include
	doins argp.h
}
