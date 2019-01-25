Return-Path: <minipada@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4F186E00AB0; Fri, 25 Jan 2019 05:19:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (minipada[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.48 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 620BDE0048C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2019 05:19:24 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id d15so6756039wmb.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2019 05:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FZURqv8mb5B5xO8iYBwpOeHeZB6eemIWtJPQP6XhxP4=;
	b=Ueh3Z1VkddrpSNzRFgseZfUQD0hMM5nWKlptS/oA6E/aJxJsWTY0Fm8KD15q143OWG
	wR65o01pIvmR1YAC9gNu/Om5un3ZYW7t4B1yoEbPUuvU3jskmeLI4iXYDfRsZ8uZxD8k
	4gA5Cb8BfQVcrSggWokxFZq9Y+9ghiILZmwI+uqgwdh7fQVWoNnhPp4Ut5i34YgJ+bS/
	E97WX+hybbrbcK95OGvhzvXDgzIRm0W2eiC1f+qqVIf6C6OVKa95DixlqUjRPWpEoaMi
	I9kacFgip2La04Zz6KbvOID74hONaCqxAzHP8a/IYzPnrH8dTGX6998sLSbmc4GzPKIO
	cgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FZURqv8mb5B5xO8iYBwpOeHeZB6eemIWtJPQP6XhxP4=;
	b=TsLMxdTWIyt2kdNZKH8XlyC3Cn+0AUbdEEBW/jYi1QmuN6T/W4qJNGyDIuTYEX6FZ7
	0f5aiekgoUW62CTROVcQ59Xkak6EthyGbww9tVa676OGIkj/hwhnyPJwC7MoBLy+To+X
	X9gCLg83DSTKWEVUq8WomnEhTWvoZsP3eXLeGVnsHWWsSJEN8Vf4Hh6XNyutJdDjoOwy
	HcfIIJigps/fkbUtIS6EJrHEZ7LaQDrjG+gTQu2IYxEMRErPq/Qk3EOXqfq+EB6afrUO
	pHDYk4pUWRo5f1QP1xlZJEdhNY5r7CRObijZQXQpRPVFq7q6RMHw8kSkF2zkGj8fyycn
	4pig==
X-Gm-Message-State: AJcUukeKZtAn1EL8hdk/VYkbX5fKPzAUA0Aj7p0l6pwwTxjsnU0exNX8
	jTQ9CJvz2cvTPoH17N6mudd2S60=
X-Google-Smtp-Source: ALg8bN6Rf+GsUvgrWPZod4LNrZlZ1Yv18ykzFCNdXeqZLbYR34zWS37c+/ol2ZJG26vmWDrOh9r5Ng==
X-Received: by 2002:a1c:e913:: with SMTP id q19mr6992831wmc.55.1548422363046; 
	Fri, 25 Jan 2019 05:19:23 -0800 (PST)
Received: from david-ThinkPad-T440s.synapticon.local
	(pd95c1895.dip0.t-ipconnect.de. [217.92.24.149])
	by smtp.gmail.com with ESMTPSA id
	b13sm96395128wrn.28.2019.01.25.05.19.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 05:19:22 -0800 (PST)
From: David Bensoussan <minipada@gmail.com>
X-Google-Original-From: David Bensoussan <dbensoussan@synapticon.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 25 Jan 2019 14:19:20 +0100
Message-Id: <20190125131920.5173-1-dbensoussan@synapticon.com>
X-Mailer: git-send-email 2.17.1
Cc: David Bensoussan <dbensoussan@synapticon.com>
Subject: [PATCH] python-docker-pycreds & python-docker: Add recipe for python2
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
X-List-Received-Date: Fri, 25 Jan 2019 13:19:25 -0000

---
 recipes-devtools/python/python-docker-pycreds.inc   |  7 +++++++
 .../python/python-docker-pycreds_0.2.1.bb           |  3 +++
 recipes-devtools/python/python-docker.inc           |  5 +++++
 recipes-devtools/python/python-docker_2.5.1.bb      | 11 +++++++++++
 .../python/python3-docker-pycreds_0.2.1.bb          |  8 +-------
 recipes-devtools/python/python3-docker_2.5.1.bb     | 13 +++----------
 6 files changed, 30 insertions(+), 17 deletions(-)
 create mode 100644 recipes-devtools/python/python-docker-pycreds.inc
 create mode 100644 recipes-devtools/python/python-docker-pycreds_0.2.1.bb
 create mode 100644 recipes-devtools/python/python-docker.inc
 create mode 100644 recipes-devtools/python/python-docker_2.5.1.bb

diff --git a/recipes-devtools/python/python-docker-pycreds.inc b/recipes-devtools/python/python-docker-pycreds.inc
new file mode 100644
index 0000000..e76267d
--- /dev/null
+++ b/recipes-devtools/python/python-docker-pycreds.inc
@@ -0,0 +1,7 @@
+SUMMARY = "Python bindings for the docker credentials store API"
+HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "0d80d5aebab771faf7e422b759c3055b"
+SRC_URI[sha256sum] = "93833a2cf280b7d8abbe1b8121530413250c6cd4ffed2c1cf085f335262f7348"
diff --git a/recipes-devtools/python/python-docker-pycreds_0.2.1.bb b/recipes-devtools/python/python-docker-pycreds_0.2.1.bb
new file mode 100644
index 0000000..f6ddc8d
--- /dev/null
+++ b/recipes-devtools/python/python-docker-pycreds_0.2.1.bb
@@ -0,0 +1,3 @@
+inherit pypi setuptools
+
+require python-docker-pycreds.inc
diff --git a/recipes-devtools/python/python-docker.inc b/recipes-devtools/python/python-docker.inc
new file mode 100644
index 0000000..f23b537
--- /dev/null
+++ b/recipes-devtools/python/python-docker.inc
@@ -0,0 +1,5 @@
+SRC_URI[md5sum] = "7d917152976df075e6e90ee853df641f"
+SRC_URI[sha256sum] = "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d6db880"
+
+DEPENDS += "${PYTHON_PN}-pip-native"
+
diff --git a/recipes-devtools/python/python-docker_2.5.1.bb b/recipes-devtools/python/python-docker_2.5.1.bb
new file mode 100644
index 0000000..9dc83e8
--- /dev/null
+++ b/recipes-devtools/python/python-docker_2.5.1.bb
@@ -0,0 +1,11 @@
+inherit pypi setuptools
+
+RDEPENDS_${PN} += " \
+	python-backports-ssl \
+	python-docker-pycreds \
+	python-requests \
+	python-websocket-client \
+"
+
+require python-docker.inc
+
diff --git a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb b/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
index 4038410..52423d2 100644
--- a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
+++ b/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
@@ -1,9 +1,3 @@
-SUMMARY = "Python bindings for the docker credentials store API"
-HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "0d80d5aebab771faf7e422b759c3055b"
-SRC_URI[sha256sum] = "93833a2cf280b7d8abbe1b8121530413250c6cd4ffed2c1cf085f335262f7348"
+require python-docker-pycreds.inc
diff --git a/recipes-devtools/python/python3-docker_2.5.1.bb b/recipes-devtools/python/python3-docker_2.5.1.bb
index 341d95c..0dca028 100644
--- a/recipes-devtools/python/python3-docker_2.5.1.bb
+++ b/recipes-devtools/python/python3-docker_2.5.1.bb
@@ -1,17 +1,10 @@
-SUMMARY = "A Python library for the Docker Engine API."
-HOMEPAGE = "https://github.com/docker/docker-py"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
-
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "7d917152976df075e6e90ee853df641f"
-SRC_URI[sha256sum] = "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d6db880"
-
-DEPENDS += "${PYTHON_PN}-pip-native"
-
 RDEPENDS_${PN} += " \
 	python3-docker-pycreds \
 	python3-requests \
 	python3-websocket-client \
 "
+
+require python-docker.inc
+
-- 
2.17.1


