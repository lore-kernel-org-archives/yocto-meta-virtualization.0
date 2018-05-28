Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AA53E00BAF; Mon, 28 May 2018 11:22:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 114E2E007CE
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 11:22:07 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4SILfSw016479
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 11:21:57 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 28 May 2018 11:21:31 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 28 May 2018 14:21:27 -0400
Message-ID: <1527531687-1057-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] irqbalance: uprev to v1.4.0
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
X-List-Received-Date: Mon, 28 May 2018 18:22:09 -0000
Content-Type: text/plain

This is a minor bugfix release that was just release by the upstream
project about 2 weeks ago.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../irqbalance/{irqbalance_1.3.0.bb => irqbalance_1.4.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-extended/irqbalance/{irqbalance_1.3.0.bb => irqbalance_1.4.0.bb} (74%)

diff --git a/recipes-extended/irqbalance/irqbalance_1.3.0.bb b/recipes-extended/irqbalance/irqbalance_1.4.0.bb
similarity index 74%
rename from recipes-extended/irqbalance/irqbalance_1.3.0.bb
rename to recipes-extended/irqbalance/irqbalance_1.4.0.bb
index 5581a8b..1aee7ca 100644
--- a/recipes-extended/irqbalance/irqbalance_1.3.0.bb
+++ b/recipes-extended/irqbalance/irqbalance_1.4.0.bb
@@ -4,8 +4,8 @@
 
 require irqbalance.inc
 
-SRC_URI[md5sum] = "53ee393adcfbc8e5ab23cbbd920df687"
-SRC_URI[sha256sum] = "41c2c0842d8fb24240d8069b389cd8d1669625a40009a17ad886967845dc6e43"
+SRC_URI[md5sum] = "26ee6db57c4509737e541e98773a39f5"
+SRC_URI[sha256sum] = "62de71510a2496fcf027efb0b288dd48e53e9efc931fa573c95580cad6264d07"
 
 SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/v${PV}.tar.gz;downloadfilename=irqbalance-${PV}.tar.gz \
            file://add-initscript.patch \
-- 
2.7.4


