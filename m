Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92DB6E00D47; Tue,  7 Nov 2017 12:40:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D796E00D47
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Nov 2017 12:38:55 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA7Kcshs014649
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Nov 2017 12:38:54 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 7 Nov 2017 12:38:54 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 7 Nov 2017 15:38:35 -0500
Message-ID: <1510087118-28132-8-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
References: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 07/10] python-amqp: uprev to v2.2.2
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
X-List-Received-Date: Tue, 07 Nov 2017 20:40:28 -0000
Content-Type: text/plain

This newer version is required by the new version of
python-oslo.messaging found on stable/pike.

Drop the old v1.4.9 so we only have the one recipe.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf                           |  1 -
 .../recipes-devtools/python/python-amqp_1.4.9.bb         | 16 ----------------
 .../{python-amqp_2.1.4.bb => python-amqp_2.2.2.bb}       | 14 ++++++--------
 3 files changed, 6 insertions(+), 25 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-amqp_1.4.9.bb
 rename meta-openstack/recipes-devtools/python/{python-amqp_2.1.4.bb => python-amqp_2.2.2.bb} (38%)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 61e9fb5..ceb489b 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -19,7 +19,6 @@ PREFERRED_VERSION_python-django = "1.8.6"
 PREFERRED_VERSION_python-netaddr = "0.7.19"
 PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
 PREFERRED_VERSION_python-requests = "2.13.0"
-PREFERRED_VERSION_python-amqp = "1.4.9"
 PREFERRED_VERSION_python-kombu = "3.0.%"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-openstack/recipes-devtools/python/python-amqp_1.4.9.bb b/meta-openstack/recipes-devtools/python/python-amqp_1.4.9.bb
deleted file mode 100644
index 9768e09..0000000
--- a/meta-openstack/recipes-devtools/python/python-amqp_1.4.9.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Low-level AMQP client for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1702a92c723f09e3fab3583b165a8d90"
-
-SRCNAME = "amqp"
-
-SRC_URI = "https://pypi.io/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "df57dde763ba2dea25b3fa92dfe43c19"
-SRC_URI[sha256sum] = "2dea4d16d073c902c3b89d9b96620fb6729ac0f7a923bbc777cb4ad827c0c61a"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python-amqp_2.1.4.bb b/meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb
similarity index 38%
rename from meta-openstack/recipes-devtools/python/python-amqp_2.1.4.bb
rename to meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb
index bda166f..94979d3 100644
--- a/meta-openstack/recipes-devtools/python/python-amqp_2.1.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
 
-SRCNAME = "amqp"
+SRC_URI[md5sum] = "0971a3fd2d635ded45c349cfc17106bd"
+SRC_URI[sha256sum] = "cba1ace9d4ff6049b190d8b7991f9c1006b443a5238021aca96dd6ad2ac9da22"
 
-SRC_URI = "https://pypi.python.org/packages/23/39/06bb8bd31e78962675f696498f7821f5dbd11aa0919c5a811d83a0e02609/${SRCNAME}-${PV}.tar.gz"
+inherit setuptools pypi
 
-SRC_URI[md5sum] = "035a475e42ef4f431b4e0dca113434bd"
-SRC_URI[sha256sum] = "1378cc14afeb6c2850404f322d03dec0082d11d04bdcb0360e1b10d4e6e77ef9"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+RDEPENDS_${PN} += " \
+        python-vine \
+        "
-- 
2.7.4


