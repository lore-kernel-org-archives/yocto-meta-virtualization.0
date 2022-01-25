Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A134C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 02:48:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.2253.1643078929673166582
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 18:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lBtp6kkk;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8024cf347b=zhe.he@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20P2ciYF020148;
	Mon, 24 Jan 2022 18:48:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=kF2qW0wvSolbpHdPkZjSf/WY+68ZkbvLw1a885A64iA=;
 b=lBtp6kkk2ZfL7/9l1feREL8kgkRH4nsGOMT4Jt9JFb2eaqXDIfaYPbu/cixG73yhVLe6
 fArZ5vcbUyWv6wiqtKFWSDx3lZhfPMCT56iZ2LsxJiRu9yoaEch0yVSmmPqfV+TecSUF
 H8dOXn0rquomQa0DMHPJm5gURKnxwBmnuxLZnqRKwTzO+8kLKooPXPyFKpFe1AglSWu+
 y6AOpRhHVVKum8co5/OvCO9E+RnEq9lXDq2x85XgXVNJDw542pyTmHUWkUgYWlzsYCnY
 HtojCfrKmEA6wOHFUL5SIBGS2wJgNWsycyPywOSm9Ac4SlU9hs61I4auPckIQVWL4vXR NA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dsv6nrj0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jan 2022 18:48:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGJCHbo+pMQwwt/w+if4vGeYSZyJEbo1aViD/gNk5jZlphaRm3EAal0KHh5QDqALCForbk0zDYKdTNP6pqisali67DjJPdAQqiRiIP6OV4OuE0TadQHx/mvrnw8Ryi9yNzlhCU9UOhjiyUg2kPSg+gtVxdi1s/UfGQN3PTG1EuLMUJdQzVWngN0ljFqNhb+w7e95cVYx8TbfA0ZS7HMGiTVl168i9n7TGJHr+Z1vjj3YlG6x8Jn367gF4VXh1+mc9M2/4ukOnBN2ki6WrqeZFfRHt6Oj11Wn3LS5HudKCMrETOZQuU058FehZ3/K99sjibf23ImVhd9fSqgzxCTfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kF2qW0wvSolbpHdPkZjSf/WY+68ZkbvLw1a885A64iA=;
 b=a1aGzhDDfHLYrpCrb8ZsUenXtLd5oUj8tEI8FVZJnLvexA7yyzo7HZn9UnYjDOPT9Ncm1IlvheiHQ0DUqNJIrJLC9fUxZIS2hl7rvkRW2KYol1BzM3AU25ksBqZdloYLstjcdXkLaxYH/mGIbd2gJNe8Yg/fvpjtkZr+1/Ab32bQ6fW5L7xsi8grfpCk+yc5kcRyz4Q6ydK2EDc2qkLv2qeOQv+yAmDqYOCP+wbaSfP2qLXoAOL4RcRinMgbeDsKJ+MdKK6rw3oJ733bi4kTIB85V2iUJK9WgmS+87n++MX+WY5Q31fFzGBCwK/kxUBqE1hlivkftAAh0BBP0tdLCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 25 Jan
 2022 02:48:44 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d%6]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 02:48:43 +0000
