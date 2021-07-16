Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3950.1626427037953403831
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 02:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kgauPi2O;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2831fc28a3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16G9Dxhj017640
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Jul 2021 02:17:17 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tw2q8cay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Jul 2021 02:17:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZ2j/0VDT3TV/igoj+a0j4ItEik0o6RLeHqE3NYQitN4iabts3CjAX2s08sdCEcYAaOmJgtSU0ToVbeshFmiRO94z/LggyGG8F1Vrn50z2jyPbyRveHAPOACLONysq9hVXWaE2dxIn4Es5kSZJMU0xJQgxUZhHuQK2jth731lg+zbVK0v8VYa5rih4PgPAuFQ4NhmYuffhzlG73GpopfZO5g/RjlAiZ7q3IP2tl+LuowfNs/fUDrMbZ0fsDhlrGb/+t3vCv+xFgjMZW+d+iFUDXUIZ+HKkutjn6It5mqZlMcWyb9/ccFXDJVf+kd3jW3JjQUDFudC/wvumOnEiv7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBMN35rwamROpfrjKxzs4G6NXnITJmvtMzHraXOFd2A=;
 b=gd4X2oF0MYiGQYW/5GJYhFiO0/+9iJy6bwPqkWhQ6aXPlODXoBKogqFqegvSRTHLx6ATiOcS+RbC6Ub+NV1sQAk2N7ueKeDWoNQvFIpWd/NgWxE2b+MDC5eSGYKmqat2RzT0KZaVEbfN18JtjkF+pluMWIS+NZOwThihR6ZGeVBSM2TZdSTuOsr5HS0kdZKvavGqAKEZWcQsmjEjkQg/m2q1ThI3Jg+fCrrGiwmvUR3YxGGg1eYMgQ4ahwHvgTMZEzmsF4vdDGVghvfd24TfjDaQgALsMnGArAe9wVSPpaZ+IkBS8xeF57g5MzaPRftjYbHSwLff/1QHYWPQc4XyLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBMN35rwamROpfrjKxzs4G6NXnITJmvtMzHraXOFd2A=;
 b=kgauPi2O3f0Jcw/k/M1/X73jlThjbbNc6uJC7dZmDANLOFqUTVqOkXjkgPZAV44Uz30Y9woQ2aLRVIBx3PGOINDQXIaDWFP0904+uCWv7JJ4U+dzjuuOSGiSKIlmUuhTfeUHmIA/8E+788P1sMuTaiYcFWU6N5acptO14ZWa4Wg=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4683.namprd11.prod.outlook.com (2603:10b6:303:5c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 16 Jul
 2021 09:17:13 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%7]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 09:17:13 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] docker-distribution: allow empty packages
