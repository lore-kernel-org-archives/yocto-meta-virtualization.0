Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D49ADE013DE
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Jul 2013 07:06:42 -0700 (PDT)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2013 07:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="352203475"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2013 07:06:40 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 26 Jul 2013 17:06:44 +0300
Message-Id: <1374847604-18982-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 2/2] openvswitch: Ensure pki directory creation
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
X-List-Received-Date: Fri, 26 Jul 2013 14:06:43 -0000

RPM doesn't guarantee the order in which postinstalls are ran.
Added code to ensure the pki directory is initialized.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 .../openvswitch/openvswitch_1.10.0.bb              |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
index fff597c..3703c1b 100644
--- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
+++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
@@ -14,7 +14,7 @@ RDEPENDS_${PN}-pki = "${PN}"
 RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
 RRECOMMENDS_${PN} += "kernel-module-openvswitch"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://openvswitch-switch \
@@ -91,6 +91,10 @@ pkg_postinst_${PN}-controller () {
                 exit 1
         fi
 
+    if test ! -d $D/${datadir}/${PN}/pki; then
+        ovs-pki init --dir=$D/${datadir}/${PN}/pki
+    fi
+
 	cd $D/${sysconfdir}/openvswitch-controller
         if ! test -e cacert.pem; then
             ln -s $D/${datadir}/${PN}/pki/switchca/cacert.pem cacert.pem
-- 
1.7.9.5


