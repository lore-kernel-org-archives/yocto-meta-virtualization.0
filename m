Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.74])
 by mx.groups.io with SMTP id smtpd.web11.847.1624561208351237803
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Jun 2021 12:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=s0wyagKb;
 spf=pass (domain: arm.com, ip: 40.107.8.74, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OJxF38npBq4KhJyKZUR03iBidpmUhF7YOPjIpKgUQg=;
 b=s0wyagKbzZGkoUrovsJU5BL3SBRfm4IrhWZSPyDz1hIMCwW3ogbLqg5bpO8C2GYl39kRG7GqnAEy2VmB5zJqFIsLybCaRCxWrAzA9imp1A4GTJmJiLlgr5FAqeHmXERvWM5gbWpzN8BA4Sx/NIbbZVxj+802jc0k5jHOKZl5LNo=
Received: from DU2PR04CA0254.eurprd04.prod.outlook.com (2603:10a6:10:28e::19)
 by VI1PR08MB4080.eurprd08.prod.outlook.com (2603:10a6:803:df::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 24 Jun
 2021 19:00:05 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::77) by DU2PR04CA0254.outlook.office365.com
 (2603:10a6:10:28e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Thu, 24 Jun 2021 19:00:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 19:00:05 +0000
Received: ("Tessian outbound 92494750bf3c:v96"); Thu, 24 Jun 2021 19:00:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 461c213abe84d663
X-CR-MTA-TID: 64aa7808
Received: from 4f5dfaa2997b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E94C76B1-2055-42FA-837E-74F1CC9F36AC.1;
	Thu, 24 Jun 2021 18:59:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4f5dfaa2997b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Jun 2021 18:59:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vl5QLxm2stPjHvkvHXBBkTlHKSVxqom6fpTwk3rkDIllBcwIQyzgn5k8AUXW2F8LYXKF13Ns6Y6j1xlKSh9YGyVr09llztpM2Vm8cWV8QyoqDWJLWAixXL2xIB5f3+12/0jSk1bmj+d2gd58DslqqUu8Vg5B1LLz0l+1soL4q5TuJJITrOLntEclTtCEdxlDyg0wHkG4oPpAUP2R2PxPWX5PlulnrmvHqcndTB4I5JjFC3ibYNZE9Bfs1s6el/9xzP3N+5Xau5TV0x3E2Y/OVmBaJ7bf9J2qkJxqakVmBgorU7WDvbVfB0DsOebCUJ9nxsru9jEvYw/BuWd3x29/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OJxF38npBq4KhJyKZUR03iBidpmUhF7YOPjIpKgUQg=;
 b=cVdZgP0IZiHBs+6EIfCXAlPF9GQaoUPvs0B0EAMFhRpmQtIg2Lk6pvOvnEByfN3RBCVzOHffcZKsCfqzlzeQD9MUEGtSFHukFChWOzwAP1zoZrXCGvV3ZmiQsGXyFoGvfYPAUEKMs4rrnk6xauMzbns9Vo09OycjuOtR9bKGDjbeskCkh3EwfnnCghE2K+uzNDh+xnrBA6DC48dNDlKi7OBuquOemSyM+gy7XcMutVKQB0pfPVjRSR8kLRV6Yt9stz4JZdHzWQnhIfkZ25uq3YD6qiCzsjTkU4i280eU4Le8ec3NekUcGr5aDXRlAUH6I3oxYtflt5aMuITM2qg6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OJxF38npBq4KhJyKZUR03iBidpmUhF7YOPjIpKgUQg=;
 b=s0wyagKbzZGkoUrovsJU5BL3SBRfm4IrhWZSPyDz1hIMCwW3ogbLqg5bpO8C2GYl39kRG7GqnAEy2VmB5zJqFIsLybCaRCxWrAzA9imp1A4GTJmJiLlgr5FAqeHmXERvWM5gbWpzN8BA4Sx/NIbbZVxj+802jc0k5jHOKZl5LNo=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3462.eurprd08.prod.outlook.com (2603:10a6:20b:44::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 24 Jun
 2021 18:59:56 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2%3]) with mapi id 15.20.4242.023; Thu, 24 Jun 2021
 18:59:56 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH 2/3] packagegroup-container: Include podman if seccomp is in DISTRO_FEATURES
