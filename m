Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.17118.1582521569743920758
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sEWuWEpB;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91E39E01483; Sun, 23 Feb 2020 21:19:29 -0800 (PST)
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
	*      [209.85.214.181 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F878E00D33
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:27 -0800 (PST)
Received: by mail-pl1-f181.google.com with SMTP id e8so3554892plt.9
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bObvRCLdWQP9Zm4/9RZ1rWknuFU/Ss2lN464Fq4dTWA=;
        b=sEWuWEpBdtIK9NQjqpMroz3r3KirMEkrE/3/sbv/aOXnalVSpYRWG+irUzQGOJkCqf
         SmmZLsQ26FsjooR8NDldqTeURKUcuezfnkIgzbVJwJ+dj7hMh5I0SPINGaG6Vkf8gNWM
         p3nRRehfIkzpQ4mi5rQ2053t223pl0/8j/a4cZ+nGiDxS2Pc+ASth2EMWsecPnb3bE3k
         zDttUqs7eGY5SYQP6yOFCbOzwcYPznyks4jgNG/84WbDs3CN66PRkXBPCiGj7Oxl/7Vb
         skopYYRARkj0/bQcqN1nAkjblsdrNJaFeDzRWpRj6W6GSwi3i+YD0XMMLQZz1S4CyFz+
         3dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bObvRCLdWQP9Zm4/9RZ1rWknuFU/Ss2lN464Fq4dTWA=;
        b=BF46Xq4cOEe059NqysazZ2PI7B+FzJ0ULbbUXPDHMnvB+oZ1fouMPByB8FO2lBobrJ
         pttlY9OHOkijoJZVHZpiP5U09GIehmdPuLr9cvLjK0kKkgrN12UaMJTdvDP4GMc7TKa8
         XBjT+fTPES9kvUaz5t1lc+/xVRBMDnqM4YIip6HO/oWxwwnNCfXnQcZeRG3RHUFp+ip+
         PPfGjGe9ntuon5mn28vEgKuo68KXz6gNBqjiS1LNGyg7txDzXmKu4CSxYBiEC7701fwf
         mPsfOm1RUvOSnqXuOofy1ZtNkzRz+hCXFnnYOxDqorLwutBfnHMNCLzOxMjHKmla9bLG
         J1+w==
X-Gm-Message-State: APjAAAUJZKYAV9n4by6/CLFzepVs3TtZlfSDYDECs8lITubvzzzaPnKc
	mOKuzc+Dxj1km5VN65BPLAdBHjnz
X-Google-Smtp-Source: APXvYqw6aVoKYvD47FuRIDr4jSUYI3itnP7zaGxUP5oaPKjhSXh0xpqMjjrNJUaVXI9F3B4GiF9m/g==
X-Received: by 2002:a17:902:a5c4:: with SMTP id t4mr49579390plq.242.1582521566193;
        Sun, 23 Feb 2020 21:19:26 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:25 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 09/22] xen: retire Qemu packaging from the Xen recipe
Date: Sun, 23 Feb 2020 21:18:39 -0800
Message-Id: <20200224051852.21933-10-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Modern Qemu supports Xen and the qemu binary to be used with Xen should
be built with the Qemu recipe.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 87 ------------------------------------
 1 file changed, 87 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 7b1397f..2aed677 100644
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

