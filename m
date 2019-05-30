Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F00B9E00D48; Wed, 29 May 2019 22:49:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD2C3E00D48
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:49:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4U5meF2012196
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:48:55 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 29 May 2019 22:48:50 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 30 May 2019 01:47:51 -0400
Message-ID: <1559195272-27896-4-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
References: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] linux: update bbappend to match oe-core version
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
X-List-Received-Date: Thu, 30 May 2019 05:49:09 -0000
Content-Type: text/plain

Since v4.18 was removed and v5.0 was created, bbappend should be
adjusted to match oe-core.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend | 9 ---------
 meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend  | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend
 create mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend

diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend
deleted file mode 100644
index 843546c..0000000
--- a/meta-openstack/recipes-kernel/linux/linux-yocto_4.18.bbappend
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
diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend
new file mode 100644
index 0000000..843546c
--- /dev/null
+++ b/meta-openstack/recipes-kernel/linux/linux-yocto_5.0.bbappend
@@ -0,0 +1,9 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://enable-veth.cfg \
+            file://enable-iscsi-tcp.cfg \
+            file://enable-nbd.cfg \
+            file://enable-rtlink.cfg \
+            file://nf.scc \
+            file://nfs.scc \
+	"
-- 
2.8.1


