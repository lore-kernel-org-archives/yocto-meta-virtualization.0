Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web08.28785.1629746426678306337
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Aug 2021 12:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=LoL6786O;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=38693267fd=alex.stewart@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17NFbo11031959
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Aug 2021 14:20:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : content-type : mime-version; s=PPS11062020;
 bh=4wMJbFfHwVslVr4yKrBrIueW5wCUvaJVHNc8x9eNUnk=;
 b=LoL6786O9vXWTqkF8usUWERCowC6lpW/igxRVE830xiUVnAWApr2A1CxIkKgQncFVsqY
 CXyFhcf9d6bMEolHom2FD9EiLA8SpvaNk2OlQcJLgQBhiXF5tS8stmVPtfwQgYGzFJsi
 HKCeeXAK0yD8uj+PKFZbitfShrwMopaScE0d5UPP5p6ZnJ2D4lO+ae5ndloVB/7k2m5x
 J1UHmRZa55I9ZYqFwH1DlMIy6fQT/jVnRI3Uj2isUXAh3yM0GBhaoumpfvq5JandpuGf
 5W/xOB2WK5zAxdAkqBv++FavPncDeKyq9F9X+BSL6as5EwPZtX0QCjEOb2dM6ZMmYXEg vw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0b-00010702.pphosted.com with ESMTP id 3akvfgsvv7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Aug 2021 14:20:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cx6cDxFihAbQK773qD70fsmsLayihOuTy5McllagbfoyPxQMgKhMTzxrRTBiEJsMje5ejEp/HMJL42Ad12NR4T5KEe3vzeJtv59ENqczo4mONf6f5BIWO6G2TLGuj+eEQkgVmW7mRiJHMEIZg/1P4AShiTuGicZcA9B4KonyQjssqqz0KvtOId1sPOxPqwSrAErgJDaBSXQ9tgMBlad2/6+LRqRutUSaoJ1ONlSuARD2Et831VGFSvIbpc5EzcPyDRwZDEMyFNBHMnZSyKoOuMAQuxGeX6yV/G+lFJUqV0sI5ax556y/i/VEefSEW4xQBRnGLyttU4W1t5d7Fpj8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wMJbFfHwVslVr4yKrBrIueW5wCUvaJVHNc8x9eNUnk=;
 b=XjcebaAG87WJxvIF7lQyqIVmC2U6DjtD60zfZzq1hoQi3/uxXe3Cbh0sUtzZc+tzbS0nTVDfkW/B8HzXugv+9d9Kx5YowO47RL5jrybq4/oCWzfayRV83j7oo+kU/oZdOUClKEh8iNmQWGLbEUtQQsxE4v+AftsaSCN4MtC+UI7OMjHduquALVBDjtcRxOppel3w+MEAvYPUcoyNWFlJKt5cqHQfRkzF/6fjp8/HNnspdkFDoi3eeZztr/GGyjEzhuf7gIugwdXEXxwbjTUqzzac4QVzjey3xZ6bRQV0iOCU7F9Mul9kFHeE2VM+MpUe4TnxhEOCEzJ0xXl+e/BB/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wMJbFfHwVslVr4yKrBrIueW5wCUvaJVHNc8x9eNUnk=;
 b=orKnDXU+hTykevPLL0bvzWhf1n9ImqqoUvp1vBt5BI5gtB58n3QsJJZDj5JiH5svNVRycABCLZwsSpdC93lwvSxd6OuajydaLjnyvhD5QoLp8clPPcA0uLMsPUiHUQl3QbM1Dgl5H+YKSbuRlhbUkezUfKXsDDZQYLSUjj1Jpjk=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SN6PR04MB4733.namprd04.prod.outlook.com (2603:10b6:805:a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 19:20:24 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::8cec:8bf4:cce0:906b]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::8cec:8bf4:cce0:906b%3]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 19:20:24 +0000
From: "Alex Stewart" <alex.stewart@ni.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Alex Stewart <alex.stewart@ni.com>
Subject: [meta-virtualization][m-c-s][PATCH 2/2] salt: use $BPN in SRC_URI
Date: Mon, 23 Aug 2021 14:19:32 -0500
Message-Id: <20210823191932.2555152-2-alex.stewart@ni.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823191932.2555152-1-alex.stewart@ni.com>
References: <20210823191932.2555152-1-alex.stewart@ni.com>
X-ClientProxiedBy: YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44)
 To SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 41d17.amer.corp.natinst.com (37.19.213.70) by YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 19:20:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 103a0e12-35e5-4012-5e4a-08d9666b0ebb
