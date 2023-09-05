Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37DEC83F3F
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 03:22:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13665.1693884141150710820
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Sep 2023 20:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gBxoOtDy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=761265d233=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3852eYPj020295
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 5 Sep 2023 03:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=doAVF9zAM16L2TZqYINU+pRPaJ7WOzDIwR+686soPDU=; b=
	gBxoOtDy763wlgx2PkvjLx7v2gua21sqlIpC3oCMxnQfTnZsjuolt2HqPfLUJF8J
	mAV3Nxqy7OllSxgTgS18anIUJhJalQ3CPYRz4i3MtU/uBojk7+aepBtjjaspzwX6
	uL1qDN53fz5veGN77l9EFPldwwDwGEsV7GpMEDkvfqLQ5aRvKFf9DSEsNEkBUo9u
	GT1CBYRWhW+qADEi3t3t5OTrT8hcop1NecaRiq5i5Ryez6CapzP6O/m7m96lc5qQ
	EBDj8IQlegxqRChtcRCvXcq5Wi6IB4La7+i4coI+YVFh91Ped/Q5fesNIK3HwfMa
	r7l3qZlApW34jQd3UL5PCg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k0wqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Sep 2023 03:22:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMiTHPfJss0gdFP4UBiCbf4feN+0THXuULE6SZgFeP7gE1kSVCQSXUYMJ3LQMbNclI0cwIp7UbNebvUKOq8cU0I1jR8yopUsvORDFEy6NWsSNZRCUgMS5izl2tPuuN6vIVarGa76KfSaGWEYhXQXyFLpa5guM2XWpFQuFnF1Ymqbqc7HQJU8/ASW5CK3Co34QTObd6eQWVfBtiOVF4H8x/oj49b+yhSwL24lDW3HrT8OWmix1SpvbeZrNPPbfO8hktKqT2D/Y9ryHFq9NUk1069w/TT4pf7Gn5hNbMo9d+egu8OmafaMncYgYR0Oks7XaUIq3eKw9OMXp7pYgyPLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doAVF9zAM16L2TZqYINU+pRPaJ7WOzDIwR+686soPDU=;
 b=TolppxYGnI82KO231XV/C5K3D9XPJsZO5nbwqj2YQd27q8SjJnG/i9rSycT95YrenKR4K48/Rsn1H33SHpU8FwDTJLzwoGBWsVGuUy7WIDMBzsU77MOwmffbvcbRfzvQH1TnjwfAK8wJHjQWB41TO/TyPeNXRlsSK6g79JVdHPmyRdSXEhrgALQp+4c6YRN0vGwd61cfwqqX8kBfVRkSz8d613pukW1Z5LMaqfnpwbGpDEtrIVU6DFbd8zcIp8d0UweYLnqmY1SM885XPn3oRmHAsgag0xT7dVoQ6YzH0PefhqSpK3zxZ/qXVNYcrcgRvGuCYcdlSKDG/UA7DLD4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 03:22:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 03:22:16 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 3/4] iptables: add kernel-module-xt-nat to RRECOMMENDS
