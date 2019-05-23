Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3C77E00D50; Wed, 22 May 2019 19:11:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 220C0E00D3E
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 May 2019 19:11:27 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4N2BReG001154
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 May 2019 19:11:27 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 22 May 2019 19:11:26 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 23 May 2019 10:33:44 +0800
Message-ID: <1558578824-3872-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] criu: fix dump error on Intel Apollo Lake SOC
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
X-List-Received-Date: Thu, 23 May 2019 02:11:28 -0000
Content-Type: text/plain

Fix dump error when executing: criu dump -D checkpoint -t pid
-------------------------------------------------
Error (criu/arch/x86/crtools.c:362): x86: Corruption in XFEATURE_YMM area (expected 64 but 0 obtained)
Error (criu/cr-dump.c:1280): Can't infect (pid: 2874) with parasite
Error (criu/cr-dump.c:1732): Dumping FAILED.
-------------------------------------------------
Backport upstream patch on criu-dev branch to fix this:
[https://github.com/checkpoint-restore/criu/commit/5a52e34655636a8f00a664cf42716e1439ea2ef0]

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 recipes-containers/criu/criu_git.bb                |  1 +
 ...-crtools-do-not-error-when-YMM-is-missing.patch | 48 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 recipes-containers/criu/files/0001-x86-crtools-do-not-error-when-YMM-is-missing.patch

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index c6981c9..6fb60db 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
            file://0002-criu-Skip-documentation-install.patch \
            file://0001-criu-Change-libraries-install-directory.patch \
            file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
+           file://0001-x86-crtools-do-not-error-when-YMM-is-missing.patch \
           "
 
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
diff --git a/recipes-containers/criu/files/0001-x86-crtools-do-not-error-when-YMM-is-missing.patch b/recipes-containers/criu/files/0001-x86-crtools-do-not-error-when-YMM-is-missing.patch
new file mode 100644
index 0000000..795ef4c
--- /dev/null
+++ b/recipes-containers/criu/files/0001-x86-crtools-do-not-error-when-YMM-is-missing.patch
@@ -0,0 +1,48 @@
+From 6072c23dbd3bbdc9fead4d90fd2ea2212f2ae0cd Mon Sep 17 00:00:00 2001
+From: Zhang Ning <ning.a.zhang@intel.com>
+Date: Tue, 16 Apr 2019 15:45:05 +0800
+Subject: [PATCH] x86/crtools: do not error when YMM is missing
+
+for Intel Apollo Lake SOC, its cpuinfo and fpu features:
+cpu: x86_family 6 x86_vendor_id GenuineIntel x86_model_id Intel(R) Celeron(R) CPU J3455 @ 1.50GHz
+cpu: fpu: xfeatures_mask 0x11 xsave_size 1088 xsave_size_max 1088 xsaves_size 704
+cpu: fpu: x87 floating point registers     xstate_offsets      0 / 0      xstate_sizes    160 / 160
+
+this CPU doesn't have AVX registers, YMM feature.
+
+when CRIU runs on this CPU, it will report dump error:
+Dumping GP/FPU registers for 4888
+Error (criu/arch/x86/crtools.c:362): x86: Corruption in XFEATURE_YMM area (expected 64 but 0 obtained)
+Error (criu/cr-dump.c:1278): Can't infect (pid: 4888) with parasite
+
+that's because x86/crtools.c will still valid YMM xsave frame, thus fail to dump.
+
+bypass unsupported feature, to make CRIU runs this kinds of CPUs.
+
+Cc: Chen Hu <hu1.chen@intel.com>
+Signed-off-by: Zhang Ning <ning.a.zhang@intel.com>
+Acked-by: Cyrill Gorcunov <gorcunov@gmail.com>
+Signed-off-by: Andrei Vagin <avagin@gmail.com>
+
+Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/commit/5a52e34655636a8f00a664cf42716e1439ea2ef0]
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ criu/arch/x86/crtools.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/criu/arch/x86/crtools.c b/criu/arch/x86/crtools.c
+index ee016da..efc23e5 100644
+--- a/criu/arch/x86/crtools.c
++++ b/criu/arch/x86/crtools.c
+@@ -354,7 +354,7 @@ static bool valid_xsave_frame(CoreEntry *core)
+ 			};
+ 
+ 			for (i = 0; i < ARRAY_SIZE(features); i++) {
+-				if (!features[i].ptr && i > 0)
++				if (!features[i].ptr)
+ 					continue;
+ 
+ 				if (features[i].expected > features[i].obtained) {
+-- 
+2.7.4
+
-- 
2.7.4


