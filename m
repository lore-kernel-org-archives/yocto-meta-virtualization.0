Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE465E00B6F; Tue,  9 Oct 2018 23:59:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8A59E0097C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Oct 2018 23:59:48 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9A6xRxL018355
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Oct 2018 23:59:38 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 9 Oct 2018 23:59:17 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 10 Oct 2018 14:59:10 +0800
Message-ID: <1539154754-137572-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
References: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] docker-distribution: fix do package qa warning[ldflags]
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
X-List-Received-Date: Wed, 10 Oct 2018 06:59:49 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

when bitbake lib32-docker-distribution, we might met below
warning:

lib32-docker-distribution-v2.6.2-r0 do_package_qa: QA Issue: No GNU_HASH
in the elf binary: 'work/core2-32-wrsmllib32-linux/lib32-docker-distribution
/v2.6.2-r0/packages-split/lib32-docker-registry/usr/sbin/registry' [ldflags]

which caused by "INSANE_SKIP_docker-registry += "ldflags already-stripped"
don't cover case for multilib, so add multilib prefix MLPREFIX
to fix it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/docker-distribution/docker-distribution_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index add5ce1..d4f8098 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -57,7 +57,7 @@ do_install() {
 }
 
 INSANE_SKIP_${PN} += "ldflags already-stripped"
-INSANE_SKIP_docker-registry += "ldflags already-stripped"
+INSANE_SKIP_${MLPREFIX}docker-registry += "ldflags already-stripped"
 
 FILES_docker-registry = "${sbindir}/*"
 FILES_docker-registry += "${systemd_unitdir}/system/docker-registry.service"
-- 
2.7.4


