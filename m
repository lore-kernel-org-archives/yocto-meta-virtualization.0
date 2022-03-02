Return-Path: <kamil.dziezyk@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D918C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 13:57:17 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.47])
 by mx.groups.io with SMTP id smtpd.web08.7320.1646229435312073209
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 05:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=0yOB/SE6;
 spf=pass (domain: arm.com, ip: 40.107.0.47, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eQBMeXxfr+jLJPJFZ3kLjE38pyz5OMLUoId24K0o0A=;
 b=0yOB/SE6d3uVigUU8TWNZ7/yS9ey3aG7NUPeFGyx1sOC0Lra2ozI2DtI9ojWVPSdCkRAajCm8V9eEXJEtsxW44NztDYAqSLi2FoE2plnYY2/Qx+Me734ajrKrwapMfFoWbXVI9X3bkmv4mw7JMBQe4rleQo2TT53sc/ZdmMbqXM=
Received: from AM6P194CA0051.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::28)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 2 Mar
 2022 13:57:10 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::b7) by AM6P194CA0051.outlook.office365.com
 (2603:10a6:209:84::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Wed, 2 Mar 2022 13:57:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Wed, 2 Mar 2022 13:57:10 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Wed, 02 Mar 2022 13:57:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d0430b163d2cab9b
X-CR-MTA-TID: 64aa7808
Received: from 7f81364d583b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7C309BF0-A354-4104-A27D-3F38DFE6292E.1;
	Wed, 02 Mar 2022 13:57:04 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 7f81364d583b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 02 Mar 2022 13:57:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlQi3fvLN7Q8jciUOabef7woMFdXZ2lri1nJ0LZhnCsaHtE2O3COV7kTjcH6Sq7HyABpelxkX3I0Dez1p4s9vVUBxKb6IifxAb61MGERffCBZ1SlSk3hehZju0KH0Cs1yYP43cALcrdhEVsaOkyXxja9k6j0+GD6WtID3X1yDhFTPP6lNjihBXZ0C4kxsk9Iwc5iWJUaJ5wSsK12WKvYisDc8/XECOJyp8m5T31Q0BvGBagtVTsuXtJ3SaQ9Rh+5kyRL9tmxCfUBTIKHRjiCMtgzxUWsEVKfxiwdbsesmFIINuuAHPIWp9e8KAjMe+o7OmSFsKM5DtSoWKt5OZcbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eQBMeXxfr+jLJPJFZ3kLjE38pyz5OMLUoId24K0o0A=;
 b=UF6W4P8a6VgmhfoGS/072SkP31rvRFV6Ba8eOiRaUsU92jWDR7c/jjPzV3eklnhHAQp6mFzTJU4hIq4Lu7vPVnItQbkoZ/2UStwLvFSdyGsumvGxW7G65RlzSTX3lS6z8u8c+QuxHy+/7XI/stwDmuzZuvQiVu7KepSU3kf0uC66it0LxJWgC3ql2qmq28f6fpeCQ9rzaYU4/9DxYe19dQ+NajyH1JORlKBoS5zQwaxEBYn+D3ROQta9W0lA+VzwvAwPuPfTCms2Y/tWdpvqgz0q26iiarowUnUd1Ns6K9KWqUuR2vWodmwTh4CfjrZ2Xe+CWt7NQcNF6v0NulLj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eQBMeXxfr+jLJPJFZ3kLjE38pyz5OMLUoId24K0o0A=;
 b=0yOB/SE6d3uVigUU8TWNZ7/yS9ey3aG7NUPeFGyx1sOC0Lra2ozI2DtI9ojWVPSdCkRAajCm8V9eEXJEtsxW44NztDYAqSLi2FoE2plnYY2/Qx+Me734ajrKrwapMfFoWbXVI9X3bkmv4mw7JMBQe4rleQo2TT53sc/ZdmMbqXM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by VI1PR0802MB2365.eurprd08.prod.outlook.com (2603:10a6:800:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 13:57:01 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::154f:63b1:4cd9:cf1c]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::154f:63b1:4cd9:cf1c%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 13:57:00 +0000
From: Kamil Dziezyk <kamil.dziezyk@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH] xen-*image-minimal: Install
 *xen-acpi-processor package only for x86* machines
