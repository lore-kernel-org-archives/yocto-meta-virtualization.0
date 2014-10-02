Return-Path: <bogdan.purcareata@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D980EE0076C; Thu,  2 Oct 2014 09:19:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [157.56.110.134 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 95 seconds by postgrey-1.32 at yocto-www;
	Thu, 02 Oct 2014 09:19:06 PDT
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0134.outbound.protection.outlook.com [157.56.110.134])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 351C5E00749
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Oct 2014 09:19:06 -0700 (PDT)
Received: from CO2PR03CA0039.namprd03.prod.outlook.com (10.141.194.166) by
	BY2PR03MB190.namprd03.prod.outlook.com (10.242.36.141) with Microsoft
	SMTP Server (TLS) id 15.0.1039.15; Thu, 2 Oct 2014 16:03:11 +0000
Received: from BL2FFO11FD059.protection.gbl (2a01:111:f400:7c09::104) by
	CO2PR03CA0039.outlook.office365.com (2a01:111:e400:1414::38) with
	Microsoft SMTP Server (TLS) id 15.0.1044.10 via Frontend Transport;
	Thu, 2 Oct 2014 16:03:11 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD059.mail.protection.outlook.com (10.173.161.187) with
	Microsoft SMTP Server (TLS) id 15.0.1029.15 via Frontend Transport;
	Thu, 2 Oct 2014 16:03:10 +0000
Received: from exile.ea.freescale.net (exile.ea.freescale.net [10.171.73.223])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s92G34s4006293; Thu, 2 Oct 2014 09:03:08 -0700
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 2 Oct 2014 19:01:17 -0400
Message-ID: <1412290878-18574-2-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1412290878-18574-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1412290878-18574-1-git-send-email-bogdan.purcareata@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(104016003)(120916001)(84676001)(575784001)(87286001)(107046002)(47776003)(20776003)(15395725005)(102836001)(80022003)(110136001)(26826002)(46102003)(15202345003)(93916002)(33646002)(89996001)(104166001)(86362001)(92726001)(50466002)(85306004)(92566001)(62966002)(48376002)(36756003)(77156001)(97736003)(19580395003)(6806004)(68736004)(76176999)(50986999)(229853001)(44976005)(106466001)(19580405001)(2351001)(10300001)(50226001)(88136002)(95666004)(64706001)(76482002)(85852003)(105606002)(15975445006)(99396003)(87936001)(31966008)(4396001)(21056001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB190;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB190;
X-Forefront-PRVS: 03524FBD26
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=bogdan.purcareata@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/2] lxc: Update version to 1.0.6
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
X-List-Received-Date: Thu, 02 Oct 2014 16:19:10 -0000
Content-Type: text/plain

Also remove patch file that no longer applies.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 ...tomake-ensure-VPATH-builds-work-correctly.patch |   45 -----------
 recipes-containers/lxc/lxc_1.0.5.bb                |   80 --------------------
 recipes-containers/lxc/lxc_1.0.6.bb                |   79 +++++++++++++++++++
 3 files changed, 79 insertions(+), 125 deletions(-)
 delete mode 100644 recipes-containers/lxc/files/automake-ensure-VPATH-builds-work-correctly.patch
 delete mode 100644 recipes-containers/lxc/lxc_1.0.5.bb
 create mode 100644 recipes-containers/lxc/lxc_1.0.6.bb

