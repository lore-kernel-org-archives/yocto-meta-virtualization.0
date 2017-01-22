Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05082E009AA; Sat, 21 Jan 2017 19:49:18 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89690E0089B
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:49:11 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0M3nAFg005233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:49:11 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 21 Jan 2017 19:49:10 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Sat, 21 Jan 2017 22:48:48 -0500
Message-ID: <1485056928-21697-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485056928-21697-1-git-send-email-mark.asselstine@windriver.com>
References: <1485056928-21697-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 4/4] python-oslo.messaging: uprev to latest stable/newton
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
X-List-Received-Date: Sun, 22 Jan 2017 03:49:18 -0000
Content-Type: text/plain

Requires updates to python-futurist, requires a version of
python-amqp<2.0, new recipe for python-pika-pool and update
python-oslo.middleware

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-oslo.messaging_git.bb  | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
index e6c8bf4..a960771 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
@@ -5,10 +5,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
 SRCNAME = "oslo.messaging"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
 
-PV = "2.7.0+git${SRCPV}"
-SRCREV = "4f49b7e25373d624ae9146dd46d92b90022c979f"
+PV = "5.10.1+git${SRCPV}"
+SRCREV = "cc1ec4e7f3b395d5f25e7d4922e6359b58a2206a"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -25,8 +25,6 @@ RDEPENDS_${PN} += " \
         bash \
         python-pbr \
         python-cachetools \
-        python-trollius \
-        python-aioeventlet \
         python-futurist \
         python-oslo.config \
         python-oslo.context \
@@ -37,6 +35,8 @@ RDEPENDS_${PN} += " \
         python-oslo.service \
         python-oslo.i18n \
         python-stevedore \
+        python-debtcollector \
+        python-monotonic \
         python-six \
         python-eventlet \
         python-greenlet \
@@ -44,5 +44,8 @@ RDEPENDS_${PN} += " \
         python-pyyaml \
         python-amqp \
         python-kombu \
-        python-aioeventlet \
+        python-pika \
+        python-pika-pool \
+        python-futures \
+        python-retrying \
         "
-- 
2.7.4


