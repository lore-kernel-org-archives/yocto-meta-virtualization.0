Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.88])
 by mx.groups.io with SMTP id smtpd.web11.34029.1620663374778932308
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 May 2021 09:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OzWDchlW;
 spf=pass (domain: arm.com, ip: 40.107.20.88, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7e2CdtTjZGI2ZvUboHfpVoNG0BKGFqww6mzAPc9q+Q=;
 b=OzWDchlWnx9RXi+yW3+HcCLRlQtpoEE9zY9A00WyVWcye2D3q7DXhI8s59PvHJJX6BYFnyMtmD+tpUURWg+7qpmkzfIi7jW4mUFVWhPNub+3XIEJQknZCQ6vxk87qdmH4/fNW6ylWbhgLx026trVj34h9QeJtsbzOtBiQGd5TYA=
Received: from DB6PR0601CA0048.eurprd06.prod.outlook.com (2603:10a6:4:17::34)
 by VI1PR08MB4525.eurprd08.prod.outlook.com (2603:10a6:803:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 16:16:12 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::d) by DB6PR0601CA0048.outlook.office365.com
 (2603:10a6:4:17::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Mon, 10 May 2021 16:16:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 10 May 2021 16:16:12 +0000
Received: ("Tessian outbound e566ed09e411:v91"); Mon, 10 May 2021 16:16:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bab14849a6d78ebf
X-CR-MTA-TID: 64aa7808
Received: from b546b6cf1408.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0977FCFD-438E-4239-8F58-C1E5D5A479FD.1;
	Mon, 10 May 2021 16:16:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b546b6cf1408.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 May 2021 16:16:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUnw9wwJqnkoNUOV0wGoWn5Eg9femVzHtoTGi+reshQq2yEFD/ikZYRzxZ6zeM0KvQdeW84wwSLV1R1bnWd6Ygs6T7ByxpbNrwgJzSRjbxcKWTIu4NKZuMioLQ72fZA0eOQ25HWp2/5Zv5n+nF/ySrZyT0GmzJQvACbKH43a5ILYovVXS/eAJyidx4L8+dDpTR67uDEGt93t3ksH/c4YRPyqy8nngxDRwVGcK/w5i/FYH0+5EvDjkkr1ChkdnwWA8mhkeNSFD/1saH7la1hkfQlsJcddMEHb4btyFJP5uQF7mruZapkbiBtSGrKnu/BpPopuy458f9iS5agl+zOuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7e2CdtTjZGI2ZvUboHfpVoNG0BKGFqww6mzAPc9q+Q=;
 b=gpp1op4Fb+v8FvUDzyzv7sl5wQamwaNAj0YrtYswirEV80Oadib24XVB8Zx2TtTfImqRKwDcfSpzRKlm6k5AMX9eYfbnbLwdZIRS7/eg6WNCbbtmh6s0nLyEYyVQo3RWRRD5Wv32h66F5qx63RUpmoKLB/O/7bYyWXtP7BNPQowYGTK/1axVmSEsBB5WzlOf6HHYniOu5BA8WQT0DTI+W2DO9xyXEAKNAtyNDl59ejLPy/kbNZq5rcaxcUbaEzZofyO9bkrGYBQJv7WoGzNk3KRgo1hVbuiQRSD6wqkxIdpdseoWuD0QMhK3d5PwobPBv48VRZmS2paJcIqi6buWeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7e2CdtTjZGI2ZvUboHfpVoNG0BKGFqww6mzAPc9q+Q=;
 b=OzWDchlWnx9RXi+yW3+HcCLRlQtpoEE9zY9A00WyVWcye2D3q7DXhI8s59PvHJJX6BYFnyMtmD+tpUURWg+7qpmkzfIi7jW4mUFVWhPNub+3XIEJQknZCQ6vxk87qdmH4/fNW6ylWbhgLx026trVj34h9QeJtsbzOtBiQGd5TYA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB2065.eurprd08.prod.outlook.com (2603:10a6:203:4a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30; Mon, 10 May
 2021 16:16:02 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:16:02 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH hardknott] podman: Update 3.0-rc2 -> 3.0.1
Date: Mon, 10 May 2021 17:15:47 +0100
Message-Id: <29f9bb8975f085f2c86087938b383895a3e8871f.1620663255.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO2P265CA0454.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::34) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.53) by LO2P265CA0454.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Mon, 10 May 2021 16:16:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f18b8739-d1cb-4e5f-df4e-08d913ceedcc
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2065:|VI1PR08MB4525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4525AFAB7F1065AECE0ED75492549@VI1PR08MB4525.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:389;OLM:389;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5EzfD2eKiMlgkd/iFsAyB70F9kDE1yf0Erkt423dbY+TTk0c5JLgH8XUakDYI6AQz32E+ZbB6me+ZWneCsQcOPK2UC2eWiNdbpCiSevzqH6X3otNw7q9cnxlb9inHlE6JD/iVJgBthIdtIRGkNQ9Dr2dE2iUveaIjnnVzXeSKltN0KIKSk26uaJoEc8BiuzeErpiDA4/bQG/NCQkYXts5CkCjHpu6TmtgP6N31hwRtPR09942OC+gbyr1NQwcPuCtvlp15F6BnKr4aPVERbNJMqRHgUGwy+tk5n0FiW5gm5S6DRowN5HwbbLwOIYBCVdFCAqSUfFhRqh0eFajz7htRwCxWCGObpg/SVUqLn35xFrQdmx/PAheuS7nhlN3YpRcLEHAmrIaVMVq+PQVk02wqgSeQOsk2rPtxJxgRj8NiVs/Nr5ie+jYF1bx3xcgIMnipUAyfVodRlGIUN0drGpkCCdwGYWOosaZDNxORzKJaNgyWh0OsjBhSWtQhiFA7Bm0kYSCbYVUy7ZSaBnPJC2GjuKmnQ+2EQczTotztwQhpkmscrh8jpTyBkm1awD5SxyJBqyVqNEcPky2sTxcKhfXyYMrO0AeGFTeRLbPEuxsFkP3njd+5rrtfBYrjtP+S8+NxvvC/dHOCh4Z9VzDe0yxictZD3lHWTHp+bvuU9pVHE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(26005)(478600001)(6916009)(66556008)(66476007)(186003)(5660300002)(16526019)(66946007)(36756003)(86362001)(8676002)(38100700002)(38350700002)(6486002)(8936002)(316002)(956004)(2616005)(6666004)(52116002)(83380400001)(15650500001)(44832011)(7696005)(2906002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?PYZQpSGsbKKFv+vZ0GJpDRbdJl+foGL55ZDK30wvJycWjtqBCA7kJRVYjFav?=
 =?us-ascii?Q?MBzWFgyurLz4r1etKAxw/R/5yL1Wgy5Idw6Jf22dVerCrIQNFj+JOtukrkJ4?=
 =?us-ascii?Q?B5IjQ1/53h7DSkGuod0b53qxxYdH0hYnV8Skg/IVadziqTLVD6xe357UJ6zC?=
 =?us-ascii?Q?ODuwra7L0Skawko0tMRQEc1KEwr++CpxrfXIgZqS0pdGr9yBPwons17uvQ8w?=
 =?us-ascii?Q?79hVvtL8zm1GEc44adD27PM8+pLlQnyDSuyXzYoHfy4brrwRgvq3NK3ItNM7?=
 =?us-ascii?Q?M+90rNafztRhtC3yiN67LCrKJAaOjbnu2ljgp+d44Pc3TsuhUxdPnkTWd4pA?=
 =?us-ascii?Q?Oe2ZM0L2MFN0wmLT4jF01423G9ev/q9M5jFHVM0wVKRJ/F7+mDwqlU8V/XuG?=
 =?us-ascii?Q?6rx/k4tKjo8u6NnziFUOqXOlsGTF/DK3fENyhUK6kp5xCDfzYXjSOtQTgkIO?=
 =?us-ascii?Q?1A60PGhf8CNaVNE/DhD9Z6Djjj2GfeqyaCVE0hepZZSun0IGCfOunszreq2R?=
 =?us-ascii?Q?9j4bADqgLyUBiAqqXZott/6kcvPi/cUKTPbk/M7GXcvhJyD1xjWBuM+g6gaC?=
 =?us-ascii?Q?XHlD0uY3KTDUoattWnTrypK9a0SMFvqB+FP68tkQ065Yt0asuP28f/6grgK7?=
 =?us-ascii?Q?xcRNBABpr8YsoamfjnQnunrBoyOM8ZaZ8+y40JPPb54JbnhwzHu9arIJ3+nO?=
 =?us-ascii?Q?Fy7tU4b5XGQdO24A662NLTMS2ygZvy2F7sSU3y8+XyEfDEwoDnRxYxZa3VB3?=
 =?us-ascii?Q?GyXDZbn6+ZRUg5YmwPqOs1lhy6g/dH29ObHB7DgPTwujJfOASjac1ILNmXSX?=
 =?us-ascii?Q?Q3KHWCImTfh5kbY/K9BH05Wo8UTujv62zFhuNYid5Y6qVf2iFJ2A381NLha6?=
 =?us-ascii?Q?7S4veAZlmoyclWdTaBuFpYUXaAIvGWnbOm+UYW2KMzvIinOY9b7niwHD89UV?=
 =?us-ascii?Q?4zUX6YXQQPOoNQnBamwRfSoxOJFxfHZ4vGXcJkb9jlCws+RzEx+mG2WtEAHR?=
 =?us-ascii?Q?4MlY492qsfesA0al8VfKPlstDziivUfEZrfm/GC1dZLnw6BKo+sIKzT4l1kh?=
 =?us-ascii?Q?016DQkCJBulaKXcpAEBMD8clgmU2rKn2CMxCaOuahVAOTuwbrcHYqRfEQ0E/?=
 =?us-ascii?Q?ExaB8W8mCcx7PwD+GBZdc85AF1ook/fzZBhfd2tof1KICoPQ5VJrqnZffm9l?=
 =?us-ascii?Q?2vz8KQquwFa/Mhhys/l5V2ZhOJGzNXlydnj0EnHl8W4unGz+s9gvo0zQBbua?=
 =?us-ascii?Q?ZBR1Ih8vsHKVMaAGiDvMmN5NY/7VS9Be9KQ4lZP0YP0RcMP74zACL7M4aTUW?=
 =?us-ascii?Q?ahDqYishW6Sg537Q8sVislm7?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2065
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cc472c83-8180-4ee3-969d-08d913cee7d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1vn08+nzslHWCGO3m+I5iUPIf7D9pQm4SSgRoXabVmT2OgSxtq12DP86B6nWdrTbQkS9SPEXKiPRYPmAbRcDk+zJvOIPH7mfynrvYQopr2aC/raXr7TtL7irs6Lvxh3ZJ+DNZJGChZhOfvCuLoK+tngvTUYZ87iLQ+kObf2reOfKsyWje+PDr1iHt7tBzTdcGNgpfyXg/0S+Wg8z2VwWj3C1IMxbMs6tkFzoTcVGVq9Rdh9bcHhzILE+aUwr9qG1KhWyUYFRLcvsXR872IezAa+CKxalEi98H46lHgo1vRjrAGQDMTV6rlsfY0Aq+lvsAwhNil3fT064bYG/x+MD7brhMJSydSDyGnxTO2ZZ6s/NyGcghFa4POGKWMJyQ3fl3GyivpxUc26KJEvvrf1gAhXgA3uv7uVYaTcpxJtu7m8/xQyMOtYk8csaKmR4fFCfSOq6hpnDb2DE3yHughPMFoagGZinItUvZDxeUUAvZAG+KAYXmiIM33V5icBOZ5MLHmSX+tzLne1Qa6/LjtrLZEEG91I2Rg55Qt0e/ECAWMTnTz2vQW1FNmqIgte4z4K8ChRhIThdVYXTTE7GBCYsikDF1Vo0lmlv1FL1qtizpFxHElY8JOEAEkxK+13bsySHOvdWIbqZyby4ndD20UriEqD2qKWswSuh8ln9yYLR5kI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966006)(36840700001)(81166007)(36860700001)(7696005)(47076005)(15650500001)(86362001)(8936002)(83380400001)(478600001)(4326008)(82740400003)(336012)(26005)(5660300002)(356005)(70206006)(82310400003)(2616005)(70586007)(956004)(16526019)(186003)(36756003)(44832011)(6486002)(8676002)(2906002)(316002)(6916009)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:16:12.3293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f18b8739-d1cb-4e5f-df4e-08d913ceedcc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4525
Content-Type: text/plain

Update podman to 3.0.1.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-containers/podman/{podman_git.bb => podman_3.0.1.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename recipes-containers/podman/{podman_git.bb => podman_3.0.1.bb} (97%)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_3.0.1.bb
similarity index 97%
rename from recipes-containers/podman/podman_git.bb
rename to recipes-containers/podman/podman_3.0.1.bb
index 6fb803e..26e6637 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_3.0.1.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
 
 PNBLACKLIST[podman] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'security', '', 'Depends on libseccomp from meta-security which is not included', d)}"
 
-SRCREV = "288fb688964cb7fc7086d0728daa1f5f6b726dd6"
+SRCREV = "c640670e85c4aaaff92741691d6a854a90229d8d"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v3.0 \
 "
@@ -28,8 +28,6 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-PV = "3.0-rc2+git${SRCPV}"
-
 PACKAGES =+ "${PN}-contrib"
 
 PODMAN_PKG = "github.com/containers/libpod"
-- 
2.17.1

