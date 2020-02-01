Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.444.1580579261148142944
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 01 Feb 2020 09:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qsYl66Co;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id x7so10471612ljc.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 01 Feb 2020 09:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Py4q988J4QlEdlY6C2jZYf8vGIGHs0ojavywJsjgi94=;
        b=qsYl66CoAOffpxizKk2P9h2PLy0Ewp9WmtwC5qpFDyBdK5rh8+458PkXn1rRvG259D
         ObjXKj0Qo7IgytkPHbaT0buIR87raU7F/HGS2fOv+cHx+h2YgS2GCOGF+S44+EdKGp21
         12f/lmhguli5B9mETJMQQymv7a5emB1SeGCToTcek1xzl9JRsxlIyiWU+Fn+bNVPo0a/
         62KxMM+MJPJaCp5nETIVTZw3pl/WxwTFTF6YtKeCFBlW3JFKU2of2ZDrNuFv0hcwE8Bs
         mGDqguuJEoYhi6Xw7hQLa+79BYxLdSVgftKbIno354M8PQGnlmB5Sk9DaKUUSyRqoPD0
         u4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Py4q988J4QlEdlY6C2jZYf8vGIGHs0ojavywJsjgi94=;
        b=G1p4rUjhPfBcK5XqQHORN4edGLmKfjLXRdrjXc6FBfeFw6zfNXYB8s1eAWDspzNJFU
         BWJsw6+DtTfDhBiM2s5p0X/lh6/R7cdFu0Kg2CJnEFv6z7RfDJ7DUxe+o6xvooLwbA7O
         lVxZDV/Heg8pD9EX+bAokJQ8TaLO6cBq+1gl0fU4ItQrnyNk8N8gMvSOF1K55lkhuddU
         Rd1iIJRMJY5Ta+3jmlyK8k6uGmipkTwHcMrYgNRieVZyTXuuKpPpVTASvEjBCzEGFJRd
         06RKQ78fcF1TPzc/IgrqYlfuSWSyazlRJyD0h6zJjImXZZmILsNLSnZCmJyp3fEhE+o0
         AmZg==
X-Gm-Message-State: APjAAAW1vqZkMPkGqTse2t5DVgLAhM0reNgi1Z0WUo9nl2Vsjpoo51sf
	3wUo9nzfG4jr94u1gLPAP6eRPRodfz8=
X-Google-Smtp-Source: APXvYqxVOMwmu4VMDnN9+J4SDwooFYvOR/S+Hd8PdARrcD430I2uquQY+bFtXp28tY/VfNyh/kckRA==
X-Received: by 2002:a2e:8907:: with SMTP id d7mr9640886lji.71.1580579259345;
        Sat, 01 Feb 2020 09:47:39 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
        by smtp.gmail.com with ESMTPSA id k23sm6962153ljj.85.2020.02.01.09.47.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 01 Feb 2020 09:47:38 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	simon.bueler@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] python3-docker-compose: import fastentrypoints
Date: Sat,  1 Feb 2020 18:47:20 +0100
Message-Id: <1580579240-12882-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580579240-12882-1-git-send-email-liu.ming50@gmail.com>
References: <1580579240-12882-1-git-send-email-liu.ming50@gmail.com>

From: Ming Liu <liu.ming50@gmail.com>

The docker-compose project is using console_scripts which hence imports
pkg_resources which is very slow at starting time, see:
https://github.com/pypa/setuptools/issues/510

This could be workaround by importing fastentrypoints module.

Some tests:

Before the patch, on a colibri-imx8x machine:

$ time docker-compose
```

real	0m5.108s
user	0m4.761s
sys	0m0.272s
```

After the patch, on a colibri-imx8x machine:

$ time docker-compose
```

real	0m3.526s
user	0m3.249s
sys	0m0.235s
```

Have verified the patch with:
https://docs.docker.com/compose/gettingstarted

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../0001-setup.py-import-fastentrypoints.patch     | 28 ++++++++++++++++++++++
 .../python3-docker-compose_1.25.0.bb               |  6 ++++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/docker-compose/files/0001-setup.py-import-fastentrypoints.patch

diff --git a/recipes-containers/docker-compose/files/0001-setup.py-import-fastentrypoints.patch b/recipes-containers/docker-compose/files/0001-setup.py-import-fastentrypoints.patch
new file mode 100644
index 0000000..df613e8
--- /dev/null
+++ b/recipes-containers/docker-compose/files/0001-setup.py-import-fastentrypoints.patch
@@ -0,0 +1,28 @@
+From f3a22f0f14a4b3313e6405dfb6c97df949493a34 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Thu, 30 Jan 2020 17:22:19 +0100
+Subject: [PATCH] setup.py: import fastentrypoints
+
+Upstream-Status: Inappropriate [OE specific configuration]
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index ad57969..3cccffc 100644
+--- a/setup.py
++++ b/setup.py
+@@ -12,7 +12,7 @@ import sys
+ import pkg_resources
+ from setuptools import find_packages
+ from setuptools import setup
+-
++import fastentrypoints
+ 
+ def read(*parts):
+     path = os.path.join(os.path.dirname(__file__), *parts)
+-- 
+2.7.4
+
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb b/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
index 36e2417..ba35c49 100644
--- a/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
@@ -8,7 +8,11 @@ inherit pypi setuptools3
 SRC_URI[md5sum] = "275b32cffdad6b9816dc8b4c7e55600a"
 SRC_URI[sha256sum] = "2c5fcbfd3ff445b6f3eebb549cb167ef1d8f70c5806aab8f309fc8fa74cd977e"
 
-SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch"
+SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch \
+            file://0001-setup.py-import-fastentrypoints.patch \
+           "
+
+DEPENDS += "${PYTHON_PN}-fastentrypoints-native"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-cached-property \
-- 
2.7.4

