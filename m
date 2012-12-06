Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10BA6E01465
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:45:15 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4029680eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=gkDBQP7tsek/d2ZqRzaQa2uOwbfDNId43oY03i/Z1nI=;
	b=VuvPDm1+4zag0/sa7KncPY7D96PMUFZ0Xi2RXWd9mNseC+64ZbHRpa7ZNk44NLOhWu
	uwlV9C5GX0ZgZhei7REYHw9Jj4FZY7msUkm8T4+y2qCk9iee2c7ie2EKmO4c2QC2DsLz
	QebKX/R9JAHJRDTU/aW8jDbGCQUNiWsz4TIygRrkVbuHhjcNVPPHrj319Mk9lLLe/S5E
	L6/Jp040ZDsS897m7xKkYjJUyNt8NVzVTVxBGr50yxj6Iu0yew5qb+YeuYq/KvQBciW9
	ue9AODoHJuuAqVDIs/vVRpCfykoG6kO99L0PoZhiYghCmQ6SoMvgCjmjUOA9kMNJmgzu
	osZw==
Received: by 10.14.184.134 with SMTP id s6mr5711884eem.43.1354801515751;
	Thu, 06 Dec 2012 05:45:15 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id b49sm15982559eem.16.2012.12.06.05.45.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:45:13 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id E2C6F4010E1; Thu,  6 Dec 2012 14:45:06 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:44:43 +0100
Message-Id: <1354801486-9482-12-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
References: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 06 Dec 2012 13:45:16 -0000
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


