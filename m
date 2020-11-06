Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.11946.1604671774104981298
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 06:09:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ek+DEbE1;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id 33so1452872wrl.7
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Nov 2020 06:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AkiK6oBtewZZb+1zK32DWMVVWDDJZwvwkRXZ7tcD1kM=;
        b=Ek+DEbE1RRtixNaBF5S0Am0or2YVsz60I32DZdAIT9dksfQkWHN0uysU0jQXj3jLu2
         c89wj0gTuJtx7r8cEDGMfiHZZwLrSXb0ChNvAEmuVB6k65l9G09GdJUyBh9DRP29mB2A
         qlxEk6H9mH1rXxptB+xOYBkxXm1r97uUDJam1OTBZAA/JzkOhmI0+n1jiqIa2ssXoWY0
         m0wsnj/juk74dEWMNa9FuC08d65oeorfLV+h4ABw8T5lYnYtVlILBL6kp+FQSdFDaxzs
         Vmfgl01AE1qceyIy5cVllhtjcfsncx5untQu14QfX/fCsd2Leq89D/TCGHMKkAsNd9uY
         Dgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AkiK6oBtewZZb+1zK32DWMVVWDDJZwvwkRXZ7tcD1kM=;
        b=rbHrP8VLpwh27mjnaweoPQRMZbHvTbUWfTUYj+fLOGZFKCEFfVyZ6GODlLGqrmO8Ne
         LrnJIfKw1ipHbPZoMQctgAQkOUUJayjPKvRQQNX8O/ZXyknVnCePSB/QKuDI97Aofk4F
         lb/BFQjBwwfYZTzFK4mcwlra30lVIdLY8HrvOHphtxnuMxLK79PiWtRDdygCYUgQlIew
         /wlGBsMntoBWY2xyVw5J3fvUUQrB2cU7WTP2Gs9+fePc2mlljdttxc7XdSn4nYhrDqMb
         WUAoilSdZS7p8AV6lQnqyvNFxdeNkJbvdZS1d6quH1AiLHm3TdT6ZJm32FY9SwpPqWT4
         iKRg==
X-Gm-Message-State: AOAM530ie8m84nHzawFG1BprDKL5fwubTjK63wWsYMRQzAuVJLt3wCZp
	pHN9NBWvlwq5zLw8ebFK1BfAR0M8bf4=
X-Google-Smtp-Source: ABdhPJy1yLeQ+A98ZKBWTrQOeEHuFH283Gb3RewC8HHkiICAkszsxFdTAU2OLWKu+dr83nsc0AlXgQ==
X-Received: by 2002:a5d:628f:: with SMTP id k15mr2974808wru.148.1604671772460;
        Fri, 06 Nov 2020 06:09:32 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i33sm2279247wri.79.2020.11.06.06.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:09:31 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] layer.conf: add security to LAYERDEPENDS
Date: Fri,  6 Nov 2020 15:09:30 +0100
Message-Id: <20201106140930.765802-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
  NOTE: Resolving any missing task queue dependencies
  ERROR: Nothing PROVIDES 'libseccomp' (but /OE/meta-virtualization/recipes-networking/slirp4netns/slirp4netns_0.4.1.bb, /OE/meta-virtualization/recipes-containers/crun/crun_git.bb DEPENDS on or otherwise requires it). Close matches:
    libcomps
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'slirp4netns', 'libseccomp']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 4294f99..9d741be 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -38,6 +38,7 @@ LAYERDEPENDS_virtualization-layer = " \
     networking-layer \
     filesystems-layer \
     meta-python \
+    security \
 "
 
 # webserver: naigos requires apache2
-- 
2.27.0

