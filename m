Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E82E0E0127A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:48 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4182735eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=gkDBQP7tsek/d2ZqRzaQa2uOwbfDNId43oY03i/Z1nI=;
	b=v6R0QGabl4ob1DqKoBHCy5zrVM37eKlDEDjZ0nAowg7JmgmanOLRNEbZ1pfAo+zNSz
	Gx+xXEQygfCRKhV4yqMymYiWLpB2/BFGkIwuygABchWXmDTIYOMc5G8yIaEKvQZh9fP5
	BpoXq6ucjorSkxkmClmPgyi+7bfH/i6ZUwnknILHizxeAX8Ltcso46MRktKw0aZVbtEf
	3WTR9kZ7VbByPD7iLK0KCYjIza8sp0mmGfnY0F2A5wfg3f3sV4wfDqqgMsVItuHCRC6e
	FEEkVo3oRWsg1mH3fPROseq/mmWO3Jueeo9vyFTvZDETaAFLz3XN4Q/uoiCxWKzVaWy1
	BeoQ==
Received: by 10.14.198.67 with SMTP id u43mr7770492een.7.1354813608643;
	Thu, 06 Dec 2012 09:06:48 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id e2sm16978808eeo.8.2012.12.06.09.06.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:47 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 47B934010E1; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:31 +0100
Message-Id: <1354813596-8233-11-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv4 10/15] Added template cloud-* images
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
X-List-Received-Date: Thu, 06 Dec 2012 17:06:49 -0000
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


