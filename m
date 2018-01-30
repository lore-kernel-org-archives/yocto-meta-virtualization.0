Return-Path: <ricardo@opensourcefoundries.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50EF0E00E15; Tue, 30 Jan 2018 12:22:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84FF8E00E47
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jan 2018 12:22:41 -0800 (PST)
Received: by mail-qk0-f193.google.com with SMTP id d80so11841347qkg.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jan 2018 12:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=kaG0id85fj/My0dhEc4Kt2Uv5MR8ypR3l7ZBPGr9/6M=;
	b=rk5FmmizWxRHFjaMXke82mzAl6/JVnDp0mJe7fOYFdhU5K8m348PYPv0PkD++znfAe
	Mid8FUnqApnb1lH38KoKKQ73rqfUQ5/6IZ/jSPlTHVUQLVNtFxqUmf8zfAo5u/Gwxq/K
	a4wfy1U2YPiF/qFuJ4bJPOZrnJCLAyd7aliU6bK8EhM637t/38uv/v6vsQ7HWGFQoBot
	B5dwnCoQcwHQo4+lN17OwD9KLNYs72mCz9n90nOMaTmTQPCEENzoZQZIGR1GmGr5LD9l
	EPPBCI0x+At2b2Qvj3zSCHDpxn+yPnSPZ17v3yWIwCtD/oxI5G7w7PK7bmmhdJuVT6Yt
	NHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kaG0id85fj/My0dhEc4Kt2Uv5MR8ypR3l7ZBPGr9/6M=;
	b=kRA65rD0ZaQySy5M0ujvtzRirstMzYxNj0C/MoPgg+eIOHMv7qg333BgSswr6vzi8R
	TuEj6Dkm1Z51H1pYfIrDy8IwARGHOPLjNHOyB+k6CF/8MzJ+vvOg8YJTQbRfId9h9nA/
	vukE834xX+8a/ZLnKslPCMEjCWFgt+Crd0h35lpy5gLd5UilYS8QHsabMmEYh2wFery0
	cSZKjYTozu8WhT8xTLGnhokMdHykqTzst2P6f7zTu9rbyz7Thzjjzykw8eUUmktM0euy
	CgejLxHg3i4OJR7AuffQ1Oki4xc10SAwO2b7gcCSndW7uN6ZENE0mRbUaijyxoILUSF2
	Bp5g==
X-Gm-Message-State: AKwxyte3yB5yXuhsxYCSC/iwI6sXXgi42SgbcWgN5maNYs/icFN5RW6C
	HQ3TteKmpRlSSNTs4IkyeoorUnmjQQ==
X-Google-Smtp-Source: AH8x22631GFEoxMrY7Ck/rmFMxXxkcqfeyHDL5FIUr3p5UQmTgAyklDppu40qfpu0bxskWuSxm2dww==
X-Received: by 10.233.244.75 with SMTP id z11mr42188837qkl.68.1517343760180;
	Tue, 30 Jan 2018 12:22:40 -0800 (PST)
Received: from localhost.localdomain ([189.4.104.170])
	by smtp.gmail.com with ESMTPSA id m1sm9615230qkf.8.2018.01.30.12.22.38
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jan 2018 12:22:39 -0800 (PST)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 30 Jan 2018 18:22:33 -0200
Message-Id: <1517343753-17969-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] xen: use oe.utils.str_filter_out
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
X-List-Received-Date: Tue, 30 Jan 2018 20:22:47 -0000

oe_filter_out is not available in oe-core anymore so use
oe.utils.str_filter_out instead.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 15ec8cb..8dfe589 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -830,7 +830,7 @@ export LDFLAGS=""
 # Yocto injects -mfpmath=sse for some machine types into the CFLAGS which
 # conflicts with -mno-sse so instead we strip -mfpmath=sse instead of
 # patching the build to be ok with this
-TUNE_CCARGS := "${@oe_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
+TUNE_CCARGS := "${@oe.utils.str_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
 
 EXTRA_OECONF += " \
     --exec-prefix=/usr \
-- 
2.7.4


