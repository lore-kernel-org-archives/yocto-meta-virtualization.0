Return-Path: <cjp256@gmail.com>
Received: from mail-qe0-f43.google.com (mail-qe0-f43.google.com
	[209.85.128.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 634D2E0161B
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Oct 2013 19:23:27 -0700 (PDT)
Received: by mail-qe0-f43.google.com with SMTP id nc12so1395883qeb.30
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 Oct 2013 19:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qLbKYJrpQyxiE1KMGJacYH+ZxXQarcqcuJyGGe0gRHo=;
	b=RA9791JAew9tmIFl+H5dK90hu/JPsx7uioHrlKEdHCdbphouXL/waYOPDonj0UmEI5
	jy4/uBLPTiWWHbJ4WmNvU43ROxorvn8TaIi97wVpVHdM8MbQXbZL4uTJZyF0sW1kKM2J
	lrSeyOdC7j+jS/mlxXrzEQmM0mzeQwBpCdi1NlspKeY4zREwTcz8KZkMcNHnfFho99AJ
	1ByhjpaNzG2gFQ7Rhuukg1ipVQwU5ydLfDQicrxAYk6hPB7bq5T/iTcF7AaoqUejPhG9
	n2xbu2IG/kIhDF5BaNpXNjDh5NsbgClh9u7KpYLW0k3YvHGjaAJyIPz/D2XJt1/ns60p
	eeZw==
X-Received: by 10.229.191.7 with SMTP id dk7mr15650491qcb.4.1381371807357;
	Wed, 09 Oct 2013 19:23:27 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id h6sm82159945qej.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 19:23:26 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  9 Oct 2013 22:22:51 -0400
Message-Id: <1381371771-12021-4-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381371771-12021-1-git-send-email-cjp256@gmail.com>
References: <1381371771-12021-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 3/3] xen-guest-image-minimal: add minimal xen guest image.
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
X-List-Received-Date: Thu, 10 Oct 2013 02:23:28 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/images/xen-guest-image-minimal.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-extended/images/xen-guest-image-minimal.bb

diff --git a/recipes-extended/images/xen-guest-image-minimal.bb b/recipes-extended/images/xen-guest-image-minimal.bb
new file mode 100644
index 0000000..bcac4d7
--- /dev/null
+++ b/recipes-extended/images/xen-guest-image-minimal.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "A Xen guest image."
+
+inherit core-image
+
+IMAGE_INSTALL += " \
+    packagegroup-core-boot \
+    kernel-module-xen-acpi-processor \
+    "
+
+IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', ' xf86-video-fbdev', '', d)}"
+IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', ' xf86-video-vesa', '', d)}"
+
+LICENSE = "MIT"
+
+# Send console messages to xen console
+APPEND += "console=hvc0"
-- 
1.8.4.rc3


