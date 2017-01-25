Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37DCFE00C25; Tue, 24 Jan 2017 18:51:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA4FEE00C20
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Jan 2017 18:51:27 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="15076468"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jan 2017 10:51:21 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E3A2F477AE67
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Jan 2017 10:51:16 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 25 Jan 2017 10:51:16 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 25 Jan 2017 10:50:58 +0800
Message-ID: <1485312658-2412-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: E3A2F477AE67.A89F1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH v2] python-oslo.serialization: 1.11.0 -> 2.13.0
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
X-List-Received-Date: Wed, 25 Jan 2017 02:51:39 -0000
Content-Type: text/plain

1) Upgrade python-oslo.serialization from 1.11.0 to 2.13.0.
2) Update the RDEPENDS.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-oslo.serialization_git.bb      | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
index 1bf11f4..6a747fa 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
@@ -5,10 +5,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 SRCNAME = "oslo.serialization"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
 
-PV = "1.11.0+git${SRCPV}"
-SRCREV = "a8626ea9f9e37bf4129096cc2295f63516fb768e"
+PV = "2.13.0+git${SRCPV}"
+SRCREV = "be02fdbebc2d9f92a959aa34e0cb5a30934dfa0d"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -29,8 +29,6 @@ DEPENDS += " \
 RDEPENDS_${PN} += " \
         python-pbr \
         python-six \
-        python-babel \
-        python-iso8601 \
         python-oslo.utils \
         python-pytz \
         python-msgpack \
-- 
2.7.4




