Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.11572.1593401888512823157
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 28 Jun 2020 20:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,293,1589212800"; 
   d="scan'208";a="95462007"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jun 2020 11:38:06 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 2E2754CE49C7
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Jun 2020 11:27:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Jun 2020 11:38:04 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-trollius: Change python to python3
Date: Mon, 29 Jun 2020 11:37:50 +0800
Message-ID: <1593401871-17345-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593401871-17345-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593401871-17345-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 2E2754CE49C7.A2924
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

upgrade 2.0 -> 3.4.3

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python-trollius_git.bb => python3-trollius_git.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-trollius_git.bb => python3-trollius_git.bb} (81%)

diff --git a/meta-openstack/recipes-devtools/python/python-trollius_git.bb b/meta-openstack/recipes-devtools/python/python3-trollius_git.bb
similarity index 81%
rename from meta-openstack/recipes-devtools/python/python-trollius_git.bb
rename to meta-openstack/recipes-devtools/python/python3-trollius_git.bb
index 3e15f5f..acba23e 100644
--- a/meta-openstack/recipes-devtools/python/python-trollius_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-trollius_git.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f7bb094c7232b058c7e9f2e431f389c"
 
-PV = "2.0+git${SRCPV}"
-SRCREV = "5e9854d7b7bed6eb6e182808379342355e2bfca4"
+PV = "3.4.3+git${SRCPV}"
+SRCREV = "7b2d8abfce1d7ef18ef516f9b1b7032172630375"
 
 SRCNAME = "trollius"
 SRC_URI = "git://github.com/haypo/${SRCNAME}.git;branch=trollius"
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 inherit setuptools3
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 RDEPENDS_${PN} += " \
-- 
2.17.1



