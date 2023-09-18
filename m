Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B36CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 06:51:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.45930.1695019880331562443
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 17 Sep 2023 23:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Sb++KNfj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76258f09fb=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38I6cY86031375
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 17 Sep 2023 23:51:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=p3x8r5Rj+BGMcU7Oq+
	6BObGuZyhW3xUJXC5DATMThlE=; b=Sb++KNfjZkn7naiDrlWBTYOh/bDC/qcnkJ
	pdMRv48Qyj7ou9xol7pomdEus4l6kPK8Yreh2KTPaZQdfbrpxn8kZCETkEFjgKGj
	6qyFg9fJJDBwiBf5Cs4GOI1qr2Wje+iG16sojI5HtOGIR4fmXUoIFo0AReenPjt5
	3c/bBDy2bz7mFxpk4i4/onjCDpc/f+5er9rRJhfQbuEQ/A3FvF4PUvdVK/bZo9uE
	QYfIvvczLSvYtUuhFLsPKdRPVNE8OBZk/AsnheLHYxhG4JknnFc3B9GNpPRTk9YL
	dzklbdHrRB9qfW9G9R2sImEyOevT/LwTGuRVAVj7UFbwZeRI28Nw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t57n0s25t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 17 Sep 2023 23:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYxMzYf9s83NZElRpO1t4gb9Yo+5vSAwNmTDU77mOgQVdKVl5DwEry2MHL+skev2jRHxu9ghnpAfzXxezt39htgtiMwdwe9+sa5NxtdKxMwcHHPdqNOX4XsTKf2tHmNz7nkPq+uFgmajdTtoKN+do3LnEEaqoYP4ms2xZdEY5Vnma1JZDkf3jLD3imgiAZJQq1G9EG9zR6DqRCdZ6UiAyy2vJDuzHJWepdipze9dc/U5P/P9jtLV+5Sarvkme2BT/64xg+0hZuWSTIRxmMCv2fuQP25lydwTIGgcxmZazxw3i/CdvsMIawuMXcIwJr32Q58wKpr5pOYbyLx2KZLfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3x8r5Rj+BGMcU7Oq+6BObGuZyhW3xUJXC5DATMThlE=;
 b=U9iqmD1quQ0dZ9LfzXkK7jvHM+gBV7bK4+PhIfRBGmBfituItnDzKLk/oImF7vo+P7RpYxpFqzp6XOdEPLtDKlcL5r6BJ3PgLXV8JBVmOgX52liYsOE+aIbZNBFwW/ypJTnTgjLa0vKl91Z1shg6GM3zwtCnZ7WDGPcsLD0K5WMQzP1gYnsyoSe0mHKWZSuoZ0wZAPBhqBK2offycJuA3/lcG4B04oOT8vuXKK7Io/mmK96JERDq9KPPCS7AYCSErF0lQy5gbzpN1E80YepzNOr/Q11CclJw1suIZfUXZgeE9d6k395oLseKG33hWazRxC80NTscjXu8YGYSW0TB1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB8377.namprd11.prod.outlook.com (2603:10b6:208:487::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 06:51:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 06:51:14 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] docker-compose: fix textrel QA issue
