Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04629E00BAA; Mon, 28 May 2018 11:21:17 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA202E007CE
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 11:21:15 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4SILF2x017989
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 11:21:15 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 28 May 2018 11:21:14 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 28 May 2018 14:21:11 -0400
Message-ID: <1527531671-31867-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [V2][PATCH] kvmtool: uprev to latest version
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
X-List-Received-Date: Mon, 28 May 2018 18:21:17 -0000
Content-Type: text/plain

Currently on the master branch builds of kvmtool are failing due to
several missing headers. We need to only use the uapi headers and we
also need the kvmtool upstream commit 1cc05b24bfe0 [x86/kvm-cpu.c:
don't include <asm/msr-index.h>] to get the builds to work. So we
can't do this as a fix and uprev and must do both at once in this
single commit.

The upstream project does not have releases so using the latest commit
and setting the version to 4.14.0 to reflect the kernel version we
currently build and which tests were done with, when using Yocto
master.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

V2:
* Add changes missed in V1 to set SRCREV and PV

 recipes-extended/kvmtool/kvmtool.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/kvmtool/kvmtool.bb b/recipes-extended/kvmtool/kvmtool.bb
index 33fec31..d487ee2 100644
--- a/recipes-extended/kvmtool/kvmtool.bb
+++ b/recipes-extended/kvmtool/kvmtool.bb
@@ -16,12 +16,12 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git \
            file://0002-kvmtool-add-EXTRA_CFLAGS-variable.patch \
            "
 
-SRCREV = "3fea89a924511f9f8fe05a892098fad77c1eca0d"
-PV = "3.18.0+git${SRCREV}"
+SRCREV = "0e1882a49f81cb15d328ef83a78849c0ea26eecc"
+PV = "4.14.0+git${SRCREV}"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE='V=1 EXTRA_CFLAGS="-I${STAGING_KERNEL_DIR}/arch/${ARCH}/include -I${STAGING_KERNEL_BUILDDIR}/arch/${ARCH}/include/generated/"'
+EXTRA_OEMAKE='V=1 EXTRA_CFLAGS="-I${STAGING_KERNEL_BUILDDIR}/include/generated -I${STAGING_KERNEL_BUILDDIR}/arch/${ARCH}/include/generated"'
 
 do_install() {
     install -d ${D}${bindir}
-- 
2.7.4


