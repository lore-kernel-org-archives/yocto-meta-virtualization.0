Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (unknown [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28DCBE01797
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 Oct 2013 15:10:47 -0700 (PDT)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1Vav1I-00057G-Qu; Mon, 28 Oct 2013 22:10:45 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1Vav1P-0000nQ-Rz; Mon, 28 Oct 2013 22:10:51 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Mon, 28 Oct 2013 22:10:47 +0000
Message-Id: <1382998249-3028-1-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [PATCH 0/2] Xen: start using PACKAGECONFIG
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

This is a first pass at cleaning up the DEPENDS and do_configure in
the xen_4.3.0 recipe. Adding XSM stuff made it clear that directly
interacting with DISTRO_FEATURES was the wrong way to do it. That and
when Chris and I ment up at LinuxCon he told me I should have used
PACKAGECONFIG in the first place :P

This small patch series is the first step to handling features (like
sdl) using PACKAGECONFIG.

Philip Tricca (2):
  Convert direct call to ./configure with oe_runconf and EXTRA_OECONF.
  Use PACKAGECONFIG to deal with XSM policy.

 recipes-extended/xen/xen_4.3.0.bb |   19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

-- 
1.7.10.4


