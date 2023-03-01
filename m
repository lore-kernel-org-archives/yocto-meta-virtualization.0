Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9FBC7EE33
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:52:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18399.1677664369046041674
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PctkN2s8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2424f77153=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3219DswR023627
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 1 Mar 2023 09:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=aanjKhszmXOeYscfADf4ZnmEbGRdkcpjqMMrEhC+UWQ=;
 b=PctkN2s8gofNb63NTazItGEZ2XXQJwg01b5i4b5TYuJTY/vu23gq+rXMlmwOK0L/gbZo
 uOQnaq8gKwYIKmjz15imURVUmEBESd/sfcVwiextoUtF+KN1u3wi/nRAh0vKtSZbMby0
 XgsyAmSKC2cCbKvI1v+IbtRF9VEuJapZqiFefI8NNsvM6XnjDKB5xvajvKR/5H/OiTVh
 GMEseNECJJJHJp1zLhq7X8yXUujadlS6ZB8ve3XKRDMIVO6nDor31QddBLBSdI3Ly1dj
 9VpihGRDB/UuyavwwvARRkRn2RIEW1bKvBZZY/B0u0w6FaJdgtn3+v/gk3DcwcWOHfBR Sg== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwm1vf-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1KVNSOA709uvCZowT9pqHhuZPpvITSGGWR2ncLFfHVtl2TyUTA4Az9D2/E/w42RWdH5VajJID7wCK8w3Cj3AlASgfftN9cGCDSKwa8qXSNVyQB/4p6pqdMvB0nXyoLQlwciBEY78FtJzxFphMN1WtoNAYDuii80GZWXoYzsnFyDt3OZiE+1gBEW5xW1JCW2DU5pwuxvcUgxGXOekXIjl2bQwf3a7TYnX8ofdU4VuittDh9tZJWxXzzpvDowPjQut1hr92wVqDDJX7bkIvheIzsuKMDIoiac5SP6GqWNMb2vMHGi9/PEHZmJI/g/V/uPb4T2g21r7TVpVEgh1M0wvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aanjKhszmXOeYscfADf4ZnmEbGRdkcpjqMMrEhC+UWQ=;
 b=YN298lzK2ZaVn/eA+oWP3T2Q9ND8cb1jpeiUf0otZKij5gu7jnyftoJz12WXZzlQws2CtHHOJZI6TcO+ljVBmIxDoDu0D3wqmXN6wHbcYNaDWdtIPT/FlFHx9V0m8nyFpiX4DTkphOKbVhBSSZZf4JRG9dZ7sUNjnKB6rTW8S3+KC5b/DL8QwEU2Kh5eLGGAaaLBItZlBc3xFF39k/QAzN10G/B9ZcxbXLSqXQK5Lk+Q5wnQGS3cYDQIUhPnNUmCSXmzrQP6kJWG2GVReDgefg3mIyeQ5KdMzeFKHhLOiNWeb8dMc9SPISU4a+Oi3RjoxvJ5kgjk5IaBnB7R2g7pKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 09:52:45 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 09:52:45 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 08/10] README: remove some cri-o specific layer dependencies
