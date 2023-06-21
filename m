Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E093CEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 12:39:26 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.9637.1687351163573815979
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 05:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PPyzcio9;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51bdf83a513so367891a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jun 2023 05:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687351162; x=1689943162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqhen1Wlta/s/4Jb1drQxe+Xq5ONO8rligYISHmD/7o=;
        b=PPyzcio9q9z9O3DoB+9Fee3iwQ1b/yy2FlM7hBORPd2cEAdEYlbG1YRucAyHQtwYjV
         I8qTpqo2BlMTAddSaoI7vWr0WexTZs9SmNjUvjwDZ4RT3FE0Uz73vi5cUYeWIwDc5sOj
         D/EfdXUqEu7hue2JyyKp+51vIXGTa+q2tZncsgrLPvJtiIrdtFad70oG9tvpKkEaIr1T
         hsjNwccAe8dP1TxqRd4Qds4MvtK5e7miep73FBO/PT1eWTUAkyUK6G+xYw5q8PaKOXwP
         3u6EAoDEy6p+OiiUMn67jiN/Au4Ymdh7X/UhSxJQWa0QyNqGXEw0caEP34PPDMQrJwhG
         qN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687351162; x=1689943162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqhen1Wlta/s/4Jb1drQxe+Xq5ONO8rligYISHmD/7o=;
        b=jxQRau5xvFzfvnHLQZE5B2sC5e6GhzHqlqiaCdYwtEEovtWuXcU/jOV6yfGwXOHy1o
         iQNoj9UP7OznooYj5Rbj2lmR4z90xv7uREFMWpwg7B/oxlCBMGV0pd7Y+tpw1zATKCl/
         T4Oaz++JvVm7Lcy73nVAgktdhqIAa28PwxRrpKvyiBHR+6Nt2HjcWKHgN89+GZvKLBPg
         gmVgfgB77BDJVB5fO0FmUEicNxqOu0VG+LELqjPxil/PIC8YpTFGkonyGqyrpLKp/U36
         VZ6tFSgA4lprlMjnhDKkkF4tlCMxWB8wotGZfP1f90GhqzBHQS4aysSLC0dOroPuGJlT
         qRNw==
X-Gm-Message-State: AC+VfDwAaSQBdEZK50XXbHqHNSN0P8WRltoutap2Fg2ZCLD9Mde+Yk1G
	gBEJyXPAS6r3ADwbw1lLE21qNIQh61w=
X-Google-Smtp-Source: ACHHUZ6I3GquibW0PJCFxnwdy9T91tl1ATTXYmA6l4DtGnBIozliN0C55akhsnQWlk2Lp9sdb7cwug==
X-Received: by 2002:a17:907:5cb:b0:988:7d68:9fee with SMTP id wg11-20020a17090705cb00b009887d689feemr7903405ejb.34.1687351161534;
        Wed, 21 Jun 2023 05:39:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d23-20020a170906c21700b0098296b1fdd0sm3120800ejz.133.2023.06.21.05.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 05:39:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] diod: Fix malformed Upstream-Status
Date: Wed, 21 Jun 2023 14:39:11 +0200
Message-ID: <20230621123912.2889357-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jun 2023 12:39:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8100

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../files/0001-diod-ops.c-add-header-file-for-makedev.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-makedev.patch b/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-makedev.patch
index 93f7dee..49bc507 100644
--- a/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-makedev.patch
+++ b/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-makedev.patch
@@ -13,7 +13,7 @@ since v2.28. [Commit ID: e16deca62e16f]
 And then glibc suggestions us to include <sys/sysmacros.h> directly if
 code needs it.
 
-Upstream-Status: [Submitted] 
+Upstream-Status: Submitted
 
 Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
-- 
2.41.0


