Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.66])
 by mx.groups.io with SMTP id smtpd.web12.13910.1595515621572436076
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Jul 2020 07:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mW7SCaXn;
 spf=pass (domain: arm.com, ip: 40.107.6.66, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RpL9rOFMX9DmbgZxuRL4OnyUO8zlqgWriCJh/gLE+s=;
 b=mW7SCaXn4qAcMSh3dsGYsy7F21R8zhI719zTu/2Mz78AfJazog/+A9tMsygij8gPFbyjLpciCx7ni72CErPTjqhng8KYmCFcfvtvSwbd2Yj53nj52K0UUsglOe3c86GDTP0avFH9TB+4IupZIOGrNJPJ7GiIpdUKtCMxDJ8CK7A=
Received: from AM6P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::34)
 by HE1PR08MB2891.eurprd08.prod.outlook.com (2603:10a6:7:2b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Thu, 23 Jul
 2020 14:46:58 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::6c) by AM6P191CA0021.outlook.office365.com
 (2603:10a6:209:8b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Thu, 23 Jul 2020 14:46:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 14:46:57 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62"); Thu, 23 Jul 2020 14:46:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5ed76cc10a7e6b30
X-CR-MTA-TID: 64aa7808
Received: from 26a87a277271.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BAF30CFD-C3E5-492B-8680-67F0EFB4B50D.1;
	Thu, 23 Jul 2020 14:46:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 26a87a277271.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Jul 2020 14:46:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cmrzatm1aTTvCl5ZS7CSKroXOXk/xKCUY1m9TuAIg7QP8JWneNtBfReCD2eiKRtLW30kXqMCEMD1yjfTg2SQj+9ELTKaBcarxvf9iTvHF1PGW2k1o+3xH4idL9qReftj3x+aVLtP7QhT3sH//bnxjtrOAruiCUDnXn8pMYiStQZi1+blPWKQKfvzoVxqlXaW2mUO8/zBw89fKYfETBIU8ufzoHWO/4VJ0ULSuy6gWzWkOAZll4O6jTyco6IUopNHDTJ0oPuhvTDobezQ+BETUBdtwVZz6uceNInL2nZ+rdIONowMfN6JjTw3Aw0p4YQbiJXghOdL467e2Be+t9BzoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RpL9rOFMX9DmbgZxuRL4OnyUO8zlqgWriCJh/gLE+s=;
 b=kj41MSOAwZuzlhsrObORqzNdDXsR+10Qc2qZikOqfPS03ILOn6VuTVIIRNOav/bhnyog516D9Oi9EgU9eipYeZDh5PV5c8zFKCg+tu7xuGzKKECbNlc74SNwezCY5CI5NLiGs7hsH/Ja0p2lW5raF7yrC70JUbpxm2p9f5vnuRwJO4+jFA0uzlR2XNki8BfQ8VgKRxkA+6vBkHr+l+VQjR3hTaa0Qo7YJNoaRb1OBXO69IUDvSyMtPbQ3HqKV9Y69u0LjShgIe510gK55P+Qpe9k8K5t9bkyeG3K/ffHXHkCN4JQ0R9CUVEkflIj5jHDMdglnN0WS64AU9ezrPF87g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RpL9rOFMX9DmbgZxuRL4OnyUO8zlqgWriCJh/gLE+s=;
 b=mW7SCaXn4qAcMSh3dsGYsy7F21R8zhI719zTu/2Mz78AfJazog/+A9tMsygij8gPFbyjLpciCx7ni72CErPTjqhng8KYmCFcfvtvSwbd2Yj53nj52K0UUsglOe3c86GDTP0avFH9TB+4IupZIOGrNJPJ7GiIpdUKtCMxDJ8CK7A=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM4PR0802MB2324.eurprd08.prod.outlook.com (2603:10a6:200:5f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Thu, 23 Jul
 2020 14:46:38 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22%5]) with mapi id 15.20.3216.023; Thu, 23 Jul 2020
 14:46:38 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization][PATCH v2] qemu: Remove duplicated xen PACKAGECONFIG
