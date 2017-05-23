Return-Path: <Adrian.Dudau@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50BD1E0080F; Tue, 23 May 2017 05:50:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [185.38.181.36 listed in list.dnswl.org]
X-Greylist: delayed 253 seconds by postgrey-1.32 at yocto-www;
	Tue, 23 May 2017 05:50:02 PDT
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.36])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1F09E00724
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 May 2017 05:50:02 -0700 (PDT)
Received: from 1dD9C8-0001ES-TT by out11d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1dD9C8-0001Ep-Ty
	for meta-virtualization@yoctoproject.org;
	Tue, 23 May 2017 05:45:48 -0700
Received: by emcmailer; Tue, 23 May 2017 05:45:48 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11d.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <Adrian.Dudau@enea.com>)
	id 1dD9C8-0001ES-TT for meta-virtualization@yoctoproject.org;
	Tue, 23 May 2017 05:45:48 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Tue, 23 May 2017 14:45:47 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id E42414404F5;
	Tue, 23 May 2017 14:45:47 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 23 May 2017 14:45:47 +0200
Message-ID: <1495543547-3174-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [meta-cloud-services][PATCH] openstack-image-*: Remove ROOTFS_PKGMANAGE_BOOTSTRAP
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
X-List-Received-Date: Tue, 23 May 2017 12:50:06 -0000
Content-Type: text/plain

run-postinsts is now installed by default in image.bbclass, so no need
to include it in each image.

Reference: OE-core rev 529244ee212fe14019e35a5f163fab705ddbf141

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 meta-openstack/recipes-extended/images/openstack-image-aio.bb        | 1 -
 meta-openstack/recipes-extended/images/openstack-image-compute.bb    | 1 -
 meta-openstack/recipes-extended/images/openstack-image-controller.bb | 1 -
 meta-openstack/recipes-extended/images/openstack-image-network.bb    | 1 -
 4 files changed, 4 deletions(-)

diff --git a/meta-openstack/recipes-extended/images/openstack-image-aio.bb b/meta-openstack/recipes-extended/images/openstack-image-aio.bb
index 2df8536..2fbb85e 100644
--- a/meta-openstack/recipes-extended/images/openstack-image-aio.bb
+++ b/meta-openstack/recipes-extended/images/openstack-image-aio.bb
@@ -6,7 +6,6 @@ OPENSTACK_COMPUTE_EXTRA_INSTALL ?= ""
 OPENSTACK_AIO_EXTRA_INSTALL ?= ""
 
 IMAGE_INSTALL = " \
-    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
     ${CORE_IMAGE_BASE_INSTALL} \
     packagegroup-core-full-cmdline \
     packagegroup-cloud-compute \
diff --git a/meta-openstack/recipes-extended/images/openstack-image-compute.bb b/meta-openstack/recipes-extended/images/openstack-image-compute.bb
index 979e525..897efc4 100644
--- a/meta-openstack/recipes-extended/images/openstack-image-compute.bb
+++ b/meta-openstack/recipes-extended/images/openstack-image-compute.bb
@@ -5,7 +5,6 @@ OPENSTACK_COMPUTE_EXTRA_INSTALL ?= ""
 
 IMAGE_INSTALL = " \
     packagegroup-core-boot \
-    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
     packagegroup-cloud-compute \
     packagegroup-cloud-debug \
     packagegroup-cloud-extras \
diff --git a/meta-openstack/recipes-extended/images/openstack-image-controller.bb b/meta-openstack/recipes-extended/images/openstack-image-controller.bb
index 89a4d07..6f324d8 100644
--- a/meta-openstack/recipes-extended/images/openstack-image-controller.bb
+++ b/meta-openstack/recipes-extended/images/openstack-image-controller.bb
@@ -5,7 +5,6 @@ OPENSTACK_CONTROLLER_EXTRA_INSTALL ?= ""
 
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
-    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
     packagegroup-core-full-cmdline \
     packagegroup-cloud-controller \
     packagegroup-cloud-network \
diff --git a/meta-openstack/recipes-extended/images/openstack-image-network.bb b/meta-openstack/recipes-extended/images/openstack-image-network.bb
index 8c94357..370c273 100644
--- a/meta-openstack/recipes-extended/images/openstack-image-network.bb
+++ b/meta-openstack/recipes-extended/images/openstack-image-network.bb
@@ -3,7 +3,6 @@ LICENSE = "MIT"
 
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
-    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
     packagegroup-core-full-cmdline \
     packagegroup-cloud-network \
     "
-- 
2.7.4