Date: Wed,  2 Mar 2022 14:56:24 +0100
Message-Id: <20220302135624.3012-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::21) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: e65d94e5-7533-49fb-9a61-08d9fc548c1d
X-MS-TrafficTypeDiagnostic: 
	VI1PR0802MB2365:EE_|AM5EUR03FT045:EE_|AM6PR08MB4691:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB469160ABF89E277C2B99EBB0FD039@AM6PR08MB4691.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
Content-Transfer-Encoding: quoted-printable
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 K/REbRd7Ye8ODyRJhFOntEifHODRv5zFb26E5nasLb6ORuOy1T9CbvTK1ZAv6UErQE2oKuhf3jNpFFt6lSJA2I/iQzVqqwjPdRHqQkqUZ6uYLn9MWzsNkjFjFl3ZnoU6fyiD9jaSE7G4k0TYDQnUolJzpfjyDJGh1YikFnfFRNIfnOJs4yXCJYV4BsyYgBMEDyyY6aPoq4LBWdeWb6AXoYOEmiCQDsfYWzIu6294etS69wb+8Fgm6Sfof8BN6bVXK4KzT/rNXENdc+aZecW8FvLiXmf7T8RHzf4riHNDSodSu2x8lEmv3XZX4FK/LMMgroP2nMZjW1XclB/vHrdLImPtYw91Tg9XGNsiiZoZExfxWG6GNALBHwdtdLbqM2aPqFWbFLDs2Q9+jxxf7tiIaHYjhe3BLA9fh+6GXqPnYS8O/M/lwZb0OXhP1F6UHrRULhO0PrvsY3VjsW3JPJUfwkbtlTDVuH6sSfP2MGhOGRs89gepgWW0OY8r8pEzOxDCr7d86IT4MqEqNMj9HcI1VF8c8kHBRVMfHONSQswPShYIWgmtFGWfS3wsyk7la4H7f5PREBTNiz2UVcHRVO/QIAEjVLCeWibgnABTccxSVQpn5uJO75cwwQ8df0/kV0F/s1e9sp7NeE5qSkAb+1Y2PPk3fJ5HAWE0MQ/XWGqFSHUBuJfVh5XyJ9IKPrFogm4p1w8n8yJh/dtIC+snh//jqw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66476007)(38350700002)(508600001)(38100700002)(66946007)(2616005)(6486002)(316002)(6916009)(86362001)(6512007)(6506007)(1076003)(8676002)(186003)(52116002)(26005)(6666004)(2906002)(5660300002)(8936002)(44832011)(83380400001)(36756003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2365
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cbf8ab0f-2a89-4500-0398-08d9fc548576
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hA2ADbnoeJ0YgVJjpA1OL0gskv3cjAYeEvTJSsj8IeGbU0JSRPHpGuZX2WoV7PtGlF6JEGr+OfONh5FKMzIngOlqHm5QLYPlcayhFCdy+CbBdMmf62Oxkv1CSHpB1TASoX3yq5x4CexsomoNSvhT/eBxxcVd6bIpeLwC4SrNpoh9ZQzFRKASm5iHxq91SFw9URqIll+4AVamyiV46LU+YWx5FuFOHn4EUq8smp7gYfGRHxQ9TUqk+e/iUuWVy0MuDfLZqB2n6VW0iUQ4/xGM8M6XxbOx8Lj+G67ogMApNP1834TAwHRmG6RiGa7HwiISrNbmsvip3dV6HKV++pNMCQTBIVnt25ws9HOnc1ehn1dhXgEnLxJ7e8qTW7vgdZ5znqQNYzFjlLA+xfadO6Cmln64ImiQcBmxs1I+Ws7F1AG95Q6hBUCHA4fdkh6vkUXTMNxXB6qPP7CPA1tBq4DxqbT8x+eafbg/sjKdCOQF4YgATHhXogo0ZSXd+Z77lkslLDN/zH6wQ8EEqHXXXYkQ4waPrnRpgQC43MNeiK/N8YKmfGfbNgPHZztRuf27hGEfwwLJO/FpMNKWWWtyWUlAh03/fotIYJN9CmNVDJNirrwXMFrji3ldDY9GxEb/Tce29O7xdNeHDgF9Jvrt7hoaGc9Wmt2HHnU0pLYgCAjargvrp/vr7aHKKVI5banZQFmm
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(26005)(186003)(36860700001)(336012)(508600001)(6512007)(2906002)(2616005)(5660300002)(1076003)(44832011)(107886003)(82310400004)(40460700003)(356005)(86362001)(6486002)(83380400001)(6916009)(81166007)(316002)(47076005)(6666004)(6506007)(36756003)(8936002)(70206006)(70586007)(4326008)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 13:57:10.7213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e65d94e5-7533-49fb-9a61-08d9fc548c1d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Mar 2022 13:57:17 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7070

