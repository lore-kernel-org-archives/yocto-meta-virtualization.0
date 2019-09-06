Return-Path: <liu.ming50@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85B09E00E0D; Thu,  5 Sep 2019 20:15:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (liu.ming50[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.54 listed in list.dnswl.org]
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D48FE00B65
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 20:15:47 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id i1so4939741edv.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Sep 2019 20:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BgYqo9P/bIgzbOGMRPq9bOPYUs0L2JiSUFfipMIpl+A=;
	b=AGxCzJWee2vYEG93tVHQkyrXZZrC7NMUXz1cjlrk+BbJaG5b1yWx9EAnUfzl7dh0qL
	3fTBmRT53vwl7DBcBIopB4nJjh4qRFC84JnFWRB4e6yt2WR8UCZnvGbWIJB5expJauEW
	+vq2JMCGeucWFsFJRddLeRBaOZI7Oj1Odba5fAwXJi6PL2lCcAj3fVOH4+7j/S6z8BOD
	ZkXN1U1VRysEyMvFgSr2tXpDVsYhr2oCK+w2jexGMe1GOVegzAoWa7NydgdIuniJjMzm
	O19vj5mLgfpn4RF09n3ojOhAaYkeVkIXXp6MDwVIt6OPgtHkjjicuBOigxze87Fl63NT
	GZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BgYqo9P/bIgzbOGMRPq9bOPYUs0L2JiSUFfipMIpl+A=;
	b=IhVXJe7Wki4z3QPddXRlIVtI1SXgn0kQ9hFE7WSFNMlGDSSYg2hPHUIViliWE4Zqhv
	7djm9qSXvRDYFZ49qU464xkmcUoOuohBxSQVtzzE24VrR83ocpwLbW+n6k3k+x5bEv3X
	If+jOYEkCDjXQV7nKCnjj7JPYH3fkq5eokn3AIXaLlJEoox5QR/0SvhS/NA5YkHhvfuR
	MTIDex9ZSZOlXtVES6gweOBzklRsa4emmaUnPYcN+ySFJe465hxtZoJgd2G2Qx8gYIF1
	APG0tNTpiv7uAxAQAOTDd/qi94OA0KNrDDK6t0bloyFU56+mSx9w9zKr0cSN34FZC/qh
	0U5A==
X-Gm-Message-State: APjAAAUysQQ+nKA8KYeCUWjzGa514erAVkvSiXUqZfBO+7XRH89GndCA
	vfYtkQ4n7S2hkbR1httVbj0zF7soBCM=
X-Google-Smtp-Source: APXvYqxDHyH9EFH2C+Z2zpmSJ+NTfRm67mmGsgyQ3rFPycaZUqutBn9k7OppvsIfB3Px0uOXYi61lQ==
X-Received: by 2002:aa7:c542:: with SMTP id s2mr7372542edr.32.1567739746464;
	Thu, 05 Sep 2019 20:15:46 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.200.184])
	by smtp.gmail.com with ESMTPSA id h11sm693687edq.74.2019.09.05.20.15.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Sep 2019 20:15:46 -0700 (PDT)
From: liu.ming50@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Sep 2019 11:14:33 +0800
Message-Id: <1567739673-25907-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] cri-o: RDEPENDS on libdevmapper
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
X-List-Received-Date: Fri, 06 Sep 2019 03:15:48 -0000

From: Ming Liu <liu.ming50@gmail.com>

Since comit 3f64779e in meta-oe:
[ libdevmapper/lvm2: force recipe libdevmapper to populate sysroot only ]

libdevmapper recipe does not provide package any more, we need RDEPENDS
on libdevmapper which is being provided by lvm2 recipe.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index b0c0ce4..c2b5f5c 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -40,6 +40,7 @@ DEPENDS = " \
     "
 RDEPENDS_${PN} = " \
     cni \
+    libdevmapper \
     "
 
 python __anonymous() {
-- 
2.7.4


