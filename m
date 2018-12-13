Return-Path: <tyu@cisco.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0CD4E00CF1; Thu, 13 Dec 2018 12:41:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [173.37.142.90 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM
	white-list
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71EFAE00CC8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Dec 2018 12:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4768; q=dns/txt; s=iport;
	t=1544733667; x=1545943267;
	h=from:to:cc:subject:date:message-id;
	bh=FEP5IEqGblK/o4e3U0MHQ7WswEdraSGMU39QSsYb+rs=;
	b=Cv8oSBzC6FzwRSSc3W82nt2x3m6ylNsvhJqB0ITNZcRdngM/5gVmYFlj
	gQewp2hibtxvwG7PkfKIvDTkEFy8VSAZt+FkIb6hpFhDw8Npt8lY0Z3sI
	nFVwTDeWC2P/AWCvjGUV91h5OP1MBSkg+IM//M+qmzWlTqfodnavy58KF E=;
X-IronPort-AV: E=Sophos;i="5.56,349,1539648000"; d="scan'208";a="213115355"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2018 20:41:06 +0000
Received: from sjc-ads-3167.cisco.com (sjc-ads-3167.cisco.com [171.68.248.120])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTP id wBDKf67N019289; 
	Thu, 13 Dec 2018 20:41:06 GMT
Received: by sjc-ads-3167.cisco.com (Postfix, from userid 23091)
	id 17FA5AF1; Thu, 13 Dec 2018 12:41:06 -0800 (PST)
From: Ting Yu <tyu@cisco.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 13 Dec 2018 20:41:04 +0000
Message-Id: <1544733664-26667-1-git-send-email-tyu@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Outbound-SMTP-Client: 171.68.248.120, sjc-ads-3167.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
Subject: [PATCH] add the py2 version for python-docker and python-docker-pycreds packages
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
X-List-Received-Date: Thu, 13 Dec 2018 20:41:08 -0000

add the py2 version for python-docker and python-docker-pycreds packages.
add python-six and python-backport_ssl (for ph2 only) as python-docker dependencies.

verify the connection to docker engine at run time -
>>> import docker
>>> client = docker.from_env()
>>> client.images.list()
[<Image: 'hello-world:latest'>]

---
 recipes-devtools/python/python-docker-pycreds.inc       |  7 +++++++
 recipes-devtools/python/python-docker-pycreds_0.3.0.bb  |  3 +++
 recipes-devtools/python/python-docker.inc               | 14 ++++++++++++++
 recipes-devtools/python/python-docker_3.4.0.bb          |  6 ++++++
 recipes-devtools/python/python3-docker-pycreds_0.3.0.bb |  8 +-------
 recipes-devtools/python/python3-docker_3.4.0.bb         | 16 +---------------
 6 files changed, 32 insertions(+), 22 deletions(-)
 create mode 100644 recipes-devtools/python/python-docker-pycreds.inc
 create mode 100644 recipes-devtools/python/python-docker-pycreds_0.3.0.bb
 create mode 100644 recipes-devtools/python/python-docker.inc
 create mode 100644 recipes-devtools/python/python-docker_3.4.0.bb

diff --git a/recipes-devtools/python/python-docker-pycreds.inc b/recipes-devtools/python/python-docker-pycreds.inc
new file mode 100644
index 0000000..ca0995f
--- /dev/null
+++ b/recipes-devtools/python/python-docker-pycreds.inc
@@ -0,0 +1,7 @@
+SUMMARY = "Python bindings for the docker credentials store API"
+HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "2370ea3b62198b788a26231ab58844af"
+SRC_URI[sha256sum] = "8b0e956c8d206f832b06aa93a710ba2c3bcbacb5a314449c040b0b814355bbff"
diff --git a/recipes-devtools/python/python-docker-pycreds_0.3.0.bb b/recipes-devtools/python/python-docker-pycreds_0.3.0.bb
new file mode 100644
index 0000000..6dc4521
--- /dev/null
+++ b/recipes-devtools/python/python-docker-pycreds_0.3.0.bb
@@ -0,0 +1,3 @@
+inherit pypi setuptools
+require python-docker-pycreds.inc
+
diff --git a/recipes-devtools/python/python-docker.inc b/recipes-devtools/python/python-docker.inc
new file mode 100644
index 0000000..eec7cda
--- /dev/null
+++ b/recipes-devtools/python/python-docker.inc
@@ -0,0 +1,14 @@
+SUMMARY = "A Python library for the Docker Engine API."
+HOMEPAGE = "https://github.com/docker/docker-py"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
+
+SRC_URI[md5sum] = "02491d168c048cdb99cc20d0b352ea0f"
+SRC_URI[sha256sum] = "e9cc39e24905e67ba9e2df14c94488f5cf030fb72ae1c60de505ce5ea90503f7"
+
+RDEPENDS_${PN} += " \
+	${PYTHON_PN}-six \
+	${PYTHON_PN}-docker-pycreds \
+	${PYTHON_PN}-requests \
+	${PYTHON_PN}-websocket-client \
+"
diff --git a/recipes-devtools/python/python-docker_3.4.0.bb b/recipes-devtools/python/python-docker_3.4.0.bb
new file mode 100644
index 0000000..a964254
--- /dev/null
+++ b/recipes-devtools/python/python-docker_3.4.0.bb
@@ -0,0 +1,6 @@
+inherit pypi setuptools
+require python-docker.inc
+
+RDEPENDS_${PN} += " \
+                   python-backports-ssl \
+                  "
diff --git a/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb b/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
index 4d39f52..75a83e0 100644
--- a/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
+++ b/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
@@ -1,9 +1,3 @@
-SUMMARY = "Python bindings for the docker credentials store API"
-HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
 inherit pypi setuptools3
+require python-docker-pycreds.inc
 
-SRC_URI[md5sum] = "2370ea3b62198b788a26231ab58844af"
-SRC_URI[sha256sum] = "8b0e956c8d206f832b06aa93a710ba2c3bcbacb5a314449c040b0b814355bbff"
diff --git a/recipes-devtools/python/python3-docker_3.4.0.bb b/recipes-devtools/python/python3-docker_3.4.0.bb
index 6e81302..052cbe8 100644
--- a/recipes-devtools/python/python3-docker_3.4.0.bb
+++ b/recipes-devtools/python/python3-docker_3.4.0.bb
@@ -1,17 +1,3 @@
-SUMMARY = "A Python library for the Docker Engine API."
-HOMEPAGE = "https://github.com/docker/docker-py"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
-
 inherit pypi setuptools3
-
-SRC_URI[md5sum] = "02491d168c048cdb99cc20d0b352ea0f"
-SRC_URI[sha256sum] = "e9cc39e24905e67ba9e2df14c94488f5cf030fb72ae1c60de505ce5ea90503f7"
-
 DEPENDS += "${PYTHON_PN}-pip-native"
-
-RDEPENDS_${PN} += " \
-	python3-docker-pycreds \
-	python3-requests \
-	python3-websocket-client \
-"
+require python-docker.inc
-- 
2.7.4