X-MS-TrafficTypeDiagnostic: SN6PR04MB4733:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR04MB4733D0E5C6E9D5F34697A861FEC49@SN6PR04MB4733.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+7pUbKD2rwcinnBe5oGmQMH//zAc88Wd9L7wshgfv/7TPC4Zv0VakkqDSKSPT/+1DtdF1LPWVSbdUMMLMcRYQHP5KEqCPxr4od+JfeVqd9J4Gvz1egzSPpOJdjhYjJSr0NcLXd85jtjXzwGSfBC643zb3deZsUsv8FtMzINF17s1qoaGAjYGTqFs4PMjAMLuNj28hA72sdQTrmfyCDsLvK58q28WllhtpcOu7fDRv+MFPe4h6ihJKvpg8vW8rcfKyTCacTAjkmu/gnq3S/MR+ZQscVEOt2qhgQwWt8kf89QeUvkAeFrMwYEPqyow4xcIRw5dS6mfmQrPHPeGcaTGJT9lTIQvL154fbShOf82zrrwll1rGXPfkG291ARniKyiyZJH5cVaH2vpdOYDv/0G8V4HiFIY0VXzn9LWZHEouzpnmbgD1ttb8dNHvYeZIAF0Tpb17aFx63QRYX76eKLujtWXxj11Nx5kobdL6uupYkNlz0cZSs3qwPwqB3h6Xb4/KYFbUeQiPtW9r1JP5/gKAqlqd9k8YalzqPnN6VXml8C1c5I8xvSG5SI0b2SlnVBVMK3hXm+TCD3TcBi/YjQEpnz2c+VUujvYA7+vsB0BVvq4BeJcOPTB57/WNFz/ZTqkXiz9BOWVcdew06Qw6rkqkIt3q7nRl11gqoYdjHbZM9hIQpPUSB+Al8OiGZQcBctj00coMKwYuhwXaP2oFSPJNV8jLIxnBs9e1F4z4903AC2sbHfth2EV6++LyN0vxz6sx7xVJT0K6vvYUb0fLUV+oO9PcADzZGyJRpLxewFW1a4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6666004)(44832011)(26005)(66946007)(36756003)(2906002)(52116002)(6486002)(956004)(2616005)(5660300002)(66476007)(38350700002)(38100700002)(8676002)(86362001)(6512007)(1076003)(186003)(8936002)(6506007)(6916009)(4326008)(316002)(508600001)(83380400001)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7OaTTZNwp21RiCS+VAOq88KJNX4zSnQFD752qIA+z9cNMMQydmcI185SHj0m?=
 =?us-ascii?Q?bZKQT1iKbxp6pBjuteQcmWuhEMEd5zH3SxzmFbIuQ0uUNFxr5aOYIq9yNgZo?=
 =?us-ascii?Q?ZRkoju/AqLiOeMUfermIk5jgzKKh5OyyiIT1+GV1TvRK3rfO+15nF2h/8ypJ?=
 =?us-ascii?Q?meGKJEz0axWni1FbLkJRuiFqrzC9kOUsUY11f+M3TPhdKHP/Ne2DsPpiUaYD?=
 =?us-ascii?Q?/XiCw8ppvz2Skp7h2AW+FapB9TZy5VBmJZYywJs40F8H6eNRQmkMUcl/hQ4t?=
 =?us-ascii?Q?33f/vTqieoFpJHmas/US6Q0N9uTbqXS6kAe9d17CzmJU9qYP2xPI4fAQ42fJ?=
 =?us-ascii?Q?vgUZCGWRYnLSb9DoZxROOjBtwPTpe8P/M0PV/onk9wkayuZKc8fyRl3vro5l?=
 =?us-ascii?Q?OiEAfjnsZrNqOfE3u0bXdOIsgYEGnarGl/D0iFIbVfU1ptCOw75ttGu4Sd71?=
 =?us-ascii?Q?TAvmFu8yIoy3NfThSGa36/NEWMq2TF73UfOXz2Q0cDCLGKlPRGLjsJ4nEkIi?=
 =?us-ascii?Q?iY9ek0EgC2nIBYhWeqfGsAVcrzIwUDD8WsQLg+YMvVuGMPTejnGLrSY5KxhA?=
 =?us-ascii?Q?Fdw+o17alTvRx/w3OTjsIZuo6RvQxBkOpFytKljBV6YdwX/3GDgmlnpxJvex?=
 =?us-ascii?Q?woO7zyO5errQkBX7EmfAIhy+hO7bsfMR3IIBtA7St5oULtZzSIsCb/9a7CaB?=
 =?us-ascii?Q?D2LkNW6UtA7DrEfCJCtmlIdQc7NYwVt/HVJW+mdCgYYkw2Nvgx25YRtuJ1My?=
 =?us-ascii?Q?ppo+F7YRr8vOuOC83kcp8LpCreVlfaki/eeGz5Jtb2N0Q01/sAMfsHn+FAvw?=
 =?us-ascii?Q?FnrSvnmBKoJXnZhoDkzEkXhncbIgxcLHJiiEvDl0YrAYx3gs7ueY2LQdku6f?=
 =?us-ascii?Q?h8knz7o/8zAiVU9uY+G8P6z+UY1F1Z/mCWHjDPuOloamShWCjETkDgePdGRI?=
 =?us-ascii?Q?pjRVjin8DNiMVtLHWwNLE5xPwDrF/dUNCpVcrPmYac7hXBlPKjH7AWlSzyrc?=
 =?us-ascii?Q?wb4Lat9P4mRipiaZqJmxpvxpBLFdA0FL4bZ4x8YSoXNSinX0S8Ogw/mHEq1l?=
 =?us-ascii?Q?b7UUO8WFCXdaVy75qdAog4TgfqtKU9oaG1fAjNOF+rnoN9CXT2u1vsW9pg9q?=
 =?us-ascii?Q?RWNLcUcPSFXldtwoPK1EyKbhqgDICh3UXx6ArYgRiLNMeUdp08RZNT8gQ0/Q?=
 =?us-ascii?Q?p8Io1XxcAWivVjbUCLHztfIeGt0e6xDrER0IWfR3oDdajNphjzpRdYdnuWKZ?=
 =?us-ascii?Q?e3tFO3hFvbXTTQ7kqQML9AsNcL+etuNK2yoQWUFxn4Rox03tMD1MiJ0O5C1L?=
 =?us-ascii?Q?3NQ8d34h9YHEJDtdzUd2JEXG?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103a0e12-35e5-4012-5e4a-08d9666b0ebb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 19:20:24.6268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLYXWCgF6qai+1NIko8DJCn9Wd1+DSIjG3fc1fKk/lfa4JruutBpX0LG7lAGT7ANWlyvclsii/PMbGBCZU7XZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4733
