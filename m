Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F0C8E00BC2; Sat, 18 Aug 2018 18:37:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.223.195 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60C66E007EE
	for <meta-virtualization@yoctoproject.org>;
	Sat, 18 Aug 2018 18:37:34 -0700 (PDT)
Received: by mail-io0-f195.google.com with SMTP id v14-v6so826129iob.4
	for <meta-virtualization@yoctoproject.org>;
	Sat, 18 Aug 2018 18:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ueQZJfCnJTqzpdHi1mM1hcA6EESynqhI+2cHr5yknKg=;
	b=rfvmd3/5cQ1hBB3CsYfK/9cBzIDg4qhhvjkrzqXbegb2w8muD7NOA+SLkTdNiA4gBt
	09XKOBuVlw1xe6iJhto31j0omzgMwMLZt44UKb+j7O3A2ZtSuARWWhwEiZTZ0A1rxyEJ
	P/2/TLA4HQrALvca2E1P2w0cqGLnqVMcHAcpmmk9CSR7/Ig5TnmLmbkleM/o/zzfcJqS
	Bhwa88wXx7VSg3rymnAm1yUke7DBo243zm09SrK4bhcmSIuSH8cNEjozp3NHCH9HGkgN
	F147NVd9XrX4J+PRxjnBbBMpBUjoN0YwcQRHc+Lkdzyi29GX8Az4gpQ49bjae0LfzNdc
	3/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ueQZJfCnJTqzpdHi1mM1hcA6EESynqhI+2cHr5yknKg=;
	b=mQrqC2mh708REN9hGmNp9md3YO8i7MuLef3zk25ICLRMX6agK6JEnnBoL2GjkgAV73
	XvQTp2S8PDkdRa5YhqHnjXg9hAbQmREzGJ4kKVNZFVB2iRJVN5shCQnbndqMteadf1qW
	RMalxBsx4dqNBdofRf9gZ14vJkQpXEf54nIj2rVucWSxC/H96NWxAiPYkHtrO+d1noL5
	fU+ZeOfIionVac/DmTIbwCepOnENaEOM3fuZqlcBuMGHkUks1dnb+gpwkQJ9r2V8U6S+
	27NgX8TjIKLyaa5R2/u+L+6cWc5h4KGE/FGV5CA5P/5gShoABBf4ejyRWTJ7jfS49eRv
	/HEQ==
X-Gm-Message-State: AOUpUlGmtGnPQrV6y8BiENagLwwRf5bbO6sw8DRHlCIbjk0Z+SwSplCT
	klFyc1uj735CNNaOx3XPPkhefrVU
X-Google-Smtp-Source: AA+uWPwIUTiEna9Bl6wvJIqQ7gfJas4PP3KKNFom2ikGCrnz/0sML0Oq3g/k/pFjkyk4py7AaEf6FA==
X-Received: by 2002:a6b:4403:: with SMTP id
	r3-v6mr22510796ioa.70.1534642653578; 
	Sat, 18 Aug 2018 18:37:33 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	i2-v6sm2198418ioh.80.2018.08.18.18.37.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Aug 2018 18:37:32 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sat, 18 Aug 2018 18:37:14 -0700
Message-Id: <1534642635-18305-3-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534642635-18305-1-git-send-email-christopher.w.clark@gmail.com>
References: <1534642635-18305-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 2/3] xen: fix truncation warning in tools build for ARM 32-bit
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
X-List-Received-Date: Sun, 19 Aug 2018 01:37:35 -0000

Adds xen-tools-xenpmd-snprintf.patch to fix string format compiler
truncation warning in xenpmd: assists the compiler by masking the
value to provide an obvious low upper bound for the value range.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 .../xen/files/xen-tools-xenpmd-snprintf.patch      | 78 ++++++++++++++++++++++
 recipes-extended/xen/xen_4.11.0.bb                 |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 recipes-extended/xen/files/xen-tools-xenpmd-snprintf.patch

