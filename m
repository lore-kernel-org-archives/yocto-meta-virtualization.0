Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (unknown [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55E3AE01797
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 Oct 2013 15:10:48 -0700 (PDT)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1Vav1K-00057H-9V; Mon, 28 Oct 2013 22:10:46 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1Vav1R-0000nV-Am; Mon, 28 Oct 2013 22:10:53 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Mon, 28 Oct 2013 22:10:48 +0000
Message-Id: <1382998249-3028-2-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382998249-3028-1-git-send-email-flihp@twobit.us>
References: <y>
 <1382998249-3028-1-git-send-email-flihp@twobit.us>
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [PATCH 1/2] Convert direct call to ./configure with oe_runconf and EXTRA_OECONF.
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
X-List-Received-Date: Mon, 28 Oct 2013 22:10:48 -0000

enable/disable stuff will eventually be replaced with appropriate
use of PACKAGECONFIG.

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 recipes-extended/xen/xen_4.3.0.bb |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
index 078b39c..7a0e408 100644
--- a/recipes-extended/xen/xen_4.3.0.bb
+++ b/recipes-extended/xen/xen_4.3.0.bb
@@ -563,6 +563,17 @@ export CROSS_COMPILE="${TARGET_PREFIX}"
 # overide LDFLAGS to allow xen to build without: "x86_64-oe-linux-ld: unrecognized option '-Wl,-O1'"
 export LDFLAGS=""
 
+EXTRA_OECONF += " \
+    --exec-prefix=/usr \
+    --prefix=/usr \
+    --host=${HOST_SYS} \
+    --disable-stubdom \
+    --disable-ioemu-stubdom \
+    --disable-pv-grub \
+    --disable-xenstore-stubdom \
+    ${@base_contains('DISTRO_FEATURES', 'xsm', '--enable-xsmpolicy', '--disable-xsmpolicy',d)} \
+"
+
 do_configure() {
     # fixup qemu-xen-traditional pciutils check hardcoded to test ${includedir}/pci
     sed -i 's/\/usr\/include\/pci/$(STAGING_INCDIR)\/pci/g' ${S}/tools/qemu-xen-traditional/xen-hooks.mak
@@ -580,7 +591,7 @@ do_configure() {
     fi
 
     # do configure
-    ./configure --exec-prefix=/usr --prefix=/usr --host=${HOST_SYS} --disable-stubdom --disable-ioemu-stubdom --disable-pv-grub --disable-xenstore-stubdom "${@base_contains('DISTRO_FEATURES', 'xsm', '--enable-xsmpolicy', '--disable-xsmpolicy',d)}"
+    oe_runconf
 
     # seabios needs a patch to specify correct compiler - pull and patch Makefile
     make -C ${S}/tools/firmware seabios-dir
-- 
1.7.10.4


