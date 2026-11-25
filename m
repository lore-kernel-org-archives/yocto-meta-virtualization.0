Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2469.1795643603447783219
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 13:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=x8nfNKEI;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b413997581so4931380a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 13:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643603; x=1796248403; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mj4KdHeUbjctenQPbp2CdY2L2ejHVsxGmu/JzukBrqU=;
        b=x8nfNKEIlpiISKRTEUwFR2uj5A0C9Q1EdIp0tJEx9LHVSKrnhADqlJo1tm5TvFU3XF
         ViBwDwArgUHRUb5RK1p+Q7QM746QMw2NdxLxIhKJOzM9jrTkJewPl0KfYWWya3vvs6BO
         7MITufmD6OJeKyFdOeH4zrjto7Veigs/rh8jR3hX/eY5lQPculWPiboVS8xbxtL0iIfP
         bTF6stTOOKPgUxV616jx9P0OPe3UzNjKxcOKOAZzhIsX5Uw7CPXA2TAol5RbXupBMz0w
         3bNRqO8nxzionhx6brJU5EiuBZvXiXJ4KP7yxxfKYdIC+1jARimaiAS/O25GyRJvlSEU
         Z2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643603; x=1796248403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mj4KdHeUbjctenQPbp2CdY2L2ejHVsxGmu/JzukBrqU=;
        b=0x2enRyhD1BSVZnsG52OfPS0qz3+mrvA3IFZzpsA6y8CF9C7obQr5cOwuAo9NXIKIP
         VIrPgWJk8HK4VHLqrOcnS06NNXwof5DJxE0erDDkzpuLwRNIvfoLApHRhnhX9k0+iaqr
         Opd88XDBd2PikJPEBysbTp3zQrldEte2X/2RzxqgeyFNyt3OpnZ0D7Tlgr88uEz/iyeu
         QJztDpW4dipje8NfqYtbhyRASwuI42RW2OW3dNmWg/NlKi97nx5f0N3EBT/YtqCYfxjW
         tBXrfJrDnrrNwvBLQ1/1daAbRqRjcYfthrvPtMjBaHs8INkhu1N36byEUR40Aj1wTuOY
         excw==
X-Gm-Message-State: APuU4Z/PbR1xsfOmXattYlIfnE+qGrmb1HgsR8s35EqnnWjrlRV1h2SY
	GexfV9m1ZPHjRaGMLOckHvH/tn2irtFpGd8DjiVVLEX9zTMfS5Hkcqwg0UumllEe
X-Gm-Gg: AZFdTZdGyyteTBwVCnSmxSae/+qVVGf6DAGDqI18a2wsLaTmC6WQvPeHlMF2h0GNz7H
	Glr3DGAp44g+Ul7Q5ghjjpNpAndq1dUgkheodFNThGtvTFZCCCLEB2z6jv/B0SkQeUaGQ8aHgbF
	OMSZUoHk0Ny9HU618In7/z6GqMRl90I7IWQi/9P9bG3WLxB0eUqNnRCPo9TxB3rl5W9+Cnxi7d5
	Z6rTxwIbb1A6IBzLUvYiok3WqWBW6hjEG4+0fShVeq4dpFjWB3i6ed3bm0xhvsYkE3HJTtiVRHt
	2ERySlpYdpJouKRWBUWOc5JIqNd2C/n3/BrbntJigYn2iJeshm8VD0S6mDWC5W8PFMJyCu7CQxF
	p3sdDImHmqaja1vW3m0xIKvLAxY2IoIHt71SUWqY84fI5RItTbhI3io+Jf4i0Gig0CAtMwurn9U
	pVRr8FF/1EqhE0SEoTKnUI/t6Ub3lhs6l5jwEpyUADkcBoN00iOyogVDMf689VA7VCH670tz3oE
	oB6VvnsofDrAfZN0zXwr3RbOIoSEedYrRm/yPQUnnVf9wOoHXDqxtRiIUDJqxNwq9gUO3HnSl5E
	3b07zvG0SqmT4afUQROi/wKJwHjMqhLzMag2VUwPSZXGMuGbSw6Rg+ZlDV7+jJ3ib92Mrm+1R5u
	vRvxEWxhhhiuz0i2c15qvNEay
X-Received: by 2002:a17:90b:2ecb:b0:3b0:accf:5c66 with SMTP id 98e67ed59e1d1-3b41c989fecmr16599439a91.49.1795643602717;
        Wed, 25 Nov 2026 13:53:22 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm13834120a91.0.2026.11.25.13.53.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 13:53:21 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH 1/2] xen-rpi-u-boot-scr: fix UNPACKDIR
Date: Wed, 25 Nov 2026 13:53:06 -0800
Message-ID: <20261125215307.73937-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 21:53:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10184
Content-Type: text/plain; charset="utf-8"

Since oe-core:
f19ea21c8eb "bitbake.conf: set UNPACKDIR to just 'sources' and not 'sources-unpack'"
UNPACKDIR defaults to ${WORKDIR}/sources, so we can drop the redundant definition.

Since oe-core:
46480a5e66 "insane/do_qa_unpack: add checks that ensure S is set correctly"
S = "${UNPACKDIR}" is needed.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
index 3f83c7f8..e25963ad 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
@@ -24,8 +24,7 @@ do_compile() {
 
 inherit kernel-arch deploy nopackages
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_deploy() {
     install -d ${DEPLOYDIR}
-- 
2.56.1

