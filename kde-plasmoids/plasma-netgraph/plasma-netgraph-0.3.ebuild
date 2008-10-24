# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
NEED_KDE=":4.1"

inherit kde4-base

DESCRIPTION="A KDE4 Plasma Applet. This plasmoid shows network load on desktop."
HOMEPAGE="http://www.kde-look.org/content/show.php/Eyesaver?content=74071"
SRC_URI="http://ivplasma.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="4.1"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="!kde-misc/plasmoids
		kde-base/libplasma"
