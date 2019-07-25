Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 449E7E00E0B; Wed, 24 Jul 2019 22:31:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEB68E00BA1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Jul 2019 22:31:17 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6P5Ufpr020551
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Jul 2019 22:30:51 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 24 Jul 2019 22:30:30 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 13:30:26 +0800
Message-ID: <1564032628-397256-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564032628-397256-1-git-send-email-mingli.yu@windriver.com>
References: <1564032628-397256-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH 2/3] python-glance_git: change postgresql-setup to postgresql
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
X-List-Received-Date: Thu, 25 Jul 2019 05:31:18 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Package postgresql provides postgresql-setup file
and so change postgresql-setup to postgresql to
avoid below error when run yocto compliance check
against meta-openstack layer.
ERROR: Nothing RPROVIDES 'postgresql-setup' (but /mybuild/layers/meta-cloud-services/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb, /mybuild/layers/meta-cloud-services/meta-openstack/recipes-devtools/python/python-glance_git.bb, /mybuild/layers/meta-cloud-services/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'postgresql-setup' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['postgresql-setup']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'packagegroup-cloud-compute', 'postgresql-setup']

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-glance_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-glance_git.bb b/meta-openstack/recipes-devtools/python/python-glance_git.bb
index 6a6cded..a4a39cb 100644
--- a/meta-openstack/recipes-devtools/python/python-glance_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glance_git.bb
@@ -222,7 +222,7 @@ RDEPENDS_${SRCNAME} = " \
 
 RDEPENDS_${SRCNAME}-api = "${SRCNAME}"
 RDEPENDS_${SRCNAME}-registry = "${SRCNAME}"
-RDEPENDS_${SRCNAME}-setup = "postgresql-setup keystone-setup sudo ${SRCNAME}"
+RDEPENDS_${SRCNAME}-setup = "postgresql keystone-setup sudo ${SRCNAME}"
 RDEPENDS_${SRCNAME}-tests = "python-psutil qpid-python bash"
 
 SYSTEMD_PACKAGES = "${SRCNAME}-api ${SRCNAME}-registry ${SRCNAME}-setup"
-- 
2.7.4


