Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 983B0E00CC6; Sat,  5 Sep 2015 23:52:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	URIBL_BLACK autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	*  1.7 URIBL_BLACK Contains an URL listed in the URIBL blacklist
	*      [URIs: configure.ac]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53736E00B2B
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Sep 2015 23:52:57 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t866qvSm009951
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 5 Sep 2015 23:52:57 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Sat, 5 Sep 2015 23:52:56 -0700
From: <jianchuan.wang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sun, 6 Sep 2015 14:43:24 +0800
Message-ID: <1441521806-12787-1-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/3] irqbalance: add PACKAGECONFIG for libcap-ng
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
X-List-Received-Date: Sun, 06 Sep 2015 06:52:59 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Grasp withval for libcap-ng in configure.ac.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 recipes-extended/irqbalance/irqbalance.inc         |  1 +
 .../irqbalance/fix-configure-libcap-ng.patch       | 24 ++++++++++++++++++++++
 recipes-extended/irqbalance/irqbalance_1.0.6.bb    |  1 +
 3 files changed, 26 insertions(+)
 create mode 100644 recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch

diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
index c20840d..10265c9 100644
--- a/recipes-extended/irqbalance/irqbalance.inc
+++ b/recipes-extended/irqbalance/irqbalance.inc
@@ -30,6 +30,7 @@ PACKAGECONFIG ?= ""
 # enable,disable,depends,rdepends
 #
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl,"
+PACKAGECONFIG[libcap-ng] = "--with-libcap-ng,--without-libcap-ng,libcap-ng,"
 
 do_install () {
         oe_runmake 'DESTDIR=${D}' install
diff --git a/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch b/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
new file mode 100644
index 0000000..5be5243
--- /dev/null
+++ b/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
@@ -0,0 +1,24 @@
+Subject: [PATCH] grasp withval for libcap-ng
+
+Upstream-Status: Pending
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+---
+ configure.ac |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff -urpN a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -61,7 +61,10 @@ AS_IF(
+ AM_CONDITIONAL([LOCAL_GLIB], [test "x$local_glib2" = "xyes"])
+ 
+ AC_ARG_WITH([libcap-ng],
+-  AS_HELP_STRING([libcap-ng], [Add libcap-ng-support @<:@default=auto@:>@]))
++  [AS_HELP_STRING([libcap-ng], [Add libcap-ng-support @<:@default=auto@:>@])],
++  [libcap_ng=$withval],
++  [libcap_ng=$withval]
++)
+ 
+ AS_IF(
+   [test "x$libcap_ng" != "xno"],
diff --git a/recipes-extended/irqbalance/irqbalance_1.0.6.bb b/recipes-extended/irqbalance/irqbalance_1.0.6.bb
index fd08b73..ed0249a 100644
--- a/recipes-extended/irqbalance/irqbalance_1.0.6.bb
+++ b/recipes-extended/irqbalance/irqbalance_1.0.6.bb
@@ -12,4 +12,5 @@ SRC_URI[sha256sum] = "95ac79992e6de501f613c781b0fc8aa17a4aaf6a3d865bb6e15ac6a46c
 SRC_URI = "http://irqbalance.googlecode.com/files/irqbalance-${PV}.tar.gz \
            file://add-initscript.patch \
            file://irqbalance-Add-status-and-reload-commands.patch \
+           file://fix-configure-libcap-ng.patch \
           "
-- 
1.9.1


