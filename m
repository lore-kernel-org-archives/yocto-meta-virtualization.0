Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C045CE008D3; Mon, 29 Jul 2019 23:52:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF1A4E00C94
	for <meta-virtualization@yoctoproject.org>;
	Mon, 29 Jul 2019 23:52:26 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6U6qOLY014845
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Jul 2019 23:52:24 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 29 Jul 2019 23:52:23 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Tue, 30 Jul 2019 14:52:22 +0800
Message-ID: <1564469542-339956-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: Remove numactl from PACKAGECONFIG for arm
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
X-List-Received-Date: Tue, 30 Jul 2019 06:52:36 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

b5b5def ("libvirt: add hook support") introduces a wrong check against KARCH
which is not defined.

This patch use TARGET_ARCH overrides to remove numactl from PACKAGECONFIG for
32-bit arm arches.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-extended/libvirt/libvirt_5.5.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb b/recipes-extended/libvirt/libvirt_5.5.0.bb
index 80f7a6c..de936c4 100644
--- a/recipes-extended/libvirt/libvirt_5.5.0.bb
+++ b/recipes-extended/libvirt/libvirt_5.5.0.bb
@@ -192,13 +192,16 @@ PACKAGECONFIG ??= "qemu yajl openvz vmware vbox esx iproute2 lxc test \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'polkit', '', d)} \
-                   ${@bb.utils.contains('KARCH', 'arm', '', 'numactl', d)} \
                   "
 
 # qemu is NOT compatible with mips64
 PACKAGECONFIG_remove_mipsarchn32 = "qemu"
 PACKAGECONFIG_remove_mipsarchn64 = "qemu"
 
+# numactl is NOT compatible with arm
+PACKAGECONFIG_remove_arm = "numactl"
+PACKAGECONFIG_remove_armeb = "numactl"
+
 # enable,disable,depends,rdepends
 #
 PACKAGECONFIG[gnutls] = ",,,gnutls-bin"
-- 
2.7.4


