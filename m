Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 270B4E00D12; Fri, 13 Oct 2017 12:27:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AFF7E00CCC
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Oct 2017 12:27:33 -0700 (PDT)
Received: by mail-wr0-f182.google.com with SMTP id r79so1731404wrb.13
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Oct 2017 12:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YKqhcS9Bbg7fk1+m//1TCdn++S7kbB5K11Jgzsrhp1E=;
	b=tF6ADUJYnwKhrOwDSEuWnXk0Vtx1DD+4Go3WI3NwVhFj5Eht1zFGpj7rOKddr/mNkb
	L4QtZ+XxbTubVI0t85UfdLFxRNL6TKXOLaYC8laHbkPFQ4Vk5kwdk6AQkgO2oAVUqDXV
	LEbHl4goO8e1SaIPHBlgewM+CMKnJKbDTzF3HgJaIr0GLfR73ixKB9w9PYKoLo8YEDUN
	dgC/cChzl39d+Df/mVvLrmlQD3kUqwpBYJCClB/IV3IjYJbTiOA+nKNre9lBVZLPvOIJ
	kXNwLoLeCnPg/FOx5iOohmDNt64cXmQT5xOdLHHbZzbYI24ydoKmMMoY8OycPbYq4zvA
	92tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YKqhcS9Bbg7fk1+m//1TCdn++S7kbB5K11Jgzsrhp1E=;
	b=I1RxSPnradpE6RPto7SCIn/AlV3N9NeP82dErb7SlyOJdg3qOzZy7eHXzuvSl40zoE
	XMOhrg6eP1WGs7O4T/N1QzGW1po80+txd8YBBQ5KqY6DJkLkIpIfffDvFl1KcThXqmxU
	NPRS87QpFFb5yzW7VkCJfDcxjYk90/kMMlEpf/BSWXhsuRJtTTcFwf25iVQXbf0SYyAc
	bJxhcWs/1Ae6Q2aeG+zFCqZj6xfALE8Yqo+jgUM+dCF8WWgaRnfEVWedgVgcf+WdTfiw
	vReIOO2f7/Tk4/FSun1WjTDqMZjkv+CHgWJ7Zo9LckKdPua71eFCzj1V4AU0BAdEOVR+
	S6mg==
X-Gm-Message-State: AMCzsaXT2QEnPMet5GseqRlku72zZdCrkvv5b2JVw3nweNM32MgctH4o
	uxBuU9FxMUfJrK1i2sB1hjMFzH33
X-Google-Smtp-Source: AOwi7QCoi5jfSYcgKmEh+IDKQ3/V/tutE2/V9z9DVh8bVCCaQZ/Bo6XMFLMaPm7x8L6o5NsHs7bBTA==
X-Received: by 10.223.139.82 with SMTP id v18mr2408802wra.55.1507922853019;
	Fri, 13 Oct 2017 12:27:33 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id 69sm1846839wmm.2.2017.10.13.12.27.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Oct 2017 12:27:32 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 13 Oct 2017 19:27:14 +0000
Message-Id: <1507922836-17295-4-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
References: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 3/5] runc-docker: Drop unused EXTRA_FLAGS
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
X-List-Received-Date: Fri, 13 Oct 2017 19:27:35 -0000

This variable isn't picked up by the runc Makefile anyway as it isn't exported.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 recipes-containers/runc/runc-docker_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 28232d9..b8754bd 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -14,8 +14,6 @@ SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
 
 GO_IMPORT = "import"
 
-EXTRA_FLAGS = "-v -x -work"
-
 RUNC_VERSION = "1.0.0-rc3"
 PROVIDES += "virtual/runc"
 RPROVIDES_${PN} = "virtual/runc"
-- 
2.7.4


