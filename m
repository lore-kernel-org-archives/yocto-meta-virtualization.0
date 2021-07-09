Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.5618.1625796416580004724
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 08 Jul 2021 19:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=swLlFCcs;
 spf=neutral (domain: fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@fujitsu.com)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 60D1F38C0701
	for <meta-virtualization@yoctoproject.org>; Fri,  9 Jul 2021 02:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625796413; i=@fujitsu.com;
	bh=t/7GHD4I1x/kET0tjW8XgFJqgp53B4H08W4bgBFa+Qo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=swLlFCcsl49v4cV4KDz45Z6ZH2a/CW3xtMh5dRzN20A81Y9t0UtruGX0Q1WKPRDkE
	 SDcXpYiaU3LAoW4EJxzgjAmw+pXauRh89aasRZQAi8F5xms27kU/kiG0+lQXM88Gx3
	 n9xFeAji29hCay/FUrWRNrTgAVxuGsRb6z3dByyX2wdLLhOyLMp6T6MgYeljHwooYG
	 UOJbsh6AwkiDr+GNdDinihWIsEaxTFVuJD45gh+p1BbEK1ttsZS8sof7cEYjjg888+
	 n9htyoZbxAZXQnOdLk7MvtYkma8eiv0zvKwcGvqz1UILA9CqaH+vchZZDa4ZIrF7W8
	 b4I8iv8Glk2uQ==
Received: from [100.112.199.200] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 75/A6-07821-D3FA7E06; Fri, 09 Jul 2021 02:06:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxVddm/fM
  Eg8MT5C1uHzjC7MDo0X6ijy2AMYo1My8pvyKBNePNouksBU3OFb+v9TM3MG4162Lk4hASmMok
  0T2xjx3COc4o8XvtTuYuRk4ONgEdiY4X3SwgtoiAlkR76y+wuLBAgMT68x8YQWwWARWJ7rdNY
  DavgLvElb5d7CC2hICCxJSH75kh4oISJ2c+AZvDLKAp0br9NzuELS/RvHU2M0S9osT2nWdYIO
  wKiRkztrFNYOSdhaR9FpL2WUjaFzAyr2K0SCrKTM8oyU3MzNE1NDDQNTQ00jW0NNM1MjTRS6z
  STdJLLdUtTy0u0TXUSywv1iuuzE3OSdHLSy3ZxAgMvJSCI9d2MB54/UHvEKMkB5OSKK/WjOcJ
  QnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4u5YD5QSLUtNTK9Iyc4BRAJOW4OBREuHlXASU5i0uS
  MwtzkyHSJ1i9ObYeXrxImaOZ2uXAMkN85YCyf937wLJ/gUHVzNz3Gw/tJpZiCUvPy9VSpyXYx
  3QCAGQERmleXALYNF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw70OQKTyZeSVwd7wCOpE
  J6ESGw09BTixJREhJNTBN7jGpt9rRtkKyfXXH18OzTOR2r4tcsK06xuhWyekXqwvP33wym7FY
  7KxLprxOs8dmpSZ+17c7OutWXGezXdASuvKutoPoNuOTlm8irudov/F+H3nGMMiMZYFpb9WiG
  gmvumsd1pJLpoQVSs0w+8lnFRxXtSNng9yWOuXTE3d479R/P3vty7kr0w0OMyS7CLJMCd+jan
  Fgnm+gwUpDk95fZipMpw7OU9+6McLl4RenzV1aBzMlgi9/XzJt3kyPXPmyR7JGKllxjyRs2h6
  WrVAodFAMV6li573YGnt1jm2T0jHG9EciG23WfSjTWLCci0d+5veTtYoft86+qzCp1nzNtivO
  6yxM3rycdiJyRbMSS3FGoqEWc1FxIgALTPX8YQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-285.messagelabs.com!1625796412!238768!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21764 invoked from network); 9 Jul 2021 02:06:52 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-6.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jul 2021 02:06:52 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1691aXTv023508
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Fri, 9 Jul 2021 02:36:42 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 9 Jul 2021 02:36:31 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] open-iscsi-user: upgrade 2.0-873 -> 2.1.4
Date: Fri, 9 Jul 2021 09:36:24 +0800
Message-ID: <1625794584-29456-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

open-iscsi-2.1.3 - open-iscsi-2.1.4

Abhinav Rajagopalan (1):
      Fix typo in util.py

Chris Leech (3):
      libopeniscsiusr: fix error messages
      libopeniscsiusr: skip over removed sessions
      libopeniscsiusr: dont error loudly if a session isn't found when wo=
rking through iscsi_sessions_get()

