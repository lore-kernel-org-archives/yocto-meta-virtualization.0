Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891B7C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 05:12:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6024.1709010753787596251
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Feb 2024 21:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iYNc+8fq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27871b5145=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R4t2tA005128
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Feb 2024 21:12:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=7Nsps5ykNg2v9CPIpf
	srC5L4IrBqBKg+nwSH0cmlYuk=; b=iYNc+8fqZU3ZEIxktN6bsxHeoLxzYUh53G
	RLMR8FEvQhTZDnmWwNRYAl+tpjo4aNj/sgxB9p8zLQhI7diDVKk55/4TCun624RV
	PCmzHzIHCmzTH7+UCXxvBJ6pOg8cYtJIxemBABHYjZxZ9Tmf2oVaDbpzLtNIefTs
	PVkeuquiI+zYVvyuzyDmnhWs7z0MT/VDQnrMMb+igb/jX9+2UiY5E4gbo2q463py
	hqkBjNyUy4OIPU2+RtByUbybGB1qiW/B9D7ewlj1ruVj7otFoGI9BOGp/QfnQ+kn
	7UP/VRi3fdZQ5n+4cTp0yOb0NTe5iVIeSCov1S2PZ9VBSZOVh/pw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm42heg-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Feb 2024 21:12:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyoImfrRqQ6mWkEfpamnYZTI0MfCT2YrZqpIPDZOCBctbQQb4kl1vKDNv5Mn7gZ7lZ/tKQRYFQcumGHEHZmjseXjQ8pfu4RUoeuaoPdb+DCB9TMnDGN8DVqiDCPIfdXp1JvfDF8nB6CvanMqfmW67lQe2N/ct59GIlduR14npKL55jHZ54/SimEUI6IeiEz9SXzwzn44uNrO2I7MCiCi1GxVE4kQpxfebpxSc+Aq9FmOr3jZGE7NZQZ1rotJkoIj5eV423lXXb+PjJkAeHjOaOGT96GpeKppapRbplY5aKsHbI70nlzI0c4U1VirirdqT1n7a9KH/guPNS51lZPFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nsps5ykNg2v9CPIpfsrC5L4IrBqBKg+nwSH0cmlYuk=;
 b=lblLKgKd8fFc6iS03iDYVUFXnl7PvoyCzEmI/Dt6JYWsQ7vVgm4hJ9k1AGkuFig08M2u0n42sbRMTcu8WKgG5Q9JorAjdaxTkFPewKdazyWZ39q+61Y6TKqilx/TlH1WIRuYSNdkhjJXGqn5nAAm2igVl7NWiPZjacU9OGzG2oEsFM0O+EuVWk7Lt4Kfy8iXSauyl8ofz/8ZWk42xct1x3TR6g8wLbtjtCGMffPCOBVfTve3PAoB0zdGV3JW1oAdeHZmF6kWoChCiP2n3DzAfrQ1t6MaFLBvH45GaYUUYCnT/6v00uBPpe71Sz0ijZT+OwaUYkEHcTVQxl+udfFwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Tue, 27 Feb
 2024 05:12:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 05:12:23 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/4] oci-image-tools: remove unneeded deps