Date: Sun, 17 Sep 2023 23:51:01 -0700
Message-Id: <20230918065101.1104194-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA0PR11MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b253d6-b5cd-4c9d-cf35-08dbb813a64f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uF/uOjAkBvcfTVX0wLATc7vEMkzGTxFDcgyj4pPPPP0CjvK63JXlCeM8s3UUVZTRAeM55jsj4TiYQWWbsgDT6rqrAnxDEtSUuuXr4wCte8CepaZ8KCBQw+FYivXNHnC121TgGGlMQe6vmbztnd51tzCsKZY83darYrrEPrB2wxIkGYKsTnQvywITApWPrWtltwBoz/6YHu7J8iE/7uchsskLn9xZ0QsIMi9hNkMFe0dIvobKDfY+D0/s0Jvu3PzLUTuKApOu+CcpR3P2VivpAQSkT66LH4efQgq8IYSKX64HBRyiMjrOcok0dqbbesix3/buHzoolimKSFgp6KuWmTzLORRhyBJ88QrK2q/5HaYr0wW49iLPxA4NUSJPcH2R9DFSqX7G16aaGpikPkYcK1K5lqBQynkWzNdf5it4AL8Bf0ZggZw+2B32vghn5biUGnkhd5X7+vWo+SMDwb/UelCLRi3N/7hx0VgX/ScYV2tvh1TvY7nUeXy4I7ONey/7zefvNiA4eUah6D/PpG9yRR6U1sIS8on9pQ9jiTqnvVwrVwHuCXtjOR4Hh+T5IcNg1a6s2IdzlhpjWWKtAQdVaLpRCKnhCiWRbAUrP5rXm7nhu6yDvYfrLNRWSRb7j710
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(396003)(376002)(366004)(136003)(451199024)(1800799009)(186009)(41300700001)(316002)(6916009)(66476007)(66556008)(66946007)(478600001)(6666004)(38100700002)(38350700002)(2906002)(86362001)(36756003)(5660300002)(8676002)(8936002)(83380400001)(2616005)(26005)(1076003)(6512007)(9686003)(6506007)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H+dUjdQ22YRJsdJuIsV54JHkc/Z6rMK9IbqbpaUZmdCmK6IGgAM2trQo8R7W?=
 =?us-ascii?Q?4VksWfp9TfNwcFaeLJZJ9Vg42brFAxFZ6BI0FuL7wR28fj8Z3gL1PiNafR2G?=
 =?us-ascii?Q?x6Ur+7vCTiLlB/8lfBGLe9KY6VCFA8ZWWyN2DBWz6OwxAn/Kkr4385ceIDmd?=
 =?us-ascii?Q?l/yWKIQcxpsAP1zD3v450O1ZWOSKUWmNWAA7Oqo2bZlfc5aKYeITmn5pCVbm?=
 =?us-ascii?Q?nEuJzTk45USYPzJO9tXwzrE4HF3FmuJJUUxsBC3HNTRY+S1Th+L0HVxiY3zg?=
 =?us-ascii?Q?yRol4UDTlrc8cx94LhALzBFeoug7d58jjKbvtas27jf0tQl+/Tx92y54PgN0?=
 =?us-ascii?Q?NPS2mqQmkESUbbC8tY9Qi6AY/xoPEBbCyQ6tu9NYj6obHkXFpUdsBW784S2W?=
 =?us-ascii?Q?g2LsIXdknexAbudAx0XCJai67gdQJNWQHU9g7HEz3NsaXi7r6+VMRH6xA9yI?=
 =?us-ascii?Q?VCQWwQ2JVelV3VFt1kSADC4SbIHKvRnMjoFbLQ84swWY/CN8n/SU6qMFWFk8?=
 =?us-ascii?Q?Vpks1tRfhnn7hpJsGcefOP0dQj7LKlYqsVJU7/4xwr4yukY08lpDArGtk/Z1?=
 =?us-ascii?Q?+RHwbmMBymuWIbWf0sXQX5QvgbWOAD8HpN5VpaPoeWE1ROclUh1QSRBUXLgM?=
 =?us-ascii?Q?Zs2QOoqBd13Y9a0QGXE32d+hzxei1p8JXJ6lLWUX2B8tLS0WF+53hEle6Jvn?=
 =?us-ascii?Q?qv/K5km9FpWR9foRU18boTdceSEW5h/1uBFbIvSIiNPUyf658XxCz4daPLei?=
 =?us-ascii?Q?FAWyZTG9Iwdu/p/Zjq6gb7ga/TdaMTDhM7wxXMMJEc4ichLN9psHHZ7k+HrP?=
 =?us-ascii?Q?oFfPpkHBhXWy7bpiuy5fyoO+HglCajGpbbfmDww0Ld6r/zi/9pEsJEHQKEtm?=
 =?us-ascii?Q?UmOLqz0OTwDvABT9Rp6YFKLhqBpu5DlQCzfgtTuBgw5wtzB60CGAF6GDf/oE?=
 =?us-ascii?Q?BVXkjY2FolhhD69CdhDTYrb8kVh4dlQ+QZeaEb6c8TrQcosNTefXh4G4jbXJ?=
 =?us-ascii?Q?ENVUV3oJgDEEK/10xzTPEPQCBINxfF7sMsG1aoIp8jWL0b3ZtbypFNcE3Rvc?=
 =?us-ascii?Q?R1wtgmTzqBCcJjKxPXDDr1wxq9deOhMbN6U0l6w/QHgartgEUv/QKMiTJePU?=
 =?us-ascii?Q?eIITPlQxkCnLDpKGpcO8fw2zpI36cwvBj3wo31OLnNS2RN+RqHThLbxFgfGv?=
 =?us-ascii?Q?mRnjVLW3cmClLxaSAwSQqrtV4KrkG3YxrOPE8mawjNB0A4m15+L7CO1QTicZ?=
 =?us-ascii?Q?3fXPebM98+tM0IBCXotaUM1hpMd8kovei8F1iQuHkQPkwA2d8aw9f8KB9Gog?=
 =?us-ascii?Q?0LUDumdme2GW8neRz3iTn0bL7L4CBf4DYXFUM6Xd/PgYpV/RvDIWLXKpOW0p?=
 =?us-ascii?Q?lZaIzdBRxmXFJqOEw/jKvl6ePG3/5pscGUl1QJPnESaNvtQS9NCJWF7GCtYS?=
 =?us-ascii?Q?4H3caAxAMZO6q+fJnra4koOc3NSD5iFCi0wvzd1V+IljArTdlD/H6mYqk0HA?=
 =?us-ascii?Q?X/2h3UAyjJBW3or8gpqTg1FS4NmOVt4UWGL4l3so46RtR97FKFTX5OJ6yjBa?=
 =?us-ascii?Q?3rPp2LjIPDoCddZKkGSIezdw2DavK/v1R8ue28F/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b253d6-b5cd-4c9d-cf35-08dbb813a64f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 06:51:14.0903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XydLHOBEFcd7WyOrsaqI4KzAuYRpqSU11oo0+Fr3LzazBN3I6vYrToFrbJvIWZrs2ohAppHsyV6fvFa8pJBicw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8377
