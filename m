Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D396E00B6F; Wed, 10 Oct 2018 00:00:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AAE10E0097C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Oct 2018 00:00:13 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9A6xRxN018355
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Oct 2018 23:59:43 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 9 Oct 2018 23:59:38 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 10 Oct 2018 14:59:11 +0800
Message-ID: <1539154754-137572-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
References: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] docker-distribution: fix do package qa warning [textrel]
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
X-List-Received-Date: Wed, 10 Oct 2018 07:00:14 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. After security flag PIE is enabled by default, we might met
below QA warning on some arch, like aarch64, fix it by skip
textrel QA check refer commit b689c72a of oe-core

docker-distribution-v2.6.2-r0 do_package_qa: QA Issue: ELF binary 
'work/aarch64-poky-linux/docker-distribution/v2.6.2-r0/packages-split/
docker-registry/usr/sbin/registry' has relocations in .text [textrel]

2. This problem is caused since security_flags.inc is used by default.
   so alternative work around is:
      SECURITY_CFLAGS_pn-docker-distribution = "${SECURITY_NOPIE_CFLAGS}"
      SECURITY_LDFLAGS_pn-docker-distribution = ""

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/docker-distribution/docker-distribution_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index d4f8098..2892556 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -57,7 +57,7 @@ do_install() {
 }
 
 INSANE_SKIP_${PN} += "ldflags already-stripped"
-INSANE_SKIP_${MLPREFIX}docker-registry += "ldflags already-stripped"
+INSANE_SKIP_${MLPREFIX}docker-registry += "ldflags already-stripped textrel"
 
 FILES_docker-registry = "${sbindir}/*"
 FILES_docker-registry += "${systemd_unitdir}/system/docker-registry.service"
-- 
2.7.4


