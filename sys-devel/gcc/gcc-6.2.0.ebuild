# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"

PATCH_VER="1.0"
#UCLIBC_VER="1.0"

inherit eutils toolchain

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd"

RDEPEND=""
DEPEND="${RDEPEND}
	elibc_glibc? ( >=sys-libs/glibc-2.13 )
	>=${CATEGORY}/binutils-2.20"

if [[ ${CATEGORY} != cross-* ]] ; then
	PDEPEND="${PDEPEND} elibc_glibc? ( >=sys-libs/glibc-2.13 )"
fi

src_prepare() {
	toolchain_src_prepare

	if use elibc_musl; then
		cd "${S}"
		epatch "${FILESDIR}"/4.9.3/posix_memalign.patch
		epatch "${FILESDIR}"/5.2.0/res_state.patch
		epatch "${FILESDIR}"/6.1.0/cilkrts.patch
		epatch "${FILESDIR}"/6.1.0/cpu_indicator.patch
		epatch "${FILESDIR}"/6.1.0/linux_libc_has_function.patch
	fi
}
