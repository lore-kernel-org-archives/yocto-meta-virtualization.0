Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E283E00BB5; Tue,  9 Oct 2018 23:59:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73625E00BAF
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Oct 2018 23:59:51 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9A6xopb003951
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Oct 2018 23:59:51 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 9 Oct 2018 23:59:43 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 10 Oct 2018 14:59:12 +0800
Message-ID: <1539154754-137572-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
References: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] docker: fix do package qa warning
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

WARNING: docker-18.03.0+git708b068d3095c6a6be939eb2da78c921d2e945e2-r0 
do_package_qa: QA Issue: ELF binary 'work/aarch64-poky-linux/docker/
18.03.0+git708b068d3095c6a6be939eb2da78c921d2e945e2-r0/packages-split/
docker/usr/bin/docker' has relocations in .text [textrel]

2. This problem is caused since security_flags.inc is used by default.
   so alternative work around is:
      SECURITY_CFLAGS_pn-docker = "${SECURITY_NOPIE_CFLAGS}"
      SECURITY_LDFLAGS_pn-docker = ""

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/docker/docker_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 73e0120..b3673d4 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -172,4 +172,4 @@ RDEPENDS_${PN}-contrib += "bash"
 
 # DO NOT STRIP docker
 INHIBIT_PACKAGE_STRIP = "1"
-INSANE_SKIP_${PN} += "ldflags"
+INSANE_SKIP_${PN} += "ldflags textrel"
-- 
2.7.4


