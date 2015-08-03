Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EABB0E00461; Mon,  3 Aug 2015 01:59:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FC58E00349
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Aug 2015 01:59:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99194933"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Aug 2015 17:03:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t738vbe1027353
	for <meta-virtualization@yoctoproject.org>;
	Mon, 3 Aug 2015 16:57:38 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 3 Aug 2015 16:59:30 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 3 Aug 2015 16:59:25 +0800
Message-ID: <1438592365-46823-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH] libvirt: upgrade 1.2.15 -> 1.2.17
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
X-List-Received-Date: Mon, 03 Aug 2015 08:59:41 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../libvirt-1.2.17/0001-to-fix-build-error.patch   | 44 ++++++++++++++++++++++
 recipes-extended/libvirt/libvirt-python.inc        |  4 +-
 .../{libvirt_1.2.15.bb => libvirt_1.2.17.bb}       |  5 ++-
 3 files changed, 49 insertions(+), 4 deletions(-)
 create mode 100644 recipes-extended/libvirt/libvirt-1.2.17/0001-to-fix-build-error.patch
 rename recipes-extended/libvirt/{libvirt_1.2.15.bb => libvirt_1.2.17.bb} (97%)

diff --git a/recipes-extended/libvirt/libvirt-1.2.17/0001-to-fix-build-error.patch b/recipes-extended/libvirt/libvirt-1.2.17/0001-to-fix-build-error.patch
new file mode 100644
index 0000000..61a54e1
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt-1.2.17/0001-to-fix-build-error.patch
@@ -0,0 +1,44 @@
+From 62514c8c2925e48a4f20ce3d7d48387851cb76a5 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Fri, 31 Jul 2015 03:17:07 +0900
+Subject: [PATCH] to fix build error
+
+The error likes as following
+
+| Generating internals/command.html.tmp
+| /bin/sh: line 3: internals/command.html.tmp: No such file or directory
+| rm: Generating internals/locking.html.tmp
+| cannot remove `internals/command.html.tmp': No such file or directory
+| make[3]: *** [internals/command.html.tmp] Error 1
+| make[3]: *** Waiting for unfinished jobs....
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ docs/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/docs/Makefile.am b/docs/Makefile.am
+index daf37b6..125c5fd 100644
+--- a/docs/Makefile.am
++++ b/docs/Makefile.am
+@@ -162,7 +162,7 @@ EXTRA_DIST=					\
+   sitemap.html.in aclperms.htmlinc \
+   todo.pl hvsupport.pl todo.cfg-example
+ 
+-acl_generated = aclperms.htmlinc
++acl.html:: $(srcdir)/aclperms.htmlinc
+ 
+ $(srcdir)/aclperms.htmlinc: $(top_srcdir)/src/access/viraccessperm.h \
+         $(srcdir)/genaclperms.pl Makefile.am
+@@ -227,7 +227,7 @@ internals/%.html.tmp: internals/%.html.in subsite.xsl page.xsl sitemap.html.in
+ 	    $(top_srcdir)/docs/subsite.xsl $< > $@ \
+ 	    || { rm $@ && exit 1; }; fi
+ 
+-%.html.tmp: %.html.in site.xsl page.xsl sitemap.html.in $(acl_generated)
++%.html.tmp: %.html.in site.xsl page.xsl sitemap.html.in 
+ 	@if [ -x $(XSLTPROC) ] ; then \
+ 	  echo "Generating $@"; \
+ 	  name=`echo $@ | sed -e 's/.tmp//'`; \
+-- 
+1.8.4.2
+
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 550236a..f42e491 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "f13b566b54fe71ec0f26992aee11dd09"
-SRC_URI[libvirt_python.sha256sum] = "9a6dfbd487d49f887a41aca4bfb1b4e043fd9fbdfc041252cae84023f5c387ba"
+SRC_URI[libvirt_python.md5sum] = "a695e323e33db562d86e947f7ac77f09"
+SRC_URI[libvirt_python.sha256sum] = "f4d3db4012a800a2519e62bbef4ce14a37e030a20ab18f5b66759533a39b36ed"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt_1.2.15.bb b/recipes-extended/libvirt/libvirt_1.2.17.bb
similarity index 97%
rename from recipes-extended/libvirt/libvirt_1.2.15.bb
rename to recipes-extended/libvirt/libvirt_1.2.17.bb
index 8abd41e..9f8c3af 100644
--- a/recipes-extended/libvirt/libvirt_1.2.15.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.17.bb
@@ -31,10 +31,11 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://run-ptest \
            file://tests-allow-separated-src-and-build-dirs.patch \
            file://libvirt-use-pkg-config-to-locate-libcap.patch \
+           file://0001-to-fix-build-error.patch \
           "
 
-SRC_URI[libvirt.md5sum] = "08c2ea825d076ee67b1bbc600c220b97"
-SRC_URI[libvirt.sha256sum] = "5f88041b8c212f8f687c672fe583108833240d6175b512ce4de92ab6660194c6"
+SRC_URI[libvirt.md5sum] = "a1f49050223be3cbd7678c32b1ee2756"
+SRC_URI[libvirt.sha256sum] = "e07eaf20b0590fae05ba3b53ad4dac3e5fbd771437563cc78b692f23ddd02fad"
 
 inherit autotools gettext update-rc.d pkgconfig ptest
 
-- 
1.8.4.2


