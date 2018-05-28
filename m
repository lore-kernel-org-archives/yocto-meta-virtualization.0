Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 944A8E00B4C; Mon, 28 May 2018 06:15:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3600E00A51
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 06:15:22 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4SDFJCW015014
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 06:15:19 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 28 May 2018 06:15:19 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 28 May 2018 09:14:46 -0400
Message-ID: <1527513289-5463-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527513289-5463-1-git-send-email-mark.asselstine@windriver.com>
References: <1527513289-5463-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] lxc: drop the -setup package
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
X-List-Received-Date: Mon, 28 May 2018 13:15:23 -0000
Content-Type: text/plain

For some packages we include a -setup package which can be installed
as part of an image to complete a more comprehensive setup of the main
package. This is common for example in meta-cloud-services since many
OpenStack packages have extensive setup.

The -setup package for lxc did at one point do comprehensive setup but
over time this has been moved to the -networking package. Now the
-setup package is only being used as a container for the systemd
service files or sysvinit scripts. This can better be accomplished by
setting appropriate runlevels for the initscripts or disabling or
masking the systemd services (via SYSTEMD_AUTO_ENABLE).

This also fixes some confusion or what might be considered a bug
around -setup and -networking packages as the -setup package was
mopping up the lxc-net.service file, instead of it being included in
the -networking package.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/lxc/lxc_2.0.8.bb | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index 4918d91..547c44f 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -81,13 +81,17 @@ export STAGING_LIBDIR
 
 inherit autotools pkgconfig ptest update-rc.d systemd python3native
 
-SYSTEMD_PACKAGES = "${PN}-setup"
-SYSTEMD_SERVICE_${PN}-setup = "lxc.service"
-SYSTEMD_AUTO_ENABLE_${PN}-setup = "disable"
-
-INITSCRIPT_PACKAGES = "${PN}-setup"
-INITSCRIPT_NAME_{PN}-setup = "lxc"
-INITSCRIPT_PARAMS_${PN}-setup = "defaults"
+SYSTEMD_PACKAGES = "${PN} ${PN}-networking"
+SYSTEMD_SERVICE_${PN} = "lxc.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+SYSTEMD_SERVICE_${PN}-networking = "lxc-net.service"
+SYSTEMD_AUTO_ENABLE_${PN}-networking = "enable"
+
+INITSCRIPT_PACKAGES = "${PN} ${PN}-networking"
+INITSCRIPT_NAME_${PN} = "lxc"
+INITSCRIPT_PARAMS_${PN} = "defaults"
+INITSCRIPT_NAME_${PN}-networking = "lxc-net"
+INITSCRIPT_PARAMS_${PN}-networking = "defaults"
 
 FILES_${PN}-doc = "${mandir} ${infodir}"
 # For LXC the docdir only contains example configuration files and should be included in the lxc package
@@ -96,18 +100,13 @@ FILES_${PN} += "${libdir}/python3*"
 FILES_${PN} += "${datadir}/bash-completion"
 FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
 FILES_${PN}-dbg += "${libexecdir}/lxc/hooks/.debug"
-PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking ${PN}-lua"
+PACKAGES =+ "${PN}-templates ${PN}-networking ${PN}-lua"
 FILES_lua-${PN} = "${datadir}/lua ${libdir}/lua"
 FILES_lua-${PN}-dbg += "${libdir}/lua/lxc/.debug"
 FILES_${PN}-templates += "${datadir}/lxc/templates"
 RDEPENDS_${PN}-templates += "bash"
 
-ALLOW_EMPTY_${PN}-networking = "1"
-
-FILES_${PN}-setup += "/etc/tmpfiles.d"
-FILES_${PN}-setup += "/lib/systemd/system"
-FILES_${PN}-setup += "/usr/lib/systemd/system"
-FILES_${PN}-setup += "/etc/init.d"
+FILES_${PN}-networking += "${sysconfdir}/init.d/lxc-net"
 
 PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
 
@@ -128,10 +127,8 @@ do_install_append() {
 	for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
 	    sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
 
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-	    install -d ${D}${sysconfdir}/init.d
-	    install -m 755 config/init/sysvinit/lxc* ${D}${sysconfdir}/init.d
-	fi
+	install -d ${D}${sysconfdir}/init.d
+	install -m 755 config/init/sysvinit/lxc* ${D}${sysconfdir}/init.d
 
 	# since python3-native is used for install location this will not be
 	# suitable for the target and we will have to correct the package install
-- 
2.7.4


