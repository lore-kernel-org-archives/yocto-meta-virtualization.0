Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2C18E00D2F; Thu, 21 Mar 2019 19:14:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F29CE00D2C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Mar 2019 19:14:14 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2M2EEqu010088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Mar 2019 19:14:14 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 21 Mar 2019 19:14:14 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 22 Mar 2019 10:13:53 +0800
Message-ID: <1553220833-33258-2-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553220833-33258-1-git-send-email-dengke.du@windriver.com>
References: <1553220833-33258-1-git-send-email-dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/2] librdmacm: upgrade to 1.1.0
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
X-List-Received-Date: Fri, 22 Mar 2019 02:14:16 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...libdl.patch => 0001-librdmacm-needs-libdl.patch} | 21 ++++++++++++++++-----
 .../{librdmacm_1.0.17.bb => librdmacm_1.1.0.bb}     |  6 +++---
 2 files changed, 19 insertions(+), 8 deletions(-)
 rename recipes-extended/librdmacm/files/{librdmacm-needs-libdl.patch => 0001-librdmacm-needs-libdl.patch} (52%)
 rename recipes-extended/librdmacm/{librdmacm_1.0.17.bb => librdmacm_1.1.0.bb} (86%)

diff --git a/recipes-extended/librdmacm/files/librdmacm-needs-libdl.patch b/recipes-extended/librdmacm/files/0001-librdmacm-needs-libdl.patch
similarity index 52%
rename from recipes-extended/librdmacm/files/librdmacm-needs-libdl.patch
rename to recipes-extended/librdmacm/files/0001-librdmacm-needs-libdl.patch
index bf15bea..8e62f4b 100644
--- a/recipes-extended/librdmacm/files/librdmacm-needs-libdl.patch
+++ b/recipes-extended/librdmacm/files/0001-librdmacm-needs-libdl.patch
@@ -1,15 +1,23 @@
+From d2c39b265f397256482154ad7807260b347176fb Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Thu, 21 Mar 2019 15:58:32 +0800
+Subject: [PATCH] librdmacm needs libdl
+
 Librdmacm links against libibverbs, and the current version of libibverbs
 uses dlopen(), so librdmacm must also link against libdl.
 
 Upstream-Status: Pending
 
 Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
- configure.in |    2 ++
+ configure.ac | 2 ++
  1 file changed, 2 insertions(+)
 
---- a/configure.in
-+++ b/configure.in
+diff --git a/configure.ac b/configure.ac
+index 4a43995..2a7f4b9 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -39,6 +39,8 @@ AC_CHECK_SIZEOF(long)
  dnl Checks for libraries
  AC_CHECK_LIB(pthread, pthread_mutex_init, [],
@@ -17,5 +25,8 @@ Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
 +AC_CHECK_LIB(dl, dlsym, [],
 +    AC_MSG_ERROR([dlsym() not found.  librdmacm requires libdl.]))
  if test "$disable_libcheck" != "yes"; then
- AC_CHECK_LIB(ibverbs, ibv_get_device_list, [],
-     AC_MSG_ERROR([ibv_get_device_list() not found.  librdmacm requires libibverbs.]))
+ AC_CHECK_LIB(ibverbs, ibv_cmd_open_xrcd, [],
+     AC_MSG_ERROR([ibv_cmd_open_xrcd() not found.  librdmacm requires libibverbs 1.1.8 or later.]))
+-- 
+2.7.4
+
diff --git a/recipes-extended/librdmacm/librdmacm_1.0.17.bb b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
similarity index 86%
rename from recipes-extended/librdmacm/librdmacm_1.0.17.bb
rename to recipes-extended/librdmacm/librdmacm_1.1.0.bb
index 0ece665..30a0c94 100644
--- a/recipes-extended/librdmacm/librdmacm_1.0.17.bb
+++ b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
@@ -16,10 +16,10 @@ DEPENDS = "virtual/libibverbs"
 
 # Repo is at http://git.openfabrics.org/git?p=~shefty/librdmacm.git
 SRC_URI = "https://www.openfabrics.org/downloads/rdmacm/${BPN}-${PV}.tar.gz \
-           file://librdmacm-needs-libdl.patch"
+           file://0001-librdmacm-needs-libdl.patch"
 
-SRC_URI[md5sum] = "da6fad887e9c24cb01b74b75f8449cb1"
-SRC_URI[sha256sum] = "9381e1bf2c7079fc257b8eee74e731d3e7eec70e539bb4245084a7b05aeecb2a"
+SRC_URI[md5sum] = "9459e523002978ef6e7b852e01d8b29e"
+SRC_URI[sha256sum] = "8f10848d4810585d6d70b443abc876c1db8df5e9b8b07e095c7e6eaf4ac380c5"
 
 inherit autotools
 
-- 
2.7.4


