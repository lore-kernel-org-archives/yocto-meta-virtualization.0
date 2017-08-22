Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C444E00BBF; Tue, 22 Aug 2017 08:50:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 735F0E00A39
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 08:50:09 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7MFo3Qh020672
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 08:50:08 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 08:50:02 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 22 Aug 2017 08:50:02 -0700
Message-ID: <20170822155002.57793-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] go-systemd: Fix QA dependency problem
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
X-List-Received-Date: Tue, 22 Aug 2017 15:50:10 -0000
Content-Type: text/plain

ERROR: go-systemd-4+gitb4a58d95188dd092ae20072bac14cece0e67c388-r0
do_package_qa: QA Issue:
/usr/local/go/src/github.com/coreos/go-systemd/test contained in
package go-systemd requires /bin/bash, but no providers found in
RDEPENDS_go-systemd? [file-rdeps]

Resolved with proper dependency to bash.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 recipes-devtools/go/go-systemd_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/go-systemd_git.bb
index 5cbab92..b61c97a 100644
--- a/recipes-devtools/go/go-systemd_git.bb
+++ b/recipes-devtools/go/go-systemd_git.bb
@@ -12,9 +12,7 @@ SRC_URI = "git://${PKG_NAME}.git"
 SRCREV = "b4a58d95188dd092ae20072bac14cece0e67c388"
 PV = "4+git${SRCREV}"
 
-DEPENDS += " \
-    bash \
-"
+RDEPENDS_${PN} += "bash"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


