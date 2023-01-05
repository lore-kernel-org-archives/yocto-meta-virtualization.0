Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C16C53210
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 13:54:31 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.89])
 by mx.groups.io with SMTP id smtpd.web11.12957.1672926863815102921
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 05:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=PtkzOtUA;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.95.89, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGRhYNQrD0tYlxZ0fQEYfeGkXmOwhTERdKf1UD6WHvh90aHFziulo/uS80j4jLeDJnRAKntD9F/h0dpnXRFebZfNDXlrrdy4ZzB0IhUecqKLRrB3QazT2bDE6Mn/13BBXltbM8ce4AKnQAFSHpDGQej1R6ax4KbNRwquXmaHKgJL1dyY8HpHPEiQCNuRMYNwhFcbLSxKaQpzv0kW0upVWQOw3s79dhvdhcV7C7CsBzX0WVUpJEK/E/cD37fuNxgp7+si+F2bB7ejX3BxsbJ6Lys4fNWxD7ct04BG2XGaVAKwfvDVpjc63uQjNnUuRSZu8CPQlTKzBkQfbZBYtm+VLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v67DubPypKbu1wtCaj5K0m0XEiqNtK54D6Cn32viWiU=;
 b=Dpo3uagVsCJLpz7CdG2oT0an1ccc0DpH4PT7b17KcwD/2jPqIEPkFfuFU1XrvU//tp6ecz3bq/GV2w9b+PB68Jy1lEIyThwvt3AUlvvsZ5weDIniFTRxatDyQzWvFUWtx7WCxfg0QSlczdJhgmSiC8EIVoHC6ihvUvfI/jOyjhJMTcSA3vT7Q/O0z4IwzliFbRbPRK/37Vrpv0Cq1mIm8TUH/9oi7k5Fe3oAcRRLj4xLWfCUH+H0AQx8hzCAK380/y4JPdlXuDv7A8e9wBwQMT8hsYteYW+A2Eq20vpVjXhqeqII4BGq+IMEcd1E1JdGAWRrCLfnj4sOvJNy6mbLXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v67DubPypKbu1wtCaj5K0m0XEiqNtK54D6Cn32viWiU=;
 b=PtkzOtUAxrTxAvRGoUr9kpq9/bq3MfzzfUa43aqadAqYTNGnaoBAs9DuJo8uvN7OF3FwJXfTGMZjvtsfci99naqXADU+nSLU3Wlj9gb792IX6FrXAnrJK/pmRALyGzrYK5JKXnM/7hoXh/WNEHRiNwsV5Tivpp3igzkRLEV8NIw=
Received: from BN9PR03CA0441.namprd03.prod.outlook.com (2603:10b6:408:113::26)
 by CH2PR12MB4876.namprd12.prod.outlook.com (2603:10b6:610:67::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 13:54:21 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::6f) by BN9PR03CA0441.outlook.office365.com
 (2603:10b6:408:113::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 13:54:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.6 via Frontend Transport; Thu, 5 Jan 2023 13:54:20 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 07:54:19 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 05:54:19 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 5 Jan 2023 07:54:18 -0600
From: Michal Orzel <michal.orzel@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <christopher.w.clark@gmail.com>, <bertrand.marquis@arm.com>,
	<stefano.stabellini@amd.com>, <stewart.hildebrand@amd.com>,
	<bruce.ashfield@gmail.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 1/3 RESEND] xen: Bump SRCREV of 4.16 recipes to 4.16.3
