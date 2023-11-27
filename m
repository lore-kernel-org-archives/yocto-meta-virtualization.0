Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245DBC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 17:02:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.100221.1701104527203673548
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 09:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZofmsvyW;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40859dee28cso36422705e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 09:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701104525; x=1701709325; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WMYY0nGEdZmE6rV+o3cf8RQcKPTZfiD1LxAa7OQn2ZE=;
        b=ZofmsvyWwzEeRMrtlWreWVkg6SwhS6GWNlPqCv2RlvvvSissd/TfZrwYdOB9qwbRlk
         sgGD+hFwEd4/qUCDr21zV+KucCICaOprUkF3gWuZIL+3fB2Bi9NLKplCNnd9Nb4r2wGk
         89uKNxKw7Y/a2UVCLm7rPNo61CTm7dhmWstwvnWgWDT0NqpdWB1kExO1S04m+QtA/1iH
         CEjMahqxYyQ2cps+n22xREtImvROgm2G4+tXAnTfP295G6Ha33pT/4GWxhiwa2Lf06OM
         +AULPpmxQkIQKBIdk5EZND1lHZhycd/wEzainltxHSTzO25JjEDm58ts/QkVRBVYiDB4
         ycqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701104525; x=1701709325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMYY0nGEdZmE6rV+o3cf8RQcKPTZfiD1LxAa7OQn2ZE=;
        b=pZwgf3S6ZLG4WhShLfDEu1InFY229cGirbv/tfnAn6hasalqQYtYOOhWqAAEG82OdP
         +tkLHqtrVBO00+S6MP5RIHUDNeAWelQMEQ55TT3NlsEg6zKcjuDyHhZ89W7lQKus9StA
         D31GJ1/Z5qknbm+FPDYGYuX2kwyb4utQE0x53UrUprmBoSSyjvaxwDb9YqYuLQFpT8X9
         O0k0vbK6lFErlTJ3meO8WpUeM2mBgVEftS24KTxVMW8MU0nArvSjdQqqW99UEsUkkNKQ
         ypYD4PUteZl9FefodQCUDI224U9zOYvrDDkiBgmGhdcEXfMqJXqTcPGquKZ7V/O3GLuU
         X9BA==
X-Gm-Message-State: AOJu0YwNQh1O/NEPX3mQR5SeTe13iFeD/Ad9kWJAm/WaJd+oQLWL8WId
	cC3ALRYcjHG4VjoVDHNtDJx4zEfuVm0=
X-Google-Smtp-Source: AGHT+IE6TidqiDJi8/FpfEXh/ve3/zbT0/WN5lqOGJ4QqUSq4F+ic2hHG0S7/bPV3LepOF7to/op9Q==
X-Received: by 2002:a05:600c:4f90:b0:40a:4c7e:6f3e with SMTP id n16-20020a05600c4f9000b0040a4c7e6f3emr10094395wmq.21.1701104524783;
        Mon, 27 Nov 2023 09:02:04 -0800 (PST)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id fl11-20020a05600c0b8b00b0040b47f358e9sm2722557wmb.2.2023.11.27.09.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 09:02:04 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][PATCH] docker-compose: drop unused patches
Date: Mon, 27 Nov 2023 17:01:57 +0000
Message-ID: <20231127170157.1931574-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 17:02:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8470

Drop unused patches from the python version

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...0001-setup.py-import-fastentrypoints.patch | 28 ---------
 ...-remove-maximum-version-requirements.patch | 57 -------------------
 2 files changed, 85 deletions(-)
 delete mode 100644 recipes-containers/docker-compose/files/0001-setup.py-import-fastentrypoints.patch
 delete mode 100644 recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch

diff --git a/recipes-containers/docker-compose/files/0001-setup.py-import-fastentrypoints.patch b/recipes-containers/docker-compose/files/0001-setup.py-import-fastentrypoints.patch
deleted file mode 100644
index df613e8..0000000
--- a/recipes-containers/docker-compose/files/0001-setup.py-import-fastentrypoints.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f3a22f0f14a4b3313e6405dfb6c97df949493a34 Mon Sep 17 00:00:00 2001
-From: Ming Liu <liu.ming50@gmail.com>
-Date: Thu, 30 Jan 2020 17:22:19 +0100
-Subject: [PATCH] setup.py: import fastentrypoints
-
-Upstream-Status: Inappropriate [OE specific configuration]
-
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index ad57969..3cccffc 100644
---- a/setup.py
-+++ b/setup.py
-@@ -12,7 +12,7 @@ import sys
- import pkg_resources
- from setuptools import find_packages
- from setuptools import setup
--
-+import fastentrypoints
- 
- def read(*parts):
-     path = os.path.join(os.path.dirname(__file__), *parts)
--- 
-2.7.4
-
diff --git a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
deleted file mode 100644
index 7205d3b..0000000
--- a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From e3aca6421e003d03d119e69bf3d6b30bb5c662c9 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Fri, 22 Nov 2019 09:24:58 +0800
-Subject: [PATCH] setup.py: remove maximum version requirements
-
-Remove maximum version requirements so that docker-compose will not
-require old version recipes.
-
-Upstream-Status: Inappropriate [OE Specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
----
- setup.py | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-Index: docker-compose-1.29.1/setup.py
-===================================================================
---- docker-compose-1.29.1.orig/setup.py
-+++ docker-compose-1.29.1/setup.py
-@@ -25,16 +25,21 @@
- 
- 
- install_requires = [
--    'docopt >= 0.6.1, < 1',
--    'PyYAML >= 3.10, < 6',
--    'requests >= 2.20.0, < 3',
--    'texttable >= 0.9.0, < 2',
-+    'docopt >= 0.6.1',
-+    'PyYAML >= 3.10',
-+    'requests >= 2.20.0',
-+    'texttable >= 0.9.0',
-     'websocket-client >= 0.32.0, < 1',
-     'distro >= 1.5.0, < 2',
--    'docker[ssh] >= 5',
-+    'docker[ssh] >= 4.4.0, < 5',
-     'dockerpty >= 0.4.1, < 1',
-     'jsonschema >= 2.5.1, < 4',
--    'python-dotenv >= 0.13.0, < 1',
-+    'websocket-client >= 0.32.0',
-+    'distro >= 1.5.0',
-+    'docker[ssh] >= 5',
-+    'dockerpty >= 0.4.1',
-+    'jsonschema >= 2.5.1',
-+    'python-dotenv >= 0.13.0',
- ]
- 
- 
-@@ -51,7 +56,7 @@
-     ':python_version < "3.5"': ['backports.ssl_match_hostname >= 3.5, < 4'],
-     ':python_version < "3.8"': ['cached-property >= 1.2.0, < 2'],
-     ':sys_platform == "win32"': ['colorama >= 0.4, < 1'],
--    'socks': ['PySocks >= 1.5.6, != 1.5.7, < 2'],
-+    'socks': ['PySocks >= 1.5.6, != 1.5.7'],
-     'tests': tests_require,
- }
- 
-- 
2.43.0


