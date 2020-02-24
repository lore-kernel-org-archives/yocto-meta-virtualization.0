Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.17136.1582521573439927102
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o6fVxWpK;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 500DBE014C6; Sun, 23 Feb 2020 21:19:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.215.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AF15E00D33
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:33 -0800 (PST)
Received: by mail-pg1-f196.google.com with SMTP id t24so120386pgj.7
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JnbmaKNrQU9iB+RDvG2bUNOnieRd4SJgYZK6pGz+rHs=;
        b=o6fVxWpKAsCanVYCIheeHjm1PNXxJCk0bW3/1E3qdEq61WRvqMxVWfeitDbb8S6O/B
         OJzz4pc6vrDd8lYSAor/0bs7oRZybEse3FnzFL9aZaXXI1MKn2hq8RWqD2nzph5INvYR
         2a8y2wYQTfZfKj/OHJULdUchk+ypPehfD8jCKaAVPGvwMa8Jk787GhP2b8sfOAN3MwHR
         e3xKrd8ta5kXyHN0ySk02G7mxyhLrYggEIqDQ8KqxGOFew4x5QXMPL/vW0RaZ9YPxvYD
         c1nd6AGD4U/oleRqg1HwR8D+dWgUYbQymagtD9lrJtaCUAPW66EVnW5ZzwEYEtKKSZ7f
         WUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JnbmaKNrQU9iB+RDvG2bUNOnieRd4SJgYZK6pGz+rHs=;
        b=tfSz/wiRH7QrCU3vBOSUeAfsXbAEd62c4qiRceimc+ihYdF89nY3yzfVPXCI/L0EKy
         ry3fmpwiUjfo3fCbh01nfnhi0Cv092Tb/K1EtycNHHU8lGkaCBCAg13fZNINONP8z4/B
         c5A2wtTwGiJ+lFJ6LE4HWV/p5swJ7G44dp9BjVUScMjHNJI6dNHA/KAoDOPHOr3sK1SU
         WBPJL6HhSMGR77dxMetJDQTW3g629tGpIOSVHaUTcFfmSXpEVDBn65So87jcJTq9LM1Q
         f0ILzrpwXgftWhgDjjCXZqMCq17IC5IkZkYM5+IcAmbGSMpIdn7yJWmfB7ayPIaBrwl8
         VdPQ==
X-Gm-Message-State: APjAAAWyKj8UEDoklx0Ok0+szrog5LFfxPIzZbgDyXGZBSs10VPnTHCm
	8rxj9PRdGic76xDIk6BxorK/Ftyd
X-Google-Smtp-Source: APXvYqx/GXX6x04gI+iw6qb+dM7WyIVCm5GE518BfyVY820edMMq0UNghdD6Gzm9liO8S76DHe8jZQ==
X-Received: by 2002:a63:4e01:: with SMTP id c1mr14734654pgb.435.1582521572343;
        Sun, 23 Feb 2020 21:19:32 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:31 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 13/22] xen-image-minimal: add kernel-module-tun for HVM guest networking
Date: Sun, 23 Feb 2020 21:18:43 -0800
Message-Id: <20200224051852.21933-14-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

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

