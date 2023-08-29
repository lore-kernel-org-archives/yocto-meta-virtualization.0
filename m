Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951B9C71153
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 14:05:40 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.18281.1693317933128392165
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Aug 2023 07:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QKhmkbb0;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so5787183a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693317931; x=1693922731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/dCmgpbvmRkMxk3kNRUYhJLUUfjSkUxd+VQdOKvlC8=;
        b=QKhmkbb0GsncgbHyu+ufphrHTyiSD5p7oWt6Hni+QOnup8MkLHZg8RRJucB8FfC7TB
         Cj9fiH1VeF+KMA96Hrp4zKFZHYHeqNpjVi/IJkqCNVVkPooZDBPXNS1RbMG5K7lTkkq6
         4rtea2dKLlwBmkVzv5VYDX/a4npUR1dYqyj6jXWRQptfqc3GZALpnVZbz3gCGzSU8AyP
         EfuvqUaHeDV5USgikfL+zOwZ3Uu0eAz872goJs9ygM7gAn9lw7OQqMhYace1A9yitw6/
         5u73MPpfRp0S3ixYpmKFuzUIwVZ058IsFdKc3xks42Ebm0w9ewxwr6buvG8Z7GBBdKZd
         HCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693317931; x=1693922731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/dCmgpbvmRkMxk3kNRUYhJLUUfjSkUxd+VQdOKvlC8=;
        b=Srimq5NNRlMzOTzr9ti3MfeyNkiczLbc5jJvFH8hKGZNQ8cTgq3BH7ByotOH4o2nBo
         GoqqPYBvdCUeFC0jk8h3/YFQwEnVWb1VIFQES90VtXaLxfRU0SsEENw5rFDtMNs8W9jA
         VmSa7CymGFipECTxp2FiX+GI6CiPUzj2GcL8tcQVFQ+AoP6SeIODudDvEzSbhbCh2Qsu
         jkA6/Zp5NBum0py3rz5oR6op34/4hFvWAFBzdYo/k6bvDYsifRRUBM8g1lJAu8z4cL8x
         omR0r8xfe8YzZtAoKWLcQB7YKOpTPRPkolXB3tPFKUahaX6HTb26DOZxV0lRKL2ePdqR
         JTYA==
X-Gm-Message-State: AOJu0YzCVa2vItfkbX+syZn+bNE9yFQ0+sq9pMgMQeIjNUdNysMm1Q6L
	WmAotts6T4TX3aFcvSc2W26jZwSwazE=
X-Google-Smtp-Source: AGHT+IFW+1Kj5udlvEvF7p7mRVFJuHBaa+ENwOh2KzRdH1BhB5DpwrlxtX9048F4/0HdSjn3bb1iZQ==
X-Received: by 2002:a05:6402:380b:b0:52a:6497:d02b with SMTP id es11-20020a056402380b00b0052a6497d02bmr5786189edb.16.1693317930523;
        Tue, 29 Aug 2023 07:05:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b21-20020aa7c915000000b0052540e85390sm5649932edt.43.2023.08.29.07.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 07:05:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] go-context: add CLEANBROKEN
Date: Tue, 29 Aug 2023 16:05:11 +0200
Message-ID: <20230829140511.1932772-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 14:05:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8261

* fixes:

DEBUG: Executing shell function do_configure
NOTE: make clean
make: *** No rule to make target 'clean'.  Stop.
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/go/go-context_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-devtools/go/go-context_git.bb
index 132da98..580463d 100644
--- a/recipes-devtools/go/go-context_git.bb
+++ b/recipes-devtools/go/go-context_git.bb
@@ -30,3 +30,5 @@ go_context_sysroot_preprocess () {
 }
 
 FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+CLEANBROKEN = "1"
-- 
2.42.0


