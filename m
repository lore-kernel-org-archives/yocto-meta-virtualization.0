Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCFD6E00841
	for <meta-virtualization@yoctoproject.org>;
	Sun, 19 Jan 2014 17:57:58 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1W546K-0002tY-IV; Mon, 20 Jan 2014 01:56:34 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1W549H-0000SQ-PH; Mon, 20 Jan 2014 01:59:35 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Mon, 20 Jan 2014 01:59:34 +0000
Message-Id: <1390183175-1718-3-git-send-email-flihp@twobit.us>
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
Subject: [PATCH 2/3] xen: Cleanup watchdog FILES declaration.
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
 recipes-extended/xen/xen.inc |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 0b6ce93..4bb00e3 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -481,6 +481,7 @@ FILES_${PN}-xentrace = "\
 
 FILES_${PN}-xen-watchdog = "\
     ${sbindir}/xenwatchdogd \
+    ${sysconfdir}/init.d/xen-watchdog \
     "
 
 FILES_${PN}-xl = "\
@@ -534,8 +535,6 @@ FILES_${PN}-xendomains += "\
     ${sysconfdir}/sysconfig/xendomains \
     "
 
-FILES_${PN}-xen-watchdog += "${sysconfdir}/init.d/xen-watchdog"
-
 # configure init.d scripts
 INITSCRIPT_PACKAGES = "${PN}-xend ${PN}-xencommons ${PN}-xen-watchdog ${PN}-xendomains"
 INITSCRIPT_NAME_${PN}-xencommons = "xencommons"
-- 
1.7.10.4


