Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.64])
 by mx.groups.io with SMTP id smtpd.web12.28259.1604304870698525769
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 00:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3r3OyefZ;
 spf=pass (domain: arm.com, ip: 40.107.6.64, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SgUE26vypMvPlU3cmgiGUtKEFIuVhQQOmGzOEY3Mck=;
 b=3r3OyefZMT7F++3nmfEqF14iioHQlvDMBe4pzCx7x6tbV9mHGrRvIX2M3FBpN0XI+ItYAgWigoyceNLMmgXmkCKDV4zIotNOiX5zwE4Glbbf4pfNBCXL+WMAukw1C1nR3kr4hpWGxrgv2EggrEz7eMmR1iOk3Ow+iLnX+Ff36dA=
Received: from AM6PR04CA0032.eurprd04.prod.outlook.com (2603:10a6:20b:92::45)
 by VI1PR08MB4207.eurprd08.prod.outlook.com (2603:10a6:803:ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 08:14:28 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::2d) by AM6PR04CA0032.outlook.office365.com
 (2603:10a6:20b:92::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 2 Nov 2020 08:14:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 08:14:27 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Mon, 02 Nov 2020 08:14:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7bdfebc29648ea51
X-CR-MTA-TID: 64aa7808
Received: from 9895a2eb0e7d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6B43290F-FEBA-4A92-A94E-DE83A77A0C8C.1;
	Mon, 02 Nov 2020 08:14:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9895a2eb0e7d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 02 Nov 2020 08:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rmi3VJoBM8JI58EMASEZ9v9k49AYEYQ2t/WKts+eIWXTdNzaUTth4rQdGUQbGcXGAvT4n7FX3xlVhZVwF0dZtruBv4hLwaadG4j42fgApIhQjy+klcBNPubouHYBI8uAOm0kx0+Fb2DN8aVe6h9fIZACG8WXRaqaWsV794+BfqsIFcmLSX76O/qjqX+Y96Mp+PgoRlro/JUtBEc+pEfBf5yQsu/EIldONJYqTBXyuBQ1oxRbC7AmQMhglC0g+M7Agag+a6jDuu5oG+4E3FaxM6znNpjspAptNeHR7KIhzoMJ0ywuPpmw7PrdZxUqt77hKCyhC8KQq3hvmET5qZIbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SgUE26vypMvPlU3cmgiGUtKEFIuVhQQOmGzOEY3Mck=;
 b=QtBSZH5F+FRepr+ecCQ1R8TGocPwRt5GnQrEeMwr9ODQok5O0zFj/VRyT/SVK/c93kkYMeHab8IICiuHYv0/WYXMY4xNixkYJ3LH5zZffLBTvBMfyaI6hBwhLVGYs/+9djJrQF4Jita4Fl1r5Lq38Gfm+WLRchrKnOyLo7Q2rlcC9uXLLJxZdSeOC7ZUQUe9DQ1WKoHSRdwwlTpHpNZ72nbsSaOZYsPhOTg8w85V6sdjPSPbu6ptV0lcNSQTllTsaWCVhrOITMfu2T4V1nwSRfXVDUC/DO3SqPKPyj4x7TK+mPdgLn9VHg/Viha3ncBQI4Z4wSIB3bn0W3oOVRf3EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SgUE26vypMvPlU3cmgiGUtKEFIuVhQQOmGzOEY3Mck=;
 b=3r3OyefZMT7F++3nmfEqF14iioHQlvDMBe4pzCx7x6tbV9mHGrRvIX2M3FBpN0XI+ItYAgWigoyceNLMmgXmkCKDV4zIotNOiX5zwE4Glbbf4pfNBCXL+WMAukw1C1nR3kr4hpWGxrgv2EggrEz7eMmR1iOk3Ow+iLnX+Ff36dA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1618.eurprd08.prod.outlook.com (2603:10a6:203:37::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 08:14:20 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 08:14:20 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>,
	christopher.w.clark@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization] [PATCH v2 2/2] xen: extend SYSROOT_DIRS to include installed binaries
Date: Mon,  2 Nov 2020 08:13:57 +0000
Message-Id: <20201102081357.4975-1-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.55]
X-ClientProxiedBy: LO2P265CA0429.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.55) by LO2P265CA0429.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a0::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 08:14:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 22a55115-6a6f-4b7b-3647-08d87f075125
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1618:|VI1PR08MB4207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4207E4E076D178AC4338E38792100@VI1PR08MB4207.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:586;OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RNRB57HjGBaubVj/p57YqrdR1bQp1T2RGy687NlglQnQSG8WZpgDOqbr8LQDParbQdUrdXseMRcDMnIS9Bz6x4Uld5V9SzP0kH25R18uHQu+VWxxC2VQVKa7pXI8GXfAYNRtoZiJNUFkBgReoJCFiZG1uzzZDGxKlYlNzLFV/UjfaxqWHtuieulqVbUVurkQ2l90bPjwprgdFUpFiSKwO6bFgpQ/GM0GRWx7I2bzgWh4iTaByjHQ1IUt8L0QEfwlPz+rlZmMQ+QhxL175c6G9fG3zTsWokWnvSZSUKUzoDOJ4QekyuNMnr3Um1VYd7ObNE9wyu7d0TdE2/Wzrwx8YA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(36756003)(52116002)(7696005)(8676002)(83380400001)(66946007)(66476007)(66556008)(316002)(5660300002)(478600001)(1076003)(956004)(6916009)(26005)(86362001)(2906002)(6666004)(4744005)(44832011)(2616005)(8936002)(6486002)(16526019)(186003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 F6AuXrY6hDVhRezqN0agenl/FyPBf/dUEtrIATse0qGUySlpr78wSwO2M0MDEdSfDrOnJ6QVVh0Sj01emsbq1DJCb2Ahpso6sd8+PxOiNDNL6L44V9uwdRt4RcY96LA1Sb8dNSUsrJto3QBueZ/kzy1S0BQjqlHxM4h/AjP3uC/Tfh4kpgj+yIHpvd4O7gNu5yoSXPC7DzYWA8LZG159yUw0qpc4aRDAtvtR3BLo2jCg3BmepqNNoMFug8XgYE1QVQYG6jDJWKzibah/S2wpvJucomWu2WRRfg9kEuCqcfLvaG9NAfI1bnA8oxAYtOo3soJofLrQADLMO6HAvsRmZAwJefIu/6Ou3dQKbK48GpEck1rWufpz7evlf2akoF7LQPUTdkeQkET9kNNJ9jDqLn829R3Awr/xuyDrWBH49nVVHt1x+pwFv7n3fsVQ108wIY3ZrUBCQc14ygJ/lMSlNLO7SS6sh3f6VhjcWCZDPUCbkebODM1ZwzUD+pGbs7QVf9URCdP+ravKP8yQB8544ySVjAX6iaGZJQk6x6AHvvqYC7Xv9HKD3BY90KUwDVi7PvrMGcP9LnwGwASl4Gzr2m9Ip8+XKqm2i5cvv3FobRsVchg6VZkoe6w+7rF3dKlaGc82zW9R/JHqBlsu/xmqsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1618
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5ed9245b-ed8f-4895-aa96-08d87f074c77
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vphL0JNaYJ8HGfCdrW5KW3oFCNXnVk7ZcOGfzp3IbmT6HJAsPBebo8m7OZf+F4oTnkdUbMdAoOAZB4Ywm97BrrBpBdOKWTkhuC0RMLz3a3dQipPyHqG/aslvv1wa8p8h+TKKGcOdr0dKrngmsUIoog1Eqy16YSoVoTe7Gv0qOjRiSdgiNJHwLJKTvPWPzMNX8QVJl2Rv1i+9d7OqcFGwpFKqDbA61b02oxQu674mjGkupLOFCUX3lvuommtUYTcI8sHtpeOKauCsodWf/XDDTOsmCMum6HqP5Kq9YkjKxJc29SJ1+G+YX4tsDGPW2oP9IduGRhOz/P//T/VehKag9ZZkmlfOD8BMuPuKi+sDAgtE0v1vsw6dfjgdDK7sxJD6oCttSiYpukk96IRmxuM60Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(70206006)(6666004)(478600001)(956004)(86362001)(316002)(2616005)(4744005)(8676002)(5660300002)(36906005)(4326008)(70586007)(1076003)(107886003)(6916009)(47076004)(82740400003)(36756003)(26005)(2906002)(16526019)(186003)(6486002)(8936002)(356005)(44832011)(81166007)(83380400001)(336012)(7696005)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 08:14:27.4717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a55115-6a6f-4b7b-3647-08d87f075125
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4207
Content-Type: text/plain

If a recipe DEPENDS on xen we should include its binaries in the sysroot.
The do_install task also ships files to /boot and /usr/lib64. Hence, extend
SYSROOT_DIRS to include these paths.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
Changes in v2:
   - Updated commit subject and message

 recipes-extended/xen/xen-hypervisor.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 6a75d16..916bd3c 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -55,6 +55,8 @@ do_compile() {
 do_install() {
     oe_runmake DESTDIR="${D}" install-xen
 }
+# The do_install also ships files in /boot and /usr/lib64
+SYSROOT_DIRS += "/boot ${exec_prefix}/lib64"
 
 do_deploy() {
     install -d ${DEPLOYDIR}
-- 
2.17.1

