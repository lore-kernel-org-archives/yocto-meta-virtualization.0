Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC708E00CEE; Mon,  7 Sep 2015 23:55:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A5E2E00B21
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Sep 2015 23:55:39 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t886tdBo028862
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 7 Sep 2015 23:55:39 -0700 (PDT)
Received: from PEK-ZHE-D1.corp.ad.wrs.com (128.224.162.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 7 Sep 2015 23:55:39 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Sep 2015 14:55:12 +0800
Message-ID: <1441695312-24264-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/1] linux-yocto: Add bbappend for 4.1 for virtualization configuration
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
X-List-Received-Date: Tue, 08 Sep 2015 06:55:40 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-kernel/linux/linux-yocto_4.1.bbappend | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto_4.1.bbappend

diff --git a/recipes-kernel/linux/linux-yocto_4.1.bbappend b/recipes-kernel/linux/linux-yocto_4.1.bbappend
new file mode 100644
index 0000000..85e98cc
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -0,0 +1,19 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://xt-checksum.scc \
+            file://ebtables.scc \
+	    file://vswitch.scc \
+	    file://lxc.scc \
+	    "
+KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
+
+KERNEL_MODULE_AUTOLOAD += "openvswitch"
+KERNEL_MODULE_AUTOLOAD += "kvm"
+KERNEL_MODULE_AUTOLOAD += "kvm-amd"
+KERNEL_MODULE_AUTOLOAD += "kvm-intel"
+
+# aufs kernel support required for xen-image-minimal
+KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
+
+# xen kernel support
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
-- 
1.9.1


