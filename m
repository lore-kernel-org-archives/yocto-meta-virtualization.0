Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE99FC6787B
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 18:18:18 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.69])
 by mx.groups.io with SMTP id smtpd.web11.2032.1692987496769312985
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Aug 2023 11:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=hBHvH9yP;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.93.69, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGDZGSGoc/oIVpURluMMiDyzjvAQhSqXIVNZ8+E5ANkAatyXFi36aPadb5F+lHwGGkgMVrsb68kRU1lNUN7EPBr9NogZb9IgmWeIEncv6cZfAA2RddSfWVap1eQ/hnv6K2amC/VIzwmn3u64rrE++98Fch/6EUath49utfsFGXcjNguM6O65yqvB2n+Gz3w1E+YzCpHp0ZLgdz2OkH0d2LBNPK3qo90OKcZBPnwfnkGFHhF3vIb4it6G1bqvwZ6msI7pBlv1jIUE69JnrvDvg1UDOn5CHxtBWd951jVl0hOi6+uQLpFum3WgiyHpnNsDIYbrmWriehNq2tGAPOtrIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xE1aGX5g24/MTcsTEQ9CdITl/yAkiytAkbDuouGSc78=;
 b=JxVX4bsZDieAYE3crm55QihUZh5gYAudPJHBnAbTBaXc3vmVaT/VeRbi+A0BHG/N4pKWx95bPvLj4wJ7MQNhIpY4lzRyYVDmFrRyGuJUn0psyc+Xarc/bMoiCGU5vlidPcxit6hrqojGNSGcfCp2k9K1WmLwb31RZzMQDm8Ow9HMw/2zifKLg2jUfKam/A8g+88KiDxfEH87JbwVSabQnB3AtcC72XrJDMMOIeN1Iwr5hgRl6hR2YUucylUChMM2mE+YtuK/RIqrw8fV0DgLfU96ie3sfgbXciZKJ+uWhxVR5mGASo8H87/sXkGj3ZmdltMQdegAsQ4VbxRrvLs28g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE1aGX5g24/MTcsTEQ9CdITl/yAkiytAkbDuouGSc78=;
 b=hBHvH9yPuoSyakDO316wnwRtFEQanFV1fpAiKaUz0yMOkdLUzqt5GQvfTT1UGpQVXutTEHCn6rCgz3PJZnm/oD+YDo0pk2pWAg0mSTbbwv0UX41yjuWIv588WkP0vHYO4fCevKP5z16fLYOtG0OUTghhw0G+fIZqDbQUxf3UPjA=
Received: from SA1P222CA0185.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::11)
 by PH7PR12MB6785.namprd12.prod.outlook.com (2603:10b6:510:1ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30; Fri, 25 Aug
 2023 18:18:13 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:3c4:cafe::4c) by SA1P222CA0185.outlook.office365.com
 (2603:10b6:806:3c4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 18:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Fri, 25 Aug 2023 18:18:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 13:18:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 13:18:12 -0500
Received: from xcosandeepg41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 13:18:12 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>,
	<christopher.w.clark@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][PATCH 1/2] xen-boot-cmd: Add xen variable as addendum
Date: Fri, 25 Aug 2023 12:18:10 -0600
Message-ID: <20230825181811.3306054-2-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825181811.3306054-1-sandeep.gundlupet-raju@amd.com>
References: <20230825181811.3306054-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|PH7PR12MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: 42281f41-97f0-4e60-ba18-08dba597a53a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZpMg164xSbz0TaGn6v8fzTAYVxtbAZGj1ps1LPSxOG0TVO5LvhTMLN5pLln/867X7sHd/9Ytckyv/zbbTRBWFmzXC+phDQLBxPTt9wKxTikrgARzlC3JvX1H/tTbHjA2iLGMqohUHAGb3odd/pdPkf+YgvdLs8Km+HVu08hWtk2JSDs3cqMiQQMV6A0LIk1YE76K8h4JrEpQXgtSCEjAuszBQeoeQXcpypX44poEgTsyS1Jo8EZ7Q4Y4Xt9yhiJAqnqDA8dmZHfRcUsQn62yM01J6gJlYa560Ama02cDDYh2mht7lL/QuuZ8h+UhJ6kZAOugXkkIps7ScRQvxnOuvj0CF4vKRRdx2cGDZnfe0Kf21HK/51+VuxHMK5+Fb8qF8YvCj3RFFsN5yVNr18VSFB+ITq8NeI/NziDmEPh+WfQ6gjYEVU7tuhudsGEQBUH0QE3QTxu2pscKWnjIX9lmKQCpveeHrxKT7rl/oa3xqX12DTNJ3lGnLbBHzmncsiStr0coL4cbB9DogYKlTNCQgo0jGRV7eHSjrgkZE3KLSHEDvzmMEJNp8ObfrEpDNDR3lWySEbxLlBScjHlLmrLkjY+0S5vCRuJwIDwEXYYttvKxnmwbuWDHfsLkM+YdXO6hSGQ7vLJC6UAHdydLYpo/nPRSlSrMhVxUyoIk807YAgCmQn15gk0MS5f4dzpjSBVkMvPKpaQpElCzDrLuZa8YqegbqrBiX3rVQd203nn93pZm+9JFYeq4UamkBrZHqPOP5J21dxLYRmde90DZwrpPmQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(82310400011)(451199024)(1800799009)(186009)(46966006)(40470700004)(36840700001)(5660300002)(8936002)(4326008)(8676002)(316002)(2616005)(40480700001)(26005)(41300700001)(2906002)(110136005)(70586007)(70206006)(478600001)(1076003)(40460700003)(47076005)(36860700001)(36756003)(336012)(426003)(81166007)(86362001)(356005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 18:18:13.3166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42281f41-97f0-4e60-ba18-08dba597a53a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6785
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Aug 2023 18:18:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8233

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 .../xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dy=
namic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
index b2b76120..6d113c9a 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
@@ -36,3 +36,15 @@ XEN_CMDLINE_APPEND ?=3D ""
 # Specify the max number of vcpus for dom0
 # Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
 DOM0_MAX_VCPUS ?=3D "1"
+
+# Add xen variables as addendum.
+# Variable SCRIPT_SED_ADDENDUM id defined in meta-xilinx and set to null b=
y
+# default and enable only for xen builds.
+SCRIPT_SED_ADDENDUM +=3D "-e 's/@@XEN_IMAGE_NAME@@/${XEN_IMAGE_NAME}/' \
+        -e 's/@@XEN_OFFSET@@/${XEN_OFFSET}/' \
+        -e 's/@@XEN_LOAD_ADDRESS@@/${XEN_LOAD_ADDRESS}/' \
+        -e 's/@@DOM0_MEM@@/${DOM0_MEM}/' \
+        -e 's/@@DOM0_MAX_VCPUS@@/${DOM0_MAX_VCPUS}/' \
+        -e 's:@@XEN_SERIAL_CONSOLES@@:${XEN_SERIAL_CONSOLES}:' \
+        -e 's:@@XEN_CMDLINE_APPEND@@:${XEN_CMDLINE_APPEND}:' \
+"
\ No newline at end of file
--=20
2.34.1


