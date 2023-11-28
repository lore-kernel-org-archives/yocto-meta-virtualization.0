Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F01C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 10:36:05 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.29733.1701167762094285944
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Nov 2023 02:36:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=miySbcv2;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32fdc5be26dso3268254f8f.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 02:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701167760; x=1701772560; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDf0fLd5bOnP6U8xED3E1Td9bikEsbffRtmUVV5lmpU=;
        b=miySbcv2f5uotrWBIGfAfgwNO0xBNcaLQFlU59tJrSykzMllKGW+GU7Io48r+gujYf
         0F7utu6Y5a+CXYA1jDTgZPkdLQBMI11IdZ1kuOoPhmYWi1FOx+eoVJNIcu9VjA7f+1PD
         A3UY477RDNspxXyR23qf6kr4XKvY2WyldkK1hKiVysMyBcGhl+kmr0uvLrXwziGP0U25
         otxnXUPpv1vm7BG+jlCgQ3qLB1HPspFoAqHMjUIqaHCmLh0lhi3hfivWv1frfKHvHC75
         Q4BhFPONBAz3QRVjEl8dKtvTlisnPB8OgIRViTPzwjXeImue5ea3EjuzIPVVQCMuLJxN
         QJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701167760; x=1701772560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDf0fLd5bOnP6U8xED3E1Td9bikEsbffRtmUVV5lmpU=;
        b=kMb4HPH2j8LVelQRGOo2M+CITtW/u7GfNWT0Is5ALA5Uigqh+NRdsCQKWaKJtSJ7oE
         ItxPQxuo5EUiL29PKP/439pLT4relVb2p438BBVO1UuwJMZ9ibzt1nmutwbBY/rQfz5t
         RcMCWimPpL1ZEPYTSpNikSLCZsHOod1tuMEXIsTqACDWlrC39dzNAvlK1ndy57hBXGAt
         Ug3CjJqI7IgvcoScVCcDSffEYfEkOrQjMFRgcjXVdrn9xghDP21PProDCoJgGKkWAkWn
         uWz0V9L7LC92TOwMTfMi0xQoiS6EKSq/xTh4XLgzHb+xd0QSv91K8jbxlrNTOowpaU0U
         u2hA==
X-Gm-Message-State: AOJu0YzumqYsYgLQuMvL9MVeZpzUbj8Hon3OHUL4jTGU7GtR8DZhEICF
	s5hF7vgZzcgTOgo71WSx9+ULij55uujfow==
X-Google-Smtp-Source: AGHT+IEZ1uXrREGgb5tKFZtrNUmYeBmjjyheUSY0lF+Ucs3KD+3lMS0/WR3p5kMtdu8WPF12iVmx5g==
X-Received: by 2002:a5d:6f1d:0:b0:333:12e8:8ff4 with SMTP id ay29-20020a5d6f1d000000b0033312e88ff4mr64821wrb.27.1701167759855;
        Tue, 28 Nov 2023 02:35:59 -0800 (PST)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id g10-20020a5d64ea000000b003330f9287a8sm1194044wri.51.2023.11.28.02.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 02:35:59 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][PATCH 1/2] docker-compose: drop patches from the removed python version
Date: Tue, 28 Nov 2023 10:35:48 +0000
Message-ID: <20231128103549.2088530-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 10:36:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8477

Drop unused patches from the python version removed in 7bd56074.

https://git.yoctoproject.org/meta-virtualization/commit/recipes-containers/docker-compose?id=7bd56074fece944ef9279d87106eb16452ec6338

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v2: tweak the commit message

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


