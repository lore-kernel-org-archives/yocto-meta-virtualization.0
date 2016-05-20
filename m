Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F02BE00EC4; Thu, 19 May 2016 23:25:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 706CDE009B8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 May 2016 23:25:16 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4K6PFI9030584
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 May 2016 23:25:15 -0700
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 May 2016 23:25:13 -0700
From: <zhe.he@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 20 May 2016 14:25:12 +0800
Message-ID: <1463725512-4414-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] qemu: Add packageconfig for libseccomp to avoid rdepend QA warning
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
X-List-Received-Date: Fri, 20 May 2016 06:25:19 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

"WARNING: QA Issue: qemu rdepends on libseccomp, but it isn't a build
dependency? [build-deps]"

Currently qemu itself checks and links with libsecomp(if version >= 2.1.1)
for x86 and x86-64, since it is not specified in configure, and causes the
above warning.

This patch adds packageconfig for libseccomp and set it disabled as default.
This feature can be enabled whenever libseccomp exists and is needed.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
index ca8274e..9d774c4 100644
--- a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
+++ b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
@@ -1,4 +1,5 @@
 PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice,"
+PACKAGECONFIG[libseccomp] = "--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
 
 PACKAGECONFIG ?= "fdt spice virtfs libcap-ng"
 PACKAGECONFIG_class-native = "fdt"
-- 
1.9.1


