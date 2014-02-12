Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CAA6E006B6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Feb 2014 18:45:10 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1WDPnE-0002v1-IK; Wed, 12 Feb 2014 02:43:22 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1WDPox-0005Vy-Ny; Wed, 12 Feb 2014 02:45:07 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Wed, 12 Feb 2014 02:45:04 +0000
Message-Id: <1392173107-21170-1-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [RFC 0/3] xen: Break Xen kernel config into two parts: dom0 / guest.
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

Kernel configs for Xen VMs are often very different depending on their
purpose. Dom0 and guest VMs are the most obvious lines to divide the
config space on. This small patch set is an RFC to to get opinions on:
1) whether this is desired
2) whether or not the proposed approach is acceptable

I've broken the 'xen' distro feature up into two parts, one for dom0
the other for guest VMs. In the first patch the configs are functionally
equivalent but some structure is presented for splitting the two up
where desired in the future. The second patch splits the Xen PCI device
passthrough config options between those that make sense for dom0 and
those that make sense fo guest VMs.

Let me know what you all think.

Regards,
Philip

Philip Tricca (3):
  xen: Create structure necessary to break Xen kernel config into dom0
    / guest.
  xen: Split Xen PCI kernel config into dom0 / guest VM.
  xen: Remove pciback kernel module from xen-image-minimal.

 recipes-extended/images/xen-image-minimal.bb    |    1 -
 recipes-kernel/linux/linux-yocto/xen-common.cfg |   51 +++++++++++++++++++++
 recipes-kernel/linux/linux-yocto/xen-dom0.cfg   |    2 +
 recipes-kernel/linux/linux-yocto/xen-dom0.scc   |    5 +++
 recipes-kernel/linux/linux-yocto/xen-guest.cfg  |    2 +
 recipes-kernel/linux/linux-yocto/xen-guest.scc  |    5 +++
 recipes-kernel/linux/linux-yocto/xen.cfg        |   54 -----------------------
 recipes-kernel/linux/linux-yocto/xen.scc        |    4 --
 recipes-kernel/linux/linux-yocto_3.10.bbappend  |    6 ++-
 9 files changed, 70 insertions(+), 60 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto/xen-common.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/xen-dom0.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/xen-dom0.scc
 create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto/xen.scc

-- 
1.7.10.4


