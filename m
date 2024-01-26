Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5E1C48285
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 17:31:56 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.117])
 by mx.groups.io with SMTP id smtpd.web11.105.1706290313043565159
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 09:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=B9bR2Sj1;
 spf=pass (domain: ni.com, ip: 40.107.100.117, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dlr155k9MTk+Hp/PBjfZZnhis3eISU4m3wzQXUioTnTQStofGkPfyxfLp5LOthdp2DxiiWpG/JIFLoaYEIEg7zpV5Yo/zz2E31n3WAxmaThbWIJycLH+sNqXRKpLOugjJCnf5jS7vh5Y5URLNyv9YeplGgZjuhLMcS9o6bkzSSbs1epGzBAbSBaDzcV1v4Na7h4dgyJa3wyq+yAoDcgUVkcQLCNSCvpqSSvwDqGVyap+OEVipJZX9Liu2rr8D6f/evzjZW9d0iy+FTzbP9mkkth1ASneeHwtc2j9bvrOu5bottSByEkEXQpo34Jt8xHGJ4Syt3hAGt0XAX5ODrISGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEHOlI/0ba+iLQSqlH1qXd897VsnbQ/Fo/xwfd2t5fE=;
 b=aBfXVLdAl6gy7VAi8qsmmE+YD3wBX9m5D3nvHDSIA9IR+ZfwOBU83iAvsDcGjCndG2GaSc0SqI025y2glksp7Ar6AcFR7xg7yGiuXSJEAsjfAYxS7r/9GdCsNmLm2sVs+F7mdDECB3kwmp7w1RSDgeYA+CsWmzyMiVbccmmdGb2NPNkOG4RFZqXpvBPOL4SsLjWViC9ZTWsGECy81SJwprE4O35Q5OR1n1noU26Lk0oNzemUbFDjeZq5lstuYDT1v9MhuYjzFsbaEloeqCVm0dnOnuDRGsqrn2ENOB7A3SbZG3zLq32JezzITygz72Pdabm40JLejFPjJdBA0ijLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEHOlI/0ba+iLQSqlH1qXd897VsnbQ/Fo/xwfd2t5fE=;
 b=B9bR2Sj1v8nPEvvFLmuFSDfGgTmuGBmrsO5rBW96U/absxn8q2BXK0Jy76uvr1YWanNEv2nLvBZl7/Zd2T7rLlCYlXpgxiYTAH+Y/AoQJDEcHgwASI6aFASXl6RHz5nHIqzEieP2h1vZ/x+XWnikY67iOFdcgluXIS04iUWVLAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by MW4PR04MB7313.namprd04.prod.outlook.com (2603:10b6:303:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 17:31:50 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 17:31:50 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: meta-virtualization@lists.yoctoproject.org,
	bruce.ashfield@gmail.com
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [meta-virtualization][m-c-s][PATCH 3/3] iproute2: upgrade bbappend to 6.%
Date: Fri, 26 Jan 2024 12:30:50 -0500
Message-ID: <20240126173050.1137474-4-alex.stewart@ni.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240126173050.1137474-1-alex.stewart@ni.com>
References: <20240126173050.1137474-1-alex.stewart@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:208:32e::18) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|MW4PR04MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: b861e80f-ea85-467b-f976-08dc1e94adce
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EIUn5XuzQklgwJUi2jScp5EMVEB/GvDs9Q50R2WXoeDNwklXg48v7fnVTRY8uXGwPkoEzPdE6y/elQ/OkVqgUZaq0mw1q8QMiuOSVYBEKhoxUfWTc1eYsub644JLuYl7CQA1LKLW3/lIWVjVLlsDMJh7gF3M6119nB2+SdkMaLYQoEBFIeJUL7epQ6vs/N+rFE7xm5VWnU6Mx2pNXyyqwGJbEZrPMYGoC5RbD5SWP/8aTf1v/aTxCvEX5yxnt1Vs0uRk8Yh6zEcB1kP7Re8TSBNNIUxDS/2hiabL/hLBdjLT/6EbtB9bH3ApxKK6Mqplg0vtxn+VAHHlnMMjRspgWxPG5nj8qpOq1TjMFHbl0MUUh6S5jJUKK5S1u9fHACdoI4bXidywwDEr3MNFvHI6zhGZbsNw75cVnMhwiZ/u+erBgNH5es7hpFIkanXCF3de3BtBjd4+XLCWYXd515oVpkcqOek1ctlC9lHobtIzW9uD3cWkUojVMk1rHq6/omyYGUoMLzXyMui/Y34e0mGKxIVwOOkqyYv5XeQk/URGuwiF4Sf1d3TKTVg/gwp6tJYp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(4744005)(2906002)(38100700002)(5660300002)(44832011)(41300700001)(36756003)(6486002)(478600001)(6512007)(6506007)(1076003)(2616005)(83380400001)(8676002)(4326008)(8936002)(66476007)(66946007)(86362001)(316002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZJs+2Hnzm332txNHj38GNqOo65Zc3LMzEaXpmTucCyCdSdVvPeC0MHOzpjCB?=
 =?us-ascii?Q?zmKrV3adiTsK04m0yAicGEdNdvOd/Hy1zPDRs84jFxN0LFTl+sJ3aS0Rd73d?=
 =?us-ascii?Q?icFMRSWxZm+P6MRDfUxLOo6g/Gr0b8i3qsnZFROeYfcVpelF7rpb7qXvuwHb?=
 =?us-ascii?Q?7iCE6yW68br10Sg65AicBRYaut3NdpUV9LZoDaBvCSik3Ww4VBew9a5WahY7?=
 =?us-ascii?Q?GZ+ezunPbTMG2a1Md3fS3pEXjvhdi9IjpZw1jW8uugF8DCjWdG13QHf21RAV?=
 =?us-ascii?Q?bnjTccIt/rNGPzkzVpikoxDbKUSiw58dkjdOYANWOx5kuOMUN6NV8DcUtQ/9?=
 =?us-ascii?Q?1aljIFMeO5dnYnP1BPOCpnTnevuKg0CJElrFhC7yY2TCJhw2agKl514inmK7?=
 =?us-ascii?Q?pTKTZm+cBybxHQ6FdBuHn3aiiv3DEuKYC7wBfRoW0Ors5IyIjxM+mbd385Nd?=
 =?us-ascii?Q?B7aGddxys6g5GQAcaQq6YQ73dBzpsDy2eOAqr6oC3BxXoJhFXBzC8Y1bZd5M?=
 =?us-ascii?Q?JnOazu6hxuKMpygW2aL6xYEPut2O05OazTcc0L8Xbt6cgvrSSV6AE9keWmgp?=
 =?us-ascii?Q?njJbmwE8ns+7lnIessvufkEVQICSva5bv8sf/3KsVe8WsTBBO5YzPYhcPMnb?=
 =?us-ascii?Q?qtqPOHbVOcH/n4DtBugIwAoz7cNf+cXwwBVyyRCQFYslkTTeAebaVtZU6pgQ?=
 =?us-ascii?Q?n3mse2k8YUBkC2+j/FwPSEjcX9h9a9NN79Cv3JzetcHjYsZssyhrkK7bp7It?=
 =?us-ascii?Q?5mDaFMzSo/k6oHbAhje0hvkozYM+dW2wnTu/UovDpKUs0YeWHL7ZIYJf7krq?=
 =?us-ascii?Q?/DDg0Heolpk/dzuch8LgAmzLTXjTN4pUJ03954TS/0V2lw7ibaSbBbp6Z287?=
 =?us-ascii?Q?btlqQ0Wxu6u2ODzTMRmMlq7rsct6o6SgaU5s0zsB9XHYugL0e90NfTiezD5d?=
 =?us-ascii?Q?dWK5D0h2lMvfSBAhL3BDfJD/wy0cOVuLXgY6A8KahNBJoU5SGHqlOSPdrekK?=
 =?us-ascii?Q?CU+KIhoTveW+vlgZqoJCdGcEBzJfdEnFvrYGbfTda85uiw0bh2oQhsgduXUt?=
 =?us-ascii?Q?dRnzfVFD1l5DCNVHq9d0+HP7KsU1Td8C/ZWA+a597ILq88hXWgxamekjpQzV?=
 =?us-ascii?Q?ChDdnBm2zXDi8jeyaMm8vrWum+kxf94HMUPoZLYGOsK+pkUiSnEVkYQMZTTv?=
 =?us-ascii?Q?vZfv24G+CrNKk5e9D/fkGFXsFuiVX0EgwBbmsUpxCLG+hk9X94w7wfWJIAzf?=
 =?us-ascii?Q?fO3rSAoHBdheDyn3FXhCig6cngCco8fHtMgN1zabCUmP5UmecmFk1paVcWgp?=
 =?us-ascii?Q?9Zxp5B8TzeG3L17CIpWILxTebRgUpl6V0UXJHXfI5kzafrnicyIZmDsU6lxV?=
 =?us-ascii?Q?JE4qSNM4qhRdTHPdVU+JQ+stUt35OIox8xNrSKuv9T/iVfDB7ridHD7O3+0l?=
 =?us-ascii?Q?dNHIjE0fR31F5bCQzhrcBToEzI6oazqSdAXTx2iNykZ24KNs4wH9iADF+3mK?=
 =?us-ascii?Q?KhbNEzEI/+0xs7TOVJm+WFb9y/x6cefa/qLB+L4rrsvlAekDG3QcbJ6RxBQv?=
 =?us-ascii?Q?7+vKJLFLvnduNf9kBCQ2C/nDVVYX9fIXzjmXyYMbF87tEzwF0GzjnhsEH6T9?=
 =?us-ascii?Q?yF2nymqmwrARzRkLjwnXaek=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b861e80f-ea85-467b-f976-08dc1e94adce
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 17:31:50.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezlDDclVtVyDipvkK1RahHPWcy3R+YUWZMKf0zR93XhDqXmm0uWAGEoLZ40N3/ppANFxw+TvoC4L/7kTNFS6VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7313
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jan 2024 17:31:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8555

Compatibility with OE-core nanbield.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 .../iproute2/{iproute2_5.%.bbappend =3D> iproute2_6.%.bbappend}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-support/iproute2/{iproute2_5.%.bbappend =3D>=
 iproute2_6.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-support/iproute2/iproute2_5.%.bbappend =
b/meta-openstack/recipes-support/iproute2/iproute2_6.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-support/iproute2/iproute2_5.%.bbappend
rename to meta-openstack/recipes-support/iproute2/iproute2_6.%.bbappend
--=20
2.40.1


