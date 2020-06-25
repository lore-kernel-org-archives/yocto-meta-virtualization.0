Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4798.1593065100060882881
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 23:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=THJACyot;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2F5BE01D78; Wed, 24 Jun 2020 23:04:59 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.219.66 listed in list.dnswl.org]
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68FDBE01D75
	for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:04:59 -0700 (PDT)
Received: by mail-qv1-f66.google.com with SMTP id dp10so2262378qvb.10
        for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SrGI5d+AUs3FRFItlx7kfp2P08QTPVFQh/pN9xsrZ40=;
        b=THJACyotSXZd2FdM9oI3SecDARJ1dSX8FE12ckMNPolbYNmkDl/2CRYWXpb5Dn0j/T
         2rgap+6K9AHq3kAqlXOZ7CnY+gel8imfb85KlheZqVMSrMJckv5U2mGUxaDSEWHrL6QW
         VuUmaK7Cw1v1MyI2OUAoRrkySfLaCSYj3AmNIGyrwdmxt/DTFXHAT/LC8RY9L4MGnDNS
         TdzCsoN1UNr2EhWcI4d5NKbZjeGDxpSAwdIh7PdjN+dEzvrPJvTWktlGdrcp+Z/r+5Ae
         onyuxXCvtfxHfBTp6B2WrnRAfOfICSUUbLUe/vBNqTPV+rTeBqJQpzJNQoh3eeBmU6l9
         lD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SrGI5d+AUs3FRFItlx7kfp2P08QTPVFQh/pN9xsrZ40=;
        b=JsH3YGtI0rofFdohZeMXm4vVdZcEnkAdD7hP4wd7CJkM9ZqTe65yYrILVL4/oHvQzC
         FYD0Vz3yVC3Vfu5qDKc1kZNj7g29Z5YaXh+G4Dmxov8mr/PeNfrk+Azfbt/gI11N2f2F
         9Z1Vp0aBJiuZICmqL1U+Uw1sdnoJutpK0aMy3tQMrXkXxc4lVG7YNCGi0GhVSg+zbUry
         znYhZcrbissmR0EmOvZWnIXHjuWHRT1VdCBkq8him66YJmfKa1NtwMngExYZWjC39EzH
         //LC1VrYLsCFCUDXwe14iP3qUZf2FMhwaDGtRQAtPtkHUZ31Iejw6F5NofaGlkHAQPQD
         i7mw==
X-Gm-Message-State: AOAM530JZ01Z9v8/1EsH+jz8HDnj7bUBLRZwd8IRXaSO39ytlqq8E6HX
	QnzDhGZnjoRA/KJbMHTujsNF67nPH1E=
X-Google-Smtp-Source: ABdhPJx7hKw0n82PKrvP3XlikzklSVPfWhjhZgMSu3ozZ72KYVvV8h1GVjXeXXeF9qpsrZcMzPy2Ew==
X-Received: by 2002:a05:6214:1543:: with SMTP id t3mr21068765qvw.89.1593065098685;
        Wed, 24 Jun 2020 23:04:58 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-184-6.mycingular.net. [166.176.184.6])
        by smtp.gmail.com with ESMTPSA id g5sm6059161qta.46.2020.06.24.23.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:04:58 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH 02/10] xen-tools: add RRECOMENDS qemu on ARM and x86 when HVM is enabled
Date: Wed, 24 Jun 2020 23:04:23 -0700
Message-Id: <20200625060431.31826-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625060431.31826-1-christopher.w.clark@gmail.com>
References: <20200625060431.31826-1-christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen-tools.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 8b86f7b..c0e54b1 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -53,7 +53,13 @@ RDEPENDS_${PN} = "\
 
 RDEPENDS_${PN}-dev = ""
 
+# Qemu is necessary on ARM platforms, and to support HVM guests on x86
+QEMU = "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu', '', d)}"
+QEMU_arm = "qemu"
+QEMU_aarch64 = "qemu"
+
 RRECOMMENDS_${PN} = " \
+    ${QEMU} \
     ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP_RRECOMMENDS}', d)} \
     ${PN}-flask \
-- 
2.17.1

