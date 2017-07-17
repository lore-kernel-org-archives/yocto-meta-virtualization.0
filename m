Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C59D4E00C3B; Mon, 17 Jul 2017 13:05:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9946E00C44
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:20 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6HK4KXN004450
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:20 -0700
Received: from yow-bashfiel-d2.wrs.com (128.224.56.49) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 13:04:19 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 17 Jul 2017 16:04:07 -0400
Message-ID: <1500321853-984-7-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.4.0.53.g8440f74
In-Reply-To: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
References: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/12] oci-systemd-hook: Uprev hook to latest
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
X-List-Received-Date: Mon, 17 Jul 2017 20:05:06 -0000
Content-Type: text/plain

From: Jason Wessel <jason.wessel@windriver.com>

The selinux disable patch required changes as more setfilecon
operations were added.

The new upstream work is needed to allow the rootfs specification to
continue working because runc no longer passes the "root" key as a
part of the json configuration which is sent to a hook via stdin.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../0001-selinux-drop-selinux-support.patch        | 35 ++++++++++++----------
 .../oci-systemd-hook/oci-systemd-hook_git.bb       |  2 +-
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/recipes-containers/oci-systemd-hook/oci-systemd-hook/0001-selinux-drop-selinux-support.patch b/recipes-containers/oci-systemd-hook/oci-systemd-hook/0001-selinux-drop-selinux-support.patch
index 507cd08e6f8f..5016f6e75d9d 100644
--- a/recipes-containers/oci-systemd-hook/oci-systemd-hook/0001-selinux-drop-selinux-support.patch
+++ b/recipes-containers/oci-systemd-hook/oci-systemd-hook/0001-selinux-drop-selinux-support.patch
@@ -5,25 +5,34 @@ Subject: [PATCH] selinux: drop selinux support
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 ---
- src/systemdhook.c | 9 ---------
- 1 file changed, 9 deletions(-)
+ src/systemdhook.c |   12 ------------
+ 1 file changed, 12 deletions(-)
 
-diff --git a/src/systemdhook.c b/src/systemdhook.c
-index 274e5b910699..b9e8f1be376a 100644
 --- a/src/systemdhook.c
 +++ b/src/systemdhook.c
-@@ -14,7 +14,6 @@
+@@ -16,7 +16,6 @@
  #include <errno.h>
  #include <inttypes.h>
  #include <linux/limits.h>
 -#include <selinux/selinux.h>
  #include <yajl/yajl_tree.h>
+ #include <stdbool.h>
  
- #include "config.h"
-@@ -538,14 +537,6 @@ static int prestart(const char *rootfs,
+@@ -129,9 +128,6 @@ static int chperm(const char *path, cons
+ 				closedir(dir);
+ 				return -1;
  			}
- 		}
+-			if (setfilecon (full_path, label) < 0) {
+-				pr_perror("Failed to set context %s on %s", label, full_path);
+-			}
  
+ 			if (doChown) {
+ 				/* Change uid and gid to something the container can handle */
+@@ -496,14 +492,6 @@ static int prestart(const char *rootfs,
+ 				return -1;
+ 			}
+ 		}
+-
 -		if (strcmp("", mount_label)) {
 -			rc = setfilecon(journal_dir, (security_context_t)mount_label);
 -			if (rc < 0) {
@@ -31,10 +40,6 @@ index 274e5b910699..b9e8f1be376a 100644
 -				return -1;
 -			}
 -		}
--
- 		if (makepath(cont_journal_dir, 0755) == -1) {
- 			if (errno != EEXIST) {
- 				pr_perror("Failed to mkdir container journal dir: %s", cont_journal_dir);
--- 
-2.4.0.53.g8440f74
-
+ 
+ 		/* Attempt to creare /var/log/journal inside of rootfs,
+ 		   if successful, or directory exists, mount tmpfs on top of
diff --git a/recipes-containers/oci-systemd-hook/oci-systemd-hook_git.bb b/recipes-containers/oci-systemd-hook/oci-systemd-hook_git.bb
index 872872a1106f..fc88905334da 100644
--- a/recipes-containers/oci-systemd-hook/oci-systemd-hook_git.bb
+++ b/recipes-containers/oci-systemd-hook/oci-systemd-hook_git.bb
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 
 DEPENDS = "yajl util-linux"
 
-SRCREV = "ca515c1f399bd0b16e94b7c34aa1ef20498beca6"
+SRCREV = "1ac958a4197a9ea52174812fc7d7d036af8140d3"
 SRC_URI = "git://github.com/projectatomic/oci-systemd-hook \
            file://0001-selinux-drop-selinux-support.patch \
            file://0001-configure-drop-selinux-support.patch \
-- 
2.4.0.53.g8440f74


