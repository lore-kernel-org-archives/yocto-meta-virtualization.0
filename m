Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.12.1613685319026414525
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Feb 2021 13:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=isODgziN;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id c6so6292490ede.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Feb 2021 13:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OGKB49+Jx94gKL7v4TuBtr/h93Bg8rxgDt25PIg8XAg=;
        b=isODgziNGJdTQM+2kXw3UZg7K1dXfk8oTGlHQ60S2kYyiFqCnWvYJjs25NtW/EGJnY
         1cjODc2ll7f1cx8DcOeJ9ZwrVoecha126DfJsxIq2rQwMtEMPiskwmvETczils+BCbef
         344U0XGpdUeSbvszw9dbZ/t+wam7CP8N/tbQsIZXKd2PVgc1j20Pd6mw01EbrtJlpDAa
         mNpO2tQyZYuMzp3hJoVnCmMoc8Lw4p0MEt8u2YOOqgQv6HpwAfbSNN7PXl6VkXNM4J9y
         2tC/rsXwMG6Y9h6pVkK4KoxnQnKkR6L8KD8xmYfc3rRbrIKwTHkPHTMfZdWicdXaoomC
         CGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OGKB49+Jx94gKL7v4TuBtr/h93Bg8rxgDt25PIg8XAg=;
        b=KCBfAEpZcQM6Ea8o0XRYBxbcsFTjWxf/5kBqWPyYagVu37FOR1LuZ1LxGEbg+0zZ9y
         IaiBe7/eLGZeQmvdlHAiq+gLb1QE//lpgL4axY0FiMXaWxZKU3bvT0TQUQJn0rHZMLwp
         iaNcEmUf90NENwFa9yzmds9IhuQEV6SONAB8+pdj9QletmnYeEyCP+YTd2g+6EL3DyTL
         d8jC45ayOIDKH4lKunIkMFJBeUkqgE0YLOcRdSQyQfY6WNeSGf+ijBIFU0k3VG/9Jp19
         8zMs9M1Tiz19VugDaLKpp88B80Es776/AYzwNRPw0VBY+05CPFD3WVU1oSH3JlJqAg5E
         S/GQ==
X-Gm-Message-State: AOAM533TXv5zw6Cr75XONKesklZMghQG5/LOtS3kvl9TvP9jkXBPh7kH
	y6e8Fx4tdcsMBppZLC55L4hhDMBHHo6v5w==
X-Google-Smtp-Source: ABdhPJzfJyg8hSoSBbJcfoV8mRXWHon0ZdqpUK5zMmuvi3WGm+34KHHYdLUkPT0In5X/eEOtlJGXsg==
X-Received: by 2002:aa7:d80b:: with SMTP id v11mr6108154edq.17.1613685317418;
        Thu, 18 Feb 2021 13:55:17 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id rn18sm3263315ejb.99.2021.02.18.13.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 13:55:16 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][dunfell][PATCH] libvirt-python: inherit python3targetconfig
Date: Thu, 18 Feb 2021 22:55:15 +0100
Message-Id: <20210218215515.330689-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* otherwise libvirt build will incorrectly use host's gcc and fail with:
  gcc: error: unrecognized command line option "-fmacro-prefix-map=/OE/libvirt/6.1.0-r0=/usr/src/debug/libvirt/6.1.0-r0"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/libvirt/libvirt-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index c5b0fbd..ad4d247 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -1,4 +1,4 @@
-inherit python3native python3-dir
+inherit python3native python3-dir python3targetconfig
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
-- 
2.27.0

