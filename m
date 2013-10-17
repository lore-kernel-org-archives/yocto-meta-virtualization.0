Return-Path: <flihp@twobit.us>
Received: from www.twobit.us (www.twobit.us [50.19.210.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 635F0E01684
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Oct 2013 11:47:49 -0700 (PDT)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=longhaul.twobit.us)
	by www.twobit.us with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <flihp@twobit.us>)
	id 1VWsbs-0004rX-KN; Thu, 17 Oct 2013 18:47:48 +0000
Received: from flihp by longhaul.twobit.us with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1VWsbo-0007uB-Tz; Thu, 17 Oct 2013 18:47:44 +0000
From: flihp@twobit.us
To: meta-virtualization@yoctoproject.org
Date: Thu, 17 Oct 2013 18:47:33 +0000
Message-Id: <1382035656-30349-1-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on www.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
X-SA-Exim-Version: 4.2.1 (built Mon, 22 Mar 2010 06:26:47 +0000)
X-SA-Exim-Scanned: Yes (on www.twobit.us)
Subject: [PATCH 0/3] Build Xen XSM policy with 'xsm' DISTRO_FEATURE.
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
X-List-Received-Date: Thu, 17 Oct 2013 18:47:50 -0000

This patch series allows users to build the XSM policy from the Xen
source tree. This adds a dependency on the checkpolicy compiler from
meta-selinux layer but only if the 'xsm' DISTRO_FEATURE is present. The
README has been updated to reflect this conditional dependency (I
guessed at the formatting).

Philip Tricca (3):
 xen: avoid installing flask policy file as '/boot'
 build xsm policy when 'xsm' DISTRO_FEATURE is present
 Add note about dependency on meta-selinux to README.

 README                                             |    6 +++++
 ...lask-avoid-installing-policy-file-as-boot.patch |   26 +++++++++++++++++++
 recipes-extended/xen/xen_4.3.0.bb                  |    9 ++++---
 3 files changed, 38 insertions(+), 3 deletions(-)


