Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7D0C5B552
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 03:51:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13139.1748490692381082832
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 May 2025 20:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82441521c9=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T3i6ZZ014232
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 May 2025 03:51:31 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u3b14xv4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 May 2025 03:51:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qc00hAkWwmMgR7tKGEUR3oZuNmG9qG8ftdC4X4fjZewy/HDLtRx0JmBoS9jWU0eZMnX1RrGQcG2erPr/KZPpf/Ep8Lw8qpgZKxi/0r/4zVuexfp7NJn2H7hvNyPE1NQ9oHI7AbRhHWNh8aHA7HNUP2WIWg1VV6Shq43fLoG+SGZthwxB8pIjAKUgzeoMaZS6h3+3omf0rNk/0FOpG3H/szs29tvlPYGNoODX+mhKXW+8TFwI0ke9DZ8PuGEZDnraMrn6G/YO/whIZ9+/lxzm3JMf4NM2nK5t0wRk1W7pm9eC3E4/BhWRWsKLa+giw6mFp+k1czGva3FVNjvTsNHkJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kV/0qDU7imFy6KPEk4k5iYS+6lfrmtZ3hE0Kw/5svmI=;
 b=xP70fa6l1Gxc8hToe8Mo6eke1mgtwNbKAPI4VqsjYMwb4Zvv3yseOeyhTrtq5WkiIl1a7Of1C/hK3De7cj3p7Q+xUHh3LGPA5VKiofM7TgdsmolsxdIHye3JeseZenlevyZ3+82GoCCssWAqBTYJjhcHNmCuZgp2R9Tyft1daJEjyJgCn+fLo9qiqEbQnmu0IZByl7Dfy4d1d03RVuPq4m+cKPZAjE+8vV+cnF6GQ5tuCD42yz2YtczCS4w9mKDIfNdGlrax51Wuw4QLF2iuKm6gLxIDCZa/AhJ2fED4rTJXNJKrbwaNRkDyZCxMsMsM/ylaaNVXRMg9EksqmThLKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 03:51:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 03:51:28 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][walnascar][PATCH 2/3]  docker-distribution: get rid of unknown in version output