Date: Thu, 24 Jun 2021 19:59:33 +0100
Message-Id: <7f8db7f9ee6a55e960fb3a36e7b5a04eefa7606b.1624561041.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
References: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::14) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 18:59:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f5d007a-9e84-4d2d-f1e7-08d93742474f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3462:|VI1PR08MB4080:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4080CCC57275B138093ADE9692079@VI1PR08MB4080.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AdyDWxnd8BTbxtNmCoYTDkySdyOV6ebnzIK+KkpfSfkHiLk37QYrg5QVQPmK5zXBol3VqE23MfN7rLKamw5eTtwE+v8n3E+uYHXXVbAyGIvq+K1SnAWZjAtv1/do65PT6F7yW0XDWUw+rbl9dnOwySZcj7gaXZWlnEn1H+Mmo3ec+ztEOFZm8GHT8sRYqgwJWmltCd0G6++CgG1FAinaT0DkARERYbIyDy5A6xT2vekiNVTaVl9jWqNxD4FAE0l9xyM5EPVDkfOgyLFR2rsomLAhe7abkNWK7r+K9QVlGYM1t98LmE8vAfiIU9LNptVihNEFlOxXUqoiLYICIQosCuB4RZkLArEBuWpdS2lAAD26W+yHGKzOY5e7pPTOpeB2qqzlC65cn/Ob8BG4J6CleyXhF2TM1TrS2d0Ht+7gaPsxxIZqJlb16WHeN23tP7y5yI2rRE4fZSvyfSRlU1b6gMhyIkVy5+KDVlp+fdIwZe9quecACXTWX5PiLmtrOU7vnkeTiotLZ0L4v+CHUS28vYihdlwSl1oOBVBBH7F+a+lFwxPCsVLa9z/Lffsh42X3UFAa2QJXpfZNxnN70ljeNaMFDY1XDAjX4hK2VpSH1UhwVdIuHd+uxBGvxuHHxu4Nw10WUHVfwzt2VYAht2zVO9SCibYqjlaFzjUxFcmpY+GASub86f+T5SDvB0Ro9cnZyCIo3jo/SVK3KkQYBahwGQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(478600001)(66476007)(66556008)(44832011)(38100700002)(7696005)(8936002)(6916009)(38350700002)(86362001)(52116002)(36756003)(2616005)(5660300002)(316002)(6666004)(956004)(4326008)(26005)(16526019)(6486002)(4744005)(66946007)(186003)(2906002)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?RdjGXQJpuwo3l/Vzj3PrVtKIUm4FgYqWnNPx8pfmy2rGTvEUB4S3UbyW8PKm?=
 =?us-ascii?Q?0IoH6eKyj0B5V6hisIfbo3CnNZb/JEhbl73iGKJV7h2075vi4f2vdBYrQ2g/?=
 =?us-ascii?Q?PCi34lEXYDI2PUz90DmvW/lYbyqHRcOeho4VfmeznZR9uOc6FfJGcyr/G/NN?=
 =?us-ascii?Q?9oj07wRNEAYhA3lRfkfVmM0ydxSYUksuQd7Qe99LOaTX5OPEbwPRD9MpfRTp?=
 =?us-ascii?Q?hA8rrgE/fmAkaPdYUH866NisHCxitKeII6ht1AjmJcvQbazcy93ovxy1ev/q?=
 =?us-ascii?Q?gN6c5U/LJ+3AUcqLp0XbtKh/Vbr0v1+93is8ZcZt16Bjr715p4hyvSXbDdTC?=
 =?us-ascii?Q?Mf042VC81kgky38qoFInsrYkD67et2CXhiOe9oaLIb5cYoWbQ0gaZ6uke7H3?=
 =?us-ascii?Q?QvhuhQupZ9VCqwKBVJiwrhh61g6UBkHIPZhqF2FVy/ByuZ4SrvzUsAV12AiB?=
 =?us-ascii?Q?DGtdK8euytwWIzYDxj9vi7IUFvGpu7XCsIoHAYdWHR/VJbyBharbmA5c+pPg?=
 =?us-ascii?Q?C8O/SKb0R/cJ1PgqR6r2Ip7fvSFZsELq93ogyD6m60EizBdXsedEGdhJxn25?=
 =?us-ascii?Q?mGNEu2+3dtYl1jzBVrHp/YGPbhTgL9XjtOJ+tKcvkO22/LMAnx1DLhbtqGps?=
 =?us-ascii?Q?K2BeLMMat9p/fjslpgpqGKxodE5INCurb8a8+IShihqJuh0cJnnHBd5iyDvs?=
 =?us-ascii?Q?C5pmr0thbp8elidr4o6PlZC2DuDS2Pyyj+FYNtKtlW9hu9iq6B82t2HvGmtx?=
 =?us-ascii?Q?0k9P004M0CBvfV2s8fK3tbHOwYAe/L2JcX5uwsvGtJpheU1cdtTR25lYlELX?=
 =?us-ascii?Q?nZzzaQr9HCK4HLBt6siUEZWnBmgLgkwxc7+U/iH6RnP0bRcDjBhdA2HIL/7K?=
 =?us-ascii?Q?q3SWAR0ZoYAIgyorN7uKJrgbjEEestAr3QoM7n4vI1wc4GNFOzbS8kpeMqhJ?=
 =?us-ascii?Q?yVx1FBnopCq7/lzeWAEnbSSSokqgkfubwTGeKdhQvyaKee2RZPpF7DMqDq61?=
 =?us-ascii?Q?WWq0KmTkJnT3G3/4s/UjagVEeMIpWYPrjLdjIvUnGovLHrU16jIgDxzbts2t?=
 =?us-ascii?Q?aLvNfTIu9kWTbQxpb4Tp0C0nU3uBPDLIj9kiBFGoaDudo6c5XXliCLdplOL+?=
 =?us-ascii?Q?N/XZGIyCRSeKMT4jKyvifMfDab2N8fvyIc3jEmIDtmZ36GF0fWXWRcfOfzrQ?=
 =?us-ascii?Q?If1o6o6mtRaXZ3wNPOlUs0TMlLIU/lB1rnfFLeN4bDGg6d29+mMnYQnz/OqK?=
 =?us-ascii?Q?F6VtVe0Qf1cLzEEYZUXGqrydCqooxeatwrLd0kCPk+og3Vh5luRL91JsWqwd?=
 =?us-ascii?Q?UiQ3HsRX8irEzIIeJV7C36dz?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3462
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	878d7dbd-e557-4676-be26-08d93742422a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	go/ISk06EvQRpf71u+Z3lQWU71K9Eh1YOCPoBBQ9XTJDYl2YZ+JYbr9t16xLmNDXNEVBaCOLPtlUxSsR1hImJCgkm0qrx8GWn2zI08D9kqw02kWGYRv6rZPn8yHlXUmmcLPiNwuwTwwKX6BEZ6EOS+LDW9izS2d5eNMG3tEPbIaGi5VhkVvUNdM6lPcqX2pXGp1PyJCdgDZtNScIrL1whfvR0nErnhdJpKEmBPOIlvAiNZn3ufPGP7Ck3OOj65fuNBYq3q/vl81C6CnjpWYm+sZhWJWd0UnchzqVSNHUeA1b/5mXZq8+oTELqepIYT7T1wu63FpXbltT/ykTJDGO9nayt9tJas7qHnCkpNtBlrSKWuZ2+Qg9ZvweFgTdwmziLGxVixRQQy5N9QegQdql1IA7fePzkbMpwUcCBvuN/iA4UhpH5mXYGYXM/+71IHP3q/W1K7vGWUuhGUJfbu2HWaYi6JIbMia6iF4mDaKkas1+hLtTW9Adl0WKPshA2E8cBaypHJ5bnBBAKWubLgSN3zjbWBOLpPZtY/vFwdC6bGZVjV4kvcFp7P0weQ2yGzHCEmcnpphlhzIj8h/9gs4gDK3idLqhe4GHnVSMFiX9eDrAf/0WTGLyaB4Q85Sp4gw2f2rYl8poV3Jq8KFa5ARU6FF0YlSAkmILkdvvAGzbaTE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39850400004)(376002)(46966006)(36840700001)(8676002)(86362001)(16526019)(186003)(36756003)(82310400003)(6486002)(356005)(26005)(5660300002)(44832011)(83380400001)(6666004)(478600001)(4744005)(82740400003)(8936002)(336012)(7696005)(81166007)(2616005)(47076005)(316002)(36860700001)(2906002)(70206006)(70586007)(6916009)(956004)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 19:00:05.3296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5d007a-9e84-4d2d-f1e7-08d93742474f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4080
Content-Type: text/plain

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-core/packagegroups/packagegroup-container.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index d425ac5..89b9c01 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -9,7 +9,8 @@ PACKAGES = "\
     packagegroup-lxc \
     packagegroup-docker \
     packagegroup-oci \
-    packagegroup-podman \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', \
+                         'packagegroup-podman', '', d)} \
     packagegroup-containerd \
     "
 
-- 
2.17.1

