Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02E43E00CAE; Wed, 23 Aug 2017 14:43:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.66 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 019D4E00C01
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 14:43:48 -0700 (PDT)
Received: by mail-pg0-f66.google.com with SMTP id b3so897429pga.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 14:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F7higolf52zKaUgt7BjA/qqyvrqrjmC0IwCP6pLg34Q=;
	b=GlSQXlaDCq8MtoxizjNpjAc0KyygKiqCvGvmnkL3PS0jE1Q87FqTCcY1sptFI0t68E
	ancYqG+p9PPgalUNKOCV2VRYGd63CNgD9lPNM2MymTF2FuhXDGyhuDVeO6L4E5I1+F8J
	05ILEO2LJWK9DgwFDdYJWzp/Xxy9kRIIAdWvfgPPDxNIJlUCoi3/FUC79lxNLhLd17gI
	k6CL2Kz9Ry+VMSHprVPW+qUXkSqGSNChOGD2cHWT7WNGa015Yocd3cI4DUtcmrCLDjwX
	rtqYI5vDjaCDvKPS63Q4Hwi5jjb4fAlZQ0ZYZHtknreVM6QLygdy4YhOeR9ZMSmqQ9Ry
	3VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F7higolf52zKaUgt7BjA/qqyvrqrjmC0IwCP6pLg34Q=;
	b=dNK0XsYVCCZm4eA71grbfhrPAP3NyaHCrm2e2o2XlNR0E16NSTM9G4uLP9ZX9A0B4s
	7YBV+DL5Cb9Jkg5gLHzq8m/9bB0Q1vHXWZ+JbWswTn/ZsRUVqg3CVfjQoInUumGg7Hpe
	VPRHu/Z3jV3ITZamU1gs3MynZQM3DCYjioPFEGwPH4hnhxBzGUWgOQLybVVcz2I+LqhI
	QFK+f32ZVOG0/BclLM1YuxQL58R8I/SnnMXtY893Y8rRbESoBX65pRSMKLiATE3M7wms
	drAcIFbKHZEsQQP5dnzIF6kw819WsN1fm8W44+wEJyFUcalOj0yrRH/NiqaE92Bmhb5t
	MfXQ==
X-Gm-Message-State: AHYfb5jI257Y/A4dG2ShJsEP/KLedHEoK6wsCcH1RRFRiYuGEV0LacGn
	GQOa4bntFGIeYHMeEwM=
X-Received: by 10.99.160.95 with SMTP id u31mr4075082pgn.388.1503524627962;
	Wed, 23 Aug 2017 14:43:47 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id j1sm4221243pgs.77.2017.08.23.14.43.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Aug 2017 14:43:47 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 23 Aug 2017 14:43:31 -0700
Message-Id: <1503524615-27663-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH v2 0/4] Fix xen-image-minimal build
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
X-List-Received-Date: Wed, 23 Aug 2017 21:43:50 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Second version of a short series of small patches to enable
xen-image-minimal to build to completion with
    MACHINE = "genericx86-64".

v2 changes:
 * dropped "PR" variable from new biossums recipe
 * updated commit message to explain "make clean" in compile step.
 * added code comment to explain "make clean" in compile step.
 * added original change info to commit message for SYSLINUX_CFG change

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


