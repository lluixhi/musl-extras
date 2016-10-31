# MUSL Extras Repo

This repo existed to provide unstable packages in addition to Gentoo's musl
overlay.

It's transitioning into an experimental (read: mostly broken) musl overlay. The
packages are slowly being moved into the official musl overlay.

Features currently not found in other distros that support MUSL include:
* GCC 6.2.0
* Latest Linux Headers
* Working xf86-video-intel
* Latest ElfUtils
* Icecat
* Icedtea 8
* SystemTap
* More!

## Note on Icedtea
Icedtea requires a JDK to bootstrap it, and GCJ is broken.
The two ways to install it then are to get Gentoo to allow me to host a musl
icedtea-bin, or to add a hacky icedtea-bin package that downloads from Alpine.

## How to install the overlay

With paludis: see [Paludis repository configuration](http://paludis.exherbo.org/configuration/repositories/index.html)

With layman:
```
layman -a musl
layman -f -o https://raw.githubusercontent.com/lluixhi/musl-extras/master/musl-extras-overlay.xml -a musl-extras
```
