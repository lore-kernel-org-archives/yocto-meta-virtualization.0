Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.17788.1581311305911112225
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UBQLi9Un;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BEB2CE016BB; Sun,  9 Feb 2020 21:08:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.210.179 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3F39E016B9
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:24 -0800 (PST)
Received: by mail-pf1-f179.google.com with SMTP id q8so3101511pfh.7
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0R7FGZ5LHu6mkBrXs6OYcK5B8e7BvTHTg3KO+esgT+0=;
        b=UBQLi9UnPl8QZsHt1doi5mqmvmEOR0pwIzPMDyeMlotSD1PdAc8iSj+SG5O/kBnd6A
         C4WOVnOeugKzaTQO1SwqCkJAvWfaKLmEe8Irq0M1IiEayUgfgukF2drGlz28LgzZNk5Q
         bmNEFk0Q3tK+ZqKoiLP2ksVrqgrqvzG4p3hrX+oTmDicM8vZYqPXPtIKrBdTXA/OUlJH
         1AlclIf99hbEUpUtmuZ4j/QhJy9mFXWpQe9hAMxlwsE9cN1/aBRokSw2A+8XU8TweZar
         f5XDa0iDx2rJxhNzS/i+BFWeIiiKLxpVL+cdxN/ezdOoXAEjxfHMQBtpY+ck3zpwayze
         B9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0R7FGZ5LHu6mkBrXs6OYcK5B8e7BvTHTg3KO+esgT+0=;
        b=LwCq7WUG9gxzdd49dw9a5KKcH2/OptMWiBWP1U/F4xv+5ZHxsGRhdFv2LB0dFvhivW
         CWX3xAlelTs7xXmykdFBNFpNawqSheeuyEpOoKP/gCjqzqUwjeZxq43PQd7yTzNq7AdU
         IdjxWv5V9p2tUUAraO4GuuCdWR5lHBNBFSxlLTllhhv4kYmhZR8FZfTPZXsDkExYY2wJ
         DZ2PziJWtBpJ23kPgWu+qmOlrOtVlQlJ7vItn3OtTnhBUgYHoB+8vRTS6eQWuFmclFpB
         ICnZOUlDa3dt98ZYouVyl+ySfRl5M4XrJPOaBONVJBFjAuRbxQTesw1ia6ZHZoiESsjF
         dIzA==
X-Gm-Message-State: APjAAAVT2xPzP/l/SPI/BLmjlhf5ipeSI0cTwSV4VSURjPdM/jjIgJcm
	6anAbAnORH7pD4CEbaz9hMe/Gwar
X-Google-Smtp-Source: APXvYqzma2z59ORYJgQ3GtuzX1UoXSlJtuk9AP1kvJoH4T8HaQ4ovwGdxLU3+F9X7lquuZMYaKAuQA==
X-Received: by 2002:a63:9141:: with SMTP id l62mr12612946pge.216.1581311303788;
        Sun, 09 Feb 2020 21:08:23 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:22 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 06/16] xen: retire Qemu packaging from the Xen recipe
Date: Sun,  9 Feb 2020 21:07:44 -0800
Message-Id: <20200210050754.3534-10-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Modern Qemu supports Xen and the qemu binary to be used with Xen should
be built with the Qemu recipe.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 87 ------------------------------------
 1 file changed, 87 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 146e02b..fa0044b 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -217,7 +217,6 @@ PACKAGES = "\
     ${PN}-misc \
     ${PN}-pygrub \
     ${PN}-python \
-    ${PN}-qemu \
     ${PN}-remus \
     ${PN}-scripts-block \
     ${PN}-scripts-common \
@@ -546,92 +545,6 @@ FILES_${PN}-python = "\
     "
 
 INSANE_SKIP_${PN} = "already-stripped"
