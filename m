Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.94173.1638376906267106835
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BgkJsJYu;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id r25so38773076edq.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XsVUK1d261TMIFJ8pY7eKDc7AfuFj1lTDUz8xi6jjFI=;
        b=BgkJsJYutFLjdDQF+0FbvNeEENnb0itPQmE8l5IyJAy2Mujviu0fn6tjOuKbotkBvX
         lM+3ofFi0xsBFGmBrA6o0/Ky1HRIideZyI0hMTxoRbbMEu/brTCnTnZuZwVy3676SBny
         +1MMWSHBwCiWW7MB4LmkRPxNcj9Mr75sQJRwT5/hU9btdyskjJK4nOvH8BvQi5whGUh5
         6SBNYmn9FV2PpSGHR5IbiCFLOjEIqUNmOrafBtbRvhTEvrlzL8qXqCYv/WV7PzqGSsej
         SV3kumB+WCq0rjRb+o9b7CEIC+ELeVWz1axF2B2ZZ0SUP5dK8ijA53yqxgtx7DAlyrRj
         W68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XsVUK1d261TMIFJ8pY7eKDc7AfuFj1lTDUz8xi6jjFI=;
        b=WJ27K7KyUUOsvb2+TLOiZ6zx4CKgnB0v2+XeTmM+eWKAKuw6igFFHyR/cPn598O+XO
         EVOZNZ+QDAZl2eh2NFs32tR3xFti7jtJJpqYmKKQmffpygXLXqzGK51HQXzzP/0wI2Iv
         QbhFR5xDqq4iK5KnO48xpM6lzktcy8iEjkymIaZqOjwFvARNlBlW2f9G96XAB5sPZytU
         Gsx9cFD+BteJv0gowYeJu/TTUCwO0HaUJM3nFO7QMdUmzJfcNVtBjqDGyg9JqzOqEa38
         461l9HU2ik2xCTUT38JQQVzLwy9om+KMHlp21/hle6VuQDGmas3eEhF4P1CSyzWcZ0pq
         MgzA==
X-Gm-Message-State: AOAM5314GJX2mKtV90P3PGus6aOIZpNjbr0h4dObPlaFF+jBacN0AtQ9
	9/EcCtioTOx0tgvEQtuHlv3nVNkGkys=
X-Google-Smtp-Source: ABdhPJyv/fIynR18jNe0G7AEOZXau10jpJxLpbaG8dQHy3rnBZ8wCDbNW1b+jZF8QNnTX1EPK868Fw==
X-Received: by 2002:a05:6402:12c1:: with SMTP id k1mr9840727edx.355.1638376899781;
        Wed, 01 Dec 2021 08:41:39 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g12sm162000edj.45.2021.12.01.08.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:41:39 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][hardknott][PATCH 01/13] uxen: update guest tools to 4.1.8
Date: Wed,  1 Dec 2021 17:41:24 +0100
Message-Id: <20211201164136.33802-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...xen-guest-tools_4.1.7.bb => uxen-guest-tools_4.1.8.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-extended/uxen/{uxen-guest-tools_4.1.7.bb => uxen-guest-tools_4.1.8.bb} (63%)

diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
similarity index 63%
rename from recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
rename to recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
index 4dcfe51..2ca0cb1 100644
--- a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
+++ b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
@@ -6,17 +6,17 @@ LICENSE = "GPLv2"
 COMPATIBLE_HOST = '(x86_64.*).*-linux'
 
 SRC_URI = " \
-    https://www.bromium.com/wp-content/uploads/2019/06/uxen-vmsupport-linux-${PV}.zip;name=uxen \
+    https://www.bromium.com/wp-content/uploads/2019/11/uxen-${PV}.zip;name=uxen \
     https://www.bromium.com/wp-content/uploads/2019/11/Bromium-4.1.8-Open-Source-Software.pdf;name=license \
     file://fix-Makefile-for-OE-kernel-build.patch \
     "
 
-SRC_URI[uxen.sha384sum] = "d9d7a1fa5c44ac77eea3d8d4756f9e07fc02acfe12606325ff0bb8a60c07abc3e9ddb80c2039797fb2122d750219722f"
+SRC_URI[uxen.sha384sum] = "be2233bc6506a23350d76c03ac28ea7ea381e1dc6ed5ce996e8ac71e6a3316fcaa2ed070c622618bd226f43a4d6db5d4"
 SRC_URI[license.sha384sum] = "92e48c614df3094cb52321d4c4e01f6df5526d46aee5c6fa36c43ee23d4c33f03baa1fc5f6f29efafff636b6d13bc92c"
 
 # The software license is GPLv2: please see page 199 of the pdf document
-LIC_FILES_CHKSUM = "file://../Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df6ffa417b36f870a9997650049"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df6ffa417b36f870a9997650049"
 
-S = "${WORKDIR}/uxen-vmsupport-linux-${PV}"
+S = "${WORKDIR}/uxen-${PV}-72a4af9/vm-support/linux"
 
 inherit module dos2unix
-- 
2.32.0

