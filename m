Return-Path: <cjp256@gmail.com>
Received: from mail-qe0-f47.google.com (mail-qe0-f47.google.com
	[209.85.128.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 576ACE013FC
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2013 18:03:11 -0700 (PDT)
Received: by mail-qe0-f47.google.com with SMTP id b4so4872841qen.20
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2013 18:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5uV1WLV810xxo8XL68x+7ETtzPdU/FCIMNs/szf4c8I=;
	b=N3YD02FID9hDAXfqCDBvTrzJxntfoPFDg36FD/uuDFVMSPfTB+JJ7KAipMGQv5VoUd
	OpMXD2E8gkZ8pC/CkMVIG5IjLQIsPbvPpKgbjZlYf2dA4nuMjDaT/NTG8cwYMpI/ILJG
	VrFMTft0xNAJKKS3w4uxJL/3WAjmkpr7aPLDQu7evafWDAPDYr2ZNOnWrJ5IhnRBGq8S
	OOYB8ajwZc39z7CJ1hUTn6nqLLuOOFiFSDdRn3WERLAEdJIzxhv3qrQjPutVj5VxAzC1
	pkeqv1Qr6vGOAwg5/294Ooh6D39/E84pX7oK5EESO5DLQZCrBMCBhkbG5w/oiz1H5+87
	adGA==
X-Received: by 10.229.79.70 with SMTP id o6mr26279478qck.21.1378861391059;
	Tue, 10 Sep 2013 18:03:11 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id f14sm34325809qej.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Sep 2013 18:03:09 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 10 Sep 2013 21:02:39 -0400
Message-Id: <1378861361-7980-3-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1378861361-7980-1-git-send-email-cjp256@gmail.com>
References: <1378861361-7980-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 2/4] linux-yocto: add optional support for aufs and xen using DISTRO_FEATURES.
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
X-List-Received-Date: Wed, 11 Sep 2013 01:03:12 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-kernel/linux/linux-yocto_3.10.bbappend | 6 ++++++
 recipes-kernel/linux/linux-yocto_3.4.bbappend  | 3 +++
 recipes-kernel/linux/linux-yocto_3.8.bbappend  | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
index 2893a01..cc7fd98 100644
--- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
@@ -11,3 +11,9 @@ KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
 module_autoload_kvm = "kvm"
 module_autoload_kvm-amd = "kvm-amd"
 module_autoload_kvm-intel = "kvm-intel"
+
+# aufs kernel support required for xen-image-minimal
+KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
+
+# xen dom0 kernel support
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
index 2893a01..448d57f 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -11,3 +11,6 @@ KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
 module_autoload_kvm = "kvm"
 module_autoload_kvm-amd = "kvm-amd"
 module_autoload_kvm-intel = "kvm-intel"
+
+# xen dom0 kernel support
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
index 2893a01..cc7fd98 100644
--- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
@@ -11,3 +11,9 @@ KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
 module_autoload_kvm = "kvm"
 module_autoload_kvm-amd = "kvm-amd"
 module_autoload_kvm-intel = "kvm-intel"
+
+# aufs kernel support required for xen-image-minimal
+KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
+
+# xen dom0 kernel support
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
-- 
1.8.4.rc3


