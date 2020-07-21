Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.1754.1595355753239803237
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jul 2020 11:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ux2vlaMr;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: liu.ming50@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id d18so15954477edv.6
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 11:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQo3LkWl97y6o5sRDfVzf0j3t55kuzDIYWc+Y3+MikA=;
        b=ux2vlaMrYg+u7Q78BlwKMl1Ows14lzB9Ou+a9aql54tdYi39WsxTA7+HwvHvIxNx3f
         CK9Ig+pJDkStqewF9oP4U6pPs80z+uGz334+thkgRyUTVPgpT8tzgZXr1VYFrAgZkyC/
         Xar80KMFTA4r78+9FATGaMWdLhD/mcmGrUvAt5wadgNpd0lYZ9FSZJmWOJ3Uf43s0mlV
         2+YsrlkHe1h+b84+YrtyZbSMOje5YJK+eygz7di4fnY5vpfp8BOFHE9OaDsAgcuo0cnU
         LCaYRjrBWrXInm0khQOVFqxVeh9KcHUTgRahSJaafxDvN0224M+b1bAzZVhEvoJEaHQb
         rF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQo3LkWl97y6o5sRDfVzf0j3t55kuzDIYWc+Y3+MikA=;
        b=R1YNB3O2lIEO69c4OY102ziFFlsT3mGkxriJflp/64zfbmXhwDbpa1rQmgV6+VeR4j
         fpZLZUWA/uNuqmip3iJ1TurLpQR4wvcs274iBBqEfBvjvv+OW6bBbUS+vjyXTK8zdx9B
         g5ljVQ4oqlwz2i0Z11ZsOMeh/SqzbJcWU9Ot3/QLg9rFZyt8Q6aNkO/hQchyAlI/Tf0S
         LyhiuAV971wqOoJMnOpq+3QGXcqNtG3HCn/C8MH6s5+5yC8UFyQGtGrQl2sYvt8arUE6
         INzjMFjB+grMCx9xZqi8G+yJ6UT0qNvZROJ7qLiYhjIUaQtxpJ+pHTTgCNtT+CeqMTQP
         LfLg==
X-Gm-Message-State: AOAM531tnQV6/FFV2UNxhnc4mtbCdXJmNic7XGi58LQTwIXV0Y6l+vts
	wU1m/1MGRdNqpoTEKFlvardN33p3
X-Google-Smtp-Source: ABdhPJxOUKj3M1BWBDTUodmh9l/F0/Rh++6u10E+yk3bD2NRE9Z9ebRYVtxXlTu8cEbJLb88/uIa3w==
X-Received: by 2002:a50:ee84:: with SMTP id f4mr26155688edr.183.1595355751408;
        Tue, 21 Jul 2020 11:22:31 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (89.140.40.7.static.user.ono.com. [89.140.40.7])
        by smtp.gmail.com with ESMTPSA id n16sm17127096ejo.54.2020.07.21.11.22.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2020 11:22:30 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH] conmon: uprev 2.0.11 > 2.0.18
Date: Tue, 21 Jul 2020 20:24:39 +0200
Message-Id: <20200721182439.1827-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Also drop useless SRC_URI[md5sum], SRC_URI[sha256sum] and FILES_${PN},
and add SRCPV to PV.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 .../conmon/{conmon_2.0.11.bb => conmon_2.0.18.bb}        | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename recipes-containers/conmon/{conmon_2.0.11.bb => conmon_2.0.18.bb} (71%)

diff --git a/recipes-containers/conmon/conmon_2.0.11.bb b/recipes-containers/conmon/conmon_2.0.18.bb
similarity index 71%
rename from recipes-containers/conmon/conmon_2.0.11.bb
rename to recipes-containers/conmon/conmon_2.0.18.bb
index a5bd527..c2c0fae 100644
--- a/recipes-containers/conmon/conmon_2.0.11.bb
+++ b/recipes-containers/conmon/conmon_2.0.18.bb
@@ -6,13 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61af0b6932ea7b12fb9142721043bc77"
 
 DEPENDS = "glib-2.0"
 
-SRCREV = "ff9d97a08d7a4b58267ac03719786e4e7258cecf"
+SRCREV = "7b3e303be8f1aea7e0d4a784c8e64a75c14756a4"
 SRC_URI = "\
     git://github.com/containers/conmon.git \
 "
 
-SRC_URI[md5sum] = "5c711911d766d76813333c3812277574"
-SRC_URI[sha256sum] = "4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e"
+PV = "2.0.18+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -26,7 +25,3 @@ PACKAGECONFIG[systemd] = ",,systemd"
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
-
-FILES_${PN} += " \
-    ${bindir}/conmon \
-"
-- 
2.27.0

