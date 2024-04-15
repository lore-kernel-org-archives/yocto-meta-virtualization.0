Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4041C00A94
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 16:11:38 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.43])
 by mx.groups.io with SMTP id smtpd.web10.25275.1713197489752974290
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 09:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=isfmvoLf;
 spf=pass (domain: axis.com, ip: 40.107.21.43, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgsGi0y0A32xUDPgS83jdIc7/ET8TUnj3XhraJwadfhnOXw6nSsPFpqJhhzRcu44PKZdNQM2YOPH+MvVI7BAQh3DwS5rQAbKKXq2CoqdS+mzX28aDg6kspkGZUtRtMwWfBvPen/TYcRAReyBqrOhzbRHFuVVzbescO/3wKUGpK90N47jay2YqoDU5Xrq5h/HnbXZ15zBFJWYS/JhxkMFvE8+RzRMc4A/5acjecAR/NfyCs9qt9fGcw0Xja/+heyDHQZkGxYhThUGEKTeYIjK6w8l1u9fu/bUlrKCX6q937lzrxC2k4D5+HmSvCGI9ATJ37T7iW9XuohO1tMiH9CuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7R5gLspiB1rX7OTEdN4uNSxLa0HSpSfYZrleSXv3Nn0=;
 b=Q4stVOXQx0slOTaxIsBKfVVoVgUq/cz8lYXngbB4OSyQJSuV3WW2UukV9AbxE2Pa/YlLwH2G709oBH6AwMVtHF5aIrIiOjPASWhKEJT+epvScztWfaqnQg0lQ9UD5sCrwulNgbaWO5vG6PhDfCVnNRqVfeI5uyYn4iOKe0hlTtyjg5HrRL951MH3YEYyPTBiAghGv/QXfSX+RK4ANfOQ0VojhJ8Wmzj614r1zAWdqvsgR15AQqYJYrw8yQPAFVn4L+TJ5Z+WbhFBITBASCWCZXMMX2YAcEf5Yk3Gaw7vzSVKWi8rhkzjjt9V3K09vCkoWnmFLdSuHnU8PqtwfY0Cfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R5gLspiB1rX7OTEdN4uNSxLa0HSpSfYZrleSXv3Nn0=;
 b=isfmvoLfaUt/U5PKPeZJN46ua3SkE19apz111zIMd+yuxUo5yjHtINIwYD+WmG/XewbQd7S9vhG6kd4nH0A/eNQhe3C1lUVkR3Htt4x/iri8BzfWJ83CvRMxNv8h1Q6Jll29+0Tpm4U5yzMIGoLT2E2v/dYdSfTGYXrFrIl+d90=
Received: from DB8PR03CA0023.eurprd03.prod.outlook.com (2603:10a6:10:be::36)
 by GV2PR02MB8769.eurprd02.prod.outlook.com (2603:10a6:150:74::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.43; Mon, 15 Apr
 2024 16:11:24 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::b3) by DB8PR03CA0023.outlook.office365.com
 (2603:10a6:10:be::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Mon, 15 Apr 2024 16:11:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 15 Apr 2024 16:11:23 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 Apr
 2024 18:11:22 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 15 Apr 2024 18:11:22 +0200
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7D7F21322;
	Mon, 15 Apr 2024 18:11:22 +0200 (CEST)
Received: by pc58073-2410.se.axis.com (Postfix, from userid 20853)
	id 4E4F24369CBB; Mon, 15 Apr 2024 18:11:44 +0200 (CEST)
From: Ola x Nilsson <olani@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <olani@axis.com>
Subject: [meta-virtualization][PATCH] diod: Build in 32bit systems with 64bit time_t
Date: Mon, 15 Apr 2024 18:11:44 +0200
Message-ID: <20240415161144.3107769-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9BF:EE_|GV2PR02MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: ca49cf1c-57ad-4ecc-24b0-08dc5d66b210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DQCoio4IJzH4M9n/OYROYj1nM3PiEJbldzBVtkIQJIeDe5NV4FrSz06Y7XKUDEv04C4ZHDGJjhFCDyg7whKIF37N4Wl4QRRUzsq/P5VEBvo7g/eIzuwmOXwSYmLuMaUyTgQdpruip7wvSk5JHuVmwdUffvI3MySuKQFzR+9Yh3vOOb8kdKvq2nV45mmqIx7QDJ5n+Zvipx1N6u5crYVDMcv9Ri+CEuP/C9QWD6If9e8CnMgHMULHFW3PMn9S2lLprGcZZcXbThE8yEGAa7Y6qAUgGaZmG2u7Z9f0K72I6h65tXiZwONpeDJsUmQkMY24+eYrcPvqq02aCjMge2X3eUKyiivpuEYXalGf2Boh8VH0i06fPRRiliFftSnOYoSs30CRiOVzuL3y8z2M872kHbC+C6hE6/6nPhdXjYLoh0OOy2HP438czy0+mAse9uG8nFaRx8BPwVNixzhWnIt6b5xdPD1XKiw0fpArNd7CU617BjNrz60HMn2/gUmzTcNNPuofD4EBYhKZdBAm8J2Kx6YFnaLY0opMHZgGkj0O1EEX6LwPWzornFYp/CSoXTdin3/5eWJl+l3ATIolvIHGTOyMhqYGo5Exk80hUFuTLNiOi7hLi8TgPM2EkuOWFuhMe1TxuqsRESBlTtRXeZ1l5WzrBaoxezEiEq4IQuR6xeRtwjRcms4CX3IJy3pVpNAmNto4uR2JpDFD28aBIMwy43oUwkWLdRNddPTt0WpP6IojadT9/aRujfn8lvoc8vGV
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 16:11:23.4436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca49cf1c-57ad-4ecc-24b0-08dc5d66b210
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8769
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Apr 2024 16:11:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8676

Change-Id: I84c9c3526b79a63de7cdc2f0841bce26e29a72a2
Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 recipes-extended/diod/diod_1.0.24.bb          |   1 +
 ...ous-time_t-sizes-in-printf-and-scanf.patch | 100 ++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 recipes-extended/diod/files/0002-Handle-various-time_t-=
sizes-in-printf-and-scanf.patch

diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/d=
iod_1.0.24.bb
index 5e191dc0..6019fbfb 100644
--- a/recipes-extended/diod/diod_1.0.24.bb
+++ b/recipes-extended/diod/diod_1.0.24.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "git://github.com/chaos/diod.git;protocol=3Dh=
ttps;branch=3Dmaster \
            file://diod \
            file://diod.conf \
            file://0001-build-Find-lua-with-pkg-config.patch \
+           file://0002-Handle-various-time_t-sizes-in-printf-and-scanf.pat=
ch \
            "
 DEPENDS =3D "libcap ncurses tcp-wrappers lua"
=20
diff --git a/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-i=
n-printf-and-scanf.patch b/recipes-extended/diod/files/0002-Handle-various-=
time_t-sizes-in-printf-and-scanf.patch
new file mode 100644
index 00000000..3c13c101
--- /dev/null
+++ b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-print=
f-and-scanf.patch
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
++    int64_t sec =3D 0, usec =3D 0;
++    if (sscanf (buf, "%"SCNd64".%"SCNd64" %d.%d", &sec, &usec,
+                                     &tz.tz_minuteswest, &tz.tz_dsttime) !=
=3D 4) {
+         msg ("error scanning returned date: %s", buf);
+         goto done;
+     }
++    tv.tv_sec =3D sec;
++    tv.tv_usec =3D usec;
++
+     if (Sopt) {
+         if (settimeofday (&tv, &tz) < 0)
+             err_exit ("settimeofday");
--=20
2.39.2


