Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FEE9E00D0F; Mon, 21 Aug 2017 22:08:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.196 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73D91E00D07
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Aug 2017 22:08:40 -0700 (PDT)
Received: by mail-pf0-f196.google.com with SMTP id k3so329181pfc.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Aug 2017 22:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RkM8Iznc5hnrka3SPMHxD2/NrtlalHOx9nzBbvlQu+M=;
	b=rE8MBfwIhp4nV63RatoQEMewfRDVhUM3+q69ir+xTjJ1a/QrOAiJ/jdn+OSxyPMPwO
	RWXhiddIXDw1pbP4lYoU0+OgH1d+xGa534QMwW621MgcUbeaHM5gX8i3mRkdRgu0nioa
	LmRgKRaquV7aezXnCA+tZulsyZahRpbJxSCpuz6aA4QqdzOCR55zTfnCaMdwBnEiMnQ9
	X1tZH1SRGNgU9JH880qj9Zm+Fh6g/GCKpJ6Zb+03FHgLrdXFRor9cDSadCCUC3A2E1r8
	nNKpnv2eKWUapH1WXIH1jZmG61KL7muyDPY2DInWrQ9o1oVmwa1Q3X0Fo4BfSLFhDBDW
	TtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RkM8Iznc5hnrka3SPMHxD2/NrtlalHOx9nzBbvlQu+M=;
	b=r5zs8uZbz+acrWaP4fkkaqYydSqgqXYIFKLK2FY7C3oshNuRgmffomf+U+LGQZ2Tai
	eUXtjVbBpAEmcIH2ORNzZXS6Nkc4IOhnozJ8+sicsweXWL04frrF8F9RLmmQwW2wq10V
	oyLvoe0j/2uWbUZqqP5L4+f4WedSAWGn0rUrdN972YFv7Mc6ptt0RFBl+SGNzk1WogLr
	d78A+WL7sT5H0CmgYvRZqNkepdmsVA/vNraaUjxWNuPMI0Og4aivY+QWj90iYiyqyQB9
	Ql1ObXGF1qd5h0Yky0e2n19HR1FXiDeQSp9KQsfTRLOQU7NvtR4Dpkp++R7UsU4BRL/b
	c5cQ==
X-Gm-Message-State: AHYfb5jAS3lIF4R/wduaNv9Iy8cHnKHH+IgqTUo8RED6vDnFLn11O4hq
	q17lZHPZrz3ESVj6Cj8=
X-Received: by 10.98.67.68 with SMTP id q65mr18819825pfa.175.1503378519546;
	Mon, 21 Aug 2017 22:08:39 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	b81sm10696128pfm.62.2017.08.21.22.08.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Aug 2017 22:08:39 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Mon, 21 Aug 2017 22:08:21 -0700
Message-Id: <1503378503-23353-3-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
References: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 2/4] ipxe: fetch using https rather than git protocol
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
X-List-Received-Date: Tue, 22 Aug 2017 05:08:41 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

The git protocol isn't responding at the ipxe fetch source;
https is, so use that instead.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/ipxe/ipxe_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index d52c567..c0c8a7b 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -8,7 +8,7 @@ SRCREV = "8c43891db4eb131d019360ccfb619f235b17eb58"
 PV = "gitr${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.ipxe.org/ipxe.git;protocol=git"
+SRC_URI = "git://git.ipxe.org/ipxe.git;protocol=https"
 
 FILES_${PN} = "/usr/share/firmware/*.rom"
 
-- 
2.1.4


