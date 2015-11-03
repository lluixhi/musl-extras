# MUSL Extras Repo

Gentoo's Hardened Development Repo is on the stable side.

This repo exists to be bleeding edge, fix/update the hardened dev patches,
pull in patches from Voidlinux and Alpine, and create its own.

Features currently not found in other distros that support MUSL include:
* GCC 5.2.0 (Hardened)
* Linux Headers 4.2
* Working xf86-video-intel
* Latest ElfUtils

More to come :)

## Note on Icedtea
Icedtea requires a JDK to bootstrap it, and GCJ is broken.
The two ways to install it then are to get Gentoo to allow me to host a musl
icedtea-bin, or to add a hacky icedtea-bin package that downloads from Alpine.

## How to install the overlay

With paludis: see [Paludis repository configuration](http://paludis.exherbo.org/configuration/repositories/index.html)

With layman:
```layman -a musl```
```layman -f -o https://raw.githubusercontent.com/lluixhi/musl-extras/master/musl-extras-overlay.xml -a musl-extras```
