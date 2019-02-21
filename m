Return-Path: <joe.slater@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69A7DE00BB7; Wed, 20 Feb 2019 16:27:00 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34C98E00872
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 16:26:58 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1L0QcV9019452
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 16:26:48 -0800
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Wed, 20 Feb 2019 16:26:27 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 20 Feb 2019 16:26:27 -0800
Message-ID: <20190221002627.163588-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-virt][m-c-s][PATCH 1/1] consul: do not try to build for mips
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
X-List-Received-Date: Thu, 21 Feb 2019 00:27:00 -0000
Content-Type: text/plain

Use COMPATIBLE_HOST to prevent building for mipsarch.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-connectivity/consul/consul_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
index ee49c5e..b0afa03 100644
--- a/recipes-connectivity/consul/consul_git.bb
+++ b/recipes-connectivity/consul/consul_git.bb
@@ -14,6 +14,10 @@ S = "${WORKDIR}/git"
 
 inherit systemd go
 
+# Besides the hosts specified in goarch, we do not build for mips.
+#
+COMPATIBLE_HOST_mipsarch = "null"
+
 SYSTEMD_SERVICE_${PN} = "consul.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "enable"
 
-- 
2.7.4


