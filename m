Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B14BDE00B5C; Wed, 11 Nov 2015 18:50:41 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 915B7E008D2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Nov 2015 18:50:38 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAC2obt7016707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Nov 2015 18:50:38 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 11 Nov 2015 18:50:37 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 11 Nov 2015 21:50:30 -0500
Message-ID: <1447296631-16483-5-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
References: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH 5/6] openvswitch: add as RRECOMMENDS for compute and controller
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
X-List-Received-Date: Thu, 12 Nov 2015 02:50:41 -0000
Content-Type: text/plain

We use openvswitch throughout the openstack images so we need to make
sure the kernel module is available by adding it to the list of
RRECOMMENDS packages.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-extended/packagegroups/packagegroup-cloud-compute.bb         | 1 +
 .../recipes-extended/packagegroups/packagegroup-cloud-controller.bb      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
index 2769e02..98a7348 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
@@ -41,4 +41,5 @@ RRECOMMENDS_${PN} = " \
     kernel-module-fuse \
     kernel-module-softdog \
     kernel-module-veth \
+    kernel-module-openvswitch \
     "
diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
index 706d3ec..2718d2e 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
@@ -61,4 +61,5 @@ RRECOMMENDS_${PN} = " \
     kernel-module-fuse \
     cloud-init \
     kernel-module-softdog \
+    kernel-module-openvswitch \
     "
-- 
2.1.4


