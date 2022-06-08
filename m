Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FDAC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 06:41:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.3581.1654670491606226346
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 23:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=db2r2yBk;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31585b7173=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2586Xglj008379
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 8 Jun 2022 06:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=HxNl6IDQBwUYy57mm5oyHE1qcJ5Kf4PkusYRrELQsrg=;
 b=db2r2yBk1HTlCNoc19H0+6voi/QGPzgVAEHD9CX++Y2qvqmHYlp8AItw1HnbfrGCLlqe
 hyweAetUf4z8IVf/VtwpsV3LB6csRPD8J6YszpDRs3sivnPg0MGEZglM8FRsm8Y4EgjW
 tZEgQ6YIOG0Nh8ErtmmHpqxX4gEgEmj0VFV2pOwmtpJuSTiBPCCG3taiCoUJxsh6ydgY
 AMme0FDabH3Wrf830tT7pIPlkMpR3bINTNY540Ostalwf9g6CMLDqIe6s92Gextn4ZHP
 hdeu3iRWMa3zwuhkggnnx+apjh7mUD2VXxvEk/nRlE4f5Xz7stUCvGOW/kuk3TAht5cT ig==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gfxc9ju7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 06:41:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHNz+SfW3jYaSud7xghwS0Ph1GwcSx/MpeHYuEY6LiadYDRtFzzoXftKkvP/08v0LdhDvRYR2gXoES+CRG4eaorryyqqfUPUrla5N4C2xcIf1zi75p2Nu436E/kPVk8ryK+Z8OplXokrSHHNT/rwWETccOhuUcVPb1Ew7esCJMKCxQQMVH2OMV+IsNhczriS0IUq7aEt5w+XQ3wsMaVJQqrGdFFEIeYSzjJ5aNCwNRqqFok59eyX2R7M3GsBKjZo+8Ao0fQQeAg78m7kev4s0g3WWfyvtiEsRYAlUI+ixmzU+39YfcybF87+mK/ZGf3VPphZ0KooyEajarAFFODRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxNl6IDQBwUYy57mm5oyHE1qcJ5Kf4PkusYRrELQsrg=;
 b=fHJc1V7yzsf87FCVJ5fH+phtu9uqsutx4zXqpvWYDxYY6g89BBvLT417d/TaIL5PaZIuPQQogjq4Fr/l8wOpWlIvfa7ndHyun2X6YuPdi1aL/YqfU3lVns7CGDnDedrYqCYcNHuM0uZV5lwZxQ+2NOpHOW8kPgT9OHc/NSSvwMzQqDm+9ODlvKS6qbIqcw2LBiOgIJAw2zN3wYL/jXxgx9a9aGl5GuO0JnYL3LmM5MNJK3sXTfCg/ttIYjLCk/DznqyhG+2+tbCMicjHqSkjTli4gijQtJi6jiqiUPens8zac22ukLOPvYspIcvLmLbkZGFd6Z62aUXAaSrXlVYUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by DM6PR11MB3801.namprd11.prod.outlook.com (2603:10b6:5:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Wed, 8 Jun
 2022 06:41:28 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::e1d5:f8a:7956:87a7]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::e1d5:f8a:7956:87a7%2]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 06:41:28 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-cloud-services][PATCH] python3-heat-cfntools: fix typo