-INSANE_SKIP_${PN}-qemu = "arch"
-FILES_${PN}-qemu = " \
-    ${datadir}/xen/qemu \
-    ${libdir}/xen/bin/qemu-system-i386 \
-    ${libdir}/xen/bin/qemu-system-x86_64 \
-    ${libdir}/xen/bin/qemu-img \
-    ${libdir}/xen/bin/qemu-nbd \
-    ${libdir}/xen/bin/qemu-ga \
-    ${libdir}/xen/bin/qemu-io \
-    ${libdir}/xen/bin/qemu-dm \
-    ${libdir}/xen/bin/virtfs-proxy-helper \
-    /usr/libexec/qemu-bridge-helper \
-    ${libdir}/xen/libexec/qemu-bridge-helper \
-    /usr/etc/qemu \
-    /usr/etc/qemu/target-x86_64.conf \
-    ${libdir}/xen/etc/qemu/target-x86_64.conf \
-    ${datadir}/qemu-xen \
-    ${datadir}/qemu-xen/qemu \
-    ${datadir}/qemu-xen/qemu/bamboo.dtb \
-    ${datadir}/qemu-xen/qemu/pxe-pcnet.rom \
-    ${datadir}/qemu-xen/qemu/vgabios-vmware.bin \
-    ${datadir}/qemu-xen/qemu/pxe-eepro100.rom \
-    ${datadir}/qemu-xen/qemu/pxe-e1000.rom \
-    ${datadir}/qemu-xen/qemu/openbios-ppc \
-    ${datadir}/qemu-xen/qemu/multiboot.bin \
-    ${datadir}/qemu-xen/qemu/vgabios-cirrus.bin \
-    ${datadir}/qemu-xen/qemu/bios.bin \
-    ${datadir}/qemu-xen/qemu/vgabios-stdvga.bin \
-    ${datadir}/qemu-xen/qemu/palcode-clipper \
-    ${datadir}/qemu-xen/qemu/pxe-ne2k_pci.rom \
-    ${datadir}/qemu-xen/qemu/spapr-rtas.bin \
-    ${datadir}/qemu-xen/qemu/slof.bin \
-    ${datadir}/qemu-xen/qemu/vgabios-qxl.bin \
-    ${datadir}/qemu-xen/qemu/pxe-rtl8139.rom \
-    ${datadir}/qemu-xen/qemu/openbios-sparc64 \
-    ${datadir}/qemu-xen/qemu/pxe-virtio.rom \
-    ${datadir}/qemu-xen/qemu/kvmvapic.bin \
-    ${datadir}/qemu-xen/qemu/openbios-sparc32 \
-    ${datadir}/qemu-xen/qemu/petalogix-s3adsp1800.dtb \
-    ${datadir}/qemu-xen/qemu/sgabios.bin \
-    ${datadir}/qemu-xen/qemu/linuxboot.bin \
-    ${datadir}/qemu-xen/qemu/qemu-icon.bmp \
-    ${datadir}/qemu-xen/qemu/ppc_rom.bin \
-    ${datadir}/qemu-xen/qemu/vgabios.bin \
-    ${datadir}/qemu-xen/qemu/s390-zipl.rom \
-    ${datadir}/qemu-xen/qemu/petalogix-ml605.dtb \
-    ${datadir}/qemu-xen/qemu/keymaps \
-    ${datadir}/qemu-xen/qemu/keymaps/common \
-    ${datadir}/qemu-xen/qemu/keymaps/th \
-    ${datadir}/qemu-xen/qemu/keymaps/is \
-    ${datadir}/qemu-xen/qemu/keymaps/en-gb \
-    ${datadir}/qemu-xen/qemu/keymaps/ar \
-    ${datadir}/qemu-xen/qemu/keymaps/fr-be \
-    ${datadir}/qemu-xen/qemu/keymaps/ru \
-    ${datadir}/qemu-xen/qemu/keymaps/hu \
-    ${datadir}/qemu-xen/qemu/keymaps/de-ch \
-    ${datadir}/qemu-xen/qemu/keymaps/no \
-    ${datadir}/qemu-xen/qemu/keymaps/fr \
-    ${datadir}/qemu-xen/qemu/keymaps/pl \
-    ${datadir}/qemu-xen/qemu/keymaps/fr-ca \
-    ${datadir}/qemu-xen/qemu/keymaps/de \
-    ${datadir}/qemu-xen/qemu/keymaps/fr-ch \
-    ${datadir}/qemu-xen/qemu/keymaps/bepo \
-    ${datadir}/qemu-xen/qemu/keymaps/lv \
-    ${datadir}/qemu-xen/qemu/keymaps/ja \
-    ${datadir}/qemu-xen/qemu/keymaps/da \
-    ${datadir}/qemu-xen/qemu/keymaps/lt \
-    ${datadir}/qemu-xen/qemu/keymaps/hr \
-    ${datadir}/qemu-xen/qemu/keymaps/es \
-    ${datadir}/qemu-xen/qemu/keymaps/modifiers \
-    ${datadir}/qemu-xen/qemu/keymaps/sl \
-    ${datadir}/qemu-xen/qemu/keymaps/it \
-    ${datadir}/qemu-xen/qemu/keymaps/nl \
-    ${datadir}/qemu-xen/qemu/keymaps/fo \
-    ${datadir}/qemu-xen/qemu/keymaps/mk \
-    ${datadir}/qemu-xen/qemu/keymaps/pt-br \
-    ${datadir}/qemu-xen/qemu/keymaps/tr \
-    ${datadir}/qemu-xen/qemu/keymaps/sv \
-    ${datadir}/qemu-xen/qemu/keymaps/fi \
-    ${datadir}/qemu-xen/qemu/keymaps/en-us \
-    ${datadir}/qemu-xen/qemu/keymaps/et \
-    ${datadir}/qemu-xen/qemu/keymaps/nl-be \
-    ${datadir}/qemu-xen/qemu/keymaps/pt \
-    ${bindir}/qemu-nbd-xen \
-    ${bindir}/qemu-img-xen \
-    "
 
 FILES_${PN}-remus = "\
     ${bindir}/remus \
-- 
2.17.1

