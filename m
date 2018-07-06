Return-Path: <jpuhlman@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C929EE0108E; Fri,  6 Jul 2018 14:25:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.49 listed in list.dnswl.org]
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D23CE00DED
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jul 2018 14:25:32 -0700 (PDT)
Received: by mail-oi0-f49.google.com with SMTP id y207-v6so25917120oie.13
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Jul 2018 14:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tX0iAicuo9IELOzodO36VEi43no5xlRYuoul3c1pYW8=;
	b=ezWkY3xtZuA3733D9pa/rrchfCThdzUvEcr/W/VmFvP6cZass4h1jQ5H1tXVWJkwTU
	Eoohm42AgnlZPzdptJuChn6sTYSaWARLUpnpzaXaB4szvqaib1Cao/TUSQlKN7Fxv76O
	tcjqlOv8D95tIDUh1hWKaAHoLs5T//O1fRVd3dDGx1TPafFHvTYOOsxtJUfosgrEYfjI
	bys6SMQL4rr67HZPzZJfXqzFueDWE4/OFRMt16Wp+xAdfbn0HbEEjXMlJX3KsIz1g2NH
	TRhwApzl0D5SWrab0PSWiIolpaEC4yHfahc2iX7BGMty+OdbFw5ZyDIqvdgiGG9FOaPN
	SB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tX0iAicuo9IELOzodO36VEi43no5xlRYuoul3c1pYW8=;
	b=OnyB4mi10O6jw+09vHFr5UipKKn06ah6s7sxA+sBCeqR1GS6GJeIUmGZ4U+8CrWxiT
	jK3QogAxAMOemYo6l+BwkDf72GKNhCo6o+wXF6O7RycacqfGlj74r/sGK6dWM3yznhQI
	yg+zNxs1+cK+04xpHt+bAK+Jn16U9tNAITjNmFYRVJkHtKrLlTaksjzXtfVXOelNuFLk
	gUCXSKHDcI4cTARabDyowultnu/lp7CJv0KWOojnMUDOoIEv6stxy7VHAM+JT6Hr7K/R
	LTw3ZwwTBDxQvHMpoCcIs1sTNfYMFfYgLjlySsdRKvsZFL0UsCh1XrmwnCnXaAGjUg/D
	vuOw==
X-Gm-Message-State: APt69E2pQQcy5YfKS/uUH8rc0qsDOkcKC2ruePFUfWSrf/XtOPt/E8Vq
	qi6mGjsIN8YaTORRbidMH7oOUY5LfU4=
X-Google-Smtp-Source: AAOMgpf/yzZXhi2n9A41+19QGiCNt1O8nEUrpMCrSGlCqIFOF6fZlNBVRW7RWhQ4bR8ToiGZyWmXAQ==
X-Received: by 2002:aca:b782:: with SMTP id
	h124-v6mr13961443oif.7.1530912331275; 
	Fri, 06 Jul 2018 14:25:31 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	d8-v6sm8820944oif.39.2018.07.06.14.25.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 14:25:30 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Jul 2018 14:23:19 -0700
Message-Id: <20180706212320.6023-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.11.1
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [m-c-s][PATCH 1/2] libbsd: Remove dangling append that no longer is needed
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
X-List-Received-Date: Fri, 06 Jul 2018 21:25:32 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend

diff --git a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend b/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
deleted file mode 100644
index 7447c56..0000000
--- a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-inherit autotools-brokensep
-- 
2.11.1


