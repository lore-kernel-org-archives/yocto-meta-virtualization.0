Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69EA5E00C19; Tue, 26 Jan 2016 11:10:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f195.google.com (mail-yk0-f195.google.com
	[209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F08BE00C1F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:54 -0800 (PST)
Received: by mail-yk0-f195.google.com with SMTP id v14so15389644ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XgUjTxGViHpYCrPg/zIfHlmUtdFxN6ipdtdlLRgihsA=;
	b=ljY3vJzrKSKgX/z6T8SFD7h5PZNrsJ2hoQZl4yiv+MkW9kxR6/oAv7C2aaIVrytjik
	Nn5pDm8HDPZAlihuIq/n0NKuumHV4sCdLOA0wXb37ShkTTd1FrzI9VY/VwUQcXGjd10Z
	/aHyzvWA+lrAQC1zh+E7lknM68LvIpvZ2nUEc+TvbMZXEmVQl6kjbLQqfnVD/J8Epeig
	rVkAduXU+2idOP5fpqaOVRC+g9bKnMQsWpJyhKAwNCR6sajQzPeejOtdYU5h0v5WlmeX
	uZ3RCnv2+tmRKTOHOda/CzxxyqzhEKAW1slzmf6CaBfvQW8JzrJ4AYQ7bsrW/3e2cXLD
	XejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XgUjTxGViHpYCrPg/zIfHlmUtdFxN6ipdtdlLRgihsA=;
	b=NTXc9TdfliCIZuu1n6BlbALzOavd6/vTVb7/dh+49fQzEqqqrRoOEtoWSzqz1cc4A9
	wmOupt2FVB8Et5laTRLEYAMlpUYLhstSgn2UP/58V5FdT8/hq4YFAD2vaNeM+YQ1wRCD
	rNpYYynb01fkvZmjB/FNUtSOm0T2XN/wmZZyNmcQoRVf+aaxaaZCuqhW0qjb208nG3ov
	tpcMGxSB5cVUwCE5pYcTh78y08MG2nDA5H+GH+VLpowX9ogmHEyPjtu6EluC/03y4WuN
	DCHuK0XhqTMpFf2bBPo+J0g5S41PXoaz4+z/IQsCLQzuiUrnggnra3jXPCur+/zVvETs
	16aA==
X-Gm-Message-State: AG10YOQQUWCAvJiwNBRAEPqceFfOrZFiWedEZHpwfmLstED2hzWQMm2bpmJnt0AtxpKaNA==
X-Received: by 10.37.99.4 with SMTP id x4mr13082382ybb.59.1453835394218;
	Tue, 26 Jan 2016 11:09:54 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	h187sm1899502ywc.0.2016.01.26.11.09.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 11:09:53 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 26 Jan 2016 13:09:24 -0600
Message-Id: <1453835364-6473-9-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
References: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH v2 8/8] xen: don't inject -mfpmath=sse which causes build issues
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
X-List-Received-Date: Tue, 26 Jan 2016 19:10:08 -0000

Don't inject -mfpmath=sse into the build which causes issues with the
hypervisor build.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 ...xen-x86-Fix-up-rules-when-forcing-mno-sse.patch | 28 ----------------------
 recipes-extended/xen/xen.inc                       |  5 ++++
 recipes-extended/xen/xen_4.6.0.bb                  |  1 -
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
index f937b05..5555ed3 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -713,6 +713,11 @@ export CROSS_COMPILE="${TARGET_PREFIX}"
 # overide LDFLAGS to allow xen to build without: "x86_64-oe-linux-ld: unrecognized option '-Wl,-O1'"
 export LDFLAGS=""
 
+# Yocto injects -mfpmath=sse for some machine types into the CFLAGS which
+# conflicts with -mno-sse so instead we strip -mfpmath=sse instead of
+# patching the build to be ok with this
+TUNE_CCARGS := "${@oe_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
+
 EXTRA_OECONF += " \
     --exec-prefix=/usr \
     --prefix=/usr \
diff --git a/recipes-extended/xen/xen_4.6.0.bb b/recipes-extended/xen/xen_4.6.0.bb
index 0391dbd..41241cd 100644
--- a/recipes-extended/xen/xen_4.6.0.bb
+++ b/recipes-extended/xen/xen_4.6.0.bb
@@ -2,7 +2,6 @@ require xen.inc
 
 SRC_URI = " \
     http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
-    file://xen-x86-Fix-up-rules-when-forcing-mno-sse.patch \
     "
 
 SRC_URI[md5sum] = "48e232f90927c08326a7b52bb06f49bc"
-- 
2.4.10


