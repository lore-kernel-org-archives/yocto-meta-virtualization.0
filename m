Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BACDC4345F
	for <webhook@archiver.kernel.org>; Sat, 20 Apr 2024 07:29:36 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.7677.1713598173886922976
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 20 Apr 2024 00:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aX8AmAxk;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a55323f2ef9so329156966b.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 20 Apr 2024 00:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713598172; x=1714202972; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+JwdBvwrUsqCULjm8s9SZ4gZxyXvu0bLfBxmJNFSj0=;
        b=aX8AmAxk94lm8ac2LwapLX3DzKd1XKXQ2b0bTp+CufDoVkspl8foUt/QD/9A1YvF5V
         MBrVtLOJmdD2vfzaslcenQNkUlShgIsqNM6vkuyMQhX7BVfA8TEfVO4PM1vTCSr69/4C
         H32S8IsdSlUhWiqzI6r+GZ+wWx6lSmgW6x9ZYZZ4Xs+NzPBw3W2uuQTkMbGD5aRwdKkI
         FxVo4h4tXvg3qb6byLK6pnzXVNtZUHTaadSljspiMQSeIP6pJms/vzPOhtY7yVmspcPH
         wEhcTZWEdPV82SBwdDVowLYiosXhx4TUEebeDdcQZdo1pTPTaInp0+lwU92ct59p5kKx
         wk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713598172; x=1714202972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+JwdBvwrUsqCULjm8s9SZ4gZxyXvu0bLfBxmJNFSj0=;
        b=anUt/o03N5JA/sXpUM4z6fydg1TeTdbNSa8d+VA3QIhyYE2N2wz8YsxLps12c7m2r4
         KMbIAAYh/CKx28oBXkY/ztOkAB9oWxek/XRK8q8IZYvEVdMWo9Kac/syqCb1EeFB0Js4
         fa3DCF+tOPvVWY7Emw4Lu6YqKR1Dkl8sW1/C3Tpm7rDNuQt4HH7WYu6L4DOUyiFo/Dax
         d54d/H3rN0GUFYzrqrPGZXVAg+NzquGbE37BMbNGnupfmzrJBG4zWQH/pKATiMK4Cija
         I/LxVCakAZAgbg+7vuhmW067km/Nr4VrG1hA5k8cLjrRyoOKOmEmmQf/hwG9Mq1UH62Y
         HWqQ==
X-Gm-Message-State: AOJu0YwG3wAlZyY/2gDkbM6phlPd6v4i0DXT3tTMC5ZNrh0jWS7iampr
	+G4x7OE/lnMY/2EdblLQU5BLgHx+CMNj0FFc9BfQYmep1OpIGjN1LPkHcA==
X-Google-Smtp-Source: AGHT+IE/uvgwYGLrtKMaLUThXgO7zqxggJ2RKhYZi2qBKlMxZEIiOTn91AzeEC7RFk/61n0AuhDYEw==
X-Received: by 2002:a17:907:ea2:b0:a52:1208:31eb with SMTP id ho34-20020a1709070ea200b00a52120831ebmr3542024ejc.48.1713598172007;
        Sat, 20 Apr 2024 00:29:32 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ky17-20020a170907779100b00a55926df215sm847385ejc.72.2024.04.20.00.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 00:29:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ola x Nilsson <olani@axis.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2] diod: Build in 32bit systems with 64bit time_t
Date: Sat, 20 Apr 2024 09:29:17 +0200
Message-ID: <20240420072917.914160-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 20 Apr 2024 07:29:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8686

From: Ola x Nilsson <olani@axis.com>

Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: just fixed Author

 recipes-extended/diod/diod_1.0.24.bb          |   1 +
 ...ous-time_t-sizes-in-printf-and-scanf.patch | 100 ++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch

diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/diod_1.0.24.bb
index 5e191dc0..6019fbfb 100644
--- a/recipes-extended/diod/diod_1.0.24.bb
+++ b/recipes-extended/diod/diod_1.0.24.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/chaos/diod.git;protocol=https;branch=master \
            file://diod \
            file://diod.conf \
            file://0001-build-Find-lua-with-pkg-config.patch \
+           file://0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch \
            "
 DEPENDS = "libcap ncurses tcp-wrappers lua"
 