X-Proofpoint-ORIG-GUID: 0eVS4X6V9aJztD0NRgMJ5UB1AD8Nw4bq
X-Proofpoint-GUID: 0eVS4X6V9aJztD0NRgMJ5UB1AD8Nw4bq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-23_04,2021-08-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=862 malwarescore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108230132
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Recent OE branches will throw a warning when recipe SRC_URIs use the $PN
variable, instead of the $BPN variable. BPN and PN are both `salt` for
the salt recipe, so it makes no difference which is used.

Use $BPN in the SRC_URI, to satisfy the warning.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta-openstack/recipes-support/salt/salt_3001.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-support/salt/salt_3001.1.bb b/meta-openstack/recipes-support/salt/salt_3001.1.bb
index c789ab94c44bb6fd8713f15174b4ffa91a173e47..f585e628690a17b02f4f1275f5c39933cf090eb2 100644
--- a/meta-openstack/recipes-support/salt/salt_3001.1.bb
+++ b/meta-openstack/recipes-support/salt/salt_3001.1.bb
@@ -18,7 +18,7 @@ PACKAGECONFIG ??= "zeromq"
 PACKAGECONFIG[zeromq] = ",,python3-pyzmq python3-pycrypto,"
 PACKAGECONFIG[tcp] = ",,python3-pycrypto"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/s/${PN}/${PN}-${PV}.tar.gz \
+SRC_URI = "https://files.pythonhosted.org/packages/source/s/${BPN}/${BPN}-${PV}.tar.gz \
 "
 
 SRC_URI[md5sum] = "4174a6dd2c7eee808086ca06bdd928c9"
-- 
2.32.0

