Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E55CDE009EA; Thu, 27 Jun 2019 23:04:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 552A6E00942
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Jun 2019 23:04:04 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5S643vD015891
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Jun 2019 23:04:03 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 23:04:03 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 28 Jun 2019 14:04:01 +0800
Message-ID: <1561701841-10341-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] docker-distribution: remove docker-distribution-ptest dependencies
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
X-List-Received-Date: Fri, 28 Jun 2019 06:04:05 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

after commit https://git.openembedded.org/openembedded-core/
commit/meta/classes/ptest.bbclass?id=b47194b57d94260b4e6438c5bf74914027f0b520
package ${PN}-ptest will depend on ${PN} by default,
but for docker-distribution, ${PN} is empty package, remove it from dependency
to avoid image do rootfs failure since nothing provides error.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/docker-distribution/docker-distribution_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 25e4db9..4bf3c6e 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -66,3 +66,5 @@ FILES_docker-registry += "${localstatedir}/lib/registry/"
 
 SYSTEMD_SERVICE_docker-registry = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
 SYSTEMD_AUTO_ENABLE_docker-registry = "enable"
+
+RDEPENDS_${PN}-ptest_remove = "${PN}"
-- 
2.7.4


