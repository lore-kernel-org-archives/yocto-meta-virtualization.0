Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F971C5B559
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 02:22:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6879.1749003716684282573
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Jun 2025 19:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82504e28f8=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553NH8PP024891
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 4 Jun 2025 02:21:55 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t1t75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Jun 2025 02:21:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeGCLS6hPpjR0rq4KaVIQQqjoyuYRwzgjZKvtkfR3FipT+EgpXmx4tnQ9J97fK0EaAfxm9ykttdAhSc7JnjFUClW5AeWf0snXChI9lKDNG9Tkhh90Ak4EMdLVIDQ3vzxanGh3xJ3FH2w2tL974kXyNWqUfX76SNXMfPhmEIijMqRk2oBFZ5k2uWC6uH7jt736wbIheGjvNSWPfc/h744RFwC9l/KQHBwq+CrK1EDAExY5p8qt7IixldYOGj+LTq+dxwXQBu4VstF1KNpG0RiA+lWJUiAQBczk/ytOad2FvQso3GQgZHCeGVZWxoOsTQFMRMyprMoIg9UpGtmZQ+IQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKCo3qRLm7y/v5wtIVjPWuCyD39TiqdwtaprHR/jM+o=;
 b=A3jtMOC6wlznpt9FGc1WyGgPxKessRJ0MJsQnemh3VBrkgV2MhyQ0YXx1j21bv5ioSfFb17SXDpcPewDPPsZ5CvQ1mWqeQWdCbZkAvW9+5y31t+x8F0bt533RWdwm7N3GOVFk978kHKzvlSLOl0Q6ZSEBj3ms62XW6yN2Pco7g+/y5Vtx42WiBPAtOdHrjAWxIg7lvDg3ccaZIqhBKftsaB9q9uJF5XTIHAE8nlIdrttfwW8CqpGWNoGSjsFt6uv0AOPZRno6aWOpW+k/ovUrz8ZqjWH4Fc/nmcfcIlfBc+mQNEboYZidIAxYZd/0EEDqDKWAR5pGcTcJfg4pWrdYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7939.namprd11.prod.outlook.com (2603:10b6:610:131::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 02:21:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%3]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 02:21:53 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][walnascar][PATCH] yq_git: add back apply=no for SRC_URI diff
