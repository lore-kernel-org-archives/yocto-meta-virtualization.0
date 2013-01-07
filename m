Return-Path: <Lei.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA521E01410
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Jan 2013 17:38:32 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r071cQjE001050
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 6 Jan 2013 17:38:26 -0800 (PST)
Received: from pek-lpgtest4.wrs.com (128.224.153.84) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 6 Jan 2013 17:38:26 -0800
From: <lei.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe.MacDonald@windriver.com>,
	<meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>,
	<david.c.nystrom@gmail.com>
Date: Mon, 7 Jan 2013 09:38:24 +0800
Message-ID: <1357522704-9608-1-git-send-email-lei.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [meta-networking][PATCHV2] Add netcat-bsd into meta-networking for meta-virutalization libvirt virt-test
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 01:38:32 -0000
Content-Type: text/plain

From: Lei Yang <lei.yang@windriver.com>

The netcat-openbsd in meta-virtualization layer has bugs.
This update version will fix "nc: Protocol no available." error.
As bruce point, we want to keep netcat in the meta-networking,
which meta-virtualization will depend on,and this patch will let
netcat-openbsd with low priority to install

Lei

Signed-off-by: Lei Yang <lei.yang@windriver.com>
---
 .../recipes-support/netcat/netcat-openbsd_1.89.bb  |   30 ++++++++++++++++++++
 meta-networking/recipes-support/netcat/netcat.inc  |    5 +++
 .../recipes-support/netcat/netcat_0.7.1.bb         |   11 +++----
 3 files changed, 40 insertions(+), 6 deletions(-)
 create mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
 create mode 100644 meta-networking/recipes-support/netcat/netcat.inc

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
new file mode 100644
index 0000000..f83caee
--- /dev/null
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
@@ -0,0 +1,30 @@
+require netcat.inc
+DESCRIPTION = "OpenBSD Netcat"
+HOMEPAGE = "http://ftp.debian.org"
+LICENSE = "BSD-3-Clause"
+PR = "r0"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89.orig.tar.gz;name=netcat \
+           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz;name=netcat-patch"
+
+SRC_URI[netcat.md5sum] = "7238ce15aae43069e96ba7faf03f153e"
+SRC_URI[netcat.sha256sum] = "72e844dde8a2a7cba61971d493758dbea9ef0b164bccef15fd4a36490dc77f2b"
+SRC_URI[netcat-patch.md5sum] = "00c65aa22243b76998174c733cbb64cc"
+SRC_URI[netcat-patch.sha256sum] = "d5b6b2bd9788114bdcfbb71acad0263720b4fdc41529e287adf451b8610f84f1"
+
+S = "${WORKDIR}/${PN}-${PV}.orig"
+
+do_configure[noexec] = "1"
+
+do_compile() {
+	cd ${S}
+        while read line; do patch -p1 <debian/patches/$line; done <debian/patches/series
+	pkgrel=4
+	oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""
+}
+
+do_install() {
+        install -d ${D}${bindir}
+        install -m 755 ${S}/nc ${D}${bindir}/nc.${PN}
+}
+ALTERNATIVE_PRIORITY = "50"
diff --git a/meta-networking/recipes-support/netcat/netcat.inc b/meta-networking/recipes-support/netcat/netcat.inc
new file mode 100644
index 0000000..6c815d9
--- /dev/null
+++ b/meta-networking/recipes-support/netcat/netcat.inc
@@ -0,0 +1,5 @@
+SECTION = "console/network"
+inherit update-alternatives gettext
+
+ALTERNATIVE_${PN} = "nc"
+
diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index c5ab85d..c4f1f33 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -1,21 +1,20 @@
+require netcat.inc
 DESCRIPTION = "GNU Netcat"
 HOMEPAGE = "http://netcat.sourceforge.net"
-SECTION = "console/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "0a29eff1736ddb5effd0b1ec1f6fe0ef"
 SRC_URI[sha256sum] = "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df09676332bb"
 
-inherit autotools update-alternatives gettext
+inherit autotools
 
 do_install_append() {
-	mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
+        install -d ${D}${bindir}
+        mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
 }
-
-ALTERNATIVE_${PN} = "nc"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.1


