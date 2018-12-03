Return-Path: <chin.huat.ang@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1CE75E00C91; Sun,  2 Dec 2018 18:20:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [134.134.136.20 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B072BE00BB7
	for <meta-virtualization@yoctoproject.org>;
	Sun,  2 Dec 2018 18:20:17 -0800 (PST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Dec 2018 18:20:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,308,1539673200"; d="scan'208";a="104296173"
Received: from chinhuat-mac01.png.intel.com (HELO ubuntu.localdomain)
	([10.221.20.210])
	by fmsmga007.fm.intel.com with ESMTP; 02 Dec 2018 18:20:16 -0800
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Date: Mon,  3 Dec 2018 10:20:01 +0800
Message-Id: <1543803601-13184-2-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543803601-13184-1-git-send-email-chin.huat.ang@intel.com>
References: <1543803601-13184-1-git-send-email-chin.huat.ang@intel.com>
Subject: [PATCH 2/2] linux-yocto: add virtio kernel configs
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
X-List-Received-Date: Mon, 03 Dec 2018 02:20:20 -0000

Instead of setting virtio kernel configs in LXC fragment, just reuse
cfg/virtio.scc from yocto-kernel-cache.

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
---
 recipes-kernel/linux/linux-yocto_virtualization.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
index 5d3cbc6..f050b3f 100644
--- a/recipes-kernel/linux/linux-yocto_virtualization.inc
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
@@ -14,5 +14,7 @@ KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm',
 # aufs kernel support required for xen-image-minimal
 KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
 
+KERNEL_FEATURES_append = " cfg/virtio.scc"
+
 # xen kernel support
 SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
-- 
2.7.4


