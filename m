Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.17133.1582521558173458945
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b/W7/3j4;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C30EE01483; Sun, 23 Feb 2020 21:19:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.214.179 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2AAAE00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:16 -0800 (PST)
Received: by mail-pl1-f179.google.com with SMTP id y8so3546054pll.13
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JkRd3Hm78cS6Cx5mH+3UyO2qYIiOj5tUARYgWhTcrko=;
        b=b/W7/3j456KX0MIc3Yt1S1CrgwOdB6yOtLZCY0EpE34OO1K3NJoNWTVmzVwxEUqvvw
         jPphxbWfYejBEWK8C9vM5wUBLIbMOh34POzgczkXHvC1djbpUx1ptLqC8srtFDUXpJz3
         3KoL0zc8UB7GwjKq5hK9MUWOtna51dVzA4jRHEFWFGIwP/jPr53bzB0bC1xQaD+2MnFj
         Ska8fB7+k6YVlGt/MKMAytAFjE+OQa6XYnAMkZAiycb5ovnhEr3iPldeo6pq0EFi6iDz
         2VFn++hjnXTjT2gzYHEXyAbxU16x2No7kmBFbe6tiA6mG8LGNG8Acnz5d6V0sx3r0VGA
         5JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JkRd3Hm78cS6Cx5mH+3UyO2qYIiOj5tUARYgWhTcrko=;
        b=hgWLoDMgPv9oDe66qemc/fxZhUfkcI1JIOgj5XXAdn/3Xy5bhK3McUNyjDt6w4A04y
         MjdCypbFJo/8lUPOPYlUj8S5y7SFZZVWhiVjMnYoGrhqua0Yjb5AxjShZ0hLjO/sCgJj
         kYIpUJch1nlIzL/7+dtBaYYa5Ldd9XGDKmn5fsTswEP+jxXskFrte1s9f4T0zmFGlDTj
         vFC1eyUFbxw0tPwnWQlmWRpuqWf4oB0P04Whh0qfiOwwy79naGxLE9dKXdYdCkJfIqSX
         1u1o6WnnWh30Mn9CtxuOzcvuayCKRC2Kl4YJ3Lbp0KdKY0XXiVMEZNIoU1lEn/p6MCou
         w55g==
X-Gm-Message-State: APjAAAV0hQ8+y/qseyGKLB0ntN0Yx+CLt08au57aYKi98Kpfw0rGOPZl
	kk70TBvcZIoyBSFDgk+cLBjVKHDY
X-Google-Smtp-Source: APXvYqyWx0UaOz/mriK5MGJUzkxrACtC0bnzD+z3Z5zVGsXgYNNJfTNOQn2JlAOEyhQOYS7hd/92iQ==
X-Received: by 2002:a17:90b:3cc:: with SMTP id go12mr17990211pjb.89.1582521555872;
        Sun, 23 Feb 2020 21:19:15 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:14 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 02/22] ipxe: fix build with uprev to the latest git revision
Date: Sun, 23 Feb 2020 21:18:32 -0800
Message-Id: <20200224051852.21933-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Newer version allows for a simpler version of the cross-compile patch,
which is updated in this change.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 .../files/ipxe-fix-hostcc-nopie-cflags.patch  | 58 ++-----------------
 recipes-extended/ipxe/ipxe_git.bb             |  2 +-
 2 files changed, 7 insertions(+), 53 deletions(-)

diff --git a/recipes-extended/ipxe/files/ipxe-fix-hostcc-nopie-cflags.patch b/recipes-extended/ipxe/files/ipxe-fix-hostcc-nopie-cflags.patch
index da154a6..865e9bb 100644
--- a/recipes-extended/ipxe/files/ipxe-fix-hostcc-nopie-cflags.patch
+++ b/recipes-extended/ipxe/files/ipxe-fix-hostcc-nopie-cflags.patch
@@ -1,34 +1,17 @@
-Fix detection of host compiler "no-pie"/"nopie" and link flags.
-
-Detection of the "no-pie" vs "nopie" flag needs to be performed for both
-the host and target compilers; cannot assume that one works for the other.
-
-Use EXTRA_HOST_CFLAGS and EXTRA_HOST_LDFLAGS variables for passing
-host tool parameters if required. Removes previous hardcoded "-O2 -g".
-
-Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
-diff --git a/Makefile.housekeeping b/Makefile.housekeeping
-index f833492..5451c39 100644
+diff --git a/src/Makefile.housekeeping b/src/Makefile.housekeeping
+index 1dd1479..13f44dd 100644
 --- a/Makefile.housekeeping
 +++ b/Makefile.housekeeping
