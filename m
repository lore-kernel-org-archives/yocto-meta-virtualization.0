Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6051E013DE
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Jul 2013 07:01:03 -0700 (PDT)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2013 06:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="352199792"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2013 07:00:50 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 26 Jul 2013 17:00:52 +0300
Message-Id: <1374847253-18653-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] openvswitch: Add coreutils runtime dependency
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
X-List-Received-Date: Fri, 26 Jul 2013 14:01:03 -0000

The install and nice programs from coreutils are required by openvswitch.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 .../openvswitch/openvswitch_1.10.0.bb              |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
index 2e9506f..fff597c 100644
--- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
+++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
@@ -6,7 +6,7 @@ LICENSE = "Apache-2"
 
 DEPENDS += "bridge-utils openssl python perl"
 
-RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid \
+RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
 	       python perl perl-module-strict ${PN}-switch ${PN}-controller"
 RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
 RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
@@ -14,7 +14,7 @@ RDEPENDS_${PN}-pki = "${PN}"
 RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
 RRECOMMENDS_${PN} += "kernel-module-openvswitch"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://openvswitch-switch \
-- 
1.7.9.5


