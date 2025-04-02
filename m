Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1EBC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 16:19:02 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.13267.1743610734332403936
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 09:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nnt7sGez;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso1254346766b.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 09:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743610733; x=1744215533; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NKaLjKoP+8+YU64TkwY0+hf6uGQdIki7QFIsnpnIJjc=;
        b=Nnt7sGezCtcPGpbMcK3+TcRhDibcda6UtNnsQYgfD2idXCHuLydasg8cJpEJU9W6yH
         fQn/l/n4Z33IqwUGQtbODs75Z0ZSWfmzqgHg/ZN6ORBx6Y2K4OvEiKpwHn+uU+s1WUW8
         9MQjIxnPqYD3FaMbTRGzqLq9JnTYMmzD4yQdrLbmEG2jlyf5zYHVMvoJ+97xOs28KHz9
         yANmdDwcOeeZmw5wZEQEeyaSLiMh+rKt3aP6CWVWCfv1WRzZ/uFlp5bQFkmysBgGlUxt
         N5tpR7LEIRUo77/f5prXB2pBEOkQjLVQarMSqBO+/l4lehovxKWBPaLN/TfAIxz+/jWn
         gHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743610733; x=1744215533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKaLjKoP+8+YU64TkwY0+hf6uGQdIki7QFIsnpnIJjc=;
        b=M2Cgkm9HwmI8vaYJ7D3Mrqd+qGPkBehYDoKlaQueCb/2R6u/W51LQ7ME/ctJruj+ty
         TdAJHTmEo3OBTZI+p6P07uY6LKk1uqVwN2xEMcZhbUpFeFOwH/XIqP65uED/82bBUPO/
         gWS/JzQTI4RXk19QadicbVgltZ4mvZDnvdzD8qviw+AfdGNYxJBa1AExQ5HOgAvUDOYf
         vt2Blc8se14jPb2oRsDkTICpPHM7iSh82P1HuFN9Xr38ex3wvHlCp7W2+/40wSb70Cl/
         yWQjYiaUPay53ST4XU1QB5MzD9ktlELAUFo3KxnEZEIXjr4syX2ITdsnKZBmogSfG1Nn
         6K4A==
X-Gm-Message-State: AOJu0YwzLCdjUxFzMVmt3ZrhlRHtmzVJh5/XHjmlIwTYU3CCUIb+X3dH
	oo3AGfL0ULmIL64WGdbQwDrg/0Lrc/Yx9+IH+ZoPNWlUbJJekuJm0xDcv2cB
X-Gm-Gg: ASbGncsmpEhQV/Logp6UAZHsESm2fIO6aYJKaXhVMhWhzp/sxjGNWa7WHCVf6S+hj9w
	OBbnh5RZ5IjnWYNvBrQb5Gl31SvTmv7OzVIr72eyV15Ec7vnG3b4SXZfHg1UhsTbD/JFXqV4gg8
	4ezolvTbjP9XlpLekna2/TwsH0ginZO/iT5qoKPxqVilc6k2RdeLA4Jnx5JxRHdm9SBmAut+/Gs
	rM/w9k6GCZYnCYu8UEa//6VIozFghsSRZSdz3jeHzah588bK3NyJ0GAs3NFoFpwTMQ7brcjwYF6
	3RadsP1CbL41Wgn+NsfokL4XempoKUUbN7UKHrQhGSI+0FA=
X-Google-Smtp-Source: AGHT+IFRpClyZ8fSgYcFHz60P45poUwNW+x9DT/CaIJEWeYXkKTzCefr9ewbA2c3FsVc+DcqD1hAnQ==
X-Received: by 2002:a17:907:3d91:b0:ac7:3911:35e8 with SMTP id a640c23a62f3a-ac782eae54amr657199466b.60.1743610732616;
        Wed, 02 Apr 2025 09:18:52 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71961f8e5sm944142366b.96.2025.04.02.09.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:18:52 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] netavark: add whitespace around assignments
Date: Wed,  2 Apr 2025 18:18:47 +0200
Message-ID: <20250402161847.3620596-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 16:19:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9196

From: Martin Jansa <martin.jansa@gmail.com>

With:
https://lists.openembedded.org/g/bitbake-devel/message/17508
there are WARNINGs like:

WARNING: meta-virtualization/recipes-containers/netavark/netavark_1.14.1.bb: meta-virtualization/recipes-containers/netavark/netavark_1.14.1.bb:25 has a lack of whitespace around the assignment: 'PACKAGECONFIG[aardvark-dns]= ",,, aardvark-dns"'

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-containers/netavark/netavark_1.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/netavark/netavark_1.14.1.bb b/recipes-containers/netavark/netavark_1.14.1.bb
index 43e33fe6..13149cdd 100644
--- a/recipes-containers/netavark/netavark_1.14.1.bb
+++ b/recipes-containers/netavark/netavark_1.14.1.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG ?= "aardvark-dns"
 # https://github.com/containers/netavark/blob/v1.1.0/DISTRO_PACKAGE.md#dependency-on-aardvark-dns
 # The aardvark-dns will be installed by default with netavark, but
 # netavark will be functional without it.
-PACKAGECONFIG[aardvark-dns]= ",,, aardvark-dns"
+PACKAGECONFIG[aardvark-dns] = ",,, aardvark-dns"
 
 inherit cargo cargo-update-recipe-crates features_check ptest
 

