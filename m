Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C533BFED3D8
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 14:42:29 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23950.1777041740914830115
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 07:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OmE8Ii27;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82748257f5fso4779532b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 07:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777041740; x=1777646540; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SMzysaWKmiKNKTxU+0dK/A8HCj8v96rAW9mAH9ooGCc=;
        b=OmE8Ii2717BmA0nw7jpsSoqIsWy+pzDyxByURW3mLfQaK5RXyKzmtaDXR+y1G0/F9e
         tW9Avp11f7wvFetch+wgOqgyZSQU0tShCuI2R6qqlO9tERarl2kLQyyJibt5qMnAtGZB
         elORbPpzj/BsOVr7kgK9P06YQDp3/DxuZjVOVk7sQMVozuJrOddTR9CJpNvGKxkypaee
         sijqYa4vwlUJdCW9yqnAUQMvHtqgxUyzmR9Gi6mLw67Wk/KW3Okvh6bGLxQVNpFDsi6P
         ApN4JE4ntxqYosGdGXv0/YjACBqzVNLFHd0uQpJrjH1iyn9rn1fbtAPyqk6ghWi0S7HX
         a8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777041740; x=1777646540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMzysaWKmiKNKTxU+0dK/A8HCj8v96rAW9mAH9ooGCc=;
        b=edRyi/zTUDeZKOXkQHb+GiLDk2yQzrnE+13bQ9tNymdMubkOxjrml3+Uo1RikGgJay
         vTBmyk/t1nA1l5QKmB3jpf6uGJGjxoWBInpaUqGxH7q/rEKmQOF8d9Nr1LHgttvX4AZ2
         t7YqAZyd/E6pwnzbnQB9vPybzegqd52btqje+QaLycvc1xrfmCxF8M0IRsyvx94NZTxs
         dkPwPf93b9lC9bXLYBv13n7OgFjD+rQ8XLnCwGyAYYViHgB2zjU/wam44eaFcsdQ1uEX
         S7p+LjTzCXmGgHvZ+jlRZiZwjPR0M1zXCiOJC/9ZzcWwUGmegudlRf/JrYn5yGBIJXXA
         0p7Q==
X-Gm-Message-State: AOJu0Yypfo1VRem6kHUu64fihOAgByH1ky42eThSlcjzuE6FFupT7ZfU
	f0MIjHtuFmUC03l7e6DVVUHsgXaB1aPhjvNF3vtXhlWp7JFlYkYefJvu2QmFmLBQ
X-Gm-Gg: AeBDiet3u4bEpSVNPVe61UFodbDuSrJ5FD/PzK7axMNT4kKoy5JAJqdlEpQmcqRl/PD
	oboTucQd1kwLbM0cFIC6glOkj1+Cjadxc7WyYACtMIX9mCScF29a0xw8cCkwi1Pyev/u/O0MmYU
	/OSaY0yiIs+H56TjQ0ibp5viFOUqvD052UdiimyjXhWufwlenQWmj3QbObuExWTq2OYptHtL7vS
	e6UorgWfWE459il7PCG8675geelCnIom7F0/NSSqQNmFOUT8CadQn1f9odGPbuf26KYQWpB/mPr
	vmTTgQj8lLw4+bHoOgCwiPnGZLUOxReb00Po0+CBnI3WDYrc9iAkOxfeJ6trihj5O7q1onPHZ6E
	ulLDVBTTwC2KxXZhDiUrCJqiBClpBgLC1Kdg/2xzOktUHi09VF31Mv2Ef8B8tV0i0zhsG3HQEhs
	ZAEzjKUgIdZgiD2dSce8p9lICTUKO9lRgmwxsvl9MjoQp9P/hx6fuFlYLl3r8uBfr5lWIOrKrX1
	ZKP6rAR7u1aVwEwRYAk8cFCA6JtTlLa
X-Received: by 2002:a05:6a00:17a6:b0:82f:7888:e2fa with SMTP id d2e1a72fcca58-82f8b542dbdmr28880462b3a.17.1777041739358;
        Fri, 24 Apr 2026 07:42:19 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0307esm24186354b3a.53.2026.04.24.07.42.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 24 Apr 2026 07:42:18 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH] distro/vruntime: drop obsolete DISTRO_FEATURES_DEFAULT
Date: Fri, 24 Apr 2026 07:41:53 -0700
Message-ID: <20260424144215.20428-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 14:42:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9743

DISTRO_FEATURES_DEFAULT has been obsoleted [1][2].

Follow the pattern in meta-yocto [3] and remove it.

Fixes:
ERROR: Nothing PROVIDES 'nativesdk-libseccomp' ...

[1] https://git.openembedded.org/openembedded-core/commit/meta/conf?id=0548ea447445834647be7ef35ed0ae8d1d3387b3
[2] https://git.openembedded.org/openembedded-core/commit/meta/conf?id=159148f4de2595556fef6e8678578df83383857b
[3] https://git.yoctoproject.org/meta-yocto/commit/?id=96085aaec5bfb33c4e4322465eaf0af370db6fc0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 conf/distro/vruntime.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/vruntime.conf b/conf/distro/vruntime.conf
index 0ea43e62..ae9c0a38 100644
--- a/conf/distro/vruntime.conf
+++ b/conf/distro/vruntime.conf
@@ -46,8 +46,8 @@ DISTRO_FEATURES = "acl ext2 ipv4 ipv6 seccomp vfat pci vcontainer vxn"
 DISTRO_FEATURES_OPTED_OUT = "pulseaudio gobject-introspection-data opengl ptest multiarch wayland vulkan"
 
 # Native and nativesdk classes need full features for build tools
-DISTRO_FEATURES:class-native = "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
-DISTRO_FEATURES:class-nativesdk = "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
+DISTRO_FEATURES:class-native = "${POKY_DEFAULT_DISTRO_FEATURES}"
+DISTRO_FEATURES:class-nativesdk = "${POKY_DEFAULT_DISTRO_FEATURES}"
 
 # Default to ext4, but image recipes may override to squashfs
 IMAGE_FSTYPES = "ext4"
-- 
2.50.1 (Apple Git-155)


