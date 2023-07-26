Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAAAC0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 13:45:40 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.11431.1690379129980125640
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Jul 2023 06:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kc57wZUs;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99bcfe28909so30445466b.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Jul 2023 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690379128; x=1690983928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GOq6pxTiml+OzFC7WWOS6Vpkx2j3gj5FRxl+8fk2d2k=;
        b=kc57wZUstUJoYLlCrjmob/vS7hTWUzka8uD8ZeJGNyiLWD29jnt1u6jdhR77DDBNJ0
         S5S8HIaw3OttTSQyEhnLZh016AqSg/gFBZ7Z6143WFNWreciwUESBdm3yz9ReY9CwdA4
         PKfSpPrdidr9u83HUlvdKW8amycagUW3OogtbIMx+pUJRVrEWImpzwkdv9+vTyr8VHna
         bF0xekYsOLi/k3S3VV3b5bdoAZOTn3pnxnIjf8fMsFbqk4zNZeTExbmckyNlODXGHXTY
         9fwRnAcmnPfdrr2oiHALaKiFTsyqsUjJ+X2e409X+YRclIzI3X9Szsci1vmyQCAcdV4w
         B5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690379128; x=1690983928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOq6pxTiml+OzFC7WWOS6Vpkx2j3gj5FRxl+8fk2d2k=;
        b=W4fE3mgbBE5tBhf0XDc+9AisdnnDUY8/HiFdUB1jwaQMVyzY1/9csm9bgeTvUaghXi
         w1kkHu0QE0riY7QCwXl4ibDC0BORYclu4K4TGwsRRFrrSGvarP344XF5DBr5SWci+jpF
         OdHP4vF8ARhs1AX9dD4aZ34acxmAX2m1RHhHBe6Oj0uT1aPvCzgyiNEJgITvWcFyADxc
         8KwW9wI1s6feaTpgbCnzHVHyjUoJoXzLxWU2GUI42ssjz+G3uF/+O/OmJmSR5/m7lk5x
         rn0Hz+a8IZv7QkzvTg5jbZUUK0xHtRzul+WNb6Fa/+KcmZcsizfFYWse1X6DTk0Kgc7h
         eFuw==
X-Gm-Message-State: ABy/qLZ7B68gi2yz04s5xkJHDtnU7x2nVV0W3WYnGQEdKKouBtYjypxB
	ql/2yAbkxMH6KqB/UQXECNfJXgRXKEI=
X-Google-Smtp-Source: APBJJlHLPyigD3ru0HAHJlaW8EYfjjrJUTzMOeh24uFPuOeVKye0djO57JZx2ICePiaKFdo2seXXgw==
X-Received: by 2002:a17:906:156:b0:99b:49ce:b4cc with SMTP id 22-20020a170906015600b0099b49ceb4ccmr1781106ejh.64.1690379128152;
        Wed, 26 Jul 2023 06:45:28 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j22-20020a170906831600b0098951bb4dc3sm9505081ejx.184.2023.07.26.06.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 06:45:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] runc-opencontainers: use bfd linker even when gold is selected by ls-is-gold
Date: Wed, 26 Jul 2023 15:45:17 +0200
Message-ID: <20230726134517.3415106-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Jul 2023 13:45:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8140

* fixes:
  ld: --no-dynamic-linker: unknown option
* you might need to clean the build for updated LDFLAGS to be corectly re-configured

* lld and bfd are fine:

$ ld.gold --help | grep dynamic-linker
  -I PROGRAM, --dynamic-linker PROGRAM
$ ld.bfd --help | grep dynamic-linker
  -I PROGRAM, --dynamic-linker PROGRAM
  --no-dynamic-linker         Produce an executable with no program interpreter header
$ ld.lld --help | grep dynamic-linker
  --dynamic-linker=<value>
  --no-dynamic-linker     Inhibit output of .interp section

* not sure where this came from only place where I see --no-dynamic-linker
  in runc-opencontainers WORKDIR is:
  aarch64-oe-linux/13.1.1/plugin/include/config/aarch64/aarch64-linux.h:   %{static-pie:-Bstatic -pie --no-dynamic-linker -z text} \
  aarch64-oe-linux/13.1.1/plugin/include/aarch64-linux.h:   %{static-pie:-Bstatic -pie --no-dynamic-linker -z text} \

  so my guess is:
  923ae4da Makefile: add support for static PIE

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 7757baa..e411859 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -8,3 +8,5 @@ SRC_URI = " \
 RUNC_VERSION = "1.1.7"
 
 CVE_PRODUCT = "runc"
+
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
-- 
2.41.0


