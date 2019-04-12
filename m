Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 936ECE00AB0; Thu, 11 Apr 2019 19:21:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF392E0091D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2019 19:21:20 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3C2Kio8019954
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Apr 2019 19:20:54 -0700
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 11 Apr 2019 19:20:33 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 11 Apr 2019 22:20:05 -0400
Message-ID: <1555035605-5127-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555035605-5127-1-git-send-email-mark.asselstine@windriver.com>
References: <1555035605-5127-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] cri-o: build crio-config natively to generate conmon/config.h
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
X-List-Received-Date: Fri, 12 Apr 2019 02:21:21 -0000
Content-Type: text/plain

Part of building cri-o is the generation of the 'conmon/config.h'
file. The content of this file is dynamic in that it has buffer sizes
and a socket path which will depend on constants that are set in other
parts of the code. For example the socket path can be setup for
Windows or for Linux.

To generate 'conmon/config.h' a small GO application is built and run
called crio-config. This isn't really suitable for a -native package
but we do have to run crio-config on the build host so we don't want
to cross compile it. We therefor use the native GO to build this. This
change allows things to work when the build host arch and the target
arch don't match. A small update to the Makefile avoids mixing build
host arch and target arch GO packages.

Finally, We drop the crio-config binary from the install as it is only
used to create the conmon/config.h as part of the build. This is
consistent with the Makefile's install rule which does not install
this binary as it has no use on the target.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb              |  8 +++-
 ...skip-install-when-generating-the-config.h.patch | 43 ++++++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/cri-o/files/Makefile-skip-install-when-generating-the-config.h.patch

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index cac5536..bc211f1 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -18,6 +18,7 @@ SRCREV_cri-o = "b986e6a8d2af34451363492479d2671a68fd20a3"
 SRC_URI = "\
 	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.13;name=cri-o \
 	file://0001-Makefile-force-symlinks.patch \
+	file://Makefile-skip-install-when-generating-the-config.h.patch \
         file://crio.conf \
 	"
 
@@ -74,6 +75,12 @@ do_compile() {
 
 	cd ${S}/src/import
 
+	# Build conmon/config.h, requires native versions of
+	# cmd/crio-config/config.go and oci/oci.go
+	(CGO_ENABLED=0 GO=go GOARCH=${BUILD_GOARCH} GOOS=${BUILD_GOOS} oe_runmake conmon/config.h)
+	rm -f bin/crio-config
+	rm -rf vendor/pkg
+
 	oe_runmake binaries
 }
 
@@ -96,7 +103,6 @@ do_install() {
     install -m 755 -D ${S}/src/import/test/testdata/* ${D}/${sysconfdir}/crio/config/
 
     install ${S}/src/import/bin/crio ${D}/${localbindir}
-    install ${S}/src/import/bin/crio-config ${D}/${localbindir}
 
     install ${S}/src/import/bin/conmon ${D}/${localbindir}/crio
     install ${S}/src/import/bin/pause ${D}/${localbindir}/crio
diff --git a/recipes-containers/cri-o/files/Makefile-skip-install-when-generating-the-config.h.patch b/recipes-containers/cri-o/files/Makefile-skip-install-when-generating-the-config.h.patch
new file mode 100644
index 0000000..24c7e9d
--- /dev/null
+++ b/recipes-containers/cri-o/files/Makefile-skip-install-when-generating-the-config.h.patch
@@ -0,0 +1,43 @@
+From 3822e834d2dbd87a4dc8cdd36e7fe3b0e9020c4f Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Tue, 9 Apr 2019 13:52:59 -0400
+Subject: [PATCH] Makefile: skip install when generating the config.h
+
+When running 'go build' "The -i flag installs the packages that are
+dependencies of the target." The Makefile makes use of this since many
+of the dependencies needed to complete this rule will be used to by
+other rules in the Makefile, thus speeding the overall build time
+(avoiding redoing work).
+
+In our case the crio-config tool and its dependencies are not being
+cross-compiled as they have to run locally to produce the
+conmon/config.h file and thus installing them is not useful. In this
+case there are no savings and can actually result in errors during the
+build or if the build ARCH and target ARCH are the same, a potential
+for host contamination.
+
+So we drop the use of '-i'.
+
+Upstream-Status: Inappropriate [cross compile issue]
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/import/Makefile b/src/import/Makefile
+index b9fa97f..8336a5b 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -109,7 +109,7 @@ release-note:
+ 	@$(GOPATH)/bin/release-tool -n $(release)
+ 
+ conmon/config.h: cmd/crio-config/config.go oci/oci.go
+-	$(GO) build -i $(LDFLAGS) -o bin/crio-config $(PROJECT)/cmd/crio-config
++	$(GO) build $(LDFLAGS) -o bin/crio-config $(PROJECT)/cmd/crio-config
+ 	( cd conmon && $(CURDIR)/bin/crio-config )
+ 
+ clean:
+-- 
+2.7.4
+
-- 
2.7.4


