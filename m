Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DEF2E0079A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Feb 2014 18:45:10 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1WDPnE-0002v4-Hp; Wed, 12 Feb 2014 02:43:21 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1WDPoy-0005WB-1G; Wed, 12 Feb 2014 02:45:08 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Wed, 12 Feb 2014 02:45:07 +0000
Message-Id: <1392173107-21170-4-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392173107-21170-1-git-send-email-flihp@twobit.us>
References: <1392173107-21170-1-git-send-email-flihp@twobit.us>
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [RFC 3/3] xen: Remove pciback kernel module from xen-image-minimal.
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
X-List-Received-Date: Wed, 12 Feb 2014 02:45:11 -0000

The expectation is that this image would be built with the xen-dom0
distro feature and the pciback driver would be built into the kernel
as a result.

Signed-off-by: Philip Tricca <flihp@twobit.us>

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index 13917c5..81e40ed 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -10,7 +10,6 @@ IMAGE_INSTALL += " \
     kernel-module-xen-gntalloc \
     kernel-module-xen-gntdev \
     kernel-module-xen-netback \
-    kernel-module-xen-pciback \
     kernel-module-xen-wdt \
     xen-base \
     xen-qemu \
-- 
1.7.10.4