Date: Thu, 23 Jul 2020 15:46:37 +0100
Message-Id: <1595515597-112052-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0275.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::23) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LO2P265CA0275.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3216.21 via Frontend Transport; Thu, 23 Jul 2020 14:46:38 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0e4ffb14-399f-44ca-a720-08d82f174013
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2324:|HE1PR08MB2891:
X-Microsoft-Antispam-PRVS: 
	<HE1PR08MB28913674714188AC2EB468D392760@HE1PR08MB2891.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:849;OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 D5f+dN/jz8EVKVgo+9USRDjC17Ko4oRmUoj5hTxK1DpZ2s0Y+JZ92Kuw4IoJtTNsvRF7Xlp/qMSm3xkgVJ+uQbnLIHtvto1ioLy/yrODwq7fDp3hIDSNvUyl8I6yDkovnL2Fzn3qPMTF3Nm1Dhvo8JJ93SueqYq8A7lDoDpmQcEOUU7n3LVlIGL3L12pyqHQ13uGD5jaZgTr8jIHwlzVH9Bnm6i4o+DhqyLvKOIf8yiDqgHe3te5uxepMboH7fOLyS/7JmBPO3NAXc1GRrSMuimtK2vv7XCpxabguSt+268owNB0LMyW727pngFinJOF6ca+GsP0HurM+Q5x/Jc9Fw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(5660300002)(66946007)(478600001)(7696005)(2906002)(6916009)(52116002)(66476007)(4744005)(316002)(6486002)(66556008)(4326008)(86362001)(8676002)(2616005)(956004)(83380400001)(44832011)(8936002)(186003)(36756003)(16526019)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 ZLZCd5DUnjlWADUa8/Yq7eqiWyvz06MGSlH3jRIZBxpyI/7pkeo9JIvNeEfC35/DlZc106XOXOnOhTJDBd6WL3zOWVD/sGcoekLhecv6xsnsBTJzB3cCHNzVWPJYY0NMRTW7SrYqAYN+EaK3aYfFp0IraBkdRAKp8+vanANDGbDOjJsiV1HhhaVPwANJUxkVh4giLHKbcmTF2dkMsC/EEyFLgbMuUFIeIoq3bpG+8ojWiDbvNs1DzZJvLWtjaRaaY84fOoLgY778xNCVaaigLpYifS5tHPZ1kj4str2u14Qt9IkR1C7PJWRsphEKIPspTSomrEQGs7yKRpZNxl2jm7rSciiIoFb7aO99vUVs4IDBPLKjnHoSOPTVjLzGSKj1BL06MKCGzGEeqyDDe2Q7lbwmvBT9lXhCTU8nf4kgng0o5lV3pbREhw/XG48hzO0h5biL3vSi0KytXfw17dgjHLn+/tGUpl6B43XcGFeFafffELanaVR/yDEwBFD7+uP8
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2324
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9ab05c8e-1062-4ffa-c69d-08d82f17346b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a+TdZfuwI8fEHRAFmDyzHRy3r4juRUWUP9Hh9eHWeFTLSX8mox2opibtemEtUcuulOHqy45ei7fATDTo/5NoVmL/ZQd7UfE/Q42vNCMBlK+ry3334iSDK5k4t4esfxABK5MBahSA0AvIAgbmt1MvMuHGewweORfH96qdyzeDLelSTUWty/iOedky5Ne+n+5/jrnnDBSWbLFIyEPvtMbNNxM8MZeN5lL9WpBB2PkKgt2ggHgRjkyNL6IoiO/rLY+VMDj0uKIdefrVFd4uwWMf8PyXn3YNe8Gc2Za//T3jPF9kwgJLU7azYCGD1mlEdkLitTLw590en8Ju1+YGnV5yII245P/xWSYy20jUmjV25o4onUuK1saR82E/soBZWZeT+HO/Y7Pc3i6jB7wFUfzw4Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966005)(86362001)(316002)(36906005)(83380400001)(26005)(16526019)(5660300002)(8676002)(81166007)(356005)(6486002)(82310400002)(82740400003)(186003)(47076004)(70206006)(70586007)(336012)(6916009)(956004)(36756003)(2616005)(2906002)(478600001)(4326008)(44832011)(8936002)(7696005)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 14:46:57.7558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4ffb14-399f-44ca-a720-08d82f174013
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2891
Content-Type: text/plain

The "meta/recipes-devtools/qemu/qemu.inc" already sets the PACKAGECONFIG[xen].

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-devtools/qemu/qemu_%.bbappend | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-devtools/qemu/qemu_%.bbappend b/recipes-devtools/qemu/qemu_%.bbappend
index 998a401..5cca9e1 100644
--- a/recipes-devtools/qemu/qemu_%.bbappend
+++ b/recipes-devtools/qemu/qemu_%.bbappend
@@ -1,3 +1 @@
-PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen-tools,xen-tools-libxenstore xen-tools-libxenctrl xen-tools-libxenguest"
-
 require ${@bb.utils.contains('DISTRO_FEATURES', 'vmsep', '${BPN}-package-split.inc', '', d)}
-- 
2.7.4

