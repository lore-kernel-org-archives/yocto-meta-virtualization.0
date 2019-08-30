Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 861AAE00E11; Fri, 30 Aug 2019 04:32:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E899E00E01
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 04:32:07 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 7D2D75C13F5;
	Fri, 30 Aug 2019 13:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1567164726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=ENEyMkZS7nqlddFMQzohIiBxj9b5tNcCJxpC2PuCNS4=;
	b=tAtzXRjMXbqVyZSPA1g7Ay2CRG1z0VLJzsY/1VzXH2Koc0/JLZnythjHWwIU+llq1JJQHA
	m/KSmaWZk4Of0D9jqO7SymXRQLioisDOegW7C7gG92z0RHK6ZTTblcmbr9cSGSneA0q/pp
	V4hRNJweGPHoiByPzX7JwLmHysjks8M=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Fri, 30 Aug 2019 13:32:01 +0200
Message-Id: <20190830113203.49678-1-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 1/3] docker-ce: improve hardcoded CC for cross compile
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
X-List-Received-Date: Fri, 30 Aug 2019 11:32:10 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

Since commit applied in moby [61a3285 Support cross-compile for arm]
it hardcoded var-CC to support cross-compile for arm

Correct it with "${parameter:-word}" format, it is helpful for user
define toolchains

(Use Default Values.  If parameter is unset or null, the expansion of
word is substituted.  Otherwise, the value of parameter is substituted.)

https://github.com/moby/moby/commit/61a3285864d3f1b489f48f765b61b2c7bd300372

This fixes a build issue seen when building docker-ce:
  exec: "aarch64-linux-gnu-gcc": executable file not found in $PATH

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/docker/docker-ce_git.bb    |  1 +
 ...dcoded-CC-on-cross-compile-docker-ce.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 recipes-containers/docker/files/0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index a3e27a5..215f114 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -25,6 +25,7 @@ SRC_URI = "\
 	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork \
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
 	file://docker.init \
+	file://0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch \
 	"
 
 require docker.inc
diff --git a/recipes-containers/docker/files/0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch b/recipes-containers/docker/files/0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch
new file mode 100644
index 0000000..70fdaf8
--- /dev/null
+++ b/recipes-containers/docker/files/0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch
@@ -0,0 +1,61 @@
+From 1263fdb50a540e9db742694b7cee08284ad986d0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 17 Jul 2019 17:34:04 +0800
+Subject: [PATCH] imporve hardcoded CC on cross compile
+
+Since commit applied in moby [61a3285 Support cross-compile for arm]
+it hardcoded var-CC to support cross-compile for arm
+
+Correct it with "${parameter:-word}" format, it is helpful for user
+define toolchains
+
+(Use Default Values.  If parameter is unset or null, the expansion of
+word is substituted.  Otherwise, the value of parameter is substituted.)
+
+Upstream-Status: Submitted [https://github.com/moby/moby/pull/39546]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ components/engine/hack/make/.binary | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/import/components/engine/hack/make/.binary b/src/import/components/engine/hack/make/.binary
+index 53de6749e5..66f4ca05f3 100644
+--- a/src/import/components/engine/hack/make/.binary
++++ b/src/import/components/engine/hack/make/.binary
+@@ -44,27 +44,27 @@ if [ "$(go env GOOS)/$(go env GOARCH)" != "$(go env GOHOSTOS)/$(go env GOHOSTARC
+ 	# must be cross-compiling!
+ 	case "$(go env GOOS)/$(go env GOARCH)" in
+ 		windows/amd64)
+-			export CC=x86_64-w64-mingw32-gcc
++			export CC="${CC:-x86_64-w64-mingw32-gcc}"
+ 			export CGO_ENABLED=1
+ 			;;
+ 		linux/arm)
+ 			case "${GOARM}" in
+ 			5|"")
+-				export CC=arm-linux-gnueabi-gcc
++				export CC="${CC:-arm-linux-gnueabi-gcc}"
+ 				export CGO_ENABLED=1
+ 				;;
+ 			7)
+-				export CC=arm-linux-gnueabihf-gcc
++				export CC="${CC:-arm-linux-gnueabihf-gcc}"
+ 				export CGO_ENABLED=1
+ 				;;
+ 			esac
+ 			;;
+ 		linux/arm64)
+-			export CC=aarch64-linux-gnu-gcc
++			export CC="${CC:-aarch64-linux-gnu-gcc}"
+ 			export CGO_ENABLED=1
+ 			;;
+ 		linux/amd64)
+-			export CC=x86_64-linux-gnu-gcc
++			export CC="${CC:-x86_64-linux-gnu-gcc}"
+ 			export CGO_ENABLED=1
+ 			;;
+ 	esac
+-- 
+2.23.0
+
-- 
2.20.1


