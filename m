Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 061C7E009BF; Tue, 13 Sep 2016 22:27:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FF87E009B8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Sep 2016 22:27:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10963261"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2016 13:27:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C9A824623461
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Sep 2016 13:27:12 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 14 Sep 2016 13:27:11 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 14 Sep 2016 01:27:05 -0400
Message-ID: <1473830825-3279-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: C9A824623461.A4465
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
Subject: [PATCH] nss-pam-ldapd: 0.9.6 -> 0.9.7
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
X-List-Received-Date: Wed, 14 Sep 2016 05:27:19 -0000
Content-Type: text/plain

Upgrade nss-pam-ldapd from 0.9.6 to 0.9.7.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../nss-pam-ldapd/{nss-pam-ldapd_0.9.6.bb => nss-pam-ldapd_0.9.7.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-support/nss-pam-ldapd/{nss-pam-ldapd_0.9.6.bb => nss-pam-ldapd_0.9.7.bb} (91%)

diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.6.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.7.bb
similarity index 91%
rename from recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.6.bb
rename to recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.7.bb
index c6601fc..fd73b9c 100644
--- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.6.bb
+++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.7.bb
@@ -22,8 +22,8 @@ SRC_URI = "\
 
 inherit autotools
 
-SRC_URI[md5sum] = "fa5ec49cb54428d6c73e244a11021695"
-SRC_URI[sha256sum] = "101d5a7fa10549cc77be48d07f2b8141f59182f10f2cc0fea93efd13c3a5a6f2"
+SRC_URI[md5sum] = "912f2a5ead193d2defc6c525423e84e8"
+SRC_URI[sha256sum] = "0db88d6518bf7ffb01b44f8f8841ece5162906982ce2c9e45e6afff90d3783eb"
 
 DEPENDS += "libpam openldap"
 
-- 
2.7.4




