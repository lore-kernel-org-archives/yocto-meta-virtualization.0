Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42ACEE4983
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 09:31:42 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.49])
 by mx.groups.io with SMTP id smtpd.web10.17956.1726047095951179499
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Sep 2024 02:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=VphCK49x;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.49, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9lHtZM1Fgy2pDis9AHWtNAmqJUZIeHpnGLpzNMo5Ziqlg78Wuqg9fPwhMf9sGW0fOgYVSN7dNuvTcRS9TEC4FLM52gY2YtG3+scvxHoZKczzf11ZEUALNVxs8U52uRG+aq0WOGtRoTUXAYs5ng2oMtCVeGqYDMfOw839Ie6uOztoMWe6jZwI0s/kjd5K9jBVovQeUk5WerWX4v9KzpIlcejpRyumzoHi7cA8zG02En5PgAiH4tU4dshR9a3079BCxaLC68OTnkFdBqg7qSMUIKMOdTp8Daq7iJM9mwIgak3d04ThXb3c9/808olFxW7X3pFKDu4jkNCNQmsyWvq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZZSKIFUfLob2v0GVNa2wSDls/3E7BKaPC1cmBCH5w0=;
 b=WEHCX5h82xne+8ggO9nmacNPdqgAnJH4ixC2Tbd6Gq76TBLiLez4M69BUxCbCflMCovMkmdTVH4yhtLYuiUSIt29Ey/rBm7eus1HXIH6k2uO3LeC8rzNNMxN8vlUXZdUWMIoPriwDzT7IdLHYqnkydUXsWb5tmf/aiyfxZ2diNayabSGVZutl32ZWMkiCHLo91+Pr8p+dsmTf+PZ5mxNNs3RrSTB8Ev9/zQV2afojcfknraE1J7JGRJEuOK04vIbwM0Ml+13e0JwW7vN6khaZEDCjVxC47MqgbqMEKqkiQ62z8LC0s7kwctXbZfNnC+BOLlcbib9uKIN0gjsUZ3iVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZZSKIFUfLob2v0GVNa2wSDls/3E7BKaPC1cmBCH5w0=;
 b=VphCK49xV6tJJ/HjZolgeX2jKhu31Iq+OmAW62e6fZekDjjwOZb5BaxYjCpPPjF9jo9f/EO0KmF5DzE/+46n+/u3zP4BXo/N2+ssqdTY98SIUgsV2SvzAAiQAycNnl7xQJfC1i+M5HwCvonP7nbEsuuxlsyH1zxmvs3qR8TqyaU=
