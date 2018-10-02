Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 814F5E00ADD; Tue,  2 Oct 2018 11:43:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 757B6E00971
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Oct 2018 11:43:55 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w92Ihst3009758
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 2 Oct 2018 11:43:54 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 2 Oct 2018 11:43:54 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 2 Oct 2018 14:43:46 -0400
Message-ID: <1538505826-7045-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lxcfs: move recipe from meta-overc to here
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
X-List-Received-Date: Tue, 02 Oct 2018 18:43:56 -0000
Content-Type: text/plain

This recipe was originally written and included in meta-overc as it
was used by the overc framework so we implemented it there to sort out
the kinks. Since this package is not specific to the OverC framework
and people may be interested in including it in their images without
having any interest in the OverC framework we are moving this recipe
here, alongside lxc and other container related recipes.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...ystemd-allow-for-distinct-build-directory.patch | 47 ++++++++++++++++++++++
 .../systemd-ensure-var-lib-lxcfs-exists.patch      | 27 +++++++++++++
 recipes-containers/lxcfs/lxcfs_3.0.1.bb            | 25 ++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 recipes-containers/lxcfs/files/systemd-allow-for-distinct-build-directory.patch
 create mode 100644 recipes-containers/lxcfs/files/systemd-ensure-var-lib-lxcfs-exists.patch
 create mode 100644 recipes-containers/lxcfs/lxcfs_3.0.1.bb

diff --git a/recipes-containers/lxcfs/files/systemd-allow-for-distinct-build-directory.patch b/recipes-containers/lxcfs/files/systemd-allow-for-distinct-build-directory.patch
new file mode 100644
index 0000000..14228d6
--- /dev/null
+++ b/recipes-containers/lxcfs/files/systemd-allow-for-distinct-build-directory.patch
@@ -0,0 +1,47 @@
+From 66a71fbf94020651880f1dbb6e4663d93391b47c Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Mon, 10 Sep 2018 13:14:07 -0400
+Subject: [PATCH] systemd: allow for distinct build directory
+
+The Makefile.am is currently written in a way that doesn't allow for a
+distinct build directory. As such we get the error:
+
+    install: cannot stat 'lxcfs.service': No such file or directory
+
+Make use of $(srcdir) to correct this.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ config/init/systemd/Makefile.am | 2 +-
+ config/init/systemd/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/config/init/systemd/Makefile.am b/config/init/systemd/Makefile.am
+index 79e96f5..d6933f9 100644
+--- a/config/init/systemd/Makefile.am
++++ b/config/init/systemd/Makefile.am
+@@ -5,7 +5,7 @@ SYSTEMD_UNIT_DIR = /lib/systemd/system
+ 
+ install-systemd: lxcfs.service
+ 	$(MKDIR_P) $(DESTDIR)$(SYSTEMD_UNIT_DIR)
+-	$(INSTALL_DATA) lxcfs.service $(DESTDIR)$(SYSTEMD_UNIT_DIR)/
++	$(INSTALL_DATA) $(srcdir)/lxcfs.service $(DESTDIR)$(SYSTEMD_UNIT_DIR)/
+ 
+ uninstall-systemd:
+ 	rm -f $(DESTDIR)$(SYSTEMD_UNIT_DIR)/lxcfs.service
+diff --git a/config/init/systemd/Makefile.in b/config/init/systemd/Makefile.in
+index d433e8a..430190c 100644
+--- a/config/init/systemd/Makefile.in
++++ b/config/init/systemd/Makefile.in
+@@ -450,7 +450,7 @@ uninstall-am: uninstall-local
+ 
+ @INIT_SCRIPT_SYSTEMD_TRUE@install-systemd: lxcfs.service
+ @INIT_SCRIPT_SYSTEMD_TRUE@	$(MKDIR_P) $(DESTDIR)$(SYSTEMD_UNIT_DIR)
+-@INIT_SCRIPT_SYSTEMD_TRUE@	$(INSTALL_DATA) lxcfs.service $(DESTDIR)$(SYSTEMD_UNIT_DIR)/
++@INIT_SCRIPT_SYSTEMD_TRUE@	$(INSTALL_DATA) $(srcdir)/lxcfs.service $(DESTDIR)$(SYSTEMD_UNIT_DIR)/
+ 
+ @INIT_SCRIPT_SYSTEMD_TRUE@uninstall-systemd:
+ @INIT_SCRIPT_SYSTEMD_TRUE@	rm -f $(DESTDIR)$(SYSTEMD_UNIT_DIR)/lxcfs.service
+-- 
+2.7.4
+
diff --git a/recipes-containers/lxcfs/files/systemd-ensure-var-lib-lxcfs-exists.patch b/recipes-containers/lxcfs/files/systemd-ensure-var-lib-lxcfs-exists.patch
new file mode 100644
index 0000000..5e5673a
--- /dev/null
+++ b/recipes-containers/lxcfs/files/systemd-ensure-var-lib-lxcfs-exists.patch
@@ -0,0 +1,27 @@
+From 89bf4b64e810e174068e7861490e6d6ab2d14854 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Mon, 10 Sep 2018 15:01:54 -0400
+Subject: [PATCH] systemd: ensure /var/lib/lxcfs exists
+
+If the directory doesn't exist the service will fail to start.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ config/init/systemd/lxcfs.service | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/config/init/systemd/lxcfs.service b/config/init/systemd/lxcfs.service
+index 95e3ee9..d887203 100644
+--- a/config/init/systemd/lxcfs.service
++++ b/config/init/systemd/lxcfs.service
+@@ -5,6 +5,7 @@ Before=lxc.service
+ Documentation=man:lxcfs(1)
+ 
+ [Service]
++ExecStartPre=-/bin/mkdir /var/lib/lxcfs
+ ExecStart=/usr/bin/lxcfs /var/lib/lxcfs/
+ KillMode=process
+ Restart=on-failure
+-- 
+2.7.4
+
diff --git a/recipes-containers/lxcfs/lxcfs_3.0.1.bb b/recipes-containers/lxcfs/lxcfs_3.0.1.bb
new file mode 100644
index 0000000..576027f
--- /dev/null
+++ b/recipes-containers/lxcfs/lxcfs_3.0.1.bb
@@ -0,0 +1,25 @@
+SUMMARY = "LXCFS is a userspace filesystem created to avoid kernel limitations"
+LICENSE = "Apache-2.0"
+
+inherit autotools pkgconfig systemd
+
+SRC_URI = " \
+    https://linuxcontainers.org/downloads/lxcfs/lxcfs-${PV}.tar.gz \
+    file://systemd-allow-for-distinct-build-directory.patch \
+    file://systemd-ensure-var-lib-lxcfs-exists.patch \
+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
+SRC_URI[md5sum] = "fa49872fc45846125455199a2cce18f1"
+SRC_URI[sha256sum] = "016c317f13392bebccba338511f537332fb2fdbaf62a5f6d77307b38a348f41f"
+
+DEPENDS += "fuse"
+RDEPENDS_${PN} += "fuse"
+
+FILES_${PN} += "${datadir}/lxc/config/common.conf.d/*"
+
+CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN='false // No help2man //'"
+EXTRA_OECONF += "--with-distro=unknown --with-init-script=${VIRTUAL-RUNTIME_init_manager}"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "lxcfs.service"
-- 
2.7.4


