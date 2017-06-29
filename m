Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3400E00BE0; Thu, 29 Jun 2017 02:56:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F3B1E00BD5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jun 2017 02:56:37 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5T9uXHG025055
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jun 2017 02:56:33 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 29 Jun 2017 02:56:32 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 29 Jun 2017 17:49:19 +0800
Message-ID: <1498729759-7600-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] spice: Fix compilation error
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
X-List-Received-Date: Thu, 29 Jun 2017 09:56:41 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

| ../../git/server/red_parse_qxl.c:367:18: error: 'BITMAP_FMT_IS_RGB'
defined but not used [-Werror=unused-const-variable=]
|  static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1};

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...xl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch | 29 ++++++++++++++++++++++
 recipes-support/spice/spice_git.bb                 |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 recipes-support/spice/files/0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch

diff --git a/recipes-support/spice/files/0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch b/recipes-support/spice/files/0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch
new file mode 100644
index 0000000..ccae5f5
--- /dev/null
+++ b/recipes-support/spice/files/0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch
@@ -0,0 +1,29 @@
+From 85838d4c9f2322aedb99b38fffd7da95a494d8ed Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Thu, 29 Jun 2017 08:26:35 +0000
+Subject: [PATCH] red_parse_qxl: Fix BITMAP_FMT_IS_RGB defined but not used
+
+| ../../git/server/red_parse_qxl.c:367:18: error: 'BITMAP_FMT_IS_RGB'
+defined but not used [-Werror=unused-const-variable=]
+|  static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1};
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ server/red_parse_qxl.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/server/red_parse_qxl.c b/server/red_parse_qxl.c
+index 6c0b0658..cfc2da95 100644
+--- a/server/red_parse_qxl.c
++++ b/server/red_parse_qxl.c
+@@ -364,7 +364,6 @@ static int bitmap_consistent(SpiceBitmap *bitmap)
+ 
+ // This is based on SPICE_BITMAP_FMT_*, copied from server/red_worker.c
+ // to avoid a possible unoptimization from making it non static.
+-static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1};
+ 
+ static SpiceImage *red_get_image(RedMemSlotInfo *slots, int group_id,
+                                  QXLPHYSICAL addr, uint32_t flags, int is_mask)
+-- 
+2.11.0
+
diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/spice_git.bb
index 828087a..6f1be3a 100644
--- a/recipes-support/spice/spice_git.bb
+++ b/recipes-support/spice/spice_git.bb
@@ -35,6 +35,7 @@ SRC_URI += " \
         file://spice-fix-CVE-2013-4282.patch \
         file://configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.patch \
         file://build-allow-separated-src-and-build-dirs.patch \
+        file://0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch \
         "
 
 S = "${WORKDIR}/git"
-- 
2.8.1


