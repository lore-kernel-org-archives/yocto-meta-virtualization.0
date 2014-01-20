Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE318E00875
	for <meta-virtualization@yoctoproject.org>;
	Sun, 19 Jan 2014 17:57:58 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1W546K-0002tX-W2; Mon, 20 Jan 2014 01:56:34 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1W549H-0000SL-Nd; Mon, 20 Jan 2014 01:59:35 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Mon, 20 Jan 2014 01:59:33 +0000
Message-Id: <1390183175-1718-2-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1390183175-1718-1-git-send-email-flihp@twobit.us>
References: <1390183175-1718-1-git-send-email-flihp@twobit.us>
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [PATCH 1/3] xen: Move supporting files into xencommons and xendomains packages.
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
X-List-Received-Date: Mon, 20 Jan 2014 01:58:01 -0000


Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 recipes-extended/xen/xen.inc |   17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index e31e996..0b6ce93 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -213,11 +213,8 @@ FILES_${PN}-hypervisor = "\
     "
 
 FILES_${PN}-base = "\
-    ${sysconfdir}/default/xencommons \
-    ${sysconfdir}/default/xendomains \
     ${sysconfdir}/xen/auto \
     ${sysconfdir}/xen/cpupool \
-    ${sysconfdir}/sysconfig/xendomains \
     ${localstatedir}/xen/dump \
     "
 
@@ -521,12 +518,22 @@ FILES_${PN}-xm = "\
     ${sbindir}/xm \
     "
 
-FILES_${PN}-xencommons += "${sysconfdir}/init.d/xencommons"
+FILES_${PN}-xencommons += "\
+    ${sysconfdir}/default/xencommons \
+    ${sysconfdir}/init.d/xencommons \
+    "
+
 FILES_${PN}-xend += " \
     ${sysconfdir}/init.d/xend \
     ${sbindir}/xend \
     "
-FILES_${PN}-xendomains += "${sysconfdir}/init.d/xendomains"
+
+FILES_${PN}-xendomains += "\
+    ${sysconfdir}/default/xendomains \
+    ${sysconfdir}/init.d/xendomains \
+    ${sysconfdir}/sysconfig/xendomains \
+    "
+
 FILES_${PN}-xen-watchdog += "${sysconfdir}/init.d/xen-watchdog"
 
 # configure init.d scripts
-- 
1.7.10.4


