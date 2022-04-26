Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CFCC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 04:25:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.2404.1650947152042067207
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 21:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NkAwDJvk;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1115f13a8e=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23Q4NiCm002400
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 04:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=hy46vLxmwNySkQVclNsJFeLmUraBU2N+8gpCSZjfW18=;
 b=NkAwDJvkBKG20BcYYJUmGkBskfjXh812lJjhoS0ynxYKnoCBSy/TxyyAJcDWqQIuhb7y
 Y6veDOjYpR7D182nhFGj077abn40RTtclQ+v63ubaoLbNiakNGGEzcF3uoxp7v85lNjN
 NYwaKQJrkqrCflATGHXsQlKqryfE8jlhib4UecnzWY8PeI9QwcdYFnukJ+d9lFIw+eN7
 rl9siwmXduDKw3zvqqrSCvo1/dYRaDgpO3+i3vMvDLiu4FV6yiRsNfEgbNw3cjMOdWlT
 9p4yfwpeFkVps5b/kDOAPxrnd5dggTHLsdmaRUkBusrEihMEPqjvUYAz3pSv3lpafG2u Ig==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fm6p225p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 04:25:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kn6bb6SILH1LqcqavX6WQ8+8WRzrVTo8BBHtDBF5H1z2NaNPCn4X6U7UOPRGr6D1ReIkiqoyi1y4h7pO/24Kizo/9w/ZEqEJocbHaA9xVy4BAz4h0mYxb+Q+jMIQ7jSiNMzfRbyjwHvssCyfHwskTJZea9ZBRYeRl9LFDjYdr+05GQqEXZ8aFx8JT3Cuw1R3JB0qm0H0ltBH3hDfKiqBwPUZMN7ecMoyUOLhxbG3PBoYlEpKFfNJQct7JfoB+/SMqrRRWfGiiZjiIaRljGB6g6FJ9jT1ewgKrOhGA8Aujj0snCPhwe0hmqFob3Bn8xfF3ggUjKAoiqxudd2vSp3RSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hy46vLxmwNySkQVclNsJFeLmUraBU2N+8gpCSZjfW18=;
 b=aSafomp9ITfEQKWjfgTzSyKqffnJ8l/5iuTdNXxWs+pBbvhw5dW567w7rv0I5pgcbZssSw2EUi4zSfm4SKV64dcvKC7GSz2lAglW3CWz8ikfo2xVH39czuqghJ76OqwcnKBBKAqyErXnZBhlRuIceFpyQTt/6zzW8qXrjO7JFPrlAc8CLE2jSLcyk7vXO+uk3JUj1Dc/r1Z79/KkHrW5xG0+OSkyM/nH/V+VihwPZhffzzy7lqhELPvtvQG9SRMQVjb0yydTRTNPcsD9UHVYBOvD5zn1tYi3OBawUhRnoLZXOnP6edKFBg7e/iboS5eNVV5ehlO824cSOv2eBPQ3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN6PR11MB2606.namprd11.prod.outlook.com (2603:10b6:805:55::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 04:25:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 04:25:48 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] containerd-opencontainers: add
 CVE_VERSION setting
