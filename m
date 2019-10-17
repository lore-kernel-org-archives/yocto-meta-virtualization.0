Return-Path: <Li.Zhou@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE2E0E00D5F; Wed, 16 Oct 2019 22:39:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 748A3E00A5C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Oct 2019 22:39:37 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9H5dZWN024797
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Oct 2019 22:39:36 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 16 Oct 2019 22:39:35 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 17 Oct 2019 13:39:14 +0800
Message-ID: <1571290754-166048-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] python3-docker-compose: upgrade to version 1.21.2
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Oct 2019 05:39:41 -0000
Content-Type: text/plain

The python3-docker-compose_1.16.1 requires 'docker<3.0, >=2.5.1', while
python3-docker 3.4.0 is provided. Error occurs when running
'docker-compose --version'.
Upgrade to python3-docker-compose_1.21.2 to make it work.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../0001-Allow-newer-versions-of-requests.patch    | 32 ----------------
 ...ose-support-newer-minor-version-of-reques.patch | 44 ++++++++++++++++++++++
 ..._1.16.1.bb => python3-docker-compose_1.21.2.bb} |  6 +--
 3 files changed, 47 insertions(+), 35 deletions(-)
 delete mode 100644 recipes-containers/docker-compose/files/0001-Allow-newer-versions-of-requests.patch
 create mode 100644 recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
 rename recipes-containers/docker-compose/{python3-docker-compose_1.16.1.bb => python3-docker-compose_1.21.2.bb} (75%)

diff --git a/recipes-containers/docker-compose/files/0001-Allow-newer-versions-of-requests.patch b/recipes-containers/docker-compose/files/0001-Allow-newer-versions-of-requests.patch
deleted file mode 100644
index 6fc7bb4..0000000
--- a/recipes-containers/docker-compose/files/0001-Allow-newer-versions-of-requests.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 15cf1a31f5af8f09531bb837b92bd6ea49bd1744 Mon Sep 17 00:00:00 2001
-From: Pascal Bach <pascal.bach@siemens.com>
-Date: Wed, 13 Sep 2017 08:41:21 +0200
-Subject: [PATCH] Allow newer versions of requests
-
-docker compose has strict requirements to use requests < 2.12
-
-However it works without issues with newer versions, so this patch removes the check.
-
-Upstream-Status: Pending
-
-Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 192a0f6..f444757 100644
---- a/setup.py
-+++ b/setup.py
-@@ -33,7 +33,7 @@ install_requires = [
-     'cached-property >= 1.2.0, < 2',
-     'docopt >= 0.6.1, < 0.7',
-     'PyYAML >= 3.10, < 4',
--    'requests >= 2.6.1, != 2.11.0, < 2.12',
-+    'requests >= 2.6.1, != 2.11.0',
-     'texttable >= 0.9.0, < 0.10',
-     'websocket-client >= 0.32.0, < 1.0',
-     'docker >= 2.5.1, < 3.0',
--- 
-2.1.4
-
diff --git a/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch b/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
new file mode 100644
index 0000000..48a6f25
--- /dev/null
+++ b/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
@@ -0,0 +1,44 @@
+From b4655b5e7f1e5b87a758dfd7af01a49a40ed148a Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Thu, 10 Oct 2019 15:46:20 +0800
+Subject: [PATCH] docker-compose: support newer minor version of requests
+
+Signed-off-by: Ofek Lev <ofekmeister@gmail.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ requirements.txt | 2 +-
+ setup.py         | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/requirements.txt b/requirements.txt
+index 93a0cce..42bde41 100644
+--- a/requirements.txt
++++ b/requirements.txt
+@@ -16,7 +16,7 @@ pypiwin32==219; sys_platform == 'win32' and python_version < '3.6'
+ pypiwin32==220; sys_platform == 'win32' and python_version >= '3.6'
+ PySocks==1.6.7
+ PyYAML==3.12
+-requests==2.18.4
++requests==2.19.1
+ six==1.10.0
+ texttable==0.9.1
+ urllib3==1.21.1
+diff --git a/setup.py b/setup.py
+index 422ba54..a74ee0f 100644
+--- a/setup.py
++++ b/setup.py
+@@ -33,7 +33,7 @@ install_requires = [
+     'cached-property >= 1.2.0, < 2',
+     'docopt >= 0.6.1, < 0.7',
+     'PyYAML >= 3.10, < 4',
+-    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
++    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.20',
+     'texttable >= 0.9.0, < 0.10',
+     'websocket-client >= 0.32.0, < 1.0',
+     'docker >= 3.3.0, < 4.0',
+-- 
+1.9.1
+
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
similarity index 75%
rename from recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
rename to recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
index 851c251..a7f7b1c 100644
--- a/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "https://www.docker.com/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
 
-SRC_URI += "file://0001-Allow-newer-versions-of-requests.patch"
+SRC_URI += "file://0001-docker-compose-support-newer-minor-version-of-reques.patch"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "8dcadf09143600fcb573b43f446c8f9a"
-SRC_URI[sha256sum] = "fb46a6a2c4d193a3ff1e4d7208eea920b629c81dc92257c87f3f93095cfb0bdf"
+SRC_URI[md5sum] = "a243f59b2d286c41ff6ed1c4d4b50996"
+SRC_URI[sha256sum] = "68b07193755440d5f8d4f47e6f3484212afc255d5b785a81353ea1e9298c1c2c"
 
 RDEPENDS_${PN} = "\
   ${PYTHON_PN}-cached-property \
-- 
1.9.1


