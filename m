Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB442EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 12:26:33 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.6512.1687782392784964975
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 05:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bJ79YJfK;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51d80d81d6eso2453396a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687782391; x=1690374391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tdv349jti7g4REK7EOmOmP7Rx9pZiLtU0Befmso9tpQ=;
        b=bJ79YJfKbKPUcPyospxVwaw+95E+eFpks0sAgm2PIaduyYKN/GTGj1QMdxcBrnMRoF
         B0mXy+Dq4juSFrrjwWEwvjHJ84AXw/qGhu+zKLkrBUdX3d4hDZmhdnIVju3ef6JAYqzd
         BZ3Hqi88IweYk+6F0n8x/XFA/zAXVoY27xfqWarvm279VZgdyVGNYbufEZoXtYLScKWC
         g5T7yohjblMOiEruZhtHUNFfvDVjgNds9uwns1VOhF/U7tSQMv5MZn0sZLLXeCh5fsH8
         VOeYXRAh45BZVH2v7T//aBp3dvXSNZTqutewF3cs5a0LakwALQcyvul4vqgK4jduinGc
         AGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687782391; x=1690374391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdv349jti7g4REK7EOmOmP7Rx9pZiLtU0Befmso9tpQ=;
        b=bPDmoJTMvGMGnIn6ajul3j1YuK4xXGZ7ZiVdBvSlcK7mlKjI8pJSZPwdb7YEZn8a7x
         eTKSeF6FIWrCuQMqaN0JShBlHHGdWUJFXMCwLIftb/xsFY9yl/9O/hu8h0N2VZg3pUXq
         Vzd9jhEUB3y6hN34YadgEaoCnuDOOGv5hBbLZZSRfMIzkQqm2kSLB+SqnqtVyNkHrlFK
         jhEJ0mh2+0T5Xf9O92jC1bOCc/iL5TZE+wn25vwur6Xr/bHBX2aglWc8Ca7O0x2bFfPZ
         0ZC+libKkOqlYtyMPh/NVxvD8E5OoYCWyoEaAnABvJ3FzisvRQIU1lw7lSr9lD2tiI0s
         mIVA==
X-Gm-Message-State: AC+VfDwAv+K7ptGoiIw1GvXM+9DBOvj0Dg8/0SBDFrzYKyysFQKQEkSd
	GH6NizZLJeb+5o1TBcuO6SM8UT5NLe4=
X-Google-Smtp-Source: ACHHUZ5bDHE19xG1XIqpOXwqs+t0bTTobJ71WY2mj7kKQNgXx/61Lidqe/UCG4zx2SMsApGUM++o+Q==
X-Received: by 2002:a17:906:5a59:b0:98d:f11e:4816 with SMTP id my25-20020a1709065a5900b0098df11e4816mr5126419ejc.29.1687782390893;
        Mon, 26 Jun 2023 05:26:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l26-20020a170906231a00b0098dd751b965sm3137262eja.182.2023.06.26.05.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 05:26:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [mickledore][PATCH] libvmi: add dependency on autoconf-archive-native
Date: Mon, 26 Jun 2023 14:26:10 +0200
Message-ID: <20230626122610.2729201-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 12:26:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8109

* since https://git.openembedded.org/openembedded-core/commit/?id=571132415ea7fe2d91c62948f2b6aa553eafa83d
  this doesn't get autoconf-archive-native dependency and fails with:
  http://errors.yoctoproject.org/Errors/Details/708195/

  ./configure: line 14424: syntax error near unexpected token `-fno-strict-overflow,'
  ./configure: line 14424: `  AX_CHECK_COMPILE_FLAG(-fno-strict-overflow, HARDEN_CFLAGS="$HARDEN_CFLAGS -fno-strict-overflow", , -Werror )'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-extended/libvmi/libvmi_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/libvmi/libvmi_git.bb
index 6338b80..25d7d40 100644
--- a/recipes-extended/libvmi/libvmi_git.bb
+++ b/recipes-extended/libvmi/libvmi_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SECTION = "console/tools"
 PV = "0.14.0+git${SRCPV}"
 
-DEPENDS = "libvirt libcheck bison fuse bison-native flex-native"
+DEPENDS = "libvirt libcheck bison fuse bison-native flex-native autoconf-archive-native"
 
 SRC_URI = "git://github.com/libvmi/libvmi.git;branch=master;protocol=https \
            file://0001-Build-vbd-only-when-xen-is-enabled.patch \
-- 
2.41.0


