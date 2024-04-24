Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44FDC41513
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:34:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.79])
 by mx.groups.io with SMTP id smtpd.web11.11636.1713947686093334973
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 01:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=CvrzuOjD;
 spf=pass (domain: axis.com, ip: 40.107.22.79, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIw1Tn483VCi3q0EJOb7ne5XpKZxqVFUlZ/h0SAob9yvXdJJHevbumjSw0ADD9w4KCjkplePWgQ6fnCM7s49WPm2dJ8f/oKujGSGVGw/8gUdJjXwyU3s6PHvCCUbKJD9FmCvUGUT4V9eVx5cs+shlc5ta1WWByXyW3KF1fLYutfwWn5kea0D3DD3SRHVDIpkYR8RhCHEtNJ4cidr7Q2MfIvUXAVzOA2ngohN2oekINsw3Zbh9K/w7TUTK2vGjami/2iauwfTHM5uMowQnehFZaOWFoBwD2iB9no9lPue+T2/Hx42nw3ovb66qLTRXJLdIXuXIgfpCK4JBDNH8j+OOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/z29p81w8qe+vogII3CW3lyrnzgvpy9G4q3XcV8qb0=;
 b=TH1dNtUdaf4xuYAgK5MPD7aKGEFcO+8cyOKVX/EXpRL58J2ElUC6B0LzAQmJOJOyjNrCNiTIY89fnzedYpQlXxMPJcM8uZdNa1ZAdfgUpunIqUefDdoV5f/BAfG2UT3GqLCiAhKLxgTXCl2PNHouvoLp+yI2Q9dPPXtWEqSphlITM4Qc2+BvHx9S4nlQYgBfEVdqjdNnMFlT45RrvtoxnOqGrkZAUpGBcBfkollMgTsyuHdUYU+y2mNLhK0cxAA3Kms90qA/m5PxUVwom/3tqg0FR+/Eh4XaRMNjb87jfI74grHhpsY++vAX7upRUtc3oXV5JlOiJARu7uObRPEgfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/z29p81w8qe+vogII3CW3lyrnzgvpy9G4q3XcV8qb0=;
 b=CvrzuOjDtjUfiTrRHDPkCgRcROgY/Urv/aV0NPdLZleJKFYs0+ReDMART5DqADSFRvFvdhru8JgSJfG18lWGxYthnSoTQohTlxtXx6gA/VGDlSCYiPTzUi4teIO45NsZTzDhrOaIYi7p2/GW2n907dxylHO3IFfJWzTqppigP6E=
Received: from AS8PR04CA0144.eurprd04.prod.outlook.com (2603:10a6:20b:127::29)
 by AM9PR02MB7043.eurprd02.prod.outlook.com (2603:10a6:20b:264::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 08:34:42 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:127:cafe::c6) by AS8PR04CA0144.outlook.office365.com
 (2603:10a6:20b:127::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Wed, 24 Apr 2024 08:34:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 08:34:41 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 24 Apr
 2024 10:34:41 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 24 Apr 2024 10:34:41 +0200
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 264122170
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 10:34:41 +0200 (CEST)
Received: by pc58073-2410.se.axis.com (Postfix, from userid 20853)
	id 8533B410ECF9; Wed, 24 Apr 2024 10:35:08 +0200 (CEST)
From: <olani@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH v3] diod: Build in 32bit systems with 64bit time_t
Date: Wed, 24 Apr 2024 10:35:08 +0200
Message-ID: <20240424083508.824061-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|AM9PR02MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: a51ff88a-9661-4f74-226e-08dc643962fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K+/P0kM8nYYgUOAQz4NuGuZGp0pXLq2fCnXdS8gH+OoFGUmU1eDEyut/7Pig?=
 =?us-ascii?Q?YAbb3WBF7l/nRARVqCoRQ86P8PyQvuIH02leKzIlVndga9A7DrF6cvsNgD+2?=
 =?us-ascii?Q?q3aEQPYH362eZp4mIqlIH8XOv/R/vshXGF091sM45rhYRwvukzIm1B1taafo?=
 =?us-ascii?Q?ZIRrKHHoy5f4yy+9nIw0FgHW8BZauhXyEk+V46MBHMq8f1XCpVD9iBrz3kO2?=
 =?us-ascii?Q?j59y+bZE4kVzMDNDH3uCIkbANmBby3WZsv4mC7csUt74c00u0/cLq/we6ESQ?=
 =?us-ascii?Q?CltgcOiudUwFIPcEafJRBKSUg58aE0y/hqEMapq8TAQfuz8PrOLOGDG2iRIk?=
 =?us-ascii?Q?2zt5+LNrXVg9M/V4IXYFZCrS3joDbOPhU+DjoE2iMZOzcNwHZsBBtzeq4mxd?=
 =?us-ascii?Q?kaI9K4jDQqpp/dXbp3zpaOeu0EQdh3ZwCbZhz/R7RGyTEkoipJShpDGQpJA8?=
 =?us-ascii?Q?YDE0vvjjwcbp83rpHToNvscouf9jPb1tIs1ngbbUxex/QKEk8JFBRPqcO3sG?=
 =?us-ascii?Q?+bf4dXnlvDs2noo9SE8I+Bd9oANIcuLrpO7YeSstHyZCchAbcYYQqQkYFoHP?=
 =?us-ascii?Q?6zvRSRAiCOHGOF139u9WWMF/9I6UC7H36TSjhTDoX4r6+bwbdVRmygqGyzPt?=
 =?us-ascii?Q?fAqJj7Xl4zEm08n/sufy7EaF64bn2NZ3jSm5BhV7/mm0w51OfZ/7P+SyRqDu?=
 =?us-ascii?Q?eKx3rYkn5FwqKnMS3oPcXME+wGatZ/gmMQ7P6GbMzIi1/nynn3+frLf5ckqs?=
 =?us-ascii?Q?aHFPgIgnMn+UMHE2GJrVPp7h818ZIXxT17UZ3mJ+Rj1jeuGJ8WE8+V3hul9X?=
 =?us-ascii?Q?lDe5ZjagoHyW7P2qftVZDW2YNdJ++0TZEk6ZKfgMO0qVcmr6HVLXgJ5QF5Ut?=
 =?us-ascii?Q?DEvr+5nQwG+iGLy1YNjarNFRCVZvAmv89gNzK/bybOtVB7NfLSQX8Q0iPtil?=
 =?us-ascii?Q?8mRMYbg81jr/BT2PtJ5WfRWCFJoVcAP+Z1KFkc4mcZFNU8DX90OK08apAeO9?=
 =?us-ascii?Q?0tx6cgd3yOMRMqNNXz31+E2oKi7UWvGc8HG93Ah47cQy763tXTEd0kS6LIGX?=
 =?us-ascii?Q?wQqpCiqxj13qA1VFPENtrXmKrmhk8Ex5Du9iP0iQnQwe7/rpifI3AKDknHIe?=
 =?us-ascii?Q?BgjrIr/f1gpBZ/v8uL+0SshT7kcxqc5c/tH7JQbMLZlm/cnlXxzWB+/0URuo?=
 =?us-ascii?Q?Cj+mqgPb4ZmIvoXZOkiMUCVQXn4D6OE+0UZTZkjKHQgtjrV06i6WPS/omRc4?=
 =?us-ascii?Q?RDjPk3ps7LISDKUIImCZ2E7uqbAyy1Is0pJG8+/8bSXkvhlX+s5KWqD9EgPd?=
 =?us-ascii?Q?1Qq4T9O7R8x1c9yTLd0YZd0p6uNeCOOID6AeKc9GM/uIf3nEighCCSCFdMEg?=
 =?us-ascii?Q?oa4P9oqf0Jb3Eug5iOOW18rUtI0y?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 08:34:41.5773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a51ff88a-9661-4f74-226e-08dc643962fa
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7043
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 08:34:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8699

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


