Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54A45E015E8; Wed, 18 Jul 2018 14:59:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FCEFE00AC5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 14:59:54 -0700 (PDT)
Received: by mail-pl0-f66.google.com with SMTP id f6-v6so2634631plo.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 14:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/Gp9PowapUDt0A8tYbxZzrKiredxwnmm6eE/i43ifDs=;
	b=tuCu1siqiQGh9kuxNVYXhOqlP4yhsFE+RxXRapHB0V9+BoutG1o/oNETac4rZZ5jEl
	5GnnJ38qxDRAuEyM+vgRfsX/RhbB3I1YC/3aYdJrS0zaDQjm3hXqwC7NNWAh0Opc0RYs
	3YcJ4aV7oPiLsACjeRgogNvuFq4LbpAmXmumD6UD4k+vsHKU6fNwdzfn3djIFJfmuSms
	9TlLkJpF+gdS79KsK2m2gKjaEAWJxoEtG7xnGTgb+7xvOivunE8Ly1a5s/DT/Of+rouI
	67Qy1Ao0W9Al4NJNaROoEGLysol1kTcKm/OUcUkqtUfd1dsaCBRErWIjrVBz6hfA901X
	guTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/Gp9PowapUDt0A8tYbxZzrKiredxwnmm6eE/i43ifDs=;
	b=QZV+FzLq4eOQFcaUyh7kuX66ivGE4mkoa9rwTnplx7bNKnCZ6x9M3QPe6B4nRhtVJ9
	K1TA22gGbo8EqC+2L3CM5yIJjmOFFjtz/9r8k2wD0KWmsSpU1gymAvt/c1WnmbRboJop
	GMArWw7ceRNgTDNgXcw2IIZU18Q/QF1/jb/dQQx0JahDEwvSWnvy7tKTbqYmCoYCoTpC
	t9vjfB+hcowj/Fpa554UZZd/3ezcMtsgaDlmUiTodUhAEOlw4je9i5X39U0X6/9ybCEf
	7G93xpjglBvEt+BYqhyuVeUJFRi3xQTBIkxJA4DNp7JYR6Eo7pQbHN+4NO5oPhKU4rmM
	9mqQ==
X-Gm-Message-State: AOUpUlFOAa4VhZIcnYxBF43aXCJoPlPgJ5cyB0nwX3RrJs9K3VTYgWQA
	kLOAV4lA/+TgGJJaZnc5E8yosmtu
X-Google-Smtp-Source: AAOMgpej7RiN5wpyfr8vCuVFptgM6s99Kxy4/fzIXKH6LtAzphRWK/krdEqqi+HFMN2aTB84LtcFbg==
X-Received: by 2002:a17:902:59da:: with SMTP id
	d26-v6mr7530406plj.42.1531951193544; 
	Wed, 18 Jul 2018 14:59:53 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	h24-v6sm10626745pfk.113.2018.07.18.14.59.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jul 2018 14:59:52 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 18 Jul 2018 14:59:44 -0700
Message-Id: <1531951184-11446-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] seabios: fix SRC_URI from coreboot.org to avoid fetch failure
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
X-List-Received-Date: Wed, 18 Jul 2018 21:59:55 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Remove '/get/' from the seabios SRC_URI at coreboot.org.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
Please use my gmail address for any correspondence to me.

The previous SRC_URI in the seabios recipe which includes "/get/"
is causing fetcher failure (results in 404 Not Found).

 recipes-extended/seabios/seabios_1.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/seabios/seabios_1.9.1.bb b/recipes-extended/seabios/seabios_1.9.1.bb
index 144b13c..9206046 100644
--- a/recipes-extended/seabios/seabios_1.9.1.bb
+++ b/recipes-extended/seabios/seabios_1.9.1.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv3"
 SECTION = "firmware"
 
 SRC_URI = " \
-    https://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.gz \
+    https://code.coreboot.org/p/seabios/downloads/${PN}-${PV}.tar.gz \
     file://hostcc.patch \
     "
 
-- 
2.7.4