X-Proofpoint-GUID: HorMX8z7VjDQH2YAnapdmgCIBAsaBpih
X-Proofpoint-ORIG-GUID: HorMX8z7VjDQH2YAnapdmgCIBAsaBpih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=794 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309180060
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Sep 2023 06:51:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8312

From: Chen Qi <Qi.Chen@windriver.com>

Fix textrel QA issue like below:

  ERROR: QA Issue: docker-compose: ELF binary /usr/lib/docker/cli-plugins/
         docker-compose has relocations in .text [textrel]

The problem could be fixed by adding -buildmode=pie, as this option has
already been in GOBUILDFLAGS except for mips and riscv32, let's make
use of GOBUILDFLAGS.

Also, make use of GO_EXTRA_LDFLAGS to hold our this recipe's specific ldflags.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/docker-compose/docker-compose_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index 274fb520..8c0ddccf 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -40,6 +40,8 @@ PACKAGECONFIG ?= ""
 
 include relocation.inc
 
+GOBUILDFLAGS:append = " -mod=vendor"
+GO_EXTRA_LDFLAGS = "-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV}"
 do_compile() {
     	cd ${S}/src/import
 
@@ -52,17 +54,14 @@ do_compile() {
 	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
-	export GOFLAGS="-mod=vendor -trimpath"
-
 	# our copied .go files are to be used for the build
 	ln -sf vendor.copy vendor
 	# inform go that we know what we are doing
 	cp ${WORKDIR}/modules.txt vendor/
 
-	GO_LDFLAGS="-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV}"
 	GO_BUILDTAGS=""
 	mkdir -p ./bin
-	${GO} build $GOFLAGS -tags "$GO_BUILDTAGS" -ldflags "$GO_LDFLAGS" -o ./bin/docker-compose ./cmd
+	${GO} build ${GOBUILDFLAGS} -tags "$GO_BUILDTAGS" -o ./bin/docker-compose ./cmd
 }
 
 do_install() {
-- 
2.40.0


