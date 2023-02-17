Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A80C636D6
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 05:32:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.994.1676611967285482209
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 21:32:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TWBw9TEK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H5WkxB003676
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=RKc1yC9qrlVoNaVYOWDWAwGdEBD4abzcBfb7dUVOcOQ=;
 b=TWBw9TEKrmiuaTtfunqabDoiXGGLloQ16P1YwOUH8PNVXu0I4KSXkvbBcEQo2u7ZjS/9
 vblDxRu8NvM1IJQg2M+sbWsgQSE1Tn/187+CMSp/DTBwmTYEZt8KC+kQzGJ4enjdZ89d
 IYYGiwwdOtKXKSwscxh6yKTK9p5v+r/cQ54fpb2KWKrV/i+Nnx2jEssvhfWPe44fVRe8
 0QwQ/JJ62tVrkNRGY/LpYLZgFlfgNKsNrbD0Jr6fIfoXG/hTwSRDayV6z3Zx4PO0x8w8
 9R6KpVKe+Jtkpv4Eeavfak200HZYpRgNdC1yLmphTO6gyzuFGfwEGDTwqVH/xR3WdTXA FA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsc1ks5q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brIsZCMdeGaRmkFJ8DTzn+nomLYSXWPf4k60gTlsTED1kQVPjAEvoAIbcdgTl12OePmEYULIVibcJ6LDrDSvg4pnnu4FDSR1C4OnN/FVNlD93ibtFrehmQfjFnhG0TieonP5fg6eih4RgzNqDZfF0RHaGREBScbJGVab+a81JYg4SsiSaTShJTiGQPxIi+bgyQmy2w/jM+f8tsK7liBkEEQQVFr9svOS2eUEd/mjkCD4IsomqMute3k/+Q9Ogrq0iWrfYciQaU7hGp1Ey8hGj8a8CH+18AiX5PtrSCfR5LNepZLe0oqJ/xHqRuEoipIIdMUMpF86pCGfcQ62tFuqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKc1yC9qrlVoNaVYOWDWAwGdEBD4abzcBfb7dUVOcOQ=;
 b=oDMjA1o20VYjU/Xsmkh0R4HQbSwSKEaZLLIqRTOhlOVIp6ngUGnepY6+SOppd+kkU7m1O1ed5dxICVPy3fGmpuk45vBDPgbKv0JtGjT7AdI5k/u2zMW14y/ggz5iykIMVBkveAC3pKYobXykjLlOYYk7jPpMjofRoDQ7EIDj6f94udBr/DlGijA6LqsZCRKfUG5EwLTQc3T5kMGnOda3mhkaDInr8Iy5vDH+UJ34cuSotBjoYo+W3LpQRcAmPcf6opjRw2TmDSYsdIiWD2voYsyLzj0VvSUcvtfknVQjoi3waVt+/H9OAYfygcncTRSg5EaElm3FFa+qOhoT0u9P3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 05:32:42 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::6f3f:f30b:e31e:1fc7]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::6f3f:f30b:e31e:1fc7%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 05:32:41 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/5] cri-o: remove meta-security check