From: He Zhe <zhe.he@windriver.com>
To: bruce.ashfield@gmail.com, meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] ovs: update to 2.15.3
Date: Tue, 25 Jan 2022 10:48:25 +0800
Message-Id: <20220125024825.15370-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:203:b0::22) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d3e0edd-e43f-4080-1a79-08d9dfad3305
X-MS-TrafficTypeDiagnostic: BL1PR11MB5253:EE_
X-Microsoft-Antispam-PRVS: 
	<BL1PR11MB5253E5EDCCE79EB8147A8FEF8F5F9@BL1PR11MB5253.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+3QPJJLi2OsflhIA8MXTtO8QamJiN3B4i6DekCdonow5NlJvs/uKWPpR2Sx//gpylUC2niEMTIsfVmkxu8IgXvmjONnwQ0oaiQruzZEIo3zscZDto331kHA4l1PqfRd5P4vVaPfOs0bHawdqxiByU3OmskY/HhC7Cf2ySKB3T43hfEuD6c2vBS+yDRUzxDhQcjFJG7/7DCB1a4PkfrxYbr2EkUCyaWGSDqF39jSULm/FyqTuRMxuQ6RxYTB8JCUBXhmNesDR36ntuNao2azB0uXLGsqSazqc0ZIn9ZewdHyECaA5VGZRBXWtSi0nI5Ni8UNT2pfDWfa+FJIHvSEC9gB0oh3gVgwQNu0YwLNZZNShQGaNtlw1hOxRGEln1JG50+y9lB1JGJe8SR5cXTxcrmugsRM9ecGcMOKx+3PlKCSYlE/FKVW+K52sUQ5DKf4Zqz2Z/tp80npwbNBfxCMIzVq+iQNnPNrw/u/Rne72xi0gM8XQqM0pgQ+s3Q8pivMGBvxY3w6qGMDTVPm1xBkrhTYOH+wIcaszPlW5ZrJYUxtsX/rRfOgjl8O6SJRdT0MbD9r3SPsdC3jt4PCnIuarwlsISSa9jGO3GY1Ixilz953w6/ekXSYY3zPTPtwbUnZlWyK2GAnu3yt6NGOfOnhGrEKIJIZnZLXhPC+UB16HkOozIg34HmJdk47cHm1N2QPgzVmjHfAtH8+TmMOTEy5Zyw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(66476007)(66946007)(1076003)(186003)(38350700002)(38100700002)(316002)(4744005)(66556008)(2616005)(8936002)(2906002)(83380400001)(6512007)(86362001)(36756003)(6486002)(508600001)(8676002)(6666004)(26005)(52116002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I0smK7Gs5bWB4qgairAUnXE1OEJTWBoXeSL7naa6rT9Dn8OfzchfeoT7kU/n?=
 =?us-ascii?Q?kHLBmO3XhtaCxkWRQpdXz/72MoB8u+CRJjet8gp752tTiS0M7macp12Yem3e?=
 =?us-ascii?Q?KeCwxiffk57wmSAXvMah+acHvbHO15LJ31U98vUyNk/VcgBZxvMbutGykrex?=
 =?us-ascii?Q?p5deUc0jhSYX+mksLrXPO35nNCUOS3R71mkIzxAcBLoLxpjxBCCxhTS2q7aO?=
 =?us-ascii?Q?e2g3bR5TqFb+YesLFgGQG7jjzQdHgDDV3U3TT20VqPFgk7yCV3EXA+IWkpMg?=
 =?us-ascii?Q?MWjsO3hZE4r5ATbQQCsjceDl+AdDayVASQ6SZbgzBwDHRUqfCxUkYd2bJBGq?=
 =?us-ascii?Q?uVsO+dxfFig5q9rDOLjNKz50ckL6ipLegKquZMIJpDimQ9DK0eSGdqvfginn?=
 =?us-ascii?Q?0K8OuxQT9qjjQlnNOYi9TU6gaq4xvNdRp7jDgggAn8apWkzQsIj2tuu0I4iO?=
 =?us-ascii?Q?sFc/QcjmTNHEELAE3bOpRohcFQd0enVPUe14IBst3IN1FA2h581vSJvIvTG8?=
 =?us-ascii?Q?8E8qWMMxdWpFFY5Ln1DHwKgkggxUk9gdnZ3+qoK1kEj9oYhHkHSXJqpYHX7+?=
 =?us-ascii?Q?6TCxN8w1YPzSZ39jg22DBON5JOqCLtQeb8ciWrW4R8xWmxXValTov4sf6IJd?=
 =?us-ascii?Q?Itm6x6rezfsCi5YLzKvyCl6smcTA199Cvkcasg6897b2kTuH5O1n0Oz2cPtK?=
 =?us-ascii?Q?Uq6scAZJpR3CAzFXa6tN3kzYJt0WgOsdhVYMCxYeo2ouDNw22+3bTKu6fXgc?=
 =?us-ascii?Q?FmfqR7GpvQa3vt9wr15JybMUHbacyT2FEBCJ0rGhSmGyPuZ2Qv1/02JSsg/0?=
 =?us-ascii?Q?SgicGpd452d/hsU94ZxeCc/385FR8/3IiL6HTMdlJXfvJ8y0+7/sF7MYUtO9?=
 =?us-ascii?Q?SsADfswUg0Q2oqjz3HNP+awm2dWnVUpiruvS00N5upHvg1vW2oRI0pTKSbUP?=
 =?us-ascii?Q?+1YyBFjlX0aQwA8WMfQmiH2SI6OAWRlX4cZhvSW02EK0VZUwIUXeHx45ZPqZ?=
 =?us-ascii?Q?0M7Jxkmov4oudl8xIpnQ3WIIgtEi/UvSdVhKC6WBImEYwRENXYXOTk5R4hjr?=
 =?us-ascii?Q?Cr3x4gjzEc6bqw6eq0tH/7Rn8skPHrxYlWI6ET287eugEwSOqg0DIPYUAe5o?=
 =?us-ascii?Q?hF/hjjG/szVfztxXV19My+kHjogktXRNnjZBrwNkgDf7GFf3dxr7+vDqtTYB?=
 =?us-ascii?Q?y5znQMPGlfhbOAThO0zZD1XOyaQqLldZK9oO+kxoyfxTBDfaZECEJkJU6b1K?=
 =?us-ascii?Q?VovbcnBmvrs/uak5nRTaE/KI9tDwBImUc0kYPQac+E3p7jT4E72C80QxOJXq?=
 =?us-ascii?Q?28XrE/vNExoRbFWJmFj3RD2J9HhXSMKhfH6Amaw+O9NCwOlOekduOdQDhLnq?=
 =?us-ascii?Q?9MLIjS5O9lOdNtxby+MKmgNpjmdkuqszkyTaD4p/+q6dMOKw59V9Qu8w8IdI?=
 =?us-ascii?Q?c3hoFSbz3l+f/crKNXtNKceg+ZD/WNnksG7r/pSOOOJYcfo4tlpWbJyIZV2l?=
 =?us-ascii?Q?cZzapmdiE+l3gvEQu7ASS1qQbM5aRrj7jPZYDy5xKdeDfgSVVrVcjjBqjTSH?=
 =?us-ascii?Q?4DKxxLLHWVOM9jsZ46MwvAtwWxwyRdYh3VXzCZzL3wSovKJJsJD7eiw9uCqJ?=
 =?us-ascii?Q?0NN+JFyM/2sC5rXUY+GjogQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7d3e0edd-e43f-4080-1a79-08d9dfad3305
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 02:48:43.2006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 E+qBVexVdzajiRtI3pnFegpE9z1S9Bk/ftCTza27OJRaIZPFfMjGTKCDCpMFLcIZFo9mKuVa2vzmgNP6Qhl3hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
X-Proofpoint-GUID: bzKS0Dk8zROvNKbcv3uEtFkAjQraLear
X-Proofpoint-ORIG-GUID: bzKS0Dk8zROvNKbcv3uEtFkAjQraLear
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_10,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=635 clxscore=1011 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250016
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jan 2022 02:48:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7032

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 0fb7c132..4d413170 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.15.1+${SRCPV}"
-CVE_VERSION = "2.13.0"
+PV = "2.15.3+${SRCPV}"
+CVE_VERSION = "2.15.3"
 
 FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "f8274b78c3403591e84f3c2bbacf8c86920d68ba"
+SRCREV = "e4d2df62e65a615e19f62e2fd294709be8d75cdc"
 SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-2.15 \
             file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
             file://run-ptest \
-- 
2.17.1


