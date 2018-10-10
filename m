Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25883E00BBD; Tue,  9 Oct 2018 23:59:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99173E00BB5
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Oct 2018 23:59:52 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9A6xqfG007072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Oct 2018 23:59:52 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 9 Oct 2018 23:59:51 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 10 Oct 2018 14:59:13 +0800
Message-ID: <1539154754-137572-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
References: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] oci-image-tools: fix do package qa warning
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
X-List-Received-Date: Wed, 10 Oct 2018 06:59:54 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. After security flag PIE is enabled by default, we might met
below QA warning on some arch, like aarch64, fix it by skip
textrel QA check refer commit b689c72a of oe-core

oci-image-tools-0.2.0-dev+gitAUTOINC+4abe1a166f-r0 do_package_qa: 
QA Issue: ELF binary 'work/aarch64-poky-linux/oci-image-tools/
0.2.0-dev+gitAUTOINC+4abe1a166f-r0/packages-split/oci-image-tools/
usr/sbin/oci-image-tool' has relocations in .text [textrel]

2. This problem is caused since security_flags.inc is used by default.
   so alternative work around is:
      SECURITY_CFLAGS_pn-oci-image-tools = "${SECURITY_NOPIE_CFLAGS}"
      SECURITY_LDFLAGS_pn-oci-image-tools = ""

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/oci-image-tools/oci-image-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
index 807ee26..8c41b6e 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -61,4 +61,4 @@ do_install() {
 	install ${S}/src/import/oci-image-tool ${D}/${sbindir}/
 }
 
-INSANE_SKIP_${PN} += "ldflags"
+INSANE_SKIP_${PN} += "ldflags textrel"
-- 
2.7.4


