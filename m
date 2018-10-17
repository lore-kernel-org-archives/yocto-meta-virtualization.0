Return-Path: <mark.hatle@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A25CE00B5E; Wed, 17 Oct 2018 13:04:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B071E00A0C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Oct 2018 13:04:12 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9HK4CQN029070
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Oct 2018 13:04:12 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 17 Oct 2018 13:04:11 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 17 Oct 2018 16:04:10 -0400
Message-ID: <20181017200410.114697-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
MIME-Version: 1.0
Subject: [PATCH] openvswitch: Make openvswitch a machine_arch package
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
X-List-Received-Date: Wed, 17 Oct 2018 20:04:14 -0000
Content-Type: text/plain

Openvswitch recipe depends on the kernel source, which is machine specific.
It can then use this machine specific resource to configure and build the
recipe.  This mix causes the hash values of this package to change based on
the machine, so this package must also be a machine_arch package.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 4cd82d7..a930933 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -2,6 +2,8 @@ require openvswitch.inc
 
 DEPENDS += "virtual/kernel"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 RDEPENDS_${PN}-ptest += "\
 	python3-logging python3-syslog python3-io \
 	python3-fcntl python3-shell python3-xml python3-math \
-- 
2.16.0.rc2


