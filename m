Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE449C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 07:37:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.69359.1674200245501963285
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 23:37:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0384f0be59=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30K7S4DU022750
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Jan 2023 07:37:24 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3kc8e7kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Jan 2023 07:37:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xxk7dMQlm8F97ny073MbaCGUHz5b/jqdxPZcQDb5Y0CwjRwzKhH464z1vYFHYyMkqVWXageusU16Q2/mbh54nxc65oYN1Rv/pO3tWfdnmifa+YOjHi+Zw4jDyQX1CPcOZ9t6M15/SOplC0PFgDbV2D/FCXjtwBcBFZaJgOOa/j1GSwDcBjNky8bWTHLQS8LPJ/huC3M5HPNcJc98Pc3pO7TkuOkWPee+vua1DkWFP0AeZ8jqEGOX3BmYzZku2vJYnIPt3n0FU1B0freJNFmx2wf6xUR1rZwidmTGXrCt+xtPpc1EcA1/Uw4v94BPM7Yc/pySiXj4NtKvnFaYkwXWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEIiVPFlL1jJjhCMiASLaXfHygzrnU98nN4x7XrZyaY=;
 b=jsoq3tsoegcbMyW1j+v6YPaBgKjiT+nHDsswG1Lby9nNFk8610Fysv/xgcqxOJh0tOFGgflHIztriNE2taW0OoNy/5buKMruAXUe33hES4NXiqdE9mqCqYWVQoCnagGUIlv7laLA08AysqRq8VD8jiz2+vBoF5SpsDsIHIk5bhslA0E6PTef+66HP22a/ran40cwTc+opXUGwfHYacHS7w97/15W0kLOgJONNDYlH2DX5R7DQ4QsvleXzAthD3K60DnE6DpdTt0IYTA31y7ET9LL2LeyAfZXNg/rRv/ynBOcqM6uySONY8nphgf3cZ8Yy7IKI+EgJ13KUXpX4YqG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH7PR11MB6607.namprd11.prod.outlook.com (2603:10b6:510:1b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Fri, 20 Jan
 2023 07:37:22 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%8]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 07:37:22 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: skip buildpath QA check for libvirt-python-dbg
