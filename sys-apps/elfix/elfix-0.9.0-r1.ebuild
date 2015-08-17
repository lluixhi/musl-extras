# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils

DESCRIPTION="A suite of tools to work with ELF objects on Hardened Gentoo"
HOMEPAGE="http://www.gentoo.org/proj/en/hardened/pax-quickstart.xml
	http://dev.gentoo.org/~blueness/elfix/"
SRC_URI="http://dev.gentoo.org/~blueness/elfix/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sparc x86"
IUSE="+ptpax +xtpax"

REQUIRED_USE="|| ( ptpax xtpax )"

# These only work with a properly configured PaX kernel
RESTRICT="test"

DEPEND="~dev-python/pypax-${PV}[ptpax=,xtpax=]
	ptpax? ( dev-libs/elfutils )
	xtpax? ( sys-apps/attr )"

RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-backport-fix-paxmark_sh.patch
	epatch "${FILESDIR}"/${P}-backport-fix-revdep-pax.patch
}

src_configure() {
	# Fix MUSL gelf.h failure in configure
	export CFLAGS="${CFLAGS} -D_GNU_SOURCE"

	rm -f "${S}/scripts/setup.py"
	econf --disable-tests \
		$(use_enable ptpax) \
		$(use_enable xtpax)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog INSTALL README THANKS TODO
}
