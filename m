Return-Path: <Fupan.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C0FDE00CAB; Tue,  1 Aug 2017 23:15:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27C59E00C19
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Aug 2017 23:15:52 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v726Fqii017292
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 1 Aug 2017 23:15:52 -0700 (PDT)
Received: from svc-pulsar-build.wrs.com (128.224.137.13) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 1 Aug 2017 23:15:51 -0700
From: Fupan Li <fupan.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Aug 2017 06:15:50 +0000
Message-ID: <1501654551-155594-1-git-send-email-fupan.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] meta-virtualization:remove inheritting class image-vm
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
X-List-Received-Date: Wed, 02 Aug 2017 06:15:53 -0000
Content-Type: text/plain

oe-core had removed image-vm.bbclass in the commit of
929ba563f1bc7195c4981b8e139c432b2cc388ea and using wic.vmdk
to replace vmdk in IMAGE_FSTYPES.

Signed-off-by: Fupan Li <fupan.li@windriver.com>
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
2.7.4


