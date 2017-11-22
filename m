Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1170CE00D51; Wed, 22 Nov 2017 10:28:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CF9FE00D04
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 10:28:22 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAMISLHs023047
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 10:28:22 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 10:28:20 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 22 Nov 2017 13:28:08 -0500
Message-ID: <1511375292-27471-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511375292-27471-1-git-send-email-mark.asselstine@windriver.com>
References: <1511375292-27471-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/6] python-designateclient: uprev to latest stable/pike
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
X-List-Received-Date: Wed, 22 Nov 2017 18:28:24 -0000
Content-Type: text/plain

Due for an uprev and avoids a deprecation warning when running
openstackclient.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-designateclient_git.bb   | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-designateclient_git.bb b/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
index d8477d5..7a0ba71 100644
--- a/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
@@ -9,23 +9,24 @@ DEPENDS += " \
         python-pbr \
         "
 
-RDEPENDS_${PN} +=" \
+RDEPENDS_${PN} += " \
         python-cliff \
         python-jsonschema \
+        python-osc-lib \
         python-oslo.utils \
         python-pbr \
-        python-keystoneclient \
+        python-keystoneauth1 \
         python-requests \
         python-six \
         python-stevedore \
         python-debtcollector \
-	"
+        "
 
 SRCNAME = "designateclient"
-SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
+SRC_URI = "git://github.com/openstack/${BPN}.git;branch=stable/pike"
 
-PV = "1.5.0+git${SRCPV}"
-SRCREV = "b97ae05612522180cc6f64485212811329da9645"
+PV = "2.7.0+git${SRCPV}"
+SRCREV = "77a705857f2c303a03fdbccd4460a68b61d92fd0"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.7.4


