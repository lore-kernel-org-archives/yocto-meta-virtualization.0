Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8D73E008D2; Fri, 15 Sep 2017 09:32:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CB3DE0078E
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Sep 2017 09:32:50 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8FGWn54004221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Sep 2017 09:32:50 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 15 Sep 2017 09:32:48 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 15 Sep 2017 12:32:25 -0400
Message-ID: <1505493145-28718-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] meta-openstack: qemu: match spice arch restrictions
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
X-List-Received-Date: Fri, 15 Sep 2017 16:32:51 -0000
Content-Type: text/plain

The spice recipe is restricted to Intel x86 and x86-64 so keep 'spice'
out of the PACKAGECONFIG unless we are using one of these ARCHs.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
index 9d774c4..ad1ea25 100644
--- a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
+++ b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
@@ -1,6 +1,9 @@
 PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice,"
 PACKAGECONFIG[libseccomp] = "--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
 
-PACKAGECONFIG ?= "fdt spice virtfs libcap-ng"
+PACKAGECONFIG ?= "fdt virtfs libcap-ng"
+PACKAGECONFIG_x86 ?= "fdt spice virtfs libcap-ng"
+PACKAGECONFIG_x86-64 ?= "fdt spice virtfs libcap-ng"
+
 PACKAGECONFIG_class-native = "fdt"
 PACKAGECONFIG_class-nativesdk = "fdt"
-- 
2.7.4


