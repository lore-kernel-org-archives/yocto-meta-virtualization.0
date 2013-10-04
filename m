Return-Path: <flihp@twobit.us>
Received: from www.twobit.us (www.twobit.us [50.19.210.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1302FE01654
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Oct 2013 18:47:27 -0700 (PDT)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=longhaul.twobit.us)
	by www.twobit.us with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <flihp@twobit.us>)
	id 1VRuUG-00058x-FW; Fri, 04 Oct 2013 01:47:25 +0000
Date: Fri, 4 Oct 2013 01:47:17 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Message-ID: <20131004014717.GA7786@longhaul.twobit.us>
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
Cc: bruce.ashfield@windriver.com
Subject: [PATCH] Put the XSM policy in the flask package.
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
X-List-Received-Date: Fri, 04 Oct 2013 01:47:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It make make sense to break this out into it's own package in the
future for those that want to ship a monolithic policy without the
tools but for now we should at least get it in the flask package.

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 recipes-extended/xen/xen_4.3.0.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
index 00394b9..2e1a29f 100644
--- a/recipes-extended/xen/xen_4.3.0.bb
+++ b/recipes-extended/xen/xen_4.3.0.bb
@@ -252,6 +252,7 @@ FILES_${PN}-flask = "\
     ${sbindir}/flask-loadpolicy \
     ${sbindir}/flask-set-bool \
     ${sbindir}/flask-setenforce \
+    /boot/xenpolicy.24 \
     "
 
 FILES_${PN}-gdbsx = "\
-- 
1.7.10.4


