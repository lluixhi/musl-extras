# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A standalone library to implement GNU libc's obstack."
HOMEPAGE="http://libfirm.sourceforge.net"
SRC_URI="mirror://sourceforge/libfirm/obstack-${PV}.tar.bz2"
S=${WORKDIR}/obstack-${PV}
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

DEPEND="!sys-libs/glibc
		!sys-libs/uclibc"

src_configure() {
	econf \
	$(use_enable static-libs static)
}
