Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EEDEAE00E0B; Wed, 24 Jul 2019 22:30:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F67BE00BA1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Jul 2019 22:30:31 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6P5UUPE001071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Jul 2019 22:30:30 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 24 Jul 2019 22:30:29 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 13:30:25 +0800
Message-ID: <1564032628-397256-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH 1/3] packagegroup-cloud-compute: remove postgresql-setup
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
X-List-Received-Date: Thu, 25 Jul 2019 05:30:32 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Package postgresql provides postgresql-setup file
and packagegroup-cloud-compute already rdepends on
postgresql, so remove postgresql-setup to avoid below
error when run yocto compliance check against meta-openstack
layer.
ERROR: Nothing RPROVIDES 'postgresql-setup' (but /mybuild/layers/meta-cloud-services/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb, /mybuild/layers/meta-cloud-services/meta-openstack/recipes-devtools/python/python-glance_git.bb, /mybuild/layers/meta-cloud-services/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'postgresql-setup' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['postgresql-setup']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'packagegroup-cloud-compute', 'postgresql-setup']

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../recipes-extended/packagegroups/packagegroup-cloud-compute.bb         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
index 2e9446d..e884af0 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
@@ -8,7 +8,6 @@ inherit packagegroup
 
 RDEPENDS_${PN} = " \
     cloud-init \
-    postgresql-setup \
     postgresql \
     qemu \
     libvirt \
-- 
2.7.4


