Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96171C43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 09:45:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.24796.1654854322712204229
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 02:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OCPiwKto;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31600aeb41=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25A9Y3Ff009195
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 09:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=aT612MWjJict+WCzN7NY4lyZZDS0QYcvbxgDLnPzNsc=;
 b=OCPiwKtoqCYOCHnDrEtAUrwsmb5pQkUnMT3mvC7cervc6i4s5Pz/ggGEXbrUXLNKA0Ns
 FPRFMUfVMJuI3Gcbek1Hk3keIbRVbDGYMy8q9Tw72Tb+B3jsEh7WaeM2IKcxoGT8fmFF
 wYt20WMCV58d8/oZTgD1Bl7P+/TQ3LXcjscg6MR6Qv9coS0K8Mx9qOv9o9KH4JOTOjte
 YYQUxReZaeVDlVF89ZGzdKLULbMFYonnk80b/iy8s7XkLnoyLsvMIyGhUNSpGYEVl84S
 x8rBJOjereDhwtfz9Cd3QWc4jNH8AB3zOnSMGd24mYBfWZqTW9qOcjknL14lRbYS8lXD qw==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gkuvb080g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 09:45:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeSVPopdLenc/XDbh2HQtRS0k//O/kUnAAsbLuEs/4yHaXJEQz21L3EFDoOhTLBi/8rbwtaBTuwcQKv/bzc4FInjV720ev/OoTmBpYan5WXiuRiaxq99RR2QS9eInbVZiAOyz+9KMEan7lN1DnfSsNY8BPwQ8DqDUqC2E5IqLL3ApCgx7/7Cb/urOfALCnRjJh77foNKZMywlgIxxTL/OEPr5QC6lxVbemZTtybk0Q/5UJjdsq6Hp1C7WTtX+TzOg14JXNLI7hcxINfmEI0nqmfNNJGPEz7yQyC42kpY2b6wAzJCJozH55BemTg1P2KsnrY0wHmujR5jRf/IykVrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aT612MWjJict+WCzN7NY4lyZZDS0QYcvbxgDLnPzNsc=;
 b=n+5In+tRYszrafS+tQ1vfaXXFIaiDQ2QphwUFrZ4azSdHtbHj8otLWCQz1CA+OH9kssYan/tSSWEPwH41oVhJfba5V9DF1amzkLSklgseG7H4BE+C7sKSUW1cgtXBXrF9aTlAbpmiWdimgw9ek1uQiuwz6GgUVY4aPpai8GZKFhA0f0GaeQxh3iqDL9d7vs/B3yJ/GEETnIgQriU07WN7oIWgL+WzhH/YjYUP8VLqWsaFDbU6D97xGz8AfkyXPN29homeekfCk6ohH2lvdo11fyzKL/iNFze2h53VV4Z0mfocA9GRK4TfVsK6nBiJLrCbLlLLibGpT+WsQM5AxOUSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY4PR11MB1365.namprd11.prod.outlook.com (2603:10b6:903:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 09:45:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.015; Fri, 10 Jun 2022
 09:45:19 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 3/5] riddler: adjust inherit and fix CGO
 settings
