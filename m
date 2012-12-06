Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87295E0143A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:45:11 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4029671eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=xKwc8fQq3NlqBdU0J1V0uNBbk3bvkG1TZSsFdHrZB5k=;
	b=ddAeEgLvs2MzD8/+sBZpUDbk27po0VRbgGCSi6CsztpDfe4ryu8w4eW/8wD7ONxX/H
	rFMnKzYYH4zLRePIpitl1MidQtTagFyI2Uqc1diE7gX35rZ5UthfqmfTYNBopORA0tZJ
	GJ9gVcVkb0LKLr8RLmApNbuxLwI8KqYovXSTV0sqDlWvrmHN5Rw2U7KsIiH2IX7GePyC
	FhrISVGkSZ8FzlgZ2Y9oR6Ejoiuo2nurLrGOB4GrRgMuquq1n+zJ3vZSd2Y2u0byMbcB
	+AlCdVutrYAFi0R3gBRMczCE8cdzTmae5hS7pjc8ImM/4bPBmS9njpkj/AAai0G+RJYP
	qFsA==
Received: by 10.14.214.132 with SMTP id c4mr5953390eep.18.1354801510564;
	Thu, 06 Dec 2012 05:45:10 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 44sm16027431eek.0.2012.12.06.05.45.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:45:09 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id C4113400D24; Thu,  6 Dec 2012 14:45:06 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:44:35 +0100
Message-Id: <1354801486-9482-4-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
References: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 03/14] Added CRIU recipe
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
X-List-Received-Date: Thu, 06 Dec 2012 13:45:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 recipes-containers/criu/criu_git.bb                |   29 ++++++++++++
 .../criu/files/0001-Fixed-hardcoding.patch         |   47 ++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 recipes-containers/criu/criu_git.bb
 create mode 100644 recipes-containers/criu/files/0001-Fixed-hardcoding.patch

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
new file mode 100644
index 0000000..878827f
--- /dev/null
+++ b/recipes-containers/criu/criu_git.bb
@@ -0,0 +1,29 @@
+SUMMARY = "CRIU"
+DESCRIPTION = "Checkpoint/Restore In Userspace, or CRIU, is a software tool for Linux operating system. Using this tool, you can freeze a running application (or part of it) and checkpoint it to a hard drive as a collection of files. You can then use the files to restore and run the application from the point it was frozen at. The distinctive feature of the CRIU project is that it is mainly implemented in user space"
+HOMEPAGE = "http://criu.org"
+SECTION = "console/tools"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=12920dfe6b35a0758155f0e62878b366"
+
+SRCREV = "d81c9a4618db2f618bdb8e207b7f0fec631c7142"
+PR = "r0"
+PV = "0.2+git${SRCPV}"
+
+SRC_URI = "git://git.criu.org/crtools.git;protocol=git \
+	file://0001-Fixed-hardcoding.patch"
+
+DEPENDS += "protobuf-c-native protobuf-c"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += "ARCH=${TARGET_ARCH} WERROR=0"
+
+do_compile () {
+	   oe_runmake
+}
+
+do_install () {
+	   mkdir -p ${D}/${bindir}
+	   install -m 755 ${S}/crtools ${D}/${bindir}/crtools
+}
\ No newline at end of file
diff --git a/recipes-containers/criu/files/0001-Fixed-hardcoding.patch b/recipes-containers/criu/files/0001-Fixed-hardcoding.patch
new file mode 100644
index 0000000..5ff0a78
--- /dev/null
+++ b/recipes-containers/criu/files/0001-Fixed-hardcoding.patch
@@ -0,0 +1,47 @@
+From 32c6c037a6de0a0972e16949ebb64ffebb5b7bcc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@enea.com>
+Date: Wed, 28 Nov 2012 15:07:27 +0100
+Subject: [PATCH] Fixed hardcoding
+
+---
+ Makefile.inc |   24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index 722cbfc..3ae693e 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -11,18 +11,18 @@ else
+ endif
+ export E Q
+ 
+-FIND		:= find
+-CSCOPE		:= cscope
+-TAGS		:= ctags
+-RM		:= rm
+-LD		:= ld
+-HEXDUMP		:= hexdump
+-CC		:= gcc
+-ECHO		:= echo
+-NM		:= nm
+-AWK		:= awk
+-SH		:= sh
+-MAKE		:= make
++FIND		?= find
++CSCOPE		?= cscope
++TAGS		?= ctags
++RM		?= rm
++LD		?= ld
++HEXDUMP		?= hexdump
++CC		?= gcc
++ECHO		?= echo
++NM		?= nm
++AWK		?= awk
++SH		?= sh
++MAKE		?= make
+ 
+ # Additional ARCH settings for x86
+ ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ \
+-- 
+1.7.9.5
+
-- 
1.7.9.5