Date: Tue, 26 Apr 2022 12:25:34 +0800
Message-Id: <20220426042534.5132-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0175.apcprd02.prod.outlook.com
 (2603:1096:201:21::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5189ba3-ee52-48ec-1436-08da273cd6b9
X-MS-TrafficTypeDiagnostic: SN6PR11MB2606:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2606E9C2585DE610265E2566EDFB9@SN6PR11MB2606.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UC6ZwYzZ8w/11SSvwBd7Jgv+tM21FzGUnX+UNmazABHaeJw1hCLZF5Tp5ppj4XezWzaigqkaBXb8dzY8LY5UNe+82RFVUy3gr9mCzYvfKCXQQQBaa/XphtvhcgCsYDhucBObRMACqun8fDOuxMg365dWH+1qV7sPYKI7lds75DhlHHSfDck5sa+G37BwCv5+ELZvL6zaR8d3lFtgy2288VOwRdO+HW9l0rRNn2NQ5Oz+UFLYlufVLuZ6e+2zxiHL4feJcEceYpyhOiaJN7WDEjL+uVTtwYyxewSU+UTiCK0n3ynMSZ+uCiA7kfCjdakdMCukaL4z4nvDiMRnsCs+HpSjPObymialhC7WB+97habcH5x807xBFdIWPwh63f6jKCdro77o8RVOkwpYTYc3rCzE0YYEGT1LwlYI9XT70XoIGrdDM4xFDAHEbK0nfNctuRJ7eHg11bMhB2KItPrNqNpc1weONXYni/EThCPV+/LNu+Laq4WobumVNTLL68+yzg2/Q3+ouZt+pStr/uTUaO4TcvNcH/fWA2yUVEzmMJHzTNxRJSuB/9ifraZEzLhmDVEN95TWylaO60nJutVn3abFBlZC7ETS6kw5Bh++scxEs5qCzl2+9i6yFhv9586+3wnE0rhwEy6XN4y9cU6pNxNvT9/zrSkU/u+xU2jfcCvhx60yq7GvHfjfH6/BDJWdJC6RCzbtvEVqB2nw9Kv5/fll0GfvdgHoojOQHQ0AN9aWRAMnOZ3a6sy60VCwV6VxwiiBONnkwz1Pt2KAlApbTy8Whw/sysMoktNGnjI1oc8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(1076003)(6512007)(26005)(6666004)(6486002)(508600001)(186003)(38100700002)(38350700002)(6506007)(2616005)(6916009)(966005)(86362001)(4744005)(2906002)(8936002)(36756003)(66476007)(66556008)(8676002)(5660300002)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qN1eQB7aufjSBMApgPrjg58otp4AoJL2biVayM/yN4LUWoh3G6NN+XJyKC++?=
 =?us-ascii?Q?C08o2G9We1+IC9W58j0/KEVaxekfclc2jRFsCa70ELPmeHinLBDzlEwofOyD?=
 =?us-ascii?Q?RsoT8dDKSDSICZMDHQWw8HMLhgqR6uV0+Vb2YAv+gZqJsu1AbWUpv5o//gBI?=
 =?us-ascii?Q?XJu6NkrIMTjcDC/NslS7XbNPZ2SMiCqeO3fhvT62KtZILHaQUj5Dkj8NCI0R?=
 =?us-ascii?Q?ktUMRwkgVmamcm/A+4IjmLyWCCWF03kkOLfoYARm6ZYrSPkwCq6d1os+5dTr?=
 =?us-ascii?Q?yreZcOBM/GiYjShkKYanhYmlyOlclsfQ3otD54alRQxwyF8RUxLD/t6rhSW6?=
 =?us-ascii?Q?DP8NxQE7p/HTy+HqsnzPOiVoxkzrV3cMD+b/JDva/QBAuR6I7iYvODH+XS5k?=
 =?us-ascii?Q?TDpUT5rG6JtkL2605jNGikiGv7rPKeEIvbjVrizdzCVO9wKGoE+a6zvqrfQB?=
 =?us-ascii?Q?Gd74KtJxLyg9STXwmIulZOu2THZ0Nav//peQH60i529d9UGhfIUrrOdcPtZL?=
 =?us-ascii?Q?uer2bjlP0a47L+/K5Zwz54/sfmOM5MrxaOOLgG8iLK9IksY0Nr1j9vL5cb26?=
 =?us-ascii?Q?faWhjSBbw7/pwjW7GBR1gXmG/8A8cQNng4wXBUPtWtOv2iE9Rr9k3jB5h8s3?=
 =?us-ascii?Q?t+Uy3C+mhSvheFVQYUx0tUXTy9Zkpo7dWv6DDQ1iW9bEKFtrUVrUnJ9yzZsS?=
 =?us-ascii?Q?D4c5+PIM7fLQKN2K79bYfSZyeOkSJTeFPAO6Fs995T1gSbwojuuowrNssPcJ?=
 =?us-ascii?Q?OoCdwk2jO5nEFmLEIkTJZbGE4NmZTdo1I81amPo/2snFgc80b4CEVZf3Kfjp?=
 =?us-ascii?Q?+KR+24kADQYJVv/ZwRPCnjaeOLtflNZCGq/RewC2mpW+eH85ChN5I02dc4Xw?=
 =?us-ascii?Q?L1f+qoYuYRFQd92ElE/g/t84/5RCHJaPY3X9YEh9bj3LBjPAkVcHEbFR5qiy?=
 =?us-ascii?Q?2WZqUA803YOP0tMgca1IoWLpLJ/0iKWZEKEaXqHrxpBDvMGNkJYgv9a/ZUnE?=
 =?us-ascii?Q?lVZJbInM9s2ZEELltKabNpci1T7VkNAYhwU8IlYOJXylWcArVtedOa4j2Lug?=
 =?us-ascii?Q?PDHLMIRmahwK/KSuBYW0zHDKR8ygYWe9Btvq3vogLHWSdkqLTRHoPXf4eLMq?=
 =?us-ascii?Q?brqOoOKxNbR1nStaJ65MJAs2dZs6ERT6MT19+IGQUdr0tQbujL9oFKBDO55Q?=
 =?us-ascii?Q?NJCPDFxOMtxTSl3t8U3P3U+RFTwIRSy/x8MMmukvnNK6xfMpOuFM5b6b9gID?=
 =?us-ascii?Q?6kFoSsmLV5S/hvFDEiwvf5kp3LgeozsaoKHxIZeZ7BRzDJYZ1ETY2Mj+P/Dv?=
 =?us-ascii?Q?AxVm9MKDsAKsLI1rTGSLlqwnwSMxH09OBa6hOidMxFdPDXu1GzTxoR1hSqsA?=
 =?us-ascii?Q?FhhuVQtAcAKXCecrPDBAUXJ3OSPQhCbCS0EevMNSIGNYL+a8c7xzJniHOUR0?=
 =?us-ascii?Q?LbhoEE8mj53AmNb/5Y7XDNZYohnzZ89G8f7R+6eS9+9UU2YUjS9DMAZ2iA42?=
 =?us-ascii?Q?l7gKqmpxJpT2n4LtSOQdMwiCTMWQShjo/ACSzof8yNchYXW06vvN7cvcKeoo?=
 =?us-ascii?Q?roc7H6yF8L9JrjADARQHM/+RS9jBdSsmAnsj9/PCtDzEEVeo6JoT5DV6+hX0?=
 =?us-ascii?Q?GUdSMqK5oOJwCEHSgGbcMOFX6FWEol5qbyNZJxeOD3Uo20XD9ddBpeOQw3YI?=
 =?us-ascii?Q?lwUEQ5843bZ4+Mq0cCtb6BzuycRUZiSPsw9pGVx/LG8OPRa7jK3UC27ciD6j?=
 =?us-ascii?Q?ANm67iursoIC/hJgGy2atshGEvjX+/g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5189ba3-ee52-48ec-1436-08da273cd6b9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 04:25:48.3445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 04/slg4Nz3W03pBrWjuEvsBLl2lF2BGm+6XMvg7a76f6Dz0B9WZE+keDAr/jfk6oREMFTbbmzkuKr2lcsdeysQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2606
X-Proofpoint-GUID: b0IanwbWLkdqz5DCwS-QjD34tEoe_ClT
X-Proofpoint-ORIG-GUID: b0IanwbWLkdqz5DCwS-QjD34tEoe_ClT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_01,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=491 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204260026
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Apr 2022 04:25:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7217

The NVD database uses version without a prefixing 'v'
for containerd.

e.g.
https://nvd.nist.gov/vuln/detail/CVE-2022-23648

So we need to explictly set CVE_VERSION.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/containerd/containerd-opencontainers_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index edb5974..b0f92b1 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -16,6 +16,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
 CONTAINERD_VERSION = "v1.6.1"
+CVE_VERSION = "1.6.1"
 
 EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.17.1


