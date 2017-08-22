Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE1D1E00C8B; Tue, 22 Aug 2017 10:00:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BC40E00B8E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 10:00:51 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7MH0pVe022601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 10:00:51 -0700
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 10:00:50 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 22 Aug 2017 13:00:41 -0400
Message-ID: <1503421241-20958-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] cyrus-sasl: drop bbappend
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
X-List-Received-Date: Tue, 22 Aug 2017 17:00:53 -0000
Content-Type: text/plain

The change implemented in the bbappend is now part of the main recipe
file. See commit a97ab8e018d86461a4701625dc16b09370fad21f [cyrus-sasl:
inherit autotools-brokensep] in meta-openembedded.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-support/cyrus-sasl/cyrus-sasl_2.1.26.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-openstack/recipes-support/cyrus-sasl/cyrus-sasl_2.1.26.bbappend

diff --git a/meta-openstack/recipes-support/cyrus-sasl/cyrus-sasl_2.1.26.bbappend b/meta-openstack/recipes-support/cyrus-sasl/cyrus-sasl_2.1.26.bbappend
deleted file mode 100644
index 7447c56..0000000
--- a/meta-openstack/recipes-support/cyrus-sasl/cyrus-sasl_2.1.26.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-inherit autotools-brokensep
-- 
2.7.4


