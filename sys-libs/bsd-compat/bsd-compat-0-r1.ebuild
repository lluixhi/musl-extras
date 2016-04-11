# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Provides BSD Libc compat headers"

HOMEPAGE="https://www.alpinelinux.org"
SRC_URI="
	${FILESDIR}/sys-tree.h.bz2
	${FILESDIR}/sys-queue.h.bz2"

LICENSE="BSD"

SLOT="0"

KEYWORDS="amd64 arm ~mips ppc x86"

S="${WORKDIR}"
src_install() {
	insinto /usr/include/sys
	newins "${WORKDIR}/sys-queue.h" queue.h
	newins "${WORKDIR}/sys-tree.h" tree.h
}
