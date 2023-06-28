Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109D9EB64D9
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 03:30:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8126.1687922999276641916
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 20:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Boipiqbz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5543802a21=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35S3SYHN031144
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Jun 2023 20:29:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=vzPQpbC1XoqNYJlek3
	QYwAmErPo1yeScO4+GYaE0x0s=; b=BoipiqbzXQEyUftVEUhZm4snqlcMMsFgFo
	6s5njkonSNQmQKhyQp623EyHfN1593B7p5koVoxCwwVaMqrjSm9OSfBBAwzGYAjJ
	quotaEM4FF7FDhmPiTcZtq+v5rtsm1svLSzRqQlgSppUF9ES9DJFQUS4UZLMfQ+w
	cHtjFBOH6avDyg07J60kSVYM5TOU75Ko1NhITe7+6RzURdNJvfIt+d3qqw+x3C65
	E32c5PRWz18ihqGnUKCJ4vQyQhVsQd70KFykR99oQ1rxozIGAUpmzwfn+VXRLGKx
	cABo5cmpEjYtGlOpOnqWf2/1h44R5sHtzFradba1deys0moZ7WLA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb2p20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Jun 2023 20:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljD2NdNtB0/VrnhEnhl6jOHlBjriTR5m+kXg+uKJz3kjgSAyHMR6eRglQmWuU5czJg2phEXceF3UYBVv7jOnwyQqs0qkE6v7eCFM9D0GUfEUgRWAck5iuPWlDKjYo3EJ18WBI8Xjj/kEgpy2JSTFZdE3Fse6sWBdQ8vUz4eW9JJ2Dz/uEVd2WKz0kObwhgeCJ6jjTXf/6Zwj4nlqpW+z03P7cH1YTRkxLmCw2mBF9PsACQe7lyFF5Kqk8sGAUc84q0KGfZPH2lLvDt0CBu0RT2oOEX+kHU0yUIhPt/JD0BPw6ViTRjLhZ/JMunAbG2xaIvFE3uJN84F23rxkFXb9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzPQpbC1XoqNYJlek3QYwAmErPo1yeScO4+GYaE0x0s=;
 b=J46MrcGbzIj0C4UH9Pabh3A2fWeu0lcb8MyzJOVjbXxjGOMJ3rXDjM6x2zm90jgpVyQqqMj4nq514ojsJ2rrln4N14edeST5grfGPyhNGfx9tGWkEvNpjphakIPm/IItDqxmI0sjLMGm78tqo9eLM2JDRxh74+mhWW935N9B3DO0fY3Jd078M5Vp+UmxrKKAhlV0gJa0Ns/Sgpt8mV+4kItW2ECQdqUD0fmvTs0aGjShhQj6bLMAb54mbGpsrYgBJrIJ62nGDShtUVNXci88L1O7Lzte5cigHzhwbi2WlGN3QlJAU9em0xNnql1UnaSNBIMlndpqPwKftW3hjJQdwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB7184.namprd11.prod.outlook.com (2603:10b6:8:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 03:29:55 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6544.012; Wed, 28 Jun 2023
 03:29:55 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] kubernetes: do not strip binaries at build
