Return-Path: <Keith.Holman@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C177E00831; Wed, 20 Aug 2014 13:46:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD52EE007FE
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Aug 2014 13:46:16 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7KKkFEw022029
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Aug 2014 13:46:15 -0700 (PDT)
Received: from yow-kholman-lx1.wrs.com (128.224.56.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Wed, 20 Aug 2014 13:46:14 -0700
From: Keith Holman <Keith.Holman@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 20 Aug 2014 16:46:07 -0400
Message-ID: <1408567571-27481-1-git-send-email-Keith.Holman@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
X-Originating-IP: [128.224.56.110]
Cc: keith.holman@windriver.com
Subject: [PATCH 1/5] protobuf: update google protocol buffers to 2.5.0
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
X-List-Received-Date: Wed, 20 Aug 2014 20:46:24 -0000
Content-Type: text/plain

Upgrade Google Protocol Buffers to version 2.5.0.  The previous
version 2.4.1 is getting quite old (released April 2011).  The newer
version provides bug fixes and more functionality.  This version adds
some speed optimization and the ability to allow multiple enum
symbols to have the same value.

Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
---
 recipes-containers/criu/protobuf_2.4.1.bb | 18 ------------------
 recipes-containers/criu/protobuf_2.5.0.bb | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 18 deletions(-)
 delete mode 100644 recipes-containers/criu/protobuf_2.4.1.bb
 create mode 100644 recipes-containers/criu/protobuf_2.5.0.bb

diff --git a/recipes-containers/criu/protobuf_2.4.1.bb b/recipes-containers/criu/protobuf_2.4.1.bb
deleted file mode 100644
index d8f1b53..0000000
--- a/recipes-containers/criu/protobuf_2.4.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "protobuf"
-DESCRIPTION = "Protocol Buffers are a way of encoding structured data in an efficient yet extensible format. Google uses Protocol Buffers for almost all of its internal RPC protocols and file formats."
-HOMEPAGE = "http://code.google.com/p/protobuf/"
-SECTION = "console/tools"
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
-
-PR = "r0"
-
-SRC_URI[md5sum] = "dc84e9912ea768baa1976cb7bbcea7b5"
-SRC_URI[sha256sum] = "eac6969b617f397247e805267da2b0db3ff9e5a9163b123503a192fbb5776567"
-SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
-
-EXTRA_OECONF += " --with-protoc=echo"
-inherit autotools
-
-BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
diff --git a/recipes-containers/criu/protobuf_2.5.0.bb b/recipes-containers/criu/protobuf_2.5.0.bb
new file mode 100644
index 0000000..4a90b2c
--- /dev/null
+++ b/recipes-containers/criu/protobuf_2.5.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "protobuf"
+DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
+an efficient yet extensible format. Google uses Protocol Buffers for \
+almost all of its internal RPC protocols and file formats."
+HOMEPAGE = "http://code.google.com/p/protobuf/"
+SECTION = "console/tools"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
+
+PR = "r0"
+
+SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
+SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98bdcb7cedb5b91d3b5bdcf29c98c293f58e"
+SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
+
+EXTRA_OECONF += " --with-protoc=echo"
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.3


