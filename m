Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8B2C001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 11:21:53 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.104995.1692012111605069468
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 04:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QAeVavte;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99c136ee106so561611966b.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 04:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692012110; x=1692616910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aR4Fh/CuDQfNWk7UAvP2/xDebeGPtTygl6ZDyucphKk=;
        b=QAeVavtesVd7pk5/MrlXR2j7XJDUd5MpZQ9WctWvgG4RqSnJ7CGHrmwC18xorj2tLJ
         S9LRzS1DzqnIZBBNHc021rVOzF3DOklQACfDuYcTIgsvRVCOHyI71T4GrmjU840ozmge
         zOf5C0V4JhS+huD5ByKFI4AYGm55i+jKLh8Xp1fcaWo4zZA2atUGsbbUsw0i+uRiUc2L
         NOVZSw5QsZFEjoosfar0aG2Q2gKpMKAQ8EUY1rg35L2zwn7eyx/rc/D2vrX9zC8UEINH
         OA4nOxtZd9WEh1NYVXLIYSMhBPFl6krnp4c2cQmhXv6FuD6TY/l03zBuAvo17Ki6Pw5Z
         zTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692012110; x=1692616910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aR4Fh/CuDQfNWk7UAvP2/xDebeGPtTygl6ZDyucphKk=;
        b=J5TSjBf+BKiK7eeXmnNRZcw/f9WwCZ3/Z4K4imOfhHZ0gb2OYQwF+ySNzQ/AmTk8lb
         J3OexUuXPF5LaD6YQZU2bpE7McC0GAinNwTyuPIM3jtHVDeSnv69Vvo5apyaVU589sft
         XQE9aQl3EWHoibfYTx3Ewo2Ni+3Y3gujEpTeWRetW+PLkYm+wGnS3NW0oTSZZLs0Ziu/
         EO+EMyQwjB9/Z6q77iFSC9YwJiEvYgTWakhwF2lriY6HN/wZ67MjJXp7kDMRCwr0hKfO
         afdtwpeNKMrb4HAj6j31XuHslWAs8zkop75vV7+3Fi9qZQvVAQHQJEul44i9ZH0aBP/8
         p4ng==
X-Gm-Message-State: AOJu0Yz4o72ZHuR7YKt7uOtwruodcNNfOEUbY6VDbIDQunTT9d3UA/iv
	HIg1F9+0ZTzkI6PAB3NrZ+rhcgMiZZE=
X-Google-Smtp-Source: AGHT+IHJ67kO3dnhF83o4ftbZBhNfiPxk5jbG23tgStoSQNx2706QJOvQxTBUABHrpSAtDq0CSqiTA==
X-Received: by 2002:a17:906:73c7:b0:991:bf04:204f with SMTP id n7-20020a17090673c700b00991bf04204fmr8133930ejl.60.1692012109734;
        Mon, 14 Aug 2023 04:21:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id oq27-20020a170906cc9b00b0099ca4f61a8bsm5565935ejb.92.2023.08.14.04.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 04:21:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [master-next][PATCH 1/3] nerdctl: fix installed-vs-shipped with usrmerge
Date: Mon, 14 Aug 2023 13:21:38 +0200
Message-ID: <20230814112140.1048354-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 11:21:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8180

* fixes:
ERROR: nerdctl-v1.3.0-r0 do_package: QA Issue: nerdctl: Files/directories were installed but not shipped in any package:
  /bin
  /bin/nerdctl
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
nerdctl: 2 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index ca4d3c6..62460a5 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -75,8 +75,8 @@ do_compile() {
 }
 
 do_install() {
-        install -d "${D}${BIN_PREFIX}/bin"
-        install -m 755 "${S}/src/import/_output/nerdctl" "${D}${BIN_PREFIX}/bin"
+        install -d "${D}${BIN_PREFIX}${base_bindir}"
+        install -m 755 "${S}/src/import/_output/nerdctl" "${D}${BIN_PREFIX}${base_bindir}"
 }
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.41.0


