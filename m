Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6329C41513
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 06:28:08 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.9806.1716532081599555540
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 May 2024 23:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aMp0vAe1;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5785e443cf4so139294a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 May 2024 23:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716532080; x=1717136880; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpRW37jylVaq1tK85Jp+dfhjVd+L5M0w+3sZvSxD23o=;
        b=aMp0vAe1niLwQzoZzpATJxVeXkl9JyyOKtYzQZZy5rrNbn4oCmF9gMKjiWP3AFhWRZ
         gBhVPBFopBc3uFlLsdh/pbodmXRjrOtLLV3Xz3+dDvnY2CLo0AL73iP3ipGnd5LsW5E+
         bU3DMwsyQbB9mE15HcGrtvvsyRwSGG2F40oSjPsI53RmKchLnWM/1tw3/2MjvxJhOOqC
         x+72d+iv8rHIBlenPWkL/ny7xsRVu7Czk2U3AD8yR429BepFZUGISMcX2H+l8pW9PDdh
         Si7+uRyD5Q2UqDZIxhbhpXM0J4Lbb7Uy23KA/HL/h3W8YMpxJvCPd7o2PjQ2ELj+FAVK
         Me6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716532080; x=1717136880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpRW37jylVaq1tK85Jp+dfhjVd+L5M0w+3sZvSxD23o=;
        b=IcmrNdenFku4xwe9jLVnieXZ+BRQfGmQ2gyJH4574HlasqlrVA9FtPl0/WIq1Tn8KF
         f0wMnrBFOksGKD+4J0WVbkHvh0fs0EXu1rmLO3t9fgIIwvv6pfzIcu7Hx1gIE+JaAtDt
         31dEff+T3t0U208EYLAHjInoxWtMvTTua4mRFeW8SqEzXesRYDkAgFT8LENJPWf0diXB
         s6u4CQWuI9lnr99Od+3jW+gyaQJ6E+n+U7WlwgDzhaSVIUfWO1GBIjBh8SkPCQN21mjl
         EKT16xctUJFpiMFg7khdR+v+5JBsROy6HT1Hq2uvTSlYnBHmG86RyOklbmfROLSULes0
         blYQ==
X-Gm-Message-State: AOJu0YxXd9ep4rcXQpT44nKoxASuA50GRug6+aUvhOAcOyYdpsmLHBxl
	sn6ubAnFqS/aR1QZDdF/vwuKFb1XvLuZcyce/1unVVlPmwvrnuxU/jZtNg==
X-Google-Smtp-Source: AGHT+IHWmXjY4TvoSTfxfswjiUqDBiYVG5KijHJqmNqtLpFvDs3NxGfHfcfYDzNkrdJEX8aRT2wtYA==
X-Received: by 2002:a50:f69c:0:b0:578:6092:dd21 with SMTP id 4fb4d7f45d1cf-5786092e085mr4521a12.26.1716532079680;
        Thu, 23 May 2024 23:27:59 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578523d5b90sm1040310a12.43.2024.05.23.23.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 23:27:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC][PATCH 4/4] linux-yocto_virtualization.inc: adjust path to kcfg for UNPACKDIR
Date: Fri, 24 May 2024 08:27:46 +0200
Message-ID: <20240524062746.232409-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524062746.232409-1-martin.jansa@gmail.com>
References: <20240524062746.232409-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 06:28:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8749

* UNPACKDIR added one more level

* this needs some more robust solution, but now with UNPACKDIR changes
  this was failing in do_kernel_metadata:

| NOTE: do_kernel_metadata: for summary/debug, set KCONF_AUDIT_LEVEL > 0
| ERROR: Feature '../recipe-sysroot-native/kcfg/cfg/virtio.scc' not found, this will cause configuration failures.
| ERROR: Check the SRC_URI for meta-data repositories or directories that may be missing
| ERROR: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue

* fixes:
  http://errors.yoctoproject.org/Errors/Details/772680/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-kernel/linux/linux-yocto_virtualization.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
index 9a6554d1..5edaef94 100644
--- a/recipes-kernel/linux/linux-yocto_virtualization.inc
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
@@ -21,12 +21,12 @@ def kernel_cache_cond_feature(src_uri,feature):
     if kernel_cache:
        return feature
 
-    return "../recipe-sysroot-native/kcfg/" + feature
+    return "../../recipe-sysroot-native/kcfg/" + feature
 
 # no conditional, just use the yocto-kernel-cache addition, yes
 # the src_uri isn't used, but we may need to check it in the future
 def kernel_cache_feature(src_uri,feature):
-    return "../recipe-sysroot-native/kcfg/" + feature
+    return "../../recipe-sysroot-native/kcfg/" + feature
 
 def distro_cond_feature(feature_fragment,distro_feature,d):
     import bb
-- 
2.45.1


