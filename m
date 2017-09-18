Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15423E00CC6; Sun, 17 Sep 2017 18:23:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.194 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6201EE00C3A
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Sep 2017 18:22:59 -0700 (PDT)
Received: by mail-pf0-f194.google.com with SMTP id q76so3930822pfq.5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Sep 2017 18:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=884xdoej6BBNofuM5SoiBbM4FTTmKUvITPVK0X9ziWs=;
	b=WYwv8WF/qJOwhxqOqysw7wwStdhnUjBpnsTWXiHq55mC5/UmQbQaKklv9QRr2C3JGK
	2hFh/wzWboCJIVb4JIPh0xDAjz/QT8sGxaI9289of+ZsY+di8Q5HNYlLjCDVKqvIkYsc
	tQQeEy49KigPv2gWDn+2iPZNKabjYB6RGXm4kYm/vk93gNPS46DnDmVcaK7JZpooYNjG
	M+XVRjbyg9j9wtqVc1Tr8cZoCxNZrQlHNhoQdxt/+RuYisLKeMkpgehQafC6nuXleRPV
	d0PI7GTzmbdiJTThk8LijRnvUfaZmgMT260+HPr4IbJvPJUf+Fz5xsoHB+kPUmXZG8Zx
	H6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=884xdoej6BBNofuM5SoiBbM4FTTmKUvITPVK0X9ziWs=;
	b=UucCjAGk4iNx2sqZenzIM4SSF5wyVlmbnulqf7uE3rbuHyH1iRxUVdlsF8j5ezF1Fv
	xSs69oxdZiAPqrZ+x+FxoqUtnNw6MvqjJSIH/NmGVPdIVBKK6ohKxRArz4hhbK1ltX4r
	gLq11wCLRFgaN7NEy1/UlM7a+QXUuT5l8CWU1I2HrvjZ3oM/a4QInZJ/deOZpcjNLku4
	2sWvmOZIUBQ+TuzOEjR5WNl3NrYGnQ0+2GOYMgi273QPJNHVf/oin7EYuYIFBKHfxm5T
	SQe0Fpra3fTMpm9RQPPXwW0HtyXnQ06vyLlaXyg19XFtxxzcSaFyRu9d9MkHFAz4k0Ux
	ummg==
X-Gm-Message-State: AHPjjUgBHnsSAqbPp2SxGIg4ROG6XKgvUju34UYYE/rS7JDorA8cTMcc
	6tP9WUrbiSlrlnoXRnY=
X-Google-Smtp-Source: ADKCNb5kwpa6AdJo1nRzmSlNQHhUPcT/E5JyUXB1Y4kd87ny2QRzJxQ4rg1dzJjZyWU3rivHLa1MLg==
X-Received: by 10.99.121.135 with SMTP id u129mr30422494pgc.250.1505697778698; 
	Sun, 17 Sep 2017 18:22:58 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	l30sm11551914pgc.78.2017.09.17.18.22.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Sep 2017 18:22:58 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Sun, 17 Sep 2017 18:22:53 -0700
Message-Id: <1505697773-20845-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org, nathan.studer@dornerworks.com
Subject: [PATCH] xen-image-minimal: Make kernel-module-xen-pciback a x86-only dependency
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
X-List-Received-Date: Mon, 18 Sep 2017 01:23:09 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

This commit fixes the xen-image-minimal build for non-x86 arch with PCI enabled.

The Linux kernel option CONFIG_XEN_PCIDEV_BACKEND currently depends on X86.
This means that the xen-pciback kernel module cannot be included in this image
for non-x86 architecture builds, so don't attempt to install it in that case.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---

Please use my gmail address for any correspondence.

 recipes-extended/images/xen-image-minimal.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index 94240f6..a01976e 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -10,12 +10,17 @@ IMAGE_INSTALL += " \
     kernel-module-xen-gntalloc \
     kernel-module-xen-gntdev \
     kernel-module-xen-netback \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'kernel-module-xen-pciback', '', d)} \
     kernel-module-xen-wdt \
     xen-base \
     qemu \
     "
 
+# Linux kernel option CONFIG_XEN_PCIDEV_BACKEND depends on X86
+IMAGE_INSTALL_x86 += " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'kernel-module-xen-pciback', '', d)}"
+IMAGE_INSTALL_x86-64 += " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'kernel-module-xen-pciback', '', d)}"
+
 LICENSE = "MIT"
 
 inherit core-image
-- 
2.7.4


