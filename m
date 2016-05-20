Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C909E00EC4; Thu, 19 May 2016 23:27:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02074E009B8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 May 2016 23:27:26 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4K6RPWD021109
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 May 2016 23:27:25 -0700 (PDT)
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 May 2016 23:27:24 -0700
From: <zhe.he@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 20 May 2016 14:27:23 +0800
Message-ID: <1463725643-4514-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [meta-cloud-services][PATCH] qemu: Add packageconfig for libseccomp to avoid rdepend QA warning
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
X-List-Received-Date: Fri, 20 May 2016 06:27:28 -0000
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


