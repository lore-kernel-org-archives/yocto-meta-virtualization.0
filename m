Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.4714.1574853805749067971
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Nov 2019 03:23:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C751E00ECC; Wed, 27 Nov 2019 03:23:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SUBJ_OBFU_PUNCT_FEW autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 SUBJ_OBFU_PUNCT_FEW Possible punctuation-obfuscated Subject: header
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03F6BE00BA3
	for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 03:23:24 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,249,1571673600"; 
   d="scan'208";a="79157135"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2019 19:23:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9B6304CE1BEC
	for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 19:14:56 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 27 Nov 2019 19:23:19 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Subject: [meta-virtualization][zeus][PATCH] python-ceilometerclient: Fix do_package_qa error
Date: Wed, 27 Nov 2019 19:23:16 +0800
Message-ID: <1574853796-66469-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9B6304CE1BEC.A865A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Fix the error as follows:

ERROR: python-ceilometerclient-2.9.1-r0 do_package_qa: QA Issue: /usr/lib/python2.7/site-packages/ceilometerclient/tests/functional/hooks/post_test_hook.sh contained in package python-ceilometerclient requires /bin/bash, but no providers found in RDEPENDS_python-ceilometerclient? [file-rdeps]
ERROR: python-ceilometerclient-2.9.1-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
index 77c9c49..268e6a7 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
@@ -25,6 +25,7 @@ RDEPENDS_${PN} += " \
         python-requests \
         python-six \
         python-stevedore \
+        bash \
         "
 
 SRC_URI = "\
-- 
2.7.4



