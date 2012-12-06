Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3A82E0144E
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:03:57 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4044011eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=gkDBQP7tsek/d2ZqRzaQa2uOwbfDNId43oY03i/Z1nI=;
	b=aLLJVl3pGtsotA1P7pCj4lv5ljCZJeudQWtKZzyXDkKPxexMN7kCXKC8rb92F6z232
	ZKaUx19MUVF3CwbSgHmSJRwfaMTOQ9mpbZh/5VxzGmF6Q53jE6mjU7Gl9ZGRWgXSsmqZ
	0igso0OJe2O/eiyQ4e97O7WlzDY+l1pplvVTlyF77QH2HZ/qkrnVNMYyNE+KG2gNQKN1
	SCbc32tKB+G8ilOs/8ly1qTUeO4oJDR2gZL/ISGGbYMZ5bFY0kJZCbte5Ee5OPK4YgRM
	eSBskR8+dHchD45gUoxvyNP1wQswOlaC58EBwiIgD4BdyHOffvKtsp2QZhltJpvbptG0
	J+yg==
Received: by 10.14.223.200 with SMTP id v48mr6058581eep.24.1354802637704;
	Thu, 06 Dec 2012 06:03:57 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id w3sm16072190eel.17.2012.12.06.06.03.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 06:03:56 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id B99D64010E1; Thu,  6 Dec 2012 15:03:48 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 15:03:18 +0100
Message-Id: <1354802601-10840-12-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv3 11/14] Added template cloud-* images
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
X-List-Received-Date: Thu, 06 Dec 2012 14:03:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

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


