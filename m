Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF6E9E007AD; Thu, 24 May 2018 22:19:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* 3.4 DATE_IN_PAST_96_XX Date: is 96 hours or more before Received:
	date * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14196E006F1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 22:19:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40356608"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 May 2018 13:19:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 780274B31495
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 May 2018 13:19:46 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Fri, 25 May 2018 13:19:47 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 15 May 2018 13:27:13 -0700
Message-ID: <1526416033-11819-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: 780274B31495.ABFE9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
Subject: [oe-virtualization][meta-cloud-services][PATCH] nss-pam-ldapd: fix SRC_URI and DEPENDS
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
X-List-Received-Date: Fri, 25 May 2018 05:19:53 -0000
Content-Type: text/plain

- Fix SRC_URI, modified ${PN} to ${BPN}
- Added krb5 into DEPENDS

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
index a309c1e..404aeca 100644
--- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
+++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
@@ -15,7 +15,7 @@ SECTION = "base"
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRC_URI = "\
-	http://arthurdejong.org/nss-pam-ldapd/${PN}-${PV}.tar.gz \
+	http://arthurdejong.org/nss-pam-ldapd/${BPN}-${PV}.tar.gz \
 	file://nslcd.init \
 	file://nslcd.service \
 	"
@@ -25,7 +25,7 @@ inherit autotools
 SRC_URI[md5sum] = "8c99fdc54f4bf9aca8c5f53fdb1403ff"
 SRC_URI[sha256sum] = "ef7362e7f2003da8c7beb7bcc03c30494acf712625aaac8badc6e7eb16f3453f"
 
-DEPENDS += "libpam openldap"
+DEPENDS += "libpam openldap krb5"
 
 EXTRA_OECONF = "\
 	--disable-pynslcd \
-- 
1.9.1




