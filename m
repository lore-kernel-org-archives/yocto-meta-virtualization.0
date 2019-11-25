Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web09.1502.1574712158662412176
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 12:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RnN+9ttb;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id e10so8230754ljj.6
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Nov 2019 12:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FUGaWDQ4BiPa6esqEoCNmyS9RCdn1yHYudiid/301xY=;
        b=RnN+9ttbW9mw3PHUXpfLrIZ31SeRlYnEFAaHg1koRFX545L2Jt8kdtN9RAWfPkhd78
         O8Xjf/9M+lfNMIhm5cdaMGz+aMqZNyIy67IVHd/Qvjl7uusQ5yYZmDPUwrwnvVX9ic5y
         NrOo8v0T18dciMuAhZNOxtvbplfVpWOrYg7JsDQ6mlGQfMX0atWkHfaDsa3FF8kNBHbt
         Y3xFyDpQlkrBeJOQmI6esZ0tm/L9Yv/N5E7GDL5QlAWizyNPifxFaV2UEYr800YgHVtv
         SoXGzCBjZqvQW0/XdFURIPTyo5aRuzkPRG74g79rBawfxw1uU5NKdfAn4xt1+O7sXkP1
         DuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FUGaWDQ4BiPa6esqEoCNmyS9RCdn1yHYudiid/301xY=;
        b=ZzZU4K78zryS0YmvQiJ5j2jVth8bZhfzv2EtYWOGYi/BLXBirwwyN496+0Y2B39ZxE
         CL0Kwss08h9oBejQGYK+eVer3sYovXKD/IPe+nj8h0JZtmSu1tjyvy2ut25S95m+A3AO
         Th/Mijxjke5A68OLJy2RN4XeQW3hoZ/ojiiGh8mej1frdOEqjFqE3ca6tr06xaqu9op0
         AB+YC5kNqCsfMnpoUeiHohchFvCwGbWTEtKDkMjkwU6PTj6n57W7c3G6+lFx9wSll0EW
         wd6LGv2yaubneOllXFqs3M2oTeH+UjlY0DO/tcYtqBievLV7MR1uUBGW7veaJgmhpWrW
         NT6A==
X-Gm-Message-State: APjAAAU7jtnYN5oVRBxAwnrS6r4zxpinTMQ0A57w7da563oGOnoCLoKe
	Umty84gcv+sWENPkfEZpWbV1pEr5saI=
X-Google-Smtp-Source: APXvYqz1bN4pgyBAshaRCbZNrT0GDsGLUJwZ7vseQeP5p+aUpTaWKXGFcTQdLJrlXcUGhNCZYoNdRw==
X-Received: by 2002:a2e:88c3:: with SMTP id a3mr23957749ljk.92.1574712156665;
        Mon, 25 Nov 2019 12:02:36 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
        by smtp.gmail.com with ESMTPSA id 27sm4498526ljv.82.2019.11.25.12.02.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 25 Nov 2019 12:02:36 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization][PATCH] docker-compose: uprev to 1.25.0
Date: Mon, 25 Nov 2019 21:02:33 +0100
Message-Id: <1574712153-6498-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ...docker-compose-compatible-with-PyYAML-5.3.patch | 36 ++++++++++++++++++
 ...ose-support-newer-minor-version-of-reques.patch | 44 ----------------------
 .../python3-docker-compose_1.21.2.bb               | 31 ---------------
 .../python3-docker-compose_1.25.0.bb               | 34 +++++++++++++++++
 4 files changed, 70 insertions(+), 75 deletions(-)
 create mode 100644 recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch
 delete mode 100644 recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
 delete mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
 create mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb

