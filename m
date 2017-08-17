Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58307E00D25; Wed, 16 Aug 2017 22:49:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 64 seconds by postgrey-1.32 at yocto-www;
	Wed, 16 Aug 2017 22:49:52 PDT
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FA9BE00A9B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Aug 2017 22:49:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.41,386,1498492800"; d="scan'208";a="23863516"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Aug 2017 13:48:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B4F29472438E
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Aug 2017 13:48:37 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 17 Aug 2017 13:48:37 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 17 Aug 2017 13:48:23 +0800
Message-ID: <1502948903-3992-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: B4F29472438E.A57DA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH] nss-pam-ldapd: upgrade to 0.9.8
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
X-List-Received-Date: Thu, 17 Aug 2017 05:49:54 -0000
Content-Type: text/plain

Upgrade nss-pam-ldapd from 0.9.7 to 0.9.8.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../nss-pam-ldapd/{nss-pam-ldapd_0.9.7.bb => nss-pam-ldapd_0.9.8.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-support/nss-pam-ldapd/{nss-pam-ldapd_0.9.7.bb => nss-pam-ldapd_0.9.8.bb} (91%)

diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.7.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
similarity index 91%
rename from recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.7.bb
rename to recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
index fd73b9c..a309c1e 100644
--- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.7.bb
+++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
@@ -22,8 +22,8 @@ SRC_URI = "\
 
 inherit autotools
 
-SRC_URI[md5sum] = "912f2a5ead193d2defc6c525423e84e8"
-SRC_URI[sha256sum] = "0db88d6518bf7ffb01b44f8f8841ece5162906982ce2c9e45e6afff90d3783eb"
+SRC_URI[md5sum] = "8c99fdc54f4bf9aca8c5f53fdb1403ff"
+SRC_URI[sha256sum] = "ef7362e7f2003da8c7beb7bcc03c30494acf712625aaac8badc6e7eb16f3453f"
 
 DEPENDS += "libpam openldap"
 
-- 
2.7.4




