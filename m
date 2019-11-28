Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.5115.1574937771041454841
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 02:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FCFCE0108B; Thu, 28 Nov 2019 02:42:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED,SUBJ_OBFU_PUNCT_FEW autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
	*  0.7 SUBJ_OBFU_PUNCT_FEW Possible punctuation-obfuscated Subject: header
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF2A9E00E8D
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 02:42:49 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,253,1571673600"; 
   d="scan'208";a="79220060"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Nov 2019 18:42:48 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E0B1E4CE14FC
	for <meta-virtualization@yoctoproject.org>; Thu, 28 Nov 2019 18:34:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 28 Nov 2019 18:42:46 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Subject: [meta-virtualization][zeus][PATCH] layer.conf: Update PREFERRED_VERSION
Date: Fri, 29 Nov 2019 03:42:38 +0800
Message-ID: <1574970158-3207-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E0B1E4CE14FC.A9513
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Update PREFERRED_VERSION for following recipes:
  python-sqlalchemy
  python-eventlet
  python-warlock
  python-jsonschema

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-openstack/conf/layer.conf | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index b6f8dba..a61bf25 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -27,10 +27,10 @@ PREFERRED_VERSION_python-sqlalchemy = "1.0.8"
 PREFERRED_VERSION_python-pexpect = "3.3"
 PREFERRED_VERSION_python-django = "1.8.6"
 PREFERRED_VERSION_python-netaddr = "0.7.19"
-PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
-PREFERRED_VERSION_python-eventlet = "0.20.0"
-PREFERRED_VERSION_python-warlock = "1.2.0"
-PREFERRED_VERSION_python-jsonschema = "2.6.0"
+PREFERRED_VERSION_python-sqlalchemy = "1.1.17"
+PREFERRED_VERSION_python-eventlet = "0.25.1"
+PREFERRED_VERSION_python-warlock = "1.3.3"
+PREFERRED_VERSION_python-jsonschema = "3.0.2"
 PREFERRED_VERSION_python-networkx = "${@bb.utils.contains('DISTRO_FEATURES', 'openstack', '1.11', '', d)}"
 PREFERRED_VERSION_python-oslo.i18n = "3.17.0+gitAUTOINC+f2729cd36f"
 
-- 
2.7.4



