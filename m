Return-Path: <Daniel.Badea@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91DF5E009EA; Tue,  9 Jun 2015 03:42:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4B03E00960
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jun 2015 03:42:04 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t59Ag3Ji019920
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Jun 2015 03:42:03 -0700 (PDT)
Received: from daniel (128.224.20.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 03:42:03 -0700
From: Daniel Badea <daniel.badea@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 9 Jun 2015 13:42:01 +0300
Message-ID: <001701d0a2a0$ec4b2880$c4e17980$@windriver.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdCioOpKnKth47YARrCh2PPUdgXczg==
Subject: [PATCH] tgt: update version to 1.0.37
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
X-List-Received-Date: Tue, 09 Jun 2015 10:42:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Signed-off-by: Daniel Badea <daniel.badea@windriver.com>
---
 meta-openstack/recipes-support/tgt/tgt_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb
b/meta-openstack/recipes-support/tgt/tgt_git.bb
index 7796418..fe34858 100644
--- a/meta-openstack/recipes-support/tgt/tgt_git.bb
+++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM =
"file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791
b6e29b4c"
 DEPENDS = "sg3-utils"

-SRCREV = "0ee382bab57a8ecd9ece18d511bd098298478409"
-PV = "1.0.36+git${SRCPV}"
+SRCREV = "3f779c0338fa7a97d5d0defbdb3ad06167b791d3"
+PV = "1.0.37+git${SRCPV}"
 PR = "r0"

 SRC_URI = "git://github.com/fujita/tgt.git \
--
2.1.0