Date: Wed,  4 Jun 2025 10:21:36 +0800
Message-Id: <20250604022136.2193000-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:404:28::31) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e4bfe3-e580-4750-e9ae-08dda30e91e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XEFw8o0bkjeIUYRo0it20YpwV+zKl/K7bOaOsywL22VwcbwSRpNB9VJgYEQ6?=
 =?us-ascii?Q?tabW/rjBG5J5rvoHQ0AylnRar3MEkSJWqmKhEZz+tf+dxQei1L6XVrOV+vBi?=
 =?us-ascii?Q?1X2viIlImhX/y28vLJ2p7NnzvTY2k7s+Gyo7Fz9Ry320+pNiteCNisiOzTze?=
 =?us-ascii?Q?k0FGe4u5/ZCixCJuDopkVQDp6K53lDHlBFps94ftXXeKpCmeBAIe/H+5gGwN?=
 =?us-ascii?Q?strj2DnwPO8FjsxrdYx38MMnlZvBvvZ4IOzj+QP9JnFOHMD8YhSymfIB6ogX?=
 =?us-ascii?Q?ZvOoeSJuvM5Ms8JA1srv2/7DaOrWO4gH7+2xnwYfE4jzUPZ8tuYvV9LDoOTH?=
 =?us-ascii?Q?wQxk/h/ckXOxlPrW7eJ/2Ua3qGybyuitw5KuQwNrt17fDPuqfDuynb0dup9G?=
 =?us-ascii?Q?Dw0aaerqgWusO1eR6QbBXrw6FkYpkq506XkYi7x0UjXVCnr3gFjFczZJuqQM?=
 =?us-ascii?Q?RH0tTJo/utujnKq2QoJCEFkHMGXTXWdH2bkDvhxxXZ+J6UWAdDkHyfe+34NB?=
 =?us-ascii?Q?lobrIhBUhF2628o3byK5AdwVQ/nPefpS6Ps4DBeD2oLi9Z14RkDfaZ8vip9x?=
 =?us-ascii?Q?GoVjMYbvFjAarAAgP4rJbXVXDjtLmsn3shdzK747Ff/yhSxSHy7YFpBdDyW8?=
 =?us-ascii?Q?anVIRJqUH6bGGR2Xk5YrcHvlmN4gsKhC/tQxHi2J8+CGLz/8XN3kaatjAA1G?=
 =?us-ascii?Q?is/pxkxffNhTwqGdn7moJOv8jLWbgMTNEF28psvvqYqOSriY8LY3bPnV1Ebs?=
 =?us-ascii?Q?k713Ij1n9xYgb1rlrbYG9dGrr52hm5vR2xzHrG19/rY4BJM3LlAhsgF2rFef?=
 =?us-ascii?Q?/RHJpu5FFFKsNrhHJxwC/ke10KumHZogEg16gjM1f75TXXvtjpA8mPfzOd9t?=
 =?us-ascii?Q?NKZs2hcgJg5ORXKrVpAzCnraHwqDYab4u+EsHrA+rWoPVzKeYdH7j9VCHfEQ?=
 =?us-ascii?Q?/lKwCnVh9UEzIzIhW4vMHFKcqD7aqLt+5/cFYFOYVQku6+enCiykEoEp/Uj9?=
 =?us-ascii?Q?9tmyBP+gzxyWHNSULaJRHARsyP+YwevNZjPRIrO7l9+nOHLALwRDJc0TS5/a?=
 =?us-ascii?Q?ijPFBCd3itpUh1PpK0/CAUid5LhRoOK1U1YOEuvXgJCi4ZRKAT/SvT5cCSH5?=
 =?us-ascii?Q?paI+M9u8iC6H4pe7BOPlyQOtBaQGDfwv22KGB2kYvZ05yNk1q5p9Mb7AhWfQ?=
 =?us-ascii?Q?YQqKT1IqvJTgTyZjyjcw2T+PSoDs4xy7IihujvLhcbDZxzv2y3I1/VFQdb4h?=
 =?us-ascii?Q?IHXYKOCi0no7I1HW1DzXhKjAu1CV+On9dose9AkhgeYp5KV6T0A7t32/CZr1?=
 =?us-ascii?Q?awwwY8QgIEucB6/6EPaWLcQ6Lz8nJPHqi5rslnSivw5+Hm6r69qyc2Yu00EK?=
 =?us-ascii?Q?vTDgwKPQMt1m6vTlgcWfBPw5bXbhH9cBo/Sv/cXneXFS6QbeznvB3/lmgGLr?=
 =?us-ascii?Q?NvkBASYiQHI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NtOxM0Oc1MbMTHX3tlmxJqVZQ68X2WbDJGZXuFJ7q2oLeQ3LBGCnnp5kn4a/?=
 =?us-ascii?Q?HhhqtePIsc2SDPgBA7dx3SHCcmVc71WieRU1Q0YLU5ZaCXqm2Z8jQyWYQHrd?=
 =?us-ascii?Q?B9FI51loZEUXl1fezud3YevkLJgCm47z4hZMUWzxY3qWyyNLF0rNj61cImSn?=
 =?us-ascii?Q?3ZrdTRnw0g9l+ANKl3PnZ39elbGBrY88/OIR7nYXd3Xe8Hg63WCklQxS6iUI?=
 =?us-ascii?Q?4hG5mEQUxxls++vsFBQzc4uy4QI05RJgV75QpQlYZyFYc/DQSkLTH2/JEkOd?=
 =?us-ascii?Q?xqkgI9a/hg1pH12FIK3hoK6JkO89PhkahnDp/WMbvYU1dXT0UuiT+fwnjICN?=
 =?us-ascii?Q?daQMRXD89EkjKJm/kt1VUfe9d7aBYcAqxGUQIrKPyRreixRy8ReNANSHfa4l?=
 =?us-ascii?Q?uos+gcT9aGsP15UCp/NtHi083rNRPx8e4BoqTGR6+d2vZefvVjlqXnmsMdMl?=
 =?us-ascii?Q?pf2iMxbRHAjEFaf+DkE40xdzIOF9m36gyD/v30eLo5kAMRvVutwtWJSzkO1b?=
 =?us-ascii?Q?tRNldCvfmpxkeoJLd76in9Tul2g9yEI23vywzV1HUUShm9HVucx9gFoizA8P?=
 =?us-ascii?Q?tECvGguFJG+L3tVjajD7g3Y3OHUS7lGRew2IF+vaDTmd/nJBYKHUuCIN4oev?=
 =?us-ascii?Q?PGQpfyJ9n9rvkoOm+avv/janfnSV21l7F09P5RAlLET9GVL56OdmasyIXz0n?=
 =?us-ascii?Q?maSehA2I9o84JFtR8/0Pe1ezy+3TbWcj8yZSk0sQsHlVh0cEmoPhZ+EYqtLj?=
 =?us-ascii?Q?8akfdtu/U88aJUNaQ+Eql7Xqt56AJU9lVV9WHLPtvDJ7/GZ2d4j1dFzsKMxr?=
 =?us-ascii?Q?JmisNNy6nVteDhsnmmxwCBBcTO3mTsiw8WCx3d8L28w4aEDpdoQRjLoGl/CX?=
 =?us-ascii?Q?9E+zRym7TnZ+b88J28gBUB5azznUvx38IRf6cRX7HnAQKlrHl4ShJpXmA/yT?=
 =?us-ascii?Q?7lEid6GGebv78i603bJDpFY4TAkAfW7mB1twXE3oKcGGKEw//4xzly9HATGX?=
 =?us-ascii?Q?ZpIbr6OJwFgJq9SJ+jwDCLVL0qv1st0YG1WyhjSvPer92esPvmgue5kcI2MB?=
 =?us-ascii?Q?4tWT0kbNMdFy8LphUlsk2C6nSnCPnDwabwYz2c9t4oROSqgKWSgzDUly65zO?=
 =?us-ascii?Q?n7fKy3nzunTBdcYIUNQVDXf53AwMUXGNtZYoVdQP5lrc88gEa6ARo/cY35GF?=
 =?us-ascii?Q?qIjXT6SEnmNDeWbSNKnAWcXy9LgsMkJEL6aqCbPzfxOr1d0alzrW3VIy7zb5?=
 =?us-ascii?Q?skrffirkbPUy+ntfisEPGQMnFjpHXfNz8lb1ltfEGk8NVke21K/gnkbZnbhO?=
 =?us-ascii?Q?zaL7bBdjpECfgBMs0/G8mY431TXdsyX0Nl+tVSNDtFNyLnsa8m8gMuJPTnWN?=
 =?us-ascii?Q?rCsgWlZKAeo/tSeGPvBgpcLekHC+s6E75SO6s9YxJKnvQQfPlG9jx/8e8TiB?=
 =?us-ascii?Q?EBvxXx68b485q5Njkixp2ZGqoEoi1spieKDEDle9/6Y212cBIqLHTWTlIUPL?=
 =?us-ascii?Q?MAjo1w50GENzuTtvdGUv/8RngwzdVO9g79acmGECLajLrc3jA1aMkwwpT8eB?=
 =?us-ascii?Q?EFY3z0HDJPMcAXeRyiiqxSH7rrPQRppVpa/Rk6ou?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e4bfe3-e580-4750-e9ae-08dda30e91e1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:21:53.0630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rfhvqERcPFv0EgdSOjjk5leVoaJbH2gTlZNk+5Z6NuuVVT6ihj5D3wjYc1PPXzmFaR5zA4syrBj5TOWjlQjhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7939
