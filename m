Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26BCAE00720; Thu, 24 May 2018 12:03:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 224FFE0044F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 12:03:00 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4OJ2xNW020015
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 12:02:59 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 24 May 2018 12:02:59 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 24 May 2018 15:02:54 -0400
Message-ID: <1527188574-8890-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] cgroup-lite: uprev to v1.15
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
X-List-Received-Date: Thu, 24 May 2018 19:03:02 -0000
Content-Type: text/plain

Upgrade and make the recipe more systemd "friendly". For the most part
nobody is going to use this with systemd but in case they do they will
get a masked and empty services file, as they do with Debian or
Ubuntu. Otherwise this is a minor update from v1.11.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../{cgroup-lite_1.11.bb => cgroup-lite_1.15.bb}   | 25 ++++++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)
 rename recipes-containers/cgroup-lite/{cgroup-lite_1.11.bb => cgroup-lite_1.15.bb} (54%)

diff --git a/recipes-containers/cgroup-lite/cgroup-lite_1.11.bb b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
similarity index 54%
rename from recipes-containers/cgroup-lite/cgroup-lite_1.11.bb
rename to recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
index 065d0ea..7b48c3a 100644
--- a/recipes-containers/cgroup-lite/cgroup-lite_1.11.bb
+++ b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
@@ -1,23 +1,34 @@
 SECTION = "devel"
 SUMMARY = "Light-weight package to set up cgroups at system boot."
 DESCRIPTION =  "Light-weight package to set up cgroups at system boot."
-HOMEPAGE = "http://packages.ubuntu.com/source/precise/cgroup-lite"
+HOMEPAGE = "http://packages.ubuntu.com/source/artful/cgroup-lite"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=5d5da4e0867cf06014f87102154d0102"
-SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/cgroup-lite_1.11.tar.xz"
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/cgroup-lite_1.15.tar.xz"
 SRC_URI += "file://cgroups-init"
-SRC_URI[md5sum] = "b20976194ee8fdb61e6b55281fb6ead4"
-SRC_URI[sha256sum] = "a79ab9ae6fb3ff3ce0aa5539b055c0379eaffdc6c5f003af4010fcea683c1a45"
+SRC_URI[md5sum] = "1438c1f4a7227c0dedfce5f86f02591d"
+SRC_URI[sha256sum] = "02f44c70ed3cf27b9e89e5266492fddf4b455336ab4e03abc85e92297537201f"
 
-inherit allarch
-inherit update-rc.d
+inherit allarch update-rc.d systemd
 
 INITSCRIPT_NAME = "cgroups-init"
 INITSCRIPT_PARAMS = "start 8 2 3 4 5 . stop 20 0 1 6 ."
+
+# Keeps the sysvinit scripts out of the image if building
+# where systemd is in use.
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "cgroups-init.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "mask"
+
+
 do_install() {
 	install -d ${D}/bin
-	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${S}/scripts/cgroups-mount ${D}/bin
 	install -m 0755 ${S}/scripts/cgroups-umount ${D}/bin
+
+	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/cgroups-init ${D}${sysconfdir}/init.d/cgroups-init
+
+	install -d ${D}${systemd_unitdir}/system
+	ln -sf /dev/null ${D}${systemd_unitdir}/system/cgroups-init.service
 }
-- 
2.7.4


