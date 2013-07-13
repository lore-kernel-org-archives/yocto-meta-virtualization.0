Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57E19E0071F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 13 Jul 2013 09:11:34 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6DGBY1L007624
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 13 Jul 2013 09:11:34 -0700 (PDT)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Sat, 13 Jul 2013 09:11:33 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Sat, 13 Jul 2013 12:11:32 -0400
Message-ID: <1373731892-9124-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [PATCH] lxc: create lxc cache directory
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
X-List-Received-Date: Sat, 13 Jul 2013 16:11:34 -0000
Content-Type: text/plain

Many LXC templates expect the cache directory to exist and use it without
necessarily checking if it exists. Normally the Makefile would create this
directory but since /var/cache is volatile we must use the volatile system to
create this directory at boot, or when the package is installed.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

If templates are expecting longer term cache they will need to be
modified accordingly since this cache directory will not survive
reboots...

 recipes-containers/lxc/lxc_0.9.0.bb | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index 30316bb..563131f 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 PRIORITY = "optional"
-PR = "r2"
+PR = "r3"
 DEPENDS = "libxml2 libcap"
 RDEPENDS_${PN} = " \
 		rsync \
@@ -47,3 +47,19 @@ FILES_${PN}-doc = "${mandir} ${infodir}"
 # For LXC the docdir only contains example configuration files and should be included in the lxc package
 FILES_${PN} += "${docdir}"
 FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
+
+do_install_append() {
+	# The /var/cache/lxc directory created by the Makefile
+	# is wiped out in volatile, we need to create this at boot.
+	rm -rf ${D}${localstatedir}/cache
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
+	     > ${D}${sysconfdir}/default/volatiles/99_lxc
+
+}
+
+pkg_postinst_${PN}() {
+	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
+		/etc/init.d/populate-volatile.sh update
+	fi
+}
-- 
1.7.12


