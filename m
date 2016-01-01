Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B1CFE00CAE; Fri,  1 Jan 2016 07:53:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F83AE0033E
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Jan 2016 07:53:30 -0800 (PST)
Received: by mail-qg0-f54.google.com with SMTP id e32so125995791qgf.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 01 Jan 2016 07:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pKVET1QWmlL6Mfc+mxh9ZljEyhU77t0KqRgUSj/Do0w=;
	b=EbhGzcnodrEvfTOubNkiCcOQPiJHqPxLjeKp3vYZIP90LOBnP35Pnvkpb7qnJvVoY4
	C2XkJWtkbgJXKQCNgOa3t22mvNHX1bKqS+DZMHKaM95i2BQJeoJy/Vrvm9IWC/cAVJDN
	WYalRNPNgkVGZeF/3W2KGGz6qmXYaBQe4rK+Ds4TTATISsrQaaoVd4URZSVIn39J9sPV
	zqF5bCpSX03Wb1oCU2pCHjq6oXP55BIKSQjr8dGm+SHzMLB2LEWSqFLXPOvo1Gj927H4
	7UICvBRs+Idu2p0yRKbG8kUsB1xzfeCa3NdUZKi5BhXX5ZKbuAL17oaUz2mi0wDNhoQF
	LA6Q==
X-Received: by 10.140.148.81 with SMTP id 78mr28481758qhu.17.1451663609940;
	Fri, 01 Jan 2016 07:53:29 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	2sm34777837qgi.42.2016.01.01.07.53.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jan 2016 07:53:29 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  1 Jan 2016 10:52:27 -0500
Message-Id: <1451663547-24984-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] linux-yocto: remove bbappends for 3.14 and 3.19
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
X-List-Received-Date: Fri, 01 Jan 2016 15:53:34 -0000

Kernel versions 3.14 and 3.19 were dropped from oe-core.

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-kernel/linux/linux-yocto_3.14.bbappend |   19 -------------------
 recipes-kernel/linux/linux-yocto_3.19.bbappend |   19 -------------------
 2 files changed, 38 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto_3.14.bbappend
 delete mode 100644 recipes-kernel/linux/linux-yocto_3.19.bbappend

diff --git a/recipes-kernel/linux/linux-yocto_3.14.bbappend b/recipes-kernel/linux/linux-yocto_3.14.bbappend
deleted file mode 100644
index 85e98cc..0000000
--- a/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://xt-checksum.scc \
-            file://ebtables.scc \
-	    file://vswitch.scc \
-	    file://lxc.scc \
-	    "
-KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
-
-KERNEL_MODULE_AUTOLOAD += "openvswitch"
-KERNEL_MODULE_AUTOLOAD += "kvm"
-KERNEL_MODULE_AUTOLOAD += "kvm-amd"
-KERNEL_MODULE_AUTOLOAD += "kvm-intel"
-
-# aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
-
-# xen kernel support
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
diff --git a/recipes-kernel/linux/linux-yocto_3.19.bbappend b/recipes-kernel/linux/linux-yocto_3.19.bbappend
deleted file mode 100644
index 85e98cc..0000000
--- a/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://xt-checksum.scc \
-            file://ebtables.scc \
-	    file://vswitch.scc \
-	    file://lxc.scc \
-	    "
-KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
-
-KERNEL_MODULE_AUTOLOAD += "openvswitch"
-KERNEL_MODULE_AUTOLOAD += "kvm"
-KERNEL_MODULE_AUTOLOAD += "kvm-amd"
-KERNEL_MODULE_AUTOLOAD += "kvm-intel"
-
-# aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
-
-# xen kernel support
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
-- 
1.7.10.4


