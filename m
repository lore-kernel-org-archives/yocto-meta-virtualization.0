Return-Path: <Hongxu.Jia@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA493E00DDC; Wed, 15 May 2019 09:07:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90D75E00D8E
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 09:06:59 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4FG6GS5028568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 09:06:49 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 15 May 2019 09:06:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 16 May 2019 00:06:38 +0800
Message-ID: <1557936398-36529-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: fix Nothing PROVIDES 'numactl' on ARM
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
X-List-Received-Date: Wed, 15 May 2019 16:07:00 -0000
Content-Type: text/plain

ARM does not currently support NUMA, and defines COMPATIBLE_HOST in recipe
numactl

Since commit [b5b5def libvirt: add hook support] applied, it failed with
Nothing PROVIDES 'numactl' on ARM BSP, not all BSP define var-KARCH but
define var-TARGET_ARCH

So check var-TARGET_ARCH, and add numactl to PACKAGECONFIG conditionally

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-extended/libvirt/libvirt_5.3.0.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_5.3.0.bb b/recipes-extended/libvirt/libvirt_5.3.0.bb
index 30bb44c..a949e8f 100644
--- a/recipes-extended/libvirt/libvirt_5.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_5.3.0.bb
@@ -189,9 +189,17 @@ PACKAGECONFIG ??= "qemu yajl openvz vmware vbox esx iproute2 lxc test \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
-                   ${@bb.utils.contains('KARCH', 'arm', '', 'numactl', d)} \
+                   ${@support_numactl(d)} \
                   "
 
+def support_numactl(d):
+    targetarch = d.getVar("TARGET_ARCH")
+    # ARM does not currently support NUMA
+    if targetarch.startswith("arm"):
+        return ""
+
+    return "numactl"
+
 # qemu is NOT compatible with mips64
 PACKAGECONFIG_remove_mipsarchn32 = "qemu"
 PACKAGECONFIG_remove_mipsarchn64 = "qemu"
-- 
2.7.4


