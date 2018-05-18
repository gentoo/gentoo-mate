# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MATE_LA_PUNT="yes"

inherit mate

if [[ ${PV} != 9999 ]]; then
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi

DESCRIPTION="MATE Notification daemon"
LICENSE="GPL-2"
SLOT="0"

IUSE=""

COMMON_DEPEND="dev-libs/atk:0
	>=dev-libs/dbus-glib-0.78:0
	>=dev-libs/glib-2.52:2
	>=sys-apps/dbus-1:0
	x11-libs/cairo:0
	>=x11-libs/gdk-pixbuf-2.22:2
	>=x11-libs/libnotify-0.7:0
	x11-libs/libX11:0
	virtual/libintl:0
	>=x11-libs/gtk+-3.22:3
	>=x11-libs/libwnck-3:3
	>=media-libs/libcanberra-0.4:0[gtk3]
	!x11-misc/notify-osd:*
	!x11-misc/qtnotifydaemon:*
	!x11-misc/notification-daemon:*"

RDEPEND="${COMMON_DEPEND}"

DEPEND="${COMMON_DEPEND}
	app-arch/xz-utils:0
	>=dev-util/intltool-0.50.1:*
	sys-devel/gettext:*
	>=sys-devel/libtool-2.2.6:2
	virtual/pkgconfig:*"

src_configure() {
	mate_src_configure
}

src_install() {
	mate_src_install

	insinto /usr/share/dbus-1/services
	doins "${FILESDIR}/org.freedesktop.Notifications.service"
}
