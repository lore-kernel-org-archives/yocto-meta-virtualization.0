Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 094C5E00D5F; Wed, 21 Dec 2016 07:14:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91EFEE00A4D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Dec 2016 07:14:39 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBLFEcFj007282
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Dec 2016 07:14:38 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 21 Dec 2016 07:14:37 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 21 Dec 2016 10:14:32 -0500
Message-ID: <1482333272-15662-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [mcs][PATCH] python-amqplib: google code is dead, long live github
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
X-List-Received-Date: Wed, 21 Dec 2016 15:14:41 -0000
Content-Type: text/plain

In addition to the source URL having to be update upstream changed the
directory structure found in the tarball, updates reflect this.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb b/meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb
index 27d23e5..1afc76e 100644
--- a/meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1702a92c723f09e3fab3583b165a8d90"
 PR = "r1"
 SRCNAME = "amqplib"
 
-SRC_URI = "http://py-${SRCNAME}.googlecode.com/files/${SRCNAME}-${PV}.tgz"
+SRC_URI = "https://github.com/barryp/py-amqplib/archive/${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5c92f17fbedd99b2b4a836d4352d1e2f"
-SRC_URI[sha256sum] = "843d69b681a60afd21fbf50f310404ec67fcdf9d13dfcf6e9d41f3b456217e5b"
+SRC_URI[md5sum] = "ff405a7b57aa98cdf07d02bd8090fa29"
+SRC_URI[sha256sum] = "9461d73f75ca704e6b656738b5dad42a1948e61dfbc8233077d84d00f74c3936"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/py-amqplib-${PV}"
 
 inherit setuptools
-- 
2.7.4


