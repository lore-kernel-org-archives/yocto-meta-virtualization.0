Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25C8EE00837; Mon, 23 Mar 2015 10:33:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB112E006DA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Mar 2015 10:33:31 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2NHXTlC000968
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Mar 2015 10:33:30 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>) id 1Ya6E3-0004et-JH
	for meta-virtualization@yoctoproject.org;
	Mon, 23 Mar 2015 13:33:19 -0400
Date: Mon, 23 Mar 2015 13:33:19 -0400
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Message-ID: <20150323173319.GA17882@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] libvirt: do_compile fails 'src/cpu/cpu_map.xml': No such file or directory
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
X-List-Received-Date: Mon, 23 Mar 2015 17:33:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From b80338aa436fa115cc0c8d9b7fc5345d4171c56a Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Mon, 23 Mar 2015 13:29:39 -0400
Subject: [PATCH] libvirt: do_compile fails 'src/cpu/cpu_map.xml': No such file
 or directory'

In some circumstances where the build tree differs from the source,
libvirt's compile will try to create the symlink for cpu_map.xml before
creating the directory $(abs_builddir)/cpu.

Add a test to create this directory if it hasn't already been created.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 ...virt-Fix-cannot-symlink-cpu_map.xml-error.patch | 34 ++++++++++++++++++++++
 recipes-extended/libvirt/libvirt_1.2.12.bb         |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch

diff --git a/recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch b/recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch
new file mode 100644
index 0000000..090bc6e
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch
@@ -0,0 +1,34 @@
+libvirt: do_compile fails 'src/cpu/cpu_map.xml': No such file or directory'
+
+In some very rare circumstances, libvirt's compile will try to create the
+symlink for cpu_map.xml before creating the directory $(abs_builddir)/cpu.
+
+Add a test to create this directory if it hasn't already been created.
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+
+---
+ src/Makefile.am |    1 +
+ src/Makefile.in |    1 +
+ 2 files changed, 2 insertions(+)
+
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1053,6 +1053,7 @@
+ libvirt_cpu_la_DEPENDENCIES = $(abs_builddir)/cpu/cpu_map.xml
+ 
+ $(abs_builddir)/cpu/cpu_map.xml:
++	if [ ! -d $(abs_builddir)/cpu ]; then $(MKDIR_P) $(abs_builddir)/cpu/; fi
+ 	$(AM_V_GEN)ln -s $(abs_srcdir)/cpu/cpu_map.xml $@
+ 
+ if WITH_VMX
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -10338,6 +10338,7 @@
+ 	  $(srcdir)/lxc/lxc_controller_dispatch.h
+ 
+ $(abs_builddir)/cpu/cpu_map.xml:
++	if [ ! -d $(abs_builddir)/cpu ]; then $(MKDIR_P) $(abs_builddir)/cpu/; fi
+ 	$(AM_V_GEN)ln -s $(abs_srcdir)/cpu/cpu_map.xml $@
+ 
+ %protocol.c: %protocol.x %protocol.h $(srcdir)/rpc/genprotocol.pl
diff --git a/recipes-extended/libvirt/libvirt_1.2.12.bb b/recipes-extended/libvirt/libvirt_1.2.12.bb
index ef46e22..dca2d1b 100644
--- a/recipes-extended/libvirt/libvirt_1.2.12.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.12.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://runptest.patch \
            file://run-ptest \
            file://tests-allow-separated-src-and-build-dirs.patch \
+           file://libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "2ae99535265ce4687d8718d744024c27"
-- 
2.1.4


