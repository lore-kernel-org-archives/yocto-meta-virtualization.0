Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E7BDE00A38; Mon, 13 Aug 2018 15:53:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.194 listed in list.dnswl.org]
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A44B6E006D8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Aug 2018 15:53:39 -0700 (PDT)
Received: by mail-pg1-f194.google.com with SMTP id r5-v6so8205637pgv.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Aug 2018 15:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JPzE4ZCFYNwSN5MEjUnyL7/db6MLFrHxzcPkV15rg+w=;
	b=K3xyIFkxEEqnAkwqL6ippyFjQHq/v8wZywYYLly51BleIO9cg81lPjiioPSxtdwui3
	tOYf3E+4jQanuG7Zj3Q/jOVkbNstzGgvGywc4kP5TW5Ze/Sj3MYASK/ADTigAl3ZPtFl
	zaI8IJeZgFcHI2PoOOUkT/c3om4OxFPJtrUJSqON6mMWZ6vrlm3kUR5KcKFFirqqQH/s
	Xm10mMsayqO9Hpf7mfdZ/jUH5z2W/AaBiY/akiA7NE1AOqEF2BD5XoLjhmpTXD/ZPvzD
	4H60c4hHQnIL6D11mEsZihiNV5CDi9PAVWEmJ3gIGJFnX7aiEi03gXzNepbqIM2r/Jtq
	/c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JPzE4ZCFYNwSN5MEjUnyL7/db6MLFrHxzcPkV15rg+w=;
	b=Lrn0eg91OQM4hRoB14ewnCuRXjs1jdJu8I6rn37vLCtDQoHYlAoE0ww50NvJAsPjfA
	+nFQ5sXE4WgCxJ1k3iyeTrgM4LjLd6D9M6zJvp2A34hTconWSUSxwW6llHj4abpGmidG
	1fjQfcgWH3CLdB94Bhsl+KsFav15KsVcmNTF+YmHqP7K5rPNCWTAin59Gjo7KbssDgBM
	+Y1oB+hfTLI5Jl/c5F9woh1skDLprBK7X9Dlf1gc76MFhVavssGvOOPbr+GRCRiajbpv
	ev0+Gn896V0kRG+oakRQqEU9s2bzqpQbjII38OgItlqKk0wa/Zn4zfaj/hUFavznQMGk
	lEMQ==
X-Gm-Message-State: AOUpUlGGmuiOXayllXbsBtljbumCB7RIx3i9iYAYBJUCxW5aLLrnPBzF
	F6dQBteLPEiOo8agE2nm1S8VtxVY
X-Google-Smtp-Source: AA+uWPzPx9dOZsCnv+GxdOZU5x98o0NVIlnd+1AAdoE0n1lORMvYCPWC5VVikpTc8JLSLNHoQoMmBQ==
X-Received: by 2002:a63:ff4d:: with SMTP id
	s13-v6mr18762191pgk.150.1534200818753; 
	Mon, 13 Aug 2018 15:53:38 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	j27-v6sm32680679pfj.91.2018.08.13.15.53.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Aug 2018 15:53:37 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Mon, 13 Aug 2018 15:53:33 -0700
Message-Id: <1534200813-27685-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] seabios: update SRC_URI to: https://www.seabios.org/downloads/...
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
X-List-Received-Date: Mon, 13 Aug 2018 22:53:40 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

According to the latest seabios download instructions,
this is now the preferred source for release downloads.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---

This new SRC_URI is needed in: master, sumo, rocko, pyro, morty, krogoth

Referenced Seabios git commit:
https://git.seabios.org/cgit/seabios.git/commit/?id=95f850c2377968ad951121ceaab76d40a9eed593

 recipes-extended/seabios/seabios_1.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/seabios/seabios_1.9.1.bb b/recipes-extended/seabios/seabios_1.9.1.bb
index 9206046..77e8f34 100644
--- a/recipes-extended/seabios/seabios_1.9.1.bb
+++ b/recipes-extended/seabios/seabios_1.9.1.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv3"
 SECTION = "firmware"
 
 SRC_URI = " \
-    https://code.coreboot.org/p/seabios/downloads/${PN}-${PV}.tar.gz \
+    https://www.seabios.org/downloads/${PN}-${PV}.tar.gz \
     file://hostcc.patch \
     "
 
-- 
2.7.4