Date: Mon, 26 Feb 2024 21:12:08 -0800
Message-ID: <20240227051211.3390256-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 9242548b-83f0-430b-7829-08dc3752aea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bhhV1qIVbTI6/TMyJSSKfNjf4DBBc2HjvcsZlEKeum+6ElrmgwxpeqPe16U2RaD4hh2NBaaIxDrhQg8XUDSsIwNzb+Waxfum8r7nubW/kxeU+SarOl2iJV3yelfqTbcoCu3nuNq3NNGsiNMZJuNonhj7DQQ6fPggTMtHW8OzHxifoKtMnF5yTnkvpymwb/PVOI9V73g4Skb8eV6I/ooI/DeiBJkKBrwLOcmCbfHBGRd0p1/56Z6hMG4S2u+y1zSxM2UaTFIT0MVaLr5biObrvdfLRMRBCiX6Eof2bMiDG5Xd2+kz3hpwfiqcqH6oGVPVc8e1gZix/N0Odsqn6+Hnt4KnasAYg39Vz40hTBTbtN3qbuwMuiKQGNQR1iLheqX097JZ+mNA9k2DSV4oE/U5k1yLM9bogjKXNax3KYXecz0+M7XIzxV3vb3b9rmYHl2EqpcTQfgPULittdfYf3I6vxpwhSRGYCdpsj8l3IMYDEHv2duk21Aa2d1xqA+qHmYcVAgo8c+HKnEPLho2q3XL/nOI3AM5jFtYdI0Gi2eaiFMuaoJhSdQj1go8gtUQHx5OjGV8hs9S/pvd1H2Ew420ZBs7L1tLffAFJ8p2HZvDxCFjQy7OQuqyHkSXidV8HTRnh0mzNzsVCGDwxcYk0t+Vfkqq4jUZBY9VIpsYKMRNBu8Ydp+w3qn14tgsCGR2VKbvd2GIYbCTuH+t+a7BNJ2pCsu27J8xNjFZm3TC4NIVS/s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tWdbDFOTlTJAYBCgNysSLwgr29I4d3C2ILeXxRoVTQKpOnxBCuY4udDchkPe?=
 =?us-ascii?Q?ORpFkGQJ/1SlfwOqneujz2yOOqW+WgJDaVPYpUjywPlCcFK07qJCfpN5hKNQ?=
 =?us-ascii?Q?4MCq9EKpVxhRJDbmwHXGIoFO0nIY55616RSZVsvIm+zC47v4hSkN2U9g8/vl?=
 =?us-ascii?Q?5p3o+Qm/Ix/WClTEFsfpA/AiY+NceUOtpHEr4hznAZ//eKMPtQtF7HPXFYyE?=
 =?us-ascii?Q?iLyqpNbSqGs6Mjcr5G97p8BAxQtE6t1zimaT3N+W8ZVMFLzDIesin6l4t+E1?=
 =?us-ascii?Q?MGkbK1FmurpynXHXi4vBt080IJKu9y4Cmel/w/GGySTop23zH4bx53gvmoS3?=
 =?us-ascii?Q?GCVt4SZ90X4mGMqVVEbCZUj1oe9ODJP1p3hWmTleMOcEDRqma8rGiq6Pm1Ko?=
 =?us-ascii?Q?8I505Oz09a74bLH1Prf6UOQmh4VFvbFSyBA7XwlY1QPk9KWSlz8FMgrg67Hw?=
 =?us-ascii?Q?R8WTi9QKIB68/kx8SL5S9N02iMlKBds1cQbwUBK1sVPvNzit2ffcvZ4P17uk?=
 =?us-ascii?Q?qwvyFbweGUYE66rRkq5+/1epCfTFDTMYRIWXi8kRFKclUth15M71svdEH68O?=
 =?us-ascii?Q?S7TpWw5kBQEQhagMpSYofmQbHylmBciBrg92VVXUkRfdi3YX/QKdv4TXbRUA?=
 =?us-ascii?Q?WZjVa43yZaa2x+cEJEvctzTb+pd+e8QfyLq+XVbkg2PMOcJrdaulTQCug0iL?=
 =?us-ascii?Q?QgVPJik0DgVxuzYPteHjcLHPXJWcQquMmFldqXqDG5pGjjXMVvjwLjuphWxW?=
 =?us-ascii?Q?n6r4P2l4RRXtGmF3ZRF5pnSuQ20jggvS0TWMrWvWzihxk8esC0TP1DEyfgAQ?=
 =?us-ascii?Q?1jgsZF1EYANavDHcurPsB4CbWsUBBjkV1WLdiuPd5gDgPDRG+by2tdYvY+2e?=
 =?us-ascii?Q?8QBKq67kJ0yfX0SXNILpQxKWI/w8KFra92Gk4C4Opk6+S7h2/1r3nDORbEGl?=
 =?us-ascii?Q?ovrAmI+tTx8Z+dEsTf0JmTuBwHVUUxbM30lm49FkP4JQ9dD36dk+9EYwUjsO?=
 =?us-ascii?Q?j7jjB924g9P8FYkcTtOcCeBfvvOQxHoIXzABiMm9FVyLjWhZWImCcGd+WMlu?=
 =?us-ascii?Q?Ej+1ySeS2ip3ouSUryRZUmSmC3lQ2AqfYyutrkaLR2vhwGwgQftbO8/ngTg6?=
 =?us-ascii?Q?NWIQ9ha8s2h4peeb3a4XpeYZpX2W61KG0AQK18t4hETYnKxQ9lglI69upI98?=
 =?us-ascii?Q?2DvhUB7I6kqOS7dKtktslmpYzwWDUL4iVZ9OZ9m3wbwJeIY25bx0T4X2FfXn?=
 =?us-ascii?Q?FiYzkk+DHHUOnMeyMnJgRw/w3bFf5J+cayvcIq8Ae+x49V7+GtYD/+8KoFsc?=
 =?us-ascii?Q?Zx/r00rSg5F5P7GEk/YiGE3Q5whH7uU2we+ZW1DAJ08Kk3UcTC/1dw6g4+rf?=
 =?us-ascii?Q?89pAFRov9AcN5fOdWRJVvVBtBKObPNMlMUrsc228/IJ+VE82RDF1Bycs1fsv?=
 =?us-ascii?Q?VDyd/+wllbT4syLhUzxFrLSmg/VuGCxXPmYN4yRt+n1Y9SiOgLdtFYOTea5o?=
 =?us-ascii?Q?yV9SW+FUqdo9TVYrgkat1Yb9I7njD2j47qVMdOg6EilE39gbZEEPnKb+DNe5?=
 =?us-ascii?Q?oQ3X3ikFCD6UarzBOMlvN17LPPpJ17zGH74iMbe0JIXB/9xQQtO+LKu+DTIv?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9242548b-83f0-430b-7829-08dc3752aea9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 05:12:23.8600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32DEh6yCaanJFJAVck3U/ynIi1AN/0hmw5yNcKBZZNoOZQNF7ZwsGOc1143++htnaRChE6OlWjowWjfBqo0c9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
X-Proofpoint-ORIG-GUID: 9PaorfXF-qJ0ouF4H61WA1no-xbvy95L
X-Proofpoint-GUID: 9PaorfXF-qJ0ouF4H61WA1no-xbvy95L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270039
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 05:12:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8586

From: Chen Qi <Qi.Chen@windriver.com>

These deps no longer have any effect. Remove them.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../oci-image-tools/oci-image-tools_git.bb               | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
index b925a2a7..ade6534d 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -3,15 +3,6 @@ SUMMARY = "A collection of tools for working with the OCI image format specifica
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
-DEPENDS = "\
-           oci-image-spec \
-           oci-runtime-spec \
-           go-digest \
-           go-errors \
-           spf13-cobra \
-           spf13-pflag \
-          "
-
 SRC_URI = "git://github.com/opencontainers/image-tools.git;branch=master;protocol=https;destsuffix=git/src/github.com/opencontainers/image-tools \
            file://0001-config-make-Config.User-mapping-errors-a-warning.patch \
            file://0001-tool-respect-GO-and-GOBUILDFLAGS-when-building.patch"
-- 
2.42.0