Date: Fri, 10 Jun 2022 02:45:05 -0700
Message-Id: <20220610094507.74342-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220610094507.74342-1-Qi.Chen@windriver.com>
References: <20220610094507.74342-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:a03:54::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84d4e0b1-f291-4e2c-3a33-08da4ac5ee27
X-MS-TrafficTypeDiagnostic: CY4PR11MB1365:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1365EF0970E7E62C8606B28BEDA69@CY4PR11MB1365.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UzCZqwSHEoamjdfNlaz3R0F14nrpyjzHTYTvQD0tpm8JWqGhndIXcwFvfQFR6ZcImjg57pF+tPkLqUZz2h+P65yUy5ebjl4gOnvU9MvfxokrACqZ7GuYbMlfJTvUCw988ADDcqDQG/YON4pau8fN+FZKZEntOXxgBnki2d5V8tJ/W07TgAqf8otY8LVRSQvozkGPXJ75gXRnTWgVscu+oQzsrdT42XNXS3AH/gU45X4Ton6A3/z5zOUyFWYvK1d9bqTL07HYytZuhldfrzEsPxy8dTeKg6Z3g9+SGjsPttPdnfZJFrEeshjr2EDzZailTSIRBMSA9nOVOsIVsKvwq5chRt5LOTl5hGRFVrLxD2rFmXRgdjagVCApQxY16zI+klW29Y+pNm3hqDXmVQgQJeaBhgPgKYjR0xmzcW+KzAAlci7L7fa9Jr7JxfrFTmTfZRrOTHM9F1lSr5PIwwBURB4c0Pi127ll319Hmv+ouV5DYUeNcfuUaFj7fEkzzzAIwUZnlmZOhjwxtXYnhJ1+DEQ8vmabxKSRwySDoZsvX/gj5lZLXiiJ5SiUDFKMKyZH1ypNJEnD1vZ+EHSlposEnVFfT1xovA5dfj657+6kKj507UvB1+NUZ0xGzaG2pnRedQJVHfVG/47Fn833rjrsVwe+UhT1iWqAsx3hZtOBABsezZyK9o9a8i4MVanP+vK4HYLTW+170QZZ1vV4oU/2aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(26005)(83380400001)(6512007)(5660300002)(508600001)(66946007)(66556008)(38350700002)(66476007)(38100700002)(8676002)(6916009)(1076003)(316002)(2616005)(186003)(52116002)(86362001)(8936002)(6486002)(6506007)(2906002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GnGUzvkPgGW9uqHveyNrD54oBMVEkc8gt4dJRkrNUx+cCWxS6BRnEEjRO3/A?=
 =?us-ascii?Q?GvnYdQwTM0qw18EVyEUWolUlbMF23yrT25/9/fGe8vSqW25HoMae4MlpwZ69?=
 =?us-ascii?Q?+yXjCO2SFgKtq8EiAURRrDB19vq90bZx+hoiWQuTgcpV2tUMfG2oT9nvgLcx?=
 =?us-ascii?Q?/7Zm7oAp3UkIcpKw2X3/vvBH4+fCGx7jJcPC+zUFYtdZHsA31yFwX0HQ8qsI?=
 =?us-ascii?Q?FE3ZhrV+EQ6BbPNMULOdVCWwybLywn6/IkNT9yuojGfNXfQWWDZ5XB63Y7HT?=
 =?us-ascii?Q?nCykKdxDSgQL9VoViMXioAnV6R+Uv/wOYVnD2Z6XlIalrwMsyVKqvEguFTfo?=
 =?us-ascii?Q?sZiwJ+WQ27HUIJJLKov98cIwfDPDbwJgDEfEq6ZN54U1SDEwmac2DoZSDAyh?=
 =?us-ascii?Q?FU5dLO86uxKc9ZKzMFG+O0fbVDMN2SEPi8+/sFUtMNJop5rCsr2mepNcugcC?=
 =?us-ascii?Q?xKBR3LQiL4yMSPs++lncQc5hyfC0ATzkruUlDq6pOx/DG6knquDde957F3X6?=
 =?us-ascii?Q?Uu1mDdmWz2Gjvwj7KvYuH6XVhu0XO6Js7BmhRIFUQYbsxUPsH38axjWe30j3?=
 =?us-ascii?Q?YH4SsmlG1CQe9c7jvH/tWdH2yEXslzypmriIOOMaEgOHrDFE66loxbc0Gsuu?=
 =?us-ascii?Q?MSSmcUCac7EWhMbF18hxVaRHz/Cm+SaH0B2bJEEczusFL7h3OxAO4dlWA8PQ?=
 =?us-ascii?Q?9+wD6rJCpfzr7pm4SSHRSe1dfV9/lBHrSdrSnMXZqabbPghQL69aEEH/1jHY?=
 =?us-ascii?Q?IErnmfzMGFwq8xqbCYDOtXyANAq2w+fU6TpiA8NupfRpsS99e7h0uU7eQ2Jc?=
 =?us-ascii?Q?h22W9vv1O8bk5jFK5XK6TGoeo8E4KwiuxLqVxhLSPcqdtExXoYWuW49eD2xS?=
 =?us-ascii?Q?tNcOCOqQA8vskA4GhXFLpwLTQLtpaKeBuq9YL6TuYhNeQUEVx5eps4aq6WXM?=
 =?us-ascii?Q?JkFr12nhBkJEZEVCcLf++bcjNxW4lbD7fJrhE2IOLmXRRh2FMppZ+dv0dDo2?=
 =?us-ascii?Q?+fy1u8Do+dXZIm4viJ4kl6T9eV58TC4du8GSGHluClioeKidlTwGs7VPxjOz?=
 =?us-ascii?Q?FzOBS/MGJtsAgOf/ApjNu9/tFO+NVQDnJ84wDAUt4nhNash2dkakImQZf9gY?=
 =?us-ascii?Q?iuMzWzxLWZMR2pv3ofvg4ucGoKkHYeVkdB4k9hHdwaVP+C575lz1H40GjJs8?=
 =?us-ascii?Q?txxpm7hWrP/dCoulLzoKrwG8zWbCmYkAn9SMMx/lI48zH2hFX1m7N/eI+Hvh?=
 =?us-ascii?Q?jp1cm+1YwBR7WoUqLNSu79gDOEnImikCCjgEpT1wI1acibY55TFIeygzqG7c?=
 =?us-ascii?Q?97TXeQ3AimTjb0DaI/NSQXMWAwXLAPUJ5s7kBkLqDSvK0VjjPfzoHHE70Y/w?=
 =?us-ascii?Q?ASSB0fYIMsk5dAHB1PiSfivBfIAYjmhZC27KuyeVn0TD3CvWPolzY35bBPrd?=
 =?us-ascii?Q?Ch6mSRraOpFGbsi+JIKM+ifnE7rCp/+4Lz7dfo4IrHG7D0LMxAN880BQAHFl?=
 =?us-ascii?Q?g8DTO02fUwoKib/r0aj2k/1/0jQTNJICfYDEYY/wCW1a0Hm5uu9B7R2z5IVC?=
 =?us-ascii?Q?VnWBFZvpjHiO02FSGwI/JcllWPcmcBiw26P1GnNWbrIE2rL0bvEm6RFplKr6?=
 =?us-ascii?Q?gf1BFa+IUWEXmNBRaNf9ieTuqneUe7fSbua/nyoYQHVnOM771agKN79cN2WU?=
 =?us-ascii?Q?693Ivw4ue11qnOeFiOxdlt+RgcHebqGufAiDk4WYOunIbV/z6U+P/n12cP/C?=
 =?us-ascii?Q?7UZ1eS1cidPyA72l77NKQGgYqmP+1X8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 84d4e0b1-f291-4e2c-3a33-08da4ac5ee27
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:45:19.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FPZu8HRGSy2DOh0zJdJfZ7U5j3PxxuoAqSxMcIHKpsfm3672bP5mJ2fc+95fvLD/NGfCP3ZkoXf3HTQT+uKKQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1365
X-Proofpoint-GUID: d0AmzUUgQeXB-ntxUrE5a2tkaatHCbtx
X-Proofpoint-ORIG-GUID: d0AmzUUgQeXB-ntxUrE5a2tkaatHCbtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=546 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206100035
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 09:45:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7363

go.bbclass already inherits goarch.bbclass.

The CGO_CFLAGS and CGO_LDFLAGS should use target flags as set in
oe-core's go.bbclass, not the SDK related ones.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/riddler/riddler_git.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-containers/riddler/riddler_git.bb b/recipes-containers/riddler/riddler_git.bb
index be751d6..d92e732 100644
--- a/recipes-containers/riddler/riddler_git.bb
+++ b/recipes-containers/riddler/riddler_git.bb
@@ -13,7 +13,6 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-inherit goarch
 inherit go
 
 # In addition to hosts go does not like, we do not build for mips.
@@ -25,8 +24,6 @@ COMPATIBLE_HOST:mipsarch = "null"
 EXTRA_OEMAKE="BUILDTAGS=''"
 
 do_compile() {
-	export GOARCH="${TARGET_GOARCH}"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 	# Setup vendor directory so that it can be used in GOPATH.
 	#
 	# Go looks in a src directory under any directory in GOPATH but riddler
@@ -44,8 +41,6 @@ do_compile() {
 	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export GO111MODULE=off
 
 	cd ${S}/src/import
-- 
2.36.0


