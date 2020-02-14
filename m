Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.44])
 by mx.groups.io with SMTP id smtpd.web10.4452.1581675465246568713
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Feb 2020 02:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hE6ACNE6;
 spf=pass (domain: arm.com, ip: 40.107.7.44, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhQV4lql6INccGpFM4imE7Ut+t32+kVr4KJL8Qgxkc0=;
 b=hE6ACNE6EKUmHr7us4LC0lpqEe8MlgiuMU26a4kut8wd5ZNvTXqEC8YI0hZrHd/Q1+eN2WV3li+/ZbNlW4qYk3XSVGfgZLWV8ihhxEL+lcQpGLDm0lSeBKt2olisOWikzYF8SSiX4ltomuhJGo1G0qatGv5dyu3Xv2q4utjUfVg=
Received: from DB6PR0801CA0064.eurprd08.prod.outlook.com (2603:10a6:4:2b::32)
 by DB8PR08MB5290.eurprd08.prod.outlook.com (2603:10a6:10:a5::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Fri, 14 Feb
 2020 10:17:42 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by DB6PR0801CA0064.outlook.office365.com
 (2603:10a6:4:2b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24 via Frontend
 Transport; Fri, 14 Feb 2020 10:17:41 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Fri, 14 Feb 2020 10:17:40 +0000
Received: ("Tessian outbound d1ceabc7047e:v42"); Fri, 14 Feb 2020 10:17:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 028948c3189e08d5
X-CR-MTA-TID: 64aa7808
Received: from 0106c986e2ab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 567D91AF-EED9-4AE4-9F90-D568D0414D9D.1;
	Fri, 14 Feb 2020 10:17:34 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0106c986e2ab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 14 Feb 2020 10:17:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DheZ+ocjZTgvICUM8kR/dUceZSGhJm12BWsP3s8398XwBzgBNFmzScImQMlDf5oJ5TunS+Xy/byAl3xT0Snl34aRZQacK0cCBkT8GZAcVt+eRMuPK/6Yqa9xndJ9MrDW2hAPwCSEFAMLFmOgrh05NLcBk4ppyR7VVSmCqBQtYlTCeMuZb20jwww8O7wqRgUC3auSqTz44UwJz9DQCkCB44vybZgEqre0uymqTni1C75r6YG3LGIENfwKgJIBiqKEQPW59ZEIQhmUqQ/6YS+kIRJv8qPwuufXdk8WqqenLhuuctzJMknodxcek2ybAd0IsbYxB9N9DkA7zcizWxvE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhQV4lql6INccGpFM4imE7Ut+t32+kVr4KJL8Qgxkc0=;
 b=oXJysAzQ6qn1gVQC7lA1HmP1MpCheSePepwEX3bFWWvu8Y1lUAA1ewuGfAysGKHjOJ44P82vT+Hli/PFvVRyd58TT9oDdNogc6B8cTITtbTErDPAVGIYzRq65ToxUEEvj4FrKiYO//69D/wDI1PZLdeU6a2TM1EYdX+oTTWO43qRPtRHjrTVzEN0lN3tM+MWu4nrVa18Bj+Gs8vAhhUEqdi+TZmnHOH5wjbTY+XHJTnrPjDhPbN0tzEuZoVU/pIgra3V9fpMUXbc72Tr5Byx23l/8gT0nKpf33xK7sUmB6WVs2b7m7KsryISzKSp9jn51hxXmJzakdIrbipq/SOkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhQV4lql6INccGpFM4imE7Ut+t32+kVr4KJL8Qgxkc0=;
 b=hE6ACNE6EKUmHr7us4LC0lpqEe8MlgiuMU26a4kut8wd5ZNvTXqEC8YI0hZrHd/Q1+eN2WV3li+/ZbNlW4qYk3XSVGfgZLWV8ihhxEL+lcQpGLDm0lSeBKt2olisOWikzYF8SSiX4ltomuhJGo1G0qatGv5dyu3Xv2q4utjUfVg=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3196.eurprd08.prod.outlook.com (52.135.130.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Fri, 14 Feb 2020 10:17:32 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::858c:5c68:18ab:4757]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::858c:5c68:18ab:4757%5]) with mapi id 15.20.2707.030; Fri, 14 Feb 2020
 10:17:32 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] Xen: fix do_deploy dependencies
