Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED983E00B9E; Thu, 15 Jun 2017 12:24:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60CC8E00B99
	for <meta-virtualization@yoctoproject.org>;
	Thu, 15 Jun 2017 12:24:26 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5FJOPTB011064
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 15 Jun 2017 12:24:25 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Jun 2017 12:24:25 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 15 Jun 2017 15:24:21 -0400
Message-ID: <1497554661-10173-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lxc: temporary workaround for gcc 7 issue
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
X-List-Received-Date: Thu, 15 Jun 2017 19:24:30 -0000
Content-Type: text/plain

gcc 7 has a bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11672
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=78969

In order to avoid the build failure that this causes we reduce the
range by one. Better to have a slight reduction in the range than
having nobody to be able to build and use lxc.

Once gcc is fixed this can be reverted.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../files/cgroups-work-around-issue-in-gcc-7.patch | 34 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_2.0.8.bb                |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 recipes-containers/lxc/files/cgroups-work-around-issue-in-gcc-7.patch

diff --git a/recipes-containers/lxc/files/cgroups-work-around-issue-in-gcc-7.patch b/recipes-containers/lxc/files/cgroups-work-around-issue-in-gcc-7.patch
new file mode 100644
index 0000000..90740fb
--- /dev/null
+++ b/recipes-containers/lxc/files/cgroups-work-around-issue-in-gcc-7.patch
@@ -0,0 +1,34 @@
+From 58a2d817a82100d287c60c63315d81445cdba3f9 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 15 Jun 2017 15:12:08 -0400
+Subject: [PATCH] cgroups: work around issue in gcc 7
+
+This works around
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=11672
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=78969
+
+By removing a single cgroup entry. For the majority of usecases this
+loss of a single entry should not be an issue and once gcc 7 is fixed
+we can revert this.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ src/lxc/cgroups/cgfsng.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
+index ebd548b..c520abd 100644
+--- a/src/lxc/cgroups/cgfsng.c
++++ b/src/lxc/cgroups/cgfsng.c
+@@ -1373,7 +1373,7 @@ static inline bool cgfsng_create(void *hdata)
+ 	offset = cgname + len - 5;
+ 
+ again:
+-	if (idx == 1000) {
++	if (idx == 999) {
+ 		ERROR("Too many conflicting cgroup names");
+ 		goto out_free;
+ 	}
+-- 
+2.7.4
+
diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index 80c8da7..3dd9f63 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-fix-B-S.patch \
 	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
+	file://cgroups-work-around-issue-in-gcc-7.patch \
 	"
 
 SRC_URI[md5sum] = "7bfd95280522d7936c0979dfea92cdb5"
-- 
2.7.4


