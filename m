Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4193E00B1A; Thu, 30 Jul 2015 20:43:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6018BE00B34
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 Jul 2015 20:43:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99105142"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:47:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3fq04017979
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 11:41:52 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:43:43 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 31 Jul 2015 11:43:34 +0800
Message-ID: <1438314217-3788-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 1/3] nss-pam-ldapd: upgrade 0.9.4 -> 0.9.6
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
X-List-Received-Date: Fri, 31 Jul 2015 03:43:56 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../nss-pam-ldapd/{nss-pam-ldapd_0.9.4.bb => nss-pam-ldapd_0.9.6.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-support/nss-pam-ldapd/{nss-pam-ldapd_0.9.4.bb => nss-pam-ldapd_0.9.6.bb} (90%)

diff --git a/meta-openstack/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.4.bb b/meta-openstack/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.6.bb
similarity index 90%
rename from meta-openstack/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.4.bb
rename to meta-openstack/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.6.bb
index 65ed66f..9f822f3 100644
--- a/meta-openstack/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.4.bb
+++ b/meta-openstack/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.6.bb
@@ -21,9 +21,8 @@ SRC_URI = "\
 
 inherit autotools
 
-
-SRC_URI[md5sum] = "0d74202700efdde3b6e551bfff49c132"
-SRC_URI[sha256sum] = "fd2e3e0935acfd3d2b13682962f51d28d5855472e690d787e36a476fa40c88e6"
+SRC_URI[md5sum] = "fa5ec49cb54428d6c73e244a11021695"
+SRC_URI[sha256sum] = "101d5a7fa10549cc77be48d07f2b8141f59182f10f2cc0fea93efd13c3a5a6f2"
 
 DEPENDS += "libpam openldap"
 
-- 
1.8.4.2


