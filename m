Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.1104.1580854791098228947
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Feb 2020 14:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries-io.20150623.gappssmtp.com header.s=20150623 header.b=kKCuhFSt;
 spf=softfail (domain: foundries.io, ip: 209.85.219.52, mailfrom: ricardo@foundries.io)
Received: by mail-qv1-f52.google.com with SMTP id y2so149462qvu.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Feb 2020 14:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries-io.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XzybMP5hwxp+md0Dvny80/mSCls6POwzp+NiaOkfpSE=;
        b=kKCuhFSt0C2qOLTri4wylIoZap32DoHvP/ksjToFcCK71V8gRCMGYvIBIWokbTVq7Q
         yVVbhuzQEMtNOYBZgv1sRzZq4Rh57/DJTZYsLGIwA/MgQCIeyhzww/i9vzp9xxKd4Sob
         LjudhesJivmwk4Vn5M1Wok5IRoVaAf7AwsV74bMsZwCb+R+M0VXtWkAe51W6zLOKVMCa
         LBZX3+G180xaZ84yL+GTy2uEr5gnVNJWZHQ0I/rRSsQ0bLs4UIovFW7xylurXS8K9VAC
         DQPfxTct5NWjTOPxd76njFocsh1kpPpLKTrdNIVxm07T4IenSyz94X3zQEvn0mWJoRyO
         m6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XzybMP5hwxp+md0Dvny80/mSCls6POwzp+NiaOkfpSE=;
        b=EJ9DStZUTSROD3WV7HKP9oTS3Fq1CrCqO1v04LB/p8gbXPe60ZM1kR48Ltl7hU4msl
         /w+317kilwIhHwCzNMr2EJncMZ8hhvK9Gc3C6yhP9HgosAWaL0PghW0Gi/plJCOpR0e4
         HO16XksW3hBsa5clLndLGv/CiWy08wIlwPfv/8wHFd7WhiBMVUKA71c/ObLcMWxZfh1B
         B40GmXv1lThKmLFu6fjXrUKb+IMg4VAYv5aU9NLXMS5px3VHA6k8vEMhaa4UovY9Nk3N
         TAPHDVsEFozQ3Av4wNwXS8iNiFDP4RktF09DepFlUucMrN7iwBwT1Qsq0UMY44wlTk53
         ZCxg==
X-Gm-Message-State: APjAAAXBKIZ4uaJy88dns68a9GXleZfnte0Q+t0V19biTcpWI+z+rBHH
	WXdWt8S3ojBaMyCIIxcTawZx/KgKcQ==
X-Google-Smtp-Source: APXvYqzCQf1hp7CfamY0tMIL73aqMhQioWe/cLejv8yDpkMrm/+1oqrdcBFFpaOl+eJZ/kBEBJk3wA==
X-Received: by 2002:a0c:bf0b:: with SMTP id m11mr29996686qvi.63.1580854789946;
        Tue, 04 Feb 2020 14:19:49 -0800 (PST)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f380:e4b2:70a7:4025:c83f:2565])
        by smtp.gmail.com with ESMTPSA id t23sm12279386qtp.82.2020.02.04.14.19.48
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 14:19:49 -0800 (PST)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] python3-docker-compose: update to 1.25.4
Date: Tue,  4 Feb 2020 19:19:47 -0300
Message-Id: <20200204221947.25946-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 ...001-setup.py-remove-maximum-version-requirements.patch | 8 ++++----
 ...compose_1.25.0.bb => python3-docker-compose_1.25.4.bb} | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename recipes-containers/docker-compose/{python3-docker-compose_1.25.0.bb => python3-docker-compose_1.25.4.bb} (87%)

diff --git a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
index 8d204a7..6e5ca3d 100644
--- a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
+++ b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
@@ -1,4 +1,4 @@
-From 2685716409c560cdf94aee6262ed8c32ad137133 Mon Sep 17 00:00:00 2001
+From 1d358acd46c9ca71d848fca8c2d677414257f247 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 22 Nov 2019 09:24:58 +0800
 Subject: [PATCH] setup.py: remove maximum version requirements
@@ -15,7 +15,7 @@ Signed-off-by: Ming Liu <liu.ming50@gmail.com>
  1 file changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 23ae08a..eef2825 100644
+index 110441dc..eef28254 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -30,16 +30,16 @@ def find_version(*file_paths):
@@ -24,7 +24,7 @@ index 23ae08a..eef2825 100644
  install_requires = [
 -    'cached-property >= 1.2.0, < 2',
 -    'docopt >= 0.6.1, < 1',
--    'PyYAML >= 3.10, < 5',
+-    'PyYAML >= 3.10, < 6',
 -    'requests >= 2.20.0, < 3',
 -    'texttable >= 0.9.0, < 2',
 -    'websocket-client >= 0.32.0, < 1',
@@ -55,5 +55,5 @@ index 23ae08a..eef2825 100644
  
  
 -- 
-2.7.4
+2.25.0
 
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb b/recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb
similarity index 87%
rename from recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
rename to recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb
index ba35c49..2dcad1e 100644
--- a/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "275b32cffdad6b9816dc8b4c7e55600a"
-SRC_URI[sha256sum] = "2c5fcbfd3ff445b6f3eebb549cb167ef1d8f70c5806aab8f309fc8fa74cd977e"
+SRC_URI[md5sum] = "893fbb804a9057d6c470b5312407e0d1"
+SRC_URI[sha256sum] = "fabae2bee4abfa7bdd09125b6bbdcdda81f946c7b16e3ccc6bb2d821ef6488f3"
 
 SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch \
             file://0001-setup.py-import-fastentrypoints.patch \
-- 
2.25.0

