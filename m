Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 86872E00C89; Sun, 17 Sep 2017 18:21:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 029E4E00C8A
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Sep 2017 18:21:45 -0700 (PDT)
Received: by mail-pf0-f194.google.com with SMTP id f84so3934855pfj.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Sep 2017 18:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uBjBxIJ98w3DksNs3WJtHKhuH2HJZT2BpTGqrUCx+sI=;
	b=hEo7TD/DuDvBppwXaopYDRyVgsNvogDthkEdWq45qcYpl+f7BK1Z4dkEpFOqq+Aha/
	1gWjhD2gcYOs+nsbEN3zXzEl2zJn/c5djhbPa7X7gk76uucCYZmYpX7Xm0wtfDnKfJua
	+hz2pnhHLnlt6EUIs1XBg4usKtYm5aky2XuBnpJ5wgc4g/DYkUiHVchvBkvhYVD4KQYR
	U9daRo6WmVp0/4DntFdybcOjqV9aawDddly5dAs06iEGbjz3WNWaH6BGKmN6WQxxO0ZU
	go+bMIPDyn4dkxVHvffOklJOhuOJDSdxcndue5OM9S46P5TWomxiqRbXx7J/gWxNoIt7
	+Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uBjBxIJ98w3DksNs3WJtHKhuH2HJZT2BpTGqrUCx+sI=;
	b=ZdoXDTQ1NL7IvZ3SmiHxuDF5KxFxrz5MQfjheoLST59/Rg856L06Ag5+zJJnMvxvIo
	CUibH9/SDJjv1CAz1jqmRqa/+ILour4nHhd/oTbY1G/lGFbnshYt3mzI8Y2wI6DwN3AK
	p4Q8ccDHqyB6SXq1T/XpPt6a9dNr8R5lmgQDmHtm9iDkQpZnBR7MFNmyta8cZQl1oTnu
	zvBx9G/ZuDZqxPY28dHu/mVJXrWHsVO7KH+pp7So+AKqHWwewplqLOgODwGjsPUQgOKF
	vfww3SIhN0kH6idovMK+be8UpADTfXPL824yJlHJnuWU8kxVVj9Ik/95nXZ0V6wn8gLE
	extQ==
X-Gm-Message-State: AHPjjUjohifWy+hhgCcM3/L9WxeNr+lJN0sEsOEt6dzJ9KJ/fL1c2WPB
	Qhg/pN7C0/s2TSiHN0g=
X-Google-Smtp-Source: ADKCNb7fxqbPKnUrVB/C8eV32YFeLbJxSczOzQrxarmZ5qt+++XC8JthDUlw3Izo2bKvYTjKZPE8Zw==
X-Received: by 10.84.232.76 with SMTP id f12mr33797462pln.297.1505697704952;
	Sun, 17 Sep 2017 18:21:44 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	y83sm11883273pff.167.2017.09.17.18.21.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Sep 2017 18:21:44 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Sun, 17 Sep 2017 18:21:38 -0700
Message-Id: <1505697698-15124-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org, nathan.studer@dornerworks.com
Subject: [PATCH] xen-guest-image-minimal: Fix non-x86. Select x11 via IMAGE_FEATURES.
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
X-List-Received-Date: Mon, 18 Sep 2017 01:21:52 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Fix the image for non-x86, both with and without x11 included.

* Only install xf86-video-vesa on x86 platforms as it is not
  available elsewhere.

* In the absence of xf86-video-vesa (ie. on non-x86 platforms)
  enable opengl and remove wayland from IMAGE_INSTALL to
  satisfy build requirements for x11.

* Use IMAGE_FEATURES instead of DISTRO_FEATURES to enable x11
  inclusion in the image.

* Verify the required DISTRO_FEATURE of 'xen' and if enabled, 'x11'.

* When building the Xserver with Xen in DISTRO_FEATURES, on non-x86,
  turn off glamor by default, to remove dependency on egl.
  Introduces: xserver-xorg_%.bbappend

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---

Changes in this non-RFC patch version: simplified the xorg-xserver bbappend.

Please use my gmail address for any correspondence.

 recipes-extended/images/xen-guest-image-minimal.bb    | 16 +++++++++++++---
 recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend | 13 +++++++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend

diff --git a/recipes-extended/images/xen-guest-image-minimal.bb b/recipes-extended/images/xen-guest-image-minimal.bb
index ab7e92c..bca6017 100644
--- a/recipes-extended/images/xen-guest-image-minimal.bb
+++ b/recipes-extended/images/xen-guest-image-minimal.bb
@@ -1,14 +1,24 @@
 DESCRIPTION = "A Xen guest image."
 
-inherit core-image
+inherit core-image distro_features_check
 
 IMAGE_INSTALL += " \
     packagegroup-core-boot \
     ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
     "
 
-IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' xf86-video-fbdev', '', d)}"
-IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' xf86-video-vesa', '', d)}"
+IMAGE_INSTALL += "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' xf86-video-fbdev', '', d)}"
+
+# Install xf86-video-vesa on x86 platforms.
+IMAGE_INSTALL_append_x86-64 = "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' xf86-video-vesa', '', d)}"
+IMAGE_INSTALL_append_x86    = "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' xf86-video-vesa', '', d)}"
+
+# When xf86-video-vesa is not present, add opengl and don't require wayland:
+DISTRO_FEATURES_append = "${@bb.utils.contains('IMAGE_FEATURES', 'x11', \
+                             bb.utils.contains('IMAGE_INSTALL', 'xf86-video-vesa', '', ' opengl', d), '', d)}"
+DISTRO_FEATURES_remove = "${@bb.utils.contains('IMAGE_INSTALL', 'xf86-video-vesa', '', 'wayland', d)}"
+
+REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' x11', '', d)} xen"
 
 LICENSE = "MIT"
 
diff --git a/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend b/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
new file mode 100644
index 0000000..9503404
--- /dev/null
+++ b/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
@@ -0,0 +1,13 @@
+# Change the default Xserver OpenGL configuration for non-x86 distros with Xen: deselect 'glamor'.
+# This removes the dependency on libegl to simplify the domU build.
+#
+# To override this (eg. if wanted for dom0 images) define:
+#   REMOVED_OPENGL_PKGCONFIGS = ""
+
+XEN_REMOVED_OPENGL_PKGCONFIGS ?= "glamor"
+XEN_REMOVED_OPENGL_PKGCONFIGS_x86 = ""
+XEN_REMOVED_OPENGL_PKGCONFIGS_x86-64 = ""
+
+REMOVED_OPENGL_PKGCONFIGS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'xen', "${XEN_REMOVED_OPENGL_PKGCONFIGS}", '', d)}"
+
+OPENGL_PKGCONFIGS_remove = "${REMOVED_OPENGL_PKGCONFIGS}"
-- 
2.7.4