diff --git a/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch
new file mode 100644
index 00000000..3c13c101
--- /dev/null
+++ b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch
@@ -0,0 +1,100 @@
+From 04b0c5a5cb9e32090b177ff7327ad3260783abe0 Mon Sep 17 00:00:00 2001
+From: Ola x Nilsson <olani@axis.com>
+Date: Mon, 15 Apr 2024 17:31:44 +0200
+Subject: [PATCH] Handle various time_t sizes in printf and scanf
+
+The members of the timeval struct are both signed (defined by POSIX)
+and typically both 64 bits on a system where time_t is 64 bits.  This
+is possible also on 32 bit systems where time_t is larger to handle
+the 2038 problem.
+
+It's practically impossible to find a type and printf format that
+works even on all glibc systems.  Play it safe and always use printf
+with intmax_t and explict int64_t variables for scanf.
+
+Upstream-Status: Submitted [https://github.com/chaos/diod/pull/100]
+Signed-off-by: Ola x Nilsson <olani@axis.com>
+---
+ libnpfs/conn.c   | 5 +++--
+ libnpfs/ctl.c    | 7 ++++---
+ utils/dioddate.c | 8 +++++++-
+ 3 files changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/libnpfs/conn.c b/libnpfs/conn.c
+index 6e85fff..c34c840 100644
+--- a/libnpfs/conn.c
++++ b/libnpfs/conn.c
+@@ -16,6 +16,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <stdint.h>
++#include <inttypes.h>
+ #include <stdarg.h>
+ #include <errno.h>
+ #include <pthread.h>
+@@ -133,8 +134,8 @@ _debug_trace (Npsrv *srv, Npfcall *fc)
+ 				(void)gettimeofday(&b, NULL);
+ 			(void)gettimeofday(&a, NULL);
+ 			timersub(&a, &b, &c);
+-			np_logmsg(srv, "[%lu.%-3lu] %s",
+-				  c.tv_sec, c.tv_usec/1000, s);
++			np_logmsg(srv, "[%"PRIdMAX".%-3"PRIdMAX"] %s",
++				  (intmax_t)c.tv_sec, (intmax_t)c.tv_usec/1000, s);
+ 		} else
+ 			np_logmsg(srv, "%s", s);
+ 	}
+diff --git a/libnpfs/ctl.c b/libnpfs/ctl.c
+index f40cde4..317a22e 100644
+--- a/libnpfs/ctl.c
++++ b/libnpfs/ctl.c
+@@ -16,6 +16,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <stdint.h>
++#include <inttypes.h>
+ #include <stdarg.h>
+ #include <pthread.h>
+ #include <errno.h>
+@@ -291,9 +292,9 @@ _ctl_get_date (char *name, void *a)
+ 		np_uerror (errno);
+ 		goto error;
+ 	}
+-	if (aspf (&s, &len, "%lu.%lu %d.%d\n",
+-					tv.tv_sec,         tv.tv_usec,
+-					tz.tz_minuteswest, tz.tz_dsttime) < 0) {
++	if (aspf (&s, &len, "%"PRIdMAX".%"PRIdMAX" %d.%d\n",
++					(uintmax_t)tv.tv_sec, (uintmax_t)tv.tv_usec,
++					tz.tz_minuteswest,    tz.tz_dsttime) < 0) {
+ 		np_uerror (ENOMEM);
+ 		goto error;
+ 	}
+diff --git a/utils/dioddate.c b/utils/dioddate.c
+index bde002f..f392792 100644
+--- a/utils/dioddate.c
++++ b/utils/dioddate.c
+@@ -21,6 +21,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <stdint.h>
++#include <inttypes.h>
+ #include <stdarg.h>
+ #include <stdio.h>
+ #if HAVE_GETOPT_H
+@@ -142,11 +143,16 @@ main (int argc, char *argv[])
+         errn (np_rerror (), "error reading date");
+         goto done;
+     }
+-    if (sscanf (buf, "%lu.%lu %d.%d", &tv.tv_sec, &tv.tv_usec,
++
++    int64_t sec = 0, usec = 0;
++    if (sscanf (buf, "%"SCNd64".%"SCNd64" %d.%d", &sec, &usec,
+                                     &tz.tz_minuteswest, &tz.tz_dsttime) != 4) {
+         msg ("error scanning returned date: %s", buf);
+         goto done;
+     }
++    tv.tv_sec = sec;
++    tv.tv_usec = usec;
++
+     if (Sopt) {
+         if (settimeofday (&tv, &tz) < 0)
+             err_exit ("settimeofday");
-- 
2.44.0