Date: Fri, 14 Feb 2020 10:17:19 +0000
Message-Id: <20200214101719.6674-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::33) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
Received: from e109506-lin.cambridge.arm.com (217.140.106.52) by LO2P265CA0021.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend Transport; Fri, 14 Feb 2020 10:17:31 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9675008-5049-414a-7546-08d7b1371fcf
X-MS-TrafficTypeDiagnostic: DB7PR08MB3196:|DB8PR08MB5290:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5290FFCD164A860EF772B6EB9D150@DB8PR08MB5290.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-Forefront-PRVS: 03137AC81E
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(189003)(199004)(2616005)(956004)(7696005)(52116002)(1076003)(8936002)(26005)(8676002)(186003)(16526019)(81166006)(81156014)(6666004)(316002)(6486002)(44832011)(4744005)(5660300002)(6916009)(2906002)(478600001)(4326008)(36756003)(86362001)(66476007)(66946007)(66556008);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3196;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Ys88wRcrWjBYMzmZiV+gtH1MhY1Oj1uUY9t5Zq/d5s7YsnRkdP8gGdYCLu3vV4Z8MWPzmZ7/FzVOL/mQX9hyySqv/Of2Q1N9PMbR5ZIQgp8Bgo7Ky6DnkN3pskY5zia37PhFaeSonWC0eHk3ze/cYe0O6uj8+QzNC2MW/xpuYAUzq//5xWQURkY5TGs3Zm8hc6qJTWegWUgB6ORQ2wHaH3cSY/7DrSK+Cgw4g4o1ycCK377rXwDEgeImDsTI8/6vfr4dYloWAuYqP1AbLat5EYf9Cv7o1rTsDC5BXlT6RrxznwoO4COE29hqAxQhICfY4Z+aQ7B1SY8PB1lX0CdLPwdSzMzT4S7OMj8mpg91z4uybJbewks5rYNdBuIbVhZNjzEchzL0HFlwhgEDuqJnVMvJyv1SLlR0iXKXKZ6yfFeJMn+cL+RDOtKGYxjuFE0w
X-MS-Exchange-AntiSpam-MessageData: 
 LV3nLrFgvAvmLDXGIjqI+ksfgMRfJUhPQnCAP+whSTpPRaGee5jSTFRzRzhcYKx1j/l+MBkkMxbTVd6VlTkjJm81jz/zBzaWqgnVLSqAc+BMmmzPBnSDNje2Fxb2WgItLRGXx0NWM08c0LxkKtZBOw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3196
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(199004)(189003)(8676002)(44832011)(81156014)(4744005)(26826003)(7696005)(2906002)(81166006)(86362001)(5660300002)(478600001)(8936002)(336012)(36906005)(6916009)(26005)(16526019)(186003)(6666004)(70586007)(70206006)(356004)(1076003)(4326008)(316002)(956004)(6486002)(2616005)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR08MB5290;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7225a71d-d3ed-4611-1603-08d7b1371a5f
X-Forefront-PRVS: 03137AC81E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BeBd6pgjwTV/sIVGlfxj/Z1nNpn3C1ObgTK7K8cnS1sKoVh7N/jPilLtuMECajy0vhxf1boWp5OVA6yx10ggwqpwPYke+VMa2vBq0dj8ktstbjVTF71Xn+FEO/AJd0Gq97ze6uu9aEs6C64uYAFp9VvP8+XQLucFdOhIHPro8T59+TiG1qg/9H2cL6D1KSvJcUg0LtBSnAoKu+nP4IPTI8tqgNKOkHvIQSS/p2Njs+A6AVrY708DqkWIFk8CFRxkBIJXl/g2whhLOrdI3LAzhQbfF6sqapsr/+ECUMg7rYp9XvgkestwN2KwBCfk8XsohybD00r9eFr5p0gcSlAlX6p3XKGU/eVe/TLLMJhm4PL9jF90y9l8IzXTvkzBTDVCpvSaZgLujxD+EryPUFqaBQYW+GAwnf96cYfLUfFP3aKvPiFoYFvQozqIffli2eu+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 10:17:40.9190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9675008-5049-414a-7546-08d7b1371fcf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5290
Content-Type: text/plain

do_deploy is using the files installed during do_install and it must be
executed after it but before do_build. This is fixing SSTATE behaviour
which had previously an empty scene in some cases.

Change-Id: I04b1f652c697ed0bc7e262571dd03e123ac096f6
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 recipes-extended/xen/xen.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 36ab78e..41b1983 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -1099,7 +1099,9 @@ do_deploy() {
     fi
 }
 
-addtask deploy after do_populate_sysroot
+# do_deploy is using files created during do_install so force it to be called
+# after do_install but before do_build
+addtask deploy before do_build after do_install
 
 # Enable use of menuconfig directly from bitbake and also within the devshell
 OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
-- 
2.17.1

