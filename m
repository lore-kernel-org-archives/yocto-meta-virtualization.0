Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.621.1630452561208536358
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 16:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZAkvri/a;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id p4so1214383qki.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 31 Aug 2021 16:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IdKRK7mN5GY2NQpiIBvo06f9nZwyLuEegNkf9umH8O0=;
        b=ZAkvri/aJ3DQnMeqMOt9agd7sU8UfFeZmbuUfWxk8aRVqDSd9Kd9sVxrk0Ae1tXA9k
         YTfCLwo36fZetfnTAAxxp4VMYk+WhESlytX+aLO48WXri4+z2ad/C94adCVUwh8pYbZ/
         nWHNUguSPq1FT5p419PFqV+ThxOWUK/86iSTQME/x72tKo9q8z1yowI2gnJ3fvFDSMr5
         tn1+X83CFhW96gwgL+x4fnKmGVrqiivjPhNl51Pip2TzigCrmquPXNfeHxD8lagsXyFY
         veA4QvtqkOjqpubulnIvk64cqi9dGuBi2CNeWunlcSo9czpyJNJU9vpUVfS+F8v2GX3I
         pENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IdKRK7mN5GY2NQpiIBvo06f9nZwyLuEegNkf9umH8O0=;
        b=gvODPIUrp/xrPNWF8QhRrFGaBAgmYMfGUU/dUVPW+vohx3G3DwPRKEqhbvTZ0wH52M
         ptlh5wAo9hYY5RtVsDeeTvNRlhfOapsYsSI1zGUW6JunIEEYcaQl1YWEGYf1SbRrekUo
         Xs3GHoVshaIPEzj9w4s+l5lCWEZ13T2Oi72nUfManb91+Byn5h7YW8kLYy4SEWuXr2m1
         gHV9yUcoBSVmpDl4zVmHES804MIZQf3TmOzYycb/qRnwq1WQDWpsLfQG80DEGjjLLvHS
         1vLo+xYHN3vMu5iolHwVYtwc/AyoIaLriIE8/CnFOFga8fPKFCNwUlJ2eHZcAiG6s0TS
         LhdA==
X-Gm-Message-State: AOAM533IPv0k9y9a7ZWV3XwrcdZx1jmDzjGyi0U66CD46etvnctI3LwE
	Xh9cEDU9x1vIV9EdyznY9EUf3zfRLQAPGg==
X-Google-Smtp-Source: ABdhPJyzh7X04zUkF6qSccovRhxk2ApeoHSBreXcVHKPSrwHLhGtKuoeUsLh4IuuO8OekoPWFZ5qaQ==
X-Received: by 2002:a05:620a:294d:: with SMTP id n13mr5582822qkp.179.1630452560216;
        Tue, 31 Aug 2021 16:29:20 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-170-39-79.mycingular.net. [166.170.39.79])
        by smtp.gmail.com with ESMTPSA id d20sm14793007qkl.13.2021.08.31.16.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 16:29:19 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com,
	scott.davis@starlab.io,
	adam.schwalm@starlab.io,
	jdmason@kudzu.us
Subject: [meta-virtualization][PATCH 2/4] xtf-image: fix QB_DEFAULT_FSTYPE: only needed for x86-64 qemu
Date: Tue, 31 Aug 2021 16:27:41 -0700
Message-Id: <20210831232743.252498-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831232743.252498-1-christopher.w.clark@gmail.com>
References: <20210831232743.252498-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qemuboot launch method for x86-64 uses wic but Arm does not.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---
 recipes-extended/images/xtf-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/images/xtf-image.bb
index 6bd5a34..21c0e7f 100644
--- a/recipes-extended/images/xtf-image.bb
+++ b/recipes-extended/images/xtf-image.bb
@@ -16,7 +16,7 @@ IMAGE_NAME="xtf"
 
 IMAGE_INSTALL:append = " xtf"
 
-QB_DEFAULT_FSTYPE = "wic"
+QB_DEFAULT_FSTYPE_x86-64 = "wic"
 
 # Set the dom0 memory level lower than that assigned to qemu so that Xen has
 # some available memory for allocating to the XTF microkernel guests to run:
-- 
2.25.1

