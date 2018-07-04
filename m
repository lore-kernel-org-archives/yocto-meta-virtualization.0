Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8039AE00E0E; Tue,  3 Jul 2018 21:47:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E797EE00A39
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Jul 2018 21:47:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41817633"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jul 2018 12:47:19 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 6E0354B4448E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Jul 2018 12:47:17 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Wed, 4 Jul 2018 12:47:23 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Jul 2018 20:36:34 +0800
Message-ID: <1530707794-106222-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 6E0354B4448E.A6086
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] [PATCH] criu: upgrade to 3.9
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
X-List-Received-Date: Wed, 04 Jul 2018 04:47:23 -0000
Content-Type: text/plain

Upgrade criu from 3.4 to 3.9.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 recipes-containers/criu/{criu_git.bb => criu_3.9.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename recipes-containers/criu/{criu_git.bb => criu_3.9.bb} (94%)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_3.9.bb
similarity index 94%
rename from recipes-containers/criu/criu_git.bb
rename to recipes-containers/criu/criu_3.9.bb
index 7d62f35..36c356d 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_3.9.bb
@@ -13,15 +13,14 @@ EXCLUDE_FROM_WORLD = "1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=412de458544c1cb6a2b512cd399286e2"
 
-SRCREV = "a31c1854e10580a09621e539c3ec052b875a8e06"
-PV = "3.4+git${SRCPV}"
+SRCREV = "202b7745bd0c37a1732ebe2fb009a157d338bf95"
+PV = "3.9+git${SRCPV}"
 
 SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
            file://0001-criu-Fix-toolchain-hardcode.patch \
            file://0002-criu-Skip-documentation-install.patch \
            file://0001-criu-Change-libraries-install-directory.patch \
            file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
-           file://fix-building-on-newest-glibc-and-kernel.patch \
           "
 
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
@@ -46,9 +45,11 @@ EXTRA_OEMAKE_append += "LOGROTATEDIR=${sysconfdir} SYSTEMDUNITDIR=${systemd_unit
 CFLAGS += "-D__USE_GNU -D_GNU_SOURCE " 
 
 CFLAGS += " -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3"
+CFLAGS_arm += "-D__WORDSIZE"
 
 # overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"
 export LDFLAGS=""
+export C_INCLUDE_PATH="${STAGING_INCDIR}/libnl3"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.7.4




