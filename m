Return-Path: <Hongxu.Jia@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 904FAE00A16; Wed,  5 Sep 2018 05:33:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40EF8E009B8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Sep 2018 05:33:04 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w85CX2rt012134
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2018 05:33:03 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Sep 2018 05:33:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 5 Sep 2018 08:32:04 -0400
Message-ID: <1536150724-171359-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] openvswitch: do not use 'exit 1' to postpone to first boot
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
X-List-Received-Date: Wed, 05 Sep 2018 12:33:04 -0000
Content-Type: text/plain

Since `229f4e9 package.bbclass: add support for
pkg_postinst_ontarget()' applied in oe-core, use
pkg_postinst_ontarget to run postinst at first boot.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-networking/openvswitch/openvswitch.inc | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index 70ac5bc..8aab739 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -134,22 +134,13 @@ do_install_append() {
 	cp -r ${S}/python/ovstest/ ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages/
 }
 
-pkg_postinst_${PN}-pki () {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
+pkg_postinst_ontarget_${PN}-pki () {
 	if test ! -d $D/${datadir}/${PN}/pki; then
 		ovs-pki init --dir=$D/${datadir}/${PN}/pki
 	fi
 }
 
-pkg_postinst_${PN}-testcontroller () {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
+pkg_postinst_ontarget_${PN}-testcontroller () {
 	if test ! -d $D/${datadir}/${PN}/pki; then
 		ovs-pki init --dir=$D/${datadir}/${PN}/pki
 	fi
-- 
2.8.1


