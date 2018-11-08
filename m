Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A10AE00AC5; Wed,  7 Nov 2018 21:18:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D88A4E00A6B
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Nov 2018 21:18:15 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA85IEMb004599
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Nov 2018 21:18:14 -0800 (PST)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 7 Nov 2018 21:18:13 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Thu, 8 Nov 2018 13:18:37 +0800
Message-ID: <1541654317-38773-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] ceph: fix rbd create operation not supported
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
X-List-Received-Date: Thu, 08 Nov 2018 05:18:16 -0000
Content-Type: text/plain

When using qemu-img to create rbd based image:

    qemu-img create -f rbd rbd:libvirt-pool/libvirt-image 2G

Output errors:

    qemu-img: rbd:libvirt-pool/libvirt-image: error rbd create: Operation not supported

Accroding to upstream's advice:

    http://lists.ceph.com/pipermail/ceph-users-ceph.com/2018-November/031014.html

This is because the system can't find libcls_rbd.so, this library
was packaged in ceph-dev, we should package it in ceph.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 recipes-extended/ceph/ceph_13.2.2.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/ceph/ceph_13.2.2.bb b/recipes-extended/ceph/ceph_13.2.2.bb
index 3d9faae..08021cf 100644
--- a/recipes-extended/ceph/ceph_13.2.2.bb
+++ b/recipes-extended/ceph/ceph_13.2.2.bb
@@ -80,9 +80,7 @@ do_install_append () {
 }
 
 FILES_${PN} += "\
-                ${libdir}/rados-classes/*.so.* \
-"
-FILES_${PN}-dev += "\
+		${libdir}/rados-classes/*.so.* \
 		${libdir}/ceph/compressor/*.so \
 		${libdir}/rados-classes/*.so \
 		${libdir}/ceph/*.so \
@@ -102,3 +100,4 @@ PACKAGES += " \
 	${PN}-python \
 "
 INSANE_SKIP_${PN}-python += "ldflags"
+INSANE_SKIP_${PN} += "dev-so"
-- 
2.7.4


