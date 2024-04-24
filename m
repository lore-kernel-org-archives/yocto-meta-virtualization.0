Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D5CC07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:34:13 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web11.11632.1713947643819351273
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 01:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=WuUJnF8W;
 spf=pass (domain: axis.com, ip: 40.107.21.61, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6G5DMoz+t+w+w208B33Ouo6WDlRyNCqbg3tlxYsvY7Fk+NjVKGPP6LY2Cp4FU4hNAWIygzZ/sJfj4OKcgaP1eQ40V5ZmnuMZ3b9X3wjba4Y9BkgBZzeGSOi0apWkelKPz+KwoHIZ/Lxg+mLxIKMlUJlvq4FuJBWKE65OkMTlZBBRizk770zrstEKmMTfPz3Ic2uX+7J0FBGcCbO2s7iujabIm9TZ1r86+0Cka2VRGVy92WX8ozu7XOgGvdUVc0u1AKeTEQyyGIyrmEBg3ZVQIdqeGqXH2QfVQIP2kRAiuhEaHH3pixe6OAzkBriYbiSSw3J653vWpxl/nPlFkn6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/z29p81w8qe+vogII3CW3lyrnzgvpy9G4q3XcV8qb0=;
 b=SHVI53EpGvYpaFck6db33oeGZWdGRztgQKHzyfvTeIZqCKHQCmbwmuWrQosGiUf3hpM66Dzi7jPHMYgnWgsYjamnqnG2t1Y2njc8sc3DWnzWtAD6LtTXMd+hIoed6UoHRgLC2i9kXI0cKGPLPSb7MqWVFffaIuu+8Bmh86gA/hw7fqNAQSce2H/i/WBIqCJNy4PS0dgg8W9hwFQ4Mn4bzJo18YeKz9H+N58Y49ZrjAC9gJe2ANWUCeptHlPJ1jg/ZFVFFlHFltnDFrFasoVCeA8nq/RJMP4hV3CAus3P2gl+XEYXd+2mVLjMj4LFVufW4mhtsx3ZP4rwW5xMpg04Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/z29p81w8qe+vogII3CW3lyrnzgvpy9G4q3XcV8qb0=;
 b=WuUJnF8Wn+J8K591ACQWr4UVLfplaby6LRBXZfRWH7xLTRhG8O7MH2TClKSgkdTg8fHqPJPkOu8/k9rv2pJmpMYaSFtgEMJ4zJcLhHSHIrSF5K64vGmGdiofvdl+soy5vTwNb313LhSVXNoUUeA5BY9cBWCi4JMHViRo7l8OdRg=
Received: from AS9PR06CA0391.eurprd06.prod.outlook.com (2603:10a6:20b:461::13)
 by DB9PR02MB9754.eurprd02.prod.outlook.com (2603:10a6:10:452::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 08:33:57 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:461:cafe::4a) by AS9PR06CA0391.outlook.office365.com
 (2603:10a6:20b:461::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.32 via Frontend
 Transport; Wed, 24 Apr 2024 08:33:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 08:33:57 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 24 Apr
 2024 10:33:56 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 24 Apr 2024 10:33:56 +0200
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B059F2170
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 10:33:56 +0200 (CEST)
Received: by pc58073-2410.se.axis.com (Postfix, from userid 20853)
	id 1A68E410ECF9; Wed, 24 Apr 2024 10:34:24 +0200 (CEST)
From: <olani@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] diod: Build in 32bit systems with 64bit time_t
Date: Wed, 24 Apr 2024 10:34:24 +0200
Message-ID: <20240424083424.823829-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|DB9PR02MB9754:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe2dc2c-9bf1-4834-7c0b-08dc64394874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|1800799015|82310400014|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bDzTZPcF2EkrG9tmuL+UOWcCmT3K0qyO6f13slcZzTq/ZFRGCvYqP9e/ifEK?=
 =?us-ascii?Q?KLbuIjNtFz+c/ik2XK9AhTZ4i/eOuMib/i+fLg6V/lpN2guE/bz7bfSeHavF?=
 =?us-ascii?Q?K8GbyGjbsfQdVxeRmU2+pft1hmGMO6QaySgAYIpXvcFgK0FdkSHnU8evHMHX?=
 =?us-ascii?Q?Sdv494WZW86hJZtIWGH4/4qY1uy82msfBMWjG+J4zN/dotPeumry3jXiCgrN?=
 =?us-ascii?Q?b/mrR34wEk0xjmiuKzGSE6hX7m2LtofzhA9CTTK3L7AGgBLBeTkDBF+Mpjhj?=
 =?us-ascii?Q?zdJDF8lUEBInF3Zv3+QVp89qGmZS5sqMqLQH+8k4O2xyeMO55CfsgPJfK6EN?=
 =?us-ascii?Q?PLvgaIyHfH4GMf5jTrHOA9zShpConPEBjOhZmVM/yrySWNdjuTndEmO40jzX?=
 =?us-ascii?Q?hdS5xDPF4dcR0HP2mm8RWpgZNCMkFhuhDBfjewf8GAQEf/nXHzo8xyUVEEfr?=
 =?us-ascii?Q?lRQRxHMFUc9PqkyTZeBckuDU3yGI+P8YVgyq91dQb8VTlKnhqkHl0ChP3vJk?=
 =?us-ascii?Q?7pL57BWv9kpVeoc0q49LqNzIyY4ZgY0budIWnog6Zq8ny/aj89iMgWm3ZiWq?=
 =?us-ascii?Q?Uo1p22TyINcYw1i0HKF/DJkolCPEh2W/v7lhndJ9Uaipmn4e6rLbI1NoJpqu?=
 =?us-ascii?Q?p6fQEy61p4Tp93rrdMLt5MMzpl1nHvOhKocjoLLOTAmhOm5pHygJejIXB/mr?=
 =?us-ascii?Q?DArGW3zpg80GfQ/FE1GTWNKKaBPI6trIlR7e7Z0LjsGTuwQgLktahLxmbpFz?=
 =?us-ascii?Q?hDbDjYmgL8Bu2pcNOO3qMAyWR5i8Yhe7wH/LaF/3lp1ymW5qyKIInYXyXA+8?=
 =?us-ascii?Q?CZ5y9bvE5fq/J05kfLQ/w2a8x+2YrsWgaoE9FzVRr79Bq7z3ru3yiPvfHEV7?=
 =?us-ascii?Q?1FSeiXnax9zUjJWWjfCNL/94gUVwIsNgf1TbX6Q9HTCHpjYHlKM8Vz/Nxekg?=
 =?us-ascii?Q?PY6oKD4PoyIeDF8QKrFbs1PKl8MvK1VAYL7lJtMz4dTLx1DNhPzRP5n4S7kj?=
 =?us-ascii?Q?cKAFJHb+Er70o062qMnyTDT9mS/2kormMB2ZzUvLgckTX4L2dnPduX5qccZx?=
 =?us-ascii?Q?QTnhPH9ATelpHrf9bjYhl1J1GNsdqShq41SMrJL4aU9d03mUZ8NO2f/YADWx?=
 =?us-ascii?Q?lR2aykr412TA3ahSaVKWz/+JN7KElx7zjggiUfCTBMjAEnazUq4jN77uAttT?=
 =?us-ascii?Q?ZH0wxoFzxmEh/zkMrbewV58a4d7eKvMqTStXdzN61NhjgyMED9txqpaRRGQH?=
 =?us-ascii?Q?SveKdToZz6Iq5M9VJ94l1DPUV12jFb07QaihFX94ZM6hSzJL8+l2q/TdcCZD?=
 =?us-ascii?Q?vJC75vFHHzp7cb3IoGwgtKYXQPdqOlXmfVS6Pmp35jjqHOf3U5JN/bP8QZEX?=
 =?us-ascii?Q?2d7DNUffm0MQ3JdacrrYyHrsvkow?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 08:33:57.0806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe2dc2c-9bf1-4834-7c0b-08dc64394874
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9754
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 08:34:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8698

From: Ola x Nilsson <olani@axis.com>

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


