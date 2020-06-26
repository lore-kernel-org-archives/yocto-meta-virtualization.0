Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web11.11165.1593188072897840514
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 09:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LHFL5rn7;
 spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id t74so5479429lff.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jun 2020 09:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0nAT63Kyap3U/9KHzCkxv2SrqvkHmpIxzTIg5bg5SOM=;
        b=LHFL5rn7i7h7YkBXPyRoyom/j/Z3vhsOHA4vTkSpajnH7RVz5eh19Xko7ud8FAruqZ
         Z7b5gi28kQcJpJUWVSR0PBcvxwb16yiGXZNcQvDXRaxL8aJi9tfR3iap/pWJlj+OBoNH
         gJRXXCgxD1DWQwX1t4RFdS1uDGpUxN9GS19nU1K/HknteMMS6sRNXQl0pvOnSjpSN354
         1UAYLs1/o21+lf5QfUUKpS2XyJRFiJ6kwP+9PYEO5kJm5y/yuP+xos/OBNPqAKh3wFXV
         NEgTGdQc2cBcijHO6OrvvpSUI13GqaNxaCkk25mhhi3Yz3eh/aItcoxnqtz+UFRddb/2
         5FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0nAT63Kyap3U/9KHzCkxv2SrqvkHmpIxzTIg5bg5SOM=;
        b=AjL3lt/KX2GiM142Rb6o1Z7I8Ke0q4G13T5H8wIoe9rw6WbeMvLUnQ9hLLyCw99Vrf
         o63d2MyE8IZVvK5CtpKukYVv59dXb4IjLSQLZeSg7xy/8h/n4MpDY3tUuz1mL45d6PVi
         CjA+uurpklgK59euyn2EVf8Tffnz9uGN9qUuEcJwP4oNuCpKlAejTskbgh5E6zGCaUf7
         g8EkzRZDzW5n+RdYBdwIVT7/Yi3nZkRbAp4dddK6wD/U4ddQvYPhN8TPdXHnTtHPCjau
         VN68a529khMrGtgOJuYcPNURyrl7tq/YkdQuKHljsZ45BvF6sloIWtG+cM9vgg0Mmv0F
         0jHg==
X-Gm-Message-State: AOAM533P3EtEweNDWEbQ84/FvYqImJSrpQ7ultZ6hsglHIAPz14FJlrP
	XBDfZ1LLi/59qKsDBsr9X390au5A
X-Google-Smtp-Source: ABdhPJxYWsrX7o610CMtAQAtz7+4Ct2KmNYIgfIIKAF+NKa4uD4JGFduWTnFhlM5frDSvowaqCzh9g==
X-Received: by 2002:a19:4143:: with SMTP id o64mr2221157lfa.157.1593188070800;
        Fri, 26 Jun 2020 09:14:30 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id j26sm5624820lfm.11.2020.06.26.09.14.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 09:14:30 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH] python3-docker-compose: uprev 1.25.5 > 1.26.0
Date: Fri, 26 Jun 2020 18:16:01 +0200
Message-Id: <20200626161601.32419-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

The major changes include:
d4451659 Bump 1.26.0
3d94f442 Bump 1.26.0-rc5
1386a855 Merge pull request #7485 from ulyssessouza/fix-https-daemon
8034c96d Bump docker-py
48d09369 Fix flake8 errors
28bf47ce Pin wcwidth==0.1.9
d279b7a8 Bump 1.26.0-rc4
83371df2 Merge branch 'master' into 1.26.x
9c5351cf Merge pull request #7389 from ulyssessouza/general-bumps-for-1_26
836e2b7c General bumps
266d287e Merge pull request #7390 from ulyssessouza/remove-unused-resources
d64f3f39 Remove unused files
4e310a94 Merge pull request #7386 from ulyssessouza/bump-python-dotenv-1_13_0
d52b51e8 Bump python-dotenv from 0.11.0 to 0.13.0
64a6a48b Merge pull request #7345 from docker/dependabot/pip/certifi-2020.4.5.1
0979c7a1 Merge pull request #7380 from joehattori/simplify-code
ce782b59 Simplify code in compose/config/config.py
b7d6dc79 Bump certifi from 2019.11.28 to 2020.4.5.1
c22a2510 Merge pull request #7374 from ulyssessouza/fix-distro-guess
a62a1e1d Add "distro" package
afc5d205 Merge pull request #7371 from ulyssessouza/bump-openssl-111f
4d2afc07 Merge pull request #7372 from ulyssessouza/update-changelog