diff --git a/recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch b/recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch
new file mode 100644
index 0000000..790648a
--- /dev/null
+++ b/recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch
@@ -0,0 +1,36 @@
+From 10e9b0accbfef93f7d26d1cd470545ad64e370ff Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Mon, 25 Nov 2019 13:53:11 +0100
+Subject: [PATCH] Make docker-compose compatible with PyYAML < 5.3.
+
+Upstream is not yet using PyYAML 5.1 as they are waiting for the
+final 5.2 release (due api differences that does not affect compose),
+so make it compatible with PyYAML < 5.3 as OE now ships with 5.1.2.
+
+Derives from:
+https://github.com/foundriesio/meta-lmp/commit/117d2d73b9e982dec25f24a2665a1b03a040412f
+
+Upstream-Status: Inappropriate [OE specific]
+
+Ricardo Salveti <ricardo@foundries.io>
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 23ae08a..8a5f5d0 100644
+--- a/setup.py
++++ b/setup.py
+@@ -32,7 +32,7 @@ def find_version(*file_paths):
+ install_requires = [
+     'cached-property >= 1.2.0, < 2',
+     'docopt >= 0.6.1, < 1',
+-    'PyYAML >= 3.10, < 5',
++    'PyYAML >= 3.10, < 5.3',
+     'requests >= 2.20.0, < 3',
+     'texttable >= 0.9.0, < 2',
+     'websocket-client >= 0.32.0, < 1',
+-- 
+2.7.4
+
diff --git a/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch b/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
deleted file mode 100644
index 48a6f25..0000000
--- a/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From b4655b5e7f1e5b87a758dfd7af01a49a40ed148a Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Thu, 10 Oct 2019 15:46:20 +0800
-Subject: [PATCH] docker-compose: support newer minor version of requests
-
-Signed-off-by: Ofek Lev <ofekmeister@gmail.com>
-
-Upstream-Status: Backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- requirements.txt | 2 +-
- setup.py         | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/requirements.txt b/requirements.txt
-index 93a0cce..42bde41 100644
---- a/requirements.txt
-+++ b/requirements.txt
-@@ -16,7 +16,7 @@ pypiwin32==219; sys_platform == 'win32' and python_version < '3.6'
- pypiwin32==220; sys_platform == 'win32' and python_version >= '3.6'
- PySocks==1.6.7
- PyYAML==3.12
--requests==2.18.4
-+requests==2.19.1
- six==1.10.0
- texttable==0.9.1
- urllib3==1.21.1
-diff --git a/setup.py b/setup.py
-index 422ba54..a74ee0f 100644
---- a/setup.py
-+++ b/setup.py
-@@ -33,7 +33,7 @@ install_requires = [
-     'cached-property >= 1.2.0, < 2',
-     'docopt >= 0.6.1, < 0.7',
-     'PyYAML >= 3.10, < 4',
--    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
-+    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.20',
-     'texttable >= 0.9.0, < 0.10',
-     'websocket-client >= 0.32.0, < 1.0',
-     'docker >= 3.3.0, < 4.0',
--- 
-1.9.1
-
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
deleted file mode 100644
index a7f7b1c..0000000
--- a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Multi-container orchestration for Docker"
-HOMEPAGE = "https://www.docker.com/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
-
-SRC_URI += "file://0001-docker-compose-support-newer-minor-version-of-reques.patch"
-
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = "a243f59b2d286c41ff6ed1c4d4b50996"
-SRC_URI[sha256sum] = "68b07193755440d5f8d4f47e6f3484212afc255d5b785a81353ea1e9298c1c2c"
-
-RDEPENDS_${PN} = "\
-  ${PYTHON_PN}-cached-property \
-  ${PYTHON_PN}-certifi \
-  ${PYTHON_PN}-chardet \
-  ${PYTHON_PN}-colorama \
-  ${PYTHON_PN}-docker \
-  ${PYTHON_PN}-docker-pycreds \
-  ${PYTHON_PN}-dockerpty \
-  ${PYTHON_PN}-docopt \
-  ${PYTHON_PN}-idna \
-  ${PYTHON_PN}-jsonschema \
-  ${PYTHON_PN}-pyyaml \
-  ${PYTHON_PN}-requests \
-  ${PYTHON_PN}-six \
-  ${PYTHON_PN}-terminal \
-  ${PYTHON_PN}-texttable \
-  ${PYTHON_PN}-urllib3 \
-  ${PYTHON_PN}-websocket-client \
-  "
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb b/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
new file mode 100644
index 0000000..e048acd
--- /dev/null
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Multi-container orchestration for Docker"
+HOMEPAGE = "https://www.docker.com/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "275b32cffdad6b9816dc8b4c7e55600a"
+SRC_URI[sha256sum] = "2c5fcbfd3ff445b6f3eebb549cb167ef1d8f70c5806aab8f309fc8fa74cd977e"
+
+SRC_URI += "file://0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-cached-property \
+    ${PYTHON_PN}-certifi \
+    ${PYTHON_PN}-chardet \
+    ${PYTHON_PN}-colorama \
+    ${PYTHON_PN}-docker \
+    ${PYTHON_PN}-docker-pycreds \
+    ${PYTHON_PN}-dockerpty \
+    ${PYTHON_PN}-docopt \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-jsonschema \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-paramiko \
+    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-requests \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-terminal \
+    ${PYTHON_PN}-texttable \
+    ${PYTHON_PN}-urllib3 \
+    ${PYTHON_PN}-websocket-client \
+"
-- 
2.7.4

