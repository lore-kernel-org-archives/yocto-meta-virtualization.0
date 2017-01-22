Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9D41E007CE; Sat, 21 Jan 2017 19:49:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AE1AE0049F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:49:09 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0M3n8l2011088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:49:09 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 21 Jan 2017 19:49:08 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Sat, 21 Jan 2017 22:48:46 -0500
Message-ID: <1485056928-21697-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485056928-21697-1-git-send-email-mark.asselstine@windriver.com>
References: <1485056928-21697-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 2/4] python-amqp: bring back the 1.x.x series
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
X-List-Received-Date: Sun, 22 Jan 2017 03:49:10 -0000
Content-Type: text/plain

The stable/newton version of python-oslo.messaging requires
python-amqp <2.0.0 so we will bring back the latest version of the
1.x.x series (removed by commit 3af287f179a0), uprev to v1.4.9 and
make it the PREF version.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf                           |  1 +
 .../recipes-devtools/python/python-amqp_1.4.9.bb         | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-amqp_1.4.9.bb

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 4007cb9..e940478 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -19,5 +19,6 @@ PREFERRED_VERSION_python-django = "1.8.6"
 PREFERRED_VERSION_python-netaddr = "0.7.19"
 PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
 PREFERRED_VERSION_python-requests = "2.12.0"
+PREFERRED_VERSION_python-amqp = "1.4.9"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-openstack/recipes-devtools/python/python-amqp_1.4.9.bb b/meta-openstack/recipes-devtools/python/python-amqp_1.4.9.bb
new file mode 100644
index 0000000..9768e09
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-amqp_1.4.9.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Low-level AMQP client for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1702a92c723f09e3fab3583b165a8d90"
+
+SRCNAME = "amqp"
+
+SRC_URI = "https://pypi.io/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "df57dde763ba2dea25b3fa92dfe43c19"
+SRC_URI[sha256sum] = "2dea4d16d073c902c3b89d9b96620fb6729ac0f7a923bbc777cb4ad827c0c61a"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
2.7.4


