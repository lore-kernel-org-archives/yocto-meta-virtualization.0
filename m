Return-Path: <Hongxu.Jia@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F3C9E00D46; Wed, 17 Jul 2019 02:02:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E7ADE00D00
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Jul 2019 02:02:00 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6H91IDb015688
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Jul 2019 02:01:33 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 17 Jul 2019 02:01:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 17 Jul 2019 17:01:25 +0800
Message-ID: <1563354085-13100-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] docker: drop hardcoded CC for cross compile
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
X-List-Received-Date: Wed, 17 Jul 2019 09:02:01 -0000
Content-Type: text/plain

Since commit applied in moby [61a3285 Support cross-compile for arm]
it hardcoded var-CC to support cross-compile for arm

Drop hardcoded CC and use Yocto var-CC to instead

https://github.com/moby/moby/commit/61a3285864d3f1b489f48f765b61b2c7bd300372

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-containers/docker/docker_git.bb            |  3 +-
 .../0001-drop-hardcoded-CC-for-cross-compile.patch | 48 ++++++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/docker/files/0001-drop-hardcoded-CC-for-cross-compile.patch

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 5b2f3b0..c1308e6 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -43,7 +43,8 @@ SRC_URI = "\
 	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork \
 	git://github.com/docker/cli;branch=19.03;name=cli;destsuffix=git/cli \
 	file://docker.init \
-        file://0001-libnetwork-use-GO-instead-of-go.patch \
+	file://0001-libnetwork-use-GO-instead-of-go.patch \
+	file://0001-drop-hardcoded-CC-for-cross-compile.patch \
 	"
 
 require docker.inc
diff --git a/recipes-containers/docker/files/0001-drop-hardcoded-CC-for-cross-compile.patch b/recipes-containers/docker/files/0001-drop-hardcoded-CC-for-cross-compile.patch
new file mode 100644
index 0000000..6fc5214
--- /dev/null
+++ b/recipes-containers/docker/files/0001-drop-hardcoded-CC-for-cross-compile.patch
@@ -0,0 +1,48 @@
+From d97736afa7bc3e509c3671be8add82ff0a7859a6 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 17 Jul 2019 16:41:36 +0800
+Subject: [PATCH] drop hardcoded CC for cross compile
+
+Since commit applied in moby [61a3285 Support cross-compile for arm]
+it hardcoded var-CC to support cross-compile for arm
+
+Drop hardcoded CC and use Yocto var-CC to instead
+
+https://github.com/moby/moby/commit/61a3285864d3f1b489f48f765b61b2c7bd300372
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/import/hack/make/.binary | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/import/hack/make/.binary b/src/import/hack/make/.binary
+index 53de674..177dd42 100644
+--- a/src/import/hack/make/.binary
++++ b/src/import/hack/make/.binary
+@@ -50,21 +50,17 @@ if [ "$(go env GOOS)/$(go env GOARCH)" != "$(go env GOHOSTOS)/$(go env GOHOSTARC
+ 		linux/arm)
+ 			case "${GOARM}" in
+ 			5|"")
+-				export CC=arm-linux-gnueabi-gcc
+ 				export CGO_ENABLED=1
+ 				;;
+ 			7)
+-				export CC=arm-linux-gnueabihf-gcc
+ 				export CGO_ENABLED=1
+ 				;;
+ 			esac
+ 			;;
+ 		linux/arm64)
+-			export CC=aarch64-linux-gnu-gcc
+ 			export CGO_ENABLED=1
+ 			;;
+ 		linux/amd64)
+-			export CC=x86_64-linux-gnu-gcc
+ 			export CGO_ENABLED=1
+ 			;;
+ 	esac
+-- 
+2.7.4
+
-- 
2.7.4


