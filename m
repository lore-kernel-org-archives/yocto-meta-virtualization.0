Return-Path: <Dmitry_Eremin@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02827E009A1; Thu,  9 Apr 2015 13:01:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26647E0049A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Apr 2015 13:01:52 -0700 (PDT)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YgIe7-0000eb-QG from Dmitry_Eremin@mentor.com 
	for meta-virtualization@yoctoproject.org;
	Thu, 09 Apr 2015 13:01:52 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-03.mgc.mentorg.com (137.202.0.108) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Thu, 9 Apr 2015 21:01:50 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 9 Apr 2015 23:01:48 +0300
Message-ID: <1428609708-15379-3-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1428609708-15379-1-git-send-email-dmitry_eremin@mentor.com>
References: <1428609708-15379-1-git-send-email-dmitry_eremin@mentor.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] lxc: fix building when B != S
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
X-List-Received-Date: Thu, 09 Apr 2015 20:01:56 -0000
Content-Type: text/plain

If lxc is built not in the source dir, upstart files will fail to be
installed, because of Makefile error.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 recipes-containers/lxc/files/lxc-fix-B-S.patch | 17 +++++++++++++++++
 recipes-containers/lxc/lxc_1.0.7.bb            |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 recipes-containers/lxc/files/lxc-fix-B-S.patch

diff --git a/recipes-containers/lxc/files/lxc-fix-B-S.patch b/recipes-containers/lxc/files/lxc-fix-B-S.patch
new file mode 100644
index 0000000..3822655
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-fix-B-S.patch
@@ -0,0 +1,17 @@
+Index: lxc-1.0.7/config/init/upstart/Makefile.am
+===================================================================
+--- lxc-1.0.7.orig/config/init/upstart/Makefile.am
++++ lxc-1.0.7/config/init/upstart/Makefile.am
+@@ -3,9 +3,9 @@ EXTRA_DIST = lxc.conf lxc-instance.conf
+ if INIT_SCRIPT_UPSTART
+ install-upstart: lxc.conf lxc-instance.conf lxc-net.conf
+ 	$(MKDIR_P) $(DESTDIR)$(sysconfdir)/init/
+-	$(INSTALL_DATA) lxc.conf $(DESTDIR)$(sysconfdir)/init/
+-	$(INSTALL_DATA) lxc-instance.conf $(DESTDIR)$(sysconfdir)/init/
+-	$(INSTALL_DATA) lxc-net.conf $(DESTDIR)$(sysconfdir)/init/
++	$(INSTALL_DATA) $(srcdir)/lxc.conf $(DESTDIR)$(sysconfdir)/init/
++	$(INSTALL_DATA) $(srcdir)/lxc-instance.conf $(DESTDIR)$(sysconfdir)/init/
++	$(INSTALL_DATA) $(srcdir)/lxc-net.conf $(DESTDIR)$(sysconfdir)/init/
+ 
+ uninstall-upstart:
+ 	rm -f $(DESTDIR)$(sysconfdir)/init/lxc.conf
diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
index 1c70958..d82aa70 100644
--- a/recipes-containers/lxc/lxc_1.0.7.bb
+++ b/recipes-containers/lxc/lxc_1.0.7.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://document-lxc.rebootsignal.patch \
 	file://lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch \
 	file://ppc-add-seccomp-support-for-lxc.patch \
+	file://lxc-fix-B-S.patch \
 	"
 
 SRC_URI[md5sum] = "b48f468a9bef0e4e140dd723f0a65ad0"
-- 
2.1.4


