Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2550E00E16; Mon, 25 Dec 2017 17:23:21 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CE32E00DA5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Dec 2017 17:23:14 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBQ1NEom009682
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Dec 2017 17:23:14 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 25 Dec 2017 17:22:56 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 26 Dec 2017 09:20:48 +0800
Message-ID: <20171226012050.23647-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 1/3] libibverbs: provide virtual/libibverbs
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
X-List-Received-Date: Tue, 26 Dec 2017 01:23:21 -0000
Content-Type: text/plain

dpdk-dev-libibverbs recipe provides the same library as what libibverbs
provides. To avoid building these two recipes at the same time at one
single build, we use the technique of 'virtual/libibverbs'.

Make libibverbs provide 'virtual/libibverbs' so that other recipes could
use 'virtual/libibverbs' as their dependencies. In this way, potential
conflicts are avoided.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/libibverbs/libibverbs_1.1.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
index 9fc0d6e..b3cd73f 100644
--- a/recipes-extended/libibverbs/libibverbs_1.1.7.bb
+++ b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
@@ -26,4 +26,5 @@ do_install_append() {
         rm -f ${D}${libdir}/libibverbs.la
 }
 
-RCONFLICTS_${PN} = "dpdk-dev-libibverbs"
+PROVIDES = "virtual/libibverbs"
+RPROVIDES_${PN} = "virtual/libibverbs"
-- 
2.11.0


