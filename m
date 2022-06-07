Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B737C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 03:15:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.7513.1654571742774067468
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 20:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GMZKXWkl;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654571740; i=@fujitsu.com;
	bh=Hai808WM2VtFYLetq3n0R3d9318uf9R4urxCz0NW6QI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GMZKXWklCyecm0hDL5ReTEtJnj+0ZhBhrUv8C4ljtess3SXB0FhAWIlnxzc9KqCSv
	 YWBw5BwikneiGkmiSDeLYT5hdofRjTrpNi0ITD0P1tOORfkO89NsivJ6MrjlPYCVI6
	 rZKipRQIUr5/Qui11HMaTzniwIzhFY3O8OjYf7bfvZauicWC4HPNJiWJEZafgFnQh0
	 PKOhyLrEapwPouSl3WbYr6+chotbi7avtTyFiYiGPKe2hNzICoi3lE0QdDnbuwpLJD
	 LBkQjScUjf4EPRH2VT37Wq2hsD4u3XOdoy7xHkosBIfcPbKsidKYNBn8sOMiuuloyF
	 GScGD+0+qRp8w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8OxWffOoXl
  JBrPaBS0WfXnG6sDoMfPUI+YAxijWzLyk/IoE1oxl916yF/yXqbi37jpLA+NT8S5GLg4hgceM
  EmcvH2GHcM4zScxt+MfUxcgJ5OxhlDj2whDEZhPQkNg99TIziC0iYCBx7tx8MJtZQE3i6MufY
  LawQJnElJ8dbCA2i4CKRMP3R6wgNq+Ai8SW9kawuISAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2
  aIGiWJt5f2MELYFRKvD1+CiqtJXD23iXkCI/8sJO2zkLQvYGRaxWiZVJSZnlGSm5iZo2toYKB
  raGiqa6hraqmXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYkinFjNY7GDv6
  fuodYpTkYFIS5d13YF6SEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQle7oNAOcGi1PTUirTMHGB8w
  KQlOHiURHh7QVp5iwsSc4sz0yFSpxgVpcR5O0D6BEASGaV5cG2wmLzEKCslzMvIwMAgxFOQWp
  SbWYIq/4pRnINRSZjXB2QKT2ZeCdz0V0CLmYAW+zyYA7K4JBEhJdXAJDXz0+Zft5NXWE6NtEp
  dtixb6+99z/+HF81MS9XceLorUVnsVa4C34ltZkxrvq9i9HUo4Xr8y8Bv1aOTC2SPhE0rfT5x
  6+lPqZLubAzzNjAqbzi3q2GCbDqD26nu+ru7t306GnR84Ys980pW3Hy/o0bxVzhPYpzEo92ie
  3LX6F3OU2ZbMD80eIHP5MgoO7dLW1XCyvRfi6kszb182zhCskUy8Xmq58+DDIkqIVJ6vk62M6
  7tXOKp8/BV8V6eTZyV/T1ay3i4Tt24ZnYv8qtN94Yw53edzS7as4/FJh5OnOYYcVXWnrtP5i5
  HiyPbv7AOn8ViDE/22q5c5s3HXf1vjqzGC0/V/JMPpFeXH9OLVWIpzkg01GIuKk4EAG4+9INE
  AwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1654571740!18891!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 862 invoked from network); 7 Jun 2022 03:15:40 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jun 2022 03:15:40 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CC7E72CC6
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue,  7 Jun 2022 04:15:39 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BFF442CBF
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue,  7 Jun 2022 04:15:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 7 Jun 2022 04:15:17 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [meta-virtualization] [PATCH] open-iscsi-user: Fix conflict error
 with systemd and net-snmp-server-snmptrapd.
Date: Tue, 7 Jun 2022 11:15:06 +0800
Message-ID: <1654571706-3858-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jun 2022 03:15:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7335

- reinstall service files
- deleted older version

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../open-iscsi/open-iscsi-user_2.1.4.bb            | 60 ----------------------
 .../open-iscsi/open-iscsi-user_2.1.7.bb            | 10 ++++
 2 files changed, 10 insertions(+), 60 deletions(-)
 delete mode 100644 meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
deleted file mode 100644
index 928290f..0000000
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-DESCRIPTION = "Open-iSCSI project is a high performance, transport independent, multi-platform implementation of RFC3720."
-HOMEPAGE = "http://www.open-iscsi.org/"
-LICENSE = "GPL-2.0-only"
-PR = "r1"
-
-inherit systemd autotools pkgconfig
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "kmod openssl util-linux open-isns"
-DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
-
-SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https;branch=master \
-           file://0001-fix-build-error-of-cross-build.patch \
-           "
-
-SRCREV = "095f59ca464220eae285de6b5f2ee31185a6a84c"
-
-S = "${WORKDIR}/git"
-B = "${S}"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-EXTRA_OEMAKE += "CONFIGURE_ARGS='--host=${HOST_SYS}'"
-
-do_configure () {
-    :
-}
-
-do_compile () {
-        oe_runmake user
-}
-
-do_install () {
-        oe_runmake DESTDIR="${D}" install_user
-        install ${S}/etc/initd/initd.debian ${D}/etc/init.d/open-iscsi
-        install -m 0644 ${S}/etc/iscsid.conf ${D}/etc/iscsi/
-
-        install -d ${D}${libdir}
-        install -Dm 0644 ${S}/libopeniscsiusr/libopeniscsiusr.so.0.2.0 ${D}${libdir}/
-        ln -sf ${libdir}/libopeniscsiusr.so.0.2.0 ${D}${libdir}/libopeniscsiusr.so
-}
-
-# systemd support
-PACKAGES =+ "${PN}-systemd"
-RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-systemd += "${PN}"
-FILES:${PN}-systemd +=  "${base_libdir}/systemd                  \
-                         ${sysconfdir}/default/iscsi-initiator   \
-                        "
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE:${PN}-systemd = "iscsi.service \
-                                 iscsiuio.service \
-                                 iscsid.service \
-                                 iscsi-init.service \
-                                 iscsid.socket \
-                                 iscsiuio.socket "
-
-do_install:append () {
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${S}/etc/systemd/* ${D}${systemd_unitdir}/system/
-}
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
index b4b9ebc..8cedff4 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
@@ -43,3 +43,13 @@ FILES:${PN} += " \
     ${systemd_system_unitdir}/iscsiuio.service \
     ${systemd_unitdir}/system-generators/ibft-rule-generator \
 "
+
+do_install:append() {
+    rm -rf ${D}${systemd_unitdir}/
+
+    install -d ${D}${systemd_unitdir}/system
+    install -d ${D}${systemd_unitdir}/system-generators
+    install -m 0644 ${S}/etc/systemd/*.service ${D}${systemd_unitdir}/system/
+    install -m 0644 ${S}/etc/systemd/*.socket ${D}${systemd_unitdir}/system/
+    install -m 0644 ${S}/etc/systemd/ibft-rule-generator ${D}${systemd_unitdir}/system-generators/
+}
-- 
1.8.3.1


