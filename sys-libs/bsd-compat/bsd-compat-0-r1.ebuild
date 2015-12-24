# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit base

DESCRIPTION="Provides BSD Libc compat headers"

HOMEPAGE="https://www.alpinelinux.org"
SRC_URI=""

LICENSE="BSD"

SLOT="0"

KEYWORDS="amd64 arm ~mips ppc x86"

S="${WORKDIR}"
src_install() {
	insinto /usr/include/sys
	newins "${FILESDIR}/sys-queue.h" queue.h
	newins "${FILESDIR}/sys-tree.h" tree.h
}
