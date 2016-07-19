# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit kde5 multibuild

DESCRIPTION="Breeze visual style for the Plasma desktop"
HOMEPAGE="https://projects.kde.org/projects/kde/workspace/breeze"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="qt4"

COMMON_DEPEND="
	$(add_frameworks_dep frameworkintegration)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kwayland)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_plasma_dep kdecoration)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	x11-libs/libxcb
	qt4? (
		kde-base/kdelibs:4
		x11-libs/libX11
	)
"
DEPEND="${COMMON_DEPEND}
	$(add_frameworks_dep kpackage)
"
RDEPEND="${COMMON_DEPEND}
	$(add_frameworks_dep breeze-icons)
	$(add_plasma_dep kde-cli-tools)
"

pkg_setup() {
	kde5_pkg_setup
	MULTIBUILD_VARIANTS=( kf5 $(usev qt4) )
}

src_configure() {
	myconfigure() {
		local mycmakeargs=()

		if [[ ${MULTIBUILD_VARIANT} = qt4 ]] ; then
			mycmakeargs+=( -DUSE_KDE4=true )
		fi

		kde5_src_configure
	}

	multibuild_foreach_variant myconfigure
}

src_compile() {
	multibuild_foreach_variant kde5_src_compile
}

src_test() {
	multibuild_foreach_variant kde5_src_test
}

src_install() {
	multibuild_foreach_variant kde5_src_install
}
