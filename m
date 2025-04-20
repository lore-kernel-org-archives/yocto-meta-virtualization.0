Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0888C369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 12:46:41 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.88])
 by mx.groups.io with SMTP id smtpd.web11.8686.1745153196846014535
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 20 Apr 2025 05:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QiR/hiVL;
 spf=pass (domain: axis.com, ip: 40.107.241.88, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Crf8B370jh/BYQW7VlpmbRCHYXg4agsyV24GPmLT3jHw2+QrVZqIttns4+r5uj6UpffdOdi0daGIWc2j3BnzzvGldhNFxcO/yrhjTdYz6MJQFaKo+pp3Nc75WDOyf/1r8E8VUIO2T+e+GPby6j0NzNAbdaa7PIT/MGFtuiiDs+VrdV3tqcBEDOPyD0/sHQZ1TnDH2QjAt0xq+323j1mkRA9Lmj9smYFjQYIpo1hOlbLzDKwQMRLpEnX0lwlJO+uuJj3XRovgqVzZBrERDqsJdmsqUeK/DKYivs5/DO8U9UIsCp37QoUSItVHILIkD0D6LOKcEeoNQJ4Oh3VBCCYdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61d+hzl8UZCMcqk9XM4uC35ONzLB+VjJyr7LU30sU+8=;
 b=cBytthwowUXdQBWY7SiGbURtSATCW2GnqSIBVjNQgs0gP+uieHkGG/0gQzo0Yd2PiPNZQy2cUxnexvk8+b3tuiAyrFsrtTRz+tCd1IvtUMIVZ3q3MMAh5/Y6JKjWrkLSEud+XWaLmX1l7a3pFzw454TqiTjZKnkgJjGS8ZCDOjWPoLAPCTjmdp4PM6cQKCPp1FrzRz0H+zsh13r8JtIWYkLoAkV55XgFlUZ52RfLoToKwMUj/+2VpvBufp9aih9uJ8e1IkzKBOAe0iayJ6ptE9+9W0a7COBgVjQqS24POSw4iD6hqT0rYm4zqWXa3OqReOXLH8qNa2jOGOb9Ufg9vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61d+hzl8UZCMcqk9XM4uC35ONzLB+VjJyr7LU30sU+8=;
 b=QiR/hiVLpbpl/wbXcRwIn3ki1ZZPQemHIS+/cr9dDBi6QjVhjz1MXhowkrAWRjKYZ5+OyW+tlkdFh9fBnc3mZfezz+ENmkjO1G3/X7GD1BGCrUzUi8q19UJOSMrb4Uj/J3c6dm/vvhqKNq7EEANx29iwp+34vWRQYh8Y55QIH2I=
Received: from DBBPR09CA0037.eurprd09.prod.outlook.com (2603:10a6:10:d4::25)
 by DB9PR02MB7146.eurprd02.prod.outlook.com (2603:10a6:10:1fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.20; Sun, 20 Apr
 2025 12:46:31 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:d4:cafe::69) by DBBPR09CA0037.outlook.office365.com
 (2603:10a6:10:d4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.31 via Frontend Transport; Sun,
 20 Apr 2025 12:46:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Sun, 20 Apr 2025 12:46:31 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sun, 20 Apr
 2025 14:46:31 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 20 Apr 2025 14:46:31 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id F2147B7
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Apr 2025 14:46:30 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 53KCkUDh3820674
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Apr 2025 14:46:30 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 53KCkUuo3820671
	for meta-virtualization@lists.yoctoproject.org; Sun, 20 Apr 2025 14:46:30 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] yq: Correct the version (4.45.1+)
Date: Sun, 20 Apr 2025 14:46:19 +0200
Message-ID: <20250420124619.3820627-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D12:EE_|DB9PR02MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: a493b719-d4a3-41bf-c70f-08dd80096049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iFfFFkW/KhL+ADdPFBiLir917kxLo5Q7mXaFBpF8EL9iYpj/Vybvuzb4LTWV?=
 =?us-ascii?Q?prDbHr/hmfeTdwP2fYG4oo6uZQlgzYFShE9kcIcmqI9Rmi6HFECtxde7Z0uB?=
 =?us-ascii?Q?LUEQX7pwnr108fuQ7aUKG9z/3dKy1mBQybMTE9t2WzyspdUrnmBwU1iQB0pJ?=
 =?us-ascii?Q?Z7XhPEpo6oK/ii8WlmLkyuw7uQk91eRq9OfoL63o8lh8bHpKJQRUdoYFLOK6?=
 =?us-ascii?Q?7VaYk7GKpcDlXLcGmJH56Urjn7oMijdJRZApPLnjKUVSJyZVA9kFwddeoI36?=
 =?us-ascii?Q?VBXBbX4QrlSnVpxEO/UZEWuCqBhDrL02eHWXKL1pQwRlcp5asgYIJoOtTfa+?=
 =?us-ascii?Q?BcYQHrPBrT1OzUFaIGgbcZVuEU9hgsqGaE7albUzSr8J5DrVJhBQecF+TBf8?=
 =?us-ascii?Q?AATGnLBv6F0AJaWmokVMxGhhFZIhwyUaq+icMVqkiSxluIoyO8gDVYEiKhxH?=
 =?us-ascii?Q?xsHZ8wELHnhCqAESyQ58rUqsHRg1nRr/Do7HWHFBuNrXHDTSZVZGYt6iJJKJ?=
 =?us-ascii?Q?Sl6K1eaK0h0rpvK9PBC8KKlTowtwBIKQyeoaYVotORQgdRtP6jb/DkN3CQSO?=
 =?us-ascii?Q?ndVS7M7UE2LcayOotFa+pCYq09MMbf2aL/hKzIgyAsGTJfjjNaXJrRHgJL//?=
 =?us-ascii?Q?yhlN4EXGuqLS5JebwDpbA1jJZTxStgHcSA5Z7b6h5aNeohC34eyaNw/y51kp?=
 =?us-ascii?Q?h3XfkGIu+1LOL7KK4QdBHQNycbPPeGF/eErDP4f1zKWEJ4437a0gM0Jsulbn?=
 =?us-ascii?Q?uRT8Qnd6oUga0+/Y+Aj5flfBr9AUHaAktbj5ssY6+P+IwLnkxiFAEIG34a6V?=
 =?us-ascii?Q?cnjtDCZANMvKckcq/ydE1mBtcYU5tNg6fktqeD0le7Xw4VbovFqiaZGYrlv0?=
 =?us-ascii?Q?swF5D8/oxcpwdYulKN+s+4CAZ7gg6P6EScJdnqS0gM10OnM037evpI/iClHH?=
 =?us-ascii?Q?XWedk/YZzPCQbc/x/1f9i7LOn26B+Zs8l/sYwt3dnjB1MbutKKGXepQZYoJA?=
 =?us-ascii?Q?a2kiZi/jcVG4wwQT4863d3qegra6IQiG68CiVaKZZM3nI1fJxzXy5ufu7aKe?=
 =?us-ascii?Q?heuxIBzwhIV1uc5Fj8/1cpw8uw7qJIyyaX44MhHHrPlhEgI3/Y8wYK+ZjvTC?=
 =?us-ascii?Q?wcPQirRop4UFhDMIe3U306JKZ4Tx/SByHWw7DUmDhufYxmhvZ1qPzrjtRtO1?=
 =?us-ascii?Q?P+0yJs9hyPQXXXbDoZ/VqYQfytMvS/nfaDkajqEgbHDmn0Ro2Uz5wNjyjpVI?=
 =?us-ascii?Q?IxyPDOHHBvQkCl09FkWaOfOogYNIj2oKT+BSm+BvHKZScfykRbzMFb7BnQfx?=
 =?us-ascii?Q?wqin7xi+4pI6b9F9lhRw2F47xJveFZaIRBZfaaT3kaiaDBnTf/+d1hOYjRsR?=
 =?us-ascii?Q?8u7c9fxcHVnZLRl06JqfLTbu2f0H0yZfIq0gfnfohcRwq86mRxT+LhEJSPcw?=
 =?us-ascii?Q?ABQ3WOKDB+ilkviez2jZn7GfIPOV3pjrXRmCqSDIMqM41vcmT3tLDQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:46:31.4518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a493b719-d4a3-41bf-c70f-08dd80096049
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7146
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Apr 2025 12:46:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9232

The current version of yq is actually based on 4.45.1.

Also remove ${SRCREV_yq} from PV to allow `devtool modify yq` to work.
And remove the do_compile:prepend(). It is not needed and removing it
allows yq to be built after devtooling it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

In addition to the changes in this commit, I would also suggest setting
SRCREV_FORMAT =3D "default" to only include the SHA-1 for yq in PV. I do
not see the reason to include the SHA-1 for the color module when the
SHA-1s for all the other modules are not included.

 recipes-devtools/yq/yq_git.bb | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 0e9d36ca..f934e2b2 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -1,4 +1,4 @@
-SUMMARY =3D "a lightweight and portable command-line YAML processor "
+SUMMARY =3D "A lightweight and portable command-line YAML processor"
 HOMEPAGE =3D "https://github.com/mikefarah/yq"
=20
 LICENSE =3D "MIT"
@@ -81,32 +81,18 @@ SRC_URI +=3D "git://github.com/alecthomas/participle;na=
me=3Dv2;protocol=3Dhttps;nobran
 SRCREV_mousetrap =3D "4e8053ee7ef85a6bd26368364a6d27f1641c1d21"
 SRC_URI +=3D "git://github.com/inconshreveable/mousetrap;name=3Dmousetrap;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor/g=
ithub.com/inconshreveable/mousetrap"
=20
-PV =3D "4.30.8+git${SRCREV_yq}"
+PV =3D "4.45.1+git"
=20
 GO_IMPORT =3D "github.com/mikefarah/yq"
+export GO111MODULE =3D "off"
=20
 inherit go ptest
=20
-do_compile:prepend() {
-    # arrange for some of the golang built ins to be found
-    (
-	cd ${WORKDIR}/build/src/
-	ln -sf ${STAGING_DIR_TARGET}/${prefix}/lib/go/src/cmd/vendor/golang.org .
-
-	cd ${WORKDIR}/build/
-	ln -sf ${UNPACKDIR}/build/vendor .
-    )
-
-    # arrange for the fetched dependencies to be found
-    export GOPATH=3D"${GOPATH}:${WORKDIR}/build/vendor/"
-    export GO111MODULE=3Doff
-}
-
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
-    cp -r ${S}/src/github.com/mikefarah/yq/scripts/* ${D}${PTEST_PATH}/tes=
ts
-    cp -r ${S}/src/github.com/mikefarah/yq/acceptance_tests/* ${D}${PTEST_=
PATH}/tests
-    cp -r ${S}/src/github.com/mikefarah/yq/examples ${D}${PTEST_PATH}/test=
s
+    cp -r ${S}/src/${GO_IMPORT}/scripts/* ${D}${PTEST_PATH}/tests
+    cp -r ${S}/src/${GO_IMPORT}/acceptance_tests/* ${D}${PTEST_PATH}/tests
+    cp -r ${S}/src/${GO_IMPORT}/examples ${D}${PTEST_PATH}/tests
 }
=20
 RDEPENDS:${PN}-ptest +=3D " \
@@ -114,7 +100,7 @@ RDEPENDS:${PN}-ptest +=3D " \
 "
=20
 RDEPENDS:${PN}-dev +=3D " \
-     bash \
+    bash \
 "
=20
 BBCLASSEXTEND =3D "native"

