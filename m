Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.4380.1623829330524357218
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Jun 2021 00:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MjWznNeL;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1801fac26c=yanfei.xu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15G7ZjbO016259
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jun 2021 07:42:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com with ESMTP id 3970drgfhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jun 2021 07:42:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8YjoKk4VgY3q4zodiD9kFCLI9CMdgRjcFO1dvCTlsizvpIZzqn5iw+WnOl2yTBXOxu1rxkCAxA+G3Ocp5wZb1S423XFldBHhkSQOk4We8ackzcfuY18cG/qxX7AP3lutj1Tq2C63YEWVTwI7kry9qGZux4gwmrk7YrSSJTaF5ZofFEv6lp+bC3ukKQ1tfZNNLUl2Af24l5sL2Caq9FMDLyR1/p+/OHSOvVbAmNxlxypC+9NUKQJbBde3q03Tbcy1jyC3FF1kEFl8hzgL4G1KTqNRtmDIorqQNZMtMgfQHukc9auzZSc8lS58lBLrnsxpgixDVhKcMipn0tNbGveug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXB5Ml3380nxg9HIZvB32GCCZJqL1dK5yoMFvSl7i6A=;
 b=aiWLCTfdme6SCdWysJ3yqgSmnhBRfaAwrmov40X8cFOVM8C9osrfLU1War1e3tx18+ZmO0xWi/bqfwqkK1SLLoYS448MDcbWQyRWVZYFJ3gAr9Lu/11JRD/JC9eeVAls0S1x9JE1+CbyhaCgKAaUQH3WuzxWMZ8HlwsjOby0rLjy4q3Coork4FYKzQYZ8fl/P87vR9LuGjnwih+Ew+dVU4pW7IAjr8/RPGDvZATRYvENZjXL+SfjiL0bYFiDp/ec1TKF9gxfX2Ucx11i1pz1G4u5MGXCdZ0oXByZvDLzwvWw4eHUebToZZsCl43BEopEGofsBFzuM4fwTj4OQu6ugQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXB5Ml3380nxg9HIZvB32GCCZJqL1dK5yoMFvSl7i6A=;
 b=MjWznNeLKqQTaQykBg/9AP5X7feJfgWhZc523v1F7PEVm8T5Ybvo9UxhySTVYt1jlrvdcTYxA21NU+cYIVlAQxcRK9Lk5M/pOema01MicD4AHxyKYs7WCzo012ZBmp9sescF2jAhIIS8xK5J48Gz1CM79hExFGNJNITxSWWMcsI=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3304.namprd11.prod.outlook.com (2603:10b6:a03:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Wed, 16 Jun
 2021 07:42:05 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::34b3:17c2:b1ad:286c]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::34b3:17c2:b1ad:286c%5]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 07:42:05 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] umoci: add nativesdk to BBCLASSEXTEND
