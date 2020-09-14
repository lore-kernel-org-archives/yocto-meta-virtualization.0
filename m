Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.69592.1600114225500199523
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Sep 2020 13:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: joe.slater@windriver.com)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 80A5638C084F
	for <meta-virtualization@yoctoproject.org>; Mon, 14 Sep 2020 13:10:24 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08EKA3Bt032331
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Mon, 14 Sep 2020 13:10:13 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 13:09:52 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [v2][meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two CVE's
Date: Mon, 14 Sep 2020 13:09:52 -0700
Message-ID: <20200914200952.78037-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Fix CVE-2020-15890 and CVE-2020-24372.

Also change PV format because the reference to 2.1.0-beta3
was already far behind the SRCREV.  Now, base PV on a tag
and date of SRCREV commit if it is later.  Sort order is
2.1.0~beta3 -> 2.1.0~beta-yymmdd -> 2.1.0 -> 2.1.0-yymmdd.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index cc9039416..6573efcd9 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -3,13 +3,15 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d739bb9250a55c124a545b588fd76771"
 HOMEPAGE = "http://luajit.org"
 
-PV = "2.1.0~beta3"
-SRCREV = "0ad60ccbc3768fa8e3e726858adf261950edbc22"
 SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
            file://clang.patch \
            "
 
+# Set PV to a version tag and date associated with SRCREV if it is later.
+PV = "2.1.0~beta3-200809"
+SRCREV = "94d4abcca966df2cc423e821bcacd04898f73117"
+
 S = "${WORKDIR}/git"
 
 inherit pkgconfig binconfig siteinfo
-- 
2.17.1

