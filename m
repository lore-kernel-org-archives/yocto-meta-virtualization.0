Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC3C2E00563
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Dec 2013 18:20:13 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1Vo23r-0001ZF-3D; Wed, 04 Dec 2013 02:19:35 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1Vo24o-0001XL-Iq; Wed, 04 Dec 2013 02:20:34 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Wed,  4 Dec 2013 02:20:34 +0000
Message-Id: <1386123634-5877-1-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [RFC] xen: Break volatiles out into separate package.
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
X-List-Received-Date: Wed, 04 Dec 2013 02:20:17 -0000

The Xen scripts for handling block and vif udev events depend on
directories created by the Xen volatile directories. In a situation
where the 'base' Xen package isn't installed (NDVM etc) these
scripts fail silently. The most simple approach I could come up
with is just breaking the Xen volatiles config out into it's own
package and setting up the logical dependencies.

Creating a new package for just a single file seems like overkill
to me but it's the most straightforward thing I could come up with.

Regards,
Philip

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 recipes-extended/xen/xen.inc |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 9d43814..e31e996 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -53,12 +53,14 @@ RDEPENDS_${PN}-base = "\
 RDEPENDS_${PN}-scripts-block = "\
     ${PN}-scripts-common \
     ${PN}-udev \
+    ${PN}-volatiles \
     "
 
 RDEPENDS_${PN}-scripts-network = "\
     bridge-utils \
     ${PN}-scripts-common \
     ${PN}-udev \
+    ${PN}-volatiles \
     "
 
 PACKAGES = "\
@@ -106,6 +108,7 @@ PACKAGES = "\
     ${PN}-scripts-network \
     ${PN}-staticdev \
     ${PN}-udev \
+    ${PN}-volatiles \
     ${PN}-xcutils \
     ${PN}-xencommons \
     ${PN}-xend \
@@ -210,7 +213,6 @@ FILES_${PN}-hypervisor = "\
     "
 
 FILES_${PN}-base = "\
-    ${sysconfdir}/default/volatiles/99_xen \
     ${sysconfdir}/default/xencommons \
     ${sysconfdir}/default/xendomains \
     ${sysconfdir}/xen/auto \
@@ -425,6 +427,10 @@ FILES_${PN}-udev = "\
     ${sysconfdir}/udev/rules.d/xend.rules \
     "
 
+FILES_${PN}-volatiles = "\
+    ${sysconfdir}/default/volatiles/99_xen \
+    "
+
 FILES_${PN}-xcutils = "\
     ${libdir}/xen/bin/lsevtchn \
     ${libdir}/xen/bin/readnotes \
-- 
1.7.10.4


