Return-Path: <Keith.Holman@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B89A3E00831; Wed, 20 Aug 2014 13:46:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE9D0E00807
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Aug 2014 13:46:17 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7KKkGEG022043
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Aug 2014 13:46:16 -0700 (PDT)
Received: from yow-kholman-lx1.wrs.com (128.224.56.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Wed, 20 Aug 2014 13:46:16 -0700
From: Keith Holman <Keith.Holman@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 20 Aug 2014 16:46:09 -0400
Message-ID: <1408567571-27481-3-git-send-email-Keith.Holman@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1408567571-27481-1-git-send-email-Keith.Holman@windriver.com>
References: <1408567571-27481-1-git-send-email-Keith.Holman@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.56.110]
Cc: keith.holman@windriver.com
Subject: [PATCH 3/5] protobuf: replace spaces with tabs in recipe
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

The recipe uses 4 spaces instead of tabs when indenting.  The recipe
style guidelines indicate that tabs should be used instead.  This
simple fix replaces the spaces with tabs where appropriate in the
recipe file.

Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
---
 recipes-containers/criu/protobuf_2.5.0.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-containers/criu/protobuf_2.5.0.bb b/recipes-containers/criu/protobuf_2.5.0.bb
index a9a26d8..5cf6cc9 100644
--- a/recipes-containers/criu/protobuf_2.5.0.bb
+++ b/recipes-containers/criu/protobuf_2.5.0.bb
@@ -19,16 +19,16 @@ EXTRA_OECONF += " --with-protoc=echo"
 inherit autotools setuptools
 
 do_compile() {
-    # Compile protoc compiler
-    base_do_compile
+	# Compile protoc compiler
+	base_do_compile
 }
 
 do_install() {
-    # Install protoc compiler
-    autotools_do_install
-    # Install header files
-    cd "${PYTHON_SRC_DIR}"
-    distutils_do_install
+	# Install protoc compiler
+	autotools_do_install
+	# Install header files
+	cd "${PYTHON_SRC_DIR}"
+	distutils_do_install
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.3


