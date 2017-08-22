Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99809E00D11; Mon, 21 Aug 2017 22:08:40 -0700 (PDT)
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
	*      [209.85.192.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.194 listed in dnsbl.sorbs.net]
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E3CDE00CE7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Aug 2017 22:08:38 -0700 (PDT)
Received: by mail-pf0-f194.google.com with SMTP id w127so1085593pfd.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Aug 2017 22:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L/Bi8PxGXtQOtB2Xm6hhmKFUo1TETWoA0UB71uVpnHU=;
	b=VGSsHyT3SEuXhuQh1U4u32i4HP6uPjlSMeKWSpcFPgWxFXshKKBducljvbq9lWEgs3
	aco7hL4i4453QhabqbAH/rU2y9jhiGw2SnkZaZrjHgEZkxMi5Ib5+VHS5vb/K5aBr2zf
	AeiNJfxzz+va/66eUMTHjdBS6hXCgeTXlj/AJP0Sd/nbKT+KxFkiLnftPbXHWoW2wymR
	gVk85LOyRXfLnmSN0jwnYMMQc7Snim4GTaAmtnKuLLMf43pHdbFJ18bfdCTMWJQEErXT
	gMWgZX9Q6Xck+UKSrpgfqQDpTLR5QzhZ6+GXdd0+FqWRDlVlHdYTCpHwQSrjBNXjaayW
	ayIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L/Bi8PxGXtQOtB2Xm6hhmKFUo1TETWoA0UB71uVpnHU=;
	b=rG++vEMdtBaGldXGkEoHQ81eDvtaNtx1VMTGODjnz2fnVsTlD+uoMfTJhGm+1Hs+YF
	hA5R4gThjq11PyyC2ysTo30cvNLUHQgMWLBIdeNy8dk6RWjpKN/0uOwxREQOQfsYyoPF
	Ih1EKNYkZST5JfgIMboZl6pQWBeP9IUtltsM0FhBY9YjeKwZ0s6g3agH6ZI+PIdummk5
	bWBGE7MvAPD7S45IlqdZXVqlY0Sz+LRBxnzOEs5AVFUYzlpAOiSZ5ZddrwPUO4Xs0jD/
	/D6yDWKxlxq55Mf0X6SZJ26ADodxKiXNVXNxfdUdVcfVwByEaAXId1jniZhwRghIPDlG
	FKAg==
X-Gm-Message-State: AHYfb5hQ0lZ0SxmrInboNN6glJp/RbP+XKJaMwYk/iKWjorofP450TB5
	Qair7i3izOQooaGlkJw=
X-Received: by 10.98.152.77 with SMTP id q74mr19173480pfd.40.1503378518103;
	Mon, 21 Aug 2017 22:08:38 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	b81sm10696128pfm.62.2017.08.21.22.08.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Aug 2017 22:08:37 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Mon, 21 Aug 2017 22:08:19 -0700
Message-Id: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH 0/4] Fix xen-image-minimal build
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
X-List-Received-Date: Tue, 22 Aug 2017 05:08:40 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

A short series of small patches to enable xen-image-minimal to
build to completion with MACHINE = "genericx86-64".

Compile-tested on debian jessie 64-bit with:
BBLAYERS ?= " \
  .../poky/meta \
  .../poky/meta-poky \
  .../poky/meta-yocto-bsp \
  .../poky/meta-openembedded/meta-oe \
  .../poky/meta-openembedded/meta-networking \
  .../poky/meta-openembedded/meta-python \
  .../poky/meta-virtualization \
  "

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>

Christopher Clark (4):
  vgabios : extract biossums tool and build it separately, native
  ipxe: fetch using https rather than git protocol
  xen : cp long-double-64.h long-double-32.h to fix hvmloader build
  xen-image-minimal : change SYSLINUXCFG to SYSLINUX_CFG

 recipes-extended/images/xen-image-minimal.bb | 14 +++++------
 recipes-extended/ipxe/ipxe_git.bb            |  2 +-
 recipes-extended/vgabios/biossums_0.7a.bb    | 37 ++++++++++++++++++++++++++++
 recipes-extended/vgabios/vgabios_0.7a.bb     |  6 +++--
 recipes-extended/xen/xen.inc                 |  1 +
 5 files changed, 50 insertions(+), 10 deletions(-)
 create mode 100644 recipes-extended/vgabios/biossums_0.7a.bb

-- 
2.1.4


