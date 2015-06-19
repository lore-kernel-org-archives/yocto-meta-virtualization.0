Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56241E00A45; Fri, 19 Jun 2015 09:01:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1760FE009EF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Jun 2015 09:01:07 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5JG16lQ008620
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Fri, 19 Jun 2015 09:01:06 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.85)
	(envelope-from <amy.fong@windriver.com>)
	id 1Z5yij-000107-My; Fri, 19 Jun 2015 12:00:45 -0400
Date: Fri, 19 Jun 2015 12:00:45 -0400
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org, amy.fong@windriver.com
Message-ID: <20150619160045.GA3762@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] golang-cross: do_compile fails on warnings treated as error
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
X-List-Received-Date: Fri, 19 Jun 2015 16:01:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 47818bac1f1c4973d6bc6ddf0200bd927b3d72a5 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Fri, 19 Jun 2015 11:46:17 -0400
Subject: [PATCH] golang-cross: do_compile fails on warnings treated as errors

On glibc 2.20+, the _BSD_SOURCE and _SVID_SOURCE feature test macros are
deprecated as of glibc 2.19.90 (2.20 devel), we define _DEFAULT_SOURCE
instead.

(fixed upstream)
https://groups.google.com/forum/#!topic/golang-codereviews/S4TARFCxu2k

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-devtools/go/files/bsd_svid_source.patch | 37 +++++++++++++++++++++++++
 recipes-devtools/go/golang-cross.inc            |  6 +++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 recipes-devtools/go/files/bsd_svid_source.patch

diff --git a/recipes-devtools/go/files/bsd_svid_source.patch b/recipes-devtools/go/files/bsd_svid_source.patch
new file mode 100644
index 0000000..21e1d4c
--- /dev/null
+++ b/recipes-devtools/go/files/bsd_svid_source.patch
@@ -0,0 +1,37 @@
+golang-cross: do_compile fails cc1: all warnings being treated as errors
+
+glibc 2.20 deprecates _BSD_SOURCE and _SVID_SOURCE and emits an error
+message.  From patch 16632:
+	libc [PATCH] BZ #16632: Disable _SVID_SOURCE/_BSD_SOURCE warning
+	if _DEFAULT_SOURCE is defined
+
+Since we also need to support glibc before 2.20, from the release notes
+for glibc 2.20, the recommended fix is to define _DEFAULT_SOURCE
+
+(fixed upstream)
+https://groups.google.com/forum/#!topic/golang-codereviews/S4TARFCxu2k
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ include/u.h |   10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+--- a/include/u.h
++++ b/include/u.h
+@@ -38,6 +38,16 @@
+ #		define __MAKECONTEXT_V2_SOURCE 1
+ #	endif
+ #endif
++/**
++ * in glibc >= 2.20, _BSD_SOURCE and _SVID_SOURCE causes warning
++ * messages if _DEFAULT_SOURCE is not defined.
++ *
++ * From glibc 2.20 release notes, since this application needs _BSD_SOURCE
++ * and/or _SVID_SOURCE and we must support glibc < 2.19 and
++ * glibc >= 2.20, then define all 3 (_DEFAULT_SOURCE, _BSD_SOURCE,
++ * and _SVID_SOURCE) unconditionally
++ */
++#define _DEFAULT_SOURCE 1
+ #define _BSD_SOURCE 1
+ #define _NETBSD_SOURCE 1	/* NetBSD */
+ #define _SVID_SOURCE 1
diff --git a/recipes-devtools/go/golang-cross.inc b/recipes-devtools/go/golang-cross.inc
index 9330572..ce4ee0e 100644
--- a/recipes-devtools/go/golang-cross.inc
+++ b/recipes-devtools/go/golang-cross.inc
@@ -3,7 +3,11 @@ HOMEPAGE = "golang.org"
 # DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc"
 DEPENDS = "libgcc"
 PROVIDES = "virtual/${TARGET_PREFIX}golang"
-SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz"
+SRC_URI = "\
+	http://golang.org/dl/go${PV}.src.tar.gz \
+	file://bsd_svid_source.patch \
+	"
+
 S="${WORKDIR}/go"
 
 do_compile () {
-- 
2.1.4


