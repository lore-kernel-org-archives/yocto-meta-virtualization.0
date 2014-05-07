Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D4F7E0070F; Wed,  7 May 2014 09:54:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3283E00480
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 May 2014 09:54:14 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s47GsDg1005133
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 7 May 2014 09:54:13 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 7 May 2014 09:54:13 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 7 May 2014 12:52:29 -0400
Message-ID: <1399481549-15420-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1399481549-15420-1-git-send-email-mark.asselstine@windriver.com>
References: <1399481549-15420-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.56.18]
Cc: mark.asselstine@windriver.com, meta-virtualization@yoctoproject.org
Subject: [PATCH 2/2] libvirt: allow separated src and build dirs
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
X-List-Received-Date: Wed, 07 May 2014 16:54:20 -0000
Content-Type: text/plain

Poky commit 69b6eaca3d9b635e8a61a0fdbd814b558e91901d [autotools:
Enable separate builddir by default] enforced separate build
directories, which is supported by automake.  Make some minor updates
to the recipes and upstream source to allow builds to work with
separated src and build directories.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc        |  4 +-
 .../tests-allow-separated-src-and-build-dirs.patch | 57 ++++++++++++++++++++++
 recipes-extended/libvirt/libvirt_1.2.2.bb          |  1 +
 3 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 recipes-extended/libvirt/libvirt/tests-allow-separated-src-and-build-dirs.patch

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 195a9de..181e9d3 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -23,8 +23,8 @@ SRC_URI[libvirt_python.sha256sum] = "94d79d662b6010f6c688b8856b2d95077736d48ffa3
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
-export LIBVIRT_LIBS = "-L${S}/src/.libs -lvirt -ldl"
-export LDFLAGS="-L${S}/src/.libs"
+export LIBVIRT_LIBS = "-L${B}/src/.libs -lvirt -ldl"
+export LDFLAGS="-L${B}/src/.libs"
 
 LIBVIRT_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
diff --git a/recipes-extended/libvirt/libvirt/tests-allow-separated-src-and-build-dirs.patch b/recipes-extended/libvirt/libvirt/tests-allow-separated-src-and-build-dirs.patch
new file mode 100644
index 0000000..3964865
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/tests-allow-separated-src-and-build-dirs.patch
@@ -0,0 +1,57 @@
+From 884b6e3724b75cd92766d5386455983e3557a286 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Fri, 2 May 2014 13:45:05 -0400
+Subject: [PATCH] tests: allow separated src and build dirs
+
+Fixup Makefile.am to search for static files back in srcdir.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ tests/Makefile.am | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 0da514b..b8d7c19 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -1006,22 +1006,22 @@ install-ptest:
+ 	@(if [ -d ../tools/.libs ] ; then cd ../tools/.libs; fi; \
+ 	install * $(DEST_DIR)/tools)
+ 	install -d $(DEST_DIR)/src/network
+-	cp ../src/network/*.xml $(DEST_DIR)/src/network
++	cp $(top_srcdir)/src/network/*.xml $(DEST_DIR)/src/network
+ 	install -d $(DEST_DIR)/src/cpu
+-	cp ../src/cpu/*.xml $(DEST_DIR)/src/cpu
++	cp $(top_srcdir)/src/cpu/*.xml $(DEST_DIR)/src/cpu
+ 	install ../src/libvirt_iohelper $(DEST_DIR)/src
+ 	install -D ../daemon/libvirtd $(DEST_DIR)/daemon/libvirtd
+-	install -D ../daemon/libvirtd.conf $(DEST_DIR)/daemon/libvirtd.conf
++	install -D $(top_srcdir)/daemon/libvirtd.conf $(DEST_DIR)/daemon/libvirtd.conf
+ 	@(if [ -d ../daemon/.libs ] ; then cd ../daemon/.libs; fi; \
+ 	install * $(DEST_DIR)/daemon)
+ 	install -d $(DEST_DIR)/src/.libs
+ 	@(if [ -d ../src/.libs ] ; then cd ../src/.libs; fi; \
+ 	install * $(DEST_DIR)/src/.libs)
+ 	install -d $(DEST_DIR)/docs/schemas
+-	cp ../docs/schemas/*.rng $(DEST_DIR)/docs/schemas
+-	cp -r ../build-aux $(DEST_DIR)
++	cp $(top_srcdir)/docs/schemas/*.rng $(DEST_DIR)/docs/schemas
++	cp -r $(top_srcdir)/build-aux $(DEST_DIR)
+ 	install -d $(DEST_DIR)/examples/xml
+-	cp -r ../examples/xml/test $(DEST_DIR)/examples/xml
++	cp -r $(top_srcdir)/examples/xml/test $(DEST_DIR)/examples/xml
+ 	install -d $(DEST_DIR)/tests/.libs
+ 	find . -type d -name "*xml2xml*" -exec cp -r {} $(DEST_DIR)/tests \;
+ 	find . -type d -name "*data" -exec cp -r {} $(DEST_DIR)/tests \;
+@@ -1029,7 +1029,7 @@ install-ptest:
+ 		if [ -f .libs/$$file ]; then \
+ 			install .libs/$$file $(DEST_DIR)/tests; \
+ 		else \
+-			install $$file $(DEST_DIR)/tests; \
++			install $(srcdir)/$$file $(DEST_DIR)/tests; \
+ 		fi; \
+ 	done;)
+ 	@(if [ -d .libs ]; then install .libs/*.so $(DEST_DIR)/tests/.libs; fi;)
+-- 
+1.8.3.2
+
diff --git a/recipes-extended/libvirt/libvirt_1.2.2.bb b/recipes-extended/libvirt/libvirt_1.2.2.bb
index a66a6ad..22ae2c7 100644
--- a/recipes-extended/libvirt/libvirt_1.2.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.2.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://libvirtd.conf \
            file://runptest.patch \
            file://run-ptest \
+           file://tests-allow-separated-src-and-build-dirs.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "592958ad1ddce7574d8cb0a31e635acd"
-- 
1.8.3.2


