Return-Path: <joe.slater@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66B85E00CB6; Tue,  8 Sep 2015 17:30:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9BF0E00B0B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Sep 2015 17:30:39 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t890UcZ0018967
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 8 Sep 2015 17:30:38 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 17:30:37 -0700
From: Joe Slater <jslater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Sep 2015 17:30:37 -0700
Message-ID: <1441758637-25576-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Cc: joe.slater@windriver.com
Subject: [PATCH 1/1] spice: add SRCREV_FORMAT to recipe
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
X-List-Received-Date: Wed, 09 Sep 2015 00:30:42 -0000
Content-Type: text/plain

Create a composite source revision.  Failure to do so
can cause parsing errors.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 recipes-support/spice/spice_git.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/spice_git.bb
index 8340787..95f7156 100644
--- a/recipes-support/spice/spice_git.bb
+++ b/recipes-support/spice/spice_git.bb
@@ -24,6 +24,8 @@ SRCREV_spice = "b270fb010a3ddb432dfe6b15e4bdffa6ac086cd0"
 SRCREV_spice-common = "fe93908238196bd632287fc9875e6f2e11105d04"
 SRCREV_spice-protocol = "784407f248e7f99d2bfcc9368f9acd1efb2b9617"
 
+SRCREV_FORMAT = "spice_spice-common_spice-protocol"
+
 SRC_URI = "git://anongit.freedesktop.org/spice/spice;name=spice \
            git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common \
            git://anongit.freedesktop.org/spice/spice-protocol;destsuffix=git/spice-common/spice-protocol;name=spice-protocol \
-- 
1.7.9.5


