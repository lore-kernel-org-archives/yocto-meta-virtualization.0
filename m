Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635AAC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:00:47 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.48])
 by mx.groups.io with SMTP id smtpd.web10.87486.1705338041725459570
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Jan 2024 09:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=NgqpkHnc;
 spf=pass (domain: axis.com, ip: 40.107.241.48, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZX/S9rQBWU8fv3CMLZhwgZYuinut0ZGXIGTk/uSd/dxaGvRr3NwVmMcGNpj2rYJl8I8Sy9aU7yOdWkUpFDm1TaW5/DXgS1k6ZmQYqRj2QNSCs2vAaIOiAXoUqp5rLT0lszLCIwGTBVaXLQ1gh0LZdrDeAjVjhipK/p2xoluPqyPsZxL+putgMmMIg1Hu3W8FXzdoZe5LEqqptwJHN6CX2wB3hXWM9gZfGixpyZvxow3uF5dvMqNIwRd294vZi5L1tRrh4oV76EwVXA2CLHKP3skjWadGOw+vRR3KKTOX6SRdJFvKRXjPyqAPMDCTYrFI77b6t5e7yVTJTry7z5sZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ye+SFo3M7w0QztEyOS61qy7t6Wt6OIMJXLVDT2ZhyjA=;
 b=K2SdZAdk2N1sVqV3UdretWa85va2LizE5//lKTbU+jhye5PIfmObBa/Ki7H4YROBXVpjWLhZOq8if4MdmAbpdGEpLDuOTbTwNtryeuXXDqhOo8ucXk6UXK6IZxmMkWzWB9F3prfP7R8DixrzBuKnJCwEZ5ZC4wu/v23kYzt/SokJpgl4n2BZB5m8dVO+OCbzAKUIS8e61fVszfOM61/JTgm50s61IsBlS5xL2piNScswRfRBXGHvdGhSxBp6j/cfA7uQXRnRL2srwGKXjaf+on5moJ9Lh9ARpxqWdj2arpDGEvtsIoPUGzpPrGjoY/jIQWIoCrAY/rC7Et0Z7JDtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ye+SFo3M7w0QztEyOS61qy7t6Wt6OIMJXLVDT2ZhyjA=;
 b=NgqpkHncsw1r/4kNNMsDaytKh6gxz69srXJKQM0E8dn2GWOP7hWcA0YUczBQTMhYeH5WgT5uXLCFQkS1q+BOQ1Q2uiUk46yU+xqsty4gLz2TzglVcQr1agQWHVzliZqme6AUf3x9byxeJg40eFWyDW4DM+RBUxW+AFab/ZSdPKk=
Received: from AM6P194CA0028.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::41)
 by DU0PR02MB9677.eurprd02.prod.outlook.com (2603:10a6:10:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 17:00:37 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:209:90:cafe::4d) by AM6P194CA0028.outlook.office365.com
 (2603:10a6:209:90::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23 via Frontend
 Transport; Mon, 15 Jan 2024 17:00:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 17:00:36 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 Jan
 2024 18:00:36 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 15 Jan 2024 18:00:36 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 616421230A
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jan 2024 18:00:36 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 40FH0aZ73531518
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jan 2024 18:00:36 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 40FH0ZM03531517
	for meta-virtualization@lists.yoctoproject.org; Mon, 15 Jan 2024 18:00:35 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] containerd-opencontainers: Use RDEPENDS:${PN} instead of RDEPENDS:${BPN}
Date: Mon, 15 Jan 2024 18:00:30 +0100
Message-ID: <20240115170030.3531505-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78E:EE_|DU0PR02MB9677:EE_
X-MS-Office365-Filtering-Correlation-Id: aa13d321-7adb-41f8-044f-08dc15eb7ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GlrAEZMYEk47nbeppWXXuFbbw1pw2ysfpXMMI9yK6E5UeyO4OgZVXhklda/6qW/cc3ThgHIjljl/5FMgF1flmqE4NLzT3OmZItfnokx8KDflBvC+3n8pkqxUc8ce7t6kSD2hYtGTtRHPFTX7KSe5jmDUhJ/ixfybRkbDo+0OQJmmEr3/UCxGxfAkZV8gsxt0XW1ykNz+pfApSlQ0FGpKaT1/WtcU5b2tQ1DnM3pqK4O4qGYWMAM2tu274yBsRxGEk5LvnVU/b04O1VFjMItZIZZA8uNer5GyH56bdqOhgsxYNKHgah/e19m2BxVUDMyu5KSS5NRNDtqAqslHMAUw0hGj30AyFS4dveWD/CjesbDIDt8Ghg7OGwaSERAvh/10VCH0jHQbXlWU4KNEnyo8JTafVdcwoBCLloG0mn7m0/XvEtQpRvSM8Ernkn2HArHTvwI0yTKp/R1v+8Gg/ld+R0mVf//gMXu2Gvj1KN7AFNcAD1r/xWdfVdNb/S+/frNG3pH6DZqbpqrf3gryzYKTr9znK8dc4MC8iaGtHc+o3ZPiwYTg82Z0gwGMczvyXBwSfNcRefqopGPRrfsTdzCA1JduAaC/eRgRcN2lqZ17OFQGzV2E9Fh7v1jeRgsrL6vXdWcZW2wloGk5xTi/bF5caBv6M1UzsOagkj3meNBM/AQW5Yf7JAW5F2M7yvpCN0qCHzBg+jiHIGItWTp3IhX6ZcCabgy2Ug8Ibp8ypoZo+d2f1HNgYSfk/P6TZASzX8qsceYtO/zVGfqND8OEn/VclgaLcx2gYsvQLRalg2+WzwlAGLL8qcKm8Bxr3KzZ8+dRnnIEghJDxykM9UnrVgNT5A==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(230273577357003)(230173577357003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(40470700004)(46966006)(36840700001)(83380400001)(26005)(336012)(426003)(2616005)(6916009)(82740400003)(36860700001)(8936002)(6666004)(1076003)(47076005)(5660300002)(41300700001)(2906002)(70586007)(316002)(8676002)(70206006)(42186006)(478600001)(36756003)(356005)(81166007)(40480700001)(40460700003)(36900700001)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 17:00:36.7728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa13d321-7adb-41f8-044f-08dc15eb7ec4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9677
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jan 2024 17:00:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8538

This avoids the following warning:

  WARNING: .../containerd-opencontainers_git.bb: Variable key
  RDEPENDS:${PN} (...) replaces original key
  RDEPENDS:containerd-opencontainers
  (  ${VIRTUAL-RUNTIME_container_runtime}).

if, e.g., RDEPENDS:${PN}:append =3D " ..." is used in a bbappend or
bbclass.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 recipes-containers/containerd/containerd-opencontainers_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb=
 b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 5c1e127..1dadf28 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -95,6 +95,6 @@ INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
=20
 COMPATIBLE_HOST =3D "^(?!(qemu)?mips).*"
=20
-RDEPENDS:${BPN} +=3D " ${VIRTUAL-RUNTIME_container_runtime}"
+RDEPENDS:${PN} +=3D " ${VIRTUAL-RUNTIME_container_runtime}"
=20
 CVE_PRODUCT =3D "containerd"

