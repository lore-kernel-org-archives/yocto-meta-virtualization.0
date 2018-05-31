Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76C37E00CD9; Thu, 31 May 2018 14:12:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B75EAE00A0C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 May 2018 14:11:47 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4VLAt5W026854
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 May 2018 14:11:37 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 31 May 2018 14:11:32 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 31 May 2018 17:08:05 -0400
Message-ID: <1527800886-29777-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527800886-29777-1-git-send-email-mark.asselstine@windriver.com>
References: <1527800886-29777-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] lxc: fixup 'download' template use
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
X-List-Received-Date: Thu, 31 May 2018 21:12:21 -0000
Content-Type: text/plain

We have a new dependency on 'mountpoint' which is now called in the
download template script. We also hit an upstream bug due to improper
use of 'mktemp', so we apply a patch to fix this and sent the fix
upstream as well.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...s-actually-create-DOWNLOAD_TEMP-directory.patch | 39 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_3.0.0.bb                |  2 ++
 2 files changed, 41 insertions(+)
 create mode 100644 recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch

diff --git a/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch b/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
new file mode 100644
index 0000000..359f662
--- /dev/null
+++ b/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
@@ -0,0 +1,39 @@
+From 1d83b86a9bf017257c068c662ec3bf52ec0cfe90 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 31 May 2018 16:21:45 -0400
+Subject: [PATCH] templates: actually create DOWNLOAD_TEMP directory
+
+The way 'mktemp' is currently used you will get a temp directory in
+$TMPDIR or '/tmp' and DOWNLOAD_TEMP will not be pointing to an actual
+directory. This will result in the wget operations failing and the
+container will fail to create:
+
+    ERROR: Failed to download http://....
+
+Instead we want to use the '-p' option for mktemp to set the base path
+and this will ensure that the temp directory is created in the correct
+location and DOWNLOAD_TEMP will be consistent with this location.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ templates/lxc-download.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/templates/lxc-download.in b/templates/lxc-download.in
+index f875183..5f1138c 100644
+--- a/templates/lxc-download.in
++++ b/templates/lxc-download.in
+@@ -320,7 +320,7 @@ fi
+ if ! command -V mktemp >/dev/null 2>&1; then
+   DOWNLOAD_TEMP="${DOWNLOAD_TEMP}/tmp/lxc-download.$$"
+ else
+-  DOWNLOAD_TEMP="${DOWNLOAD_TEMP}$(mktemp -d)"
++  DOWNLOAD_TEMP="$(mktemp -p ${DOWNLOAD_TEMP} -d)"
+ fi
+ 
+ # Simply list images
+-- 
+2.7.4
+
diff --git a/recipes-containers/lxc/lxc_3.0.0.bb b/recipes-containers/lxc/lxc_3.0.0.bb
index 7158d0a..762a312 100644
--- a/recipes-containers/lxc/lxc_3.0.0.bb
+++ b/recipes-containers/lxc/lxc_3.0.0.bb
@@ -24,6 +24,7 @@ RDEPENDS_${PN} = " \
 		libidn \
 		gnutls \
 		nettle \
+		util-linux-mountpoint \
 "
 
 RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
@@ -40,6 +41,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-fix-B-S.patch \
 	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
+	file://templates-actually-create-DOWNLOAD_TEMP-directory.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	"
-- 
2.7.4


