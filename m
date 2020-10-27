Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.58])
 by mx.groups.io with SMTP id smtpd.web09.854.1603814195962376877
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 08:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NG6BdToM;
 spf=pass (domain: arm.com, ip: 40.107.15.58, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hye7x4SkQINBuz+/q/5i5K/FWagy5SSA70/lsXx7Pw=;
 b=NG6BdToMWsc4QanJGYX9etcVQvxo0m6tJ4k/SlHsnKI8KVtK8SKTi67K9NRuHNzCac/kNsnRXUwjlDGpHA16y4iR9S8pi+HydYegfWLRmDsUNzGl/LWLj6p+fqc0f3uxuEhoeivcxJ6PY1kftETP5kP3rFZRPTSdpLSZVGhfUF4=
Received: from AM0PR05CA0087.eurprd05.prod.outlook.com (2603:10a6:208:136::27)
 by DB7PR08MB2970.eurprd08.prod.outlook.com (2603:10a6:5:17::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 27 Oct
 2020 15:56:31 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:136:cafe::86) by AM0PR05CA0087.outlook.office365.com
 (2603:10a6:208:136::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Tue, 27 Oct 2020 15:56:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Tue, 27 Oct 2020 15:56:31 +0000
Received: ("Tessian outbound c189680f801b:v64"); Tue, 27 Oct 2020 15:56:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bccb22b6c26db02b
X-CR-MTA-TID: 64aa7808
Received: from 4289c1d41ee9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3675739B-E152-45A0-BA89-A56B6320E5C4.1;
	Tue, 27 Oct 2020 15:55:51 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4289c1d41ee9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Oct 2020 15:55:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QF3b0ARIZpLQq2t9IiJvNDdkqGouLbQj854Sfus7CL8EPnWPhdOreHG7CmSVvoBKSraBUmVopllQShXbsOt/9hYxVu5DHzA75v0qI4h8L0w+djWEFzWN0qo3zqbhNK//fNufNRRO/NNc/GmSuzMUBRLciaDZ7kZ8a6F1VhBquZEuF/J49bD5uDpFumUQpMcaP2F7CC+/zS1JtPXY6any3GJ7ZNBYsyotB/mRo7jg2YGyB9s9o9rkaEn1bBv+00oSdfii1j7ZxsZzUtqq7giJQ8xmNjimiLsnDrr3mO5MejZy64y7rTXq68IQBXN18yItNfY/Y1xdlnomELBv1ZHSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hye7x4SkQINBuz+/q/5i5K/FWagy5SSA70/lsXx7Pw=;
 b=L2nnA+y5GrrkZSwabxj1wXgJh/sxXMFbmIMa67Dr7RHGdllHxyzuP8uEm0ZAJo44WtsmZkIayLM+XafiPz5MS8HHUbQ0+69bGMTAIlsSUWgEGVrtkfyqnoDzOC3mG1HitmPFPtbzB1hDJbwJlZvvtte8slpmXBPLT2wpLYhcb54x8bjfIRdYwp0ev67PRhRepPwbwY8u+8UUN1DOQLi/sWMgn3PsbInjvUIuGvKR6X+cit7ktoBejpEn7/bZOQm/MKFTswyKkWGFdsCnVloxV/wHkoXCgQAgL4oi6cv8XxMSo3Exgs60GmqF1zh9yK2rFCDs79os9gQTNl6gLsNFEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hye7x4SkQINBuz+/q/5i5K/FWagy5SSA70/lsXx7Pw=;
 b=NG6BdToMWsc4QanJGYX9etcVQvxo0m6tJ4k/SlHsnKI8KVtK8SKTi67K9NRuHNzCac/kNsnRXUwjlDGpHA16y4iR9S8pi+HydYegfWLRmDsUNzGl/LWLj6p+fqc0f3uxuEhoeivcxJ6PY1kftETP5kP3rFZRPTSdpLSZVGhfUF4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3468.eurprd08.prod.outlook.com (2603:10a6:10:4a::11)
 by DB7PR08MB2955.eurprd08.prod.outlook.com (2603:10a6:5:17::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23; Tue, 27 Oct
 2020 15:55:48 +0000
Received: from DB7PR08MB3468.eurprd08.prod.outlook.com
 ([fe80::e4f9:119e:aee8:362d]) by DB7PR08MB3468.eurprd08.prod.outlook.com
 ([fe80::e4f9:119e:aee8:362d%7]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 15:55:48 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>,
	christopher.w.clark@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization] [PATCH 1/2] xen: run do_deploy after do_compile and do_populate_sysroot
Date: Tue, 27 Oct 2020 15:55:35 +0000
Message-Id: <20201027155536.12513-1-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: MRXP264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::16) To DB7PR08MB3468.eurprd08.prod.outlook.com
 (2603:10a6:10:4a::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.50) by MRXP264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Tue, 27 Oct 2020 15:55:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d79020d-0442-4e90-3db2-08d87a90df60
X-MS-TrafficTypeDiagnostic: DB7PR08MB2955:|DB7PR08MB2970:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB2970345DEA482238769C828292160@DB7PR08MB2970.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4l1IVGcT/GoFUE0dZOkspy2M72jZ2FQHD2tK366t3thKAmTIsHWcMKPeie7BsEWzshwyP0mHBNIYMREYxmjOwcC10SqX5xaQNTt+tcV3dAsb08lgJJ5lrZcTin0JkJ8pIwIo5R0DxRNZkkFVC5JhpS+s8bxqv9BHWBcF9WkQdHQis4/utq9ui0/khZ2hT0BAm8nkoO4EcUW01+d6wSi5lIxiSdtqoaDw0Jp+MQz6ztOQRv+/zwQGXEmYlu8NIapjFq7m5AFoel4q9FLMqSLJ3ppgv/j7GkjZgLb0bxFoRCZTuEL6GbjIROl7XxZ+hHaH
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3468.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(366004)(376002)(346002)(396003)(26005)(5660300002)(6486002)(6916009)(186003)(44832011)(478600001)(2616005)(16526019)(956004)(7696005)(316002)(52116002)(36756003)(2906002)(86362001)(83380400001)(4326008)(8936002)(1076003)(8676002)(66476007)(66556008)(6666004)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 X1K0DQE+unxofKCadwprSZmNu8qvoZQXvNpsK2GuOw1ai8Vf7hG+iy3U5rT/wXTcdMqjBzb971blZRLRTHPvy4DsE/Kb/jdhB00M4+LnFiAFaFUxtyqfY5F0Ex8Whe82kpTRP+sSrNWGxm8LwO5bZAC5t0OeM7yQYYTj2ww+N3pJjpn63AjfcpajAiP6VOEusKXDfo+vD/jJ4QamwxpT+uz4TkG0p8lvK9Ccjl3BB1rRQjDIcQwt4gxuB5oEbshwIGh8qIz6liQwuE8lSqK0rpEqa14smHHw5yA5s4+CLLluXtjUhKs72yPbD2MHhMPSNrJZHdcg+PNsTJHWbBUedbESadFZ0fuvBQQctprMIZ3TGkc4RGO4tFZV3A+Sg7JkE1kAHMOzO4pKqz0DrUCGczT7THVUUqxjXmgxLAOOAMw0bNhV014/5k7sBXW97cJL1cKbHZbMTk2aLOx1NlVu0arh8YBeEz46dFGjn3HBCU46LVQv1wdP8pYpmeUM1sWNsWBNJxdKW10hqGo1ytzjg+G0VCilOr5ea3rqjNuaFgxr5HAN/jiDfMNGCH+GWs5SM+7R1DRZW96WSXwEQ1zDyK2R2/S5bBzeaiWy/a5UNRBm/cAOaMVNTDVjK1JC9IYVanp9db/v4c9OVu1LAymzyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2955
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	573932bd-a195-4df2-3bca-08d87a90c5af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TdohCJ0qc/UxZ2ToQfTYw5nE5890u4k5D72HHo/pq+yp7i45ZZwEEFcyKVWVCMiZNtGtbtO2eKowFZqNjjjRtSw9QYT3ZIBVG6brt6P1zPyfTtJR+eJ0TUmoei8ZfZDBDSbn/xQ92uuGTYX9h9ml6EWiWGeVMG4N3hetnW4gAX3XaOhw/BkvNMlzKSPN3PqzrTpYQUityePGf4PELUyyis7K76j4OpWbiX8n7H8cU3FYu82fbfXDL8eIvSCXCoZM586s0MCI5fIx8tfpKUFS9EcZB94Y1G4A6/4vlj1Edl+WVPL80LgX2U92nznERy/ypwO2FpiRVQQwKhPuab/zOYeslkVY2cX7ICBO/uLdIIbUO32aLSNPCmLFgKbkm6eIzdyeI5XgLBUdd0ZQEqJF9g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39850400004)(136003)(46966005)(44832011)(6486002)(86362001)(81166007)(8936002)(47076004)(16526019)(7696005)(82740400003)(26005)(186003)(4326008)(316002)(36906005)(6916009)(8676002)(107886003)(83380400001)(356005)(5660300002)(1076003)(336012)(70586007)(70206006)(956004)(2616005)(478600001)(2906002)(82310400003)(6666004)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2020 15:56:31.3851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d79020d-0442-4e90-3db2-08d87a90df60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2970
Content-Type: text/plain

When having rm_work and bitbake needs to re-run do_deploy, we need to ensure
that the ${B} is re-generated, otherwise the deploy-xen will be empty.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-extended/xen/xen-hypervisor.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 3bfee8e..6a75d16 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -76,11 +76,13 @@ do_deploy() {
 #   at least run afer that task has completed
 # - the hypervisor binaries may be included in the image filesystem, so we
 #   must ensure that the binaries deployed match what is staged in the sysroot:
-#   so do deploy must run after do_populate_sysroot -- which is always after
-#   do_compile, so that handles 'after do_compile' too
+#   so do_deploy must run after do_populate_sysroot and after do_compile is
+#   also needed for when having rm_work and bitbake needs to re-run do_deploy,
+#   we ensure that the ${B} is re-generated, otherwise the deploy-xen will be
+#   empty
 # - add the task before do_build to ensure that deployment has completed when
 #   the recipe build done stamp is written
-addtask deploy after do_populate_sysroot before do_build
+addtask deploy after do_compile do_populate_sysroot before do_build
 # To ensure that a deployed hypervisor has matching tools, add a dependency to
 # make sure that the tools have built and been staged:
 do_deploy[depends] += "xen-tools:do_populate_sysroot"
-- 
2.17.1

