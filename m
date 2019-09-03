Return-Path: <Hongxu.Jia@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69C8AE00CDF; Tue,  3 Sep 2019 01:02:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB367E00C9C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 01:02:10 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x83828xJ021865
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Sep 2019 01:02:08 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 3 Sep 2019 01:02:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 3 Sep 2019 04:01:00 -0400
Message-ID: <1567497660-75506-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] docker: Fix CVE-2019-14271 loading of nsswitch based config inside chroot under Glibc
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
X-List-Received-Date: Tue, 03 Sep 2019 08:02:11 -0000
Content-Type: text/plain

Backport a patch from upstream to fix CVE-2019-14271

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-containers/docker/docker_git.bb            |  1 +
 ...nss-libraries-in-Glibc-so-that-the-dynami.patch | 50 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index e45f87e..e993017 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -45,6 +45,7 @@ SRC_URI = "\
 	file://docker.init \
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
 	file://0001-imporve-hardcoded-CC-on-cross-compile.patch \
+	file://0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch \
 	"
 
 require docker.inc
diff --git a/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch b/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
new file mode 100644
index 0000000..67ddd49
--- /dev/null
+++ b/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
@@ -0,0 +1,50 @@
+From b688546c8e35ce48d02dd5adf156399b37590b26 Mon Sep 17 00:00:00 2001
+From: Justin Cormack <justin.cormack@docker.com>
+Date: Thu, 25 Jul 2019 15:24:39 +0100
+Subject: [PATCH] Initialize nss libraries in Glibc so that the dynamic
+ libraries are loaded in the host environment not in the chroot from untrusted
+ files.
+
+See also OpenVZ https://github.com/kolyshkin/vzctl/blob/a3f732ef751998913fcf0a11b3e05236b51fd7e9/src/enter.c#L227-L234
+
+Signed-off-by: Justin Cormack <justin.cormack@docker.com>
+(cherry picked from commit cea6dca993c2b4cfa99b1e7a19ca134c8ebc236b)
+Signed-off-by: Tibor Vass <tibor@docker.com>
+
+CVE: CVE-2019-14271
+Upstream-Status: Backport [a316b10dab79d9298b02c7930958ed52e0ccf4e4]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/import/pkg/chrootarchive/archive.go | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/import/pkg/chrootarchive/archive.go b/src/import/pkg/chrootarchive/archive.go
+index 6ff61e6..83ed0c6 100644
+--- a/src/import/pkg/chrootarchive/archive.go
++++ b/src/import/pkg/chrootarchive/archive.go
+@@ -4,13 +4,22 @@ import (
+ 	"fmt"
+ 	"io"
+ 	"io/ioutil"
++	"net"
+ 	"os"
++	"os/user"
+ 	"path/filepath"
+ 
+ 	"github.com/docker/docker/pkg/archive"
+ 	"github.com/docker/docker/pkg/idtools"
+ )
+ 
++func init() {
++	// initialize nss libraries in Glibc so that the dynamic libraries are loaded in the host
++	// environment not in the chroot from untrusted files.
++	_, _ = user.Lookup("docker")
++	_, _ = net.LookupHost("localhost")
++}
++
+ // NewArchiver returns a new Archiver which uses chrootarchive.Untar
+ func NewArchiver(idMapping *idtools.IdentityMapping) *archive.Archiver {
+ 	if idMapping == nil {
+-- 
+2.8.1
+
-- 
2.8.1


