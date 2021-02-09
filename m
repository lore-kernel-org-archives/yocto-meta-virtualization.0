Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.7530.1612858161815823826
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Feb 2021 00:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WEKm3Z16;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id w2so29792157ejk.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Feb 2021 00:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4AqFmoX7YkBVSrjoO3hCns/n37T5QTLfW3ZLf8d459s=;
        b=WEKm3Z162jNr9cRPyqHQ4Gu/mKozlNCaQuQolf75pqAUeMFmj/TANG9/xzRmBaG/2m
         KouSuUjEWMQmU22kbl+LEKY+q+ys5GfKqOgVLCjrVDu8F4IDN+3i+8T0kf4zukno3X0w
         77blQ9j0/4Trlk1vxAotEptk2Iyc5uhVD3GC4opHedcscpJsvWvo6WUp8rs+1o+QWODf
         Koa0ecVUztoW1cwzFott2TeINURg86KQZS4dDHqgKmTsiaWJCnlgIQLMjBQQn7A7QPPR
         4DGUZmvP9P4rJmhp0lQnSN0rl0KidmKhETuZG4DumeW4tRkBobSseBhCeDqoMmn42XgN
         cGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4AqFmoX7YkBVSrjoO3hCns/n37T5QTLfW3ZLf8d459s=;
        b=pzk1E13PCkHqT8/UihQ/uxzkbAYOkRZuejHSLJXwh5eWsT/LXcJA0snsAIEIgfYgME
         CjzOrd+2XNV6l6x98nBBKB/DIbacvhRCpB4DWNPnMjS7OW3y4mE9CUzjm+Ur7jwUHWFY
         Szc9dQkrYvh4S9PAxRkDCVpEo5vOwRNh7BiAutgannxtFHD+RpBZ529uATVNcaMEYmvo
         SFp1EgZXTKYLREDF+0rD+TS1Sx4Mj+YX9IZnLAjAk/etvpPKHPdw/wD6DcMw+Cjg8KRd
         qugbIJ6tOLDMw8sHt7YnlQj84yXNxVtb5E4/seArywuvP7Xs0YK5XO2smu2SC1VlQ5B7
         NDNA==
X-Gm-Message-State: AOAM530nXY62Dr+5oJdlR2LHW4DpcAWNpn59hw6GznwSj+7RGMXPGnA2
	3MfRcLMQnnLKu93YV6rXadgJoZGz8uCVDw==
X-Google-Smtp-Source: ABdhPJyEhA8+ccOJWPI8Jefr+GlNWpYqhjYZhjohoTh0vtGzD62plHF/aTggIOqiaaDzl4Rbf3ltng==
X-Received: by 2002:a17:906:da0b:: with SMTP id fi11mr21447099ejb.392.1612858160489;
        Tue, 09 Feb 2021 00:09:20 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z16sm10053570ejx.73.2021.02.09.00.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 00:09:20 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] libvirt-python: inherit python3targetconfig
Date: Tue,  9 Feb 2021 09:09:15 +0100
Message-Id: <20210209080915.1149076-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210209080915.1149076-1-Martin.Jansa@gmail.com>
References: <20210209080915.1149076-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* otherwise libvirt build will incorrectly use host's gcc and fail with:
  gcc: error: unrecognized command line option "-fmacro-prefix-map=/OE/libvirt/6.1.0-r0=/usr/src/debug/libvirt/6.1.0-r0"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/libvirt/libvirt-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 7b87d5e..bcd7657 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -1,4 +1,4 @@
-inherit python3native python3-dir
+inherit python3native python3-dir python3targetconfig
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
-- 
2.27.0

