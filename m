Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4775.1574854005519799578
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Nov 2019 03:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15EFCE00EF7; Wed, 27 Nov 2019 03:26:45 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62902E00D00
	for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 03:26:44 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,249,1571673600"; 
   d="scan'208";a="79157201"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2019 19:26:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id CC2B34B6EC86
	for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 19:18:15 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 27 Nov 2019 19:26:38 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: zheng ruoqin <zhengrq.fnst@cn.fujitsu.com>
Subject: [meta-virtualization][zeus][PATCH] python-neutronclient: Fix do_package_qa error
Date: Wed, 27 Nov 2019 19:26:30 +0800
Message-ID: <1574853990-66534-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: CC2B34B6EC86.A88A3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Fix the error as follows:

error: python-neutronclient-6.5.0+gitautoinc+e145c4ef8a-r0 do_package_qa: qa issue: /usr/lib/python2.7/site-packages/neutronclient/tests/functional/hooks/post_test_hook.sh contained in package python-neutronclient requires /bin/bash, but no providers found in rdepends_python-neutronclient? [file-rdeps]
error: python-neutronclient-6.5.0+gitautoinc+e145c4ef8a-r0 do_package_qa: qa run found fatal errors. please consider fixing them.

signed-off-by: zheng ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-neutronclient_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
index 204f19b..9fac59d 100644
--- a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
@@ -31,6 +31,7 @@ RDEPENDS_${PN} += " \
         python-simplejson \
         python-six \
         python-babel \
+        bash \
         "
 
 SRC_URI = "git://github.com/openstack/python-neutronclient.git;branch=stable/pike \
-- 
2.7.4



