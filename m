Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D9FC7EE2F
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 20:48:13 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.17769.1685220484395703697
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 May 2023 13:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WguYvMHZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b039168ba0so361475ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 13:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685220483; x=1687812483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzK88D24LDITISX7XMA9W+5QKSvHWzlQwr27hTRy8EI=;
        b=WguYvMHZEzZ8Yo060ilT+RG8BUut6Iv9T8o+kKltl6to+DA4OA7a/WpY1xqarKc6x9
         taAVsOtnKmtTHgUxC/wpWFcRa3JcgXMvN5WQKIO7zwMQvLx0r3t+kWhbqTd/r/wxLEXz
         RKANCdGIpL4/we1i/ov9OsyP5osTNJO7AYA3f73wgS04qKD6U+Fr8ELiPGipV6Bc+ujI
         s9lcBiaIbO8KJJYoJSse1BvCOGYswmlq2Wz3b4njufZFGoKqSDD6AyPH8+79D0S+rmDD
         /zyl0npYlK4R/gmVa7I7QVKg3LseiG7IfqA7fLzDtY/ujS4JjcWSSw162heE9blSEu9K
         k7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685220483; x=1687812483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IzK88D24LDITISX7XMA9W+5QKSvHWzlQwr27hTRy8EI=;
        b=iz8FJKms0rpbqFIncMZZ9vLWdPUqTzSaNJ+jRWBJ8tECyvOAwjww9rVc06cDtwNpN1
         FJxDCLG4VarHmiXG+O712UH2F+sMKEZ8OBS2VndsagPd49JVODNALfl5Usic6CgTrq4M
         1P5jrHBB3oWnU0+h30C37yT0kwG38YRCnXO8kEHg5SeR97oHEvEA3c7PcAgxfe6kU02f
         /6D+dd3nZ26uVW0jntyG0UAUH4r2/LQUPyCwOYqSdcR+k/0NSJ/FGJtvQAR1kCQ/qkg6
         f5CBIq8J9SVaPfv9HDrDEGrx0tQzYhTRjre40L59qrJsFU4aWbOQ/LagybrHxkFnI3oG
         kyDQ==
X-Gm-Message-State: AC+VfDztOEz5rwTeWcwOAzhpfYW/DExsoGY9MC6tui+jLVM+S0aFpVlr
	6ceB4jDEbfx0I/RwlcVWY9WojO+tAvo=
X-Google-Smtp-Source: ACHHUZ7xiH6F0vowCCM48a4O+o9c7HoHNF4r/MCS/q55jsagxl9xYy4v8pr9Xwt6pd1SUKPm5zexaw==
X-Received: by 2002:a17:902:a414:b0:1b0:46c:9944 with SMTP id p20-20020a170902a41400b001b0046c9944mr7083352plq.48.1685220483366;
        Sat, 27 May 2023 13:48:03 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id jd15-20020a170903260f00b001b02881081fsm1507870plb.156.2023.05.27.13.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 13:48:02 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][PATCH 2/3] xen, xen-tools: Update 4.17 revision for gcc 13 compatibility
Date: Sat, 27 May 2023 13:47:52 -0700
Message-Id: <20230527204753.1385743-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230527204753.1385743-1-christopher.w.clark@gmail.com>
References: <20230527204753.1385743-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 20:48:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8081

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
Compile tested for qemux86-64 and raspberrypi4-64;
posted to fix the build with the new gcc.

 recipes-extended/xen/xen-tools_4.17.bb | 4 ++--
 recipes-extended/xen/xen_4.17.bb       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/xen/xen-tools_4.17.bb b/recipes-extended/xen/xen-tools_4.17.bb
index 8d9effa..b58d759 100644
--- a/recipes-extended/xen/xen-tools_4.17.bb
+++ b/recipes-extended/xen/xen-tools_4.17.bb
@@ -1,5 +1,5 @@
-# xen 4.17.0 release sha
-SRCREV ?= "e4a5fb9227889bec99ab212b839680f4d5b51e60"
+# stable-4.17 status on 5/26/2023
+SRCREV ?= "47eb94123035a2987dd1e328e9adec6db36e7fb3"
 
 XEN_REL ?= "4.17"
 XEN_BRANCH ?= "stable-${XEN_REL}"
diff --git a/recipes-extended/xen/xen_4.17.bb b/recipes-extended/xen/xen_4.17.bb
index fca9979..9da1b19 100644
--- a/recipes-extended/xen/xen_4.17.bb
+++ b/recipes-extended/xen/xen_4.17.bb
@@ -1,5 +1,5 @@
-# xen 4.17.0 release sha
-SRCREV ?= "e4a5fb9227889bec99ab212b839680f4d5b51e60"
+# stable-4.17 status on 5/26/2023
+SRCREV ?= "47eb94123035a2987dd1e328e9adec6db36e7fb3"
 
 XEN_REL ?= "4.17"
 XEN_BRANCH ?= "stable-${XEN_REL}"
-- 
2.25.1