diff --git a/recipes-extended/xen/files/xen-tools-xenpmd-snprintf.patch b/recipes-extended/xen/files/xen-tools-xenpmd-snprintf.patch
new file mode 100644
index 0000000..aac7282
--- /dev/null
+++ b/recipes-extended/xen/files/xen-tools-xenpmd-snprintf.patch
@@ -0,0 +1,78 @@
+From e4d78a67ffbacf30b66464080898227f18f6bf49 Mon Sep 17 00:00:00 2001
+From: Christopher Clark <christopher.w.clark@gmail.com>
+Date: Fri, 17 Aug 2018 17:46:10 -0700
+Subject: [PATCH] xenpmd: prevent format-truncation warning with gcc 8.2 + ARM
+ 32-bit
+To: xen-devel@lists.xenproject.org
+Cc: ian.jackson@eu.citrix.com,
+    wei.liu2@citrix.com
+
+xenpmd writes battery information to xenstore, including a string with a
+formatted hex value calculated from summing the lengths of four strings,
+plus some constants.
+
+Each of the four strings has a maximum length of 31 bytes, excluding the
+terminating zero byte. The strings are stored in 32-byte arrays in a
+struct that is zeroed before it is populated, and logic that writes to
+the strings uses strncpy and explicit zero termination.
+
+The maximum value to be supplied to the xenstore string is:
+  (9 * 4) + (31 * 4) + 4 , which is 164, ie. 0xa4.
+
+When used with this value, '%02x' will always fit within 3 bytes, but
+gcc 8.2 is apparently not able to deduce this (observed when building
+for a 32-bit ARM platform).
+
+This commit assists the compiler by applying a mask (0xff) to the value,
+enabling it to observe a lower maximum value and so pass the truncation
+length check.
+
+Prior to this change, building fails with the compiler warning:
+
+| xenpmd.c: In function 'write_battery_info_to_xenstore':
+| xenpmd.c:354:23: error: '%02x' directive output may be truncated
+writing between 2 and 8 bytes into a region of size 3
+[-Werror=format-truncation=]
+|      snprintf(val, 3, "%02x",
+|                        ^~~~
+| xenpmd.c:354:22: note: directive argument in the range [40, 2147483778]
+|      snprintf(val, 3, "%02x",
+|                       ^~~~~~
+| xenpmd.c:354:5: note: 'snprintf' output between 3 and 9 bytes into a
+destination of size 3
+|      snprintf(val, 3, "%02x",
+|      ^~~~~~~~~~~~~~~~~~~~~~~~
+|               (unsigned int)(9*4 +
+|               ~~~~~~~~~~~~~~~~~~~~
+|                              strlen(info->model_number) +
+|                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|                              strlen(info->serial_number) +
+|                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|                              strlen(info->battery_type) +
+|                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|                              strlen(info->oem_info) + 4));
+|                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| cc1: all warnings being treated as errors
+
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+---
+ tools/xenpmd/xenpmd.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
+index 56412a9..0c0787e 100644
+--- a/tools/xenpmd/xenpmd.c
++++ b/tools/xenpmd/xenpmd.c
+@@ -350,8 +350,10 @@ void write_battery_info_to_xenstore(struct battery_info *info)
+    
+     memset(val, 0, 1024);
+     memset(string_info, 0, 256);
+-    /* write 9 dwords (so 9*4) + length of 4 strings + 4 null terminators */
+-    snprintf(val, 3, "%02x", 
++    /* write 9 dwords (so 9*4) + length of 4 strings + 4 null terminators.
++     * mask informs the compiler that format truncation will not occur.
++     */
++    snprintf(val, 3, "%02x", 0xff &
+              (unsigned int)(9*4 +
+                             strlen(info->model_number) +
+                             strlen(info->serial_number) +
diff --git a/recipes-extended/xen/xen_4.11.0.bb b/recipes-extended/xen/xen_4.11.0.bb
index d7cff32..40e7340 100644
--- a/recipes-extended/xen/xen_4.11.0.bb
+++ b/recipes-extended/xen/xen_4.11.0.bb
@@ -5,6 +5,7 @@ SRC_URI = " \
     https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
     file://tools-xentop-vwprintw.patch \
     file://xen-4.11-arm-acpi-fix-string-lengths.patch \
+    file://xen-tools-xenpmd-snprintf.patch \
     "
 
 SRC_URI[md5sum] = "cbec0600284921744bc14119f4ed3fff"
-- 
2.7.4


