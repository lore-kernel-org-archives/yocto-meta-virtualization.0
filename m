Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74734E00D17; Fri, 15 Dec 2017 14:12:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 576C0E00B48
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Dec 2017 14:12:29 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBFMCT7b026124
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Dec 2017 14:12:29 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 15 Dec 2017 14:12:28 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 15 Dec 2017 17:12:24 -0500
Message-ID: <1513375944-10887-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] libibverbs: don't do battle when meta-dpdk is in play
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
X-List-Received-Date: Fri, 15 Dec 2017 22:12:31 -0000
Content-Type: text/plain

The meta-dpdk layer has its own special version of libibverbs which
will conflict with our version:

  Error: Transaction check error:
  file /usr/lib64/libibverbs.so.1.0.0 conflicts between attempted installs of \
  libibverbs1-1.1.7-r0.corei7_64 and dpdk-dev-libibverbs-1.2.1+3.4+2.0.0.0-r0.corei7_64

Ensure only our version or the meta-dpdk version is in use. With
current layer priorities and such this should result in the meta-dpdk
version being used, which is fine since if DPDK is desired we are best
using the version recommended by meta-dpdk. Users can use
PREFERRED_VERSION or other tools to override the default behavior.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libibverbs/libibverbs_1.1.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
index e75f90d..9fc0d6e 100644
--- a/recipes-extended/libibverbs/libibverbs_1.1.7.bb
+++ b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
@@ -25,3 +25,5 @@ do_install_append() {
         mkdir -p ${D}${sysconfdir}/libibverbs.d
         rm -f ${D}${libdir}/libibverbs.la
 }
+
+RCONFLICTS_${PN} = "dpdk-dev-libibverbs"
-- 
2.7.4