X-Proofpoint-ORIG-GUID: zT_3HoLvfV2kEwQLmYAh2Bbw9RRFkoKR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDAxNyBTYWx0ZWRfX7JZ00HKR0zEq jCJm1L+a0Mjw4x1LA1AXJaLprrvSFCKkuc3fIEcHhnr+Cfhyr84Q7hDp+Ul5ztZN7hASNP9G4pj Tcp/Je305MCT7rrsOJqC3mCEsyDG0wS3ipCuj8qSr6HwTsrVJhGYH46rLW2p0ovPoCXiOAaTDJ8
 fbO11CLqFwxiU3tekECWQM2W1sjpL3QbUtv9eGiLjL/vy7NPeLGpx+abdLzx0Pw/bDKK2NQtu0S 0gqOw+u/5sCzOI2DD9E1xNOVMaH7jjnro3EZOk/IO7fDPsLJXkNQxE8QPb6RCMl8RoYbrb3AsY7 HSp5esrOMdV5tljO728Xqmlbx0kqLrZ7/6HxkbeH4LVR+HZ7OQa5UXYTqZ0bvcVf1HR+gIe39Ff
 gI65x6mPweYks3IuXRftKi58KM+kXpULPjywBS8KBVhh/l4d6sJY4+2b7IO9vXKwoQNn9w9E
X-Proofpoint-GUID: zT_3HoLvfV2kEwQLmYAh2Bbw9RRFkoKR
X-Authority-Analysis: v=2.4 cv=Q4DS452a c=1 sm=1 tr=0 ts=683fadc3 cx=c_pps a=03yO52JTp2ka5dcFpzYbVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=MkUnBrgfyNUA:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Oh2cFVv5AAAA:8 a=pM9yUfARAAAA:8 a=NEAV23lmAAAA:8 a=Bd_7TLHmb3NPOQopuMIA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=7KeoIwV6GZqOttXkcoxL:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=882
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040017
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Jun 2025 02:22:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9268

From: Chen Qi <Qi.Chen@windriver.com>

This apply=no was dropped during last upgrade. This causes
do_patch error when using git shallow tarball.

The original patch that added apply=no is:
https://lists.yoctoproject.org/g/meta-virtualization/message/8804

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-devtools/yq/yq_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 9682ec95..b1700bd2 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -25,7 +25,7 @@ SRCREV_text = "566b44fc931e2542778a18423c655ce99b4f1402"
 SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/golang.org/x/text"
 
 SRCREV_diff = "20ebb0f2a09e612109b224b32f79370409108bcc"
-SRC_URI += "git://github.com/pkg/diff;name=diff;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/pkg/diff"
+SRC_URI += "git://github.com/pkg/diff;name=diff;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/pkg/diff;apply=no"
 
 SRCREV_color = "1c8d8706604ee5fb9a464e5097ba113101828a75"
 SRC_URI += "git://github.com/fatih/color;name=color;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/fatih/color"
-- 
2.34.1


