Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48855CCA47B
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 07:29:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3133.1655105338940901162
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 00:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qgIb/odl;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3163d9bee3=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25D7JOCg013437
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 00:28:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=+aLmLDyElVyO3YzjJREJCIgG+uMXbb9PUpLE7QgDxU8=;
 b=qgIb/odlmGcDNVxy99X1iXqExxu2LR8VoqcDvY6AO0Yh8LVxylUauonY1eA6OFeMJcDn
 HmWTb1UeDGxaJmlXLIWsCPxsMBq9y0aNPDKcsyLSKAuWVD8gxSNHOeuR+Jr9OT1bOXjg
 oas0Rx+XjxFrLN4gAaOOiyOsW85VqyqVeGIMJ98ZQuxFb9AdMoS8BjKa20CpWuv2pR6s
 w7qfBL/t4DrzbhghwpVLF8Vr51lty69o+XKOefTcYbMdkmunytzclGpuUaVx13w5t0GP
 7FFJy9Zpoe5yVmjZgeSWxE6I3b2xgow//kBg3vhXvzWR+tFT+6YcHW3Lxo445+pcZ+Qh 7A==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmpb595gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 00:28:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/V5hUAIU+wl97mWXTHZfn52puVx7We5ocaOdQhP0cPXOhazgN3Fgmbz+ChnY7DvXfFoIMRFACN4+TM9BpGTBe/VwpRQ1ooOV5+UBRz+QO5Yk7nQoa03KAzB+3wRXDJyMlTta2hbnGqi+ypTKig1thVliudIl/U5VBBJsKDSQzmV8C2Go6BCQlORj5Hgs185gbbBFwyfbsqCaHAKRR/IaEz8qjlYQALB1EvOKm6/p6GsfEIYAQL6BaaVFAkHByf7V9kQAdiwsq/HZxrCbUVxUwlX+JDz3WJroZ/+hM/vuUGxTam0knkCyRAlMzDmur2UReieQiIRB7NzA8wLerNcag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aLmLDyElVyO3YzjJREJCIgG+uMXbb9PUpLE7QgDxU8=;
 b=kd0Y+d1CFNMAz/MkJeYOM69PY3gVhxN6EbUOn1PS8ePR6jMga3sWHeEP1+6bFJD4Zw3wxJb1xHGU6VpYWG67/0LfzEav8RsGrjwGlQvAQJr7lBSaDGGwIr/B1vD6kl7+CIWj8prcHBaPbxe8YfoJ1+ggDGxqUy1SK7QaBRpLNpIPP2ag+GHX4GwM/CYpdWbHM+SsQSpaSP/EQubok/LHs0bITz1Wu8krf+Ol43mS5CmiHNwmTJ6PZDRyQ6HPD2xs16JpQAVv9uqc405BK3IQYna88pL2oLu7vF28ztgVtPeF1R+mwJ6ubshqUHhT7yzNaf6RO9jp2eim9eY4kmEsBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 07:28:56 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.019; Mon, 13 Jun 2022
 07:28:56 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] go-logrus: sync SRC_URI with nerdctl and
 k3s
