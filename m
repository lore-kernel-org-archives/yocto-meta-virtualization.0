Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4788.1574854083234417083
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Nov 2019 03:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 136CDE00ECC; Wed, 27 Nov 2019 03:28:03 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C7ACE0085D
	for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 03:28:02 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,249,1571673600"; 
   d="scan'208";a="79157224"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2019 19:28:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 954B04CE1BF0
	for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 19:19:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 27 Nov 2019 19:28:01 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH] python-heatclient: Fix do_package_qa error
Date: Wed, 27 Nov 2019 19:27:57 +0800
Message-ID: <1574854077-66655-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 954B04CE1BF0.A869F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Fix the error as follows:

ERROR: python-heatclient-1.17.0+gitAUTOINC+8af5deb458-r0 do_package_qa: QA Issue: /usr/lib/python2.7/site-packages/heatclient/tests/functional/hooks/post_test_hook.sh contained in package python-heatclient requires /bin/bash, but no providers found in RDEPENDS_python-heatclient? [file-rdeps]
ERROR: python-heatclient-1.17.0+gitAUTOINC+8af5deb458-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
index 4cc60ae..3804f79 100644
--- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
@@ -21,6 +21,7 @@ RDEPENDS_${PN} +="python-cliff \
 	python-pyparsing \
 	python-simplejson \
 	python-pbr \
+	bash \
 	"
 
 PR = "r0"
-- 
2.7.4



