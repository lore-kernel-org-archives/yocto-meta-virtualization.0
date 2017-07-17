Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30C33E00C49; Mon, 17 Jul 2017 13:04:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E82AE00C39
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:19 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6HK4Inw001708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:18 -0700 (PDT)
Received: from yow-bashfiel-d2.wrs.com (128.224.56.49) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 13:04:18 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 17 Jul 2017 16:04:05 -0400
Message-ID: <1500321853-984-5-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.4.0.53.g8440f74
In-Reply-To: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
References: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/12] runc-docker: Add --console-socket=/dev/null
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
X-List-Received-Date: Mon, 17 Jul 2017 20:04:21 -0000
Content-Type: text/plain

From: Jason Wessel <jason.wessel@windriver.com>

This allows for setting up a detached session where you do not want to
set the terminal to false in the config.json.  More or less this is a
runtime override.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../0001-runc-Add-console-socket-dev-null.patch    | 33 ++++++++++++++++++++++
 recipes-containers/runc/runc-docker_git.bb         |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch

diff --git a/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch b/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
new file mode 100644
index 000000000000..f49adfbf2147
--- /dev/null
+++ b/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
@@ -0,0 +1,33 @@
+From 3fff2a3505fba1d1ff0074edff15708a77f6cfa9 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Wed, 12 Jul 2017 13:35:03 -0700
+Subject: [PATCH] runc: Add --console-socket=/dev/null
+
+This allows for setting up a detached session where you do not want to
+set the terminal to false in the config.json.  More or less this is a
+runtime override.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+---
+ utils_linux.go | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/utils_linux.go b/utils_linux.go
+index 8085f7fe..e6d31b35 100644
+--- a/utils_linux.go
++++ b/utils_linux.go
+@@ -227,6 +227,11 @@ type runner struct {
+ }
+ 
+ func (r *runner) run(config *specs.Process) (int, error) {
++	if (r.consoleSocket == "/dev/null") {
++		r.detach = false
++		r.consoleSocket = ""
++		config.Terminal = false
++	}
+ 	if err := r.checkTerminal(config); err != nil {
+ 		r.destroy()
+ 		return -1, err
+-- 
+2.11.0
+
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 194d6612f2b6..f412c84b2ecd 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
            file://0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch \
            file://0002-Remove-Platform-as-no-longer-in-OCI-spec.patch \
            file://0003-Update-memory-specs-to-use-int64-not-uint64.patch \
+           file://0001-runc-Add-console-socket-dev-null.patch \
           "
 
 RUNC_VERSION = "1.0.0-rc3"
-- 
2.4.0.53.g8440f74


