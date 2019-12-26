Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.18286.1577336262068988316
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Dec 2019 20:57:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: windriver.com, ip: 140.211.169.56, mailfrom: kai.kang@windriver.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A702E012AD; Wed, 25 Dec 2019 20:57:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53E03E0085D
	for <meta-virtualization@yoctoproject.org>; Wed, 25 Dec 2019 20:57:40 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBQ4vdvZ022693
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Wed, 25 Dec 2019 20:57:39 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.468.0; Wed, 25 Dec 2019 20:57:38 -0800
From: "kai" <kai.kang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [PATCH] nagios-nrpe: fix compile error when packageconfig ssl enabled
Date: Thu, 26 Dec 2019 12:57:36 +0800
Message-ID: <20191226045736.28952-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to compile nagios-nrpe when packageconfig ssl enabled:

| ./nrpe.c:45:12: fatal error: ../include/dh.h: No such file or directory
|    45 | #  include "../include/dh.h"
|       |            ^~~~~~~~~~~~~~~~~
| compilation terminated.

Header file include/dh.h is created by native openssl called by
configure script. If no native openssl exists, no header file is
created. Add openssl-native to dependency for packageconfig ssl.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-extended/nagios/nagios-nrpe_3.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
index 04917f7..9e1f02c 100644
--- a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
+++ b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
@@ -39,7 +39,7 @@ EXTRA_OECONF_SSL = "--with-ssl=${STAGING_DIR_HOST} \
                     --with-ssl-lib=${STAGING_DIR_HOST}${libdir} \
 "
 
-PACKAGECONFIG[ssl] = "${EXTRA_OECONF_SSL},--disable-ssl,openssl,"
+PACKAGECONFIG[ssl] = "${EXTRA_OECONF_SSL},--disable-ssl,openssl-native openssl,"
 PACKAGECONFIG[cmdargs] = "--enable-command-args,--disable-command-args,,"
 PACKAGECONFIG[bashcomp] = "--enable-bash-command-substitution,--disable-bash-command-substitution,,"
 
-- 
2.17.1

