Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.14165.1619624676637961543
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Apr 2021 08:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WwKKVpX/;
 spf=pass (domain: linaro.org, ip: 209.85.219.49, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f49.google.com with SMTP id dm16so6139105qvb.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Apr 2021 08:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XJP4y6+1/h/Wj56hVNl6295rBDDSim/8QbjxK8VM0qc=;
        b=WwKKVpX/A6L56vPPt9FJ2DT5pu01XTRFrbX1L7HtmzFIYwpJjr+K9I2HtU41WqU9+0
         tu2iZxzKzocUsh8+U0OwHIoRJVcO7GV1TykqP1VAV7AXVxk1fHW6mrA4zfdCpqe/fkvC
         obzcQYHZ1Qq8JkqriLgtzS4xOLRKkFh6CZ2BUTgQLEnIqiihRUaSNHN0ODdapK6V5TAO
         d7WyrpvTulrKF5cacWkR42qR93r2PpHOKDaOPv55gb4JrLFeexwksEz0+LLGmOPne6GT
         W43g646dLqRcGp5wCdXpL1+KWB037pYl4Hs20YW+Cf1mqNzYncywS0j/5883JY4aHUMO
         tcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XJP4y6+1/h/Wj56hVNl6295rBDDSim/8QbjxK8VM0qc=;
        b=RRGuU3B3xCBYXL7bpyPDzpFSrzfNcQw6eDKMLs5ipzBZe3U1a6GsKhvfutnMSQ37wD
         J51hM27yyXtle0PRFJncm3Wz/SZ5rXfTRwbqE12OU31opASk0amZDsgk33MZfRBcJQ29
         j/Cggy9w5qJtY9NTIVQXF7rlECIqgnwzGnRXPcD3i4LHhkr5Vrsj/RduhGtB9YoIwkjr
         NXF5NOz/4mlh1EdYGlOH6ZtLJMmT7cjzN2I36GzxB4ST2IqcrrgIVc4H/jgZ/EbZZmSy
         tjwNF2dEIg/rMXg8eJXqiEweXW+mSsJ02zT2NdYQDGVrjhMZxYB/sA0j519zJJPOGI2o
         TofQ==
X-Gm-Message-State: AOAM5331kpsvprwYAiDzH4SFC8GUEqoeRkE+zimZhS5vzezJIfMZn27B
	O3vxPGxtx9mBSutc5AkPiwVuLGirdulbHIma
X-Google-Smtp-Source: ABdhPJyE+I6Yb7ei4tE4u5jCBZcy+8ysHT5S3TQFmA0NYMWFWJCxMuosmlskTSDcGkxe6qB3vk3Lfg==
X-Received: by 2002:a05:6214:19e6:: with SMTP id q6mr30168322qvc.37.1619624675866;
        Wed, 28 Apr 2021 08:44:35 -0700 (PDT)
Return-Path: <ralph.siemsen@linaro.org>
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id n11sm68228qkn.33.2021.04.28.08.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 08:44:35 -0700 (PDT)
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH 3/3] runc: add CVE_PRODUCT to recipes
Date: Wed, 28 Apr 2021 11:44:11 -0400
Message-Id: <20210428154411.12994-3-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210428154411.12994-1-ralph.siemsen@linaro.org>
References: <20210428154411.12994-1-ralph.siemsen@linaro.org>

Allows the yocto cve-checker to flag CVEs, which would otherwise go
unreported due to the package name not matching NIST NVD data.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 recipes-containers/runc/runc-docker_git.bb         | 2 ++
 recipes-containers/runc/runc-opencontainers_git.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index d614fc4..ff142d0 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -10,3 +10,5 @@ SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
           "
 
 RUNC_VERSION = "1.0.0-rc93"
+
+CVE_PRODUCT = "runc"
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 425ce83..f3ff9a8 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -6,3 +6,5 @@ SRC_URI = " \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     "
 RUNC_VERSION = "1.0.0-rc93"
+
+CVE_PRODUCT = "runc"
-- 
2.17.1

