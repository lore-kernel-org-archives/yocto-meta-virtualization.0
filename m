Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 842C2E00C1A; Wed, 13 Sep 2017 00:09:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.17.14 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 547 seconds by postgrey-1.32 at yocto-www;
	Wed, 13 Sep 2017 00:09:37 PDT
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 404D2E00BE8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Sep 2017 00:09:37 -0700 (PDT)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v8D70Tj3006039
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Sep 2017 09:00:29 +0200
Received: from dev.sbt.siemens.com ([139.16.24.231])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v8D70SBT018927;
	Wed, 13 Sep 2017 09:00:28 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 13 Sep 2017 09:00:02 +0200
Message-Id: <1505286002-4595-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] python3-docker-compose: add version 1.16.1 + dependencies
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
X-List-Received-Date: Wed, 13 Sep 2017 07:09:39 -0000

This requires some packages as well as the pypi.bbclass from meta-python.

It uses Python 3 as I don't think it makes sense to use Python 2 anymore.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../0001-Allow-newer-versions-of-requests.patch    | 32 ++++++++++++++++++++++
 .../python3-docker-compose_1.16.1.bb               | 31 +++++++++++++++++++++
 .../python/python3-cached-property_1.3.0.bb        |  9 ++++++
 recipes-devtools/python/python3-colorama_0.3.9.bb  |  9 ++++++
 .../python/python3-docker-pycreds_0.2.1.bb         |  9 ++++++
 recipes-devtools/python/python3-docker_2.5.1.bb    | 11 ++++++++
 recipes-devtools/python/python3-dockerpty_0.4.1.bb |  9 ++++++
 recipes-devtools/python/python3-texttable_0.9.1.bb |  9 ++++++
 .../python/python3-websocket-client_0.44.0.bb      | 11 ++++++++
 9 files changed, 130 insertions(+)
 create mode 100644 recipes-containers/docker-compose/files/0001-Allow-newer-versions-of-requests.patch
 create mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
 create mode 100644 recipes-devtools/python/python3-cached-property_1.3.0.bb
 create mode 100644 recipes-devtools/python/python3-colorama_0.3.9.bb
 create mode 100644 recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
 create mode 100644 recipes-devtools/python/python3-docker_2.5.1.bb
 create mode 100644 recipes-devtools/python/python3-dockerpty_0.4.1.bb
 create mode 100644 recipes-devtools/python/python3-texttable_0.9.1.bb
 create mode 100644 recipes-devtools/python/python3-websocket-client_0.44.0.bb