Date: Thu, 29 May 2025 11:51:09 +0800
Message-Id: <20250529035110.1881797-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529035110.1881797-1-Qi.Chen@windriver.com>
References: <20250529035110.1881797-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: e3177e91-dd1a-4baa-12d6-08dd9e641746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9FXKCu4Wi5ml6k+WGQDs5+8y/rzRb4OLCIepjbPOpoBQIcYHqYGS6BDIuicB?=
 =?us-ascii?Q?fImCi0XsW9ttJkmWwV5TbrHnhPpU4aWdGN4Etre4I6gIlFriaMOIXTrfjejL?=
 =?us-ascii?Q?q5Lesogk5BQIgutEt33J9PGUsx3JqOqlveHdjP6mxerSkiK0p4KH/qfNDXZJ?=
 =?us-ascii?Q?6W86UzGSPt+amYviqwX1hd/eqcM0UGzNlX2qaifFQq7Y3JYjeOnFnpXF+aMF?=
 =?us-ascii?Q?b1ZseYSTIxScm0VMDg4w1L0lyPRtqEUKx/ooYGEjrYKw+79yQqpGl+Ua7RPj?=
 =?us-ascii?Q?9ofOC67mMaddvgj+fHc3hCftxFpFyZdeWIFsBTpdH0H0Eh9Ti/fPGPKMTV1h?=
 =?us-ascii?Q?amHx49Ru4AA9EdB09S7GAn12kUz48FaanaoEyE/8PQ5MobrqxSBgBh/ZiEsX?=
 =?us-ascii?Q?d7YSxblspwbfLd8AKPR9cGmQh5rXUiEsulXBzA7im1ygaRpGCJ7y4F8nnD3U?=
 =?us-ascii?Q?WC4QcMWwkgV9obbg11/hlzdaxPn3YuQKLHTHWjG7AgIwtOOkL3elrbcdHBNW?=
 =?us-ascii?Q?xuL9S9sa5YsychThRnEYdxQOxzohrZhyco9AZmSrr7M8oEvFO9ytl3CNDxeR?=
 =?us-ascii?Q?/oh4xCRLzU5hOmcgtkiuguUQ1DSvDbnUmflHWRcByEe1EPAvKMVGAwkm8+AP?=
 =?us-ascii?Q?4RZKETlJJXd0ehtUGc08E83ZMjA13Ty6nVZbRYVrJeSaVYdR8e2EORpk4OJS?=
 =?us-ascii?Q?s9kDVcLx9rPOvns4PMxhbZ4SLHnOIkf1oxhKph2xswaXAGFgji7qpK1q6Dzi?=
 =?us-ascii?Q?0RDtxhXdAtXlKmezwX2XQxtuTB0r5eXDgomIHMKC/kvkHm4Nmjkkb/l6DChu?=
 =?us-ascii?Q?Zv3eI8PccUCYqWyGDhrmtmI66xzXxNFYW0HerxIWtaNmcX/YqahFWCWMrJGF?=
 =?us-ascii?Q?lFFdYmPjSKxajzN0hxN8EXVMHqhIslFB4c/2hcxG+04pUtCk2enkDqkbpzql?=
 =?us-ascii?Q?8v7KzNlcQGVxQKO7NTRF2xNDPiL5GAqFVP6WXqP1nzpqzIMR3VHvupmTQKbh?=
 =?us-ascii?Q?21IVgiqYE4K6OUxNxyamUECd+zQWPN3O3t7tWMN3d5BmCoeIyFJmKxVnlHO9?=
 =?us-ascii?Q?gE9amEhLHkD2mAx+SlQPUklOy99+3I90Q7midN23LG2fkUJALHjfTd71Ol6+?=
 =?us-ascii?Q?5R5WfMs2LN7P//pOqNc4n504wtJVQJwAvEEpBgjsATn2Lje/Fh7JPIe5KZ3s?=
 =?us-ascii?Q?/P23RcDfmcXBj6uXrBVLph7yb6Ib2dixCATtoY0Hb73XWz0Y7I6+h+UdHTIC?=
 =?us-ascii?Q?BxZTEE57elxWj0l1jWjaUZvrqloeHOJHQbz6cg1BN0c6yU9q25GwGt8pTrfB?=
 =?us-ascii?Q?MbQrbrAQxOvAsZ70W3xe7HavohbIg5Jmv9Pw/uOejCGIhkVCHYJjoeFJmcPM?=
 =?us-ascii?Q?+Vd1SnVMRKtyFJsx/qnFRvnZRU8TRFiBAyN7fpDosNNvw4PNljpwBW7nEslc?=
 =?us-ascii?Q?xHR7xbLxGI96/9VdM+rZ+ItR0qaA2XEtZPkYjnU1M3Dl3eS6X1O1a9w9/ZF5?=
 =?us-ascii?Q?1XGtd9LmtH+VrkE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gOK8Qz/VddHbdniObGNHixYXV4wBKQ2KxZ5/A1NBUHQWxH/2dr4ah0IXAP2J?=
 =?us-ascii?Q?yk3l+TTPLV6BDpPiD1oFZ7KEWl7dUQdNZlcJUXU4U7pvhT93y6tAdUCabrDO?=
 =?us-ascii?Q?fLNCbUSajIc7AgTmGSN7625uYUC0w2YwGW8I+v9QnV9ksH5KDPzTf5h2pA47?=
 =?us-ascii?Q?uy/GDw3zL41XLnsMyCPQNL+4wcPKN1T+/QY+wXpCFzNoolHNkUQjcjKBec0F?=
 =?us-ascii?Q?JJ2OBvzEkev0rMf83Th+FHdlgRX4f1PplOM4v9HzfT/eToaQysSpcm1fl5CW?=
 =?us-ascii?Q?0+cPe6QmBHA8rwrjZTcnQv8a0ikZbcJdRHlEPC/c/7am19i9dydL3pBovFCM?=
 =?us-ascii?Q?VZtEXfmh4PjiD4VjAR2xylxuLvmbRBWjAqlDD0LnZ9h/cW7mr7QmYGbF94Eq?=
 =?us-ascii?Q?XHGzYi+KpPQZbjtjTHMOMk400BNKMR4ntn9GTZmkzzB9IS83R7Yn/TL4sAE+?=
 =?us-ascii?Q?kHmVOXQXYhx6ImwicQQnxrlvUMqGm8FOhPHBlOwyibT8qrUc2uvWyNnv2vXg?=
 =?us-ascii?Q?W0rx3pMHWn1xl29fdV6Lj93AoxrMlY30ZYEXNkCbc2Xje3q6vzpS3FVh6l6n?=
 =?us-ascii?Q?5/5GhjbTfJWeU7DUY3w4oGdUo0RsBdrKlBOsizo4zkdYhtMbD3pyD/hMI2C6?=
 =?us-ascii?Q?IK/TkzLAkwrb/3ZU2rfn+XufXCtG3gu1jkIq7Ra3FV1rR19lUkLk3HO2dyI8?=
 =?us-ascii?Q?E1uF1l8TvpI5Y5JCbATK1E9gR+TVddak5g+1Y6VpLOYR79X3lB/l6KjWLt/U?=
 =?us-ascii?Q?XyCtPLkesHGioz0+7zIfIv9b/AIJWKDFNfFHX+XJ+oXEAFe+hFtNOJSrEDdV?=
 =?us-ascii?Q?ESTd2Cmw/YTx/cysapArotQ+Rjrl06T+w6RIqVAo5elwsO5o8JDJyttZeR2i?=
 =?us-ascii?Q?zJHQATHm6nL4i8iwRX0gRtDIXzEP/ja/b/2ax4Lq0Os2/BrcHrMPZhm6flGo?=
 =?us-ascii?Q?gztd9QgeQrPZiMvwJ6XFjbgrbos+23zFEV7F1DrDfBQGtMQ2lvyAqORDTwRw?=
 =?us-ascii?Q?x0t7R9Gp982b2t21kPQDk49uFpYnJlsjNF+D22fhtN4u1GuVJhMz2RyE1Lix?=
 =?us-ascii?Q?UGczTBIQokI70WkEF8GEb+tI+UNJHGiK5eLdUwsTv3H/9rcL1zWOaz34Axet?=
 =?us-ascii?Q?uvVJfHa5Wk6TpbVnlrngRLp/1JAEVllkTL58potlGdBngPOojiaWq6zh9A49?=
 =?us-ascii?Q?P80T9I2ZN3Vze6lU6WsQIFRQ/4k2BtRsLbfzRWXUFd4an0zHpBUklrdTx+a4?=
 =?us-ascii?Q?HdxlROrJdpGUSDeWK6nxYQB+Mu15ncuhY3AhoRravtHrLoutP1kPE/rTivYY?=
 =?us-ascii?Q?V62DJaAPp80i7AZoQN9jjmSbdxwtOR6Zg5/FcjrC5Ds+FjiWgJRb2woFHMgV?=
 =?us-ascii?Q?Ytx4YsTWVidx+c+Vv6EYBR3jBPwGUxpTzHflNUy6rtvZetKGrNqXjCmnD3L6?=
 =?us-ascii?Q?isjRd/OhNtpgpv5uhpKtGsocKDsbx2ZTAXTBgZ2J1cLxex6gP9e0I4AuWNnU?=
 =?us-ascii?Q?Mfe048/IwvU7w0Xtlgpdic0NglBmBJ8ZLIuwxMK296O8+ySefLypT2QM3NCL?=
 =?us-ascii?Q?jLgY/9Kvwe5cDXkNJUQnCMr8xlpTyrBUNhqrr6fj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3177e91-dd1a-4baa-12d6-08dd9e641746
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 03:51:28.3837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woy0ydovXi/783UhX3H3mvr5dZyUOghREh/z5Pxu3o08WhwoUx7B4jvvf0ZGWfdfJmS4B7DcbTkSYEryNou8hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Proofpoint-ORIG-GUID: _C35Dc89jkSX1HVDCHTtW8s94lpinPku
X-Authority-Analysis: v=2.4 cv=VpYjA/2n c=1 sm=1 tr=0 ts=6837d9c3 cx=c_pps a=EAmgx7X/BcpSCz1KBN8fIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=uLPss6bM1OIA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=wGgdPcaqLoS6j1AL8esA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _C35Dc89jkSX1HVDCHTtW8s94lpinPku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDAzNCBTYWx0ZWRfX3aVZ2ke/ne1X N3Y2/8peO1TwnkGHhHotFqLuCpnDPmvN2lJ1WlP35pTYboUcGHV+KzKpaIBak51TmmtRxHjG+q/ cuYYeszCArNGaKh2JH/Gbowh7W73QOWCuYHj/zHpgWqz6G+D86/jKzkcWjSAIEuqzJqtHzmON4X
 tLAED1QGck/rXZMCIgVftXm7diktNc3MqoGRh1g1hL9xNdDgbpsCu2LmFe0zmMyRftMhgOhW1l2 I0QA9z+2J4K/egkavwGdkEAWM5dyc1EUfIPKHvP9LnYoFuWJeob0I/P7t441wZUpzfH/LMLaZed ASxZvdTjmgCK4oEYytBypSZ4ZlfLHPS2IQ6HfBp9E4fv3KH+yGceeCJruKwP28Eca61qpF4UTaf
 kbPrqxNGUTWLfk3ObgIxgOdxQkeB/VMRVaWo6bmMfAm/pdKlWNwQt3VIcIUWsStjzws0rmSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505290034
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 29 May 2025 03:51:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9263

From: Chen Qi <Qi.Chen@windriver.com>

The '+unknown' is a deliberate design which is expected to be
overridden at build time by VERSION environment variable.

However, after the following commit, things cannot be overridden.

  a74cacf (version: export getter functions)

This is because variable beginning with small letter is a private
one and cannot be exported or overridden.

An issue has been filed for upstream:
https://github.com/distribution/distribution/issues/4627

Before that issue is resolved, we need to sed the file manually.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 41c4e227..58308b82 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -39,6 +39,8 @@ do_compile() {
 
 	cd ${S}
 
+	# See https://github.com/distribution/distribution/issues/4627
+	sed -i -e 's#+unknown##' version/version.go
 	oe_runmake binaries
 }
 
-- 
2.34.1