Date: Wed, 16 Jun 2021 15:41:53 +0800
Message-Id: <20210616074153.31524-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0148.apcprd02.prod.outlook.com
 (2603:1096:202:16::32) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2PR02CA0148.apcprd02.prod.outlook.com (2603:1096:202:16::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 07:42:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4270ce90-33f9-46ec-9764-08d9309a3cc3
X-MS-TrafficTypeDiagnostic: BYAPR11MB3304:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33046E7CD1D6AB7E2F3016ECE40F9@BYAPR11MB3304.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CoCrJNRUmCs6XDaLflUoapFOtvnSRtYM4uh7pusYxZj8v2XKRCx0S+rnNOUj6LYh+NX561t+Yg9LVT51ZgGP99fMxUnjtFK6vQk0aZc/vElSlKOwvXSHRvSKwXcuikHYWx3mDgyZb23n7wLuBeB7fQKRmwovhOvC+4a8YYKEuOq13M1HcZlS4TCTxPpy8WtqIKn64RtZuD+XZAZk6yYpna9V8nnl5f+gpuBSG16KoSUWpp7JylZxUzBSwVrwJznA6a+y/jjABoJ7dZ0skvhAXLm59dLA2+lwe3dbELJEy36XHpOV/i3c3TaOAXVLS+JO071TY1ldM3BDmgZwngzMtMEE72cLiF3PEjVgtybDWEoOZCZvHbAc+FM+9afTC+WUAPl7smk+usDUKLemi2mCXsz27H9udM7QXfga7R9UkGiA8VORAQlQpwqRT7vBScJQGu5w8+BpN4lEMw0Z69EjQBF8BlVT/ArMbyZnM/FRTiPywDsMksboIjrmXODX1Ug/i7o0odMDauHCCkUyMPXbEp04TTdlJLLFzlvL0nl7+ozFMzL/0hsAUuXnVAlZ/ENDltvAFT9nk623OxHxEMGADzEHZFTIT30JqNutlNfFkUDbfwEN8dUe8aSQctkmP1gm1dog9V9unHY1HXqcNnm41w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39850400004)(52116002)(6486002)(478600001)(186003)(2906002)(1076003)(6512007)(38350700002)(38100700002)(26005)(86362001)(4744005)(316002)(36756003)(66556008)(6916009)(2616005)(44832011)(956004)(6506007)(8676002)(66946007)(83380400001)(66476007)(5660300002)(16526019)(6666004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x+n8al6fAVgbcAugNZvjuDhNlBF1/zYPqWup57xlCHO1gMD6dOQejjWPJ8A/?=
 =?us-ascii?Q?TmaCU6YW3REeY9Ojp1Q9vor/0uO5UhOwkuPBdp26Dt3AWGIrCKBFdlMDNKuu?=
 =?us-ascii?Q?N7NCz18/zblI/yik3j/fZjllD+Dad8Ab3LwiX7x2Cey0vOBS5nG4+Gh/7OPx?=
 =?us-ascii?Q?9QfLiXOcFdxFH/4lEIRTOat4x1fV1SjYH3D1dobFbjFZJagbHyDM8wqirSNb?=
 =?us-ascii?Q?R0vq2O1WSLzNCJjQnqz5PvGKTgOFdl0RjubKAU3BCNA8X4hr0dx7uMl0pM7i?=
 =?us-ascii?Q?RlWnZme1fmXHotL+J8ePHXc+EeTXNNL2o2YBrSsCgJxF8ldhutuTESZYidAi?=
 =?us-ascii?Q?IXXuATzZXFrDX7h9T2/+CctKEjhUwVHl5oyEDpCmOWlvKl+Ao/8zF870XK07?=
 =?us-ascii?Q?21r3zPgVAzninsi6YkT+nd5heIo2q0sxUZJ8sCAulIZK8wUzMFeE0apYfSt/?=
 =?us-ascii?Q?IePFg2RGF2N3+P9On07dDBUKs9wp2EvBafmohR57r4U4iI3Z5WreyCgph94d?=
 =?us-ascii?Q?d8bmfqk5vR7CBF81S81M3rL13eAFnDS8SUqjrNw4V+ygys9VutwxwN1aNMpT?=
 =?us-ascii?Q?b3xWRl7NZeZr/J7Lq06gVv99GrmlN5r9Lt6Gn+IooB48Uy6E4URxB4Rh13Od?=
 =?us-ascii?Q?WyazMTq6VVPjlFv76cJnDa2pl3qMw4hGs6u7/oBM7QvTd5xKFXHD+kPasykd?=
 =?us-ascii?Q?HNrWp2zoBFUXp/qbFeXzoG0GAJU7/J3ghqDchkbRqzVx1G7AZHPkUyAhZ4d1?=
 =?us-ascii?Q?IDFRsoxbaMPEtHG8Pr69AA7Madu61z2fNcuJAivpz4s7ffUllB7bXfZkgRtV?=
 =?us-ascii?Q?tJ8mD/6lYw5cQTNKgVYDa5Z34/3IclyAyqzwJsS/jRk+kKcwPPC/Fa5YLPT0?=
 =?us-ascii?Q?+50RrIso/JF8+/wJldxSLr/hofbADgplk1e2iyCK7Sw2QVjg2xSmTFxwt5gm?=
 =?us-ascii?Q?LnTIA19XMpf7TcD8/xiPfwMapw5KP1AK+HA2a6xl2brqAWkMVhv9QNzkdrNA?=
 =?us-ascii?Q?znhWu6fJur+djsAJ7tjZeKRiFeoXecJF+aSaEmHnLXfAIbueNGLGAJwlRiR+?=
 =?us-ascii?Q?ZJMDZUwfGPUOzMlK3qKc7RTcBVmqjLBa/ktHso2vcAR6wBVEZmij0rGq1fxu?=
 =?us-ascii?Q?oiVUiwfh01Jb7Eu1P/Cba/KJBYw9oTAEUI8HfbtsbbRiXPQ3lT0fyDno/92m?=
 =?us-ascii?Q?jLOVuDc0Dm1FSo8buGFBgdDzE1ODkCevISydNFpr5K2/sTeaydy7WnzWBYZS?=
 =?us-ascii?Q?5mklS8XwlNHK3eu1M5jEpb/w8+McWCXiCykzGlGaKoBwM5UzzTZ9ltDOEKa/?=
 =?us-ascii?Q?vVzfYMuFpIjTdk8pgXrtCez4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4270ce90-33f9-46ec-9764-08d9309a3cc3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 07:42:05.5432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PR2jH3GkqXvX/IYdxjG2oymA+Oi30San7sMvDvY4cWUNbrQ0VdFx8XFUmU6AAROd+J5aUtFzRQBS3Ah2LcwAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3304
X-Proofpoint-GUID: Jyj70YuvMxjiv97GslY5aaaeIMlDQAJP
X-Proofpoint-ORIG-GUID: Jyj70YuvMxjiv97GslY5aaaeIMlDQAJP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-16_05:2021-06-15,2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=801 clxscore=1011 impostorscore=0 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106160044
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

add nativesdk to BBCLASSEXTEND

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 recipes-containers/umoci/umoci_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
index 7cd147b2..f83a35a7 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -77,4 +77,4 @@ do_install() {
 }
 
 INSANE_SKIP_${PN} += "ldflags already-stripped"
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

