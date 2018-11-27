Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E20DE009AA; Mon, 26 Nov 2018 18:22:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 565DBE00872
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Nov 2018 18:22:04 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR2M33H003034
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Nov 2018 18:22:03 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 26 Nov 2018 18:22:02 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 26 Nov 2018 21:22:15 -0500
Message-ID: <1543285335-129138-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] criu: Don't open /run/criu.kdat if doesn't exists
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
X-List-Received-Date: Tue, 27 Nov 2018 02:22:05 -0000
Content-Type: text/plain

When CRIU is called for a first time and the /run/criu.kdat file does
not exists, the following warning is shown:
        Warn  (criu/kerndat.c:847): Can't load /run/criu.kdat

This patch is replacing this warning with a more appropriate debug
message.
        File /run/criu.kdat does not exist

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 recipes-containers/criu/criu_git.bb                |  1 +
 ...on-t-open-run-criu.kdat-if-doesn-t-exists.patch | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 00de417..45195ea 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
            file://0002-criu-Skip-documentation-install.patch \
            file://0001-criu-Change-libraries-install-directory.patch \
            file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
+           file://0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch \
           "
 
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
diff --git a/recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch b/recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch
new file mode 100644
index 0000000..805f799
--- /dev/null
+++ b/recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch
@@ -0,0 +1,42 @@
+From b9760919eb3f805dd3d2af5692b49cba9c468595 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Mon, 26 Nov 2018 02:39:59 -0500
+Subject: [PATCH] kdat: Don't open /run/criu.kdat if doesn't exists
+
+When CRIU is called for a first time and the /run/criu.kdat file does
+not exists, the following warning is shown:
+	Warn  (criu/kerndat.c:847): Can't load /run/criu.kdat
+
+This patch is replacing this warning with a more appropriate debug
+message.
+	File /run/criu.kdat does not exist
+
+Signed-off-by: Radostin Stoyanov <rstoyanov1@gmail.com>
+Signed-off-by: Andrei Vagin <avagin@virtuozzo.com>
+
+Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/commit/868de91a099c00f099d8a41557d660d173f72521]
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ criu/kerndat.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/criu/kerndat.c b/criu/kerndat.c
+index 8cb5690..9fb475c 100644
+--- a/criu/kerndat.c
++++ b/criu/kerndat.c
+@@ -789,7 +789,10 @@ static int kerndat_try_load_cache(void)
+ 
+ 	fd = open(KERNDAT_CACHE_FILE, O_RDONLY);
+ 	if (fd < 0) {
+-		pr_warn("Can't load %s\n", KERNDAT_CACHE_FILE);
++		if(ENOENT == errno)
++			pr_debug("File %s does not exist\n", KERNDAT_CACHE_FILE);
++		else
++			pr_warn("Can't load %s\n", KERNDAT_CACHE_FILE);
+ 		return 1;
+ 	}
+ 
+-- 
+2.8.1
+
-- 
2.8.1


