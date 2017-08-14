Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6AD1E00C7B; Mon, 14 Aug 2017 13:05:14 -0700 (PDT)
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
	*      [74.125.83.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.66 listed in dnsbl.sorbs.net]
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 777BDE00B8E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Aug 2017 13:05:13 -0700 (PDT)
Received: by mail-pg0-f66.google.com with SMTP id y129so12210998pgy.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Aug 2017 13:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Rsbp71t/nFmOwMLhX7t7mwvlaMHyAlr3Nwd2hxVlNxY=;
	b=B3oreug8nRfOVgpY3kYncMv9YxXacgTFB3TRfleJkfUhiKcb8gtx7EJIqqq4xcG1mi
	LEzSbhYrFXSQodMRp+vjNP7u5xtfn49O2rtI7LNRWgNBSy+2/CK1vSBZYjzqm2CUmoVI
	3ntJ6Qe1cn3m+DSfbm62uhRQ0OawuY/VfvgesTP7K3duOKyT+84MqFLMsX0QB4tqcQWs
	FlRbu437YJ9405hu/fsAN8gVJOlffKTATs5RMi+FuXcS5YJSl9B23SERLHggM024Vz7F
	nVCgKSHAtyczS+BlOdAQBmlyCQzxrrs4SDw6noOSlpfSmPnz6JnCTEGJta2ymceBWad8
	VDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Rsbp71t/nFmOwMLhX7t7mwvlaMHyAlr3Nwd2hxVlNxY=;
	b=IFkkagHmlZMlAKJ1cTpsY01gJEJTolvteijKObCv9MFB0V4fjHBi+feGALvDizfU3d
	1SL3y6m4IdsTWuTxIOlsCUr4+8Ho/PI6Xd9h/EdHgjF+qqJ5cRF8BxjmYTBzUKgPu1uh
	UNiqBz2ABCbaiy6edOG3NhaS5OPaLjq0DvWS9gRjYACIA6dtu0qLFzK+uEA4QcTVHWe+
	xmZWkgO8gLljJjiZ2AnHwDBRAj/9pbvn2/f6JT0PWTj7ue2vAJR3+vDjdovoY7S9Zmu8
	eUKIA1dX38PoMy/g4lO/q2kR8pyO6vZtMOFDvRkJi1EMAGurTjQViU+/PAOe9Mx4hXiT
	OZmw==
X-Gm-Message-State: AHYfb5gTx7omzn1rLf9AlSvC0mtNi186zpLwn9lALOWpq/ytvebKYNAB
	r8YMOGd/5w5TTQ==
X-Received: by 10.98.63.212 with SMTP id z81mr25862238pfj.84.1502741112682;
	Mon, 14 Aug 2017 13:05:12 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	f74sm17346008pfk.131.2017.08.14.13.05.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Aug 2017 13:05:11 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: bruce.ashfield@gmail.com,
	meta-virtualization@yoctoproject.org
Date: Mon, 14 Aug 2017 13:04:58 -0700
Message-Id: <1502741098-5880-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH resend] xen: remove STAGING_DIR_HOST from the runtime search path for bios.bin
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
X-List-Received-Date: Mon, 14 Aug 2017 20:05:14 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

This configuration option sets a run-time search path rather
than the location of a build-time dependency.

Tested with Xen 4.9 on OpenXT.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index a28d474..6a0f226 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -22,7 +22,7 @@ FLASK_POLICY_FILE ?= "xenpolicy-${PV}"
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
-PACKAGECONFIG[hvm] = "--with-system-seabios="${STAGING_DIR_HOST}/usr/share/firmware/bios.bin",--disable-seabios,seabios ipxe vgabios,"
+PACKAGECONFIG[hvm] = "--with-system-seabios="/usr/share/firmware/bios.bin",--disable-seabios,seabios ipxe vgabios,"
 
 DEPENDS = " \
     bison-native \
-- 
2.7.4


