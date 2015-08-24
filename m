Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B43DBE00BE0; Mon, 24 Aug 2015 13:27:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42890E00BD2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Aug 2015 13:27:06 -0700 (PDT)
Received: by qkda128 with SMTP id a128so37071802qkd.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Aug 2015 13:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3dc/Oxrg+bqOFleo0eD8eNlGSppw4Ti1092EPCLMKdc=;
	b=F4BWRHvxN5szmvVwq0873C+6sBIo1jQLRPYwDvhwMxzss+0TJCblhGcJ9BDbTxuhB3
	h7gZF19ytfok8hC2J9WIwRH17uqa4CdQtsRjiOfovftzJUDq8dBgML7BW9e9Ekr0t0dy
	sJhUvZJOBZ3WuQ8n0haR7HQhhdgMAUo4FYXXUu0uoxSEXI6PE4niIN+BERuXftCAXGXy
	7wWE85v7bLeITkScwdhBrX+kaJgt66/oTkkDeJ/uuU6yOzDt+jFcd+xApMEUk+KzrdMw
	dkycTiY8fCea7LrJEfPOPAeR6L+DiFybBXbVg+Ayy2LeyoUlD/eDZsu1tvkvFWevd5+W
	g65Q==
X-Gm-Message-State: ALoCoQnefhGvgMQvw+083kudFRI8/61rGWvBBKoGntQKTF8qaOLGLpiFJrLAM+kTuBeF0Zqy4xzM
X-Received: by 10.13.230.130 with SMTP id p124mr4029026ywe.107.1440448026057; 
	Mon, 24 Aug 2015 13:27:06 -0700 (PDT)
Received: from doug-t430.lan ([67.63.141.2]) by smtp.gmail.com with ESMTPSA id
	p79sm18531307ywp.37.2015.08.24.13.27.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:27:05 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 24 Aug 2015 15:26:45 -0500
Message-Id: <1440448008-9189-1-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/4] xen: drop patch that upstream says is wrong
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
X-List-Received-Date: Mon, 24 Aug 2015 20:27:08 -0000

Per upstream its not correct to always force -mfpmath=387 to work around
the -mno-sse flags. Instead strip out -mfpmath=sse that Yocto injects
for certain BSPs.
---
 ...xen-x86-Fix-up-rules-when-forcing-mno-sse.patch | 28 ----------------------
 recipes-extended/xen/xen.inc                       |  5 ++++
 recipes-extended/xen/xen_4.5.0.bb                  |  1 -
 3 files changed, 5 insertions(+), 29 deletions(-)
 delete mode 100644 recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch

diff --git a/recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch b/recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch
deleted file mode 100644
index 4c3e297..0000000
--- a/recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From: Nathan Rossi <nathan.rossi@xilinx.com>
-Subject: [PATCH] xen/x86: Fix up rules when forcing -mno-sse
-
-* When forcing -mno-sse specify -mfpmath=387 to avoid the fallback
-  warning
-
-Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
-Upstream-Status: Not-Submitted
----
- xen/arch/x86/Rules.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xen/arch/x86/Rules.mk b/xen/arch/x86/Rules.mk
-index 6775cb5..03848f7 100644
---- a/xen/arch/x86/Rules.mk
-+++ b/xen/arch/x86/Rules.mk
-@@ -42,7 +42,7 @@ x86 := y
- x86_32 := n
- x86_64 := y
- 
--CFLAGS += -mno-red-zone -mno-sse -fpic
-+CFLAGS += -mno-red-zone -mno-sse -fpic -mfpmath=387
- CFLAGS += -fno-asynchronous-unwind-tables
- # -fvisibility=hidden reduces -fpic cost, if it's available
- ifneq ($(call cc-option,$(CC),-fvisibility=hidden,n),n)
--- 
-2.1.1
-
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 432bf4d..c7a2347 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -12,6 +12,11 @@ inherit autotools-brokensep gettext setuptools update-rc.d systemd
 
 require xen-arch.inc
 
+# Xen uses hardcodes the use of -mno-sse which conflicts -mfpmath=sse
+# The issue arises from certain Yocto machine BSPs injecting -mfpmath=sse
+# into the package's CFLAGS so we need to strip that
+TUNE_CCARGS := "${@oe_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
+
 PACKAGECONFIG ??= " \
     sdl \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/xen_4.5.0.bb
index 6c17b90..a5f03f3 100644
--- a/recipes-extended/xen/xen_4.5.0.bb
+++ b/recipes-extended/xen/xen_4.5.0.bb
@@ -2,7 +2,6 @@ require xen.inc
 
 SRC_URI = " \
     http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
-    file://xen-x86-Fix-up-rules-when-forcing-mno-sse.patch \
     "
 
 SRC_URI[md5sum] = "9bac43d2419d05a647064d9253bb03fa"
-- 
2.1.4


