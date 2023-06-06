Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C81C7EE43
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 07:43:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3433.1686037407801976780
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 00:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=X83AyGhN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5521525cda=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3565gWuW024481
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 6 Jun 2023 07:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=meNYWUt7C4npsCEBEBRuPhLPVHLLOXkf2nmc+hjQ87E=;
 b=X83AyGhNu3eB1eJxB8A+t9YnzchDZb6couA88XWIvFsnEmXFBH6aqfZufGiJMAj5fuR/
 GyMegVfa7dA7tsGZjdZ4eFvcOwx1guRpkWELSnSnJ8IhtBIeHpMv1g6eGeth1D+UkAkO
 XBC2r+POjos0hxIZLgFMyDjdNHao5Cgx4BsmbA+vLhgk+8Monc1u5jHq/locd8zjCQr+
 wj6Qsot9QyL18XfCLfsdq79+TvWDcvv/EPTd7VbdenfglKytZ9GVDwZv3HWpvhG5Ky6j
 8dDDYvvU6P+/MKSgp/IDomZsBgVAPROLMX3/PCx0iXUTJuZhdo1jS37FjgE3FSFQvOAP nA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8j8hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 07:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5Q4bn8t0yW85+G7fbc5etJruCW90fCtKahN22PYCv7ze3M4h9t7EChAOTIl7F/b+PyJwodp1Uqe/s7GH2W1GkBIPiyswN98PWIvo4JyKN3Ry6zimgikA/m8M5v/GP4swk5DSy1AOXnYN6PH/ookYDwdBDCXrqpUm8eC1drvpWUHbIqOnkNwyLz/nXFBn3E4W70mb3cDyrVGjVHCcVBdGUAiqLHMPfen+pOMWHrKn+KlR0tQR1InAD0r9mSYDEk7bzOBRLzkOTWEd7w9Qrr76h5ZlYl/akkRlH7obLke0S7FY5CEHay5a8viR4uRA4vEzni2TjX4vysajvalk+srLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meNYWUt7C4npsCEBEBRuPhLPVHLLOXkf2nmc+hjQ87E=;
 b=bMC1uXqfTWV8MTeCM33oeYcvECLkeenxfco26LPJQxWs8Q/SimoiRgxO/qRy5Ysb/PVxh8lOkwRvd6w/BQqff8jYmSsyKmnPb3FQveUzh22s3nn3ym9eNzA0NLaGG+EX1M+N5vKXB9Q+kxfLP2V/l31Vbr92ngQ1wqqNJFN6QgHLUwvicttvYSlyViR60yekkD+mhLUdAVnPtBVXgkJlKAnPrwyVCFKapyOK9HAqVx9JKI3Szlf8hrdQ4ZU27UYlWg0S0NxCFTuHx0cBzhmb02FV+b3DzdqLoFcVN7Mcj1RuDhezdHoeZZjwvJ5re5RthO5wAM/W3d41Wj8stA+z5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 07:43:23 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 07:43:23 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/2] layer.conf: use docker-moby as preferred provider
