Return-Path: <Chong.Lu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6C1EE00563; Wed,  3 Sep 2014 02:12:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BD71E00524
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Sep 2014 02:12:53 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s839Cpa1024558
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Sep 2014 02:12:52 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Sep 2014 02:12:51 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <1409735569-22903-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: bruce.ashfield@windriver.com
Subject: [PATCH V2] lxc: fix RDEPENDS on bash
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
Date: Wed, 03 Sep 2014 09:12:57 -0000
X-Original-Date: Wed, 3 Sep 2014 17:12:49 +0800
X-List-Received-Date: Wed, 03 Sep 2014 09:12:57 -0000
Content-Type: text/plain

Split a ${PN}-template pkg to put ${datadir}/lxc/templates/, and debash in
${datadir}/lxc/hooks/*

Bash scripts:
lxc/usr/share/lxc/hooks/mountcgroups:#!/bin/bash
lxc/usr/share/lxc/hooks/ubuntu-cloud-prep:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-debian:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-openmandriva:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-archlinux:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-centos:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-plamo:1:#!/bin/bash -eu
lxc/usr/share/lxc/templates/lxc-ubuntu-cloud:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-opensuse:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-gentoo:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-altlinux:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-sshd:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-ubuntu:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-cirros:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-busybox:1:#!/bin/bash
lxc/usr/share/lxc/templates/lxc-fedora:1:#!/bin/bash

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 recipes-containers/lxc/lxc_1.0.5.bb |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/lxc/lxc_1.0.5.bb b/recipes-containers/lxc/lxc_1.0.5.bb
index bea1ad0..c0603ee 100644
--- a/recipes-containers/lxc/lxc_1.0.5.bb
+++ b/recipes-containers/lxc/lxc_1.0.5.bb
@@ -37,10 +37,11 @@ S = "${WORKDIR}/${BPN}-${PV}"
 PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
 EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "templates"
 PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,,"
 PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
 PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
+PACKAGECONFIG[templates] = ",,, ${PN}-templates"
 
 inherit autotools pkgconfig ptest
 
@@ -48,6 +49,9 @@ FILES_${PN}-doc = "${mandir} ${infodir}"
 # For LXC the docdir only contains example configuration files and should be included in the lxc package
 FILES_${PN} += "${docdir}"
 FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
+PACKAGES =+ "${PN}-templates"
+FILES_${PN}-templates += "${datadir}/lxc/templates"
+RDEPENDS_${PN}-templates += "bash"
 
 PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
 
@@ -57,8 +61,11 @@ do_install_append() {
 	rm -rf ${D}${localstatedir}/cache
 	install -d ${D}${sysconfdir}/default/volatiles
 	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
-	     > ${D}${sysconfdir}/default/volatiles/99_lxc
+	    > ${D}${sysconfdir}/default/volatiles/99_lxc
 
+	# The checkbashisms shows there are no bashism, so use /bin/sh.
+	for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
+	    sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
 }
 
 EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
-- 
1.7.9.5


