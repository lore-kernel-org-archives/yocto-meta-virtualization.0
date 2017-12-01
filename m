Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D69DE00D26; Fri,  1 Dec 2017 12:19:54 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EC9EE00CEF
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Dec 2017 12:19:52 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB1KJq6n025867
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 1 Dec 2017 12:19:52 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Dec 2017 12:19:51 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 1 Dec 2017 15:19:40 -0500
Message-ID: <1512159582-6858-6-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512159582-6858-1-git-send-email-mark.asselstine@windriver.com>
References: <1512159582-6858-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 5/7] python-castellan: uprev to latest stable/pike
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
X-List-Received-Date: Fri, 01 Dec 2017 20:19:54 -0000
Content-Type: text/plain

This uprev is required by the stable/pike version of python-cursive.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-castellan_git.bb         | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-castellan_git.bb b/meta-openstack/recipes-devtools/python/python-castellan_git.bb
index 40a085d..9401ad9 100644
--- a/meta-openstack/recipes-devtools/python/python-castellan_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-castellan_git.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 SRCNAME = "castellan"
 
 SRC_URI = "\
-	git://git.openstack.org/openstack/${SRCNAME}.git;branch=master \
+	git://git.openstack.org/openstack/${SRCNAME}.git;branch=stable/pike \
 	"
 
-PV="0.2.1+git${SRCPV}"
-SRCREV="4fda4a749f3f908d58817c326676073aa6fcf62a"
+PV="0.12.1+git${SRCPV}"
+SRCREV="124e9296fe79412b510c73b35936a6be91267d18"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -25,10 +25,11 @@ RDEPENDS_${PN} += " \
         python-pbr \
         python-babel \
         python-cryptography \
+        python-barbicanclient \
         python-oslo.config \
         python-oslo.context \
+        python-oslo.i18n \
         python-oslo.log \
-        python-oslo.policy \
-        python-oslo.serialization \
         python-oslo.utils \
-	"
+        python-keystoneauth1 \
+        "
-- 
2.7.4


