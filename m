Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D6D9E00D74; Fri,  9 Aug 2019 00:25:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A858DE00CD7
	for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Aug 2019 00:25:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,364,1559491200"; d="scan'208";a="73292161"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Aug 2019 15:24:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E5D534CE0301
	for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Aug 2019 15:24:58 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 9 Aug 2019 15:24:59 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 9 Aug 2019 15:24:16 +0800
Message-ID: <20190809072416.30288-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: E5D534CE0301.A8AED
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] criu: upgrade 3.11 -> 3.12
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
X-List-Received-Date: Fri, 09 Aug 2019 07:25:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Refresh patch: 0001-criu-Fix-toolchain-hardcode.patch

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 recipes-containers/criu/criu_git.bb                          |  4 ++--
 .../criu/files/0001-criu-Fix-toolchain-hardcode.patch        | 12 +++++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 6fb60db..c1ddb49 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -13,8 +13,8 @@ EXCLUDE_FROM_WORLD = "1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=412de458544c1cb6a2b512cd399286e2"
 
-SRCREV = "c74b83cd49c00589c0c0468ba5fe685b67fdbd0a"
-PV = "3.11+git${SRCPV}"
+SRCREV = "437561d2bbc09d734ae276dbfca337569f454d54"
+PV = "3.12+git${SRCPV}"
 
 SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
            file://0001-criu-Fix-toolchain-hardcode.patch \
diff --git a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
index 838cbdc..bd7a6c5 100644
--- a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
+++ b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
@@ -46,17 +46,20 @@ diff --git a/scripts/nmk/scripts/tools.mk b/scripts/nmk/scripts/tools.mk
 index 56dba84..1698821 100644
 --- a/scripts/nmk/scripts/tools.mk
 +++ b/scripts/nmk/scripts/tools.mk
-@@ -2,31 +2,31 @@ ifndef ____nmk_defined__tools
+@@ -2,35 +2,35 @@ ifndef ____nmk_defined__tools
  
  #
  # System tools shorthands
 -RM		:= rm -f
 +RM		?= rm -f
  HOSTLD		?= ld
--LD		:= $(CROSS_COMPILE)$(HOSTLD)
-+LD		?= $(CROSS_COMPILE)$(HOSTLD)
+ ifeq ($(origin LD), default)
+ LD		:= $(CROSS_COMPILE)$(HOSTLD)
+ endif
  HOSTCC		?= gcc
--CC		:= $(CROSS_COMPILE)$(HOSTCC)
+ ifeq ($(origin CC), default)
+ CC		:= $(CROSS_COMPILE)$(HOSTCC)
+ endif
 -CPP		:= $(CC) -E
 -AS		:= $(CROSS_COMPILE)as
 -AR		:= $(CROSS_COMPILE)ar
@@ -69,7 +72,6 @@ index 56dba84..1698821 100644
 -AWK		:= awk
 -PERL		:= perl
 -FULL_PYTHON	:= $(shell which python2 2>/dev/null || which python3 2>/dev/null)
-+CC		?= $(CROSS_COMPILE)$(HOSTCC)
 +CPP		?= $(CC) -E
 +AS		?= $(CROSS_COMPILE)as
 +AR		?= $(CROSS_COMPILE)ar
-- 
2.7.4