Date: Fri, 20 Jan 2023 15:37:09 +0800
Message-Id: <20230120073709.477410-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0046.namprd07.prod.outlook.com
 (2603:10b6:a03:60::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH7PR11MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4404f5-7f9f-4e03-3a63-08dafab92b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z4TwpFutldn83ov00Lok38LGMFmJw0puuW+a2yjfpw1xiicXbGiYpTbc7z4Xnr2ZMz+4zQ3in8xb7bsl+478xOMMeWO7qOjQGLeRPjIkihAEqeWX73us6Sp5DQOAA50qfe3t2HwVsr+WCLV2xf5Akzhbp6Xfi66vdBqzZONHJC3YIcCWTN7enBlfAaqjugNsRfO/9qlzJXf/6SKazQQ0gmbabCMmYbTDaFVrO4WKXt2vCuCMuW0WAKxZ3araRSjwq9sQ4RxkLMTpZEGZZZTwZdK/eNNaNZ1QYv7xOpry/l6Y7bd44rA6KLkyguZoPxyYE+324f3F3t7cRczrB67jEy3sjKByjljLMbXfSqqyqF7sexqHrsNjgxW4TvA/MNeAS6WygjsPc4KrF00fOB1xURh81AuYJ9mRlI2oi54jCYuA5q3Rh2ow+SYU9F6dW0EAS9YFBJn7p7FH6gjkmAXc3yWDz551qCUMog533rbV7bgruyEtXpvSeJ2roereVFvMHdOe8pdA+7tRn+ltYb1JWSPpA5oJeeRhaajqW8eMM+Ye7xb8Etgrl2P2Ylj4MJbQhmzj7UoQiOJt+FOBEa/39biTPCqS1q9aBdt6R8N4tQA89xNve+lZBOaZ1tsLmBQu9X6dLvaOzVbw0qwQS9p+IxgW4X2JhNlj3DDjFuzhklbfqMkQ0OpOCJVDmLHIMGGlzN0f7BKkHo6/Du+vdf/F6tlO4EwdA9k7PXFYeM5IdM0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39850400004)(376002)(346002)(366004)(451199015)(8676002)(66476007)(6916009)(2616005)(66556008)(66946007)(26005)(41300700001)(6512007)(186003)(52116002)(6666004)(1076003)(316002)(6506007)(38350700002)(478600001)(38100700002)(2906002)(6486002)(44832011)(83170400001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MyGs/KttCPjzn6Tqcvjpz9FzFtqjqzXj8hlVByKtU4f6d0Qq5gAMEtSrXK1E?=
 =?us-ascii?Q?zsAp+PohxwK80BsOiTXmbtwjQc8MYX7gD04o2tPSG8lttpKsWIl/+SaPhhTX?=
 =?us-ascii?Q?NZABvxmOYTQUiTrQk4xPqWdn7TCmgO8+pCK+kUqDIyNYtB+UxZ+iiRt6c1ft?=
 =?us-ascii?Q?N53AHlIbKPGK6H1n/votSLgT2uCRJ+vuCwzLoRkyj+4zwhHyoRY8wBJIKltE?=
 =?us-ascii?Q?r59izzoEfyFS//GFwrQUkb8AkuuaTy0JEJrfXwQNV3UCzynUyeAWQ7ILPir7?=
 =?us-ascii?Q?KCYSW0X7DYslQzGjx+3tSJzIpw67KC8J02KRQk1X5DnAPZVadJXjc5qHYM8n?=
 =?us-ascii?Q?ElNloVs7xeHzRqkMmLM28EwHILmTTHXw4ALxcY9w8ZO9xIPBDc9aBONQBVQC?=
 =?us-ascii?Q?P7rdRXf2JQ5Ii92+qp1Y+zvWdCZ895wocD3SjT45ajOa88nORgWW/AggHgv/?=
 =?us-ascii?Q?nD38pf636ApoXFbIOOiDvb6dAyvA2Wq4qMd+Tq5sMvYt/0hvBrn0nrGAC35A?=
 =?us-ascii?Q?18UPhTCBwX8CBP0HyptCxagPKgzMsVXjbbEksElg2DmqETlnJKZOYLCuPLjP?=
 =?us-ascii?Q?VNKulLhFH9UnITutvmA0lkAnUBPQ6IDaUy91chEoCbJKlPLhNEyrB1PPY54e?=
 =?us-ascii?Q?OILCQxQyqI+ELU2b0euwCk+3P9un0isKC1k4RSvFzbJ5NOkZtntOWjpQX/Nn?=
 =?us-ascii?Q?LJ/mlDGfmKZslTPVv1DRhEH/KMms23NuusKUiCWZEd4xwI/cnci4JytcGfsd?=
 =?us-ascii?Q?YxeCl8x33un42JrWrtuER5PNbCxTarcSiXMkB8pcEfbNafvAQN2bC6zbqvuz?=
 =?us-ascii?Q?sR3Pw8adBAVPS/8reB3cGmlGULhyqjUhKhr26s/r3t32QUfaEB/IEv9R3zcl?=
 =?us-ascii?Q?Wc8mLEkqVGpAjG/hZCyBq7KDPEIw3/kZkVrbhZb3s8XIwarlIZCKr8AAW/2S?=
 =?us-ascii?Q?v6DCFNw3g5eVr3/k1TSb5CwCggvR2trUnDnlCndXYhn2we9dNNicXgdfvv+f?=
 =?us-ascii?Q?FJZSNg7JEKonLMp2sE0HsfIPhaXp11hBMdAp8tDntOxp1k3lbQWpl5dKeFO6?=
 =?us-ascii?Q?KD6rxIXFsJZfUxP5F8eEsjIyH+4RtopWag4GY3LpFIXbbxTJSrVE1KP8OTzT?=
 =?us-ascii?Q?RO10JeAFE8NKQZCR9kS/fe8SubN3EdWS3xVm0tWrNSe0Qk12Z/iCjevKHdj9?=
 =?us-ascii?Q?ORH9+YPq+mboBP8S3whnfgkqY4sA4LAVlPBZmI3f66JFaYPLHAF+ijva8SWO?=
 =?us-ascii?Q?cu4kdWMghLZAKKDRD5WboUkoR1x5jCMoS9ImLYhP4YeN2yi9fqxxcXzGwQTA?=
 =?us-ascii?Q?hRhb8jLBV8bl8p+o+xeXI1CLSYskeXBKCZW+T+0anZfjpKW7sT+OinvX7E1F?=
 =?us-ascii?Q?0W+Anaiqv8GsQ14bAxZvrEK9BH3natJ/yBT+YThOmr5ONvUmB2aLpWCIuUWu?=
 =?us-ascii?Q?JVFfkDYzQ+fQdwpAyYuQIe2EyqzCAlWeODiGUsX5URqsTDGRoi/bcHx/iQs4?=
 =?us-ascii?Q?Pwd330tvYJEONyirJQwCvDfATnqV2Rvq3nW4fEq3ifjOn0ajyOmks1VjuKnR?=
 =?us-ascii?Q?meV9yrPEbwXpJQDObP/mOIEAMUFGHfQxuPH3IytaXGaYAmyyv62GfpdYLLYJ?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4404f5-7f9f-4e03-3a63-08dafab92b03
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:37:22.6527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cACXuzzMd0GSh9z2hrUP6cC5DBUGGP6ueZp4KCnK7whkuD5P5ciTLsFrX1HbXZ2dHucT3mp9/inUdRKmKFCpJ5Ui/PGfiuXWwYX5OVtgJpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6607
X-Proofpoint-GUID: i_3ydaUBIAXzZL2cL_liBSNC36_0RjgF
X-Proofpoint-ORIG-GUID: i_3ydaUBIAXzZL2cL_liBSNC36_0RjgF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_04,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 mlxlogscore=745
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301200071
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Jan 2023 07:37:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7826

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The /usr/lib64/python3.11/site-packages/.debug/libvirtmod_lxc*.so
libraries with build path embedded, and the setup.py doesn't respect
our CFLAGS with -ffile-prefix-map argument, so try to skip the
libvirt-python-dbg buildpath check until that solved.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 6e2c367..772decb 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -15,6 +15,9 @@ FILES:${PN}-python-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
 FILES:${PN}-python-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
 FILES:${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
+# Currently the libvirt-python debug libraries contain buildpaths
+INSANE_SKIP:${PN}-dbg += "buildpaths"
+
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 
 SRC_URI[libvirt_python.sha256sum] = "a21ecfab6d29ac1bdd1bfd4aa3ef58447f9f70919aefecd03774613f65914e43"
-- 
2.34.1


