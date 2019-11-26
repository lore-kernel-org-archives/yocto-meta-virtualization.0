Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.5397.1574730743684303481
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 17:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: windriver.com, ip: 140.211.169.56, mailfrom: qi.chen@windriver.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 235ADE00F6F; Mon, 25 Nov 2019 17:12:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FBDBE00E3A
	for <meta-virtualization@yoctoproject.org>; Mon, 25 Nov 2019 17:12:21 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xAQ1CIk0025605
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Mon, 25 Nov 2019 17:12:18 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.468.0; Mon, 25 Nov 2019 17:12:17 -0800
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization][PATCH V2] python3-docker-compose: remove maximum version requirements
Date: Tue, 26 Nov 2019 09:12:16 +0800
Message-ID: <20191126011216.15333-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Remove maximum version requirements for docker-compose so that it
does not require old version recipes.

The old version recipes required are as below.
* PyYAML
* requests
* urllib3
* idna
* jsonschema

The current one has been tested against https://docs.docker.com/compose/gettingstarted/.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...upport-newer-minor-version-of-reques.patch | 44 --------------
 ...-remove-maximum-version-requirements.patch | 58 +++++++++++++++++++
 .../python3-docker-compose_1.21.2.bb          |  2 +-
 3 files changed, 59 insertions(+), 45 deletions(-)
 delete mode 100644 recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
 create mode 100644 recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch

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
diff --git a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
new file mode 100644
index 0000000..54835ff
--- /dev/null
+++ b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
@@ -0,0 +1,58 @@
+From 2685716409c560cdf94aee6262ed8c32ad137133 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Fri, 22 Nov 2019 09:24:58 +0800
+Subject: [PATCH] setup.py: remove maximum version requirements
+
+Remove maximum version requirements so that docker-compose will not
+require old version recipes.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ setup.py | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 422ba54..c2b4556 100644
+--- a/setup.py
++++ b/setup.py
+@@ -30,16 +30,16 @@ def find_version(*file_paths):
+ 
+ 
+ install_requires = [
+-    'cached-property >= 1.2.0, < 2',
+-    'docopt >= 0.6.1, < 0.7',
+-    'PyYAML >= 3.10, < 4',
+-    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
+-    'texttable >= 0.9.0, < 0.10',
+-    'websocket-client >= 0.32.0, < 1.0',
+-    'docker >= 3.3.0, < 4.0',
+-    'dockerpty >= 0.4.1, < 0.5',
+-    'six >= 1.3.0, < 2',
+-    'jsonschema >= 2.5.1, < 3',
++    'cached-property >= 1.2.0',
++    'docopt >= 0.6.1',
++    'PyYAML >= 3.10',
++    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0',
++    'texttable >= 0.9.0',
++    'websocket-client >= 0.32.0',
++    'docker >= 3.3.0',
++    'dockerpty >= 0.4.1',
++    'six >= 1.3.0',
++    'jsonschema >= 2.5.1',
+ ]
+ 
+ 
+@@ -56,7 +56,7 @@ extras_require = {
+     ':python_version < "3.5"': ['backports.ssl_match_hostname >= 3.5'],
+     ':python_version < "3.3"': ['ipaddress >= 1.0.16'],
+     ':sys_platform == "win32"': ['colorama >= 0.3.9, < 0.4'],
+-    'socks': ['PySocks >= 1.5.6, != 1.5.7, < 2'],
++    'socks': ['PySocks >= 1.5.6, != 1.5.7'],
+ }
+ 
+ 
+-- 
+2.17.1
+
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
index a7f7b1c..a895005 100644
--- a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.docker.com/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
 
-SRC_URI += "file://0001-docker-compose-support-newer-minor-version-of-reques.patch"
+SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch"
 
 inherit pypi setuptools3
 
-- 
2.17.1