diff --git a/recipes-containers/docker-compose/files/0001-Allow-newer-versions-of-requests.patch b/recipes-containers/docker-compose/files/0001-Allow-newer-versions-of-requests.patch
new file mode 100644
index 0000000..6fc7bb4
--- /dev/null
+++ b/recipes-containers/docker-compose/files/0001-Allow-newer-versions-of-requests.patch
@@ -0,0 +1,32 @@
+From 15cf1a31f5af8f09531bb837b92bd6ea49bd1744 Mon Sep 17 00:00:00 2001
+From: Pascal Bach <pascal.bach@siemens.com>
+Date: Wed, 13 Sep 2017 08:41:21 +0200
+Subject: [PATCH] Allow newer versions of requests
+
+docker compose has strict requirements to use requests < 2.12
+
+However it works without issues with newer versions, so this patch removes the check.
+
+Upstream-Status: Pending
+
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 192a0f6..f444757 100644
+--- a/setup.py
++++ b/setup.py
+@@ -33,7 +33,7 @@ install_requires = [
+     'cached-property >= 1.2.0, < 2',
+     'docopt >= 0.6.1, < 0.7',
+     'PyYAML >= 3.10, < 4',
+-    'requests >= 2.6.1, != 2.11.0, < 2.12',
++    'requests >= 2.6.1, != 2.11.0',
+     'texttable >= 0.9.0, < 0.10',
+     'websocket-client >= 0.32.0, < 1.0',
+     'docker >= 2.5.1, < 3.0',
+-- 
+2.1.4
+
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb b/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
new file mode 100644
index 0000000..50e76b7
--- /dev/null
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Multi-container orchestration for Docker"
+HOMEPAGE = "https://www.docker.com/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
+
+SRC_URI += "file://0001-Allow-newer-versions-of-requests.patch"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "8dcadf09143600fcb573b43f446c8f9a"
+SRC_URI[sha256sum] = "fb46a6a2c4d193a3ff1e4d7208eea920b629c81dc92257c87f3f93095cfb0bdf"
+
+RDEPENDS_${PN} = "\
+  ${PYTHON_PN}-cached-property \
+  ${PYTHON_PN}-certifi \
+  ${PYTHON_PN}-chardet \
+  ${PYTHON_PN}-colorama \
+  ${PYTHON_PN}-docker \
+  ${PYTHON_PN}-docker-pycreds \
+  ${PYTHON_PN}-dockerpty \
+  ${PYTHON_PN}-docopt \
+  ${PYTHON_PN}-enum \
+  ${PYTHON_PN}-idna \
+  ${PYTHON_PN}-jsonschema \
+  ${PYTHON_PN}-pyyaml \
+  ${PYTHON_PN}-requests \
+  ${PYTHON_PN}-six \
+  ${PYTHON_PN}-texttable \
+  ${PYTHON_PN}-urllib3 \
+  ${PYTHON_PN}-websocket-client \
+  "
diff --git a/recipes-devtools/python/python3-cached-property_1.3.0.bb b/recipes-devtools/python/python3-cached-property_1.3.0.bb
new file mode 100644
index 0000000..f01aabd
--- /dev/null
+++ b/recipes-devtools/python/python3-cached-property_1.3.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A decorator for caching properties in classes."
+HOMEPAGE = "https://github.com/pydanny/cached-property"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=db7ff60c4e14f58534201242803d8abc"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "4a6039f7418007275505e355359396a8"
+SRC_URI[sha256sum] = "458e78b1c7286ece887d92c9bee829da85717994c5e3ddd253a40467f488bc81"
diff --git a/recipes-devtools/python/python3-colorama_0.3.9.bb b/recipes-devtools/python/python3-colorama_0.3.9.bb
new file mode 100644
index 0000000..458b0db
--- /dev/null
+++ b/recipes-devtools/python/python3-colorama_0.3.9.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Cross-platform colored terminal text."
+HOMEPAGE = "https://github.com/tartley/colorama"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14d0b64047ed8f510b51ce0495995358"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "3a0e415259690f4dd7455c2683ee5850"
+SRC_URI[sha256sum] = "48eb22f4f8461b1df5734a074b57042430fb06e1d61bd1e11b078c0fe6d7a1f1"
diff --git a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb b/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
new file mode 100644
index 0000000..4038410
--- /dev/null
+++ b/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Python bindings for the docker credentials store API"
+HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "0d80d5aebab771faf7e422b759c3055b"
+SRC_URI[sha256sum] = "93833a2cf280b7d8abbe1b8121530413250c6cd4ffed2c1cf085f335262f7348"
diff --git a/recipes-devtools/python/python3-docker_2.5.1.bb b/recipes-devtools/python/python3-docker_2.5.1.bb
new file mode 100644
index 0000000..ff8f89e
--- /dev/null
+++ b/recipes-devtools/python/python3-docker_2.5.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A Python library for the Docker Engine API."
+HOMEPAGE = "https://github.com/docker/docker-py"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "7d917152976df075e6e90ee853df641f"
+SRC_URI[sha256sum] = "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d6db880"
+
+DEPENDS += "${PYTHON_PN}-pip-native"
diff --git a/recipes-devtools/python/python3-dockerpty_0.4.1.bb b/recipes-devtools/python/python3-dockerpty_0.4.1.bb
new file mode 100644
index 0000000..a40f2a3
--- /dev/null
+++ b/recipes-devtools/python/python3-dockerpty_0.4.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Python library to use the pseudo-tty of a docker container"
+HOMEPAGE = "https://github.com/d11wtq/dockerpty"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=afaf767baa20ac524dc12f1071ca493a"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "028bacb34536f3ee6a2ccd668c27e8e4"
+SRC_URI[sha256sum] = "69a9d69d573a0daa31bcd1c0774eeed5c15c295fe719c61aca550ed1393156ce"
diff --git a/recipes-devtools/python/python3-texttable_0.9.1.bb b/recipes-devtools/python/python3-texttable_0.9.1.bb
new file mode 100644
index 0000000..25e402f
--- /dev/null
+++ b/recipes-devtools/python/python3-texttable_0.9.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "module for creating simple ASCII tables"
+HOMEPAGE = "https://github.com/foutaise/texttable/"
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "a712b5a5464d51c5fc43c64d9d2cd0de"
+SRC_URI[sha256sum] = "119041773ff03596b56392532f9315cb3a3116e404fd6f36e76a7dc088d95c79"
diff --git a/recipes-devtools/python/python3-websocket-client_0.44.0.bb b/recipes-devtools/python/python3-websocket-client_0.44.0.bb
new file mode 100644
index 0000000..8dfc95f
--- /dev/null
+++ b/recipes-devtools/python/python3-websocket-client_0.44.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "WebSocket client for python. hybi13 is supported."
+HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=18b09a20dd186af4fd60f1a08311628c"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "websocket_client"
+
+SRC_URI[md5sum] = "73d87aa16a2212da448b30aca9c5bf3b"
+SRC_URI[sha256sum] = "15f585566e2ea7459136a632b9785aa081093064391878a448c382415e948d72"
-- 
2.1.4


