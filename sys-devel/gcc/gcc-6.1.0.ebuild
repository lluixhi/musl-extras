# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"

PATCH_VER="1.1"
#UCLIBC_VER="1.0"

# Hardened gcc 4 stuff
# PIE_VER="0.6.5"
# SPECS_VER="0.2.0"
# SPECS_GCC_VER="4.4.3"
# arch/libc configurations known to be stable with {PIE,SSP}-by-default
# PIE_GLIBC_STABLE="x86 amd64 mips ppc ppc64 arm ia64"
# PIE_UCLIBC_STABLE="x86 arm amd64 mips ppc ppc64"
# SSP_STABLE="amd64 x86 mips ppc ppc64 arm"
# uclibc need tls and nptl support for SSP support
# uclibc need to be >= 0.9.33
# SSP_UCLIBC_STABLE="x86 amd64 mips ppc ppc64 arm"
PIE_MUSL_STABLE="amd64 arm ppc mips x86"
SSP_MUSL_STABLE="amd64 arm ppc mips"
#end Hardened stuff

inherit eutils toolchain

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd"

RDEPEND=""
DEPEND="${RDEPEND}
	elibc_glibc? ( >=sys-libs/glibc-2.8 )
	>=${CATEGORY}/binutils-2.20"

if [[ ${CATEGORY} != cross-* ]] ; then
	PDEPEND="${PDEPEND} elibc_glibc? ( >=sys-libs/glibc-2.8 )"
fi

src_prepare() {
	toolchain_src_prepare

	epatch "${FILESDIR}"/${P}-3-arg-phi.patch

	if use elibc_musl; then
		cd "${S}"
		epatch "${FILESDIR}"/4.9.3/posix_memalign.patch
		epatch "${FILESDIR}"/5.2.0/res_state.patch
		epatch "${FILESDIR}"/${PV}
	fi
}
