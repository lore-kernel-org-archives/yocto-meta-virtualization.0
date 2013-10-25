Return-Path: <Paul.Barrette@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BAF4E01774
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Oct 2013 14:26:28 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9PLQSC7019730
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Oct 2013 14:26:28 -0700 (PDT)
Received: from yow-pbarrett-lx.wrs.com (128.224.146.11) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 25 Oct 2013 14:26:28 -0700
From: Paul Barrette <paul.barrette@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 25 Oct 2013 17:26:27 -0400
Message-ID: <1382736387-20490-1-git-send-email-paul.barrette@windriver.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [PATCH] openvswitch: fix RDEPENDS issue for installers.
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
X-List-Received-Date: Fri, 25 Oct 2013 21:26:29 -0000
Content-Type: text/plain

Make sure openvswitch has all the runtime dependencies defined.
Without e.g. sed, an installer may calculate dependencies and order
packages based on the deps, which may install openvswitch before sed.
This would result in an install failure, when the post install step
calls ovs-pki, which uses sed.

Signed-off-by: Paul Barrette <paul.barrette@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_1.10.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
index 9cdd839..02c8ab3 100644
--- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
+++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
@@ -14,7 +14,11 @@ RDEPENDS_${PN}-pki = "${PN}"
 RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
 RRECOMMENDS_${PN} += "kernel-module-openvswitch"
 
-PR = "r2"
+# Some installers will fail because of an install order based on
+# rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
+# queued for install later.
+RDEPENDS_${PN} += "sed gawk grep"
+PR = "r3"
 
 SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://openvswitch-switch \
-- 
1.8.1.4


