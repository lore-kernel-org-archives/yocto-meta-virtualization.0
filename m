Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45615E007A2; Wed, 31 Aug 2016 11:17:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB448E006C6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 11:17:46 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7VIHjJR010687
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 11:17:45 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 31 Aug 2016 11:17:45 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 31 Aug 2016 14:17:44 -0400
Message-ID: <1472667464-7234-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] cgroup-lite: update to version 1.11
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
X-List-Received-Date: Wed, 31 Aug 2016 18:17:48 -0000
Content-Type: text/plain

This is a small package so despite the large version jump the changes
are minor, mostly bug fixes and some work around systemd.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/cgroup-lite/cgroup-lite_1.1.bb  | 22 ----------------------
 recipes-containers/cgroup-lite/cgroup-lite_1.11.bb | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 22 deletions(-)
 delete mode 100644 recipes-containers/cgroup-lite/cgroup-lite_1.1.bb
 create mode 100644 recipes-containers/cgroup-lite/cgroup-lite_1.11.bb

diff --git a/recipes-containers/cgroup-lite/cgroup-lite_1.1.bb b/recipes-containers/cgroup-lite/cgroup-lite_1.1.bb
deleted file mode 100644
index 3ca5238..0000000
--- a/recipes-containers/cgroup-lite/cgroup-lite_1.1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SECTION = "devel"
-SUMMARY = "Light-weight package to set up cgroups at system boot."
-DESCRIPTION =  "Light-weight package to set up cgroups at system boot."
-HOMEPAGE = "http://packages.ubuntu.com/source/precise/cgroup-lite"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=5d5da4e0867cf06014f87102154d0102"
-SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/c/cgroup-lite/cgroup-lite_1.1.tar.gz"
-SRC_URI += "file://cgroups-init"
-SRC_URI[md5sum] = "041a0d8ad2b192271a2e5507fdb6809f"
-SRC_URI[sha256sum] = "e7f9992b90b5b4634f3b8fb42580ff28ff31093edb297ab872c37f61a94586bc"
-
-inherit update-rc.d
-
-INITSCRIPT_NAME = "cgroups-init"
-INITSCRIPT_PARAMS = "start 8 2 3 4 5 . stop 20 0 1 6 ."
-do_install() {
-	install -d ${D}/bin
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${S}/scripts/cgroups-mount ${D}/bin
-	install -m 0755 ${S}/scripts/cgroups-umount ${D}/bin
-	install -m 0755 ${WORKDIR}/cgroups-init ${D}${sysconfdir}/init.d/cgroups-init
-}
diff --git a/recipes-containers/cgroup-lite/cgroup-lite_1.11.bb b/recipes-containers/cgroup-lite/cgroup-lite_1.11.bb
new file mode 100644
index 0000000..b3af6f4
--- /dev/null
+++ b/recipes-containers/cgroup-lite/cgroup-lite_1.11.bb
@@ -0,0 +1,22 @@
+SECTION = "devel"
+SUMMARY = "Light-weight package to set up cgroups at system boot."
+DESCRIPTION =  "Light-weight package to set up cgroups at system boot."
+HOMEPAGE = "http://packages.ubuntu.com/source/precise/cgroup-lite"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=5d5da4e0867cf06014f87102154d0102"
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/cgroup-lite_1.11.tar.xz"
+SRC_URI += "file://cgroups-init"
+SRC_URI[md5sum] = "b20976194ee8fdb61e6b55281fb6ead4"
+SRC_URI[sha256sum] = "a79ab9ae6fb3ff3ce0aa5539b055c0379eaffdc6c5f003af4010fcea683c1a45"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "cgroups-init"
+INITSCRIPT_PARAMS = "start 8 2 3 4 5 . stop 20 0 1 6 ."
+do_install() {
+	install -d ${D}/bin
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${S}/scripts/cgroups-mount ${D}/bin
+	install -m 0755 ${S}/scripts/cgroups-umount ${D}/bin
+	install -m 0755 ${WORKDIR}/cgroups-init ${D}${sysconfdir}/init.d/cgroups-init
+}
-- 
2.1.4


