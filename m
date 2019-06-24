Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64CDEE00C02; Mon, 24 Jun 2019 05:55:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 454 seconds by postgrey-1.32 at yocto-www;
	Mon, 24 Jun 2019 05:55:17 PDT
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1778E00B6C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Jun 2019 05:55:17 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 3CFEC5C018D;
	Mon, 24 Jun 2019 14:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1561380462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=eQFIvqxfe2ipCA0zC8SglMcPfUWDKwPi653Fo++zC5U=;
	b=zfNpnA6UzkOA8m0A/ARnBCn/TXYWP2Z6vPhsOwLLRX+iFb2cgc5GEFit/SxSqftw1COwKQ
	bYJ3EOME0OqdhNvjzr6x1ZLfDsAa8NuNa7Jo9iK4t9hqZqkVwHTYLlFc4RE6oZLCTeBLLw
	weBazZrfh7bUv0+4W8ZiigsMSXKSsTI=
From: Stefan Agner <stefan@agner.ch>
To: bruce.ashfield@gmail.com,
	meta-virtualization@yoctoproject.org
Date: Mon, 24 Jun 2019 14:47:38 +0200
Message-Id: <20190624124738.32563-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] docker: readd docker-init to RRECOMMENDS
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
X-List-Received-Date: Mon, 24 Jun 2019 12:55:20 -0000

From: Stefan Agner <stefan.agner@toradex.com>

If docker run --init is used docker expects docker-init to be
present. However, it has been removed by commit d19fda374317
("docker: consolidate common depends/options"). Readd docker-init
to RRECOMMENDS to make sure its typically deployed.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/docker/docker.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 168d296..e4ff353 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -29,7 +29,7 @@ RDEPENDS_${PN} = "util-linux util-linux-unshare iptables \
                  "
 RDEPENDS_${PN} += "virtual/containerd virtual/runc"
 
-RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
+RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat docker-init"
 
 inherit pkgconfig
 PACKAGECONFIG ??= ""
-- 
2.13.6


