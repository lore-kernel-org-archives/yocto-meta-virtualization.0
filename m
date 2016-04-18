Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A1BEE00E0F; Sun, 17 Apr 2016 23:46:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DF27E0077F
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Apr 2016 23:46:20 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3I6kJaY011909
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Apr 2016 23:46:19 -0700 (PDT)
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Apr 2016 23:46:18 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 18 Apr 2016 14:45:53 +0800
Message-ID: <1460961953-22532-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] openvswitch: ptest: Fix python path
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
X-List-Received-Date: Mon, 18 Apr 2016 06:46:27 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

For now PYTHON just happens to be the same as TARGET_PYTHON so we get the right
python binary. This patch sets PYTHON to TARGET_PYTHON since ptest is going to
be run on target.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 tests/atlocal.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/atlocal.in b/tests/atlocal.in
index 5815c6c..db2d2c9 100644
--- a/tests/atlocal.in
+++ b/tests/atlocal.in
@@ -5,7 +5,7 @@ EGREP='@EGREP@'
 PERL='@PERL@'
 
 if test x"$PYTHON" = x; then
-    PYTHON='@PYTHON@'
+    PYTHON='@TARGET_PYTHON@'
 fi
 
 PYTHONPATH=$abs_top_srcdir/python:$abs_top_builddir/tests:$PYTHONPATH
-- 
1.9.1