Date: Fri, 16 Jul 2021 17:17:02 +0800
Message-Id: <20210716091702.55528-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR04CA0052.apcprd04.prod.outlook.com
 (2603:1096:202:14::20) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR04CA0052.apcprd04.prod.outlook.com (2603:1096:202:14::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 09:17:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bfc3be2-d958-4082-dd6d-08d9483a7f92
X-MS-TrafficTypeDiagnostic: MW3PR11MB4683:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB46835950C9AF4A72167A3067F9119@MW3PR11MB4683.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xG3pXZUA0YYeNEPPtPyFcqq2Y45m4yrjsUXC7g/PGrPtIFvtdAXZCS9+mirg9csvc4P9Fn0BosnzqorfNosi6jbBGpPYxoDcSdUXyRB6amFSdYkcYm11pb27dRE1M8BEmE292mKUmq+We2O+B6rDzGuKbSXYWR+ZQY1kQlXtRYORC7ocxkH7JUKEec833wsyoGBSTaOKELqE2SCkdlHlW69n7E8Tmu01QZjVoa2fUbB7e7s5HoHdjULX3lLa0dTZkLCEXasCv3GxG2lIx8xiIVejvIOGa0Jr5N2dYcEirwtafspac4yfdIzFCrlRd08xzmk3VU818X1W6rAw569ur57FQhDQT8+X+5+08GHCo8AajrYxSYfH++YjiZDrsrhHeimLGEW0SxhRFsoxZiG+QFswAmfpMB62aNm1NUm48SzYylvDPKJ0Xy8WGwuyxGIyVNIDWkZLqkjwmPtxoDPA8bFuKbUdjXuqrKJ6tEfRwGM3jvqI3vN5GFfyBU7b4dX/qPuhydPDnNDviLNgxRTAIdpzRRSPZoMsAP60eGPz1WVmRu/1HHKQhHvCZNVlgMFnj0bSQ7xVeiHoXEvsJ6Ozmn08VUSPNbghByADVT8fSXeDL8kq31grgKktDX5a8+zYYJtCJPboShU+mpZuY0FnhrE81jRR75sw+dAlRP7HQjU4Pukja+NkmQ/yFkpqs1r/BYjbiZRJdyBEApBqaMA1pQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39850400004)(136003)(6512007)(6506007)(36756003)(6916009)(66476007)(478600001)(66946007)(86362001)(2906002)(38350700002)(38100700002)(956004)(26005)(2616005)(52116002)(316002)(44832011)(8676002)(4744005)(186003)(6486002)(66556008)(6666004)(8936002)(5660300002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DJndW0GB0VWsB39o0TEdywM9zmu2ImnthHZHX4EM4RVeuQb9Nb2JNY5BS2/N?=
 =?us-ascii?Q?Bu1Gu3ik2/hLtuQmn6uAFExoxf/7LXcLXwhe0d4xzdlek/Denvtxfv4Svtr4?=
 =?us-ascii?Q?Ro3rDNxdC3OB+42eBpRPRdRDkbgvDgtmLNhbzdn/GyhRXnL+jO7Xoc8QhGzR?=
 =?us-ascii?Q?afSo2o6Ane1q9IPC4qFUX8vNfOK7g71TNvGPxBsijrJwg2/y8xQuDuy655s9?=
 =?us-ascii?Q?rpLWKqbNnxn7ZRDGH0EHd+QpTmYzW7lHkjUBbxKQGV3pZj1zZnb12J/hON5G?=
 =?us-ascii?Q?7p7TR33bY357xObs/M1KO0TRAheSS2YH1W0qtlxqFz+uwl9PN+bqzdw/8IHN?=
 =?us-ascii?Q?RdzeBoqViYJgnrydo+qpN9ieGaYj7bUQO6V7bsDvbDXL4wMcis+0zSKpYwyi?=
 =?us-ascii?Q?JvTmohFBhT3NTYU5G8+VYlgA4IzcSw/1bkHUMFiRvRYDGcmIJH7D3tZKQneB?=
 =?us-ascii?Q?iehqh/rjIpLEkxsmqgPFe631EoOST7g/43zP01A1UMrgCdCAFL7G80o/LqGs?=
 =?us-ascii?Q?1l4f/5YbiLDA6Oa2bssQcmkLL0VboxFy+z+/IB7q8g4ugZj4bnDgYTYet4sp?=
 =?us-ascii?Q?pC/2SmdmRauO5+f4VJ7vttjxvFvc6qL47CvmapJ291d6xuHJpf9IA4VHzECn?=
 =?us-ascii?Q?uxd7mNhN+UIcYVem96GMfvf92MhlocBGAsAq3aLaRRKzSK9R4gVSzgcrJ0WG?=
 =?us-ascii?Q?S8/BvtAok0oOmFPg7Q4n0lvHwatjoJ1akINizksPX4lB2fvU8Cnp2/cWGwx8?=
 =?us-ascii?Q?ljoOXpRoGYMMB4G+sdfeiIrzqQF5cs+eNjkVmzdK82CEIGHlS3/re9d4cmnY?=
 =?us-ascii?Q?NF1Lrp1ewxPjYbAFS2kt28xpGR/rj4OYAUVfUX58yVhF8BE5XZ2EQBSRzbSl?=
 =?us-ascii?Q?GZFx9hdwdPgtErEIsj1U3ZFL7VRuaghqguJjyFSBrTRg76BfDP2fzhN4fzcM?=
 =?us-ascii?Q?PFvfZzXexUjDrozsjCeZ1Vpwgp+IGHO4iopiHXSzIgDs1tkwk00mWQBWisK6?=
 =?us-ascii?Q?FFHjEFo//u4Jauc5MsMpeTea6FaAlchwUQy21xDxTKuLuB0NBxfAoXPH785V?=
 =?us-ascii?Q?gk0uMvGFcqr5ecitxBeDLEwJur/H27swOsxafxHYPpeUjHH0/0Ies0D4ncgC?=
 =?us-ascii?Q?DhQ50IPsJB70tFwn5MCvwNkvD8niT+Vd5QpXon5vbK7G/2bAwRVQhP8OfNus?=
 =?us-ascii?Q?GyOxRNSo2MTJzixj9GA7kOcWztfwrWe6wxhGVuDDhn+pcC8Hs5NEY/zNI3Q+?=
 =?us-ascii?Q?nHT/M00QeXLrBGe/fGeXG8kgfJsWbjLWQPm+f4LvWtcGkyEhiJnRc8ZJZsRx?=
 =?us-ascii?Q?fA8YMt6eFF2AdZYOZMCnmeAr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfc3be2-d958-4082-dd6d-08d9483a7f92
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 09:17:13.8058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqteHaIpEWM4oUATfvRH6saohKvrgTZCj0OAHUntBcFViMXBNGFb/3In1qhILGXK9YbHu+Y4U+1Tq3QWL1BvKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4683
X-Proofpoint-ORIG-GUID: 7w6gcSRGCsgHz2XSvjyKl9L2kLYMPjJt
X-Proofpoint-GUID: 7w6gcSRGCsgHz2XSvjyKl9L2kLYMPjJt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_02:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=648
 clxscore=1011 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160055
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Allow to create empty packages for docker-distribution and
docker-distribution-dev to fix the do_populate_sdk error:
Error: nothing provides docker-distribution = v2.7.1-r0 needed by docker-distribution-dev-v2.7.1-r0.core2_64

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb             | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index a83452e..88ce957 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -72,3 +72,6 @@ SYSTEMD_AUTO_ENABLE_docker-registry = "enable"
 RDEPENDS_${PN}-ptest_remove = "${PN}"
 
 CVE_PRODUCT = "docker_registry"
+
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-dev = "1"
-- 
2.25.1