Have verified on arm/arm64/x86_64 against:
https://docs.docker.com/compose/gettingstarted

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 ...tup.py-remove-maximum-version-requirements.patch | 13 +++++++++----
 ...e_1.25.5.bb => python3-docker-compose_1.26.0.bb} |  7 +++++--
 2 files changed, 14 insertions(+), 6 deletions(-)
 rename recipes-containers/docker-compose/{python3-docker-compose_1.25.5.bb => python3-docker-compose_1.26.0.bb} (81%)

diff --git a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
index 6e5ca3d..f517d05 100644
--- a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
+++ b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
@@ -11,14 +11,14 @@ Upstream-Status: Inappropriate [OE Specific]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Ming Liu <liu.ming50@gmail.com>
 ---
- setup.py | 22 +++++++++++-----------
- 1 file changed, 11 insertions(+), 11 deletions(-)
+ setup.py |   26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
 
 diff --git a/setup.py b/setup.py
 index 110441dc..eef28254 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -30,16 +30,16 @@ def find_version(*file_paths):
+@@ -30,18 +30,18 @@ def find_version(*file_paths):
  
  
  install_requires = [
@@ -28,29 +28,34 @@ index 110441dc..eef28254 100644
 -    'requests >= 2.20.0, < 3',
 -    'texttable >= 0.9.0, < 2',
 -    'websocket-client >= 0.32.0, < 1',
+-    'distro >= 1.5.0, < 2',
 -    'docker[ssh] >= 3.7.0, < 5',
 -    'dockerpty >= 0.4.1, < 1',
 -    'six >= 1.3.0, < 2',
 -    'jsonschema >= 2.5.1, < 4',
+-    'python-dotenv >= 0.13.0, < 1',
 +    'cached-property >= 1.2.0',
 +    'docopt >= 0.6.1',
 +    'PyYAML >= 3.10',
 +    'requests >= 2.20.0',
 +    'texttable >= 0.9.0',
 +    'websocket-client >= 0.32.0',
++    'distro >= 1.5.0',
 +    'docker[ssh] >= 3.7.0',
 +    'dockerpty >= 0.4.1',
 +    'six >= 1.3.0',
 +    'jsonschema >= 2.5.1',
++    'python-dotenv >= 0.13.0',
  ]
  
  
-@@ -58,7 +58,7 @@ extras_require = {
+@@ -61,7 +61,7 @@ extras_require = {
      ':python_version < "3.3"': ['backports.shutil_get_terminal_size == 1.0.0',
                                  'ipaddress >= 1.0.16, < 2'],
      ':sys_platform == "win32"': ['colorama >= 0.4, < 1'],
 -    'socks': ['PySocks >= 1.5.6, != 1.5.7, < 2'],
 +    'socks': ['PySocks >= 1.5.6, != 1.5.7'],
+     'tests': tests_require,
  }
  
  
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.25.5.bb b/recipes-containers/docker-compose/python3-docker-compose_1.26.0.bb
similarity index 81%
rename from recipes-containers/docker-compose/python3-docker-compose_1.25.5.bb
rename to recipes-containers/docker-compose/python3-docker-compose_1.26.0.bb
index dece5da..37c62e8 100644
--- a/recipes-containers/docker-compose/python3-docker-compose_1.25.5.bb
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.26.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "a6f296957148e4c61b28fb324c27c966"
-SRC_URI[sha256sum] = "7a2eb6d8173fdf408e505e6f7d497ac0b777388719542be9e49a0efd477a50c6"
+SRC_URI[md5sum] = "f7d54de5db1f17322c09db8157bd160f"
+SRC_URI[sha256sum] = "7e836102d139aca667d6af53f0f4d942c9459ec24d6dd4f0203d74359b0fd311"
 
 SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch \
             file://0001-setup.py-import-fastentrypoints.patch \
@@ -19,10 +19,12 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-certifi \
     ${PYTHON_PN}-chardet \
     ${PYTHON_PN}-colorama \
+    ${PYTHON_PN}-distro \
     ${PYTHON_PN}-docker \
     ${PYTHON_PN}-docker-pycreds \
     ${PYTHON_PN}-dockerpty \
     ${PYTHON_PN}-docopt \
+    ${PYTHON_PN}-dotenv \
     ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-idna \
     ${PYTHON_PN}-jsonschema \
@@ -34,5 +36,6 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-terminal \
     ${PYTHON_PN}-texttable \
     ${PYTHON_PN}-urllib3 \
+    ${PYTHON_PN}-wcwidth \
     ${PYTHON_PN}-websocket-client \
 "
-- 
2.27.0

