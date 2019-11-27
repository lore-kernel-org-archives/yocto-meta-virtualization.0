Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.4805.1574854145643502467
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Nov 2019 03:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7DF00E00D00; Wed, 27 Nov 2019 03:29:05 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59F74E00BA2
	for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 03:29:03 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,249,1571673600"; 
   d="scan'208";a="79157253"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2019 19:29:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DC0A14B6EC86
	for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 19:20:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 27 Nov 2019 19:28:58 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Subject: [meta-virtualization][zeus][PATCH] python-cinderclient: Fix do_package_qa error
Date: Wed, 27 Nov 2019 19:28:55 +0800
Message-ID: <1574854135-66701-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DC0A14B6EC86.A912C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Fix the error as follows:

ERROR: python-cinderclient-3.1.0+gitAUTOINC+3640aeab6e-r0 do_package_qa: QA Issue: /usr/lib/python2.7/site-packages/cinderclient/tests/functional/hooks/post_test_hook.sh contained in package python-cinderclient requires /bin/bash, but no providers found in RDEPENDS_python-cinderclient? [file-rdeps]
ERROR: python-cinderclient-3.1.0+gitAUTOINC+3640aeab6e-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-cinderclient_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
index e425237..920858a 100644
--- a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
@@ -37,6 +37,7 @@ RDEPENDS_${PN} += " \
         python-six \
         python-oslo.i18n \
         python-oslo.utils \
+        bash \
         "
 	
 PACKAGECONFIG ?= "bash-completion"
-- 
2.7.4



