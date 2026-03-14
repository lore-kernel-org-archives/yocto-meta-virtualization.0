Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA06B10706CD
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 10:31:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7388.1773484272748816894
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Mar 2026 03:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CsFOCSyU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48541edecf9so31712745e9.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 03:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773484271; x=1774089071; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRovL/PqNR2cI8lTJt84Fw1VLkACKw5hhkCPOeg4aVg=;
        b=CsFOCSyUui01w+OUwPqAevz2HjnKHM0HCTGN2xndwPgd86TJ5gTcNQlsus9Baw90UJ
         WsqwJl9kmiv9zxj+h/BBklW16qjTf6faSfulAshgozF2FADvhiZdkSffohboRNFDxClN
         xoSTp2RABIwFG6d/O9Ie/ICLH0KDxnUoswRTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773484271; x=1774089071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRovL/PqNR2cI8lTJt84Fw1VLkACKw5hhkCPOeg4aVg=;
        b=GMoL+BGpl42G/mJ8yalx0uZdms83xJCShalgaf+pOMieIs5rV+ybqOFsFTU2a6YNzJ
         upuTdtW6vqKQJRbwuBdmSt1Jfyg5k+FGmLWYFBucnOea14d1D9r72jxnV+fpj3cl7p0h
         Yd0j6EH4KkjBgm/3MU25qaiPUypqZmO8HFp9BbNvbtYUoqCp0CpDfACDUGsBDcDjnQvv
         sF9pzddmVLsgfcjl0VX7y6tGl1dG+RofSpTmlVLfxXSiFChKksf2TVtDdjkWRz43IC0g
         Kl/wwRzjpLhF2YTdAkRmBThcO8AZrtOEddBTvcqJRMRGRxPbNDAdoDOF8OYeSHECteTc
         GQGw==
X-Gm-Message-State: AOJu0YyS35gIoUwiW9vYB3dt1IkNw7oVnpub/xyJilj3FvkKcfIm6Aor
	rX08n7nQFqtmmGYwqnrJLC71eJgRDZV/Wosmqk3pMwnal4dWrgpWYgxjDIQJVFQaGxQWd/TW2mz
	IzcOQZ3M=
X-Gm-Gg: ATEYQzyoV8EGG3IZ77C6+mPsgiTr43panAk4whTm+72lCCgMjwuX99i5+XA6JeXiSV5
	b5wLaw0rCVzPT6SFVH0Oxb70R0d+K1RZl43OQAz1x5TRz/vdByqQVjZM4pgWBtQm5pvzidEvpPz
	TDGOTnLjZcKoZbhQ2RrO7wbhLZjhkX0pcfx8+Px81oDKAqiXiOAFqBSVoyMt806T4na1xA72y7U
	z2JwOnucxBWcMf7lIU5qk5iE8a7+FiQrNGeKB3O0Xzk6Z6frrmjWOcwblCpDoLD2ErjYe3YrL9L
	10wVr/9IJ6ndvtcDyDseyRSAdyDhG6ADvKGUaPz3XUlU/vslLtuIik5PeGYr5+3SbFJawpPklUt
	muH3nzFP5jqldGUjZb5R5ht6ER9uTfAG2dhWwq2mCZk2/UvMLi+egHLW4VIf1x94rpmcpbby8Jg
	JWUwbFjJ8Qzb9XxCyQAfAh8T9pyhvvo51dVffFN0MmLEeaIgqVmrQ=
X-Received: by 2002:a05:600c:37cc:b0:485:5812:27bc with SMTP id 5b1f17b1804b1-48558122839mr86809015e9.5.1773484270464;
        Sat, 14 Mar 2026 03:31:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557777ffesm59192725e9.5.2026.03.14.03.31.09
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 03:31:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [PATCH] container-dummy-provides: Update to match changes in oe-core
Date: Sat, 14 Mar 2026 10:31:09 +0000
Message-ID: <20260314103109.3942620-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 10:31:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9655

OE-Core made changes to the way dummy providers work, update the
container-dummy-provides to match them. It now needs a hint in layer.conf
to make the core components aware of the presence of the dummy recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 conf/layer.conf                               | 2 ++
 recipes-core/meta/container-dummy-provides.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index cbf95e6a..a387d35e 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -75,3 +75,5 @@ HOSTTOOLS_NONFATAL += "getent"
 DISTRO_FEATURES_NATIVE:append = " ${@bb.utils.contains_any('DISTRO_FEATURES', 'vcontainer virtualization', 'virtualization', '', d)}"
 
 NON_MULTILIB_RECIPES:append:x86-64 = " kubernetes"
+
+DUMMY_PACKAGE_ARCHS_TARGET += "container-dummy-provides"
diff --git a/recipes-core/meta/container-dummy-provides.bb b/recipes-core/meta/container-dummy-provides.bb
index 2ab42be3..1d58c672 100644
--- a/recipes-core/meta/container-dummy-provides.bb
+++ b/recipes-core/meta/container-dummy-provides.bb
@@ -3,4 +3,6 @@ DUMMYPROVIDES = "\
    /bin/sh \
    /usr/bin/env \
 "
+DUMMYSDK_PKGDATA_VARNAME = "PKGDATA_DIR"
+DUMMYSDK_EXTRASTAMP_VARNAME = "MACHINE"
 require recipes-core/meta/dummy-sdk-package.inc

