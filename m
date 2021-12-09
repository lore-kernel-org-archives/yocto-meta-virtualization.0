Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web08.11644.1639058349347502551
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 05:59:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=v1Cbb7Bl;
 spf=pass (domain: arm.com, ip: 40.107.21.51, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAv2uzqAKbDZAs9MviADPkSJdXQQg2UOI+aDyuS8qFg=;
 b=v1Cbb7Bl0NpD3RlucIaoO3YvV+LaGQ9/95fJWX+27U9ZapkC1VBh4L7FAoYZEjpBqAH8DItSE+x657ykac0HiXDOaXvVSioXW4NbyW8V60rskqyiCWeQw9uyjl6nzUE2jozro9aN4+KYuzIVoFfRUAo9p01CcvZDZTeUp/yYfWA=
Received: from DB6PR0402CA0002.eurprd04.prod.outlook.com (2603:10a6:4:91::12)
 by VI1PR0801MB1790.eurprd08.prod.outlook.com (2603:10a6:800:5b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 13:59:04 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::90) by DB6PR0402CA0002.outlook.office365.com
 (2603:10a6:4:91::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 9 Dec 2021 13:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 13:59:04 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110"); Thu, 09 Dec 2021 13:59:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f7e9ce4c5ec755a
X-CR-MTA-TID: 64aa7808
Received: from d1e47ab0ca50.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 86EA0A7E-62F4-47D8-9635-13DFF3286845.1;
	Thu, 09 Dec 2021 13:58:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1e47ab0ca50.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Dec 2021 13:58:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwU14kqqua4CtHLyMSUq8ROZwhOWi+XS/3+npHY5n0WtgAOcOYQYqrbBmwXluE5DAsN/isvAuZjjhma52YuOx4HNh4R6fL0ifhKaeEpyffji/MSnVs6M0W/hBRQVEf79okr4orehagJ4gWHG9VklcT4ltDQmAMq4HwLA+zaLnFWtV1aBrQyI6H2kzisUl3yn57S1+6yRayfWvhSfin00zip4ah+aCZqLmG0twn1MUw4SPYkPXmfcGWoCgfO1ukxI3kNPXRp5DVG8NnxXvZlP7rI2oAhJS3QjQJ/PVobyY15e/T3Gzn4m3XFUu+EactIyLw/7Z8IaflObD4gp5S+TkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAv2uzqAKbDZAs9MviADPkSJdXQQg2UOI+aDyuS8qFg=;
 b=AHltqZztFykmo5N65+RqCEBSEUe97mkNxcoX8ytT4u9558GGkarhhnDZHc0w/a2RRxKRXwcFWjCsgMv1TuzJoqmpr1l3n+soVtzmm/wGK72HjxA1DQe4d6Hf94hs2zCkjxQUVNSNlXtD6OvpLU2KF/5nSDjUpi5MBSKKdd5B5KqCJkFQn248M6yqHg3diY3ZHeQgMQyGEuHRJ7z72dVNn+lz2chVBMTqGYRGH71qjsdLJU7HIuzkYMli1FJkNyQLv69TjmO2G16FIjR/9Rm/vAz8EIdqefjCY2GvZlh21CEb5H5293jqof0+JYjIh+fO3rnoQo11TOXISzP3hztNHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAv2uzqAKbDZAs9MviADPkSJdXQQg2UOI+aDyuS8qFg=;
 b=v1Cbb7Bl0NpD3RlucIaoO3YvV+LaGQ9/95fJWX+27U9ZapkC1VBh4L7FAoYZEjpBqAH8DItSE+x657ykac0HiXDOaXvVSioXW4NbyW8V60rskqyiCWeQw9uyjl6nzUE2jozro9aN4+KYuzIVoFfRUAo9p01CcvZDZTeUp/yYfWA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB5979.eurprd08.prod.outlook.com (2603:10a6:10:205::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Thu, 9 Dec
 2021 13:58:50 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::74ce:3927:b1f1:10a1]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::74ce:3927:b1f1:10a1%7]) with mapi id 15.20.4778.012; Thu, 9 Dec 2021
 13:58:50 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization][PATCH v2 2/3] xen: Clear TUNE_CCARGS for Xen build for aarch64 machines
