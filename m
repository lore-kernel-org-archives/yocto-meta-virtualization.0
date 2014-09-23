Return-Path: <Zibo.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6AC3E008A2; Tue, 23 Sep 2014 11:57:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18870E0084D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Sep 2014 11:56:50 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8NIunI2029294
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Sep 2014 11:56:49 -0700 (PDT)
Received: from chinabull.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 11:56:49 -0700
From: Zibo Zhao <zibo.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 23 Sep 2014 14:56:43 -0400
Message-ID: <1411498603-13375-1-git-send-email-zibo.zhao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/1] Add udev dependency for multipath-tools package
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
X-List-Received-Date: Tue, 23 Sep 2014 18:57:08 -0000
Content-Type: text/plain

mutipath-tools package has build time dependency on udev.
Without it, following build error will occur:
| discovery.c:14:21: fatal error: libudev.h: No such file or directory
| compilation terminated.
| make[1]: *** [discovery.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| config.c:8:21: fatal error: libudev.h: No such file or directory
| compilation terminated.
| make[1]: *** [config.o] Error 1
| structs.c:8:21: fatal error: libudev.h: No such file or directory
| compilation terminated.
| make[1]: *** [structs.o] Error 1

Add udev into DEPENDS to avoid build failures.

Signed-off-by: Zibo Zhao <zibo.zhao@windriver.com>
---
 recipes-extended/multipath-tools/multipath-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb b/recipes-extended/multipath-tools/multipath-tools_git.bb
index 633b9f2..01d15dd 100644
--- a/recipes-extended/multipath-tools/multipath-tools_git.bb
+++ b/recipes-extended/multipath-tools/multipath-tools_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "This package provides the tools to manage multipathed devices by
 instructing the device-mapper multipath module what to do"
 
 HOMEPAGE = "http://christophe.varoqui.free.fr/"
-DEPENDS = "readline libaio lvm2"
+DEPENDS = "readline libaio lvm2 udev"
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
-- 
1.9.1


