Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7934BE00CA6; Wed, 23 Aug 2017 14:43:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.83.66 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.66 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C6B3E00CA6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 14:43:51 -0700 (PDT)
Received: by mail-pg0-f66.google.com with SMTP id m7so891304pga.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 14:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i3obOeabxLEVGbAVChmBm3bFEdo9apB89VawRETyQmY=;
	b=rJg2tqVpR9RDH8ikiqKbWqrCXKJMH4f9WytUprQ4q7IA2jFNJE+6XlJCEeL4HYp3Dl
	yxfZklulsrvHJx/3hjAgeBojfewAXFLxo2+dCymLV2GEojja5q+ekwkqsdnKW7gEfVD1
	1HCCwxV6buVGdZGw7jiDb+TYi1pJ3t66KHe3mCCiHjRwlxAg6vGsXkuOUZO3H+KSwKhZ
	Kx/oFt1MDNXP3kpO21vt5/1h7DO24OXdHCBIVX711tWQI1c+3iwJ2Q7d4VP+ygBFimZa
	cHzwyQqAC61k7+eAcTX2XkcWIVBqWUmq0+hftSwXW3uhr7J51qCsNLkYQK8+EUin5azw
	Wakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i3obOeabxLEVGbAVChmBm3bFEdo9apB89VawRETyQmY=;
	b=nt5MoQKbKm4EW/hujV/jDDx+XiOQjhxzAFkna3rMjxg3wWMoHEwwFDYtvWhrAeKnBZ
	8+q2Gs7akL6vh+0qisHM3Q7ew/FVK7XU3rUqrLSquKkZ8hMaM/hkQwyjNpLbqprZtthR
	CDPjBQ2IJOKbPwnkfmvlY2nhQu47tpifXYqq/QVib5u1xsJyGnFTys/+ISBwVHv4hTQm
	+KeHboglTQyVpgOXh1MUODRsX/YJm1ZOl32sFLBsl/xdacwbUKBnWbkxm7aq6dmmf8uz
	7q2XKtkKODUYfOxcXazNhJBEI8lp/flpFSEIJGuSrQNvjrOiMOxEZqG2kiDpB7aJY73p
	kp+g==
X-Gm-Message-State: AHYfb5gDg4DteqHiHf713J/TW2Um2kLc/Q18NtkGUNvu0Dki1NNbcj+d
	RGtlJHVVTF+jV4Yi9oI=
X-Received: by 10.98.19.217 with SMTP id 86mr4214108pft.69.1503524630765;
	Wed, 23 Aug 2017 14:43:50 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id j1sm4221243pgs.77.2017.08.23.14.43.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Aug 2017 14:43:50 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 23 Aug 2017 14:43:34 -0700
Message-Id: <1503524615-27663-4-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503524615-27663-1-git-send-email-christopher.w.clark@gmail.com>
References: <1503524615-27663-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH v2 3/4] xen : cp long-double-64.h long-double-32.h to fix hvmloader build
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
X-List-Received-Date: Wed, 23 Aug 2017 21:43:51 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Fix the xen build when MACHINE = "genericx86-64" by providing long-double-32.h

Inspired by a similar recent patch to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
since the contents of the header are minimal:

cp ${STAGING_INCDIR}/bits/long-double-64.h ${STAGING_INCDIR}/bits/long-double-32.h

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
v2: unchanged

 recipes-extended/xen/xen.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index cda737c..b429c81 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -912,6 +912,7 @@ do_configure() {
 
     # do configure
     oe_runconf
+    cp ${STAGING_INCDIR}/bits/long-double-64.h ${STAGING_INCDIR}/bits/long-double-32.h
 }
 
 do_compile() {
-- 
2.1.4


