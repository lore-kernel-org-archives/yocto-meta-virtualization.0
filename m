Return-Path: <Lei.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4185EE004D1
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Jan 2013 05:43:30 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r05DhS2r010652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 5 Jan 2013 05:43:29 -0800 (PST)
Received: from pek-lpgtest4.wrs.com (128.224.153.84) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sat, 5 Jan 2013 05:43:28 -0800
From: <lei.yang@windriver.com>
To: <lei.yang@windriver.com>, <meta-virtualization@yoctoproject.org>,
	<david.c.nystrom@gmail.com>
Date: Sat, 5 Jan 2013 21:43:26 +0800
Message-ID: <1357393406-11707-1-git-send-email-lei.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] Update the netcat with debian patches to fix some error
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
X-List-Received-Date: Sat, 05 Jan 2013 13:43:30 -0000
Content-Type: text/plain

From: Lei Yang <lei.yang@windriver.com>

I know we have the patches in debian dir in the previous version,
but I meet lots of patch error.so I change it to debian.org version

The background I do this change is:
I'm a kvm tester,without patches it will meet error when I do the migrate
testing with  -incoming "exec:nc -l 5200" it meets error:
"nc: Protocol no available."

You can reproduce it simplely with "nc -l 5200" on your board

Lei

Signed-off-by: Lei Yang <lei.yang@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.0.0.bb        |    2 +-
 recipes-networking/netcat/netcat-openbsd_1.89.bb |   34 ++++++++++++++++++++++
 recipes-networking/netcat/openbsd-netcat_1.6.bb  |   29 ------------------
 3 files changed, 35 insertions(+), 30 deletions(-)
 create mode 100644 recipes-networking/netcat/netcat-openbsd_1.89.bb
 delete mode 100644 recipes-networking/netcat/openbsd-netcat_1.6.bb

diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb b/recipes-extended/libvirt/libvirt_1.0.0.bb
index 5374237..90d7dbb 100644
--- a/recipes-extended/libvirt/libvirt_1.0.0.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
 # These might be included by PACKAGECONFIG
 #RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
 
-RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq openbsd-netcat"
+RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd"
 RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
 RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
 
diff --git a/recipes-networking/netcat/netcat-openbsd_1.89.bb b/recipes-networking/netcat/netcat-openbsd_1.89.bb
new file mode 100644
index 0000000..60943a4
--- /dev/null
+++ b/recipes-networking/netcat/netcat-openbsd_1.89.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "OpenBSD Netcat"
+HOMEPAGE = "http://ftp.debian.org"
+SECTION = "console/network"
+LICENSE = "BSD-3-Clause"
+PR = "r0"
+
+SRC_URI = "http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/netcat-openbsd_1.89.orig.tar.gz;name=netcat \
+           http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz;name=netcat-patch"
+SRC_URI[netcat.md5sum] = "7238ce15aae43069e96ba7faf03f153e"
+SRC_URI[netcat.sha256sum] = "72e844dde8a2a7cba61971d493758dbea9ef0b164bccef15fd4a36490dc77f2b"
+SRC_URI[netcat-patch.md5sum] = "00c65aa22243b76998174c733cbb64cc"
+SRC_URI[netcat-patch.sha256sum] = "d5b6b2bd9788114bdcfbb71acad0263720b4fdc41529e287adf451b8610f84f1"
+
+S = "${WORKDIR}/${PN}-${PV}.orig"
+inherit update-alternatives gettext
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
+	install -d ${D}${bindir}
+	install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
+}
+
+ALTERNATIVE_${PN} = "nc"
+ALTERNATIVE_PRIORITY = "101"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/recipes-networking/netcat/openbsd-netcat_1.6.bb b/recipes-networking/netcat/openbsd-netcat_1.6.bb
deleted file mode 100644
index 1ae3f37..0000000
--- a/recipes-networking/netcat/openbsd-netcat_1.6.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "OpenBSD Netcat"
-HOMEPAGE = "http://code.google.com/p/openbsd-netcat/"
-SECTION = "console/network"
-LICENSE = "BSD-3-Clause"
-PR = "r0"
-
-SRCREV = "5"
-
-SRC_URI = "svn://openbsd-netcat.googlecode.com/svn;module=trunk;protocol=http"
-S = "${WORKDIR}/trunk"
-
-inherit update-alternatives gettext
-
-do_configure[noexec] = "1"
-
-do_compile() {
-	cd ${S}
-	oe_runmake
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
-}
-
-ALTERNATIVE_${PN} = "nc"
-ALTERNATIVE_PRIORITY = "101"
-
-BBCLASSEXTEND = "nativesdk"
-- 
1.7.1


