Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.83])
 by mx.groups.io with SMTP id smtpd.web12.8562.1625227480297163867
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Jul 2021 05:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7bSR49wa;
 spf=pass (domain: arm.com, ip: 40.107.15.83, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5b/QadhTwxT3iVFRkGErSRpTe96Co0SYyduurVgPW0=;
 b=7bSR49wa1iNmdm0lqGDZDqlXe0jt0Kw5UV4kzR01tyy4BbUz9RU8nQjZsUvh5foSPf2JdNElLH0xRj187nfhuwwEtjHrNsUm5n5GXrrwOzWOuOXhpudUPQXijq+GTTcl++9+DIh5vM+UdYaW3RKvvlYqWRVUyawA9qjPaC3AgeU=
Received: from DB6PR0501CA0009.eurprd05.prod.outlook.com (2603:10a6:4:8f::19)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 12:04:37 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::97) by DB6PR0501CA0009.outlook.office365.com
 (2603:10a6:4:8f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Fri, 2 Jul 2021 12:04:37 +0000
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
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 12:04:36 +0000
Received: ("Tessian outbound c836dc7aad98:v97"); Fri, 02 Jul 2021 12:04:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 676f0e7ca2bcc007
X-CR-MTA-TID: 64aa7808
Received: from 7584b4347ce5.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 945FBC72-01EF-483A-8EF4-1667E2EBB925.1;
	Fri, 02 Jul 2021 12:04:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7584b4347ce5.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Jul 2021 12:04:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKzPzCUShPO+RaqI80GpeSo13IRgqt6t51T3OzJz5teL/BLZd84Oh3sb2Hdsd1mMeVQxV2Aqyq8Z7wO0Tu0fPTmp0ejLI5nVobnMz+QLg/lgAFLYvVBLqvftzkYFuou/38XlqBTn5z+ifXYwf3zugrHh2o5MHsG+/rXmMnF5HDX8eaIMT6Kzuqodb8oNQ/WgRQl2DAaWiCuCZMoCukfQiLUTY2wZTYVWj2hoxn8+7ada1be5CwljKOhL0pLLak2OwF4yu04fCfiwoVwl9K1Ojf7Xm9kpTDtJvWwDins0tSMY62bsL789m0TK5bIuS8R/Ry+stmUxPzDuOpxJRxTGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5b/QadhTwxT3iVFRkGErSRpTe96Co0SYyduurVgPW0=;
 b=TWl2Uy48UsHkuVGlFBMDrcUgDPwbfkGlSjfEkw+4ChIdtQYS4BFkNdrJvfVH7hfXPoEUdomY0GWKY38R5ZpGmVB1W53mmcApBDUcIjgLRN33u8U5wQwsAMQLjsvrs2kc9QrpGGMeqAX2YNrSnlucUv2ncSfW6SyIz+AI1cYH7PjUXJJiejDV3Qz6WaRFgkKlqNEl3r8PXZ7r7CgIDghTcJuX5DkPtFBZyUFZChCku8/KMLOghXP9F7klLQn6zqUqwlJiIHO/ajWpqxncN1q01PwpQevVvPv3jQ5dFmnLnoWhLln8pWp3cR0/iuLX5fq8htv01GLG2vD9fWKG713xnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5b/QadhTwxT3iVFRkGErSRpTe96Co0SYyduurVgPW0=;
 b=7bSR49wa1iNmdm0lqGDZDqlXe0jt0Kw5UV4kzR01tyy4BbUz9RU8nQjZsUvh5foSPf2JdNElLH0xRj187nfhuwwEtjHrNsUm5n5GXrrwOzWOuOXhpudUPQXijq+GTTcl++9+DIh5vM+UdYaW3RKvvlYqWRVUyawA9qjPaC3AgeU=
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6189.eurprd08.prod.outlook.com (2603:10a6:102:ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Fri, 2 Jul
 2021 12:04:18 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 12:04:18 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>, "cardoe@gentoo.org" <cardoe@gentoo.org>, Diego
 Sueiro <Diego.Sueiro@arm.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "dpsmith@apertussolutions.com"
	<dpsmith@apertussolutions.com>, "persaur@gmail.com" <persaur@gmail.com>
Subject: Re: [meta-virtualization][PATCH 3/3] xtf: fix build with gcc11 SRCREV and specifying linker
Thread-Topic: [meta-virtualization][PATCH 3/3] xtf: fix build with gcc11
 SRCREV and specifying linker
Thread-Index: AQHXbtnI/pJlk6qhPEa5+6FRnkUq86svlxEA
Date: Fri, 2 Jul 2021 12:04:18 +0000
Message-ID: <2BC2A58F-FFA3-4565-9E61-6F27B58F1625@arm.com>
References: <20210702003206.79756-1-christopher.w.clark@gmail.com>
 <20210702003206.79756-4-christopher.w.clark@gmail.com>
In-Reply-To: <20210702003206.79756-4-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [81.2.158.121]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6a7fb425-fdd2-424e-056f-08d93d51900b
x-ms-traffictypediagnostic: PA4PR08MB6189:|AM6PR08MB4689:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4689A42BD902DC43FCF658619D1F9@AM6PR08MB4689.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2733;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3EJAyeIOst+hqxNVpfzHe40HrqA6NjzPgaIN+/vPdqpb4GOnFGJmg3Y8JM9Vvufw/A3wlouC6i1ZDuZMN15i61U2upxG3hHBiyk/11RM+FoxiesV14BMmMyGl+hAGtqYrHURTcRRMerZf3YDPziTNSew6f9Q41mBImnDbwGJnhRnrzGoPTpo7m60dr9Bxl3/k3m1NUNBaBdaUYvocJ49glbpTha0BrZil6pn/xnytTb7CmZ2UVLKxQVV9GYsaS5F4pQ3GTYtVxveZIkziVKTI7AhODZeJOZ1Q6ZhMX/U3jjNh4U901T5BmRzR7gbGmDuSXCy1pD8uWH/I3wchYT5hxSgJ4UaN2Fh87w+vzjY2NvJStLiSDONUELMPGzG9F9UV2jfHCTH5TEVNEvHYOO+BoqkPG0HDToZnEhHskV1l5babw8s5Gnb7ekXI5I0ijWFxwd1uh0ELNlwMH8LtI11CpKtbdw6ab2CDC5QgnR+ELzXDb6qUbAhRKVQDiHpGLZ6G/ad5/40CIAI6l5zMLGKOQlJLm5hSXvtYX3iojBBVOq2FPDiUVHnk2jVrPbeuDsnJqMHiGNDfEvZmNq+qmVcCEFbzEEAPobpeUONa7B/1qIBrVbansO0Uj1gIe4lzBMBz/MeEZWOXeeTFjAKODAajuj0HvCopPdGy1ANlSlD0gMLFiPZ7akfTAq/o4IF+DtEp3rgN8f122CZpvWgC2c9GqrU1xSdhOqkQSv++FER+xTuw9b4109gG78LzEIhob8CvivNBDtINBvABrrRoWLEQS5UKE2meNzn2SkikJgLZtzJGlq9UzResRtsUnapNYlw/g3Harc74QSluD/j3vIhaw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39850400004)(54906003)(2616005)(8936002)(6916009)(36756003)(5660300002)(316002)(478600001)(86362001)(2906002)(33656002)(966005)(66446008)(64756008)(166002)(186003)(53546011)(66556008)(76116006)(6512007)(83380400001)(71200400001)(66946007)(6486002)(91956017)(66476007)(122000001)(8676002)(26005)(4326008)(38100700002)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?v2P7yFQhjTPz8/x1A3dpSTKYoer1d4y6ebZCIPlnkpT7uYAxxWzycAWQ1Pnh?=
 =?us-ascii?Q?tMAnk4gW7AtsSfU8roRFusbwfeC4YWzUH2dKrdyg7upBWb5zqd4pnnjHtg9N?=
 =?us-ascii?Q?NrRhScpMaLLP6Q1sV5g0i7+DfQc2MP55n2y5ock7ft3pKqS4QNvy9hcsLJ5L?=
 =?us-ascii?Q?2ruKCbDndahc1gBqb8alwUpJPCQ61hldV+2qcA64EhHqNvEY6Fog16uB5GhX?=
 =?us-ascii?Q?gwXufXOpVItScjQSRTVWaOWRNdOcR+WE9liArsJwHD0ao+oQDetpZOZ8l1HN?=
 =?us-ascii?Q?i86MniFZ6kWvbrhMIeg6kyqT1CtrRvDebrHst6+sY7nrLcBK8mLR3fKu0wrT?=
 =?us-ascii?Q?1oXej+CD7O5plfnCfOIYQh2r30EvISvLT7BviXAwfSbWsWhy9msWo2gh+Nz5?=
 =?us-ascii?Q?DEJrZSATASoGOa7Hove6EtzLYFdHX3l2/YMkFQuRMPCPdFt8gHG3c7L8+y7L?=
 =?us-ascii?Q?LBOmaL9oBF5eIJqfgdXt0vxFXWTG3yr9IfaM9hJbEE06ngAm4andbwCx6cG1?=
 =?us-ascii?Q?vI+mMbB5bdatwoe4Fll2O1xT9RBf/PdREQyh8xgeiInPefJMe8UZX5G0cu4g?=
 =?us-ascii?Q?3ACMxLG4h/3SgFVoiMd7AYN7pzYkfMOD2PC6FjItuku9xY9vNDtlQwwuyZGJ?=
 =?us-ascii?Q?o8+uLSt57rGQojRR19IYIoxZZR+o8Ef+PidDn3oyaGHx701kLMwLMpUFoesM?=
 =?us-ascii?Q?h+GCvKpdAOQAGQcpZaLmD+mVJaCjExm7RKg5e/wW4g3tTO71JLJjm9eQueC+?=
 =?us-ascii?Q?zU40xTew/B+NsKlyMD12GZFAhmXM/C+v1cKgdusxI1lwij6qI3srR84Owi8x?=
 =?us-ascii?Q?qcRQpQJnnBgi8FBAuy022r1SRHcU/UEBN8c577+ff1pwbF81w9cuK04ZR9FF?=
 =?us-ascii?Q?J7tZGdIsflAEmiIFzOYozicifbzMt7mXdAfLYG6OPv70cmrv3KxZtKJS+kxD?=
 =?us-ascii?Q?X6nKSpY0d21vtROKhtCk0lB8R3RLa1Px5x0UmMinycTTTQiYVI/S30sa+GTz?=
 =?us-ascii?Q?byezBiRf2aoqfeAkXsndmKzFDFFs1RbzDQeMf9H9YYkXAFR+ZKHHedPPC/VL?=
 =?us-ascii?Q?jvT8vZbUOMXlvNAvevJq5wy0OkxdBbcxXZlmPosZZp/a7qyzYcmu8gByz3yD?=
 =?us-ascii?Q?9HIVPU9K+4NjOwZ0F1sP1Y/ZcMvwvJ06Q0ABQaz9ic9l2YCf8sH+O4fKd2rC?=
 =?us-ascii?Q?Rq2sSLVzhxIeHvcTW//ZMswog9XbzBhp9ApHJddLr6deLXmgj9ZJ/masNigq?=
 =?us-ascii?Q?oR758ccHVfOGRsPqGeATqboTY/PQ9pYjYtBpFFVLA7GsVY0bXZJrrcptyz0x?=
 =?us-ascii?Q?kERTdo+HqJKbR6d+z6UQw26d?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6189
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	604ad581-3deb-4ecf-1b5e-08d93d518528
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lm4jXQtWuCuYpmyLMkeetZASchDNcC0JWTnLBs2IwyTF24p2dqfSehXbSQt8AaidnxJ6UeqL1B4e2ijiSfvDzEvdyXEVzplKGCdzskC0PW1BIZWSYUnCa6ZD2S1R+8DxF922zbjcGQEoTN81AGt5Elk4rFju4Yux7f2heSpeXOsxBV98eEbiz8JDN9DsgJmG9ObIkbIb2B/hw9YXIjOBGivnotNNOZu/28z5q3zRglMMC8aN5PPHGhBMyIDrtmbmSdcIk001uSKfOE2UE7wP/kFizSXqjmC8rgmKzES46YrjEG7/XfZbHbY1HGFN8RTMYuBJfKYiwzRl6Ga0zgpOzruplu++gye92EDNk2RytnZ1JlCZRc8d/GZxw72s4g+43WWd/ZvcJiZoc4A2TujqcIpVd3iEYMFtHziLfXM2xjlb/sFNacyaT4Nov57IiX25BzMZu3+6x+5peYkFOCVd27vGH7SSJi8D7FYBPx8DqX9DUZ2lqrNdgiWOMfUafLxPL1yckWNIRxPVbbJbZQF2Ojoi3ZmGHXYGwFIkFl2WiabW8E1qhY8Iak9AtRjwjVH+UQxBUF66TbMuR+n7m7feZkzCmUhuf61JFCTldLu81BZ1kOruWnfTPs9fQJ/h+wmZ3w+eTaTDP4jjHm8cVwgd0Po0I0AvxtNje3F5OnWFWNC+fHApgOo/NekmDfXStAtJSZ2nykZiR2OxyehxWNZb7guXsCog1NDCMB2KDkp49sRcUQEowZRiPOWTgCZA+tArtwBoBRZrryM+FX+cVj3LnkfAtBxAB6ox+AvFjSEZRGnWgGbk1CBxlp0UcaooQ7ypGnjqQVJ+Z2NQqFQx2qRx8Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(36840700001)(46966006)(83380400001)(336012)(81166007)(356005)(47076005)(2906002)(70206006)(70586007)(186003)(166002)(36860700001)(2616005)(316002)(5660300002)(53546011)(107886003)(6862004)(4326008)(6506007)(8676002)(36756003)(26005)(6486002)(86362001)(82740400003)(6512007)(478600001)(33656002)(54906003)(82310400003)(45080400002)(8936002)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 12:04:36.7842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7fb425-fdd2-424e-056f-08d93d51900b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2BC2A58FFFA345659E616F27B58F1625armcom_"

--_000_2BC2A58FFFA345659E616F27B58F1625armcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

On 2 Jul 2021, at 01:32, Christopher Clark <christopher.w.clark@gmail.com<m=
ailto:christopher.w.clark@gmail.com>> wrote:

Newer XTF revision works around GCC 11.1 issue 99578 and
supplying the correct linker to use fixes the build.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com<mailto:chri=
stopher.w.clark@gmail.com>>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.mar=
quis@arm.com>>

It is properly compiling with master of everything.

Cheers
Bertrand

---
recipes-extended/xen/xtf_git.bb | 3 ++-
1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_git=
.bb
index 3580324..bf7470e 100644
--- a/recipes-extended/xen/xtf_git.bb
+++ b/recipes-extended/xen/xtf_git.bb
@@ -6,7 +6,7 @@ LICENSE =3D "BSD-2-Clause"
# https://static.sched.com/hosted_files/xendeveloperanddesignsummit2017/79/=
xtf.pdf

SRC_URI =3D "git://xenbits.xen.org/xtf"
-SRCREV =3D "b0bc49846c154b79243f39d461a4515804bcaf53"
+SRCREV =3D "3e800027016ea4eb19887bf626b46f45fc43fa5d"

COMPATIBLE_HOST =3D '(x86_64.*).*-linux'

@@ -32,6 +32,7 @@ RDEPENDS_${PN} =3D " \
do_compile() {
    oe_runmake CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" \
               CPP=3D"${CPP}" \
+               LD=3D"${LD}" \
               OBJCOPY=3D"${OBJCOPY}" \
               PYTHON=3D"${PYTHON}"
    # switch the shebang to python3
--
2.25.1


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_2BC2A58FFFA345659E616F27B58F1625armcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <F3F8064522817B4DA02A56CA6592B9C5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
Hi Christopher,<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 2 Jul 2021, at 01:32, Christopher Clark &lt;<a href=3D"m=
ailto:christopher.w.clark@gmail.com" class=3D"">christopher.w.clark@gmail.c=
om</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">Newer XTF revision works around GCC 11.1 issue 99578 and<br=
 class=3D"">
supplying the correct linker to use fixes the build.<br class=3D"">
<br class=3D"">
Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@=
gmail.com" class=3D"">christopher.w.clark@gmail.com</a>&gt;<br class=3D"">
</div>
</div>
</blockquote>
<div>Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@a=
rm.com" class=3D"">bertrand.marquis@arm.com</a>&gt;</div>
<div><br class=3D"">
</div>
<div>It is properly compiling with master of everything.</div>
<div><br class=3D"">
</div>
<div>Cheers</div>
<div>Bertrand</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">---<br class=3D"">
recipes-extended/xen/xtf_git.bb | 3 ++-<br class=3D"">
1 file changed, 2 insertions(+), 1 deletion(-)<br class=3D"">
<br class=3D"">
diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_git=
.bb<br class=3D"">
index 3580324..bf7470e 100644<br class=3D"">
--- a/recipes-extended/xen/xtf_git.bb<br class=3D"">
+++ b/recipes-extended/xen/xtf_git.bb<br class=3D"">
@@ -6,7 +6,7 @@ LICENSE =3D &quot;BSD-2-Clause&quot;<br class=3D"">
# <a href=3D"https://static.sched.com/hosted_files/xendeveloperanddesignsum=
mit2017/79/xtf.pdf" class=3D"">
https://static.sched.com/hosted_files/xendeveloperanddesignsummit2017/79/xt=
f.pdf</a><br class=3D"">
<br class=3D"">
SRC_URI =3D &quot;<a href=3D"git://xenbits.xen.org/xtf" class=3D"">git://xe=
nbits.xen.org/xtf</a>&quot;<br class=3D"">
-SRCREV =3D &quot;b0bc49846c154b79243f39d461a4515804bcaf53&quot;<br class=
=3D"">
+SRCREV =3D &quot;3e800027016ea4eb19887bf626b46f45fc43fa5d&quot;<br class=
=3D"">
<br class=3D"">
COMPATIBLE_HOST =3D '(x86_64.*).*-linux'<br class=3D"">
<br class=3D"">
@@ -32,6 +32,7 @@ RDEPENDS_${PN} =3D &quot; \<br class=3D"">
do_compile() {<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;oe_runmake CC=3D&quot;${TARGET_PREFIX}gcc ${TOOLCHA=
IN_OPTIONS}&quot; \<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;CPP=3D&quot;${CPP}&quot; \<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;LD=3D&quot;${LD}&quot; \<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;OBJCOPY=3D&quot;${OBJCOPY}&quot; \<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;PYTHON=3D&quot;${PYTHON}&quot;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;# switch the shebang to python3<br class=3D"">
-- <br class=3D"">
2.25.1<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_2BC2A58FFFA345659E616F27B58F1625armcom_--
