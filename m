Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.11141.1593188010470046527
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 09:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VFBL3XcO;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id i3so10945251ljg.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jun 2020 09:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=scOiKS7eGgTflcWpcxhz1xeVw4Ie1Xgr2Y/w/NhUq/Q=;
        b=VFBL3XcO4GLQLNWwTot84lbNyp0iwW2P/OuGSwFSkeSgcT88IHKt3cEucWFshCrakm
         7GeA/qvsYIhvPB+w6O37dAFjn09ukezC7xP2ApCmEMtZgCVGZ2hKSZZqG+aRH7K+0qF0
         vDPc22g6gttNuwNaDowA1T67V/aadqQMFpBwpkrLTBc/MYAvrtoBccZsKBeyLXG0Cw4j
         lj0yxnb+4tMQeQ0A60isQN0xeI4u0xgMcpyMPIDMCaC/TbvpxYLr63tEDvwaMWRUwuzj
         XjoSEUJT49VwWqzKF95eUDhe7gu1nqd7n5nq9w8KifuELw3+oOuJjHITVPFxZ5yuxtJU
         cklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=scOiKS7eGgTflcWpcxhz1xeVw4Ie1Xgr2Y/w/NhUq/Q=;
        b=CNIzB+EulM2tLZ+4ozyGyNrQpVIGlzFGavAA16vfyR3m5c4VNl1L64ez3AGOvPcIKb
         by1+K8IO9qHmfE4KjHnDOLiCg1tNEHZRTefotQjwVW6/yAnKXRd8FQonqT7Jif9wx58h
         mmtnVkXapxt7VZ7hiKlxbfTyAQG5ohNy3CTWnUT1XZZCGP3miCu6IsZEIobO5HM6A8dJ
         /edWkpqURZrC6gPHik3ikxE/BHL8IKod57kHn4piA2Fcb/QM6AUlH0gLrOZ3AOw2bK9G
         2EGYsAaSNr2yPdAo9WAdsIy9BDQPFencb9K8QXDpFV2we6lUZHQhnmLEJpnY2cgczNol
         vVnw==
X-Gm-Message-State: AOAM533itgWtJ6RFTHZYrEUdwS5o8OhcLa0rdmwi79rjPFTUF+GCot2v
	/v46sg8w7NUloHwNhO00ZM49B6/j
X-Google-Smtp-Source: ABdhPJzdJkeffa7a7wxAIRUJJi0PkPpwImA1PYV8zd03CwSEfl5TR4q1T2S2lR7odf8Xdsg3LsaIrQ==
X-Received: by 2002:a2e:b5ab:: with SMTP id f11mr1688324ljn.438.1593188008610;
        Fri, 26 Jun 2020 09:13:28 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id r16sm2174730ljc.102.2020.06.26.09.13.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 09:13:28 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH] python3-docker: uprev 4.2.0 > 4.2.1
Date: Fri, 26 Jun 2020 18:15:02 +0200
Message-Id: <20200626161502.32320-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Merge python-docker.inc to python3-docker_4.2.1.bb since we have
dropped python-docker recipe.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 recipes-devtools/python/python-docker.inc     | 15 ---------------
 .../python/python3-docker_4.2.0.bb            |  3 ---
 .../python/python3-docker_4.2.1.bb            | 19 +++++++++++++++++++
 3 files changed, 19 insertions(+), 18 deletions(-)
 delete mode 100644 recipes-devtools/python/python-docker.inc
 delete mode 100644 recipes-devtools/python/python3-docker_4.2.0.bb
 create mode 100644 recipes-devtools/python/python3-docker_4.2.1.bb

diff --git a/recipes-devtools/python/python-docker.inc b/recipes-devtools/python/python-docker.inc
deleted file mode 100644
index 884fb64..0000000
--- a/recipes-devtools/python/python-docker.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "A Python library for the Docker Engine API."
-HOMEPAGE = "https://github.com/docker/docker-py"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
-
-SRC_URI[md5sum] = "19f803f6a7113301daa5d82a2d1d0c30"
-SRC_URI[sha256sum] = "ddae66620ab5f4bce769f64bcd7934f880c8abe6aa50986298db56735d0f722e"
-
-RDEPENDS_${PN} += " \
-	${PYTHON_PN}-misc \
-	${PYTHON_PN}-six \
-	${PYTHON_PN}-docker-pycreds \
-	${PYTHON_PN}-requests \
-	${PYTHON_PN}-websocket-client \
-"
diff --git a/recipes-devtools/python/python3-docker_4.2.0.bb b/recipes-devtools/python/python3-docker_4.2.0.bb
deleted file mode 100644
index 052cbe8..0000000
--- a/recipes-devtools/python/python3-docker_4.2.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit pypi setuptools3
-DEPENDS += "${PYTHON_PN}-pip-native"
-require python-docker.inc
diff --git a/recipes-devtools/python/python3-docker_4.2.1.bb b/recipes-devtools/python/python3-docker_4.2.1.bb
new file mode 100644
index 0000000..32b24eb
--- /dev/null
+++ b/recipes-devtools/python/python3-docker_4.2.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A Python library for the Docker Engine API."
+HOMEPAGE = "https://github.com/docker/docker-py"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
+
+SRC_URI[md5sum] = "65111a1e4a2ab83d2ba104cdb17f1326"
+SRC_URI[sha256sum] = "380a20d38fbfaa872e96ee4d0d23ad9beb0f9ed57ff1c30653cbeb0c9c0964f2"
+
+DEPENDS += "${PYTHON_PN}-pip-native"
+
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-misc \
+        ${PYTHON_PN}-six \
+        ${PYTHON_PN}-docker-pycreds \
+        ${PYTHON_PN}-requests \
+        ${PYTHON_PN}-websocket-client \
+"
+
+inherit pypi setuptools3
-- 
2.27.0

