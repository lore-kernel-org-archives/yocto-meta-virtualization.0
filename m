Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E206E015EB; Wed, 18 Jul 2018 15:04:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.178 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7F29E015E8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 15:04:09 -0700 (PDT)
Received: by mail-pf0-f178.google.com with SMTP id i26-v6so2825165pfo.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 15:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/YVcGZquo12fxt5UapMDau1AkpmUqX9uQNIFeU20hc8=;
	b=YkKO55YRQRtNsVj1eDRDkwzngybIXtPJNi/8EkUq6rcVFQPvTlq/xU8apEA5BWQ0M8
	wCcua56dasbwj23Q1rSFioNClHBBPGelNNJ/5AGObsXSx4+YFDEfUqU1Azy0nEGGbZh3
	XkHSpbPbZRyBMujLBSx9dkVmy1lYb1ShgQyf9kkhedHxSJMDIEimflgj6uRLPIx9+P0u
	qZeO9ov7gqDkvDqV760d4RNRKOChLtaTyimmjvxLAhP1q7Ua9JS6CJXuVLC940qQW+jy
	yfgf4V4rOZs2SBqRyDF2HkCsYgKZ/lLy6mmQ1wsDGp9aC8VsC3tzRXQGqpNCQU1akk+y
	+Bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/YVcGZquo12fxt5UapMDau1AkpmUqX9uQNIFeU20hc8=;
	b=QP/+ZHHmhjHTYmFPXYcYOIAbA2OQOkVlTX3oNVmGkFR3bDKjJE01pancCCw6ZZs4XD
	9dcykBO9fY7OPUlBjOpq6tUlGIiwuvmQpOXNLE85DW+BmwxYPHna8kqWWRXPu9dbRjPs
	rUwvPbf88wPgeVvDP7VIZjpahKWcaAdaO616PDPwx9Hd6eebbkLMIJgVn3goaMQc1Eui
	+aSE/hB+B7GZNs/k1JKJSsN6yAR10JIZVFjOKps6pAgv/9zikcowb6uCiAmnZ9rDWcB1
	kPHtumdZrekKQavV0IXthJFwb8/fPbLxF8iQL0oz0meeePe+yLBvWCqvXmv26d4v4OBM
	hstQ==
X-Gm-Message-State: AOUpUlHHZwt2Zl0cUDH1h633Q4hxtBKAqQshCsDY+FsAF+6OlHJ3m1Ti
	St5jV6in2nul79l5SbS/ttom4wIa
X-Google-Smtp-Source: AAOMgpf2dlhAn9yFrdvCjVvIHgxGoz2hb9/uRyNODbdiW+/cnqsmYR9bWHPWoMJYKoqp9Ej44QDeVw==
X-Received: by 2002:a62:c819:: with SMTP id
	z25-v6mr6814469pff.44.1531951448694; 
	Wed, 18 Jul 2018 15:04:08 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	h7-v6sm19341965pfd.155.2018.07.18.15.04.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jul 2018 15:04:07 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 18 Jul 2018 15:03:48 -0700
Message-Id: <1531951428-28983-8-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
References: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Cc: cardoe@gentoo.org
Subject: [PATCH 7/7] xen: remove 4.10.1 recipe and patches
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
X-List-Received-Date: Wed, 18 Jul 2018 22:04:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystem.com>
---
Please use my gmail address for any correspondence to me.

 ...ls-gdbsx-fix-Wstringop-truncation-warning.patch | 41 ------------
 ...tools-kdd-mute-spurious-gcc-warning-part1.patch | 47 --------------
 ...tools-kdd-mute-spurious-gcc-warning-part2.patch | 52 ---------------
 .../xen/files/tools-libxc-fix-strncpy-size.patch   | 44 -------------
 ...ols-misc-fix-hypothetical-buffer-overflow.patch | 46 --------------
 .../tools-xenpmd-fix-possible-0-truncation.patch   | 74 ----------------------
 recipes-extended/xen/xen_4.10.1.bb                 | 19 ------
 7 files changed, 323 deletions(-)
 delete mode 100644 recipes-extended/xen/files/tools-gdbsx-fix-Wstringop-truncation-warning.patch
 delete mode 100644 recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-warning-part1.patch
 delete mode 100644 recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-warning-part2.patch
 delete mode 100644 recipes-extended/xen/files/tools-libxc-fix-strncpy-size.patch
 delete mode 100644 recipes-extended/xen/files/tools-misc-fix-hypothetical-buffer-overflow.patch
 delete mode 100644 recipes-extended/xen/files/tools-xenpmd-fix-possible-0-truncation.patch
 delete mode 100644 recipes-extended/xen/xen_4.10.1.bb

