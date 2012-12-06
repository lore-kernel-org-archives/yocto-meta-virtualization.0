Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2A6CE01467
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:13:55 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4008281eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Gz8+/4IGYstJH09tDgwu1PRmWJUrdSNbmN6UVrSReVM=;
	b=WAAqfbqYuDXXzINttSg+pyiNNNH40if8TO34KiJwYUsn+ksERNWEMNvxjyPSLcN7la
	ZFaMXAPrhYpxfST5plu6Por+9mWmOYyAzidm2SSugLpfaINnxyIfrJ7s2PIVFRHWlRes
	iozxzK6pKJYjGHLpwX0jCkz2oafK+Vn+7TmhnzOI+k+AA0TgyfWAAmZea+kNgkuw/xsT
	HPBwqbRYUGpLb/7HFRvSi7fkG10Z37/2DCW35UsgVRG40Asn37aWoUOYAg3zTZSE4up8
	97VCNhcLxTB+gCuyw38SN1Ks39Oik/eCBbZS5msQ9OPK6QkY+9Wx4+KEjl5UlF+DtTO8
	msvg==
Received: by 10.14.194.199 with SMTP id m47mr5785400een.11.1354799635374;
	Thu, 06 Dec 2012 05:13:55 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 46sm15867540eeg.4.2012.12.06.05.13.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:13:53 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 6F8564010E1; Thu,  6 Dec 2012 14:13:49 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:13:42 +0100
Message-Id: <1354799626-6911-12-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
References: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
Subject: [PATCH 11/14] Added template cloud-* images
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
X-List-Received-Date: Thu, 06 Dec 2012 13:13:56 -0000

---
 recipes-extended/images/cloud-image-compute.bb    |   14 +++++++++
 recipes-extended/images/cloud-image-controller.bb |   34 +++++++++++++++++++++
 recipes-extended/images/cloud-image-guest.bb      |   18 +++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 recipes-extended/images/cloud-image-compute.bb
 create mode 100644 recipes-extended/images/cloud-image-controller.bb
 create mode 100644 recipes-extended/images/cloud-image-guest.bb

diff --git a/recipes-extended/images/cloud-image-compute.bb b/recipes-extended/images/cloud-image-compute.bb
new file mode 100644
index 0000000..197624f
--- /dev/null
+++ b/recipes-extended/images/cloud-image-compute.bb
@@ -0,0 +1,14 @@
+IMAGE_FEATURES += "ssh-server-openssh"
+EXTRA_IMAGE_FEATURES = "tools-debug debug-tweaks"
+
+IMAGE_INSTALL = "\
+    ${CORE_IMAGE_BASE_INSTALL} \
+    packagegroup-core-basic \
+    openvswitch \
+    libvirt \
+    openflow \
+    "
+
+inherit core-image
+
+IMAGE_FSTYPES = "tar.gz"
diff --git a/recipes-extended/images/cloud-image-controller.bb b/recipes-extended/images/cloud-image-controller.bb
new file mode 100644
index 0000000..74f724b
--- /dev/null
+++ b/recipes-extended/images/cloud-image-controller.bb
@@ -0,0 +1,34 @@
+IMAGE_FEATURES += "ssh-server-openssh package-management"
+EXTRA_IMAGE_FEATURES = "tools-debug debug-tweaks"
+
+IMAGE_INSTALL = "\
+    ${CORE_IMAGE_BASE_INSTALL} \
+    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
+    packagegroup-core-basic \
+    openvswitch \
+    openvswitch-controller \
+    openvswitch-switch \
+    openvswitch-brcompat \
+    criu \
+    libvirt \
+    libvirt-libvirtd \
+    libvirt-python \
+    libvirt-virsh \    
+    openflow \
+    qemu \   
+    kernel-modules \
+    dhcp-client \
+    perl-modules \
+    grub \
+    mysql5 \
+    python-twisted \ 
+    python-lxml \
+    "
+
+inherit core-image
+inherit image-vmdk
+
+IMAGE_FSTYPES = "vmdk tar.gz"
+
+# Ensure extra space for guest images
+#IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
diff --git a/recipes-extended/images/cloud-image-guest.bb b/recipes-extended/images/cloud-image-guest.bb
new file mode 100644
index 0000000..818a513
--- /dev/null
+++ b/recipes-extended/images/cloud-image-guest.bb
@@ -0,0 +1,18 @@
+IMAGE_FEATURES += "ssh-server-openssh package-management"
+EXTRA_IMAGE_FEATURES = "tools-debug debug-tweaks"
+
+IMAGE_INSTALL = "\
+    ${CORE_IMAGE_BASE_INSTALL} \
+    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
+    packagegroup-core-basic \
+    openflow \
+    qemu \   
+    kernel-modules \
+    tcpdump \
+    dhcp-client \
+    "
+
+inherit core-image
+inherit image-vmdk
+
+IMAGE_FSTYPES += "vmdk"
-- 
1.7.9.5


