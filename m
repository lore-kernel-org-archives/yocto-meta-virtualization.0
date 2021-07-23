Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7666.1627044397897007996
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 23 Jul 2021 05:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EeUZ0fV5;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id m20-20020a05600c4f54b029024e75a15716so587225wmq.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 23 Jul 2021 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wXFun1dTSla9QgWDruZEIglVdT9AS2KNbGxhMl5t2ww=;
        b=EeUZ0fV5CFeKSAcUkXVBlxVwKOYzygcfxDag7OmOtwBOfOu2Ir4qihKO8kB+NT4Zpl
         CQdmYhtGaSyfLV48a//MH4AKo3zzXxRxd1ECNjBeK6/MBunywZxYwWp/ercXQ4ykoaVB
         zzqtShCm65yAFcXYfWbCmoBkJvCIXwozmdjaPNcG+Mmsv+kM8piuCdEvqT3gZfyBa1Vc
         VjOsKCLZ/Zqhy/28KV4QRg/W9bZHXKkcCYFh1saDpJ49yZKfjjtvAmk4EEsI7o1XspTy
         tGMsCiwe19xo5oTSglNxKCPyg81p9jCDaABFixzPb1WqLWyBSgGYH9RDswE7IW3gg0cl
         f+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wXFun1dTSla9QgWDruZEIglVdT9AS2KNbGxhMl5t2ww=;
        b=YIDpWpS0trcc0NWctUkPU64NFOQOAvyzF94NNUs0OhhHta0/Y+hz25E83bjmBGs7fM
         xmgRn1ynmxyq2tQFxhLVpLf/vFa7k281rodfk5h4fpm+tvS83kHKIrit0vvrOtuZs5ci
         RajzDjq+CyTxw40u/x120EWpwhSmnRWI8iUWdKAdRXKbwX7AHgFkGEZBg+Tv1cC4Cxfm
         +pWAfuZu091cehzUURvpRvVKc4Qs41LWq8q5mCCWy3PMdTz7FLBpDMGadfG00tLQIfsp
         q1p+UyAG1MvLdaunyQa9nkqnDJ9WlhnrhGXqQgTWCtWBzjERM6ObrRq+Ik61gAHnDLFL
         rWbw==
X-Gm-Message-State: AOAM5320sME8dMeUTCGzyqIHGZ861vXsurPfnKb3jLNVzPpJhrOCuVji
	7m+x9icp6J45p1+VrwshhGZqHJu+7Nk=
X-Google-Smtp-Source: ABdhPJzx6YHSw3FbANK5ipGvh9bwih142HkbawfKY8shL9CL4cmQqAleK/raIdLIAhaaLInQms20Cg==
X-Received: by 2002:a7b:c8d2:: with SMTP id f18mr4287460wml.135.1627044396370;
        Fri, 23 Jul 2021 05:46:36 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r2sm6008908wmh.34.2021.07.23.05.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 05:46:35 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][dunfell][gatesgarth][hardknott][master][PATCH] uxen-guest-tools: inherit dos2unix to fix do_patch failure
Date: Fri, 23 Jul 2021 14:46:25 +0200
Message-Id: <20210723124625.1122482-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
  ERROR: uxen-guest-tools-4.1.7-r0 do_patch: Command Error: 'quilt --quiltrc /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.7-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
  stdout: Applying patch fix-Makefile-for-OE-kernel-build.patch
  patching file Makefile
  Hunk #1 FAILED at 1 (different line endings).
  Hunk #2 FAILED at 19 (different line endings).
  2 out of 2 hunks FAILED -- rejects in file Makefile
  Patch fix-Makefile-for-OE-kernel-build.patch does not apply (enforce with -f)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/uxen/uxen-guest-tools_4.1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
index 757f1e3..4dcfe51 100644
--- a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
+++ b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
@@ -19,4 +19,4 @@ LIC_FILES_CHKSUM = "file://../Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df
 
 S = "${WORKDIR}/uxen-vmsupport-linux-${PV}"
 
-inherit module
+inherit module dos2unix
-- 
2.30.2

