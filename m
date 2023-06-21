Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B619EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 10:47:16 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.7754.1687344432195062073
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 03:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZLehnFAD;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9891c73e0fbso357536566b.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jun 2023 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687344430; x=1689936430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xBluk3mAbgpDP9j8pIBBHXP69Wp8Lq0Q64xf0d1arZ0=;
        b=ZLehnFADK6bfUMMeXnEIDoPOG8pVb2NH2j2e4XjonNLJIQVlfS4m4m00xETtG4NldG
         4yfJiaxA9f0bz+ftfmsh1zcWeNRs37W/Mvc8mykg8a6R7EqLN4cGoCFsCqTnXHj6FiRr
         46bLEECQy7hDkRKIV4WGLfsqn/KKMHj/Y+03KvZwiwNsdfTQqq8tTylv5dsthrTTUD6/
         z8mnvqq+/LkSwUyCfUCyzg86iDs798OhCueuoPRjpZ8ayq00zYQVPowv/qHwzdFPa8l/
         +NLfkjHxrcnLCgT1maojcAOVqx/8nCWozRqJHTvD34e95FaNHuDtjfZWOucyVZwECBBU
         JQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687344430; x=1689936430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBluk3mAbgpDP9j8pIBBHXP69Wp8Lq0Q64xf0d1arZ0=;
        b=AEenJ+T2+B+XCZMYOqF1j4IiAb6wjrZRSPUGJ6vC6gKpJyNL0rd19UGTtvYPCiroPQ
         gl1FWpIUKVGfBA4X7yYVUTMvE9fyJPYl8hKwztseRR4haxjQ9alFxmCslbAClOHFyPXj
         1pewXYUowLdEWI5h5gztrmKC3i28NZlAvuSCWV4tCEOfNeyu/TzuLdMJYCCcBb0vFj/Q
         cWP4RtkH3poYOGCJPKJQBy36lhkBT7DT84wKpqRQ6vXJkLjEN1JZ0jy+lxEZ+aNDO9CX
         eBVm5Am6gCUIAATAgAyWsYtyE7DAAnyvUA//onQeIUzHdd0Fl/90Yllwpz3YU6V4Kcq+
         FbcA==
X-Gm-Message-State: AC+VfDwswFyFNl5vjDk2hifSoL22WujR8Rw1o5E8sKbr7RHDArKOq4gO
	kA5pIdpBeYoZPWVT+AIbKS6GDFTzYHw=
X-Google-Smtp-Source: ACHHUZ7fp8tqHJf60/mQFj0YfQqJWRc29MD64wr/NWy+1xwGfz85+XhV/xINOwbbO2B8qeCnoHvddg==
X-Received: by 2002:a17:907:7ba0:b0:989:4b:e69e with SMTP id ne32-20020a1709077ba000b00989004be69emr5433464ejc.4.1687344430434;
        Wed, 21 Jun 2023 03:47:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z9-20020a1709063a0900b00988c0c175c6sm2888566eje.189.2023.06.21.03.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 03:47:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] netavark, xen: *.patch: add Upstream-Status to all patches
Date: Wed, 21 Jun 2023 12:46:56 +0200
Message-ID: <20230621104656.2149899-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jun 2023 10:47:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8099

There is new patch-status QA check in oe-core:
https://git.openembedded.org/openembedded-core/commit/?id=76a685bfcf927593eac67157762a53259089ea8a

This is temporary work around just to hide _many_ warnings from
optional patch-status (if you add it to WARN_QA).

This just added
Upstream-Status: Pending
everywhere without actually investigating what's the proper status.

This is just to hide current QA warnings and to catch new .patch files being
added without Upstream-Status, but the number of Pending patches is now:

Patches in Pending state: 15 (11%)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/netavark/files/tests.patch                   | 2 ++
 .../xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/recipes-containers/netavark/files/tests.patch b/recipes-containers/netavark/files/tests.patch
index 254e4e9..c4b3618 100644
--- a/recipes-containers/netavark/files/tests.patch
+++ b/recipes-containers/netavark/files/tests.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/test/helpers.bash b/test/helpers.bash
 index 89866ec..017b2b5 100644
 --- a/test/helpers.bash
diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch
index 3c7a97d..7ac1a39 100644
--- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch
+++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
 index 4963bc89c6..c1c05eb421 100644
 --- a/tools/pygrub/Makefile
-- 
2.41.0


