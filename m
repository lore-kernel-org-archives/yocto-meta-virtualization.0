Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0DCEB64D7
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 02:17:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.647.1688005050616726080
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 19:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CDMVcLkO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65441f2276=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35T1eqQp026203
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jun 2023 02:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=D/kb7nn/lLyzMfacFy
	kTVxJcuIg5Lkqni0LPyKtaKIg=; b=CDMVcLkOOJwihmlHjKI05r2ltk5H/JJwF5
	I4tPJawNk2UH6XhdRAusDwn6yGM98IdDfkW/1wZlmB3hJQzZMDQsUnB9KcJw7dx7
	lt/KhJMwLPDrwlqsvSa0wq6bZbz8b5OkFzgC8qs2JPZjjzJLLZu8WoEKWh/NeyjB
	4xM6sqRIT89M6ozjX6xq3YSZQAVA7h/WHTPTFislFzxqK6bnfEYUhs/Lp3x1EIjH
	sRF3XuqD145l7W6MeaTKel/bNdlglG8j6nCUwo2pdHbs7EhxxpPNTSl3aeIAtaSs
	g51RI8gkGByfGvGpLQodcqTNumVaJzvzY9+HHrF/MuhcaCfyazyw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb4exu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jun 2023 02:17:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5r9YZrdz0h7+FZPaGfX64lr6vKDPprG9dVqj1Qm88MdtwPUlKVJ+4MMcLwZ62H3XuhfZ0furGtRxUxFfzL1bg2lVtnJZVkcoy5kaqkO5cu4iVn7x2ih0/zDBoIQMTfiztudq0DAbnTwfNv0tNQdsI5s7Jj5bYSl+MhTwyykINtJRmjmt73Zy8f6KpndQsyGnf6mRTMSWBnMJtRTXvvSaabrMbTLRF1cnehDuNbdciigqoKwXDbqzQgqdi53P1Blb8+/Nd+Fwd3Vw7KVhV/MqmWQY7kcq+MRUwa//dNXi+b3qaVSXS1+cQiCrx88R8jM7qWsI0yXriV0pUC7XYl1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/kb7nn/lLyzMfacFykTVxJcuIg5Lkqni0LPyKtaKIg=;
 b=T/miDvUsYHIFEwQ6moC9T4bVGHXmA8RSGZwvNIr7tNjvb9+4NAaR9f9qdsiFmVBrglOFpv8UJcRJnn5xoPDJ5rNVKVeT0cWJ1KZfwJvl2LifPAKcfctWOSrzGN4XD6vfSJk8Sb/n3xIw0jjhom3xtjh4rL3uYPLm2qiK/YkxXmv2bGTgAvUV1cVx2YOs/tWWF3K4IsajXYuPtciR+beMCHZQiLDtsq9zF2lJjb7/0FvikKkoRf4f99vnruc88lORueNxYT7cYrXiC2y00E37zjjlwBSysILU2OTTr+qb67JdWMRVqwwXadq9+2kLP2V2jXQV2CIiG86y8fbhvXlRNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6283.namprd11.prod.outlook.com (2603:10b6:930:21::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 02:17:27 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6544.012; Thu, 29 Jun 2023
 02:17:27 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] cni: fix textrel QA issue
