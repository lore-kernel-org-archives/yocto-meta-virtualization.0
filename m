Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.17465.1581311311720141878
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r1R66h87;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87FB9E01711; Sun,  9 Feb 2020 21:08:31 -0800 (PST)
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
	*      [209.85.214.173 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD7EDE016B9
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:29 -0800 (PST)
Received: by mail-pl1-f173.google.com with SMTP id ay11so2346438plb.0
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=94toTxN8hQ2nuR/rMwCVMtEmzu/PwaTUOi2X04Go/n4=;
        b=r1R66h87ZvPS6j/3J+QlHLCHjbjs8BAC87441evflUqjT0nC3Pp2xN4oZ7li2eUomC
         Tk9KB2yIr6BnAJ0nKD1cwy1Iqnd/Y7RXNCJT2koDtMX3+u7zm276BgH0YoyKTaTS8VLk
         h/MO/EAmCcnUZMUNmTreRFExAYt8pBeSOTZ/0XGghcMeNFS4IL645N1Xx/dPSQYkm8A7
         MmdQPzpicfdwAy5N9WHK+pFzgGWitJZDR7uoE2DM/x6V0B1GiH1RWuoFtxaeCZaQRcr+
         mgABWZWaWkW7GVHDz2BXVUw+9LeGF5kEcXKMpr31xaWS5O5+2LisETgmdshxKZy7kpwh
         2rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=94toTxN8hQ2nuR/rMwCVMtEmzu/PwaTUOi2X04Go/n4=;
        b=tlEkX5RUvBqFta2rAxVXqEXtlx+8CQYWAbuRbeV98L1115B6N2TbKlNl606MrxOBPu
         PHR3NlVDhmGLCHIFHLH0cLq8D7chn2o1n7MmpXpHl/yP9airHNoVPEAEJH5L/j5RQRKE
         O9SNnz5gmfXXxZZhTRmgNqBsdi7B/8iB178nKdFds0OrV09zkq8LXIxGCQMo4qv5+8jC
         2aen5yLjwqb63SBFHuYVryHkQJWQwNFBoluI6R3Dk4t7oTTqZeRfQPNlRH68+ykg+O8i
         iO28wtHGXVPHNC+/1LUTswTHGLnvGMsoPKgmwIvW6NSptiayMUREYQeX7ZZAi6A1dFDF
         2ljA==
X-Gm-Message-State: APjAAAXBlPyL8vQk7Iz/IlV6pdH4vkB3si58dDtAh5UqSWoEPh8OumI0
	aP2tl2awCnAiqZR4P5MSemGVsAMl
X-Google-Smtp-Source: APXvYqz08+7UJpafDsKyt4wnuspAMnd7JhICR1B1Uus/sa3m06yq3bVbP93LjLzYV8x1YgMlxY683w==
X-Received: by 2002:a17:90a:a409:: with SMTP id y9mr18574056pjp.119.1581311308736;
        Sun, 09 Feb 2020 21:08:28 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:27 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 09/16] xen: add seabios to RRECOMMENDS of xen-tools when HVM-enabled
Date: Sun,  9 Feb 2020 21:07:47 -0800
Message-Id: <20200210050754.3534-13-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Launching HVM guest VMs requires a BIOS firmware binary.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-tools.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index e012020..5b0a339 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -29,6 +29,7 @@ RDEPENDS_${PN} = "\
 RDEPENDS_${PN}-dev = ""
 
 RRECOMMENDS_${PN} = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP_RRECOMMENDS}', d)} \
     ${PN}-flask \
     ${PN}-hvmloader \
-- 
2.17.1

