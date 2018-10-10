Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4891AE00B5E; Tue,  9 Oct 2018 18:49:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D00FBE00971
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Oct 2018 18:49:23 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9A1mUrH011677
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Oct 2018 18:48:41 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 9 Oct 2018 18:48:14 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <bruce.ashfield@gmail.com>
Date: Wed, 10 Oct 2018 09:48:13 +0800
Message-ID: <1539136093-3457-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH V3] ceph: only support x86-64
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
X-List-Received-Date: Wed, 10 Oct 2018 01:49:24 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 0001-ceph-only-support-x86-64.patch  | 22 ++++++++++++++++++++++
 recipes-extended/ceph/ceph_13.2.1.bb |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 0001-ceph-only-support-x86-64.patch

diff --git a/0001-ceph-only-support-x86-64.patch b/0001-ceph-only-support-x86-64.patch
new file mode 100644
index 0000000..c907e23
--- /dev/null
+++ b/0001-ceph-only-support-x86-64.patch
@@ -0,0 +1,22 @@
+From c1410631e368569f8fa03a2a72938e603eb92578 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Mon, 8 Oct 2018 15:33:25 +0800
+Subject: [PATCH V2] ceph: only support x86-64
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ recipes-extended/ceph/ceph_13.2.1.bb | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-extended/ceph/ceph_13.2.1.bb
+index d7186b9..7888e64 100644
+--- a/recipes-extended/ceph/ceph_13.2.1.bb
++++ b/recipes-extended/ceph/ceph_13.2.1.bb
+@@ -60,3 +60,4 @@ FILES_${PN}-dev += "\
+ RDEPENDS_${PN} += "\
+ 		python \
+ "
++COMPATIBLE_MACHINE = "(qemux86-64|intel-x86-64)"
+-- 
+2.7.4
+
diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-extended/ceph/ceph_13.2.1.bb
index d7186b9..e89bbeb 100644
--- a/recipes-extended/ceph/ceph_13.2.1.bb
+++ b/recipes-extended/ceph/ceph_13.2.1.bb
@@ -60,3 +60,4 @@ FILES_${PN}-dev += "\
 RDEPENDS_${PN} += "\
 		python \
 "
+COMPATIBLE_HOST = "(x86_64).*"
-- 
2.7.4


