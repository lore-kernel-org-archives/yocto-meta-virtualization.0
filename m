Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7311AE009A5; Thu,  5 Jan 2017 09:05:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.223.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66A16E00992
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Jan 2017 09:05:28 -0800 (PST)
Received: by mail-io0-f194.google.com with SMTP id f73so63430500ioe.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Jan 2017 09:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sA5hFBnA44mCVbqNeCcgzGGO4FBnuSRBxyaS4duiaog=;
	b=Y1utg/GvUJkP0LnAnDNILi2ZEt3a/aUk58gKc9R17x4zhhji+1aEBRK6MnByp5IFC5
	O9j/d6spw8+HcKkm3MGOwMz1UCH0g2em7LzcGX6ST679RivFtgLxVzqBTdE1991ZGNGe
	vJxE0mHxXPcc8pKZeRCScSQDAes/FBxqXNOt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sA5hFBnA44mCVbqNeCcgzGGO4FBnuSRBxyaS4duiaog=;
	b=CwTfb0dDVM77rqpiBDnC4HkrkVtny6/lodpcbyUJ/K6gksPvzvvYh95SVafhbYDfij
	S5GCzL1Sk+C8Ru/OZD6j8B+bINTSxHViYItc6Dl4wM+yeNk2SQvBRuJwjiTqtwnoUYTN
	yo4mzB+2e5ExVyly5uvy5peoTyQ9UgKDll+HMI1anosgKUIUGSTcOVXlE5aL9+6lg4g5
	TOgNfcAwzdbtUuXvqXqvRe0Baj2IrptvZECAtRhRTKW1xSvWHtNIG0nLFkZh1rOi9Xdf
	1JpGyOBxXxKMEfrulaKeUU8yDTWV6gl+W1DpT/wa6WpSs51KhhsdfFxwMgxG2WTljSSW
	5yQw==
X-Gm-Message-State: AIkVDXLtbn+OtVOjmpCZ9btmBXMjtqkhyJUuJIt2Proe3sIm5LSEwWH/PF+R3iCY9+At/w==
X-Received: by 10.107.130.141 with SMTP id m13mr1111101ioi.38.1483635927911;
	Thu, 05 Jan 2017 09:05:27 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	j201sm36362592ita.2.2017.01.05.09.05.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 09:05:27 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  5 Jan 2017 11:05:22 -0600
Message-Id: <20170105170523.1318-3-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170105170523.1318-1-cardoe@cardoe.com>
References: <20170105170523.1318-1-cardoe@cardoe.com>
Subject: [PATCH 2/3] xen: remove unused patch
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
X-List-Received-Date: Thu, 05 Jan 2017 17:05:32 -0000

---
 ...l-compilation-warning-fix-for-arm-aarch64.patch | 58 ----------------------
 1 file changed, 58 deletions(-)
 delete mode 100644 recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch

diff --git a/recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch b/recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch
deleted file mode 100644
index baab928..0000000
--- a/recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Upstream-Status: Submitted
-
-From 3716a7faf98e1e126d47fe1596593917c27ee1bd Mon Sep 17 00:00:00 2001
-From: Chris Patterson <pattersonc@ainfosec.com>
-Date: Tue, 26 Jul 2016 16:01:47 -0400
-Subject: [PATCH] libxl: compilation warning fix for arm & aarch64
-
-GCC 6 will warn on unused static const variables in c modules:
-https://gcc.gnu.org/ml/gcc-patches/2015-09/msg00847.html
-
-When compiling with LIBXL_HAVE_NO_SUSPEND_RESUME set (arm & aarch64),
-the compiler emits the following errors:
-  xl_cmdimpl.c:101:19: error: 'migrate_report'
-      defined but not used [-Werror=unused-const-variable=]
-  xl_cmdimpl.c:99:19: error: 'migrate_permission_to_go'
-      defined but not used [-Werror=unused-const-variable=]
-  xl_cmdimpl.c:97:19: error: 'migrate_receiver_ready'
-      defined but not used [-Werror=unused-const-variable=]
-  xl_cmdimpl.c:95:19: error: 'migrate_receiver_banner'
-      defined but not used [-Werror=unused-const-variable=]
-
-These unused const variables are only used in functions which exist between
-the ifndef block:
-   #ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
-   ...
-   #endif
-
-Wrap the same ifndef around these variables.
-
-Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
----
- tools/libxl/xl_cmdimpl.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/tools/libxl/xl_cmdimpl.c b/tools/libxl/xl_cmdimpl.c
-index d1fcfa4..ada8178 100644
---- a/tools/libxl/xl_cmdimpl.c
-+++ b/tools/libxl/xl_cmdimpl.c
-@@ -92,6 +92,7 @@ static int fd_lock = -1;
- static const char savefileheader_magic[32]=
-     "Xen saved domain, xl format\n \0 \r";
- 
-+#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
- static const char migrate_receiver_banner[]=
-     "xl migration receiver ready, send binary domain data.\n";
- static const char migrate_receiver_ready[]=
-@@ -100,6 +101,8 @@ static const char migrate_permission_to_go[]=
-     "domain is yours, you are cleared to unpause";
- static const char migrate_report[]=
-     "my copy unpause results are as follows";
-+#endif
-+
-   /* followed by one byte:
-    *     0: everything went well, domain is running
-    *            next thing is we all exit
--- 
-2.7.4
-
-- 
2.10.2


