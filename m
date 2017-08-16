Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2E7FE00C89; Tue, 15 Aug 2017 21:52:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FAB5E00A39
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Aug 2017 21:52:00 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7G4pxAS003854
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Aug 2017 21:51:59 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 15 Aug 2017 21:51:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 16 Aug 2017 12:51:22 +0800
Message-ID: <20170816045122.23963-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] openvswitch: add libcap-ng PACKAGECONFIG
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
X-List-Received-Date: Wed, 16 Aug 2017 04:52:02 -0000
Content-Type: text/plain

Add PACKAGECONFIG for libcap-ng, and default to enable it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 35f4ba8..b4aab35 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -50,8 +50,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
 
 DPDK_INSTALL_DIR ?= "/opt/dpdk"
 
-PACKAGECONFIG ?= ""
+PACKAGECONFIG ?= "libcap-ng"
 PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}${DPDK_INSTALL_DIR}/share/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,dpdk"
+PACKAGECONFIG[libcap-ng] = "--enable-libcapng,--disable-libcapng,libcap-ng,"
 
 # Don't compile kernel modules by default since it heavily depends on
 # kernel version. Use the in-kernel module for now.
-- 
2.11.0


