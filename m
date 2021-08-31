Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.625.1630452579615437324
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 16:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XpXU2+ML;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id bk29so1176506qkb.8
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 31 Aug 2021 16:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hvF0lLrB0yOpKvbOpyPaY7+A6tW/TdUoJowavDAdfZo=;
        b=XpXU2+MLC6tnSFxmtytrUDXS4wTwUyJGmkfBZ+3wZUgAp+O+cRDh6zuipFPCg9+47A
         DJt5zYHqJmfgICjVUbyGDeHWLjgtQFZPhYN3xTozzaxXUxBsIh8QMmNs0hHqTKum5hlt
         Yz1JajOSUETleqO+HiH9sjytSPHeSvVxpmHiOr5QFgiTkZAkPX4fiIcVMq8HO4Jvdewr
         mO31DG4mYLAuFHKFMc6CEIoZ4JtE9uJhW9SflZVFtRRyACB4ePMhCfhSIwhS6EK1x21G
         I34CxBSlnHdZQRi5hi7cYuVC4mTQ3qgqXvXumSg/Wsexqe+pKpRHB6Uu7T4xtqlObYBy
         vByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hvF0lLrB0yOpKvbOpyPaY7+A6tW/TdUoJowavDAdfZo=;
        b=RRDEwXzUmBP+5T1mtuo8B/OpBESWKOR0ZTWyF2iI9nxbyTqrf9L48mxW4dpRCI5gQI
         WrZ71sVMqju4mDeSaHb/oWXbqSiAKFZE2e15e5jlynwHsRIoJlaR1CMgV/6zjbrjbAz+
         6Peia38VAi8TeP4hcipjq0NtJeC6U1bBbpMlJwEP6itm/qZ3OAGnM+cRkN2FanHd5mLO
         s7YWN3ONWHmEk9Utk1GnH36RECk0dLw9kZ2oiCUZz3pXeLSl/m2ETPsD7R0K9P+XV+ha
         QW5J8MYUrwEvRUnUPBKqxLWduSNznvHPPL9Ipl8DzGJ+lMdJfL0vSFryot+CNzoSdjZ7
         Hs+A==
X-Gm-Message-State: AOAM533N+9L+lv2S2vpVRrl28Wh8H5na5Y63ihgG8eZYtrM6cAib56Vq
	+m4mrnRGcE4ZUsNG5MmpZC+7a6LjmW3+yQ==
X-Google-Smtp-Source: ABdhPJxlc2zGp0O11dCkPo4MmY/BgyRmXIwu7Bl8x9G6ZZ1dsPcyh+656ctjcJT9BBmkPvRZbMCddw==
X-Received: by 2002:a37:9e55:: with SMTP id h82mr5630956qke.42.1630452578728;
        Tue, 31 Aug 2021 16:29:38 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-170-39-79.mycingular.net. [166.170.39.79])
        by smtp.gmail.com with ESMTPSA id d20sm14793007qkl.13.2021.08.31.16.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 16:29:38 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com,
	scott.davis@starlab.io,
	adam.schwalm@starlab.io
Subject: [meta-virtualization][PATCH 3/4] xtf-image: update qemuboot settings
Date: Tue, 31 Aug 2021 16:27:42 -0700
Message-Id: <20210831232743.252498-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831232743.252498-1-christopher.w.clark@gmail.com>
References: <20210831232743.252498-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QB_MEM is now set via the qemuboot-xen-defaults bbclass and has the
better default value of 512MB, which fixes some test failures observed
when using the lower previous default value of 400MB.

The SYSLINUX_XEN_ARGS method of setting the intended dom0 memory level
did not take effect in practice, so remove it.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---
 recipes-extended/images/xtf-image.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/images/xtf-image.bb
index 21c0e7f..b73e4a5 100644
--- a/recipes-extended/images/xtf-image.bb
+++ b/recipes-extended/images/xtf-image.bb
@@ -17,8 +17,3 @@ IMAGE_NAME="xtf"
 IMAGE_INSTALL:append = " xtf"
 
 QB_DEFAULT_FSTYPE_x86-64 = "wic"
-
-# Set the dom0 memory level lower than that assigned to qemu so that Xen has
-# some available memory for allocating to the XTF microkernel guests to run:
-QB_MEM = "-m 400"
-SYSLINUX_XEN_ARGS:append = " dom0_mem=256M"
-- 
2.25.1

