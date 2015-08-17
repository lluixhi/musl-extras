# MUSL Extras Repo

Gentoo's Hardened Development Repo tends to be out of date.

This repo exists to be bleeding edge, fix/update the hardened dev patches,
pull in patches from Voidlinux and Alpine, and create its own.

Features currently not found in other distros that support MUSL include:
* GCC 5.2.0 (Hardened)
* Linux Headers 4.1
* MESA using GLX-TLS under MUSL
* Working xf86-video-intel
* Firefox 40

More to come :)

## How to install the overlay

With paludis: see [Paludis repository configuration](http://paludis.exherbo.org/configuration/repositories/index.html)

With layman:
```layman -f -o https://raw.githubusercontent.com/lluixhi/musl-extras/master/musl-extras-overlay.xml -a musl-extras```