Date: Thu,  9 Dec 2021 14:57:51 +0100
Message-Id: <20211209135752.6872-2-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209135752.6872-1-kamil.dziezyk@arm.com>
References: <20211209135752.6872-1-kamil.dziezyk@arm.com>
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 478343a3-5e8d-4754-f336-08d9bb1c0f73
X-MS-TrafficTypeDiagnostic: 
	DBBPR08MB5979:EE_|DB5EUR03FT025:EE_|VI1PR0801MB1790:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB179043C4D0A2141566DC6DFDFD709@VI1PR0801MB1790.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2Tcdwap0adhy6wl55UG8URtpYTtnIyAvnSvJbbkfMqCqmo4xT7oChJmzBiSEEdDnL25Xv6LFEGyCm8PjkImj1R3x60+ONiNy8Dw0/wv1m5exJa+q8Ua5Mri62ps1piAPvh8Bhi2TNQ1ir5PHFRCTsS3p1ZZRz19wylMXFEYbrsxQRR+tLhTCQuz1aKPDEyDTHR2KT1SGy2BOvDvIaVgglDkadjW4tOYS/2YuW5qmLRZHGhv1f6L45kZStfcebj76HK04npIxPYiIdTtrt4HyGHX1ms1Dm3MCgpcTwWqJ//5S7gcTLX7iIT/ykX+UWpFi6I6yAymyMzdTLWaQb+0OzLXojVhAD4YWgfDkJh/vENLRaKErFdxEeCpIlqP/BbmKw5w6YU/+iqnFFa3QCKWSkmePQQNuPOPCW8B4RL81Yk2m4MtBlEKcUPdBxWsnOPa7DrA51xRyeIGmyqxK8fmTkXXicmYhpizIwma73QCbKjgY/s1049wN5BzVNzaK74hB6m1sXx0uuZ1oSxPD5NPnQ2frOoIJwlB6mF0enAZEa3SF4bIeEq+6vwzpHG6LSb9cHvn7yUnlNzoGj3Lub1XHBUmP30+3/Gaquk44XnHUUtDyuO7XlppkoK83bHZ/ACh/caJ6Bk8pmPkqoH/TxSCMSvzvXLGOKY6Pm9TbSGpsk73Xr0pbE2vb2I3jdAzAQ8QtONPz55VfrxN7w/gW0Xre7g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(1076003)(38350700002)(38100700002)(2906002)(83380400001)(6916009)(36756003)(5660300002)(316002)(8936002)(8676002)(26005)(6486002)(6512007)(44832011)(86362001)(52116002)(508600001)(66556008)(66946007)(2616005)(66476007)(6506007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5979
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f2731392-89a8-4811-ea15-08d9bb1c063f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bRTi4DEPpCy79zI85kZ47XOGMGubvTi9QUreP/zyzSzwROn6XCIV1lEsodJHr0P9+BLrjZ3jkJJn45emH2vxQak+XyrAYIkike78ydZkEway1hdHA9SZ3RCJnhd+4YaLjeGkK+bJN60lhD2Nq83LSJwPec/qxmpYsHaSjiXvQqsTw46w7IfLPoIcVc5hGS27P+u6YUUay3mD9DMkaQL67KAJL1G5bGEstOiK0ZuOed4E6NWrZgWfb6w+lfsM7rlmB1MeA8Rm6Wu8/2n3Raqgmb0CxKUsfHg6W3Jt95KxxrQnnRF9dOfbq8wjOJLz1iJEv79Q8Biw7ERFCeIZIwIgBVV1Kf77Q/goB/QYJ9u6qN38duPooH8G4rAjr9aSGnT3lkkRMz2aPkXoQ6CmMSgMtDRwbz43bpH5K8cj001ECTbAfUmnq+0lnYWkC+gLxkj8Czj3YmtDRjIcYNN/k4QWTbvWmJpPFmwzR1n52c4ElQdCbK59O5nDSQErOVifFHzTvfS7PPRkdr8bcGzEuhlVFUYlrkYxyEI877OW6crJlfSdKs9lgXUBNqqsJBf/ugbXz1xI0t6d+lbMXOCAwmdA2GinyDmTLCPI+8axHY8OzbMBhbZxq+jqvd3rdFBPwJhO5g9H/vZtp+dgXnWUM07vD0GCnDriFcy4yNJONq3pzbgYQH/KBhF3toVLoJF5VxaY9RCg0kMwxNq5SSS54c4oDWROfNSa+rX/TqOXTK3Ez1fP6Pw392mWttpxw2fQTw+IWP1I06gJeGMCj/64P2esjQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(4326008)(81166007)(47076005)(2906002)(8936002)(6916009)(356005)(316002)(8676002)(70586007)(6512007)(6486002)(70206006)(5660300002)(83380400001)(36860700001)(82310400004)(40460700001)(44832011)(86362001)(26005)(186003)(6506007)(336012)(36756003)(2616005)(1076003)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 13:59:04.2301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 478343a3-5e8d-4754-f336-08d9bb1c0f73
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1790
Content-Type: text/plain

Xen build may fail for arm machines that have enabled extra flags,
that can be enabled only for specific architecture version, e.g. armv8-2a.

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 recipes-extended/xen/xen.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index d3c7a7d..9ac82ef 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -102,6 +102,11 @@ EXTRA_CFLAGS_XEN_CORE="${DEBUG_PREFIX_MAP}"
 #   EXTRA_CFLAGS_XEN_TOOLS: so clear TUNE_CCARGS on x86 to prevent that.
 TUNE_CCARGS:x86-64=""
 
+# - The Xen build for aarch64 systems with HVM-mode enabled may include
+#   architecture specific flags '-march=*' which causes build failure, so clear
+#   TUNE_CCARGS on aarch64 to prevent that.
+TUNE_CCARGS:aarch64=""
+
 # - Yocto supplies the _FORTIFY_SOURCE flag via CC/CPP/CXX but then passes the
 #   optimization -O via C*FLAGS which is problematic when the CFLAGS are cleared
 #   within the build because compilation fails with the compiler stating
-- 
2.17.1

