Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06DA0E006D8; Fri, 20 Jan 2017 13:59:46 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24F66E003DB
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 13:59:43 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0KLxhRR024702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 13:59:43 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 20 Jan 2017 13:59:43 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 20 Jan 2017 16:59:32 -0500
Message-ID: <1484949575-2411-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484949575-2411-1-git-send-email-mark.asselstine@windriver.com>
References: <1484949575-2411-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 3/6] python-keystoneauth1: uprev to v2.18.0
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
X-List-Received-Date: Fri, 20 Jan 2017 21:59:46 -0000
Content-Type: text/plain

This uprev is required by the uprev to python-os-client-config to the
latest stable/newton.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...-keystoneauth1_1.2.0.bb => python-keystoneauth1_2.18.0.bb} | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-keystoneauth1_1.2.0.bb => python-keystoneauth1_2.18.0.bb} (54%)

diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_1.2.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb
similarity index 54%
rename from meta-openstack/recipes-devtools/python/python-keystoneauth1_1.2.0.bb
rename to meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb
index a88f8a3..1fdf9e1 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneauth1_1.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb
@@ -5,10 +5,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
 
 SRCNAME = "keystoneauth1"
-SRC_URI = "http://pypi.python.org/packages/source/k/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "http://pypi.io/packages/source/k/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "db4c75346480300fe9015945f73ab33a"
-SRC_URI[sha256sum] = "e8386dc8b0f17d439e1f2f4e6a8ef64fe0f2b81938b2f0b13f80042bb98e2b85"
+SRC_URI[md5sum] = "d24c08bc7d59081adce160444ebc6993"
+SRC_URI[sha256sum] = "075a9ca7a8877c5885fa2487699015e45260c4e6be119683effe0ad2ab1255d2"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -20,4 +20,9 @@ DEPENDS += " \
 
 RDEPENDS_${PN} += " \
         python-pbr \
+        python-iso8601 \
+        python-positional \
+        python-requests \
+        python-six \
+        python-stevedore \
         "
-- 
2.7.4