Fabian M=C3=B6ller (1):
      iscsid: Add NO_SYSTEMD to CFLAGS

Helmut Grohne (1):
      Avoid hardcoding pkg-config to fix cross build

John Schaeffer (1):
      Add etc/systemd/iscsi-init.service to SYSTEMDFILES Makefile variabl=
e

Lee Duncan (4):
      iscsid: Do not allow conflicting pid-file options
      Fix iscsiadm segfault when exiting
      Fix iscsistart login issue when target is delayed.
      Enable iscsi.service asynchronous logins, cleanup services

Matwey V. Kornilov (1):
      Wants=3Dnetwork-online.target in iscsi.service

Patrick Lawrence (1):
      Change mkdir permissions to 0770, adjust usmask

Wenchao Hao (4):
      idbm: Fix memory leak and NULL pointer dereference in idbm_rec_upda=
te_param()
      libopeniscsiusr: Fix memory leak in iscsi_nodes_get()
      libopeniscsiusr: Fix memory leak in iscsi_sessions_get()
      iscsiadm: Fix memory leak in iscsiadm

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../0001-fix-build-error-of-cross-build.patch | 24 ++++----
 .../open-iscsi/open-iscsi-user_2.0-873.bb     | 55 -----------------
 .../open-iscsi/open-iscsi-user_2.1.4.bb       | 61 +++++++++++++++++++
 3 files changed, 73 insertions(+), 67 deletions(-)
 delete mode 100644 meta-openstack/recipes-connectivity/open-iscsi/open-i=
scsi-user_2.0-873.bb
 create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/open-i=
scsi-user_2.1.4.bb

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fi=
x-build-error-of-cross-build.patch b/meta-openstack/recipes-connectivity/=
open-iscsi/files/0001-fix-build-error-of-cross-build.patch
index 206da48..8eec2dc 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build=
-error-of-cross-build.patch
+++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build=
-error-of-cross-build.patch
@@ -1,30 +1,30 @@
-From 943a321104a5b2c4ac25bdb2ae81b5b208e3973c Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Tue, 18 Aug 2015 10:29:35 +0900
+From 2ba83ff539c18d02f8e4b4ce7903a5b46f364609 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Thu, 8 Jul 2021 15:06:27 +0900
 Subject: [PATCH] fix build error of cross build
