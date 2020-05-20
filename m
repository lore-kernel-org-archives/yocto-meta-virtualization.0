Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.8691.1589962737851065629
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 May 2020 01:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04K8Itwn012767
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 20 May 2020 01:18:55 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Wed, 20 May 2020 01:18:54 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <bruce.ashfield@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 1/1] notary: Define SRCREV_FORMAT to make it work with archiver.bbclass
Date: Wed, 20 May 2020 16:27:37 +0800
Message-ID: <20200520082737.76973-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Fixed:
INHERIT += "archiver"
$ bitbake notary -car_original

bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher failure: The SRCREV_FORMAT variable must be set when multiple SCMs are used.
The SCMs are:
git://github.com/docker/notary.git;destsuffix=git/src/github.com/docker/notary
git://github.com/docker/notary.git

Another solution is define SRCREV_FORMAT in archiver.bbclass, but that doesn't
work since it is too late to define it there.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 recipes-devtools/go/notary_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-devtools/go/notary_git.bb b/recipes-devtools/go/notary_git.bb
index 9cfb46e..76dfa8f 100644
--- a/recipes-devtools/go/notary_git.bb
+++ b/recipes-devtools/go/notary_git.bb
@@ -9,6 +9,11 @@ SRCNAME = "notary"
 PKG_NAME = "github.com/docker/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
 
+# The archiver.bbclass will append a uri to SRC_URI when it contains
+# destsuffix, then the SRC_URI would contain multilib SCMs, and bitbake's
+# fetcher requires a SRCREV_FORMAT for multiple SCMs.
+SRCREV_FORMAT = "${SRCNAME}"
+
 SRCREV = "d6e1431feb32348e0650bf7551ac5cffd01d857b"
 PV = "0.6.1+git${SRCPV}"
 
-- 
2.17.1