Date: Mon,  4 Sep 2023 20:22:02 -0700
Message-Id: <20230905032203.1896328-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230905032203.1896328-1-Qi.Chen@windriver.com>
References: <20230905032203.1896328-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0133.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a705f9-dc12-4f97-7d20-08dbadbf4cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h5qmChReW0jagArAXWHWtYLtTqkDKZmddV21thobU8b23GhqKNhjn2awLTd0CisZKLVOTCduj02V1MEaL2uRW3ZqHyTcX5TLp/49H1hSsK+g565fwMup79QnVGY25vBlBMZQQAN74L5Q07DgPpN2ngh5nyC3Q76GoPwtqKaAYS0OG914Hr8jezs3TMa3Fe4x+Nyazuk527wzT+LXUvPP87BtrZEQJsWB61UrsCCmKh/MpLo5V1QPNyBZ1p73+HquLKFTv4IJ4VuHwrBcNQoNvpXhGVvjQ+sCVgv35doTo5h2J0SUNk9ZAZ3MtQ+aLOOymPrn5+dJGGM6ljzATyEoO094FyDx1huplJUmFz5kwsdCWCNmquEdmtVNz/9U2AYUhUHaIcIjwK562dYdQXXmcTFqxXm7+P+oUl6THJHtFvggNte7gFtd/w/wAPrVWAUcQOcqjQw5P2vxOpxKI5EX9+M5xuPIi0bki8i4jD2o7b0C52Bx0Ii8bBtns/HkJvjFvPFI+RKK2hjtuzYpYSs1vSB0ij64Rt12Ty9E3PhrVUzkKvFkbrZkwUsmriu4KssakZsqKJVf+1PSqpNAvV9N6Y7FnJnMAhZmqKRaPFHHNaY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(396003)(39850400004)(366004)(1800799009)(186009)(451199024)(41300700001)(38350700002)(38100700002)(6666004)(86362001)(478600001)(966005)(2616005)(83380400001)(1076003)(26005)(9686003)(6512007)(52116002)(6506007)(6486002)(66476007)(66556008)(36756003)(2906002)(6916009)(316002)(66946007)(4744005)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9tCARF3S9DAAeYCoePwYQT7MpSGeUCnSQZt1lsVpA/KsWlKFZokRr00WD3c9?=
 =?us-ascii?Q?p2i3J48EMesVBwqpHqivmNgoT75SMWNEVfYrouB/9PU1zFn4pMdgEJu/TR6R?=
 =?us-ascii?Q?bqHZTRCL+GvFvxJBL0YC4Mc06nBB2T5lrQcXR2qUuFVQDxLthRNkSv1T/SyM?=
 =?us-ascii?Q?kUneaYRTVDfkUcpuIaj+jGiCJ05Pw61yAp/WAOj2rVOUXZ85LRXfMczMtv0V?=
 =?us-ascii?Q?nnN67FaRz2JBhuYyTrdfXNONS8PIFdslRZc2EgdueJdmpNpdiLmAiGnGluBp?=
 =?us-ascii?Q?p9gTahFWxVXwaPwiHcQh0lLzBXO+LRmpWDOI7s1Y443FUGtE4R4xSY4fND43?=
 =?us-ascii?Q?GBZPBLLgIQfw559WSzXF8IJKbwayfq66j2RAT1ieHkKq3RoG13i9YWD6aET+?=
 =?us-ascii?Q?y8rRgg3aKxlNfHjyKAC+4Zde+02WpoPLLeawIUgdzaMVe/7N/cp8r6j6O8gs?=
 =?us-ascii?Q?M/eRjM2E3wuNefgGc44F57yo6NQO8Yy5taGz/iUxJDgeZSkP4fg14mTtZy13?=
 =?us-ascii?Q?DhwNMiPvZLv9/UY5p8N/Uw4Qn9dv2S2K+4TM9y/72KZ8nJQIyVK3sEBgUDu6?=
 =?us-ascii?Q?c2muTKsu61IzH4+MpfuzYIlZ8+yxtDuc+6yvew5NaCSyD2WgPApRkob9ed5Z?=
 =?us-ascii?Q?rCWE+SSZM8Dro6ZETSfcP5QCFnFJEgZJnANtfaLMl1q3wsCJt/7w2gfJX3Tg?=
 =?us-ascii?Q?b9JZh/VHmNEAOqGwGXuKLZ8tQD+belVLR6Udp4pCsJDfwRhAY5GWl/OJ+Zou?=
 =?us-ascii?Q?LXq2z5wVjaXqDR3uzwx8pvvunJIUyqkuh9mFFUcz27DzBIuQHsb6DRq2SpRA?=
 =?us-ascii?Q?DsPQltK8YqpkmGV1hrDpM+1MLQLPeYyhza/MlTVVdeIsgn7+TWyACMnDWu3L?=
 =?us-ascii?Q?LNgc5LZlePWR8XMyBYFquqC8qwMiixdo6mAfGauBxWspg5bS0d6d2TO3ZNV6?=
 =?us-ascii?Q?pXMhY2hOjhMly1pSqtE+LTiXlT6yu7girwBQvYZk6cb5tt7qqJrb3Jt4Jvk9?=
 =?us-ascii?Q?4MtlgnzfCxJNHPtx70yE7YemQGHniHpRi3qPuj1byJCztIeKrsh5FZd1BjCs?=
 =?us-ascii?Q?tecSi902IHWvXnMS/X1Zi6nTtsKSyDeKdK40gzBU1Br4PNQWmtFOmhCNpLBP?=
 =?us-ascii?Q?pRSr3vwMQSYxrf9A3ngL6cXM7YBv87oKKi27BLWg0csZKGV+WfIIKrYr6LW8?=
 =?us-ascii?Q?uFSWNBtk27QMV1L8Ii9HE2fnx+/F5xnhIdovfib05jM/9AmKOEcAXZ9ulYvU?=
 =?us-ascii?Q?BjMW0pdMRfkBY+YS+68G3lmQ9QWLqDurCqPjR8ZR970M6GQep8S2ud0Q/Qdv?=
 =?us-ascii?Q?rxNrYAMGa82IKs6nwHejjyeNPZtEURvHPmRr2u6DSN3V7QGeIn5C58aryrWQ?=
 =?us-ascii?Q?geONrmSX0YzlcGtzpr2LEGAYvC69aXXd6s7tEbHwM1iDJoMHzgPp0+T31BD6?=
 =?us-ascii?Q?XFHX2wwQU6wTu4r4+AmMf8fXlBYHEgV+IG4xEspkfovrelVD2Tw+NR2+juh8?=
 =?us-ascii?Q?QDqZ4wHZ57P8E6lDd2JK4kSwVXk53F7RIzrEbil1qvpou9wlPhKWLbezNZQY?=
 =?us-ascii?Q?4gtc1O8eivAi+hNeZNKthXzEjqgfUr7tIiaJVtq9p1RnNuN/dR9Fi5tH/9+Y?=
 =?us-ascii?Q?1w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a705f9-dc12-4f97-7d20-08dbadbf4cc0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 03:22:14.2555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Er9K/Tv7k3Zx5V1mpdqG3HsWAwZKjnE17tmNGob1ceMxkojS3ClYNTvarK39MTjxam6ITVJxe2HQbwIlSN1yLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
X-Proofpoint-GUID: kQYNyyMp_pjkuCWFC1PuQ9PCtuMFyR3q
X-Proofpoint-ORIG-GUID: kQYNyyMp_pjkuCWFC1PuQ9PCtuMFyR3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_01,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=859
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309050028
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Sep 2023 03:22:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8271

From: Chen Qi <Qi.Chen@windriver.com>

docker-compose needs it, otherwise, exporting port would failure
when running `docker compose up'. To reproduce the issue, use
commands shown in https://docs.docker.com/compose/gettingstarted/.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/iptables/iptables-meta-virtualization.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/iptables/iptables-meta-virtualization.inc b/recipes-extended/iptables/iptables-meta-virtualization.inc
index 49315590..ac3c7843 100644
--- a/recipes-extended/iptables/iptables-meta-virtualization.inc
+++ b/recipes-extended/iptables/iptables-meta-virtualization.inc
@@ -16,4 +16,5 @@ RRECOMMENDS:${PN} += "kernel-module-ip6-tables \
                       kernel-module-xt-conntrack \
                       kernel-module-xt-state \
                       kernel-module-xt-tcpudp \
+                      kernel-module-xt-nat \
                       "
-- 
2.40.0