=20
 The error likes as following
 | configure: error: cannot run C compiled programs.
 | If you meant to cross compile, use `--host'.
=20
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Makefile b/Makefile
-index c5d9700..1f31e43 100644
+index 7f52cc8..cadbc47 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -42,7 +42,7 @@ user: utils/open-isns/Makefile
+@@ -78,7 +78,7 @@ user: iscsiuio/Makefile
  	@echo "Read README file for detailed information."
 =20
- utils/open-isns/Makefile: utils/open-isns/configure utils/open-isns/Mak=
efile.in
--	cd utils/open-isns; ./configure CFLAGS=3D"$(OPTFLAGS)" --with-security=
=3Dno
-+	cd utils/open-isns; ./configure CFLAGS=3D"$(OPTFLAGS)" --with-security=
=3Dno ${CONFIGURE_ARGS}
+ iscsiuio/Makefile: iscsiuio/configure iscsiuio/Makefile.in
+-	cd iscsiuio; ./configure $(WITHOUT_ARG)
++	cd iscsiuio; ./configure $(WITHOUT_ARG) $(CONFIGURE_ARGS)
 =20
- kernel: force
- 	$(MAKE) -C kernel
+ iscsiuio/configure iscsiuio/Makefile.in: iscsiuio/configure.ac iscsiuio=
/Makefile.am
+ 	cd iscsiuio; autoreconf --install
 --=20
-1.8.4.2
+2.25.1
=20
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-us=
er_2.0-873.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi=
-user_2.0-873.bb
deleted file mode 100644
index 4c9326e..0000000
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-=
873.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-DESCRIPTION =3D "Open-iSCSI project is a high performance, transport ind=
ependent, multi-platform implementation of RFC3720."
-HOMEPAGE =3D "http://www.open-iscsi.org/"
-LICENSE =3D "GPLv2"
-PR =3D "r1"
-
-inherit systemd
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f=
833"
-
-SRC_URI =3D "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz   \
-           file://0001-fix-build-error-of-cross-build.patch         \
-           file://open-iscsi                                        \
-           file://initiatorname.iscsi                               \
-           "
-
-
-S =3D "${WORKDIR}/open-iscsi-${PV}"
-TARGET_CC_ARCH +=3D "${LDFLAGS}"
-EXTRA_OEMAKE +=3D "CONFIGURE_ARGS=3D'--host=3D${HOST_SYS}'"
-
-do_compile () {
-        oe_runmake user
-}
-
-do_install () {
-        oe_runmake DESTDIR=3D"${D}" install_user
-        cp -f "${WORKDIR}/open-iscsi" "${D}/etc/init.d/"
-        install -m 0644 ${WORKDIR}/initiatorname.iscsi ${D}/etc/iscsi/in=
itiatorname.iscsi
-}
-
-
-SRC_URI[md5sum] =3D "8b8316d7c9469149a6cc6234478347f7"
-SRC_URI[sha256sum] =3D "7dd9f2f97da417560349a8da44ea4fcfe98bfd5ef284240a=
2cc4ff8e88ac7cd9"
-
-# systemd support
-PACKAGES =3D+ "${PN}-systemd"
-SRC_URI_append =3D "  file://iscsi-initiator                            =
       \
-                    file://iscsi-initiator.service                      =
     \
-                    file://iscsi-initiator-targets.service              =
     \
-                 "
-RDEPENDS_${PN} +=3D "bash"
-RDEPENDS_${PN}-systemd +=3D "${PN}"
-FILES_${PN}-systemd +=3D  "   ${base_libdir}/systemd                  \
-                            ${sysconfdir}/default/iscsi-initiator   \
-                        "
-SYSTEMD_PACKAGES =3D "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd =3D "iscsi-initiator.service iscsi-initiat=
or-targets.service"
-
-do_install_append () {
-        install -d ${D}${sysconfdir}/default/
-        install -m 0644 ${WORKDIR}/iscsi-initiator ${D}${sysconfdir}/def=
ault/
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/iscsi-initiator.service ${D}${systemd=
_unitdir}/system/
-        install -m 0644 ${WORKDIR}/iscsi-initiator-targets.service ${D}$=
{systemd_unitdir}/system/
-}
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-us=
er_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-u=
ser_2.1.4.bb
new file mode 100644
index 0000000..139ce1d
--- /dev/null
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.=
4.bb
@@ -0,0 +1,61 @@
+DESCRIPTION =3D "Open-iSCSI project is a high performance, transport ind=
ependent, multi-platform implementation of RFC3720."
+HOMEPAGE =3D "http://www.open-iscsi.org/"
+LICENSE =3D "GPLv2"
+PR =3D "r1"
+
+inherit systemd autotools pkgconfig
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+DEPENDS =3D "kmod openssl util-linux open-isns"
+DEPENDS_append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', '', d)}"
+
+SRC_URI =3D "git://github.com/open-iscsi/open-iscsi.git;protocol=3Dhttps=
   \
+           file://0001-fix-build-error-of-cross-build.patch \
+           "
+
+SRCREV =3D "095f59ca464220eae285de6b5f2ee31185a6a84c"
+
+S =3D "${WORKDIR}/git"
+B =3D "${S}"
+
+TARGET_CC_ARCH +=3D "${LDFLAGS}"
+EXTRA_OEMAKE +=3D "CONFIGURE_ARGS=3D'--host=3D${HOST_SYS}'"
+
+do_configure () {
+    :
+}
+
+do_compile () {
+        oe_runmake user
+}
+
+
+do_install () {
+        oe_runmake DESTDIR=3D"${D}" install_user
+        install ${S}/etc/initd/initd.debian ${D}/etc/init.d/open-iscsi
+        install -m 0644 ${S}/etc/iscsid.conf ${D}/etc/iscsi/
+
+        install -d ${D}${libdir}
+        install -Dm 0644 ${S}/libopeniscsiusr/libopeniscsiusr.so.0.2.0 $=
{D}${libdir}/
+        ln -sf ${libdir}/libopeniscsiusr.so.0.2.0 ${D}${libdir}/libcap-n=
g.so=20
+}
+
+# systemd support
+PACKAGES =3D+ "${PN}-systemd"
+RDEPENDS_${PN} +=3D "bash"
+RDEPENDS_${PN}-systemd +=3D "${PN}"
+FILES_${PN}-systemd +=3D  "${base_libdir}/systemd                  \
+                         ${sysconfdir}/default/iscsi-initiator   \
+                        "
+SYSTEMD_PACKAGES =3D "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd =3D "iscsi.service \
+                                 iscsiuio.service \
+                                 iscsid.service \
+                                 iscsi-init.service \
+                                 iscsid.socket \
+                                 iscsiuio.socket "
+
+do_install_append () {
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${S}/etc/systemd/* ${D}${systemd_unitdir}/system=
/
+}
--=20
2.25.1

