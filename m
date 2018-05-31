Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C710BE00C75; Thu, 31 May 2018 14:11:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C6F7E00A0C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 May 2018 14:11:42 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4VLAt5T026854
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 May 2018 14:11:32 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 31 May 2018 14:11:04 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 31 May 2018 17:08:04 -0400
Message-ID: <1527800886-29777-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527800886-29777-1-git-send-email-mark.asselstine@windriver.com>
References: <1527800886-29777-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] lxc: uprev to v3.0.0
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
X-List-Received-Date: Thu, 31 May 2018 21:11:45 -0000
Content-Type: text/plain

Update to the latest lxc release. This requires some minor patch
updates (fuzz and offset, not content) along with dropping a no longer
needed fix for gcc7 (gcc 7.3 is everywhere and is patched).

The ptests were already busted before the uprev so I was not able to
run them but I will follow up with a fix for this. I did run against
our usual usecases 'lxc-create', 'lxc-console', 'lxc-ls',
'lxc-destroy', 'lxc-start', 'lxc-execute', 'lxc-attach'... and there
were no issues (outcomes matched v2.0.8).

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../files/cgroups-work-around-issue-in-gcc-7.patch | 34 ----------------------
 ...ally-use-base-filenames-to-report-src-fil.patch |  8 ++---
 ...1.0.0-disable-udhcp-from-busybox-template.patch |  6 ++--
 .../lxc/{lxc_2.0.8.bb => lxc_3.0.0.bb}             |  5 ++--
 4 files changed, 9 insertions(+), 44 deletions(-)
 delete mode 100644 recipes-containers/lxc/files/cgroups-work-around-issue-in-gcc-7.patch
 rename recipes-containers/lxc/{lxc_2.0.8.bb => lxc_3.0.0.bb} (97%)

diff --git a/recipes-containers/lxc/files/cgroups-work-around-issue-in-gcc-7.patch b/recipes-containers/lxc/files/cgroups-work-around-issue-in-gcc-7.patch
deleted file mode 100644
index 90740fb..0000000
--- a/recipes-containers/lxc/files/cgroups-work-around-issue-in-gcc-7.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 58a2d817a82100d287c60c63315d81445cdba3f9 Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Thu, 15 Jun 2017 15:12:08 -0400
-Subject: [PATCH] cgroups: work around issue in gcc 7
-
-This works around
-https://bugzilla.yoctoproject.org/show_bug.cgi?id=11672
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=78969
-
-By removing a single cgroup entry. For the majority of usecases this
-loss of a single entry should not be an issue and once gcc 7 is fixed
-we can revert this.
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- src/lxc/cgroups/cgfsng.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
-index ebd548b..c520abd 100644
---- a/src/lxc/cgroups/cgfsng.c
-+++ b/src/lxc/cgroups/cgfsng.c
-@@ -1373,7 +1373,7 @@ static inline bool cgfsng_create(void *hdata)
- 	offset = cgname + len - 5;
- 
- again:
--	if (idx == 1000) {
-+	if (idx == 999) {
- 		ERROR("Too many conflicting cgroup names");
- 		goto out_free;
- 	}
--- 
-2.7.4
-
diff --git a/recipes-containers/lxc/files/logs-optionally-use-base-filenames-to-report-src-fil.patch b/recipes-containers/lxc/files/logs-optionally-use-base-filenames-to-report-src-fil.patch
index 583b6f1..f430601 100644
--- a/recipes-containers/lxc/files/logs-optionally-use-base-filenames-to-report-src-fil.patch
+++ b/recipes-containers/lxc/files/logs-optionally-use-base-filenames-to-report-src-fil.patch
@@ -31,9 +31,9 @@ diff --git a/configure.ac b/configure.ac
 index deba90b..c1ed67b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -357,6 +357,15 @@ AM_COND_IF([ENABLE_PYTHON],
- 	PKG_CHECK_MODULES([PYTHONDEV], [python3 >= 3.2],[],[AC_MSG_ERROR([You must install python3-dev])])
- 	AC_DEFINE_UNQUOTED([ENABLE_PYTHON], 1, [Python3 is available])])
+@@ -356,6 +356,15 @@ AM_COND_IF([ENABLE_PYTHON],
+ 	[], [enable_examples=yes])
+ AM_CONDITIONAL([ENABLE_EXAMPLES], [test "x$enable_examples" = "xyes"])
  
 +# Enable basenames in the logs for source files
 +AC_ARG_ENABLE([log-src-basename],
@@ -51,7 +51,7 @@ diff --git a/src/lxc/log.h b/src/lxc/log.h
 index 76bd4df..4365977 100644
 --- a/src/lxc/log.h
 +++ b/src/lxc/log.h
-@@ -74,8 +74,13 @@ struct lxc_log_locinfo {
+@@ -77,8 +77,13 @@ struct lxc_log_locinfo {
  	int		line;
  };
  
diff --git a/recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybox-template.patch b/recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybox-template.patch
index 723be27..07a12ff 100644
--- a/recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybox-template.patch
+++ b/recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybox-template.patch
@@ -11,14 +11,14 @@ diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
 index cb425ec..bb8c951 100644
 --- a/templates/lxc-busybox.in
 +++ b/templates/lxc-busybox.in
-@@ -84,7 +84,6 @@ EOF
+@@ -111,7 +111,6 @@ EOF
  #!/bin/sh
  /bin/syslogd
  /bin/mount -a
 -/bin/udhcpc
  EOF
  
-     # executable
--- 
+   # executable
+---
 1.7.11.7
 
diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_3.0.0.bb
similarity index 97%
rename from recipes-containers/lxc/lxc_2.0.8.bb
rename to recipes-containers/lxc/lxc_3.0.0.bb
index 46fa9a7..7158d0a 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_3.0.0.bb
@@ -40,13 +40,12 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-fix-B-S.patch \
 	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
-	file://cgroups-work-around-issue-in-gcc-7.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	"
 
-SRC_URI[md5sum] = "7bfd95280522d7936c0979dfea92cdb5"
-SRC_URI[sha256sum] = "0d8e34b302cfe4c40c6c9ae5097096aa5cc2c1dfceea3f0f22e3e16c4a4e8494"
+SRC_URI[md5sum] = "ca1db4f9dc35df9203a58ab606cdfb7a"
+SRC_URI[sha256sum] = "6230224c27f050201b372b18a9f39cd220ed584899c5f0cf73c6b313dabc8d8a"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
2.7.4


