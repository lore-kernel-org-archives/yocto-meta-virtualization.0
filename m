Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.13911.1619624674075743816
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Apr 2021 08:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=V5/nii19;
 spf=pass (domain: linaro.org, ip: 209.85.222.173, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qk1-f173.google.com with SMTP id k127so8374040qkc.6
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Apr 2021 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NXKy+BiHW2i88vo7+oyzIfGoxyOFJPsnTl1VzmI1Qwc=;
        b=V5/nii19N7lfJ++WNElpqHkJO4ipffpNDUGhcOsREXuQB0hRg+e+YEPJVwktkeeLu6
         7H/OMhXGE56Uvgc4D91Hrg2GwHeR9/4KP/HkEcFkjdsZvozWYPu23Xq+L3OrULDCrNr7
         mK/hCtoxjMyT1E5N9hL2lWEXTd0gIcaftwttXMNlnzi05RgtlVp6iFOjyj5utgpPPPRt
         a1TSOO+RZsKqTHhQP4JO1n3p0hAlBw+OfZ+2mULYq30cP3dCb4GeNjG8axAIIeapx3/V
         4pmsuweYi9vc2bVDPLjI9rWZ2SCadg7TVZy5J/LZQby0vtPnQc5brds4jMP/kFHZDWAQ
         ANwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NXKy+BiHW2i88vo7+oyzIfGoxyOFJPsnTl1VzmI1Qwc=;
        b=QvgNfW/LOnYgxtgZlNlsEoHT+nYOdyasRJxbfpVSFmRBlVUtD2okmBzRBg1oMOutHQ
         KkDRh2jA3x+yFANIUFvzf+mG3Yzjf5aH+ismBB/kQ9N14iZ6Qd1cU8iICsR7K1/g78kH
         2KB9VrkllKdBtVtIUxnmXVNgvCoroknZLRxtFuVZz5vF5boKoWTUxdTqtDpg4WcA32xg
         cDtRSE49ylSwDmUaybmxyzgpwKmQIkOLZnQ6Mn1eHkg04AqKTWktr7xnm082gt6xAvOd
         AmjJSMLN881MfhrG+Bp9uDGISzVxjzPD8ejLFzhSyEY+tyBPmSsivjMHiOS2W4dW55sb
         pv0g==
X-Gm-Message-State: AOAM532kgsxeAriQAsQ6+feTSTYpXAUVQ7d+T/v8teD3bwmHZoHbrcdP
	YzvNhAoMkpwptj80L7H9IyXQPYHiSXWzIT5N
X-Google-Smtp-Source: ABdhPJzJWEKOxFJzqfc+a4/yAgadZyFGbGAl1tMGFVpqltFHjaBTBwo/htvrtAQpAgLBq+MX1rHmYw==
X-Received: by 2002:a37:b807:: with SMTP id i7mr29162877qkf.126.1619624673312;
        Wed, 28 Apr 2021 08:44:33 -0700 (PDT)
Return-Path: <ralph.siemsen@linaro.org>
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id n11sm68228qkn.33.2021.04.28.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 08:44:32 -0700 (PDT)
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH 2/3] containerd: add CVE_PRODUCT to recipe
Date: Wed, 28 Apr 2021 11:44:10 -0400
Message-Id: <20210428154411.12994-2-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210428154411.12994-1-ralph.siemsen@linaro.org>
References: <20210428154411.12994-1-ralph.siemsen@linaro.org>

Allows the yocto cve-checker to flag CVEs, which would otherwise go
unreported due to the package name not matching NIST NVD data.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 recipes-containers/containerd/containerd-opencontainers_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index c0145b7..b4de3cb 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -118,3 +118,5 @@ INSANE_SKIP_${PN} += "ldflags already-stripped"
 COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
 
 RDEPENDS_${BPN} += " virtual/runc"
+
+CVE_PRODUCT = "containerd"
-- 
2.17.1

