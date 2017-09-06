Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C385AE00D83; Wed,  6 Sep 2017 16:09:16 -0700 (PDT)
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
	*      [74.125.83.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.67 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD114E00BB7
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Sep 2017 16:09:15 -0700 (PDT)
Received: by mail-pg0-f67.google.com with SMTP id q68so4130008pgq.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 06 Sep 2017 16:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OlcspPxkdEkp82WmwRARV7fBZcAMtzYajIcazE5m2fE=;
	b=ITD6LoMkpfic/UVRNIsEZTEBaXY1YeQMW7RlhHLl6N/3SeZivRLm2LzNmp6IRxVVFm
	OIQT5bFmCHLTq01a2mDI3qFs4HKyIK1xILqTN3jmVLIyyB+HmHy9m/h5+tf8XnRJuuvP
	HEVG+Ysq1gkOZYPVW/+8huQsucuBS6RTaNRoTwUV04SKRkfKoEe9bk6n3egDEyR+O4g+
	ryaguWI5qN0MMU7GsGIHraVO102spSZHVfOtrtRt2n6iR1E9lZ9CvEpVfICPYfISvBkC
	rkEDCF2gXLYmj4gqPwh0I/NtszKwl8eMSn7oCsc4/uHbWApVp7XygxgB07uCf+QDzXfa
	ve3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OlcspPxkdEkp82WmwRARV7fBZcAMtzYajIcazE5m2fE=;
	b=rkWuzppo98YGKbRuRhMKZcI8lI74vvAjyay9VzDhKAh1F/1cr0LshwaHoaalZzA978
	Iv9Q4OmEzuJRaoYf0t2IMKBBJAr7+BHgTEUbm+hPDnkV0DpR5TV8zjK2JNYqGu2KcGNz
	IDHpJrLoLq0US35JfhAQRq3bisXLQ2+w6ZblEjd3Na/sq86yhD8L4QvSoT0guCsHtS4n
	ChqTRPWXrXQoHZTIhtKVwU3MZePd6ovc8cya/GqH2ZrFWiQE88NKOgPPuBWtBkBT3w7z
	9u9kfCcIdY9Bmgly9QLm4gbyNLHlMZIS60pFMYoCob8YJv50umFjAumA4x7OKHvDpbEX
	VfKw==
X-Gm-Message-State: AHPjjUh9oO8WubjcQA0ARD/+ovTHTMPK5mIIc3d03Z/MTDOsnXrZrv3q
	Y5N0nP4TVuKtbMh4kQE=
X-Google-Smtp-Source: ADKCNb4oQjNyPUT84rMPPjPspJVeufTr6+OJSebRcXh8aWV/cw8A5TxRqkYrO2I+wuZIYUz4wXkB6g==
X-Received: by 10.101.82.8 with SMTP id o8mr712331pgp.261.1504739354880;
	Wed, 06 Sep 2017 16:09:14 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	i186sm1030487pfg.84.2017.09.06.16.09.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Sep 2017 16:09:14 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed,  6 Sep 2017 16:09:01 -0700
Message-Id: <1504739341-28234-2-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504739341-28234-1-git-send-email-christopher.w.clark@gmail.com>
References: <1504739341-28234-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org, nathan.studer@dornerworks.com
Subject: RFC: [PATCH] xen-guest-image-minimal: Fix non-x86.
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
X-List-Received-Date: Wed, 06 Sep 2017 23:09:16 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Fix xen-guest-image-minimal image for non-x86, both with and
without x11 included.

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

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/images/xen-guest-image-minimal.bb    | 16 +++++++++++++---
 recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend | 14 ++++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)
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
index 0000000..ff4b5b6
--- /dev/null
+++ b/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
@@ -0,0 +1,14 @@
+# Modify the default Xserver build for Xen images on non-x86:
+# deselect glamor to remove the dependency on libegl,
+# which simplifies domU builds.
+# To override this (eg. if wanted for dom0 images) define:
+#   REMOVED_OPENGL_PKGCONFIGS = ""
+
+DETECT_X86_ARCH        = "0"
+DETECT_X86_ARCH_x86-64 = "1"
+DETECT_X86_ARCH_x86    = "1"
+
+REMOVED_OPENGL_PKGCONFIGS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'xen', \
+                                 bb.utils.contains('DETECT_X86_ARCH', '1', '', 'glamor', d), '', d)}"
+
+OPENGL_PKGCONFIGS_remove = "${REMOVED_OPENGL_PKGCONFIGS}"
-- 
2.7.4


