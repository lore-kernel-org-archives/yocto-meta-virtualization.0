Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.7900.1630070357124334052
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 Aug 2021 06:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LA08eXNM;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id u14so13686367ejf.13
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Aug 2021 06:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZZDu6Qyp/dsU8JVdtstyE0BKC5mzaiszyDMjKqhNG0=;
        b=LA08eXNM82o9I3/WMLr+J3YQC9ebEgGZmJntxDIj440MF9D+aEOjwoV2seb8xu1XEk
         xUKSrXssgof2Q70d4tFQ0aG3LAB1yHS8CmyCdD1LJb0lw5Os4H/ETeWDb+WMZVqb1RTL
         2waNOKt8SmzF2DgO4qow5ElMWVSDcI3bhuNKi1wNPdAxXocM20IsBUb4vk5J9QuVEY1P
         21DpnWZonHkYUJKj7LCIqITAMsD4l+OD2LRbj44QwsB5D28jkVoE+Gc7tU60SQVchHkM
         GdBz7jNpLCzlNc8iaoY4hEXgOK/967m3NNYnVIBwBt36SZVm7fyUlYLgo46fk0HzJTlQ
         OAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZZDu6Qyp/dsU8JVdtstyE0BKC5mzaiszyDMjKqhNG0=;
        b=rF7skuDypkLzXbyVpCuabpyWdoga/52reeSHfkz1A7ArrOZzoFEkdmWJvUC2PWnXnJ
         i2ndIrEGnih9Yq1Khcjrbj1yL6b+v2pWJBvvtUBKbjV+y50eAraugcD6A9hFOvf4BBBw
         oEh6mQPsIOEj7+245ptUaeRuwwr1Sb63Bmr3PdFXo66cXDEM1tN8obEnMC3a1/d03a8e
         0RnGuZr3LTrRz8OcnIHe5N77DX6lfsU+mD1N3fOpKWhGZi3a4KmkIOuh7fBAJbnrqqsP
         UBjjITDtCzwfefxAPSbAWPMEMZRdO3lQPbBUN699Xs61o9882DhrfVsCP41w/miTpImb
         N0fA==
X-Gm-Message-State: AOAM533EzF7++9B8EvPGZfjqZVnPKQw+lJJqQPwyDPNFN94dzrdHukiR
	Gk6tahjHLn0VF/oHeImj+YRdr3hxyjffUg==
X-Google-Smtp-Source: ABdhPJxl0xbCYF/mYlaAFR4jGk3MCUw8h6jrtsCxys6txH33CAFw5M5UPYOQkcxmdPDrgZvAvOBAIw==
X-Received: by 2002:a17:906:660b:: with SMTP id b11mr9644408ejp.427.1630070355590;
        Fri, 27 Aug 2021 06:19:15 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b3sm2885827ejb.7.2021.08.27.06.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:19:15 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] busybox-initrd: rename to match 1.34.0 version from oe-core
Date: Fri, 27 Aug 2021 15:19:13 +0200
Message-Id: <20210827131913.3314816-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upgraded in:
https://git.openembedded.org/openembedded-core/commit/?id=d0e694ef4ec7bd862bdefee494210e3878152b44

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{busybox-initrd_1.33.1.bb => busybox-initrd_1.34.0.bb}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-core/busybox/{busybox-initrd_1.33.1.bb => busybox-initrd_1.34.0.bb} (100%)

diff --git a/recipes-core/busybox/busybox-initrd_1.33.1.bb b/recipes-core/busybox/busybox-initrd_1.34.0.bb
similarity index 100%
rename from recipes-core/busybox/busybox-initrd_1.33.1.bb
rename to recipes-core/busybox/busybox-initrd_1.34.0.bb
-- 
2.30.2