Date: Wed,  8 Jun 2022 14:41:17 +0800
Message-Id: <20220608064117.1602215-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0190.apcprd04.prod.outlook.com
 (2603:1096:4:14::28) To SJ0PR11MB4878.namprd11.prod.outlook.com
 (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e3cd5ca-7742-4559-af82-08da4919ea76
X-MS-TrafficTypeDiagnostic: DM6PR11MB3801:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB38014ADFE65876EA69C92760F9A49@DM6PR11MB3801.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F22QKprJ/UC12cIoQE/zpLpi1cgXWsydwOIYx2pDeA8aAAE4crrTv0G5LNB4twLljlEfHcPBEm83hV3grev4X8Pxx+LOTk8HAFB+667VxcIVRtAU8k7j2NqbxjXl/zGn3VJDJ2EHqUAA4b4puVGFZVDk5utf6WQSz5TdHDrHmDeTV/E7ES1HAO/lSmMHXRGUDTYyoGCrRa6hTWvqE+Bp/AGmdmDoL7ed8BueVvRjCfvxtqSuMoXUulixURfkmTPz+eFHvu3Occecb7rNROyEHVoOeYM4dlZSHfRBAjStiygw94vTqFbAHb7IsXHnQirX+pbvLIHg8PNY8bTDnwANNgmTFrZYUX95yOejevendm3yJ4J1iORWNsCEcnmkUKxCf92bmcCxRlodw3uoqtMaa7FBGWp9nNZ9TZHvukJ4tuYhIzUvAyHkV4yt8IEitVq8vwj2y+bdOptDx/R0wiruFpzVMjTYEOk07HDaQjH7ZZaD/1SMNkjLrD1sAnYB5x3bJ4BbqeJObNM2YkYZ80YDDjGsYPSKWrZKDnS7B5RqduDdu4mKS1yPHm2iUjKk1RGUyyqh43zTjRu0QLeWlF7IHvmvm/5oThpjIAKgS6X1nyybcD9t9r0m6j/lAZFQeLDCHI35Xzh3MpTbZMcf30Y5VGlbR0zyMynGBYZYhtWR/VFQtyMJpD9YgCBVR5PDpnewR8VsbGpQT114duEQDKVSXA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(508600001)(4744005)(52116002)(2906002)(6666004)(44832011)(6512007)(83380400001)(6486002)(26005)(2616005)(86362001)(5660300002)(8936002)(1076003)(38350700002)(186003)(66476007)(66946007)(38100700002)(66556008)(8676002)(316002)(6916009)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dFW1V2BdnTP+lexdqnAduzILCU8iKo8NrdnxhgmWpnrhacSjymyDrzDUN7kU?=
 =?us-ascii?Q?GtGwPM3zepk8WCHrNgfBr+Fr290ynE9MCfMUq2AK6eWEHJnay/ypubeFDmFl?=
 =?us-ascii?Q?wcp9+iv7gwiQwVpP9DdXuL+U8n7sAAaiX3/GDaiZMAFGo5YDHnMwgw/lYwgW?=
 =?us-ascii?Q?da3XQd5oAfxyn2mXoBZ54WyzYdYr6YRIqFQfv3GUM35ILc9wQbKwfgJc9n7j?=
 =?us-ascii?Q?m+dXKeLi9Sc6vEoekcpncvi2YhIcBqWonl2+kiDXcEF7wbIgb0+vgZIZR5cr?=
 =?us-ascii?Q?IuKnUWV0WJLFTQymeRJMEqVfUOFEvEWZKEmRjnotWKPOj1RzBfl5S3zdvB9I?=
 =?us-ascii?Q?lwGvW+IBjMCTHIzQGiKViX5T2Q5CzqdcSUbqk+PjZrnkZGVbgaug2/G56417?=
 =?us-ascii?Q?PTVpiuXU4AMuxWlIolUT+rG+EuLUg9rB/DhitiqG68IUPwJQ3UrAvcvwE3eO?=
 =?us-ascii?Q?OLb9oRi/MVEG06LpM4o4bdNTLR01keOcosbNq9jsT/hoRuN4cg+q2pYU12Ry?=
 =?us-ascii?Q?vTmABDNSVLqw9we0so4P/z0Z8RBzDL2zgsAMFvLjUrewKYkj1asIaMjyOJpw?=
 =?us-ascii?Q?2zRrh+RM7RQ/CBKOemtOCb/mD2AOGuMMCxYRh0dMAeM1JiGIurySCtrUhnAU?=
 =?us-ascii?Q?tlcnIXQzXK8GEViw4HDp+n8ulNREjuYi1LK9sOtZCvO7a4DW9QPRHjA9aZk4?=
 =?us-ascii?Q?C9dBKnqC7KnrDnyO8p6+BnbJThSYkKlr9gBiyDEowqIqODgnO+drE04cQwUh?=
 =?us-ascii?Q?MKPBqPlHoUgEhrLeNA61IzdIzZTGi9YspfDbPk8rAaRNKmdPNaTAgLyf+w1V?=
 =?us-ascii?Q?sSph0i0dpO7dE9XIkMv7fcTdcBL/OljIqkgj0ws4T/grz5IOMfYR9D7LMhDH?=
 =?us-ascii?Q?0FROJruUqUsOTnqocz1OVJb+vov2jHBHErQd5r7kA/LCmBk0kmB+CbLqw+fV?=
 =?us-ascii?Q?395/C6B5x1k3iqbS5ml79T7RB6pa+NadyvTHHD8uCXJx6CmNUYRqi2yUnE47?=
 =?us-ascii?Q?78ncZSl4CNO9zv5S6jNpZ9nTfMnlPdBOaBOzBQDKvUkXd71SqZMwBaqTPLDR?=
 =?us-ascii?Q?qz/AmTCc2gZKOK6kjurByEkE5P+dykkdCx08uxZVeMZJ7PjhPB6WOitVd7qx?=
 =?us-ascii?Q?GJ5KA1gWe3nVYmeTYfTdnQ1kvRjRsog7xvh7nqLaN4j3Oqra6r9OTBG2Qw30?=
 =?us-ascii?Q?MSHv+7RxC23fw+Ndi0xeC/IqP30KWrDn6FL51lFxkBM2T+Qq/8b7+LMWxHSt?=
 =?us-ascii?Q?0xt/EjfxcgcABtKybR9a1Zm1pWTeKElBryWtG7iIEI8bxtwKp5U9NUjcBpOt?=
 =?us-ascii?Q?2AcaNLhnQ2Kz1c+UabxC9Z0lDG7p0tmuOKukq59wJ+1xPNnahkDjHPcIKvDq?=
 =?us-ascii?Q?auB+e0o5L6I0atdLfGN2/hAxuMAvpRc3fIGYikM/zvvHFAnaqUix49+6UCN7?=
 =?us-ascii?Q?MIz7gne+45/EVykByOeiTDjMLyUPhoAa5VMrZNZZ2PV45Acor8B13tiqrmY8?=
 =?us-ascii?Q?1KKGFiAk6o6fnZVeI/N8L1KqaQcrS1vjxh8/gQehs3yqkE/4yyP2qbh72XG7?=
 =?us-ascii?Q?EF70onPEeiKnRI7rugcqLlF7FYBJQJgGjo4Z6CUkgJtuYxOniSfVoauItHpn?=
 =?us-ascii?Q?vDHBJTavHC+ui2/rhheI5SOaV85msJgU6wKxDpusTlEKNcMtlvY6G88mxYgs?=
 =?us-ascii?Q?8piQFmAOY2W/TBTKEs9Xc9iKJLXGz9At1W7I1YbDVLz6GeAbYrC0yaKf6LO1?=
 =?us-ascii?Q?ICP1yunxRw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2e3cd5ca-7742-4559-af82-08da4919ea76
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 06:41:28.5818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sTgMbxhlBKC5TctysM1gbDTM3ew8Gidibi3zAMRB0HEIcK8SFk3x+ugyb35oDtY0TSZCU38AlW3b3H5C+fr4Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3801
X-Proofpoint-ORIG-GUID: XL3dSZxwioGFLWZeDQI4YfWRAsq3d81p
X-Proofpoint-GUID: XL3dSZxwioGFLWZeDQI4YfWRAsq3d81p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_02,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 impostorscore=0 mlxlogscore=756 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206080031
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jun 2022 06:41:36 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7345

Fix typo:
RDPENDS_${PN} -> RDEPENDS:${PN}

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-heat-cfntools_1.4.2.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-heat-cfntools_1.4.2.bb b/meta-openstack/recipes-devtools/python/python3-heat-cfntools_1.4.2.bb
index 8439daa..a6dee5c 100644
--- a/meta-openstack/recipes-devtools/python/python3-heat-cfntools_1.4.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-heat-cfntools_1.4.2.bb
@@ -18,6 +18,6 @@ DEPENDS += " \
         python3-pbr-native \
         "
 
-RDPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     python3-pbr \
     "
-- 
2.25.1


