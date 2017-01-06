Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E7D0E00566; Fri,  6 Jan 2017 08:51:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C145E0053F
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jan 2017 08:51:02 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v06Gp1Lh009872
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 6 Jan 2017 08:51:01 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 6 Jan 2017 08:51:00 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 6 Jan 2017 11:50:58 -0500
Message-ID: <1483721458-14568-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [mcs][PATCH] housekeeping: update Poky LICENSE checksum
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
X-List-Received-Date: Fri, 06 Jan 2017 16:51:05 -0000
Content-Type: text/plain

The Poky LICENSE file was updated at the beginning of 2014 and we have
yet to update the md5 to reflect this.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-extended/packagegroups/packagegroup-cloud-benchmarking.bb   | 2 +-
 .../recipes-extended/packagegroups/packagegroup-cloud-compute.bb        | 2 +-
 .../recipes-extended/packagegroups/packagegroup-cloud-controller.bb     | 2 +-
 .../recipes-extended/packagegroups/packagegroup-cloud-debug.bb          | 2 +-
 .../recipes-extended/packagegroups/packagegroup-cloud-extras.bb         | 2 +-
 .../recipes-extended/packagegroups/packagegroup-cloud-network.bb        | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-benchmarking.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-benchmarking.bb
index 46f18fb..6310b8f 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-benchmarking.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-benchmarking.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Add benchmarking capabilities to cloud images"
 PR = "r0"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
index 7563792..21f8f10 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Configuration for OpenStack Compute node"
 PR = "r0"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
index 653a493..f172839 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Configuration for OpenStack Controller node"
 PR = "r0"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-debug.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-debug.bb
index eb3cb50..e5517d2 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-debug.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-debug.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Add debugging capabilities to cloud images"
 PR = "r0"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb
index 2fcad8b..6fb6045 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Extra packages that improve the usability of compute/control nodes"
 PR = "r0"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-network.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-network.bb
index 6134124..f5b07a2 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-network.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-network.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Configuration for OpenStack Network node"
 PR = "r0"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
-- 
2.7.4


