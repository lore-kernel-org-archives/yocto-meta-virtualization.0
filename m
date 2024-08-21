Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52B5C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 18:03:28 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.2334.1724263405332369640
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 11:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MkpaQ6N4;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso45447001fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Aug 2024 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724263403; x=1724868203; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9g6INlsPA8nOJvrlbhTVJ3XV6zVDNAT6f7sSa0VY924=;
        b=MkpaQ6N48nydV5HjtxlB1xt9yJ3F+sId2wPGyWk0LhYNILe2m3RPMp9efaQK9EU87K
         eAwCSFfnPQ9ZLLDdTBVnbW2AvozjaQmvWNuu5D/LiT5hfMUR7MT8qo/JCJbS3F1A1eF1
         y8U8pmdKVEXJZ80FtYfDNNyrgQ8ucX1My1GY1GEv790LXA11FP+N1S7bCk0HfhVy8u7s
         6MTKIDppDmOV9Amu1Y7ZlRV5cZdDXpSAZwqbf5SNmK2FJztIqrqURlAihNWy1vFVBRo6
         8XxIM9uD5yi/ip3+lOJkG2X1++NcICMZmt2YziDzcIQDJrFbcqd8Ost2Gc22Qys7vkOn
         0AsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724263403; x=1724868203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9g6INlsPA8nOJvrlbhTVJ3XV6zVDNAT6f7sSa0VY924=;
        b=Id18jy2jgRG/EOdQMWJX7xz4N9s7xzjRqbt6UtYEVhdiuq5w/UwO8X7pyvbJ+q9Oyj
         mnkgRLJW9mR0WhT/DuL1xJ0oUtY4kXqTy2RINwiNN72JOo1Gm/+gqkgfGs/B7WFa/tDD
         XUqg42wcO5BJw+Ud9/1Et+0419G7ZnE1Vk24qOdUCDfo3L5wqmdmg525POoj4uDKU8Fs
         CxMCR1zUn8O3+TU8jWwJ1n+ttrcwVPKSp+g2qnmCI1X9L4TXYWoTY9aNuQPLVoa4fPss
         HAnpUp2l5owvPQEl4sUpPenzdQcmutfebHocv6Gw67BrqEVsyttYmp7A65j/RRd3Behi
         YpVA==
X-Gm-Message-State: AOJu0YwkRc7WYCdVCi8ivgsr/fHAuMQXEAv1PsTU1CFmjEzrYXH1VE6a
	VjVJ+1oG3BxrwmiSIJKiozR9aTn3bDOBKMBfTJne0aupjbCV5xtOyVVu0w==
X-Google-Smtp-Source: AGHT+IGtxA+dPfVm7gs6ntRr8X5iQWXCQ/lwamp+jNjZfyZixja3vhoNflHye9hp65orIztqb/AKKQ==
X-Received: by 2002:a2e:9b56:0:b0:2f3:ed2d:a944 with SMTP id 38308e7fff4ca-2f3f88471f0mr25329791fa.15.1724263402600;
        Wed, 21 Aug 2024 11:03:22 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a867b536994sm100335366b.151.2024.08.21.11.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 11:03:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin2.jansa@lgepartner.com>
Subject: [PATCH] linux-yocto_virtualization.inc: parse MAJOR.MINOR version from PV not PREFERRED_VERSION
Date: Wed, 21 Aug 2024 20:03:06 +0200
Message-ID: <20240821180306.3585791-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8863

From: Martin Jansa <martin2.jansa@lgepartner.com>

* it was introduced in:
  https://git.yoctoproject.org/meta-virtualization/commit/?id=a940a0e873f9163d4585555b3f3d38e99400d237
  but it doesn't work well when PREFERRED_VERSION is set to e.g. "6.6.%",
  you remove the '%' but not the trailing dot, causing:

  ERROR: Nothing PROVIDES 'yocto-cfg-fragments-6.6.-native'. Close matches:
    yocto-cfg-fragments-6.10-native
    yocto-cfg-fragments-6.6
    yocto-cfg-fragments-6.6-native
---
 recipes-kernel/linux/linux-yocto_virtualization.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
index 88a1fa99..e729c3b2 100644
--- a/recipes-kernel/linux/linux-yocto_virtualization.inc
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
@@ -34,14 +34,9 @@ def distro_cond_feature(feature_fragment,distro_feature,d):
     return bb.utils.contains('DISTRO_FEATURES', distro_feature, ' ' + feat, ' ', d)
 
 def kernel_meta_ver_depends(d):
-    import re
-
-    t = d.getVar("PREFERRED_PROVIDER_virtual/kernel")
-    pv = d.getVar( "PREFERRED_VERSION_%s" % t )
-    pv = re.sub( '%', '', pv )
-
     yocto_enabled = bb.data.inherits_class('kernel-yocto', d)
     if yocto_enabled:
+        pv = oe.utils.trim_version(d.getVar('PV'), 2)
         return "yocto-cfg-fragments-%s-native:do_populate_sysroot" % pv
     else:
         return ""
-- 
2.46.0


