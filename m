Return-Path: <Fupan.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6A98E00CAB; Tue,  1 Aug 2017 23:15:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60F76E00C19
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Aug 2017 23:15:53 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v726Frn0032086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 1 Aug 2017 23:15:53 -0700
Received: from svc-pulsar-build.wrs.com (128.224.137.13) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 1 Aug 2017 23:15:52 -0700
From: Fupan Li <fupan.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Aug 2017 06:15:51 +0000
Message-ID: <1501654551-155594-2-git-send-email-fupan.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501654551-155594-1-git-send-email-fupan.li@windriver.com>
References: <1501654551-155594-1-git-send-email-fupan.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] meta-virtualization: Drop ROOTFS_PKGMANAGE_BOOTSTRAP
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
X-List-Received-Date: Wed, 02 Aug 2017 06:15:54 -0000
Content-Type: text/plain

OE-Core has now dropped this var in the commit of
697804229a17<run-postinsts: simplify the logic of
whether to install it to images>.

Signed-off-by: Fupan Li <fupan.li@windriver.com>
---
 recipes-extended/images/cloud-image-controller.bb | 1 -
 recipes-extended/images/cloud-image-guest.bb      | 1 -
 2 files changed, 2 deletions(-)

diff --git a/recipes-extended/images/cloud-image-controller.bb b/recipes-extended/images/cloud-image-controller.bb
index 5eef302..c816545 100644
--- a/recipes-extended/images/cloud-image-controller.bb
+++ b/recipes-extended/images/cloud-image-controller.bb
@@ -3,7 +3,6 @@ EXTRA_IMAGE_FEATURES = "tools-debug debug-tweaks"
 
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
-    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
     packagegroup-core-basic \
     openvswitch \
     openvswitch-controller \
diff --git a/recipes-extended/images/cloud-image-guest.bb b/recipes-extended/images/cloud-image-guest.bb
index 5db25f0..2957506 100644
--- a/recipes-extended/images/cloud-image-guest.bb
+++ b/recipes-extended/images/cloud-image-guest.bb
@@ -3,7 +3,6 @@ EXTRA_IMAGE_FEATURES = "tools-debug debug-tweaks"
 
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
-    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
     packagegroup-core-basic \
     openflow \
     qemu \   
-- 
2.7.4