Date: Mon, 13 Jun 2022 15:28:38 +0800
Message-Id: <20220613072838.5722-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:3:17::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b687cf7-10f8-4ea7-6dcb-08da4d0e5f86
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5183:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB51831593D78B51479CF5D8C1EDAB9@SJ0PR11MB5183.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IJ76YvK7KNMbRmDM1q65Fk0m6GqUPEqD/K5wFLtNF/gqVAyjAIxG+FaabJ5yr1/L14MPH54SNs0LDEyJX50iv2wsoVCLQjhpsbcUhWZNHPdtTQQ0TGFPj119oKMA7lcRNOrPwhupzjWtYJncVSw4AHHSqbqZkm7W5ypsmecCgk1VOhQFGwi7YbdHMnO4qDp0PG6iri5NTZfoXCltJYcRSQpTLDFCS/3oVrEW8eXcpNId8+6KtYh2GF3ZOcYN6vn/qexFhH8vCuhjuRhONmvsj4xFdx4OVxb+tFxztHORsXSAJ09odjCK+0LaVGV4QcxX93YQXIuutD9WKADkFjHhgIIEp1pRba5QmtNRqVPlHXgjoMaktpnKhcwOHzglRNCb9WfD+gV6YwlDk1u+iLcX8R/WK9uymx5q8MmX6Ib3pyXp9f5ix6BtnVnHpndwYjhPJVaCEjv0Ez/hmYwzQoKaIlGcf81CPXtJcuJ9J2BDUiiGIQ9tjIQz9peYJoDmOM8PAgPB6F+/+OuykSiWlNVn6kostnZKLpfy3GC69Kb/+iECp2J8Pscv84AxE8pLbwz86IFkCN2riHD+oTOj1ID9AXWVGz6WBnWK8UGZMCwnAHjeJjRu6pfMkPx2TyxMj+whOQeaPtxdNl1+4xpbuzfd30AuQsHobANi9H5XavNJdRLmsRKt0vC2/3EyVfOdFZzlw0BKYHfDYCs+QgaEqnCydA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6666004)(66476007)(66946007)(8676002)(66556008)(508600001)(8936002)(2906002)(6486002)(4744005)(5660300002)(86362001)(6512007)(26005)(6506007)(52116002)(316002)(36756003)(6916009)(1076003)(186003)(2616005)(83380400001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tERFVQT9SCWSXyE10MkEnPcAH8WmvjlgrbkdTMLJpOLw1i+xTOOxtymXfyxv?=
 =?us-ascii?Q?GczZ94smU8j6jaH38bisyhWPGRczrcSfELmsCqJj5YbhgAyCNKugDXsPoKHE?=
 =?us-ascii?Q?/UlqpnUtW9YaKp6/CUMvs2tRuMeDOWtxXF9IrrdJFQKFyQ2uji3NddwaKSPi?=
 =?us-ascii?Q?O4HJopAzLCoMj4eC21qoLPezw0IMEk/BzzA6EXwnNsyRGiJ6RuW9lcD5v/S1?=
 =?us-ascii?Q?/RgR7Dl1hg+NezCj7SW8zNVWDYUnJpo0hNTt9c/XLti+moCuFCPWxJ+PfLL+?=
 =?us-ascii?Q?l+SdyAwFJAqSsHdqqDrgRRqSTydDJKcn081V72uV0pTnC9ILL0ToksmwrELf?=
 =?us-ascii?Q?Q9CX3Aokcs2T/As0KdKKautPVDTBNt6d+Tlfkwwe3ADwX3UQgubw0GndU4rr?=
 =?us-ascii?Q?9ixKGDou/gUjHIV9eDSnYDSMT3Wsx/ehx9iugH+OqJRov6FmphOWojrImOme?=
 =?us-ascii?Q?j9iQSNGC7DNES3T1emP8HCvs0KkXcyAAuRhlOEBQQIiBDoiSf/tunIIyMpGt?=
 =?us-ascii?Q?ehtsoySsT36wZEF7CTlzd3N01lIolY77aftKWSXRfKp+zmYYq3E5JjsUGYNG?=
 =?us-ascii?Q?R2yDuYC3TkgygDKFbpFsD8AeQu2hNvgpRkHJ/+KurUwG693SUKjHTW2ukhjd?=
 =?us-ascii?Q?LILef4dFpnnPpTCxaSI4SjwmiQpDE1fMjdQ83VrpsqISqjV0qDQuh6IJLkOr?=
 =?us-ascii?Q?HrqTq88XO9qUR/IhcDzHDRyVO24dtS6qSi7LcWfQdR5pYhmHEmZJojzYs5SB?=
 =?us-ascii?Q?lT8giFjE2JC0W/+gv7JZ1jhaK/n2zxXGLqSZvsE0+pud/0nvIT0CO93N0wIe?=
 =?us-ascii?Q?mhM5E9fv028rtEAfDA3KRIL1FsSCRrb3iHqjbgHJvJ9cbk96sQeZe8Da6/R/?=
 =?us-ascii?Q?DfiZV/OR1e/Q22VPDMbY63JtvlbMSQn//LH2mpCzxQEpb6gQQDkHCJm94Hr/?=
 =?us-ascii?Q?Ia5qhhrSLXuZfrgBJmdtYaOGewaUbwinMfyOVSfkGIw3sOV+CZsPTmzrF/Br?=
 =?us-ascii?Q?LlAbVIpCNRfBAFugx6fa5nav3SxarZiekXkR/Cy2p5RLM2zpEytkq84X3Dgi?=
 =?us-ascii?Q?iyIuRXbHje4SAPtap6N5wuMiO2pNqspas3pnZf1/18pzX1KClx/oimC9RvEi?=
 =?us-ascii?Q?rzn26c5Znw0WeV/ieb0K40oqk487ngZk1d03UUFndbloQisEMjQ4AH0R+dTp?=
 =?us-ascii?Q?cA+o3CQG6xHHf2Z9IedA8nrep02FtfyZ8lJob2qCRYxylVhjjDEV7HSlmUF3?=
 =?us-ascii?Q?LaZpBllgXOjDPDEuqC4A640T/wBoQ4JrPKutO8gcCVhvjELnaCBF0LWLngsF?=
 =?us-ascii?Q?Krcuj/8rfGwP+NiaYiqr3qvppNBYiobQp9jkECDKHA5PzXevQqE0fQMCw8PP?=
 =?us-ascii?Q?L+beAXfugqk3EDgkd9nBsR7kOol1YCPMroYEAyhbKpuJ5O0ejFu3r0u+7btj?=
 =?us-ascii?Q?fZBBn/Sk/VX13x85yd1sLlgEAyKiqtNAMXpv5fjKNpky3pUcKHwvZQ/A9CSv?=
 =?us-ascii?Q?4m95Ey2LSMDzFp47OYhjr8kWT3MOKQDtu3s5M3ev1gJ89Vfl8PS3PeTbbw3h?=
 =?us-ascii?Q?HBJqdcDR81Gpktn8OmXz6a9mkHJSoSZSTwyoa53xlmVpS2UTf43YEOlvj9Zh?=
 =?us-ascii?Q?JHVbfghIi71eWQt05Qs9h2gh17f+Fs8LZF5nIJLEFwoNYx29EC0kJncSocpw?=
 =?us-ascii?Q?8yWD5LiMCKvKYHEShB3+wtf+K11X34w4X4yQSkES6r/7t2fYTkdjTZpRWvQQ?=
 =?us-ascii?Q?4X137p4R9R+OU2s4D9c3tIl/0kn4nVE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b687cf7-10f8-4ea7-6dcb-08da4d0e5f86
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 07:28:55.8872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gnmPo0mv45SvH6QOraXi9mnQvef7uC702gLWu5ZyfijvfHaWrUTPfVrGUx3n2qhQu3zY2S6I03OA5+FQFIPXrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
X-Proofpoint-ORIG-GUID: 346FK2QVC7lDiynRq6bAvLiye6J8UOXy
X-Proofpoint-GUID: 346FK2QVC7lDiynRq6bAvLiye6J8UOXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=392
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130033
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Jun 2022 07:29:05 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7379

Use the lower case and remove the '.git' suffix to sync with other
go-logurs SRC_URIs in nerdctl and k3s recipes.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-devtools/go/go-logrus_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/go-logrus_git.bb
index 2c59d342..cb137707 100644
--- a/recipes-devtools/go/go-logrus_git.bb
+++ b/recipes-devtools/go/go-logrus_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8dadfef729c08ec4e631c4f6fc5d43a0"
 
 SRCNAME = "logrus"
 
-PKG_NAME = "github.com/Sirupsen/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
+PKG_NAME = "github.com/sirupsen/${SRCNAME}"
+SRC_URI = "git://${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "d26492970760ca5d33129d2d799e34be5c4782eb"
 PV = "0.11.0+git${SRCPV}"
-- 
2.17.1