-@@ -133,6 +133,7 @@ eval :
- WORKAROUND_CFLAGS :=
- WORKAROUND_ASFLAGS :=
- WORKAROUND_LDFLAGS :=
-+WORKAROUND_HOST_CFLAGS :=
- 
- # Make syntax does not allow use of comma or space in certain places.
- # This ugly workaround is suggested in the manual.
-@@ -445,7 +446,7 @@ endif
+@@ -454,7 +454,7 @@ endif
  CFLAGS		+= $(WORKAROUND_CFLAGS) $(EXTRA_CFLAGS)
  ASFLAGS		+= $(WORKAROUND_ASFLAGS) $(EXTRA_ASFLAGS)
  LDFLAGS		+= $(WORKAROUND_LDFLAGS) $(EXTRA_LDFLAGS)
--HOST_CFLAGS	+= $(WORKAROUND_CFLAGS) -O2 -g
-+HOST_CFLAGS	+= $(WORKAROUND_HOST_CFLAGS) $(EXTRA_HOST_CFLAGS)
+-HOST_CFLAGS	+= -O2 -g
++HOST_CFLAGS	+= -O2 -g $(EXTRA_HOST_CFLAGS)
  
  # Inhibit -Werror if NO_WERROR is specified on make command line
  #
-@@ -1375,7 +1376,7 @@ endif # defined(BIN)
+@@ -1379,7 +1379,7 @@ endif # defined(BIN)
  # The compression utilities
  #
  
@@ -37,32 +20,3 @@ index f833492..5451c39 100644
  
  $(ZBIN) : util/zbin.c $(MAKEDEPS)
  	$(QM)$(ECHO) "  [HOSTCC] $@"
-diff --git a/arch/i386/Makefile b/arch/i386/Makefile
-index b7c2792..4a637ad 100644
---- a/arch/i386/Makefile
-+++ b/arch/i386/Makefile
-@@ -78,11 +78,20 @@ CFLAGS			+= -Ui386
- # -nopie.  We therefore test for both.
- #
- ifeq ($(CCTYPE),gcc)
--PIE_TEST = [ -z "`$(CC) -fno-PIE -no-pie -x c -c /dev/null -o /dev/null 2>&1`" ]
--PIE_FLAGS := $(shell $(PIE_TEST) && $(ECHO) '-fno-PIE -no-pie')
--PIE_TEST2 = [ -z "`$(CC) -fno-PIE -nopie -x c -c /dev/null -o /dev/null 2>&1`" ]
-+PIE_TEST1_FLAGS = "-fno-PIE -no-pie -x c -c /dev/null -o /dev/null 2>&1"
-+PIE_TEST2_FLAGS = "-fno-PIE -nopie -x c -c /dev/null -o /dev/null 2>&1"
-+
-+PIE_TEST1 = [ -z "`$(CC) "$(PIE_TEST1_FLAGS)"`" ]
-+PIE_TEST2 = [ -z "`$(CC) "$(PIE_TEST2_FLAGS)"`" ]
-+PIE_FLAGS1 := $(shell $(PIE_TEST1) && $(ECHO) '-fno-PIE -no-pie')
- PIE_FLAGS2 := $(shell $(PIE_TEST2) && $(ECHO) '-fno-PIE -nopie')
--WORKAROUND_CFLAGS += $(PIE_FLAGS) $(PIE_FLAGS2)
-+WORKAROUND_CFLAGS += $(PIE_FLAGS1) $(PIE_FLAGS2)
-+
-+HOST_PIE_TEST1 = [ -z "`$(HOSTCC) "$(PIE_TEST1_FLAGS)"`" ]
-+HOST_PIE_TEST2 = [ -z "`$(HOSTCC) "$(PIE_TEST2_FLAGS)"`" ]
-+HOST_PIE_FLAGS1 := $(shell $(HOST_PIE_TEST1) && $(ECHO) '-fno-PIE -no-pie')
-+HOST_PIE_FLAGS2 := $(shell $(HOST_PIE_TEST2) && $(ECHO) '-fno-PIE -nopie')
-+WORKAROUND_HOST_CFLAGS += $(HOST_PIE_FLAGS1) $(HOST_PIE_FLAGS2)
- endif
- 
- # i386-specific directories containing source files
diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index 1de0f21..47c5b7a 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 DEPENDS = "binutils-native perl-native syslinux mtools-native cdrtools-native xz"
 LIC_FILES_CHKSUM = "file://../COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "64b4452bca04af433f1c98ab782c0e93cd5c88c0"
+SRCREV = "18dc73d27edb55ebe9cb13c58d59af3da3bd374b"
 PV = "gitr${SRCPV}"
 PR = "r0"
 
-- 
2.17.1

