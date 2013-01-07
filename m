Return-Path: <mihai.prica@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4128E006CC
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jan 2013 04:08:07 -0800 (PST)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Jan 2013 04:08:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="188456473"
Received: from mihai-vostro-460 (HELO localhost.localdomain) ([10.237.105.140])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Jan 2013 04:08:05 -0800
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  7 Jan 2013 14:08:23 +0200
Message-Id: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] KVM integration
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
X-List-Received-Date: Mon, 07 Jan 2013 12:08:08 -0000

More details on building a KVM image can be found on the wiki page at:
https://wiki.yoctoproject.org/wiki/Virtualization_with_KVM

Mihai Prica (2):
  linux-yocto: added kernel configuration for KVM
  Created new target:kvm-image-minimal

 recipes-extended/images/kvm-image-minimal.bb    |   22 ++++++++++++++++++++++
 recipes-kernel/linux/linux-yocto/kvm-enable.scc |    4 ++++
 recipes-kernel/linux/linux-yocto/kvm.cfg        |    4 ++++
 recipes-kernel/linux/linux-yocto_3.4.bbappend   |    1 +
 4 files changed, 31 insertions(+)
 create mode 100644 recipes-extended/images/kvm-image-minimal.bb
 create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc
 create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg

-- 
1.7.9.5


