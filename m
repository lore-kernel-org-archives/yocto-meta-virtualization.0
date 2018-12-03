Return-Path: <chin.huat.ang@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A332E00C1E; Sun,  2 Dec 2018 18:20:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [134.134.136.20 listed in list.dnswl.org]
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56817E00BB7
	for <meta-virtualization@yoctoproject.org>;
	Sun,  2 Dec 2018 18:20:15 -0800 (PST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Dec 2018 18:20:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,308,1539673200"; d="scan'208";a="104296169"
Received: from chinhuat-mac01.png.intel.com (HELO ubuntu.localdomain)
	([10.221.20.210])
	by fmsmga007.fm.intel.com with ESMTP; 02 Dec 2018 18:20:13 -0800
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Date: Mon,  3 Dec 2018 10:20:00 +0800
Message-Id: <1543803601-13184-1-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] lxc: remove virtio kernel configs
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
X-List-Received-Date: Mon, 03 Dec 2018 02:20:16 -0000

The script lxc-checkconfig doesn't seem to report virtio related kernel
configs as required, so remove them from lxc.cfg instead.

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
---
 recipes-kernel/linux/linux-yocto/lxc.cfg | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
index c25d60f..e5f1edc 100644
--- a/recipes-kernel/linux/linux-yocto/lxc.cfg
+++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
@@ -21,18 +21,7 @@ CONFIG_NETPRIO_CGROUP=m
 CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
 
 # Virtual drivers
-CONFIG_VIRTIO_BLK=y
-CONFIG_SCSI_VIRTIO=y
-CONFIG_VIRTIO_NET=m
 CONFIG_HVC_DRIVER=y
-CONFIG_VIRTIO_CONSOLE=y
-CONFIG_HW_RANDOM_VIRTIO=m
-CONFIG_VIRTIO=y
-CONFIG_VIRTIO_RING=y
-CONFIG_VIRTIO_PCI=y
-CONFIG_VIRTIO_BALLOON=y
-CONFIG_VIRTIO_MMIO=y
-
 
 # Base support for live boot
 CONFIG_BLK_DEV_LOOP=y
-- 
2.7.4


