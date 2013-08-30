Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D64F1E00747
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 20:37:35 -0700 (PDT)
Received: by mail-ie0-f179.google.com with SMTP id m16so2078795ieq.10
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 20:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6dcj4AnmggLVSn4GvCK5oQNR/6J6uOgTexMRxaASQS0=;
	b=IzyQ61iQD+/q1RkBKxmcqnfn5eIyR9pZbVloXQzMcUlA/rBkbL4O7fN+f3vNcI7um7
	15Xd+e8LiSGkXX8zpYvahsw97CveoASaVx8fqAqAV05m7f2CdBSE5I6fSqFWAP5mBIHT
	PGjDLUb2sMUDMYqFYVFXcBxqHwlRRBLwnab1n/84w+MhH6PWtek7ukKv0U5j45choN54
	dmq5g9YLZINJKBMvw7UBfs2alFTnrmWExqKC63r6NMsoEXAaqCVn44us34SFk5xbrSbJ
	Zcayo3HdfGG/+H9gJo1uf3B4MzX6kCa+5q2XnzUArj7j27e53FO5YYlXe/Ybtc/j+b7d
	4Brw==
X-Received: by 10.50.70.42 with SMTP id j10mr665572igu.44.1377833855312;
	Thu, 29 Aug 2013 20:37:35 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id p5sm1744506igj.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 20:37:34 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 29 Aug 2013 23:37:22 -0400
Message-Id: <1377833844-14672-3-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH 2/4] linux-yocto: add optional support for aufs and xen using DISTRO_FEATURES.
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
X-List-Received-Date: Fri, 30 Aug 2013 03:37:38 -0000

---
 recipes-kernel/linux/linux-yocto_3.4.bbappend |    6 ++++++
 recipes-kernel/linux/linux-yocto_3.8.bbappend |    6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
index 2893a01..2ada931 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -11,3 +11,9 @@ KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
 module_autoload_kvm = "kvm"
 module_autoload_kvm-amd = "kvm-amd"
 module_autoload_kvm-intel = "kvm-intel"
+
+# aufs kernel support required for core-image-xen
+KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
+
+# xen dom0 kernel support
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
index 2893a01..2ada931 100644
--- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
@@ -11,3 +11,9 @@ KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
 module_autoload_kvm = "kvm"
 module_autoload_kvm-amd = "kvm-amd"
 module_autoload_kvm-intel = "kvm-intel"
+
+# aufs kernel support required for core-image-xen
+KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
+
+# xen dom0 kernel support
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
-- 
1.7.10.4