Date: Wed,  1 Mar 2023 01:52:26 -0800
Message-Id: <20230301095228.122562-8-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230301095228.122562-1-Qi.Chen@windriver.com>
References: <20230301095228.122562-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b21763-ac10-4de3-9b25-08db1a3ab480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C3TxVEpuTo8b+R5PMOZvk3gCV8bFXlxznrwHOLUYpge+3VpRXVl0TazvA+8hu9fjrQGQGZXJMnR1jpdXZ3q8WKVunWZEokfxopkfzdX+8i0BXS+tSlWI5lyz10LWW/huoZYaFQb3tBAYCs/CBYYcmyhJRMF8WPpOCwsXlruYztS1URYPcygb+ebtgUqp1SiXgfgq+SzHO1dF1b51Q/o7nfypO16tGKAc4tMZhKAj1lfZE2W0bvROULCpnBgoHOu9uY4UWLXYyzLdWoeFG5958pvCiAjip/UH3+BxxW4i3kIGN5GIH2FWj2yrMFJGel/VwiPKfd5+pOKG/bJg6ShU/fwSEu3IX05KBKDF8nzJvaZ3JCeUmPq0KJq8AD8sLRshjRtTU9ly4ZGPg5kRTJPRFGP+pMUhGNOI//xSm6u81xtmBJE+Kwl5ZhhsnShh01FnsoJ91UhN6mYsJuhh24piAnP3EP8a2GBq25jNBXud4yfEyAYgkq4zGwHxwK0tRrr9ucTjFx5Yerr6179LZ35JxIIoDoawsmby8T5qhgGoMVWMnVSnEairl0oWVrHlwEBR1QLcURVB6waX+tV6FIke6DfR1PynQsOG5+ZQ7alzKy45lVrAx54mTYoMLJ42w1CdT7EAl5iwPS0EhvNoC3haHTETdlIjsIMYDJH3kfqNVRCqban34s0mjTMG4uUO/ZnUd5WPIL1O61pj8cZ6cxFK6A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199018)(5660300002)(478600001)(4744005)(186003)(83380400001)(26005)(1076003)(6506007)(6512007)(6666004)(2616005)(86362001)(6486002)(52116002)(36756003)(2906002)(41300700001)(316002)(38100700002)(38350700002)(6916009)(8676002)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BVMkz2MFEt8hNw1ZJyGmMLTFM2COEp3ms2NYhxgX6FdP+wl0BuQVmvhuH/Ti?=
 =?us-ascii?Q?PNIlcgzlHa/nHHH7zZanKcYE8AyS56ncNaJKBmt+Rvx+/fz4VMs66zofaGLS?=
 =?us-ascii?Q?rBfJO59SXMjBB5xnqK+x9VaRx5kr24upai+naF8oSHQdB4mimNbrZR0Jdxf9?=
 =?us-ascii?Q?AJQJyPVY1xiwtXdJ5/PGLnGafEiA2FjzF5Yc1bWGgLdJVCq19A9Hg3GgHI2u?=
 =?us-ascii?Q?6MoAwTeosK2EuFbRDXwPQcV9pt9KqlDuEk/CT92qoMHWgNKRctqzBxxSBlo6?=
 =?us-ascii?Q?AH8MtPKkT0Lf5j0Kx3cqwsTXWjwuwgxxKTrXxn3dTqTQX4MsRu9petkN7H++?=
 =?us-ascii?Q?oPkp2jYWr2S6sa6JrPtVKPfdSb1NWowok1PsqOuYtvcm8ORRDprUQ0mwbNGZ?=
 =?us-ascii?Q?3qidRUxaPciQx62ZF+Rlcm+BcNEZDZTY4pbZV1W1mOMCuyDmE5yNiZjQdFVC?=
 =?us-ascii?Q?yGaUcT/+5BFimUo6RBfPIWMCUxuJU2K/t8YYnbN4YXegZYqd6AWZ+GtqjRPe?=
 =?us-ascii?Q?qAB/QBM8CJtYlbjdt9H/XTHckMmrOL2R5PQtF5b8PyhpBNSVjAUdAa49lMuQ?=
 =?us-ascii?Q?dViAyOKQYS1MA4eXVGdDJ7eB6fnSfjCaHaO3pIwsMUg8s1KBSd7ySt6UE4cZ?=
 =?us-ascii?Q?aUEUw3HhSS5+qaEenyxkoxl2mip1Dd4IgKn3hn1aV4F+ciKGFS6O54uKrfnd?=
 =?us-ascii?Q?44zG8+TA3adcPKgUOXUkqwElAd87A+Kp/tuMl0IPBSmLSd+d8NEXcdspDUx1?=
 =?us-ascii?Q?BHULmVwejIQG1u7GMBo1mT4e8VmXqVDyqM/euFjCmOkKDf5c+BV5x03mOABn?=
 =?us-ascii?Q?IkhoWeX/TkTmqj/ZHJLZ4GwqEbE3jNA4LyEEQeIukYJUgv6/Nta6i5HXx+Td?=
 =?us-ascii?Q?JyGBpuibbnbHN9oWSa+BoFaR79KvklrDgX9Kx1uV0p2Iwq1PfKdLo0Sz2u9t?=
 =?us-ascii?Q?RZe81m3mGEV0ImxneJ7i0aASX7QPdS6ZC6nYUVHMj/Tw2TtJwRqy7W9Nnkpv?=
 =?us-ascii?Q?U4p0Mq67iAzKFl+JGQIkamRtmTHElI2hGJotGH9trgtjvw04jWCvVGQ7qHol?=
 =?us-ascii?Q?3kZi8zIrB53oxEcweSgQfuXIGG15hWNZoLMO9Gr09ojDasPPKANSXEqk9DJI?=
 =?us-ascii?Q?26Wxm4jKxchB838K827gl+uvPTfSz+xzONyT7p/PBW0ogaiAEHp1DiVzYSGo?=
 =?us-ascii?Q?nbKtNhj5kKrR7Kd1U37ggY8kkjqXkynHcTbf7JoNjci6QyxrdiC0R3yLYGU6?=
 =?us-ascii?Q?a/f2abc/bVrfGQXDMoeUAtV8jzQ4EbFl9tDYay3F1apgB2RU/CBVU6SSBdri?=
 =?us-ascii?Q?Qvkg7tcRyQ9FcEwzr4SJ7BUxlBKvuAPcxvMCBbsHcMfliVyUiSqvjq1f/ENd?=
 =?us-ascii?Q?SVPdfMxTpHHHYy0OYygvdy4HGVprTLJidxZT0m+aaFIWkbVSTpgrePYogiaj?=
 =?us-ascii?Q?q3PsIL9P0yM92lEjUrhu9FEwgyfzyON7e59Rkc/BFqmzZP0/x2VYrUP2c5SW?=
 =?us-ascii?Q?YxP+/SMs3hsBOfHjJvOseYeC2MFBd6fxvpeKVdQUGgzT8aeyWg0f8sOyBg0p?=
 =?us-ascii?Q?3TZLzdY6MxjZggR9Le06MOfonimHRmf60tiRjpjuCgAKnbGg4zPPAZzny8VM?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b21763-ac10-4de3-9b25-08db1a3ab480
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:52:44.3996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7RN5rjrMRYKfPrv7DTMDyc8pU9LDRO1aPThgb+fS5yGOOwPjk3WeWHw1tz28L0l28QV5Qge/Yk+lz+OBwHpkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
X-Proofpoint-ORIG-GUID: JWdCmhhiXf_SPSOedUj81HMu_D2cHf2H
X-Proofpoint-GUID: JWdCmhhiXf_SPSOedUj81HMu_D2cHf2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_04,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=677 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010081
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7918

ostree is in meta-oe, libseccomp is in oe-core. So remove these two.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 README | 2 --
 1 file changed, 2 deletions(-)

diff --git a/README b/README
index 1c75f4a..7a848bb 100644
--- a/README
+++ b/README
@@ -68,9 +68,7 @@ revision: HEAD
 prio: default
 
 Required for cri-o:
-URI: git://github.com/advancedtelematic/meta-updater 
 URI: git://git.yoctoproject.org/meta-selinux
-URI: git://git.yoctoproject.org/meta-security
 branch: master
 revision: HEAD
 prio: default
-- 
2.37.1


