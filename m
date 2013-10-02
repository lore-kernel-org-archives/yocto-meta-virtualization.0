Return-Path: <flihp@twobit.us>
Received: from www.twobit.us (www.twobit.us [50.19.210.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F2A9E01687
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Oct 2013 15:14:30 -0700 (PDT)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=longhaul.twobit.us)
	by www.twobit.us with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <flihp@twobit.us>)
	id 1VRUgf-0001Pb-1g; Wed, 02 Oct 2013 22:14:29 +0000
Date: Wed, 2 Oct 2013 22:14:21 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Message-ID: <20131002221420.GA2972@longhaul.twobit.us>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on www.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
X-SA-Exim-Version: 4.2.1 (built Mon, 22 Mar 2010 06:26:47 +0000)
X-SA-Exim-Scanned: Yes (on www.twobit.us)
Subject: [PATCH] Put the xend daemon in the xen-xend package.
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
X-List-Received-Date: Wed, 02 Oct 2013 22:14:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Just a bit of clean up. I know xend is deprecated and hopefully no
one will use it but it should end up in the right package.

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 recipes-extended/xen/xen_4.3.0.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
index 00394b9..0baea97 100644
--- a/recipes-extended/xen/xen_4.3.0.bb
+++ b/recipes-extended/xen/xen_4.3.0.bb
@@ -276,7 +276,6 @@ FILES_${PN}-misc = "\
     ${sbindir}/gtraceview \
     ${sbindir}/xen-bugtool \
     ${sbindir}/xencov \
-    ${sbindir}/xend \
     ${sbindir}/xenperf \
     ${sbindir}/xenpm \
     ${sbindir}/xsview \
@@ -519,7 +518,10 @@ FILES_${PN}-xm = "\
     "
 
 FILES_${PN}-xencommons += "${sysconfdir}/init.d/xencommons"
-FILES_${PN}-xend += "${sysconfdir}/init.d/xend"
+FILES_${PN}-xend += " \
+    ${sysconfdir}/init.d/xend \
+    ${sbindir}/xend \
+    "
 FILES_${PN}-xendomains += "${sysconfdir}/init.d/xendomains"
 FILES_${PN}-xen-watchdog += "${sysconfdir}/init.d/xen-watchdog"
 
-- 
1.7.10.4


