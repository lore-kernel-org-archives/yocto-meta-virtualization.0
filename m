Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 169FBE00C25; Wed,  4 Apr 2018 13:03:26 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D757E009CF
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Apr 2018 13:03:17 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w34K3HuY019057
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 4 Apr 2018 13:03:17 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 4 Apr 2018 13:03:16 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Apr 2018 16:02:53 -0400
Message-ID: <1522872176-22946-9-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
References: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [m-c-s][PATCH 09/12] python-os-brick: uprev to 1.15.5
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
X-List-Received-Date: Wed, 04 Apr 2018 20:03:26 -0000
Content-Type: text/plain

Required uprev to support the stable/pike version of python-nova.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-os-brick_git.bb   | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-os-brick_git.bb b/meta-openstack/recipes-devtools/python/python-os-brick_git.bb
index cbfc8ab..f266f70 100644
--- a/meta-openstack/recipes-devtools/python/python-os-brick_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-os-brick_git.bb
@@ -5,11 +5,11 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 SRC_URI = "\
-	git://github.com/openstack/os-brick.git;branch=master \
+	git://github.com/openstack/os-brick.git;branch=stable/pike \
 	"
 
-PV = "0.5.0+git${SRCPV}"
-SRCREV = "5ac54d4e0c89daba1be80702ee4060a538c08754"
+PV = "1.15.5+git${SRCPV}"
+SRCREV = "4090db76673cadb3b8adfceb106069e03414de49"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -22,4 +22,16 @@ DEPENDS += " \
 
 RDEPENDS_${PN} += " \
         python-pbr \
-	"
+        python-babel \
+        python-eventlet \
+        python-oslo.concurrency \
+        python-oslo.log \
+        python-oslo.serialization \
+        python-oslo.i18n \
+        python-oslo.privsep \
+        python-oslo.service \
+        python-oslo.utils \
+        python-requests \
+        python-retrying \
+        python-six \
+        python-os-win \
-- 
2.7.4


