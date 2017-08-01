Return-Path: <Liezhi.Yang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51672E00C5F; Mon, 31 Jul 2017 19:22:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87408E00C2E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Jul 2017 19:22:53 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v712Mq8l022767
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Jul 2017 19:22:52 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 31 Jul 2017 19:22:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 31 Jul 2017 19:22:51 -0700
Message-ID: <20170801022251.38972-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] cloud-image-guest/controller: remove inherit image-vm
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
X-List-Received-Date: Tue, 01 Aug 2017 02:22:54 -0000
Content-Type: text/plain

The image-vm.bbclass had been removed by oe-core, and vmdk is replaced
by wic.vmdk.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 recipes-extended/images/cloud-image-controller.bb | 3 +--
 recipes-extended/images/cloud-image-guest.bb      | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/images/cloud-image-controller.bb b/recipes-extended/images/cloud-image-controller.bb
index 0b2a67b..5eef302 100644
--- a/recipes-extended/images/cloud-image-controller.bb
+++ b/recipes-extended/images/cloud-image-controller.bb
@@ -26,9 +26,8 @@ IMAGE_INSTALL = "\
     "
 
 inherit core-image
-inherit image-vm
 
-IMAGE_FSTYPES = "vmdk tar.gz"
+IMAGE_FSTYPES = "wic.vmdk tar.gz"
 
 # Ensure extra space for guest images
 #IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
diff --git a/recipes-extended/images/cloud-image-guest.bb b/recipes-extended/images/cloud-image-guest.bb
index e24bf0d..5db25f0 100644
--- a/recipes-extended/images/cloud-image-guest.bb
+++ b/recipes-extended/images/cloud-image-guest.bb
@@ -13,6 +13,5 @@ IMAGE_INSTALL = "\
     "
 
 inherit core-image
-inherit image-vm
 
-IMAGE_FSTYPES += "vmdk"
+IMAGE_FSTYPES += "wic.vmdk"
-- 
2.10.2


