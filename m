Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC4ACE00826; Mon,  8 Oct 2018 02:05:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3467AE006F1
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Oct 2018 02:05:19 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9895IPv014172
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 8 Oct 2018 02:05:18 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 8 Oct 2018 02:05:17 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 8 Oct 2018 17:16:37 +0800
Message-ID: <1538990197-21917-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ceph: only support x86-64
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
X-List-Received-Date: Mon, 08 Oct 2018 09:05:19 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 recipes-extended/ceph/ceph_13.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-extended/ceph/ceph_13.2.1.bb
index d7186b9..765da82 100644
--- a/recipes-extended/ceph/ceph_13.2.1.bb
+++ b/recipes-extended/ceph/ceph_13.2.1.bb
@@ -60,3 +60,4 @@ FILES_${PN}-dev += "\
 RDEPENDS_${PN} += "\
 		python \
 "
+COMPATIBLE_MACHINE_x86-64 = "(.*)"
-- 
2.7.4


