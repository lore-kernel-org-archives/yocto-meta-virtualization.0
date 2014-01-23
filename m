Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B07AE008B5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jan 2014 19:17:54 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1W6AmH-0005PB-Rp; Thu, 23 Jan 2014 03:16:26 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1W6ApJ-0002aZ-52; Thu, 23 Jan 2014 03:19:33 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Thu, 23 Jan 2014 03:19:33 +0000
Message-Id: <1390447173-9925-1-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [PATCH] xen: Add libgcc as runtime dependency of xen-xl package.
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
X-List-Received-Date: Thu, 23 Jan 2014 03:17:58 -0000

Much of xl operates fine without libgcc but some operations complain
that pthread_cancel won't work properly without libgcc_s.so.1
installed. The exact text is:

libgcc_s.so.1 must be installed for pthread_cancel to work

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 recipes-extended/xen/xen.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 30d99f4..3acdc01 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -70,6 +70,8 @@ RDEPENDS_${PN}-xencommons = "\
     ${PN}-scripts-common \
     "
 
+RDEPENDS_${PN}-xl = "libgcc"
+
 PACKAGES = "\
     ${PN}-base \
     ${PN}-blktap \
-- 
1.7.10.4