diff --git a/recipes-extended/xen/files/tools-gdbsx-fix-Wstringop-truncation-warning.patch b/recipes-extended/xen/files/tools-gdbsx-fix-Wstringop-truncation-warning.patch
deleted file mode 100644
index 2896d9f..0000000
--- a/recipes-extended/xen/files/tools-gdbsx-fix-Wstringop-truncation-warning.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7f601f7c341c80d554615556d60e3b8ed1e5ad4f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
- <marmarek@invisiblethingslab.com>
-Date: Thu, 5 Apr 2018 03:50:54 +0200
-Subject: [PATCH] tools/gdbsx: fix -Wstringop-truncation warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-gcc-8 complains:
-
-    gx_main.c: In function 'prepare_stop_reply':
-    gx_main.c:385:9: error: 'strncpy' output truncated before terminating nul copying 6 bytes from a string of the same length [-Werror=stringop-truncation]
-             strncpy(buf, "watch:", 6);
-             ^~~~~~~~~~~~~~~~~~~~~~~~~
-
-Since terminating '\0' isn't needed here at all, switch to memcpy.
-
-Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
-Acked-by: Wei Liu <wei.liu2@citrix.com>
-Release-Acked-by: Juergen Gross <jgross@suse.com>
----
- tools/debugger/gdbsx/gx/gx_main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/debugger/gdbsx/gx/gx_main.c b/tools/debugger/gdbsx/gx/gx_main.c
-index a908c45..6dfa501 100644
---- a/tools/debugger/gdbsx/gx/gx_main.c
-+++ b/tools/debugger/gdbsx/gx/gx_main.c
-@@ -382,7 +382,7 @@ prepare_stop_reply(enum target_signal sig, char *buf, vcpuid_t vcpu)
- 
-     /* TBD: check if we stopped because of watchpoint */
-     if (watchpoint_stop()) {
--        strncpy(buf, "watch:", 6);
-+        memcpy(buf, "watch:", 6);
-         buf += 6;
-         /* TBD: **/
-     }
--- 
-2.7.4
-
diff --git a/recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-warning-part1.patch b/recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-warning-part1.patch
deleted file mode 100644
index f94d22c..0000000
--- a/recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-warning-part1.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 437e00fea04becc91c1b6bc1c0baa636b067a5cc Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
- <marmarek@invisiblethingslab.com>
-Date: Thu, 5 Apr 2018 03:50:55 +0200
-Subject: [PATCH] tools/kdd: mute spurious gcc warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-gcc-8 complains:
-
-    kdd.c:698:13: error: 'memcpy' offset [-204, -717] is out of the bounds [0, 216] of object 'ctrl' with type 'kdd_ctrl' {aka 'union <anonymous>'} [-Werror=array-bounds]
-                 memcpy(buf, ((uint8_t *)&ctrl.c32) + offset, len);
-                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-    kdd.c: In function 'kdd_select_callback':
-    kdd.c:642:14: note: 'ctrl' declared here
-         kdd_ctrl ctrl;
-                  ^~~~
-
-But this is impossible - 'offset' is unsigned and correctly validated
-few lines before.
-
-Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
-Acked-by: Wei Liu <wei.liu2@citrix.com>
-Release-Acked-by: Juergen Gross <jgross@suse.com>
----
- tools/debugger/kdd/kdd.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
-index 1bd5dd5..61d769e 100644
---- a/tools/debugger/kdd/kdd.c
-+++ b/tools/debugger/kdd/kdd.c
-@@ -695,7 +695,10 @@ static void kdd_handle_read_ctrl(kdd_state *s)
-             KDD_LOG(s, "Request outside of known control space\n");
-             len = 0;
-         } else {
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-             memcpy(buf, ((uint8_t *)&ctrl.c32) + offset, len);
-+#pragma GCC diagnostic pop
-         }
-     }
- 
--- 
-2.7.4
-
diff --git a/recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-warning-part2.patch b/recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-warning-part2.patch
deleted file mode 100644
index afd1423..0000000
--- a/recipes-extended/xen/files/tools-kdd-mute-spurious-gcc-warning-part2.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 2de2b10b2252761baa5dd0077df384dbfcca8212 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
- <marmarek@invisiblethingslab.com>
-Date: Tue, 22 May 2018 21:47:45 +0200
-Subject: [PATCH] tools/kdd: alternative way of muting spurious gcc warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Older gcc does not support #pragma GCC diagnostics, so use alternative
-approach - change variable type to uint32_t (this code handle 32-bit
-requests only anyway), which apparently also avoid gcc complaining about
-this (otherwise correct) code.
-
-Fixes 437e00fea04becc91c1b6bc1c0baa636b067a5cc "tools/kdd: mute spurious
-gcc warning"
-
-Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
-Acked-by: Wei Liu <wei.liu2@citrix.com>
-Release-acked-by: Juergen Gross <jgross@suse.com>
-Acked-by: Tim Deegan <tim@xen.org>
----
- tools/debugger/kdd/kdd.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
-index 61d769e..5a019a0 100644
---- a/tools/debugger/kdd/kdd.c
-+++ b/tools/debugger/kdd/kdd.c
-@@ -687,7 +687,7 @@ static void kdd_handle_read_ctrl(kdd_state *s)
-         }
-     } else {
-         /* 32-bit control-register space starts at 0x[2]cc, for 84 bytes */
--        uint64_t offset = addr;
-+        uint32_t offset = addr;
-         if (offset > 0x200)
-             offset -= 0x200;
-         offset -= 0xcc;
-@@ -695,10 +695,7 @@ static void kdd_handle_read_ctrl(kdd_state *s)
-             KDD_LOG(s, "Request outside of known control space\n");
-             len = 0;
-         } else {
--#pragma GCC diagnostic push
--#pragma GCC diagnostic ignored "-Warray-bounds"
-             memcpy(buf, ((uint8_t *)&ctrl.c32) + offset, len);
--#pragma GCC diagnostic pop
-         }
-     }
- 
--- 
-2.7.4
-
diff --git a/recipes-extended/xen/files/tools-libxc-fix-strncpy-size.patch b/recipes-extended/xen/files/tools-libxc-fix-strncpy-size.patch
deleted file mode 100644
index 2d606cd..0000000
--- a/recipes-extended/xen/files/tools-libxc-fix-strncpy-size.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From fa7789ef18bd2e716997937af71b2e4b5b00a159 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
- <marmarek@invisiblethingslab.com>
-Date: Thu, 5 Apr 2018 03:50:49 +0200
-Subject: [PATCH] tools/libxc: fix strncpy size
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-gcc-8 warns about possible truncation of trailing '\0'.
-Final character is overridden by '\0' anyway, so don't bother to copy
-it.
-
-This fixes compile failure:
-
-    xc_pm.c: In function 'xc_set_cpufreq_gov':
-    xc_pm.c:308:5: error: 'strncpy' specified bound 16 equals destination size [-Werror=stringop-truncation]
-         strncpy(scaling_governor, govname, CPUFREQ_NAME_LEN);
-         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-    cc1: all warnings being treated as errors
-
-Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
-Acked-by: Wei Liu <wei.liu2@citrix.com>
-Release-Acked-by: Juergen Gross <jgross@suse.com>
----
- tools/libxc/xc_pm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/libxc/xc_pm.c b/tools/libxc/xc_pm.c
-index 67e2418..6f8d548 100644
---- a/tools/libxc/xc_pm.c
-+++ b/tools/libxc/xc_pm.c
-@@ -305,7 +305,7 @@ int xc_set_cpufreq_gov(xc_interface *xch, int cpuid, char *govname)
-     sysctl.cmd = XEN_SYSCTL_pm_op;
-     sysctl.u.pm_op.cmd = SET_CPUFREQ_GOV;
-     sysctl.u.pm_op.cpuid = cpuid;
--    strncpy(scaling_governor, govname, CPUFREQ_NAME_LEN);
-+    strncpy(scaling_governor, govname, CPUFREQ_NAME_LEN - 1);
-     scaling_governor[CPUFREQ_NAME_LEN - 1] = '\0';
- 
-     return xc_sysctl(xch, &sysctl);
--- 
-2.7.4
-
diff --git a/recipes-extended/xen/files/tools-misc-fix-hypothetical-buffer-overflow.patch b/recipes-extended/xen/files/tools-misc-fix-hypothetical-buffer-overflow.patch
deleted file mode 100644
index a499861..0000000
--- a/recipes-extended/xen/files/tools-misc-fix-hypothetical-buffer-overflow.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 27751d89248c8c5eef6d8b56eb8f7d2084145080 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
- <marmarek@invisiblethingslab.com>
-Date: Thu, 5 Apr 2018 03:50:50 +0200
-Subject: [PATCH] tools/misc: fix hypothetical buffer overflow in xen-lowmemd
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-gcc-8 complains:
-
-    xen-lowmemd.c: In function 'handle_low_mem':
-    xen-lowmemd.c:80:55: error: '%s' directive output may be truncated writing up to 511 bytes into a region of size 489 [-Werror=format-truncation=]
-             snprintf(error, BUFSZ,"Failed to write target %s to xenstore", data);
-                                                           ^~               ~~~~
-    xen-lowmemd.c:80:9: note: 'snprintf' output between 36 and 547 bytes into a destination of size 512
-             snprintf(error, BUFSZ,"Failed to write target %s to xenstore", data);
-             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-In practice it wouldn't happen, because 'data' contains string
-representation of 64-bit unsigned number (20 characters at most).
-But place a limit to mute gcc warning.
-
-Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
-Acked-by: Wei Liu <wei.liu2@citrix.com>
-Release-Acked-by: Juergen Gross <jgross@suse.com>
----
- tools/misc/xen-lowmemd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/misc/xen-lowmemd.c b/tools/misc/xen-lowmemd.c
-index 865a54c..79ad34c 100644
---- a/tools/misc/xen-lowmemd.c
-+++ b/tools/misc/xen-lowmemd.c
-@@ -77,7 +77,7 @@ void handle_low_mem(void)
-     if (!xs_write(xs_handle, XBT_NULL, 
-             "/local/domain/0/memory/target", data, strlen(data)))
-     {
--        snprintf(error, BUFSZ,"Failed to write target %s to xenstore", data);
-+        snprintf(error, BUFSZ,"Failed to write target %.24s to xenstore", data);
-         perror(error);
-     }
- }
--- 
-2.7.4
-
diff --git a/recipes-extended/xen/files/tools-xenpmd-fix-possible-0-truncation.patch b/recipes-extended/xen/files/tools-xenpmd-fix-possible-0-truncation.patch
deleted file mode 100644
index 86a8e35..0000000
--- a/recipes-extended/xen/files/tools-xenpmd-fix-possible-0-truncation.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 938c8f53b1f80175c6f7a1399efdb984abb0cb8b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
- <marmarek@invisiblethingslab.com>
-Date: Thu, 5 Apr 2018 03:50:53 +0200
-Subject: [PATCH] tools/xenpmd: fix possible '\0' truncation
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-gcc-8 complains:
-    xenpmd.c:207:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
-             strncpy(info->oem_info, attrib_value, 32);
-             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-    xenpmd.c:201:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
-             strncpy(info->battery_type, attrib_value, 32);
-             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-    xenpmd.c:195:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
-             strncpy(info->serial_number, attrib_value, 32);
-             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-    xenpmd.c:189:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
-             strncpy(info->model_number, attrib_value, 32);
-             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Copy 31 chars, then make sure terminating '\0' is present. Those fields
-are passed to strlen and as '%s' for snprintf later.
-
-Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
-Acked-by: Wei Liu <wei.liu2@citrix.com>
-Release-Acked-by: Juergen Gross <jgross@suse.com>
----
- tools/xenpmd/xenpmd.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
-index 689c8fd..56412a9 100644
---- a/tools/xenpmd/xenpmd.c
-+++ b/tools/xenpmd/xenpmd.c
-@@ -186,25 +186,29 @@ void set_attribute_battery_info(char *attrib_name,
- 
-     if ( strstr(attrib_name, "model number") ) 
-     {
--        strncpy(info->model_number, attrib_value, 32);
-+        strncpy(info->model_number, attrib_value, 31);
-+        info->model_number[31] = '\0';
-         return;
-     }
- 
-     if ( strstr(attrib_name, "serial number") ) 
-     {
--        strncpy(info->serial_number, attrib_value, 32);
-+        strncpy(info->serial_number, attrib_value, 31);
-+        info->serial_number[31] = '\0';
-         return;
-     }
- 
-     if ( strstr(attrib_name, "battery type") ) 
-     {
--        strncpy(info->battery_type, attrib_value, 32);
-+        strncpy(info->battery_type, attrib_value, 31);
-+        info->battery_type[31] = '\0';
-         return;
-     }
- 
-     if ( strstr(attrib_name, "OEM info") ) 
-     {
--        strncpy(info->oem_info, attrib_value, 32);
-+        strncpy(info->oem_info, attrib_value, 31);
-+        info->oem_info[31] = '\0';
-         return;
-     }
- 
--- 
-2.7.4
-
diff --git a/recipes-extended/xen/xen_4.10.1.bb b/recipes-extended/xen/xen_4.10.1.bb
deleted file mode 100644
index 7052f4a..0000000
--- a/recipes-extended/xen/xen_4.10.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-require xen.inc
-
-SRC_URI = " \
-    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
-    file://tools-libxc-fix-strncpy-size.patch \
-    file://tools-misc-fix-hypothetical-buffer-overflow.patch \
-    file://tools-xentop-vwprintw.patch \
-    file://tools-xenpmd-fix-possible-0-truncation.patch \
-    file://tools-gdbsx-fix-Wstringop-truncation-warning.patch \
-    file://tools-kdd-mute-spurious-gcc-warning-part1.patch \
-    file://tools-kdd-mute-spurious-gcc-warning-part2.patch \
-    file://build-undef-object-vars.patch \
-    "
-
-SRC_URI[md5sum] = "d1b1d14ce76622062c9977d9c8ba772e"
-SRC_URI[sha256sum] = "570d654f357d4085accdf752989c1cbc33e2075feac8fcc505d68bdb81b1a0cf"
-
-S = "${WORKDIR}/xen-${PV}"
-- 
2.7.4