Date: Tue,  6 Jun 2023 00:43:11 -0700
Message-Id: <20230606074311.2269186-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230606074311.2269186-1-Qi.Chen@windriver.com>
References: <20230606074311.2269186-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0131.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab5679d-03bb-4924-502e-08db6661b48c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N5YAgAezAU+HqEAv5MENd4RfbFapw6DyAiDT/FRYyaZdeHrQ9TbfP0nk751lWuXkZXyWcTz41UM9+MDywYYKzmAp7lX3Z5SFDweeki+zuahCq+14dCCMuHCcZ4kACKGUVVLDff/+MtUf1178Gq5bLM+CF9JQ87EW2UtYVM/+OIMxiRAHSTOzQodTuOYLs2MK9bkwwIwn9ROuRaQtVyu6Vdv73PTxvHC7pYRPlOL0Tsy2QjLOGuHddyaP1og9T2oY9QSj4suxD9ZhzlaxdghLsV6rvnyZH8gAG/pwsoTT95rKsp05ykr/u4+hSyNYWXzHFBHA8/hLyLlRVBINQR9ALSpszMxsQTnD7R/XtwH0HyHUeCR9aFldcZRmRAvep4B0nk232JeWqhmaOkXa8SUCEl3DKPW9kXw942e30qkN8Vj0digLzwlPzdp+M0eugCuBcOnEbxc65DONBZ0pbt0Qns3nkz66JaLhF8cHIrnvuV/iKLf4VSTm8Uxhoo7C+5tGCpAGrxcCOL9fIM2TqSc05zzd4cOwOtjfngWmzKTXcKYJCC55KFLpdfLT93BkQXtL4jgpqpQaUnAhEGloLSqZ33wMGbgMr0w111zJBwQ0/vpRzRMYGs+WlalpHJoWC30A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39850400004)(376002)(366004)(451199021)(6512007)(9686003)(1076003)(6506007)(26005)(36756003)(83380400001)(86362001)(38350700002)(38100700002)(186003)(2616005)(41300700001)(2906002)(478600001)(66946007)(66476007)(8676002)(8936002)(6916009)(4744005)(316002)(5660300002)(6486002)(52116002)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/zUsQUx2q6HdqdL5mqlRAS8OReW1nhy8fIABCHBRZKgYyWhy39OHHAupcEf4?=
 =?us-ascii?Q?9bPXgxsKVfxodqgH6wHu3VSNVixr4YNCT7OSqBpv1IK1SafKMtXPyBsemyce?=
 =?us-ascii?Q?10BVC6f0an66dkGUv8eGk0HJrmrmQeZLR+2nLm2xN4m7ezt3nwik4HLu8aFF?=
 =?us-ascii?Q?f9n7tOqby2TY9zbQLYiKShyR3m9eaHbiU+OY2lk1+eiAy2BaCYXIV9gpOgfV?=
 =?us-ascii?Q?4uokxYfL5Lwx5K634SB5AIn/AQ2JquKRjvQTDgKdlu5BF92SectASQFz5Cjv?=
 =?us-ascii?Q?bRLnhLBKHgHHP6jLk6AcmyiFGmzF209MMEVMOyzcVBTjnx4d3lJbsseVzgNc?=
 =?us-ascii?Q?mYtWVC1lrEd5sIx3zDJHGLJElDMkoerZdoZupJxA2HfAfmtwk///c0/1vjGv?=
 =?us-ascii?Q?di/8rwEpIQe2PKlLCa3qBAXffKYUA2LXSNwzjej/sB27xh8OyiNTGecv3Cve?=
 =?us-ascii?Q?oUwqkcMtocOuQfL9M4ZIM5qblOHYlYXttrY3QycIMjWvAYPjPjaFbWHeAtt4?=
 =?us-ascii?Q?O63hmOVTpukoLDnFAvAXDs5ivtKZ25J9qt+gihYpSsTMSrX04DHE5zpNTusd?=
 =?us-ascii?Q?Cco0RVb9HV2HsNsggw/jxeJeRDDV20IMyO1debL7W34plHWUxZ8RpvyQXHWP?=
 =?us-ascii?Q?Ls/ApusVghuCLh4WFUBp529drLeteMQ9Dvm2vK3O7EBGPCvIdnW0uEMcmJju?=
 =?us-ascii?Q?pO92eATMkQbXM50eG3DwSKOKVUunD6pIzo9ny1az3MrOYZbnCihqQVX3X21w?=
 =?us-ascii?Q?iSuwmulphUCDGrH+XzDio4SLIdYtZ7gPZ2uIq8ulVRJHLP+sIVCCCCdUZiHt?=
 =?us-ascii?Q?m9TXvBS12FELmQ13DuDLcuM65E0ba+2zvpljwb7wJnAND/tRJP0nrBQWb7fn?=
 =?us-ascii?Q?vydgPT9ySdw27q8Q7M6Sfu7vEKw8Pp2l8t7P5jf1JyWfGZ0aYe2/HiLImWOu?=
 =?us-ascii?Q?Fv5rw4WbKeDH4DKyzE0bsKPCp9DAlp2wOEVQYbwlXH+7+ApfJIOSiCKACevQ?=
 =?us-ascii?Q?54CgN5BBzdFHtimczL4f5O4Wc6d2ESM+w9Bmg54056HQHtdSUgGGXQkRv/mz?=
 =?us-ascii?Q?+qHZnLNIm2nHBWhsPY8Y4IwSHogTQoNJaQnzEORVm5oC981eJoMg3RUq7JjL?=
 =?us-ascii?Q?X5zE0h1erAnwMtbhB3S5l/LPufHNo04IXadSNkKdFGH33I3TnJKUw7BOwfJN?=
 =?us-ascii?Q?tLh1sDhP/6Vb7Qk9FPRq81dzMitnJ5vM6YDjX6KKql8v40O3CmxZ7MHjlKOG?=
 =?us-ascii?Q?gMd17vcsB/wnBuHxhaW83Q0+u/zrOI9clORWf3u6hp8Rc1VrYrrkDMxrc96G?=
 =?us-ascii?Q?OVeoCusYYkmpj5Id16ZPxVLV5ntEAdKFpLVDssEmwYTElN/XsSMIjFMAgxwO?=
 =?us-ascii?Q?RLcO8sWXQIAGLM+PNpgHxRWMhSW5ctju9CsL5aiVF+u6+dl3KOaIeaTnORf4?=
 =?us-ascii?Q?gXQgstqM/VOmbpQGHYkCYsAkF2VLoDHP6W4Ff1kYp5eXTSRF+DlYXBOOVZVV?=
 =?us-ascii?Q?GD+DGV1X5h3q4x2HE0LmFYLZvoInDxrniaWS05czRGO1ys9uP1hjtoFAlOM4?=
 =?us-ascii?Q?ebgiaUkvSVh/Hr741Qo5C0Y1tcedJKjuWT0GyxATuEhC8aH8yki/xppEXYHs?=
 =?us-ascii?Q?Vw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab5679d-03bb-4924-502e-08db6661b48c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 07:43:23.2151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5SLC23CtFjWYEmO8RxbZ8v0aPmT4pg3CzLNxGbBOy+RUNKCY4NOapCMu+lCtS1G3KcR3NcMCoQdJ2tNUuikUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7856
X-Proofpoint-ORIG-GUID: PAjieSxKRCvoFt1PcnHSPQHlox3KtGDc
X-Proofpoint-GUID: PAjieSxKRCvoFt1PcnHSPQHlox3KtGDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_04,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=769
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306060066
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 07:43:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8090

From: Chen Qi <Qi.Chen@windriver.com>

docker-ce has been deprecated, so switch to docker-moby as
the preferred provider.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 88ac3905..9ff61f12 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -41,7 +41,7 @@ require conf/distro/include/virt_security_flags.inc
 
 PREFERRED_PROVIDER_virtual/runc ?= "runc-opencontainers"
 PREFERRED_PROVIDER_virtual/containerd ?= "containerd-opencontainers"
-PREFERRED_PROVIDER_virtual/docker ?= "docker-ce"
+PREFERRED_PROVIDER_virtual/docker ?= "docker-moby"
 
 # Sanity check for meta-virtualization layer.
 # Setting SKIP_META_VIRT_SANITY_CHECK to "1" would skip the bbappend files check.
-- 
2.40.0


