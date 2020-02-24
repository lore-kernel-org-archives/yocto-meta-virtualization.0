Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.17117.1582521564526595333
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VE5CEg1m;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62452E014C6; Sun, 23 Feb 2020 21:19:24 -0800 (PST)
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
	*      [209.85.216.67 listed in list.dnswl.org]
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1C82E00D33
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:23 -0800 (PST)
Received: by mail-pj1-f67.google.com with SMTP id ep11so3643988pjb.2
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N5OLLQt2eyLxj40DtlB5dNMiuLGmeowneoLGenkXhfw=;
        b=VE5CEg1mWou66NiG3uVtmVrxhAwywdiflmr2a1nRPCKguAwubKwtS6ARG75tRWnYFX
         FZL4E6lz+gtQxhi5cKAp4Dn9IOpStbqCmna7FcIOYrZxCiK+IGo43hq58OIkpTylFtoq
         bfgf4sylUcDX6pW8Ovv8XpBd6Ireg5noQKw5y71aUauJhWVxMpfPMab1fwy6nkEoObIe
         o0iD3olD8CSHraKetyxRFB5js9LoCWAYR4sVGmwfycTEPeU5I/l2K+BjYNINjlTGl5FC
         U8YYMVHDLayajP9hofw9MLt8BjpopE09lxukMIAkdv31v1/CiE1weCB2xtJT+6pKS8hD
         OQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N5OLLQt2eyLxj40DtlB5dNMiuLGmeowneoLGenkXhfw=;
        b=sHZKH88Lv5wdPQkXS8oTfeke7qjkL/mv4/22bjxZSiCPAXGYs25yPKCAsobSxQB2g7
         YRcrSQMiAMjdo1h48YGUnBchAQ1ff0GvW5xE+Utpxt0hjvlAtVBZqj9lcM2L6dXZVqpu
         HuD3T6c02nKRcXV4bMSi09pMIXeNGD0L/4nCYUSlTy/UPaeoQPfLCbEs0ecqf8ezWQpm
         HEfb157soQF/SN7lxREEU9ddDbujQHSncXRxDulvdyNpwN+HFPLIMb1oHZzCV2soXUJL
         C6x/COtuSd46nzlP3J5Xq1JMaxSQAFP3RGzlwt19qnDcoQANcxxz4MEwhIqMCWVMvKRu
         a8rw==
X-Gm-Message-State: APjAAAWiFMK8UlixbtNXFNwaucQq0L+4hvW3+5yDT4WuJ1PqQKnxi0kz
	MoLfYT9ewsSDlqGxxtRi0ec8zwVc
X-Google-Smtp-Source: APXvYqxEuZi0IiGyvNEOtUP/u8EsSFpA2AdNVM9Ci5deL6qu9pkuhj08cllWhaj8C38u989LL4W+LQ==
X-Received: by 2002:a17:90a:f985:: with SMTP id cq5mr18240952pjb.19.1582521562942;
        Sun, 23 Feb 2020 21:19:22 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:21 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 07/22] xen: package the EFI hypervisor binary /boot/xen.efi
Date: Sun, 23 Feb 2020 21:18:37 -0800
Message-Id: <20200224051852.21933-8-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 4ac954e..380b193 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -429,6 +429,7 @@ FILES_${PN}-hypervisor = "\
 FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
 
 FILES_${PN}-efi = "\
+    /boot/xen.efi \
     ${exec_prefix}/lib64/efi/xen* \
     "
 
-- 
2.17.1

