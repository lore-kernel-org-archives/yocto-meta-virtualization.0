Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.2955.1592902033926166411
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Jun 2020 01:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hWeE19G2;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id g18so10559847wrm.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Jun 2020 01:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5tnYXlxCtNqCiwG+WMEFhLvYq80p1gSifTroaDmb59M=;
        b=hWeE19G2ttv704l/b7poPGY2vKeazY3oa6iqv9IfYIK7ma5ty3OerdkX8hZh9wFyIW
         mvajxJV14XNO9L8eEeUsH4E7qQLFnk4gGqN2u+E+zVf1uRlB0mHqHVa7BjW6kIwkLX1X
         OGKfstpgYJwV4u+2lxyTEtAWc7YlAMIvyrsm9IjD4f6LFLkI3UHTBNb5PM2eFPsP9u3l
         eoGD0qIEnrKYd4ui6npnZH3RgHS7wAaO5SzN+gAKDbCRpo6I31u7LJntPIBUOK/LFrn/
         lN3S7ep1PasewTzpUrm6/CF5m7ySzc+EOdjjfQmI3Xopd6GCeQvHz83YoxsFSJOaJaxa
         wD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5tnYXlxCtNqCiwG+WMEFhLvYq80p1gSifTroaDmb59M=;
        b=QNk3SDx8pMkLGWLGIkW+uYJwqOPGp/Q2pihjcG45SZfK1CF4KTBU5fk5Vlv1gET+k3
         SrloyJ8zZU1zI+zBu+/IhJxjSJ7hsYs3DYmKo46irdlII/+vashTgMzWESlLvhAttp+w
         26ojeCZfZDCWq7dXN1GHmJo32PDIojCXovHIuTyYWnXmcnsxAk/ETp+zghRjn6207VIH
         L3G6F8HEQu5DZfOZ1Wj1EELeArF0qyru3QtTVaRXjJOA7yTu5+wTAC9SXEJS32E6340r
         j4uByVr+cSg9ksusrkCIxTCvdMbU5NODlkoeHLWKXxvQ57Fy43N6g9NvY1zr1bIzZzux
         +qZg==
X-Gm-Message-State: AOAM530W+R9SAwi7a7goKTShFabOW2h5QeJbdXAmUxKUaAc5Z9/STOWl
	cI+FUWlIdlvSeEmt5Fzznr3s6Ibs
X-Google-Smtp-Source: ABdhPJxoNCb2SDLtyBR5ShRW3KyPeRjA+RbICyjvW85pLEXdfmaOogi3nm74do/m5f6ysUu0RXKG6w==
X-Received: by 2002:adf:e287:: with SMTP id v7mr20284406wri.329.1592902032300;
        Tue, 23 Jun 2020 01:47:12 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain (m83-185-43-74.cust.tele2.se. [83.185.43.74])
        by smtp.gmail.com with ESMTPSA id 133sm3101573wme.5.2020.06.23.01.47.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jun 2020 01:47:11 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH] python3-newrelic: uprev 5.4.1.134 > 5.14.1.144
Date: Tue, 23 Jun 2020 10:48:14 +0200
Message-Id: <20200623084814.25045-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Also drop SRCNAME/SRC_URI/S, change to inherit pypi.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 ...5.4.1.134.bb => python3-newrelic_5.14.1.144.bb} | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)
 rename recipes-devtools/python/{python3-newrelic_5.4.1.134.bb => python3-newrelic_5.14.1.144.bb} (56%)

diff --git a/recipes-devtools/python/python3-newrelic_5.4.1.134.bb b/recipes-devtools/python/python3-newrelic_5.14.1.144.bb
similarity index 56%
rename from recipes-devtools/python/python3-newrelic_5.4.1.134.bb
rename to recipes-devtools/python/python3-newrelic_5.14.1.144.bb
index 36eec67..42e87d3 100644
--- a/recipes-devtools/python/python3-newrelic_5.4.1.134.bb
+++ b/recipes-devtools/python/python3-newrelic_5.14.1.144.bb
@@ -6,18 +6,12 @@ DESCRIPTION = "\
   "
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & MIT & Python-2.0 & BSD-2-Clause & NewRelic"
-LIC_FILES_CHKSUM = "file://newrelic/LICENSE;md5=2c3b4d48a631fe909df7a767726d4f6c"
+LIC_FILES_CHKSUM = "file://newrelic/LICENSE;md5=b4840908dbb9e62b3d8891e77187b34f"
 
-SRCNAME = "newrelic"
+SRC_URI[md5sum] = "53115aea6cbdf0e2721279c230230600"
+SRC_URI[sha256sum] = "340ebcdb0dd08bfb597c71598d6d8f746a93f7e4921f10b3616c9142c608a14d"
 
-SRC_URI = "https://pypi.python.org/packages/source/n/newrelic/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "45099c6d88dcf474267226469caa845e"
-SRC_URI[sha256sum] = "0e651f2ff48dd1fc538fc1297892cf726d1ad4fc0b2578aae6a47f10f16afb2c"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools3
+inherit pypi setuptools3
 
 FILES_${PN}-dbg += "\
   ${PYTHON_SITEPACKAGES_DIR}/newrelic-${PV}/newrelic/*/.debug \
-- 
2.27.0

