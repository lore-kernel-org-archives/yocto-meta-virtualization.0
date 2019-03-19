Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 86BADE00D21; Tue, 19 Mar 2019 00:06:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AE1FE00D07
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Mar 2019 00:06:10 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2J75DdB010294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Mar 2019 00:05:43 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 19 Mar 2019 00:05:19 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 19 Mar 2019 00:05:19 -0700
Message-ID: <20190319070519.117520-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] notary: uprev to v0.6.1
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
X-List-Received-Date: Tue, 19 Mar 2019 07:06:11 -0000
Content-Type: text/plain

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 recipes-devtools/go/notary_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-devtools/go/notary_git.bb b/recipes-devtools/go/notary_git.bb
index d638dc1..9cfb46e 100644
--- a/recipes-devtools/go/notary_git.bb
+++ b/recipes-devtools/go/notary_git.bb
@@ -2,15 +2,15 @@ DESCRIPTION = "Notary is a Docker project that allows anyone to have trust over
 HOMEPAGE = "https://github.com/docker/notary"
 SECTION = "devel/go"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=771ddb425ba03c8fab49e5bd9854a4a2"
+LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=3596b980bb036e0875174ed15e4b982a"
 
 SRCNAME = "notary"
 
 PKG_NAME = "github.com/docker/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
 
-SRCREV = "c8aa8cf53cbcda2e92def0c9291e25d770493494"
-PV = "0.4.2+git${SRCPV}"
+SRCREV = "d6e1431feb32348e0650bf7551ac5cffd01d857b"
+PV = "0.6.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


