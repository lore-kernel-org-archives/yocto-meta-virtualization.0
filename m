Return-Path: <Keith.Holman@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C889AE0082F; Wed, 20 Aug 2014 13:46:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3041E00814
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Aug 2014 13:46:21 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7KKkLPr022064
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Aug 2014 13:46:21 -0700 (PDT)
Received: from yow-kholman-lx1.wrs.com (128.224.56.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Wed, 20 Aug 2014 13:46:21 -0700
From: Keith Holman <Keith.Holman@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 20 Aug 2014 16:46:11 -0400
Message-ID: <1408567571-27481-5-git-send-email-Keith.Holman@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1408567571-27481-1-git-send-email-Keith.Holman@windriver.com>
References: <1408567571-27481-1-git-send-email-Keith.Holman@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.56.110]
Cc: keith.holman@windriver.com
Subject: [PATCH 5/5] protobuf: add native package to solve self-dependency
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

The installation of Google Protocol Buffers python header files
requires the ability to run the "protoc" compiler on the host to
generate the Python header files.  This fix adds a native package
that builds Google Protocol Buffers for the host machine to provide
the compiler that is used to cross-compile the package for the target
machine.

Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
---
 recipes-containers/criu/protobuf-native_2.5.0.bb | 21 +++++++++++++++++++++
 recipes-containers/criu/protobuf_2.5.0.bb        |  8 +++++---
 2 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 recipes-containers/criu/protobuf-native_2.5.0.bb

diff --git a/recipes-containers/criu/protobuf-native_2.5.0.bb b/recipes-containers/criu/protobuf-native_2.5.0.bb
new file mode 100644
index 0000000..b3f00dd
--- /dev/null
+++ b/recipes-containers/criu/protobuf-native_2.5.0.bb
@@ -0,0 +1,21 @@
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
+SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz \
+	"
+
+EXTRA_OECONF += " --with-protoc=echo --disable-shared"
+
+inherit native autotools
+
diff --git a/recipes-containers/criu/protobuf_2.5.0.bb b/recipes-containers/criu/protobuf_2.5.0.bb
index 851fbf0..5c7454b 100644
--- a/recipes-containers/criu/protobuf_2.5.0.bb
+++ b/recipes-containers/criu/protobuf_2.5.0.bb
@@ -16,10 +16,10 @@ SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz \
 	file://protobuf-allow-running-python-scripts-from-anywhere.patch \
 	file://run-ptest"
 
-EXTRA_OECONF += " --with-protoc=echo"
+EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
 inherit autotools setuptools ptest
 
-RDEPENDS_${PN}-ptest += "make"
+DEPENDS += "protobuf-native"
 
 PYTHON_SRC_DIR="python"
 TEST_SRC_DIR="examples"
@@ -64,6 +64,7 @@ do_install() {
 	autotools_do_install
 
 	# Install header files
+	export PROTOC="${STAGING_BINDIR_NATIVE}/protoc"
 	cd "${S}/${PYTHON_SRC_DIR}"
 	distutils_do_install
 
@@ -85,4 +86,5 @@ do_install_ptest() {
 	cd "$olddir"
 }
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "nativesdk"
+
-- 
1.9.3


