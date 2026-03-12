Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DEA106ACD0
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 17:02:33 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.728.1773334946923015647
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 10:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MIsHLglQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so1094790f8f.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Mar 2026 10:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773334945; x=1773939745; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pz4GfKRHU9iIHZc0W+DW4P0nlJXNIx9lehByR89suUQ=;
        b=MIsHLglQp/osObKdHxcMAXr8GU0+wyZTvoMduLkoj/2Ugu4NJuVWC2jxvptFAer0mN
         J4mImy9KMSimwTslC5WhWrTKViJgFjgcPZXXUIVMhktTQRmkE/2JcmqJV7aUaYji0Eal
         6HNyOXoBF5oBuPEneEGaT3a5mSIXa7moQ9gt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334945; x=1773939745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pz4GfKRHU9iIHZc0W+DW4P0nlJXNIx9lehByR89suUQ=;
        b=SIaoEhSY6MZLF0GPDl8QzKq1cEXXnRA3r1++kq4lvxw5Ng7uSb2ObiI2ZRUF6gtPep
         M4X20/zO2+ro88gSFb2MWkWAjbmCnWc2y+eC6jZGgd+ywCTnrKLaei9MPmvlvIG+8Vl3
         Gp+0WMDsOW2Y+2twFtyqucCVQsxPOhagJieIQGjag16O5h26P7ATdf2g5pFfYCluh3Jb
         x/EH1rfGksk0X52GkrG+Xp2lexAVag2m1tBtblp71laUwWf24PurP7/LhZvknk6e+rZq
         +enGW9XuVtbGxvS3FO7L4U4qt4HXc7ubt2bPWSL2y9rBr7g5fY3xbrwFa79Why8dDj6x
         cuUQ==
X-Gm-Message-State: AOJu0YwTzU/Ddmtym5vgunNzO1ZydDtj7QMi/WSsjERPe2yJ/EocYIBj
	uIaFUd3kSlBPTRBGJ1z7nkix9R4Pqw5onMOk/HKNd/06DoPF6Q0GpAgXpPFWNTj6rQQJoo6WCug
	z2AZmw90=
X-Gm-Gg: ATEYQzydUD6bHIohIs8caUOfqvngx0wDJaVtxgqYaofZphU8cwj0oafwjPGZyzIGfzg
	JMUPHB1P1NVLk7VMi7MVkkZHAhSjKAqRXSPaeNnBmX+E1XATzipVGCT8hmO9YVMpvldxrIccqPl
	5jxhpqulN68iP6Bru5BPAyr1yhPOp8iQdli1I0pKKF7AEiB9PirOPwfiBaqop71OgPTJa2+rbLQ
	+0FmnuLWnA1T7/ePdIDGz07cSfhTsJiq+MKa+hpUO0lTBuHXSUOBZaTe3LXrJLrs1F5nxx5AjId
	aiFiH+2SWCClk/NdMQWCxdhOks8DcuaznjYA/ESf01dnJ7arlPFvWOlhiY1hUmwx6DoeeBi0jG8
	7buhtTAUEC+Qsg9MwqO03FMP9hn552Zp3UbxbDNhODOtmOLfoEDM+akSDsC2xFxjHwm3KV3dOH5
	g1ySG1vICrVovR0vUKVH8NI+yIsVc7w0ITxnuGxeEmc2ie7WY19A==
X-Received: by 2002:a05:6000:1acb:b0:439:b619:33b2 with SMTP id ffacd0b85a97d-43a04dba1c5mr683834f8f.43.1773334944186;
        Thu, 12 Mar 2026 10:02:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:215f:5162:d0b:8f1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm2535059f8f.36.2026.03.12.10.02.23
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 10:02:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [PATCH] qemu-system-native: Tweak whitespace handling
Date: Thu, 12 Mar 2026 17:02:22 +0000
Message-ID: <20260312170222.3678984-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Mar 2026 17:02:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9649

Avoid a yocto-check-layer issue:

   qemu-system-native:do_recipe_qa: 05c723e48cb4253cb80f1e5dcb63767b266c72cf8a83d3d7ff36a6622e43eb50 -> 7f42888db4f5572303288c58ad79c5267fa81da05a3a71288f91f309b50ed614
      bitbake-diffsigs --task qemu-system-native do_recipe_qa --signature 05c723e48cb4253cb80f1e5dcb63767b266c72cf8a83d3d7ff36a6622e43eb50 7f42888db4f5572303288c58ad79c5267fa81da05a3a71288f91f309b50ed614
      NOTE: Reconnecting to bitbake server...
      basehash changed from 1b770ad4a9b79d38c928331d17651d3d66a6ebc45822c336d7ab98bfa8ebfd94 to 6bc5e5507534603aa6f6ab862ab27ef9c0b9ffcfaa9922d7ef25cb563fab6ab9
      Variable PACKAGECONFIG value changed:
      "fdt alsa kvm pie slirp png pixman sdl     virglrenderer epoxy  {++}" (whitespace changed)

but moving the whitespace into the added option.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 recipes-devtools/qemu/qemu-system-native_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/qemu/qemu-system-native_%.bbappend b/recipes-devtools/qemu/qemu-system-native_%.bbappend
index b04b6934..1b77db02 100644
--- a/recipes-devtools/qemu/qemu-system-native_%.bbappend
+++ b/recipes-devtools/qemu/qemu-system-native_%.bbappend
@@ -9,4 +9,4 @@
 # The layer.conf propagates virtualization to DISTRO_FEATURES_NATIVE when
 # vcontainer or virtualization is in the target DISTRO_FEATURES.
 
-PACKAGECONFIG:append = " ${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'virtualization', 'virtfs', '', d)}"
+PACKAGECONFIG:append = "${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'virtualization', ' virtfs', '', d)}"