diff --git a/recipes-containers/lxc/files/automake-ensure-VPATH-builds-work-correctly.patch b/recipes-containers/lxc/files/automake-ensure-VPATH-builds-work-correctly.patch
deleted file mode 100644
index 2a91951..0000000
--- a/recipes-containers/lxc/files/automake-ensure-VPATH-builds-work-correctly.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 08ccd79319e66b3f0b51fd5f5b539e652a16dfc0 Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Wed, 30 Apr 2014 11:06:12 -0400
-Subject: [PATCH] automake: ensure VPATH builds work correctly
-
-There were a few non-VPATH friendly directives in some Makefile.am files, fix
-these up to allow VPATH builds to work.
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- config/etc/Makefile.am | 4 ++--
- src/tests/Makefile.am  | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/config/etc/Makefile.am b/config/etc/Makefile.am
-index 81d7709..dca001e 100644
---- a/config/etc/Makefile.am
-+++ b/config/etc/Makefile.am
-@@ -4,8 +4,8 @@ distroconf = @LXC_DISTRO_CONF@
- 
- EXTRA_DIST = default.conf.ubuntu default.conf.libvirt default.conf.unknown
- 
--default.conf:
--	cp $(distroconf) $@
-+default.conf: $(distroconf)
-+	cp $? $@
- 
- clean-local:
- 	@$(RM) -f default.conf
-diff --git a/src/tests/Makefile.am b/src/tests/Makefile.am
-index 7f6645b..641e207 100644
---- a/src/tests/Makefile.am
-+++ b/src/tests/Makefile.am
-@@ -64,7 +64,7 @@ buildtest-TESTS: $(TESTS)
- install-ptest:
- 	install -d $(TEST_DIR)
- 	install -D ../lxc/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
--	install -D ../../config/test-driver $(TEST_DIR)/../../config/test-driver
-+	install -D $(top_srcdir)/config/test-driver $(TEST_DIR)/../../config/test-driver
- 	cp Makefile $(TEST_DIR)
- 	@(for file in $(TESTS); do install $$file $(TEST_DIR);  done;)
- 	sed -i 's|^Makefile:|_Makefile:|' $(TEST_DIR)/Makefile
--- 
-1.8.3.2
-
diff --git a/recipes-containers/lxc/lxc_1.0.5.bb b/recipes-containers/lxc/lxc_1.0.5.bb
deleted file mode 100644
index 232a3d0..0000000
--- a/recipes-containers/lxc/lxc_1.0.5.bb
+++ /dev/null
@@ -1,80 +0,0 @@
-DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-PRIORITY = "optional"
-DEPENDS = "libxml2 libcap"
-RDEPENDS_${PN} = " \
-		rsync \
-		gzip \
-		libcap-bin \
-		bridge-utils \
-		dnsmasq \
-		perl-module-strict \
-		perl-module-getopt-long \
-		perl-module-vars \
-		perl-module-warnings-register \
-		perl-module-exporter \
-		perl-module-constant \
-		perl-module-overload \
-		perl-module-exporter-heavy \
-"
-RDEPENDS_${PN}-ptest += "file make"
-
-SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
-	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
-	file://runtest.patch \
-	file://run-ptest \
-	file://automake-ensure-VPATH-builds-work-correctly.patch \
-	"
-SRC_URI[md5sum] = "9d9af9e9e69a831cd50b58d91c786013"
-SRC_URI[sha256sum] = "02ac82e69a76d424e5443b9c577e84a8eaafcebf17cfd865eedee147e8ef8844"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-# Let's not configure for the host distro.
-#
-PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
-EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
-
-PACKAGECONFIG ??= "templates"
-PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
-PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
-PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
-PACKAGECONFIG[templates] = ",,, ${PN}-templates"
-
-inherit autotools pkgconfig ptest
-
-FILES_${PN}-doc = "${mandir} ${infodir}"
-# For LXC the docdir only contains example configuration files and should be included in the lxc package
-FILES_${PN} += "${docdir}"
-FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
-PACKAGES =+ "${PN}-templates"
-FILES_${PN}-templates += "${datadir}/lxc/templates"
-RDEPENDS_${PN}-templates += "bash"
-
-PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
-
-do_install_append() {
-	# The /var/cache/lxc directory created by the Makefile
-	# is wiped out in volatile, we need to create this at boot.
-	rm -rf ${D}${localstatedir}/cache
-	install -d ${D}${sysconfdir}/default/volatiles
-	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
-	     > ${D}${sysconfdir}/default/volatiles/99_lxc
-
-	for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
-	    sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
-}
-
-EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
-
-do_install_ptest() {
-	oe_runmake -C src/tests install-ptest
-}
-
-pkg_postinst_${PN}() {
-	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
-		/etc/init.d/populate-volatile.sh update
-	fi
-}
diff --git a/recipes-containers/lxc/lxc_1.0.6.bb b/recipes-containers/lxc/lxc_1.0.6.bb
new file mode 100644
index 0000000..5b1eb0a
--- /dev/null
+++ b/recipes-containers/lxc/lxc_1.0.6.bb
@@ -0,0 +1,79 @@
+DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+PRIORITY = "optional"
+DEPENDS = "libxml2 libcap"
+RDEPENDS_${PN} = " \
+		rsync \
+		gzip \
+		libcap-bin \
+		bridge-utils \
+		dnsmasq \
+		perl-module-strict \
+		perl-module-getopt-long \
+		perl-module-vars \
+		perl-module-warnings-register \
+		perl-module-exporter \
+		perl-module-constant \
+		perl-module-overload \
+		perl-module-exporter-heavy \
+"
+RDEPENDS_${PN}-ptest += "file make"
+
+SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
+	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
+	file://runtest.patch \
+	file://run-ptest \
+	"
+SRC_URI[md5sum] = "4aad3aee84b42faa194e44091d723a3b"
+SRC_URI[sha256sum] = "fc6bffa750f00daaa92aa33d719c1cc235146aa779ebd2a64a0c24423977cf14"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+# Let's not configure for the host distro.
+#
+PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
+EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
+
+PACKAGECONFIG ??= "templates"
+PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
+PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
+PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
+PACKAGECONFIG[templates] = ",,, ${PN}-templates"
+
+inherit autotools pkgconfig ptest
+
+FILES_${PN}-doc = "${mandir} ${infodir}"
+# For LXC the docdir only contains example configuration files and should be included in the lxc package
+FILES_${PN} += "${docdir}"
+FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
+PACKAGES =+ "${PN}-templates"
+FILES_${PN}-templates += "${datadir}/lxc/templates"
+RDEPENDS_${PN}-templates += "bash"
+
+PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
+
+do_install_append() {
+	# The /var/cache/lxc directory created by the Makefile
+	# is wiped out in volatile, we need to create this at boot.
+	rm -rf ${D}${localstatedir}/cache
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
+	     > ${D}${sysconfdir}/default/volatiles/99_lxc
+
+	for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
+	    sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
+}
+
+EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
+
+do_install_ptest() {
+	oe_runmake -C src/tests install-ptest
+}
+
+pkg_postinst_${PN}() {
+	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
+		/etc/init.d/populate-volatile.sh update
+	fi
+}
-- 
1.7.10.4


