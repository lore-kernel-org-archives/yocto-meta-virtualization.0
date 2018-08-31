Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD6D5E009AC; Fri, 31 Aug 2018 05:03:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F988E009A4
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Aug 2018 05:03:11 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7VC3A94027877
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Aug 2018 05:03:10 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 31 Aug 2018 05:03:09 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 31 Aug 2018 08:02:14 -0400
Message-ID: <1535716934-203335-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] diod/ops.c: add header file for makedev
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
X-List-Received-Date: Fri, 31 Aug 2018 12:03:11 -0000
Content-Type: text/plain

Error:
diod/ops.c:845: undefined reference to `makedev'

Fixed:
Glibc removes sys/sysmacros.h which defines makedev from sys/types.h
since v2.28. [Commit ID: e16deca62e16f]

And then glibc suggestions us to include <sys/sysmacros.h> directly if
code needs it.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 recipes-extended/diod/diod_1.0.24.bb               |  1 +
 ...01-diod-ops.c-add-header-file-for-makedev.patch | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-makedev.patch

diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/diod_1.0.24.bb
index a4d159a..bb5707e 100644
--- a/recipes-extended/diod/diod_1.0.24.bb
+++ b/recipes-extended/diod/diod_1.0.24.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/chaos/diod.git;protocol=git \
            file://diod.conf \
            file://0001-build-allow-builds-to-work-with-separate-build-dir.patch \
            file://0002-auto.diod.in-remove-bashisms.patch \
+           file://0001-diod-ops.c-add-header-file-for-makedev.patch \
           "
 DEPENDS = "libcap ncurses tcp-wrappers lua"
 
diff --git a/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-makedev.patch b/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-makedev.patch
new file mode 100644
index 0000000..e6f7ece
--- /dev/null
+++ b/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-makedev.patch
@@ -0,0 +1,40 @@
+From f75836731d6051d85e6317eb4c12465bafb4973e Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Fri, 31 Aug 2018 05:47:02 -0400
+Subject: [PATCH] diod/ops.c: add header file for makedev
+
+Error:
+diod/ops.c:845: undefined reference to `makedev'
+
+Fixed:
+Glibc removes sys/sysmacros.h which defines makedev from sys/types.h
+since v2.28. [Commit ID: e16deca62e16f]
+
+And then glibc suggestions us to include <sys/sysmacros.h> directly if
+code needs it.
+
+Upstream-Status: Submitted 
+[diod:
+mail: v9fs-developer@lists.sourceforge.net
+author: hongzhi.song@windriver.com]
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ diod/ops.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/diod/ops.c b/diod/ops.c
+index c6c8291..469a502 100644
+--- a/diod/ops.c
++++ b/diod/ops.c
+@@ -74,6 +74,7 @@
+ #include <pthread.h>
+ #include <errno.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ 
+ #ifdef __FreeBSD__
+ #if !__BSD_VISIBLE
+-- 
+2.8.1
+
-- 
2.8.1


