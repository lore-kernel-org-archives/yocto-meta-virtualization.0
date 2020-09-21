Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.49179.1600716361222007256
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 12:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries-io.20150623.gappssmtp.com header.s=20150623 header.b=N9MeaCOF;
 spf=softfail (domain: foundries.io, ip: 209.85.160.182, mailfrom: ricardo@foundries.io)
Received: by mail-qt1-f182.google.com with SMTP id r8so13418319qtp.13
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Sep 2020 12:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries-io.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UxIsic5+hlvmsqzvgsVDS/Pow6jCsYrptaV/hPUUNZg=;
        b=N9MeaCOFKsNc4SvkiPoFLH8hwAqQH57WypmX/JCCN/O3EiJv6BP979eKjB5T4qi0GU
         WO0HP7Xa8xdAkCK3QL+79KnSbWrebw43gjq6ng46euC1TSnuOthjsmLsos/uMDhMofKi
         2HnGe3CP0Tg5AECCQQzlVDnzes96tIvTrF3n8O/tf/0LaX+ZBqVLkUSronAzxW+scXxx
         B/etIEP7ZMcZbu+Z9Qld4GmA16dGXowVQDRYnrTPWwOMwZDHg+DEjTPQgfj2oExdnk4p
         +yievIyeJ7DkM6FRBkEk3z9nubG6acsoqRA2XsiEBd+CdV1CTpkSF7sDoGicNUGVaerJ
         E/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UxIsic5+hlvmsqzvgsVDS/Pow6jCsYrptaV/hPUUNZg=;
        b=n5fatRD9LYWRaeLv6d9KgKRGBeBfQaP0MBZsvt05vNRevhrAJuoqG/lSTJgEJjTEyx
         e1K317kWvB+j83KAy6clYDQ67MxWOpDSFOatIq14YXhYLZb83yGzDMrHZEC/2KJnm1Is
         lXV6gI9VG4EBA1UZHvH8oTnxiBcCTtbnaaYWV1nU7a64JrSvO8sHsH5yppc05L4uEUeF
         Nr2m8ezEGf1pPMiMTF+T0qKksD66W4qPCR4Bmr90N3iLxbP1Hjnx/Qf9uie2j3E8fO53
         BlXJGMh2XFjTiJ8B7DfADWjp28UNrBHiLh8QnCX6vn4a6PRZhGd7ykSXK7zcBQXeByUB
         Z1mw==
X-Gm-Message-State: AOAM530cq+DaXgyps2Qzq/lN8WnMOU3GR+rFttvcAPmauT1QXPCI1koI
	t0r/qniWOBcqaJTS8/I2dRRsjGgb7AX7
X-Google-Smtp-Source: ABdhPJwU1FyB8ggQGzRPa6ydR08ByTChH2fVzwnTOfWETCy+os0UtDog0n70IZ7gLY25wg0gt6Ng4A==
X-Received: by 2002:aed:2b63:: with SMTP id p90mr1092239qtd.71.1600716359937;
        Mon, 21 Sep 2020 12:25:59 -0700 (PDT)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:5fec:886c:4f96:30b8:57fa])
        by smtp.gmail.com with ESMTPSA id t11sm10621185qtp.32.2020.09.21.12.25.58
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 12:25:59 -0700 (PDT)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] python3-websocket-client: remove recipe
Date: Mon, 21 Sep 2020 16:25:55 -0300
Message-Id: <20200921192555.22149-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove local python3-websocket-client recipe in favor of a similar one
that is provided by meta-oe/meta-python (same verison but with the correct
license).

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 recipes-devtools/python/python-websocket-client.inc   | 11 -----------
 .../python/python3-websocket-client_0.57.0.bb         |  2 --
 2 files changed, 13 deletions(-)
 delete mode 100644 recipes-devtools/python/python-websocket-client.inc
 delete mode 100644 recipes-devtools/python/python3-websocket-client_0.57.0.bb

diff --git a/recipes-devtools/python/python-websocket-client.inc b/recipes-devtools/python/python-websocket-client.inc
deleted file mode 100644
index 8604dcb..0000000
--- a/recipes-devtools/python/python-websocket-client.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "WebSocket client for python. hybi13 is supported."
-HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
-LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
-
-inherit pypi
-
-PYPI_PACKAGE = "websocket_client"
-
-SRC_URI[md5sum] = "8061820da5e1de26a6a1a6996d4eebd5"
-SRC_URI[sha256sum] = "d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010"
diff --git a/recipes-devtools/python/python3-websocket-client_0.57.0.bb b/recipes-devtools/python/python3-websocket-client_0.57.0.bb
deleted file mode 100644
index 473e31f..0000000
--- a/recipes-devtools/python/python3-websocket-client_0.57.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-websocket-client.inc
-inherit setuptools3
\ No newline at end of file
-- 
2.28.0