Date: Wed, 28 Jun 2023 11:29:36 +0800
Message-Id: <20230628032936.3257233-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0071.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5506d246-62db-4041-b609-08db7787f13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CqLaLv7S+dturkid/X9JwbiBLD+sfFqgxSMN/+WuR8obA3DmXDOuu6Mrku5xobpmnkvzAprRn+8lixwXWLS0KH2IlXQqXPQb9LLUgKKsVKtDLMgY/KHU03jXU8hMjQhFldylNmpMpgKCPmd6yhLeUxCUopQoTASRNM/mZlQ3kOBY7QS9dKbym3FXGNaupJITSlaSpW+DwPmxh0dFDqWdAe3JsM6D4+SDvPUGLP9GbQGltpmdhOZhawKy403Rh7q93wPamsBymTy/JM3osyMZTit3P9MR/oM1WwJCbeAhfLbMgeNTNPAUAtYhLLiNR3FjFc9LhJ2GSbnmSWgub4wifhL4m2hUhjRRlMm0UvkkA9JDWPvLsT9ONe/Gg160lY9oYu0O03cLeFoKzl6pHYHl/YziJOXcM1M8KTolt3vXsnzG++gGAlNr7w0bzQRs4+ynuGg4Vib7+F1CTnqYFYeA6j+1MUyWfDZe521Bf7Qhbo668A+7kKlh+J4RdfxtpxK626Mq9eV7v18YxExsDIlYpz4zlaVntABRCDqGALQHgIX6EuSQvCo6JP34QLMsDMWuKBhAMdeOkeefYA1jCRdJk92JhO5UHoR4JssHF5tri09j51m22LcrzEqrdho3zWzo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(451199021)(38350700002)(38100700002)(36756003)(83380400001)(86362001)(2616005)(6486002)(52116002)(6666004)(41300700001)(66556008)(66946007)(316002)(66476007)(8676002)(1076003)(6916009)(26005)(9686003)(6512007)(186003)(6506007)(8936002)(2906002)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t2/Cs79Pz4LexgxHio8wUk4NlIWCe09Z31SOl3LdL/OJwoEXtYkpOdG8vFlw?=
 =?us-ascii?Q?qLO6mzoqSMcCW97mbyQfmrAY1yiUlpeto/x8b2rnwxlM8A1Yoc/L3H5wnI/R?=
 =?us-ascii?Q?R4QtfLvPLHhwDqA//Jy5RGgsVbX6OGooPcEhAk+ENW6OSnhBp750/P1Oe1JE?=
 =?us-ascii?Q?hADGY/jl8bnxnTKvByptmjeS1G5jIUerA9lY5ZKtCVNwGFJwyhhVJaKp4naQ?=
 =?us-ascii?Q?BjRcCEIaeRTJEvbCOuzpc7/e4nJyH2g+si+losYjCOtSGkdV9DYwQQp4icDo?=
 =?us-ascii?Q?Ftsi1rE6N4/ynfEDqTptSak9dHLtDcUx/F4FkxVC/tDvSvJmmr42AEHoWi4Q?=
 =?us-ascii?Q?EfZlqzvpJ9X+TjI3zapAkY7Wq6hofT1SFjCuyqaRf4rapdW7ZKVpwp7I4cis?=
 =?us-ascii?Q?0p1v19Rl225odFGcVfHMb2z+/kIVWl3QVtcwntThJifI9k5/Pvf+08V0Q5Dl?=
 =?us-ascii?Q?3wnwozU99KSjeoEOUdZcbK7v5WynhPkoWz7sWYGfkZ6tpFuAvRoqXXnAXgSS?=
 =?us-ascii?Q?a2coOdkbjkUO9Q+WCQsIGGUFaE66Aa1cTg1qa+IV6kLKOBNg+xGVmytURHZX?=
 =?us-ascii?Q?jtB7hb9wKxWANm/1sVSugd0B/PQ+RHgSlzPcTJ9wphXh3s5AuZeNyMd117b/?=
 =?us-ascii?Q?Pdl4BYRECsn9rhGCO7QkXYSHxK9pFrq1GXWsHOvMbsYziflyLd8DO4EO84aG?=
 =?us-ascii?Q?Z5iZYyc+1gt1oxPCPFt7kN98dsN+AR0B9iKgY0C2JtMSJJRX7F690Y95AD6h?=
 =?us-ascii?Q?qHupOSqwDYeEnW/KKaGlmvdl0bm9dTPgwTiCJ7xOcW0P4c/D5+Jr25jfZm+d?=
 =?us-ascii?Q?JDh0KZ3V/R0u42uXtoiF/Wh0ufP8or2uSjslvzdQ//GAfJLjPIjjZtHyaqZE?=
 =?us-ascii?Q?c6zyJQm3l7pN+pRKW0qpvmhlscYsU/PqlEES0mFPclMmzMhdEErD+IvE3D5g?=
 =?us-ascii?Q?y3JhfqiB41eXe71rAohGurIL990N5BQ9jLDkuzNHv/qweSGNUUrtD45PRJe+?=
 =?us-ascii?Q?q3WP0fDoPyh/nDIBm+24j2ujWaliVoECC9UWLCR5zUHLuemF/7YUrr3VkBz3?=
 =?us-ascii?Q?OyXj5MJ54xGikCc9CTp3h/ypLF3u2o8cYdQJXUbpL7sxLj+NKOBBkTplOINv?=
 =?us-ascii?Q?fjPeYeWdk9a7LdH6SnrumtH6iSE8JnB05mmBM8BWB5Wr0fRm8B40AuRnxfsg?=
 =?us-ascii?Q?EdQkL/wkNsXCmeMHcr16GnC1Aqv8ijqJjcVg7K4KVKWs8MxPjw4C6x62FVkj?=
 =?us-ascii?Q?lDTqCaq0xSQY+sYnop3tVRMh0jKlS2cIk9/YinzNEGBttpN2WS26ud8eikHQ?=
 =?us-ascii?Q?W3EL3ovqsYJ9Ql1n7W/FpoST3H3uxvmhazjMiMqMei9RMUkwvnmVq0MXrbIu?=
 =?us-ascii?Q?GUV4C61XnxvAYWlp8D3LLGKBsXUlPLkajR6bHKL4DI+YIYeTWR6RNlGR/yPY?=
 =?us-ascii?Q?HXeKqwmvwFrzFGvq9FaHIvvD6k3OTxXadLF/9gRtDu8FxUmRuLNnv+CWEuuE?=
 =?us-ascii?Q?clSvTre6PhxCzXfO3443QJddDtZvG0ddpl50zrzo4uU/LZ2lGykybxyNl7iK?=
 =?us-ascii?Q?5bzgsXXv1WF0D01iX9Ofi9vj5j5R/C+H/umpO2E/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5506d246-62db-4041-b609-08db7787f13e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 03:29:55.6957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOEQ0VTFAs+uGsGs9m+Ry99no09qA1N2ydlwmkiDO+nR8q9Q7QXE8n1FQ276dSiYE7bz1UZ5cVTlczeaWAOisA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7184
X-Proofpoint-GUID: GJPrrGpfjSSfJzXEJPi9wDMRodNGaELs
X-Proofpoint-ORIG-GUID: GJPrrGpfjSSfJzXEJPi9wDMRodNGaELs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_16,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=527 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306280031
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Jun 2023 03:30:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8113

From: Chen Qi <Qi.Chen@windriver.com>

Yocto/OE has its own way to control binary stripping. So don't do
it in the go build process. Otherwise, we'll get empty dbg packages.

Setting DBG=1 solves this problem, as stated in comments in the Makefile.
"""
  # Note: Specify DBG=1 for building unstripped binaries, which allows you to use code debugging
  # tools like delve. When DBG is unspecified, it defaults to "-s -w" which strips debug
  # information.
"""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 3a6e711..8b7c9e0 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -87,7 +87,7 @@ do_compile() {
 	export GOBIN=""
 
 	# to limit what is built, use 'WHAT', i.e. make WHAT=cmd/kubelet
-	make cross CGO_FLAGS=${CGO_FLAGS} GO=${GO} KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH} GOLDFLAGS=""
+	make cross CGO_FLAGS=${CGO_FLAGS} GO=${GO} KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH} GOLDFLAGS="" DBG=1
 }
 
 do_install() {
-- 
2.34.1


