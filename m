Return-Path: <zhe.he@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9A29E0097C; Sun, 12 Aug 2018 23:22:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A46A8E0084F
	for <meta-virtualization@yoctoproject.org>;
	Sun, 12 Aug 2018 23:22:57 -0700 (PDT)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w7D6Mt9Y028806
	for <meta-virtualization@yoctoproject.org>;
	Sun, 12 Aug 2018 23:22:55 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Sun, 12 Aug 2018 23:22:55 -0700
From: He Zhe <zhe.he@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Sun, 12 Aug 2018 23:22:55 -0700
Message-Id: <20180813062255.386-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
Subject: [m-c-s][PATCH] kernel: Remove bbappaned for old kernels
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
X-List-Received-Date: Mon, 13 Aug 2018 06:22:59 -0000

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-openstack/recipes-kernel/linux/linux-yocto_4.10.bbappend | 9 ---------
 meta-openstack/recipes-kernel/linux/linux-yocto_4.4.bbappend  | 9 ---------
 meta-openstack/recipes-kernel/linux/linux-yocto_4.9.bbappend  | 9 ---------
 3 files changed, 27 deletions(-)
 delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.10.bbappend
 delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.4.bbappend
 delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.9.bbappend

diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_4.10.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_4.10.bbappend
deleted file mode 100644
index 843546c..0000000
--- a/meta-openstack/recipes-kernel/linux/linux-yocto_4.10.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://enable-veth.cfg \
-            file://enable-iscsi-tcp.cfg \
-            file://enable-nbd.cfg \
-            file://enable-rtlink.cfg \
-            file://nf.scc \
-            file://nfs.scc \
-	"
diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_4.4.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_4.4.bbappend
deleted file mode 100644
index 843546c..0000000
--- a/meta-openstack/recipes-kernel/linux/linux-yocto_4.4.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://enable-veth.cfg \
-            file://enable-iscsi-tcp.cfg \
-            file://enable-nbd.cfg \
-            file://enable-rtlink.cfg \
-            file://nf.scc \
-            file://nfs.scc \
-	"
diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_4.9.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_4.9.bbappend
deleted file mode 100644
index 843546c..0000000
--- a/meta-openstack/recipes-kernel/linux/linux-yocto_4.9.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://enable-veth.cfg \
-            file://enable-iscsi-tcp.cfg \
-            file://enable-nbd.cfg \
-            file://enable-rtlink.cfg \
-            file://nf.scc \
-            file://nfs.scc \
-	"
-- 
2.11.0