Date: Thu, 29 Jun 2023 10:17:09 +0800
Message-Id: <20230629021709.1191263-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY5PR11MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd7d4f5-90da-4753-8391-08db7846fb9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cS3KG0VaNvptdIpUbmY02m1LricsbKLkOtR1PkpnvdEt4tSpy0ljwTCTNd9XWom8hkNu5/WnK2dhDDoYk5R0mIMDpfgScsMPDLrgwRLMB4cyOhH23+tJq37VXTbt8W/BQ9pbrCm1Qyw4N1tq8JOvY8hziVOUzZsaDGStj41CCPQ8gZdEf6iv3dFL9j56Cs9rFt2FlZ6FixwB58NTm+wPf01ULlQyCvef1zROc+rfLcT62ZOjLB521WgnEZX4/uN6JOGGHZ1JAm7iN7izeHAH6Wl6Aq/4sGzWncxJYP88/n+qQVhkJbRGOQ9q3lLc0iMzrRfTgv6L0+JTypxVGl+OxHBeX5bLS/ws8Pvpu6sQbwnIkxaJdwrKlv05UeGQj/YfeaPFw/wItL1PCFGg+PlR9S2STE/Bnm6SeelHTWtkvfNqcnbJM6fxdtPhAhhDjuIMdZiX+DhYsuj7F4392MNTRcae9pFav1vR6SvMb+eYYk4arn649ivOJVS0SWhrnYEPtsVOCg2bTKw5s1mQj1goTQtjUGxyrTeqSHgaeHF6Ad9pcGdTDrXsJv5oZGbSxec8Aw7hYQp5cMOPE0KDEw71575vCs4PRy41u6NtoGk9uQY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39850400004)(366004)(451199021)(1076003)(6666004)(6486002)(52116002)(83380400001)(9686003)(2906002)(26005)(2616005)(6512007)(186003)(478600001)(6506007)(5660300002)(36756003)(38350700002)(316002)(66946007)(38100700002)(8936002)(66556008)(8676002)(86362001)(66476007)(41300700001)(6916009)(84970400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?upD31/JC8D/aLb+vBBnHrR/l1hx08Ap9cb+uFh0W1bBywx6y3RYe9AEcpeZA?=
 =?us-ascii?Q?73AdGw4ASn/7E4mPSb7IqfHkq2aFF3WgT770w5erx5BL9Ed+lWltZg1fRXDq?=
 =?us-ascii?Q?j/McHD02/Yu5xWPpWHi2ZlcIh9XQ4/In7bAd7pIY/VH24USZglhKHSPyFb7W?=
 =?us-ascii?Q?7CwWCDcgxs0eiGtdIXvEHayC0sR/fvIrqanJ6/EswNf6mKFEeVU8g0hwv5Ym?=
 =?us-ascii?Q?ndf5g7VNx832R3PN2jIVN18Xv0rhCXuNWXjiJuU/t3qNgAmlA9II0qkbbjbw?=
 =?us-ascii?Q?EYm93Z4ATNaGXVGXVNp4ZUFb8XVZXRIDdetVUhfKC0cSwzK8Yxuoi/IiLItp?=
 =?us-ascii?Q?/b+edm+OLOYawIO0pgsJzUM0igP32uBpmYsIISteNTNIQMLa9JOfoZXYpNwI?=
 =?us-ascii?Q?tGNqaYJPOsK/dJL4nI8eiHwzYGYnpsOjjCaqyC4Va/0f+FIraqWdybHUaE14?=
 =?us-ascii?Q?ughxvCJz4B4ftYEFsnsB6wgbt0kZIhSztyGTeRxqPGgpxiwPY9UeArWW9OG9?=
 =?us-ascii?Q?CXZXBgAJ+WAC+jrgaaI5sCv2ULaNHH0qR3nYXFCXlyoYf/nd08W9nUgM+JUf?=
 =?us-ascii?Q?JwBc7DTWZVDXXcpHSFRgHpkDBmGArMPIat9nfmlb7lI1qQt4WU4TnqP0OOWF?=
 =?us-ascii?Q?/JDz5xy1RyXYHN5HnCLDtj1w/TtWZV7qTLcYdo9Olzx6LPLXMj+73YWTn32h?=
 =?us-ascii?Q?5dk2s93M+ECkUM2f+9QKalwRRuFXu51dBgSHK+VIyWJ7PgzojKCnZtWNeO+J?=
 =?us-ascii?Q?JESSdarCTqvFmLfptuESeeYa8myzE9EbPa9ajNA1kAbXLr0B3FcBUkYeRxHR?=
 =?us-ascii?Q?rsKhHcfEbaeNfcIuCjaP+hcsCpfHHRdOA4Ztk123X8inr0+XGwJxql/KxFqM?=
 =?us-ascii?Q?8/S3xMgmUeiKeJwfwZ8VP6MmGHMVB+e/CxSo+0kNbiLpFKHGr0JRbxCpqMGB?=
 =?us-ascii?Q?V7mp+qBxg0/lsXTSmKoj7HLQJEDXIm1+yuDHhC3egVcFk5OlyMh+DSKUlZ8i?=
 =?us-ascii?Q?mccQq5t2vzSi0IhyX1T57VwfNwLsPfH7vWTyFno62xsPj7xLs07+iqknNAOo?=
 =?us-ascii?Q?GW7BfjoPrv/n7gpaPWJnCpu6m71gzUX/Qj+oXvqoGaelD1Et8PwzP4me+Idk?=
 =?us-ascii?Q?1VkXUr5WiTBOz6aZ8dAgZDyoDOQr9APwEOCX9Kwb+xCAUitw+NZXCdqGYGIs?=
 =?us-ascii?Q?yIii4DxgM5Ya7w1K3O90yQvF9i4wFS7K8Pw3GfvciGqe4RlQPWK6GbzqvZSA?=
 =?us-ascii?Q?bIi1Qv44E+QF4cRMubnVY00fPRiy+ebS4JCAn85fLk5F4pjSkxMa9pcXYjQz?=
 =?us-ascii?Q?KaUJAs1bZwgJy6cCtQcdbYZu9kvjkVAUGwGts64icSFYxorIhocVBe61ohiA?=
 =?us-ascii?Q?H0lPqkFNbIGhuKGCMm+HEccKdhI5TeI145Uc9IJeVIUhUPlWQLyikLYcT82o?=
 =?us-ascii?Q?gtWNNOBr8EqMLbwcBF5gQqPrcYABM004OuBDLKLEA2m8pA1DGRwNw/GOUu/C?=
 =?us-ascii?Q?LNWb4FTLCu0PUoAibW8WdmR2rujK2Q7B+CwpGNDFLPkXshXeJgIcpYWz32Ji?=
 =?us-ascii?Q?cCZ9Mr1uMHj0AfKQs3Ueyq8yAaL75FhNNgsqDis1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd7d4f5-90da-4753-8391-08db7846fb9c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 02:17:26.9965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ct+yzF7hx/aQyra4ikZQYSCJ2fKrTcTWxN7RP7o4xocA3Fs4IKJwzmoBLqGAY0DGvSO5xlGpmvD6Z64UFYdhNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6283
X-Proofpoint-ORIG-GUID: NRPYK8F0PZhouNxTibHWLsrzTOxyGYnH
X-Proofpoint-GUID: NRPYK8F0PZhouNxTibHWLsrzTOxyGYnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_14,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=649 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306290018
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jun 2023 02:17:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8114

From: Chen Qi <Qi.Chen@windriver.com>

When building cni, we get textrel QA issue like below:

  cni: ELF binary /usr/libexec/cni/macvlan has relocations in .text

The problem could be solved by adding '-buildmode=pie' to ${GO}.

In go.bbclass, this flag is added to GOBUILDFLAGS conditionally,
that is, if the arch is not mips nor riscv32, this '-buildmode=pie'
is added to GOBUILDFLAGS. So make use of that.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/cni/cni_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index 35aea39..06cef81 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -38,10 +38,10 @@ do_compile() {
 	export GO111MODULE=off
 
 	cd ${B}/src/github.com/containernetworking/cni/libcni
-	${GO} build -trimpath
+	${GO} build ${GOBUILDFLAGS}
 
 	cd ${B}/src/github.com/containernetworking/cni/cnitool
-	${GO} build -trimpath
+	${GO} build ${GOBUILDFLAGS}
 
 	cd ${B}/src/github.com/containernetworking/plugins
 	PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
@@ -49,7 +49,7 @@ do_compile() {
 	for p in $PLUGINS; do
 	    plugin="$(basename "$p")"
 	    echo "building: $p"
-	    ${GO} build -trimpath -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
+	    ${GO} build ${GOBUILDFLAGS} -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
 	done
 }
 
-- 
2.34.1


