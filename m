Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.2957.1592902054185037423
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Jun 2020 01:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ufA2OKEO;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id j18so2184353wmi.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Jun 2020 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xJl6o4KSUastz/80S0j263Ghax5ya8qiik+SqorfF84=;
        b=ufA2OKEOo3PsUv03ihvDFjR2l5GM7nDGgy5W++LWeLiHKB5IlBVlHtuKIKARPJ67Bd
         dyKmhert32nj0bYe4uEz6SQnP71U9geCUGHsRlcd2P8k9rYLNYxYNXzvknaZbz9ck8jK
         3s53vYT2xCNEt3V6ms8vB+0vG1G6rgCSCbwNe1ZNWjB/MwIIA5+lIS36QXJyqHD5R46s
         lD0dcHtL++Bdm6ycM4Z+0AOGYYttRvRJa/o0GyBOM/wVq6D+zTCvavatv9ZB3SApEqtJ
         uwyUqa9tHisn5gvn3CX2UyUNJdrhiI5jtdxPd+SqmPuqNsn7K5/iNWGwqrpEB+8GWj/F
         cQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xJl6o4KSUastz/80S0j263Ghax5ya8qiik+SqorfF84=;
        b=C1Wm9Yxq7Ze8RHtGY81a/vuy04EjgUi90WhayYJvABva5IOG+NMkCSf+C1xbyiK4Hk
         ynOdHaOe83+6BzIXzIZ2QzLQR6NAWLFOyIVPTHEbYJ7KvNGRU5hqJR7OHZE4h7PReM8+
         vqld2YO7UvNEkRxxguzmYVyXL17RxdXQfA9QbFKxxKUFq5KwKKkFmSCMrPAThA4WZ15O
         gRXjkdRK3H11rx3D/8Gl5rGrCKIM92YLxWpj8Akpg2rRJVuOREOSQb/4MqePvwFvy9mH
         Dl7Lq0e2Zb1UonThA0TL72ijruvTaGxBBJVjJaJBj/s25jHWG8NlNugrccEANJI9pzzk
         e2Cg==
X-Gm-Message-State: AOAM5318NRpluHOjgr+HmOVoMq7/rIRlWOGojrI5z/nnqInNbepZFNpc
	NWJwyzxix0YH66Qe2rrdjWpi/tCL
X-Google-Smtp-Source: ABdhPJwDMirGDks1rDMNfai4l6UpBkqYAGC4ZXaJLG+R2tJtdjwW7eq1b/iYapx8QzIF+SQW/Yb1Uw==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr8122291wml.170.1592902052597;
        Tue, 23 Jun 2020 01:47:32 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain (m83-185-43-74.cust.tele2.se. [83.185.43.74])
        by smtp.gmail.com with ESMTPSA id x13sm22232328wre.83.2020.06.23.01.47.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jun 2020 01:47:32 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH] python3-flask-cors: inherit pypi
Date: Tue, 23 Jun 2020 10:48:45 +0200
Message-Id: <20200623084845.27422-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Drop SRCNAME/SRC_URI/S, change to inherit pypi.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 recipes-devtools/python/python3-flask-cors_3.0.8.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/recipes-devtools/python/python3-flask-cors_3.0.8.bb b/recipes-devtools/python/python3-flask-cors_3.0.8.bb
index 5d3c41f..aac7152 100644
--- a/recipes-devtools/python/python3-flask-cors_3.0.8.bb
+++ b/recipes-devtools/python/python3-flask-cors_3.0.8.bb
@@ -9,13 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=118fecaa576ab51c1520f95e98db61ce"
 
 DEPENDS += "python3-six python3-flask"
 
-SRCNAME = "Flask-Cors"
-
-SRC_URI = "https://pypi.python.org/packages/source/F/Flask-Cors/${SRCNAME}-${PV}.tar.gz"
+PYPI_PACKAGE = "Flask-Cors"
 
 SRC_URI[md5sum] = "551cc4c0305a171d28caa2b3bc838867"
 SRC_URI[sha256sum] = "72170423eb4612f0847318afff8c247b38bd516b7737adfc10d1c2cdbb382d16"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools3
+inherit pypi setuptools3
-- 
2.27.0

