Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web11.6246.1575314858347103210
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Dec 2019 11:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FwT5PZ+T;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id q6so761655lfb.6
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Dec 2019 11:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ncvvrTJmp+88EJkixBbVQypI2tKpIBH0yW4ghidGu4Q=;
        b=FwT5PZ+Tx9SaYog/WsHcELKrfphDPVPROPMSda4viVnVYCjGcHXkTZKGJPYLBO3eah
         9vRGNrH0BJFv7saj2yDWroKXvQKV715X/V2ey4zJf/o4EeLFFvNWIfe9qtQkQ6XqNT4g
         ylzkpRxIOiIE5joWAkECfnfBCE17lld/c7/wMa3Uno9iVTjoRAbm8wbbKLHYLw9+W7Hp
         OvkMhcVGXm4RXsjc5VBYE66vOzyIiJiK/6fcyuCRxtVORzTRJ15kxxzbJSlNAqascua4
         3TlnZblhIsqpwNgGJjr9MgISc80KqQBDeyTR+FaS9d22/5F8hPdm8Gn4Iqq6Bff6HEgE
         TQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ncvvrTJmp+88EJkixBbVQypI2tKpIBH0yW4ghidGu4Q=;
        b=J1tA6OEhY090tcsKjyREJ5gMKehS6FCcN1jSMm4d6vk0FpjDqHGSbE5bFB62LuQltY
         L4U3aNoOhg8S/+EwHjhQIpICxckeiKsRLXdRqD7nK319jszrvqXQxpamlVjOn4GqA3RP
         xbFF2uF3rRJtaojkdx1Pb/P+Dld6QQZz1TH1oyWBQue3j9EJGEqn/bop9c1kJnQvuFli
         3vIFpCUP12OxN9WJ0zI0xAeoFFV2C78U9eMDsijaeHh0w35iMmvrUbWPXC0No8V/ukdT
         ZDk9xXfi6gW2VwfVj17oaGl+2m7IbFFlvqqGyz1+BKSGNwUe/CYY2Lj/WXwobZaqEQAK
         sZLw==
X-Gm-Message-State: APjAAAWJ3R81kMniHTqMyLq44Y6Ziwb8nYXbuV6icmI4AvCm1BVqTezl
	afvglD8Su24uSXQzZqpAq9SBAUvAd9Q=
X-Google-Smtp-Source: APXvYqwonP4Vjkk5D8Cf1w+ltrIY5vXYeTS/7Yi/CvjU2gPV+5ynrl0GAofx6nZ7mB0I1tOhpf2tbQ==
X-Received: by 2002:a05:6512:20e:: with SMTP id a14mr413340lfo.63.1575314856413;
        Mon, 02 Dec 2019 11:27:36 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
        by smtp.gmail.com with ESMTPSA id z20sm224534ljj.85.2019.12.02.11.27.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 02 Dec 2019 11:27:36 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Qi.Chen@windriver.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization] [PATCH 3/3] python3-docker-compose: uprev to 1.25.0
Date: Mon,  2 Dec 2019 20:27:13 +0100
Message-Id: <1575314833-10994-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575314833-10994-1-git-send-email-liu.ming50@gmail.com>
References: <1575314833-10994-1-git-send-email-liu.ming50@gmail.com>

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ...up.py-remove-maximum-version-requirements.patch | 33 +++++++++++----------
 .../python3-docker-compose_1.21.2.bb               | 31 --------------------
 .../python3-docker-compose_1.25.0.bb               | 34 ++++++++++++++++++++++
 3 files changed, 51 insertions(+), 47 deletions(-)
 delete mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
 create mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb

diff --git a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
index 54835ff..8d204a7 100644
--- a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
+++ b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
@@ -9,12 +9,13 @@ require old version recipes.
 Upstream-Status: Inappropriate [OE Specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
 ---
  setup.py | 22 +++++++++++-----------
  1 file changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 422ba54..c2b4556 100644
+index 23ae08a..eef2825 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -30,16 +30,16 @@ def find_version(*file_paths):
@@ -22,37 +23,37 @@ index 422ba54..c2b4556 100644
  
  install_requires = [
 -    'cached-property >= 1.2.0, < 2',
--    'docopt >= 0.6.1, < 0.7',
--    'PyYAML >= 3.10, < 4',
--    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
--    'texttable >= 0.9.0, < 0.10',
--    'websocket-client >= 0.32.0, < 1.0',
--    'docker >= 3.3.0, < 4.0',
--    'dockerpty >= 0.4.1, < 0.5',
+-    'docopt >= 0.6.1, < 1',
+-    'PyYAML >= 3.10, < 5',
+-    'requests >= 2.20.0, < 3',
+-    'texttable >= 0.9.0, < 2',
+-    'websocket-client >= 0.32.0, < 1',
+-    'docker[ssh] >= 3.7.0, < 5',
+-    'dockerpty >= 0.4.1, < 1',
 -    'six >= 1.3.0, < 2',
--    'jsonschema >= 2.5.1, < 3',
+-    'jsonschema >= 2.5.1, < 4',
 +    'cached-property >= 1.2.0',
 +    'docopt >= 0.6.1',
 +    'PyYAML >= 3.10',
-+    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0',
++    'requests >= 2.20.0',
 +    'texttable >= 0.9.0',
 +    'websocket-client >= 0.32.0',
-+    'docker >= 3.3.0',
++    'docker[ssh] >= 3.7.0',
 +    'dockerpty >= 0.4.1',
 +    'six >= 1.3.0',
 +    'jsonschema >= 2.5.1',
  ]
  
  
-@@ -56,7 +56,7 @@ extras_require = {
-     ':python_version < "3.5"': ['backports.ssl_match_hostname >= 3.5'],
-     ':python_version < "3.3"': ['ipaddress >= 1.0.16'],
-     ':sys_platform == "win32"': ['colorama >= 0.3.9, < 0.4'],
+@@ -58,7 +58,7 @@ extras_require = {
+     ':python_version < "3.3"': ['backports.shutil_get_terminal_size == 1.0.0',
+                                 'ipaddress >= 1.0.16, < 2'],
+     ':sys_platform == "win32"': ['colorama >= 0.4, < 1'],
 -    'socks': ['PySocks >= 1.5.6, != 1.5.7, < 2'],
 +    'socks': ['PySocks >= 1.5.6, != 1.5.7'],
  }
  
  
 -- 
-2.17.1
+2.7.4
 
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
deleted file mode 100644
index a895005..0000000
--- a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Multi-container orchestration for Docker"
-HOMEPAGE = "https://www.docker.com/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
-
-SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch"
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
index 0000000..36e2417
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
+SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch"
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

