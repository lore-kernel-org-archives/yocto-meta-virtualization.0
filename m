Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07EA5E0074C; Fri, 27 Feb 2015 13:41:34 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E67BE00477
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Feb 2015 13:41:33 -0800 (PST)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1RLfWSQ021677
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Feb 2015 13:41:32 -0800 (PST)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>) id 1YRSew-0000bk-5E
	for meta-virtualization@yoctoproject.org;
	Fri, 27 Feb 2015 16:41:22 -0500
Date: Fri, 27 Feb 2015 16:41:22 -0500
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Message-ID: <20150227214122.GD2255@windriver.com>
References: <20150227214013.GA2160@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20150227214013.GA2160@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH 4/5] Add cgroup-lite
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: amy.fong@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Feb 2015 21:41:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From a2c06f9bae2e0eb6095b376adaa24f2d56870bd6 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Fri, 27 Feb 2015 16:00:20 -0500
Subject: [PATCH 4/5] Add cgroup-lite

Light-weight package to set up cgroups at system boot

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-containers/cgroup-lite/cgroup-lite_1.1.bb | 22 ++++++++++++++++++
 recipes-containers/cgroup-lite/files/cgroups-init | 27 +++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 recipes-containers/cgroup-lite/cgroup-lite_1.1.bb
 create mode 100755 recipes-containers/cgroup-lite/files/cgroups-init

diff --git a/recipes-containers/cgroup-lite/cgroup-lite_1.1.bb b/recipes-containers/cgroup-lite/cgroup-lite_1.1.bb
new file mode 100644
index 0000000..3ca5238
--- /dev/null
+++ b/recipes-containers/cgroup-lite/cgroup-lite_1.1.bb
@@ -0,0 +1,22 @@
+SECTION = "devel"
+SUMMARY = "Light-weight package to set up cgroups at system boot."
+DESCRIPTION =  "Light-weight package to set up cgroups at system boot."
+HOMEPAGE = "http://packages.ubuntu.com/source/precise/cgroup-lite"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=5d5da4e0867cf06014f87102154d0102"
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/c/cgroup-lite/cgroup-lite_1.1.tar.gz"
+SRC_URI += "file://cgroups-init"
+SRC_URI[md5sum] = "041a0d8ad2b192271a2e5507fdb6809f"
+SRC_URI[sha256sum] = "e7f9992b90b5b4634f3b8fb42580ff28ff31093edb297ab872c37f61a94586bc"
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
diff --git a/recipes-containers/cgroup-lite/files/cgroups-init b/recipes-containers/cgroup-lite/files/cgroups-init
new file mode 100755
index 0000000..e504024
--- /dev/null
+++ b/recipes-containers/cgroup-lite/files/cgroups-init
@@ -0,0 +1,27 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          cgroups mount
+# Required-Start:    $network $remote_fs
+# Required-Stop:     $network $remote_fs
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: mount/unmount cgroups
+### END INIT INFO
+
+# must start before libvirtd is run
+case "$1" in
+  start)
+        echo -n "Mounting cgroups..."
+		/bin/cgroups-mount
+        echo "Done"
+        ;;
+  stop)
+        echo -n "Unmounting cgroups..."
+		/bin/cgroups-umount
+        echo "Done"
+        ;;
+  *)
+        echo "Usage: /etc/init.d/cgroups-init {start|stop}"
+        exit 1
+        ;;
+esac
-- 
2.1.4


