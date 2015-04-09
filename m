Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2C5BE008EC; Thu,  9 Apr 2015 11:22:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2A8BE0049A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Apr 2015 11:22:20 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t39IMI1O027437
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 9 Apr 2015 11:22:18 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>)
	id 1YgH5S-0000L3-4C; Thu, 09 Apr 2015 14:21:58 -0400
Date: Thu, 9 Apr 2015 14:21:58 -0400
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org, amy.fong@windriver.com
Message-ID: <20150409182158.GA1288@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] docker engine not running
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
X-List-Received-Date: Thu, 09 Apr 2015 18:22:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 37dcaff90e6bfac93dad78f9ddc077b210a28fc8 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Thu, 9 Apr 2015 14:19:48 -0400
Subject: [PATCH] docker engine not running

In yocto builds, preprocessing of binaries can happen after the install
phase.  Some of these can modify the size/sha1sum of the binaries.
e.g. A new .gnu_debuglink can happen

docker will not start because of these modifications. Docker initially
does a sha1sum of dockerinit to identify the dockerinit that it was built
with, this is done for security and for compatibility reasons. Since
this checking is disabled, we should rely on rpm tests for validation
of the binary instead.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-containers/docker/docker_git.bb            |  1 +
 .../docker/files/disable_sha1sum_startup.patch     | 57 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 recipes-containers/docker/files/disable_sha1sum_startup.patch

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 8357ee8..8f86f70 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -23,6 +23,7 @@ SRC_URI = "\
 	git://github.com/docker/docker.git \
 	file://docker.service \
 	file://hi.Dockerfile \
+	file://disable_sha1sum_startup.patch \
 	"
 
 # Apache-2.0 for docker
diff --git a/recipes-containers/docker/files/disable_sha1sum_startup.patch b/recipes-containers/docker/files/disable_sha1sum_startup.patch
new file mode 100644
index 0000000..cc6819b
--- /dev/null
+++ b/recipes-containers/docker/files/disable_sha1sum_startup.patch
@@ -0,0 +1,57 @@
+docker engine not running
+
+In yocto builds, preprocessing of binaries can happen after the install phase.
+Some of these can modify the size/sha1sum of the binaries.
+e.g. A new .gnu_debuglink can happen
+
+docker will not start because of these modifications. Docker initially
+does a sha1sum of dockerinit to identify the dockerinit that it was built
+with, this is done for security and for compatibility reasons. Since
+this checking is disabled, we should rely on rpm tests for validation
+of the binary instead.
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ utils/utils.go |   17 +----------------
+ 1 file changed, 1 insertion(+), 16 deletions(-)
+
+--- a/utils/utils.go
++++ b/utils/utils.go
+@@ -4,7 +4,6 @@
+ 	"bufio"
+ 	"bytes"
+ 	"crypto/rand"
+-	"crypto/sha1"
+ 	"crypto/sha256"
+ 	"encoding/hex"
+ 	"fmt"
+@@ -76,20 +75,6 @@
+ 	return path
+ }
+ 
+-func dockerInitSha1(target string) string {
+-	f, err := os.Open(target)
+-	if err != nil {
+-		return ""
+-	}
+-	defer f.Close()
+-	h := sha1.New()
+-	_, err = io.Copy(h, f)
+-	if err != nil {
+-		return ""
+-	}
+-	return hex.EncodeToString(h.Sum(nil))
+-}
+-
+ func isValidDockerInitPath(target string, selfPath string) bool { // target and selfPath should be absolute (InitPath and SelfPath already do this)
+ 	if target == "" {
+ 		return false
+@@ -111,7 +96,7 @@
+ 		}
+ 		return os.SameFile(targetFileInfo, selfPathFileInfo)
+ 	}
+-	return dockerversion.INITSHA1 != "" && dockerInitSha1(target) == dockerversion.INITSHA1
++	return true
+ }
+ 
+ // Figure out the path of our dockerinit (which may be SelfPath())
-- 
2.1.4