Date: Thu, 5 Jan 2023 14:54:03 +0100
Message-ID: <20230105135405.10168-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105135405.10168-1-michal.orzel@amd.com>
References: <20230105135405.10168-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT046:EE_|CH2PR12MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: 6980085f-c873-43a5-9f77-08daef24585a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GxyoDg58/7viFVKGnhRKzjvMKjpL0EoqZMykpyZOSpmtdcTnJ8knfIPn12zbdRIJov6uEa4776QCAqtWl9qmaBZjlVDU2s5v7HKlegyzFabEsmowdGlbmj2oioI6G3ypwgRuioP37BV0XE9J2ydozvauDHUo7C5N3sYunARcP+/F1aFzw0diwuGYN95zYlF7DMYF4IXy7yvZecHlv2l+fChxGWP74tdXfUVJwJMYllOcCZZHGMZqoX8zuRBL0CnXOmuqyskDEKoUdc3wODuglAlX27Dwu68VwW0QtZERKeQwkX6G7Gsw8TxSB+8LpevftMNMV4XWi7GdvzRTj+3hvFpEpUJ2nqA7i2PfkXuMaGK9PLhxWcK0O6ake2goYyFKWkjmX4hk5d6UqGGmeEM6G4gBxv35/bLxMSGcDdhNVO5LTZtfV7VxH9TGLKEcQCVeLvtOnXJ+5ikPyb02ny1rVsMIQzrpP8b9cwzKUiQKVoQ1Y/3P32P+QzPMs92sSzGVREClDUXP34U5tTHJR5nIGZ1yPB+aPwEGlF13STwOZ5Fjvuaa5r1IcuvQBPL8Gl6GbVSveAM8RKE/ftM5W4LQ4tNd3xns8Xv+ZngeFW/VdrXPhwWMYZrBSQYoopO4eHMDqnNRZf3xHkEQOkz4zLQAFcKo5w4U7Cv6Y3+uNXKLH0UKwRuKsTwiSEFxNwxDrIy70LiXkUunNfjqCahKQbAPJH28pCiES4Xeuz7zJpZrKRJ2W/ROSU9syDYzjccDPUdk2O5cxdG3KJEegjacBqiGiA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(40470700004)(36840700001)(46966006)(356005)(70586007)(4326008)(70206006)(41300700001)(426003)(47076005)(8676002)(6916009)(2906002)(54906003)(186003)(26005)(336012)(83380400001)(81166007)(316002)(84970400001)(6666004)(86362001)(82310400005)(478600001)(966005)(44832011)(82740400003)(36860700001)(40480700001)(30864003)(1076003)(8936002)(40460700003)(5660300002)(2616005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 13:54:20.5760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6980085f-c873-43a5-9f77-08daef24585a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4876
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Jan 2023 13:54:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7790

Update 4.16 recipes to use the latest 4.16.3 release.
Also, remove the GCC 12 fix patch as it seems to be no longer needed.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 .../files/xen-fix-gcc12-build-issues.patch    | 433 ------------------
 recipes-extended/xen/xen-tools_4.16.bb        |   5 +-
 recipes-extended/xen/xen_4.16.bb              |   5 +-
 3 files changed, 4 insertions(+), 439 deletions(-)
 delete mode 100644 recipes-extended/xen/files/xen-fix-gcc12-build-issues.p=
atch

diff --git a/recipes-extended/xen/files/xen-fix-gcc12-build-issues.patch b/=
recipes-extended/xen/files/xen-fix-gcc12-build-issues.patch
deleted file mode 100644
index 6cdd312db110..000000000000
--- a/recipes-extended/xen/files/xen-fix-gcc12-build-issues.patch
+++ /dev/null
@@ -1,433 +0,0 @@
-References: bsc#1196545
-
-Compiling against gcc12.
-
-Many of the failures are -Werror=3Darray-bounds where macros
-from mm.h are being used. Common Examples are,
-include/asm/mm.h:528:61: error: array subscript 0 is outside array bounds =
of 'long unsigned int[0]' [-Werror=3Darray-bounds]
-include/xen/mm.h:287:21: error: array subscript [0, 288230376151711743] is=
 outside array bounds of 'struct page_info[0]' [-Werror=3Darray-bounds]
-
-There are also several other headers that generate array-bounds macro fail=
ures.
-The pragmas to override are mostly in '.c' files with the exception of,
-xen/arch/x86/mm/shadow/private.h
-xen/include/asm-x86/paging.h
-
-[Upstream-Status: imported from: https://build.opensuse.org/package/view_f=
ile/openSUSE:Factory/xen/gcc12-fixes.patch?expand=3D1]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-
-
-Index: xen-4.16.1-testing/xen/drivers/passthrough/amd/iommu_intr.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/drivers/passthrough/amd/iommu_intr.c
-+++ xen-4.16.1-testing/xen/drivers/passthrough/amd/iommu_intr.c
-@@ -23,6 +23,10 @@
-=20
- #include "iommu.h"
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- union irte32 {
-     uint32_t raw;
-     struct {
-Index: xen-4.16.1-testing/xen/drivers/passthrough/x86/hvm.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/drivers/passthrough/x86/hvm.c
-+++ xen-4.16.1-testing/xen/drivers/passthrough/x86/hvm.c
-@@ -901,6 +901,9 @@ static void __hvm_dpci_eoi(struct domain
-     hvm_pirq_eoi(pirq);
- }
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Waddress"
-+#endif
- static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
- {
-     struct pirq *pirq =3D pirq_info(d, gsi);
-Index: xen-4.16.1-testing/xen/common/domctl.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/common/domctl.c
-+++ xen-4.16.1-testing/xen/common/domctl.c
-@@ -32,6 +32,10 @@
- #include <public/domctl.h>
- #include <xsm/xsm.h>
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- static DEFINE_SPINLOCK(domctl_lock);
-=20
- static int nodemask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_nodemap=
,
-Index: xen-4.16.1-testing/xen/common/efi/boot.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/common/efi/boot.c
-+++ xen-4.16.1-testing/xen/common/efi/boot.c
-@@ -31,6 +31,10 @@
- #undef __ASSEMBLY__
- #endif
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- #define EFI_REVISION(major, minor) (((major) << 16) | (minor))
-=20
- #define SMBIOS3_TABLE_GUID \
-Index: xen-4.16.1-testing/xen/common/xmalloc_tlsf.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/common/xmalloc_tlsf.c
-+++ xen-4.16.1-testing/xen/common/xmalloc_tlsf.c
-@@ -28,6 +28,10 @@
- #include <xen/pfn.h>
- #include <asm/time.h>
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- #define MAX_POOL_NAME_LEN       16
-=20
- /* Some IMPORTANT TLSF parameters */
-Index: xen-4.16.1-testing/xen/common/memory.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/common/memory.c
-+++ xen-4.16.1-testing/xen/common/memory.c
-@@ -35,6 +35,10 @@
- #include <asm/guest.h>
- #endif
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- struct memop_args {
-     /* INPUT */
-     struct domain *domain;     /* Domain to be affected. */
-Index: xen-4.16.1-testing/xen/common/page_alloc.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/common/page_alloc.c
-+++ xen-4.16.1-testing/xen/common/page_alloc.c
-@@ -155,6 +155,10 @@
- #define PGC_reserved 0
- #endif
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- /*
-  * Comma-separated list of hexadecimal page numbers containing bad bytes.
-  * e.g. 'badpage=3D0x3f45,0x8a321'.
-@@ -1529,6 +1533,7 @@ static void free_heap_pages(
- }
-=20
-=20
-+
- /*
-  * Following rules applied for page offline:
-  * Once a page is broken, it can't be assigned anymore
-Index: xen-4.16.1-testing/xen/common/vmap.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/common/vmap.c
-+++ xen-4.16.1-testing/xen/common/vmap.c
-@@ -9,6 +9,10 @@
- #include <xen/vmap.h>
- #include <asm/page.h>
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- static DEFINE_SPINLOCK(vm_lock);
- static void *__read_mostly vm_base[VMAP_REGION_NR];
- #define vm_bitmap(x) ((unsigned long *)vm_base[x])
-Index: xen-4.16.1-testing/xen/include/asm-x86/paging.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/include/asm-x86/paging.h
-+++ xen-4.16.1-testing/xen/include/asm-x86/paging.h
-@@ -32,6 +32,10 @@
- #include <asm/flushtlb.h>
- #include <asm/domain.h>
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- /************************************************************************=
*****
-  * Macros to tell which paging mode a domain is in */
-=20
-Index: xen-4.16.1-testing/xen/arch/x86/x86_64/traps.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/x86_64/traps.c
-+++ xen-4.16.1-testing/xen/arch/x86/x86_64/traps.c
-@@ -25,6 +25,9 @@
- #include <asm/hvm/hvm.h>
- #include <asm/hvm/support.h>
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-=20
- static void print_xen_info(void)
- {
-Index: xen-4.16.1-testing/xen/arch/x86/cpu/mcheck/mcaction.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/cpu/mcheck/mcaction.c
-+++ xen-4.16.1-testing/xen/arch/x86/cpu/mcheck/mcaction.c
-@@ -4,6 +4,10 @@
- #include "vmce.h"
- #include "mce.h"
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- static struct mcinfo_recovery *
- mci_action_add_pageoffline(int bank, struct mc_info *mi,
-                            mfn_t mfn, uint32_t status)
-Index: xen-4.16.1-testing/xen/arch/x86/cpu/mcheck/mce.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/cpu/mcheck/mce.c
-+++ xen-4.16.1-testing/xen/arch/x86/cpu/mcheck/mce.c
-@@ -30,6 +30,10 @@
- #include "util.h"
- #include "vmce.h"
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- bool __read_mostly opt_mce =3D true;
- boolean_param("mce", opt_mce);
- bool __read_mostly mce_broadcast;
-Index: xen-4.16.1-testing/xen/arch/x86/hvm/hvm.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/hvm/hvm.c
-+++ xen-4.16.1-testing/xen/arch/x86/hvm/hvm.c
-@@ -81,6 +81,10 @@
-=20
- #include <compat/hvm/hvm_op.h>
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- bool_t __read_mostly hvm_enabled;
-=20
- #ifdef DBG_LEVEL_0
-Index: xen-4.16.1-testing/xen/arch/x86/pv/dom0_build.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/pv/dom0_build.c
-+++ xen-4.16.1-testing/xen/arch/x86/pv/dom0_build.c
-@@ -22,6 +22,10 @@
- #include <asm/pv/mm.h>
- #include <asm/setup.h>
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- /* Allow ring-3 access in long mode as guest cannot use ring 1 ... */
- #define BASE_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_USER)
- #define L1_PROT (BASE_PROT|_PAGE_GUEST_KERNEL)
-Index: xen-4.16.1-testing/xen/arch/x86/pv/ro-page-fault.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/pv/ro-page-fault.c
-+++ xen-4.16.1-testing/xen/arch/x86/pv/ro-page-fault.c
-@@ -26,6 +26,10 @@
- #include "emulate.h"
- #include "mm.h"
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- /*********************
-  * Writable Pagetables
-  */
-Index: xen-4.16.1-testing/xen/arch/x86/pv/emul-priv-op.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/pv/emul-priv-op.c
-+++ xen-4.16.1-testing/xen/arch/x86/pv/emul-priv-op.c
-@@ -40,6 +40,10 @@
- #include "emulate.h"
- #include "mm.h"
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- struct priv_op_ctxt {
-     struct x86_emulate_ctxt ctxt;
-     struct {
-Index: xen-4.16.1-testing/xen/arch/x86/pv/mm.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/pv/mm.c
-+++ xen-4.16.1-testing/xen/arch/x86/pv/mm.c
-@@ -26,6 +26,10 @@
-=20
- #include "mm.h"
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- /*
-  * Get a mapping of a PV guest's l1e for this linear address.  The return
-  * pointer should be unmapped using unmap_domain_page().
-Index: xen-4.16.1-testing/xen/arch/x86/domain_page.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/domain_page.c
-+++ xen-4.16.1-testing/xen/arch/x86/domain_page.c
-@@ -18,6 +18,10 @@
- #include <asm/hardirq.h>
- #include <asm/setup.h>
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- static DEFINE_PER_CPU(struct vcpu *, override);
-=20
- static inline struct vcpu *mapcache_current_vcpu(void)
-Index: xen-4.16.1-testing/xen/arch/x86/mm/shadow/private.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/mm/shadow/private.h
-+++ xen-4.16.1-testing/xen/arch/x86/mm/shadow/private.h
-@@ -33,6 +33,10 @@
-=20
- #include "../mm-locks.h"
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- /************************************************************************=
******
-  * Levels of self-test and paranoia
-  */
-Index: xen-4.16.1-testing/xen/arch/x86/mm/hap/hap.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/mm/hap/hap.c
-+++ xen-4.16.1-testing/xen/arch/x86/mm/hap/hap.c
-@@ -42,6 +42,10 @@
-=20
- #include "private.h"
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- /************************************************/
- /*          HAP VRAM TRACKING SUPPORT           */
- /************************************************/
-Index: xen-4.16.1-testing/xen/arch/x86/mm/p2m-pod.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/mm/p2m-pod.c
-+++ xen-4.16.1-testing/xen/arch/x86/mm/p2m-pod.c
-@@ -31,6 +31,10 @@
-=20
- #include "mm-locks.h"
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- #define superpage_aligned(_x)  (((_x)&(SUPERPAGE_PAGES-1))=3D=3D0)
-=20
- /* Enforce lock ordering when grabbing the "external" page_alloc lock */
-Index: xen-4.16.1-testing/xen/arch/x86/mm/p2m-ept.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/mm/p2m-ept.c
-+++ xen-4.16.1-testing/xen/arch/x86/mm/p2m-ept.c
-@@ -36,6 +36,10 @@
-=20
- #include "mm-locks.h"
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- #define atomic_read_ept_entry(__pepte)                              \
-     ( (ept_entry_t) { .epte =3D read_atomic(&(__pepte)->epte) } )
-=20
-Index: xen-4.16.1-testing/xen/arch/x86/mm/p2m.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/mm/p2m.c
-+++ xen-4.16.1-testing/xen/arch/x86/mm/p2m.c
-@@ -44,6 +44,10 @@
-=20
- #include "mm-locks.h"
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- /* Override macro from asm/page.h to make work with mfn_t */
- #undef virt_to_mfn
- #define virt_to_mfn(v) _mfn(__virt_to_mfn(v))
-Index: xen-4.16.1-testing/xen/arch/x86/tboot.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/xen/arch/x86/tboot.c
-+++ xen-4.16.1-testing/xen/arch/x86/tboot.c
-@@ -16,6 +16,10 @@
- #include <asm/setup.h>
- #include <crypto/vmac.h>
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- /* tboot=3D<physical address of shared page> */
- static unsigned long __initdata opt_tboot_pa;
- integer_param("tboot", opt_tboot_pa);
-Index: xen-4.16.1-testing/tools/firmware/hvmloader/ovmf.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/tools/firmware/hvmloader/ovmf.c
-+++ xen-4.16.1-testing/tools/firmware/hvmloader/ovmf.c
-@@ -34,6 +34,11 @@
- #include <xen/hvm/ioreq.h>
- #include <xen/memory.h>
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#pragma GCC diagnostic ignored "-Wstringop-overflow"
-+#endif
-+
- #define OVMF_MAXOFFSET          0x000FFFFFULL
- #define OVMF_END                0x100000000ULL
- #define LOWCHUNK_BEGIN          0x000F0000
-Index: xen-4.16.1-testing/tools/firmware/hvmloader/seabios.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/tools/firmware/hvmloader/seabios.c
-+++ xen-4.16.1-testing/tools/firmware/hvmloader/seabios.c
-@@ -29,6 +29,11 @@
- #include <acpi2_0.h>
- #include <libacpi.h>
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#pragma GCC diagnostic ignored "-Wstringop-overflow"
-+#endif
-+
- struct seabios_info {
-     char signature[14]; /* XenHVMSeaBIOS\0 */
-     uint8_t length;     /* Length of this struct */
-Index: xen-4.16.1-testing/tools/firmware/hvmloader/util.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- xen-4.16.1-testing.orig/tools/firmware/hvmloader/util.c
-+++ xen-4.16.1-testing/tools/firmware/hvmloader/util.c
-@@ -31,6 +31,10 @@
- #include <xen/hvm/hvm_xs_strings.h>
- #include <xen/hvm/params.h>
-=20
-+#if __GNUC__ >=3D 12
-+#pragma GCC diagnostic ignored "-Warray-bounds"
-+#endif
-+
- /*
-  * Check whether there exists overlap in the specified memory range.
-  * Returns true if exists, else returns false.
-
diff --git a/recipes-extended/xen/xen-tools_4.16.bb b/recipes-extended/xen/=
xen-tools_4.16.bb
index 2200a5a44abe..b5e555e6eabb 100644
--- a/recipes-extended/xen/xen-tools_4.16.bb
+++ b/recipes-extended/xen/xen-tools_4.16.bb
@@ -1,5 +1,5 @@
-# xen 4.16.2 release sha
-SRCREV ?=3D "cea5ed49bb5716698a11312a3f38bc8865cd1e67"
+# xen 4.16.3 release sha
+SRCREV ?=3D "556c2e817c9cf23b675eb4eaa2dc091f7bb3039f"
=20
 XEN_REL ?=3D "4.16"
 XEN_BRANCH ?=3D "stable-${XEN_REL}"
@@ -7,7 +7,6 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
 SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
-    file://xen-fix-gcc12-build-issues.patch \
     "
=20
 LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44a4=
e5"
diff --git a/recipes-extended/xen/xen_4.16.bb b/recipes-extended/xen/xen_4.=
16.bb
index 70e1d70e9c29..14a4fa79c5dd 100644
--- a/recipes-extended/xen/xen_4.16.bb
+++ b/recipes-extended/xen/xen_4.16.bb
@@ -1,5 +1,5 @@
-# xen 4.16.2 release sha
-SRCREV ?=3D "cea5ed49bb5716698a11312a3f38bc8865cd1e67"
+# xen 4.16.3 release sha
+SRCREV ?=3D "556c2e817c9cf23b675eb4eaa2dc091f7bb3039f"
=20
 XEN_REL ?=3D "4.16"
 XEN_BRANCH ?=3D "stable-${XEN_REL}"
@@ -7,7 +7,6 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
 SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-locati=
on.patch \
-    file://xen-fix-gcc12-build-issues.patch \=20
     "
=20
 LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44a4=
e5"
--=20
2.25.1


