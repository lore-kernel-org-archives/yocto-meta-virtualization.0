Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.173.1582676210615648553
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GZEE32pk;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CE6BE016E9; Tue, 25 Feb 2020 16:16:50 -0800 (PST)
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
	*      [209.85.216.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E7C4E016B6
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:49 -0800 (PST)
Received: by mail-pj1-f68.google.com with SMTP id m13so475691pjb.2
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JnbmaKNrQU9iB+RDvG2bUNOnieRd4SJgYZK6pGz+rHs=;
        b=GZEE32pkQGVKvi61zKbMETzlTtofIrwoB2WeDs8/9xXxNLGgIVEj4BtWJi4S0Pjt2m
         HR0T/2PN5ZHxLNBvVMPogB9nOqW/3Kl6wmLB4ba7Ic51q8s/Z5W9zT+8JWLdWk9fUsrF
         oJPYYMu75xdaOlGHZcz9CVbyQjvd2B+7dUH6aWeI/Nni2C4U15HPmCi1ACX97Ep9EPoB
         WU9FsWDvyLEDp6nFrP5QjnIODke8vEwsBIK0A1vlBxSTbgy1IhYu3IIrHd+3gvWs2aVi
         3l3wHPGrCcdH/xL3J2hgZOxWUuL7vUKPmjPEDvfkslaIlJldB/tS34xDXBTOh0Jxdvtc
         FJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JnbmaKNrQU9iB+RDvG2bUNOnieRd4SJgYZK6pGz+rHs=;
        b=lUEHvtgGHKLw6OnL3oNI9ijqbLEuGkMyPlCraJz5usFLjpaT+VSfIPjrHGDCw0iNdT
         kvbM7MzSSQma/H0+EWsqh3zj97JZriAn2XLq6RxnmcXj6rUwbx2M9iUjaduErcEzBELr
         ImQ4+iXVujUMVxvG9wsQg6hcejlWrRthyO4v9CWSZyys4pF8bjNvLnfGLgFOCajE6Dgw
         PkDSyMbxMZdAFHv1+x+dxua3LhSNWg7tcEbOnRGQ7yuHXs1iHO3fC0+SIsAjs4dxnjAI
         v/fqi1T/ViLhdm/Qp8S+31KD8nYsRkpg16ESocS3JZU/6y90m1V/71nHBZgmZ+4TjLTU
         p7Dw==
X-Gm-Message-State: APjAAAU3sfeEnk8+p8qcLx6tMk52yG9TnTnOHWoRpcyrtwtkqw+YcR4o
	Zqd2Er7PEA3+/vubg84e8er9D2fn
X-Google-Smtp-Source: APXvYqzkKg684m5AlHuPLhkN6NYZS7pZmhn8XjaVztTfTBT3L7BxFZgEXlVqSExgbSIHyia5/x6LcQ==
X-Received: by 2002:a17:902:8a81:: with SMTP id p1mr1130567plo.284.1582676209237;
        Tue, 25 Feb 2020 16:16:49 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:48 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 13/22] xen-image-minimal: add kernel-module-tun for HVM guest networking
Date: Tue, 25 Feb 2020 16:15:57 -0800
Message-Id: <20200226001606.14750-14-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Xen HVM guests are only on x86 platforms so add the module via overrides.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/images/xen-image-minimal.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index 63a1086..c98314e 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -16,6 +16,10 @@ IMAGE_INSTALL += " \
     qemu \
     "
 
+# Networking for HVM-mode guests (x86/64 only) requires the tun kernel module
+IMAGE_INSTALL_append_x86    = "kernel-module-tun"
+IMAGE_INSTALL_append_x86-64 = "kernel-module-tun"
+
 # Linux kernel option CONFIG_XEN_PCIDEV_BACKEND depends on X86
 XEN_PCIBACK_MODULE = ""
 XEN_PCIBACK_MODULE_x86    = "kernel-module-xen-pciback"
-- 
2.17.1

