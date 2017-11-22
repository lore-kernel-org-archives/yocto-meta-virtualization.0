Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87765E00D00; Wed, 22 Nov 2017 10:28:23 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9FA9E00C78
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 10:28:21 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAMISKcm004702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 10:28:21 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 10:28:18 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 22 Nov 2017 13:28:07 -0500
Message-ID: <1511375292-27471-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511375292-27471-1-git-send-email-mark.asselstine@windriver.com>
References: <1511375292-27471-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 1/6] python-zaqarclient: uprev to the latest stable/pike
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
X-List-Received-Date: Wed, 22 Nov 2017 18:28:23 -0000
Content-Type: text/plain

Needed uprev and avoids a deprecation warning when running
openstackclient.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-zaqarclient_git.bb       | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb b/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
index 5e11803..b76f2e8 100644
--- a/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
@@ -16,14 +16,17 @@ RDEPENDS_${PN} +=" \
         python-stevedore \
         python-jsonschema \
         python-oslo.i18n \
-        python-keystoneclient \
+        python-oslo.log \
+        python-oslo.utils \
+        python-keystoneauth1 \
+        python-osc-lib \
 	"
-
+	
 SRCNAME = "zaqarclient"
-SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
+SRC_URI = "git://github.com/openstack/${BPN}.git;branch=stable/pike"
 
-PV = "0.2.0+git${SRCPV}"
-SRCREV = "c1a0ea98b6f0aad5764ce197172b41d3efc1e485"
+PV = "0.7.0+git${SRCPV}"
+SRCREV = "a1c2de74c56c6ddb11dc6aec78e8c438629ca8e8"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.7.4


