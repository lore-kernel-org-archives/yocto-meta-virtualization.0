Return-Path: <tiniuc.alexandru@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39AD8E00CBF; Fri,  1 Sep 2017 08:11:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (tiniuc.alexandru[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.68 listed in dnsbl.sorbs.net]
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA3B9E007EF
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Sep 2017 08:11:39 -0700 (PDT)
Received: by mail-wm0-f68.google.com with SMTP id p17so457641wmd.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 01 Sep 2017 08:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wKWH4UEWQ9KRxKAEjmfkVufnuynzfI//CkbZKaFNG0o=;
	b=OOt89TRvlUiBWjkZV0vR+/achQVahbiLZC6qwN2/D0VDuyOQEcv4ddAbLedSLSVmuG
	e6WZXdu+nUSZq5wG6KrNNzOG3nJbVMLTZ5ixJPn5Rf8MjY+/K+S1J8X4m3TzHFVNzGcV
	OTjNru17dswqGiyhxUkK+z70wNFHollxTLegXimHdL4Ob3WNaomB+tOcP7er6tv+rC7s
	EVuDN0K5eGCqm7N5gZNHOh4uAGRNBB/6j+HyPsqt1KcR+4s9eN5oO9jQeMbdsvjFWcOV
	rarO4eIAfpX3ZI6Z7nECtYWj1DFlDBam4ZMXP3kli7c/vuoI/PcGWS4A0tByvUrIjLw2
	Kgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wKWH4UEWQ9KRxKAEjmfkVufnuynzfI//CkbZKaFNG0o=;
	b=oTGH29pF8nvv4azVG+0Hjkn8hlZ0/ovb10EF2bLEXFgAmtUHXat8IjjBwuJWwnZL0E
	lhKQaExE3fDzQzRz6s1zjOVP53BVwHBB1cR7cGBldDEgQWFZxTKBTfFLmLw2AfBK47jI
	Z4mhB8HBcBkorTplRVdvQoPOu6MSl4B8MG8Mg8z0TTAudK5S9O6jUFIrjbetG0j+L1Un
	y69fbx6VbV68C5KbVu2pj0HSQ9hCozjLVLBitLfmKpDY5rmpzVz6D1F0Rv/h/yRnakKC
	uyYkqINzO4xtYuUBf7xRIhD47QrW2Re6jFiJsD/orP+zcQ+FhA/KdWhziNnrf1l31Ijt
	Wf5A==
X-Gm-Message-State: AHPjjUguXuWHFh8yYoVcExpe8q9UoMtzw3XgIVDL1EZRuGWbrZAxI6Yf
	1NM1KGxG20ax35kuLHY=
X-Google-Smtp-Source: ADKCNb500yaDQ7TBIwuRkVGzKZvUpB2bpEHFVGRBKiZ4u6IM6/mxyFuzKbYEpvTiQfrO0TsSrDPHJQ==
X-Received: by 10.28.98.5 with SMTP id w5mr583227wmb.95.1504278698314;
	Fri, 01 Sep 2017 08:11:38 -0700 (PDT)
Received: from localhost.localdomain (boldrewood.soton.ac.uk. [152.78.0.15])
	by smtp.gmail.com with ESMTPSA id
	m136sm305042wmb.23.2017.09.01.08.11.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Sep 2017 08:11:37 -0700 (PDT)
From: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  1 Sep 2017 16:11:22 +0100
Message-Id: <1504278682-99314-1-git-send-email-tiniuc.alexandru@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] singularity: Added dependency to e2fsprogs-mke2fs
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
X-List-Received-Date: Fri, 01 Sep 2017 15:11:41 -0000

While the recipe was functional under an image based on core-image-
full-cmdline, when tested with core-image-minimal runtime issues
appeared: Singularity was unable to create a filesystem within the
container. This change fixes this issue.

Signed-off-by: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
---
 recipes-containers/singularity/singularity_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-containers/singularity/singularity_git.bb
index 8b97740..6fee8f3 100644
--- a/recipes-containers/singularity/singularity_git.bb
+++ b/recipes-containers/singularity/singularity_git.bb
@@ -2,7 +2,7 @@
 # Singularity build / config: read up on the dev-so test for more info)
 INSANE_SKIP_${PN} += "dev-so"
 
-RDEPENDS_${PN} += "glibc python3 ca-certificates openssl bash"
+RDEPENDS_${PN} += "glibc python3 ca-certificates openssl bash e2fsprogs-mke2fs"
 # Singularity expects to find python3 under the name python, therefore both
 # cannot be installed at the same time.
 RCONFLICTS_${PN} = "python"
-- 
2.1.4