Kernel module xen_acpi_processor is built only for x86* architectures,
therefore 'kernel-module-xen-acpi-processor' package is compatible only wit=
h
x86* machines.

Issue-Id: SCM-3892
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: I8dde00e3c78a1f9eea50b19fbc1981f5e26df133
---
 recipes-extended/images/xen-guest-image-minimal.bb | 6 +++++-
 recipes-extended/images/xen-image-minimal.bb       | 5 ++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/images/xen-guest-image-minimal.bb b/recipes-e=
xtended/images/xen-guest-image-minimal.bb
index ca111b4..fced763 100644
--- a/recipes-extended/images/xen-guest-image-minimal.bb
+++ b/recipes-extended/images/xen-guest-image-minimal.bb
@@ -4,9 +4,13 @@ inherit core-image features_check

 IMAGE_INSTALL +=3D " \
     packagegroup-core-boot \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-ac=
pi-processor', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', '${XEN_ACPI_PROCESSOR=
_MODULE}', '', d)} \
     "

+XEN_ACPI_PROCESSOR_MODULE =3D ""
+XEN_ACPI_PROCESSOR_MODULE:x86    =3D "kernel-module-xen-acpi-processor"
+XEN_ACPI_PROCESSOR_MODULE:x86-64 =3D "kernel-module-xen-acpi-processor"
+
 IMAGE_INSTALL +=3D "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' xf86-v=
ideo-fbdev', '', d)}"

 # Install xf86-video-vesa on x86 platforms.
diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extende=
d/images/xen-image-minimal.bb
index ea596ce..f6fa5ed 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -5,7 +5,7 @@ INITRD_IMAGE =3D "core-image-minimal-initramfs"
 XEN_KERNEL_MODULES ?=3D "kernel-module-xen-blkback kernel-module-xen-gntal=
loc \
                        kernel-module-xen-gntdev kernel-module-xen-netback =
kernel-module-xen-wdt \
                        ${@bb.utils.contains('MACHINE_FEATURES', 'pci', "${=
XEN_PCIBACK_MODULE}", '', d)} \
-                       ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'k=
ernel-module-xen-acpi-processor', '', d)} \
+                       ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', '$=
{XEN_ACPI_PROCESSOR_MODULE}', '', d)} \
                       "

 IMAGE_INSTALL +=3D " \
@@ -28,6 +28,9 @@ IMAGE_INSTALL:append:x86-64 =3D "kernel-module-tun"
 XEN_PCIBACK_MODULE =3D ""
 XEN_PCIBACK_MODULE:x86    =3D "kernel-module-xen-pciback"
 XEN_PCIBACK_MODULE:x86-64 =3D "kernel-module-xen-pciback"
+XEN_ACPI_PROCESSOR_MODULE =3D ""
+XEN_ACPI_PROCESSOR_MODULE:x86    =3D "kernel-module-xen-acpi-processor"
+XEN_ACPI_PROCESSOR_MODULE:x86-64 =3D "kernel-module-xen-acpi-processor"

 LICENSE =3D "MIT"

--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

