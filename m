Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4679.1593065108795258307
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 23:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LdlZF90c;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6BB5E01D79; Wed, 24 Jun 2020 23:05:08 -0700 (PDT)
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
	*      [209.85.160.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3EE38E01D77
	for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:05:08 -0700 (PDT)
Received: by mail-qt1-f193.google.com with SMTP id e12so3761112qtr.9
        for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HQ6Kqinrt1VRn17OKwhp2mornyBKluB9mRVZX4ful94=;
        b=LdlZF90ccx8mtBZrT9hMsPC4fHkojpb16+fgIi440gRLGz+Iayx1Bz0SDEKRCSkq/X
         mrmMoMfelI46sZb/sPr+uLPe+p8IBewFsZ7pqLvaAK+o6kF9a11tR9lvUPKzNH2S/Wxf
         p8tQ3f9O2gA5BYML6q6AqhmWSia37XRgbi6o0cDxX6rtId1eYbs6fn2yUfFlgwUeCpD0
         m4fH1kYp/o01p2Wg56mkg++4DwKPXHcWXAekejUKT5OF7vu4rvk+kRDiGvN3HisJijxE
         C1R3yqBvmP9RRyzj3iIVbdRn8hjUhhBALNaohiSatSb2hL30/mqnjbPDPL+xiget1WzG
         3Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HQ6Kqinrt1VRn17OKwhp2mornyBKluB9mRVZX4ful94=;
        b=QhwiaZXPRIPz+cDsF/SVh//t2UVMitp4860bEHS9W/ap0Tl678/tuVFPc+Q6ZRm9FK
         13ZTvoWr5tJP1wxysiH0/z3sEOqXirFabmatZYv/MXnfrLODWmsRkqVUZPI9A0r6CoqS
         pRj8jyHcSv5uEZ00elhNhhCepH8XVvE7vcyA5DKIh23NYEjCWnZKsm8jNjOABu4Bh9TX
         YZ5nKdaCPsLFrZU+d/4uAOvFu1Q3/mpayq9+XByr6gGndCe7yotqGIBufwho/YuEXD7W
         Y8rAEmEVpsW58zzRh7+4yBPRIPE9RC1l18l1Ky2X062YGL4A06lqQm0a4K+Vca4r4SfL
         EZUA==
X-Gm-Message-State: AOAM532Fqzu3ymZ2zgf/W5PlYA6h/fYJ7+PPbUrvmQdyNx3sOaTMgSN/
	QHuCGmCm/L3oOIrzJQB90173lNuTaVk=
X-Google-Smtp-Source: ABdhPJzYNatfOFMT25NwegIvZ+ubsVAkeaZPk5lpHVnecq1GTBl7WaISK6mRRI/kkuvH0tw8cJtXaQ==
X-Received: by 2002:ac8:3797:: with SMTP id d23mr26688298qtc.25.1593065107484;
        Wed, 24 Jun 2020 23:05:07 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-184-6.mycingular.net. [166.176.184.6])
        by smtp.gmail.com with ESMTPSA id g5sm6059161qta.46.2020.06.24.23.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:05:07 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH 05/10] meta-virt-xen.inc: add Raspberry Pi settings
Date: Wed, 24 Jun 2020 23:04:26 -0700
Message-Id: <20200625060431.31826-6-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625060431.31826-1-christopher.w.clark@gmail.com>
References: <20200625060431.31826-1-christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 conf/distro/include/meta-virt-xen.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index a92b08b..2ada83a 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -4,3 +4,11 @@ PACKAGECONFIG_append_pn-qemu = " xen"
 # For builds for ARM platforms, enable fdt
 PACKAGECONFIG_append_pn-qemu_arm = " fdt"
 PACKAGECONFIG_append_pn-qemu_aarch64 = " fdt"
+
+# Raspberry Pi settings
+#  - Xen guest console
+KERNEL_CONSOLE = "hvc0"
+SERIAL_CONSOLES = "115200;hvc0"
+#  - Xen uses u-boot for configuration and uses the uart
+RPI_USE_U_BOOT = "1"
+ENABLE_UART = "1"
-- 
2.17.1

