Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A0E1E00C4D; Sun, 17 Mar 2019 18:56:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 083F7E0049A
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Mar 2019 18:56:48 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2I1uSPl031422
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Mar 2019 18:56:38 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Sun, 17 Mar 2019 18:56:17 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 18 Mar 2019 09:56:14 +0800
Message-ID: <1552874174-26647-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: place the qemu configure option to PACKAGECONFIG
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
X-List-Received-Date: Mon, 18 Mar 2019 01:56:50 -0000
Content-Type: text/plain

If we build libvirt with mips64 arch will fail that was not compatible with,
so place the qemu configure options to PACKAGECONFIG, let the PACKAGECONFIG
control the build options.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 recipes-extended/libvirt/libvirt_4.9.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_4.9.0.bb b/recipes-extended/libvirt/libvirt_4.9.0.bb
index 17ac799..813d95e 100644
--- a/recipes-extended/libvirt/libvirt_4.9.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.9.0.bb
@@ -197,7 +197,7 @@ PACKAGECONFIG_remove_mipsarchn64 = "qemu"
 
 # enable,disable,depends,rdepends
 #
-PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
+PACKAGECONFIG[qemu] = "--with-qemu --with-qemu-user=qemu --with-qemu-group=qemu,--without-qemu,qemu,"
 PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
 PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
 PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen,"
@@ -315,8 +315,6 @@ do_install_append() {
 EXTRA_OECONF += " \
     --with-init-script=systemd \
     --with-test-suite \
-    --with-qemu-user=qemu \
-    --with-qemu-group=qemu \
     "
 
 EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH} SYSTEMD_UNIT_DIR=${systemd_system_unitdir}"
-- 
2.7.4


