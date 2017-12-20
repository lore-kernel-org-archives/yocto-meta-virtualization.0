Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9DD3E00D81; Tue, 19 Dec 2017 20:03:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A48E6E00D6B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Dec 2017 20:03:06 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBK435S3020979
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Dec 2017 20:03:05 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 19 Dec 2017 20:03:03 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 19 Dec 2017 23:02:57 -0500
Message-ID: <1513742577-8379-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] kvm-image-minimal: drop remaining ROOTFS_PKGMANAGE_BOOTSTRAP
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
X-List-Received-Date: Wed, 20 Dec 2017 04:03:07 -0000
Content-Type: text/plain

Commit 4eee02bd6405557c664f91b6079c2f203d48c545 [meta-virtualization:
Drop ROOTFS_PKGMANAGE_BOOTSTRAP] missed this instance so we are
removing this last reference to ROOTFS_PKGMANAGE_BOOTSTRAP now.

The ROOTFS_PKGMANAGE_BOOTSTRAP has been universally removed since
oe-core commit 697804229a172125ce7d3bfc9b343812d6fe3240
[run-postinsts: simplify the logic of whether to install it to
images].

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/images/kvm-image-minimal.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-extended/images/kvm-image-minimal.bb b/recipes-extended/images/kvm-image-minimal.bb
index c96edca..b28cc30 100644
--- a/recipes-extended/images/kvm-image-minimal.bb
+++ b/recipes-extended/images/kvm-image-minimal.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "A minimal kvm image"
 
 IMAGE_INSTALL = " \
     packagegroup-core-boot \
-    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
     qemu \
     libvirt \
     libvirt-libvirtd \
-- 
2.7.4


