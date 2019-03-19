Return-Path: <Liezhi.Yang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A7CCE00D13; Tue, 19 Mar 2019 01:46:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2627FE00B58
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Mar 2019 01:46:23 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2J8jUYU012678
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Mar 2019 01:46:11 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Tue, 19 Mar 2019 01:45:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 19 Mar 2019 17:05:09 +0800
Message-ID: <1552986309-84594-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] docker: Set the same COMPATIBLE_HOST as containerd-opencontainers.
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
X-List-Received-Date: Tue, 19 Mar 2019 08:46:24 -0000
Content-Type: text/plain

It depends on virtual/containerd which is provided by
containerd-opencontainers, so set the same COMPATIBLE_HOST as the last one.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 recipes-containers/docker/docker_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 19e773b..fd33714 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -174,3 +174,5 @@ RDEPENDS_${PN}-contrib += "bash"
 # DO NOT STRIP docker
 INHIBIT_PACKAGE_STRIP = "1"
 INSANE_SKIP_${PN} += "ldflags textrel"
+
+COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
-- 
2.7.4