Received: from MW4PR04CA0102.namprd04.prod.outlook.com (2603:10b6:303:83::17)
 by MW4PR12MB8611.namprd12.prod.outlook.com (2603:10b6:303:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Wed, 11 Sep
 2024 09:31:30 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::dc) by MW4PR04CA0102.outlook.office365.com
 (2603:10b6:303:83::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 09:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 09:31:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 04:31:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 04:31:29 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 11 Sep 2024 04:31:28 -0500
From: Michal Orzel <michal.orzel@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <bruce.ashfield@gmail.com>, <christopher.w.clark@gmail.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [PATCH] xen: Fix XEN_REL of xen-tools_git.bb
Date: Wed, 11 Sep 2024 11:31:07 +0200
Message-ID: <20240911093107.85557-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|MW4PR12MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0dbcc7-7c63-4ef2-d703-08dcd244849d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H0onnkGyskPplbQ1cvS0QSwFWxe5vjLzh5Hr5UeepbjrmcQvGlOSn8oGIFtc?=
 =?us-ascii?Q?R8ADgYH/q4S80A8LmLlAHfQRselh7EoEMj93AAihsl/gzgAwp2oTftSjobTK?=
 =?us-ascii?Q?+Kti0r+TPBRjxnSXacXE7yYJhYOrBb1KSi7in5ZGpDy/Ulb2Vd76rp6bnudq?=
 =?us-ascii?Q?CSZay+EE6LVJ+euNqUdf+Ifmo0h8GB7y8+aQTSFLLylPaQF1JTG+NCSx0NTe?=
 =?us-ascii?Q?TDbm/nvy4sTTdYAdXdM2sXEW5SQL1ptJBDavbUgfH307NTgQQ/4xVMbl+W47?=
 =?us-ascii?Q?+GMm61lW7Pq4P2t7EYurYRHy1GruqUyiU5lqlUGqaeAMY5foy2/+MHG1fQEO?=
 =?us-ascii?Q?R/0vuJWx5BmR4R15rRGPOAbfix2h7K4bFpk6I+gMzsFiCzVoBOyKfJoprQdI?=
 =?us-ascii?Q?pR57tiqGhtc3xnjFl9Jxy7/XWi+0Hd2VdwNzQV25ahmQnFroX2aqx+lgvptV?=
 =?us-ascii?Q?mBl6RRqtVokCPUWKW1vgzsHVXtF0Y3KDHaAeQrZGqxCYfMUGiVXQ+BJEp+dZ?=
 =?us-ascii?Q?WEGa97e+wEBnkIMYsSqyL+qkomW2oYXPgj9YyxDomZwsFITnm3xx+1HeFxL4?=
 =?us-ascii?Q?gQkgX+D4FekbNre9ji0rJznoF+IvIUyB4Gqh4wtBiMSzFoKaotAh16mi3qRe?=
 =?us-ascii?Q?lVCNm1NjAL3uOOWJxw8Oj2Ss3NX3rlnHG+x6I3oWSpAfAT2YY2WGEHkm62By?=
 =?us-ascii?Q?XXp8A5WG9XSBxHZOUL00g6nji0eodSXbSIQfs87PlhhnpD8r0Dd56riIPgcm?=
 =?us-ascii?Q?1J8PXHyXB3j9xqlGTxKc25RnMGEhQviZv3OiwE0WXla1RL6wcDJmYDMtNUF0?=
 =?us-ascii?Q?6gYGtO2vntj8yXeteFelKnVSuX0iL/jw1Vm1Fqw/3r8KIShgMKPjZQpmi/fl?=
 =?us-ascii?Q?CR37N56X+92N7WGsQnyZZcQr/XZ6RYKRi5dFwgA/WAJwjM11psEamPXljaYA?=
 =?us-ascii?Q?8NXjEFj33BVyYn5mY33k8LYw7Xq6tbk3z9P2as61CriVRAfxS+oPXEkf8Xik?=
 =?us-ascii?Q?ug3ap4vzU1tCrU7GyEgLir5mM1VH3gXRiKPvCqSTXDkZJhNlZlw1aT2APstv?=
 =?us-ascii?Q?L9m65DwBtU0f6dYf+XwGR7jqWWfDgxnQbw1Ke9RbsfDoY6HSYh6Q37NzQak6?=
 =?us-ascii?Q?peBOv5KVHUtQobtAK8Zc63YbspABO2bRYlYXpnfHKXPHpfTtkOVchjzxWRyV?=
 =?us-ascii?Q?QY9kgJl3MadtA6Wt/pIgGEdhD9e4KmIglzPwu6SpZsbXHbxz8Z2IaI66TrVH?=
 =?us-ascii?Q?sU/1vapbX+u3d3IJFCj7Z8fqcRxE4T2y0N/WLgg45tmd+/Se7mtk80ZyhdLI?=
 =?us-ascii?Q?Rw6Qn7MdytBerzJ+yEx0VliW+3OJdwgfzWncvdgp3O/rstwi0jGGsbTZyXxu?=
 =?us-ascii?Q?MhX5BrdajfRKWbuPXpdwmYKB8VBxqD+VxlrRvhIK2dsrSUzuX2UvgB3T9cqC?=
 =?us-ascii?Q?pk32DR0TFSeH1wSjmWWCyYZsLy/gCXaR?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 09:31:30.2438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0dbcc7-7c63-4ef2-d703-08dcd244849d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8611
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Sep 2024 09:31:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8878

It should match the master recipe of Xen hypervisor which sets XEN_REL
to 4.19.

Also, take opportunity to remove no longer needed patches.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
We could also update xen and tools to 4.20 right away to reflect the curren=
t
development version but I'm not sure if we want to do it at this point.

Unrelated question:
When vmsep is enabled, the tools recipe RRECOMMENDS qemu-x86_64 and qemu-i3=
86.
What is the reason behind it given that the only qemu that is needed in the
target rootfs for Xen is qemu-system-i386? What would be the best way to bu=
ild
only the QEMU required by Xen (upstream) and not all the possible combinati=
ons?
---
 ...ython-pygrub-pass-DISTUTILS-xen-4.15.patch | 73 -------------------
 ...enstored_control.c-correctly-print-t.patch | 34 ---------
 recipes-extended/xen/xen-tools_git.bb         |  2 +-
 3 files changed, 1 insertion(+), 108 deletions(-)
 delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DIST=
UTILS-xen-4.15.patch
 delete mode 100644 recipes-extended/xen/files/0001-tools-xenstore-xenstore=
d_control.c-correctly-print-t.patch

diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-x=
en-4.15.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTIL=
S-xen-4.15.patch
deleted file mode 100644
index 476f5ddcf1c6..000000000000
--- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15=
.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 6db88791d923167f160afbcadeffad84a4cbdbc5 Mon Sep 17 00:00:00 2001
-Message-Id: <6db88791d923167f160afbcadeffad84a4cbdbc5.1612262706.git.bertr=
and.marquis@arm.com>
-From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
-Date: Fri, 19 Oct 2018 11:01:37 +0200
-Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py args
-
-Upstream-Status: Inappropriate [oe specific, python install issues]
-
-Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
-as well as other parameters set by the OpenEmbedded build system.
-This is especially useful when the target libdir is not the default one
-(/usr/lib), but for example /usr/lib64.
-
-Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
-
-Forward-ported to Xen 4.12.0
-Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
-
-Modified to support pygrub installation with python 3
-Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
-
-Forward-ported to Xen 4.14.0
-Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
-
-Forward-ported to Xen 4.15.0
-Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
-
----
- tools/pygrub/Makefile | 7 +++++--
- tools/python/Makefile | 2 +-
- 2 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
-index 37b2146214..ffb9270065 100644
---- a/tools/pygrub/Makefile
-+++ b/tools/pygrub/Makefile
-@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
- all: build
- .PHONY: build
- build:
--	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" LDFLAGS=3D"$(PY_=
LDFLAGS)" $(PYTHON) setup.py build
-+	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" LDFLAGS=3D"$(PY_=
LDFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
-=20
- .PHONY: install
- install: all
-@@ -18,7 +18,10 @@ install: all
- 	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" \
- 		LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py install \
- 		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
--		 --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
-+		 --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force \
-+		 $(DISTUTILS_INSTALL_ARGS)
-+	rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
-+	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
- 	set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
- 	             "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
- 	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
-diff --git a/tools/python/Makefile b/tools/python/Makefile
-index cc76423647..5cb11ae453 100644
---- a/tools/python/Makefile
-+++ b/tools/python/Makefile
-@@ -12,7 +12,7 @@ setup.py =3D CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHAR=
ED=3D"$(CC)" LDFLAGS=3D"$(PY_LDFLA
-            SHLIB_libxenctrl=3D"$(SHLIB_libxenctrl)" \
-            SHLIB_libxenguest=3D"$(SHLIB_libxenguest)" \
-            SHLIB_libxenstore=3D"$(SHLIB_libxenstore)" \
--           $(PYTHON) setup.py
-+           $(PYTHON) setup.py $(DISTUTILS_BUILD_ARGS)
-=20
- .PHONY: build
- build:
---=20
-2.17.1
-
diff --git a/recipes-extended/xen/files/0001-tools-xenstore-xenstored_contr=
ol.c-correctly-print-t.patch b/recipes-extended/xen/files/0001-tools-xensto=
re-xenstored_control.c-correctly-print-t.patch
deleted file mode 100644
index bf99f5e8c54c..000000000000
--- a/recipes-extended/xen/files/0001-tools-xenstore-xenstored_control.c-co=
rrectly-print-t.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c7c43c4531fe1cd188f62d9905c3f5c7a29a6fb0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 12 Apr 2023 10:30:18 +0200
-Subject: [PATCH] tools/xenstore/xenstored_control.c: correctly print time_=
t
-
-On 32 bit systems with 64 bit time_t (hello, Y2038 problem),
-the following error occurs otherwise:
-
-| xenstored_control.c: In function 'lu_reject_reason':
-| xenstored_control.c:646:70: error: format '%ld' expects argument of type=
 'long int', but argument 5 has type 'time_t' {aka 'long long int'} [-Werro=
r=3Dformat=3D]
-
-Upstream-Status: Submitted [by email to xen-devel@lists.xenproject.org and=
 maintainers as suggested by add_maintainers.pl script]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- tools/xenstore/xenstored_control.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored=
_control.c
-index d1aaa00bf4..8d318c0399 100644
---- a/tools/xenstore/xenstored_control.c
-+++ b/tools/xenstore/xenstored_control.c
-@@ -643,10 +643,10 @@ static const char *lu_reject_reason(const void *ctx)
- 	list_for_each_entry(conn, &connections, list) {
- 		if (conn->ta_start_time &&
- 		    (now - conn->ta_start_time >=3D lu_status->timeout)) {
--			ret =3D talloc_asprintf(ctx, "%s\nDomain %u: %ld s",
-+			ret =3D talloc_asprintf(ctx, "%s\nDomain %u: %jd s",
- 					      ret ? : "Domains with long running transactions:",
- 					      conn->id,
--					      now - conn->ta_start_time);
-+					      (intmax_t)now - conn->ta_start_time);
- 		}
- 	}
-=20
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/x=
en-tools_git.bb
index 8397178e8d4b..b443b13eeab3 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -1,7 +1,7 @@
 # master status on 2023-05-26
 SRCREV ?=3D "03cf7ca23e0e876075954c558485b267b7d02406"
=20
-XEN_REL ?=3D "4.18"
+XEN_REL ?=3D "4.19"
 XEN_BRANCH ?=3D "master"
=20
 SRC_URI =3D " \
--=20
2.25.1


