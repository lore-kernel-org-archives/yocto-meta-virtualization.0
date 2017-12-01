Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C1F6E00D70; Fri,  1 Dec 2017 12:19:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BEEFFE00CF7
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Dec 2017 12:19:51 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB1KJpkb028340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 1 Dec 2017 12:19:51 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Dec 2017 12:19:50 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 1 Dec 2017 15:19:39 -0500
Message-ID: <1512159582-6858-5-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512159582-6858-1-git-send-email-mark.asselstine@windriver.com>
References: <1512159582-6858-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 4/7] python-taskflow: uprev to latest stable/pike
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

This uprev is required by the stable/pike version of python-glance.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-taskflow_git.bb | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-taskflow_git.bb b/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
index 088d4d1..1717617 100644
--- a/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
@@ -5,11 +5,11 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
 
 SRC_URI = "\
-	git://git.openstack.org/openstack/taskflow.git;branch=master \
+	git://git.openstack.org/openstack/taskflow.git;branch=stable/pike \
 	"
 
-PV="1.21.0+git${SRCPV}"
-SRCREV="52bd5e89fdddec49907a45e83a7a4b1abd1d1291"
+PV="2.14.1+git${SRCPV}"
+SRCREV="ed867c4fd17e4102a133c313a13af37baccf14a4"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -21,22 +21,20 @@ DEPENDS += " \
 
 RDEPENDS_${PN} += " \
         python-pbr \
-        python-anyjson \
-        python-iso8601 \
         python-six \
-        python-networkx \
-        python-babel \
-        python-stevedore \
-        python-futures \
+        python-enum34 \
         python-futurist \
         python-fasteners \
+        python-networkx \
         python-contextlib2 \
-        python-monotonic \
+        python-stevedore \
+        python-futures \
         python-jsonschema \
         python-automaton \
         python-oslo.utils \
         python-oslo.serialization \
+        python-tenacity \
         python-cachetools \
         python-debtcollector \
-        python-enum34 \
-	"
+        "
+	
\ No newline at end of file
-- 
2.7.4


