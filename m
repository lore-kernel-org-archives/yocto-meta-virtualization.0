Return-Path: <Yunguo.Wei@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2062E009D7; Wed, 21 Mar 2018 20:27:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A67E2E00708
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Mar 2018 20:27:20 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2M3RJqI014937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Mar 2018 20:27:19 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 21 Mar 2018 20:27:18 -0700
From: Yunguo Wei <yunguo.wei@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 21 Mar 2018 23:27:18 -0400
Message-ID: <20180322032718.353177-1-yunguo.wei@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] go-fsnotify: switch to new repository on github
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
X-List-Received-Date: Thu, 22 Mar 2018 03:27:21 -0000
Content-Type: text/plain

fsnotify is changed to new repository on gihub, so adapt this chanage
accordingly to avoid fetch failure.

Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
---
 recipes-devtools/go/go-fsnotify_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
index e5bcf14..1d9fbdc 100644
--- a/recipes-devtools/go/go-fsnotify_git.bb
+++ b/recipes-devtools/go/go-fsnotify_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c38914c9a7ab03bb2b96d4baaee10769"
 
 SRCNAME = "fsnotify"
 
-PKG_NAME = "github.com/go-fsnotify/${SRCNAME}"
+PKG_NAME = "github.com/fsnotify/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
 SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
-- 
2.11.0