Date: Thu, 16 Feb 2023 21:32:20 -0800
Message-Id: <20230217053224.3870-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SA2PR11MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: ab2fc877-837e-47fc-94d2-08db10a86395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YFyugWjQBMiWU2doulyV4HJ5O1v9NGL9v0DFNZBzov/mxe5I0K6xhABLw9BPA3N9wsyQUwOtc3EQHdt+V1oxK1klbKU/KZEISoKqzNGSi1stOJ6YNSJ9ytxOaPr1mMgjLAY9UJ2D8WSzGfqlI4iTyCiIC/XAFpGW5XRbM08a/+3JjfzJhONkqEDPLGW7KAGBcNRN9u6e8W4L54DDEmiNF7BDtSjadI+qwPxepfx9ptdbMpkPjm8XZsrxASh02BuPsAzcLqG3E+Ec04GqsLuNXSJRRFERapkwGoP4t3JWqdp7FnC1SIPsl9GGibEli8O1sxrUNWh08A5XL5cMPkIsOVc/2OEVGgswG5fMIHrWHtfz1nAmNDTmt0JUW1uMfdq9/bJ7n0xTPuP6yOtfCxUzt62tM3N1mmUwJ8RT8vgqdiBGVex+ef0N3srBj3Ktgua5fNbYOXq/qVfMvdvypB5SgJijzv/sy+LFtJyUXbUUbdkNJAf4xCBdNrHlKrGnlzpEWwiQQl3uHb8AwG0i037j+Bn6TagnvQvih03XNDNUzIY9bRkCRPUaK5hxocie7PyjkDHdgqXlfQnFE5pXTL1T3ST7DnhV0s8buUStY6uxJIwq2BiW2S3jS62gIpfhKjW6C89HuLCNfzfoiZoqhbD6nCJcC6bGnXkfG3eOKEaSC8vy/9ysGsSPvLz6T4ZGs5+SpINJUZSwleK2D5nIgCG+mw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(39850400004)(396003)(376002)(346002)(451199018)(86362001)(8936002)(5660300002)(316002)(478600001)(41300700001)(66556008)(8676002)(66476007)(6916009)(36756003)(66946007)(26005)(1076003)(6506007)(186003)(2616005)(15650500001)(6666004)(6486002)(2906002)(38350700002)(83380400001)(4744005)(52116002)(6512007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kTBBbyhERIdy1dPmKfO76LFF4wzwXdvhFBwpie6CAyBp1KxNq39xcUSvmz2l?=
 =?us-ascii?Q?FGf8fu2Ur7DwDrWMUgMrDKXAsdfKCMnjfiWa2V9WLafqT6gO9e67jgxYIqKO?=
 =?us-ascii?Q?Sl2qW+YLNgGBozCB1LmJlFaKFONx6xe+oh0Bh08L30z63uzSwtvoAMkO7ljZ?=
 =?us-ascii?Q?0HLlIm3IlUZZCe5HPS3QKfxSC+eMeIARvYShMc1PhnaHo5BXMorlu1JHSmAA?=
 =?us-ascii?Q?WKI/Dr6rdteEFe1MRRvZYzAuQksNOzvoPzJWdK2jqFn5CHgob/8e5d8Qmilp?=
 =?us-ascii?Q?TKrEhu1xDOHtgR3UNCZQcEczIk3xQ51gOeA9de+Fly9bIN1v4sS4Z4q5swst?=
 =?us-ascii?Q?VXTRbpyk6sK2j99y0FqYZ41sxcbfv/zpNRQdsAYgssGQ04O90ycaK8caWolZ?=
 =?us-ascii?Q?K4vs55ouzDriCHNPub9ToEkJyKh6CH5w5LkZBuqExcnZf9KSY4HfAjFsulbJ?=
 =?us-ascii?Q?6Q42CJnJ++jl1ezNhIWyiJdx8nQIJwg7Fk3430xBAQesWcbGlhB1GgGhvIx4?=
 =?us-ascii?Q?oKO4+gSsRrHMbQdVL296DinINCP7d56V04gLo1IUs8dwGMkGfSP/UHT/gQiG?=
 =?us-ascii?Q?gflDBfhwlHzFy5j2xKgyuxDwCJbpwOOIH+lexH8UafG5jtmfty6ays81yU8I?=
 =?us-ascii?Q?ed2nRidu7PTUmOdEWruKvj87hFkRhwaPUkyHZvTWOpUfj6VnJr7gNfK9Gp9X?=
 =?us-ascii?Q?6CHXHOIPGUFevkjnq6VmfN7IdyiLbGdQ9KN+2zFgi05cDH1DxGxNeROmwDmk?=
 =?us-ascii?Q?zpNF7wI/Q3PwKOqmxu59mbVsBeM+2sYyi28UABb71FIjEh2mhDL2BLYCDEEB?=
 =?us-ascii?Q?LB9SZonXMHFI4mCp+Md8uaw52q3NwtLWEFx/jtaFf53rTeTl/9kzee0ZmWmH?=
 =?us-ascii?Q?QqDS3dgzG4fUroz1BVh35aP28JjV/kOI4klIWD3tA1Sx9MuGAyzb8f2l5L20?=
 =?us-ascii?Q?KWCPnzO6lZPYcb3CGevaOgWhgJKwDXgTPhLcMcTaVIzixJT02cpr5U+Y1Mct?=
 =?us-ascii?Q?QgPVWBF7P35qi9c1DqSHOEQ6PYV4iOxgOrnexnPDPRSTxihBhJupgmUn+LBE?=
 =?us-ascii?Q?stH2bJC30rwm2oGN8A00QqWTXF+LQmuMagk87f5euJLCuYwUYGwkLekkExkR?=
 =?us-ascii?Q?1g1zzjPXkcuj750AcNPVMdJjDcmzja32TKaghIRZj/f5pidWKQxlCuY6my63?=
 =?us-ascii?Q?8GRoKGfl896mbA+Cc4CD5GvnZMUiiYlEzg+A8nh2bJZu8CxST6XvKkfMK4z4?=
 =?us-ascii?Q?Sf3PPZEoC9ej27Dp6Emq9m3em0aA29D79/lglzEYqz1Nfae5MNnOklNtZTch?=
 =?us-ascii?Q?MXuUfMzwzXk4HRzllLcT8xkxN2m7JHo09lC08/4Wd7iu1VEA7rlxwjXPbfZZ?=
 =?us-ascii?Q?VqnCYqcBKHe6zrAAfC3soct3oSkZFmWuWbNJRvVt5OON+xSaMZCX8ag3eNA+?=
 =?us-ascii?Q?Gnws39m0c4HnkAkrPf6ZHK+OtwN7f0g90mf+6Qqk/y0Pb2ooacrSSuHd741V?=
 =?us-ascii?Q?7SVluQHuW37fsksUXE0Z6ugh8Fe7cXW/gT01PbHiZLmjH3qIH5RqigF97Bt8?=
 =?us-ascii?Q?oZhVq5XmLJlpYwE+mXdojZBiqH315J5BbsMB3AzALX7U4v325VlBqiEOoxTh?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2fc877-837e-47fc-94d2-08db10a86395
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 05:32:41.6541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nt1SBD47Cx8e8Dr+YqE5f0Bf+MisF4EzFgcEXylyIXK6YV05sdML9fBW4FKjmJG+JkbDMl7bvOoNeau5PcUmvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
X-Proofpoint-GUID: bSSnH3C9JJGBrhpWOST39XJ9xG7_gG9U
X-Proofpoint-ORIG-GUID: bSSnH3C9JJGBrhpWOST39XJ9xG7_gG9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_02,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=791 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170048
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7859

libseccomp is not in oe-core. There's no need to check
meta-security any more.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index caa4ec3..66d1116 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -46,7 +46,7 @@ RDEPENDS:${PN} = " \
     libdevmapper \
     "
 
-SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'security', bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d), 'Depends on libseccomp from meta-security which is not included', d)}"
+SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d)}"
 
 PACKAGES =+ "${PN}-config"
 
-- 
2.37.1


