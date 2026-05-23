Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9E4CD5BBF
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 01:25:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1021.1779499534532113114
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 May 2026 18:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n3/QkODD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=960346ca73=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N1P10X483559
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 22 May 2026 18:25:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+8KOX+YbUg9TvSW20ac8
	R+OQcgS3eGkcsz4lRfpSmiA=; b=n3/QkODDUgn/nL+BF4HBDhdNC7bpTdfpINUd
	0DCKg8PDMJqZBJgpnDKmnzZDHdXW/pNUs2yMiKkt84vnmMLZsMx77iV15WpO0+y3
	595mjVF2Hrel6vzagboXR7dps3/Nvet3zW5RjlfUp62jbBzNqsbpvrE+fpM11EZe
	KfiOQ/Asev9CC/SrOedgmvW+LALXRDLf/r74DQAgDUuZQSEblEL9BSGyM34iGE92
	xD0TzJL9Hn4wsHwGhOB96bbmjf3yhBB3GPqNo8i3mOa7lE76eWWQNHBeC4IysSkK
	/O0+sg+RPZhTNiMvnVakfdYunO+4Nv5Qtq12ntvj0d0sslqboQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e9rgj3yae-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 22 May 2026 18:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuHhf6MLK5Y/9fQ7rE0lLr2V14EBt5jmGpyH6AMy9DWpisVFNWwacSO9DA92F3toTrvGgLPnWnAmU94HHbbohgtw8bV3Y5acWNYzZZ6Mi9vrMcl2JPHUvrSlubPPJDppY7tJrsWuSocgPOQJ3YDRF721E0J+PaAM9FZN2PDinGP26Hv7axZBq+fxq8AUOdJnfi2p/RNZEqJPNFONXm2poxlBMxurkzQ3ZTcFYZBCPMamOmZRoQJOD0QcMtXUr7Ng8oO11RNegqivbPryPdWX6li+4Fw/3uE50FRb/T5wqgxPQ+53+r6SD9F/+GtmECkGAqP2/bFpBrdQw5VPg9Xxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8KOX+YbUg9TvSW20ac8R+OQcgS3eGkcsz4lRfpSmiA=;
 b=Y/MS4ADEm7UmtK2YARpC9DMDa5cYdcQ0BHqOXR/uGU1TW2iJ04SUVzvUbzinEqt8NMHlXGYj1iqBuDvIGIwG6ZeguF7uiOQ2Luz8ujvIxMUNqBpviW17DMbiPgNQn5/ccDCB4J9e+Qh8Y5vxBXCw/XLsuamz6qSirE22/bQtX9WcLiOfXrUervzqbVaI+y5d9nHnNXvoGpUxsOJg/hSrPk96LPa/O2G1+iNaIoxgzr/nZiMcIkQX47+ztB7bEZL9bXlej7Jxsc/yjZUrwyE0Wat8XF5KNSYy3SKiyj5ILwthsarI1XuuucFyZgK8lpq2fRrLR8EHjIrDYx5BsfZqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by DS7PR11MB8853.namprd11.prod.outlook.com
 (2603:10b6:8:255::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sat, 23 May
 2026 01:25:29 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 01:25:29 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH] nerdctl: fix PV value
Date: Fri, 22 May 2026 18:25:22 -0700
Message-ID: <20260523012522.793412-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::10) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|DS7PR11MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: da800731-e490-42bc-fc8d-08deb86a2cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|56012099003|18002099003|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info: 
	Gs0EsyQFB0k4gUSmf4rOJhVUDJEpm5ofhp3X5rJ6duDGCQhagAx1ZOFWMJXW71Yz2p3NI6AlxK1nGQ4zbvpCjil0evlgZKZsEaV9++Y+qhkDS5X6V9gwAwiYjenman7TrRu6lLUw5GICRCyfgpJ+TH65YN1PQdxa73C3FwD7CBOifnHrANWmu9qQdUOKKXylHg7yCnKCrVPjpFnm7Vr6KuVGP2bdoLIW8L7PAjIAXRFyGyaPVh57q4lB9V8/5XGblm296Axb63GSs1Bc0V9FBY+wICcMZLcEQE4G0TqyL8ks22uF6zuILmqqmexjpvscfZGXUq9miuwKG+pIGC6igjegktn/zgoyuBdF6cFM7f/gb/Ov8YG6jNK+GocGTNhn6kQr6iL7Ad9/WTzsz0+UvhNAYWPfpiCrG/K0ZcYq7Oe5G37rqs8RQocOcI0kDeLEtM5TdWjGK6TRPXA5qaD4NkIpCl8wr7DTiyupzJprJoRwGULDt6LzDGA+nvbhxmfB8XVDFS6aMNMIqdercHcZSH/sOWZ03Fc7aDL64C3byvZBPc5kVBqapN/r0/M0Nz5J1R5UY2EluBpWb5LukKH/zAZu+nWU/vzI2rVUXwHVDu8dZ35XvqP799RIY9DxKnQlirzd8RfAvmmJJJkl7+eC9hrhyQq288Mn/Xk4sC/C8Fj4oPR8+bN+TB6DpAYsBHZwkvCNDvGSJMdrFK7izwX61A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(56012099003)(18002099003)(38350700014)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TSeUV6r9X3X2RK5g9cGQkPqnbAJtgF/Bz04WwvMeF8B1nIwa9Ihr30fYy9Zv?=
 =?us-ascii?Q?L/jZaB2oBZxMObDO9tE7EzsgwKceBMJKtgs9vo05ifFT9WYP0syXKvuk31F2?=
 =?us-ascii?Q?L6uxDkDbfvOcA5w7vZniwzpjJ/1xOasQTc/Us5EuWYapj3a2luGBY0/KbY6j?=
 =?us-ascii?Q?s4zDICzx93X+Uvugy2i9nu0YnRy1Wx06QEgiPayeIV7tU/mjAzYtaTTbKani?=
 =?us-ascii?Q?lgCbuBO7U7UwcJjcEozjDY10PnUamxwjZ7mmrOGkm/+EpEZSqFkHm4lKFHC4?=
 =?us-ascii?Q?V975UfJktKx1eqcqPwcwkxzm8RbNoiv2ZI+TacwWuQr4WNQP/0HUor6CRG+x?=
 =?us-ascii?Q?u66T1GFSCid/ISn8FibM4QXlx9GqNGTAdiADsG7IkNqTubQJCws6OdhUT/qN?=
 =?us-ascii?Q?7YpB5MIeqW+2Jka5opfHyxp5L/dQoKRMmJp5pWxPOVm5rBc6bBUvabqlOlvK?=
 =?us-ascii?Q?Xf9OfvHEGxXTB2rAlN2ThPey0J75XJYhNKlXUeymxVi9tMR1YjWFq0UJ96ml?=
 =?us-ascii?Q?X/lxu7VRkaLoeKpEp6AtvPgeWLApy/LTaLngmo+oxM+Dc6rQx6irgfTh7Cu9?=
 =?us-ascii?Q?kVy7xuLmKlzSD/83z9rHfrzbNNN0mYAesznq2WCu6ZbS0h8P+PrdRluWlR9r?=
 =?us-ascii?Q?Al18g1minj/PraIvYRuAyYJ1raoAO+ZaduSAl1odS9TvSj0T/5wMZjqkFwGJ?=
 =?us-ascii?Q?zw7cEVZ6HIldoSZGfWuZNE+fxtoPkIsMlUOAiivMS7ZGnArsIPHnbUs7c9TS?=
 =?us-ascii?Q?tAzWVUw5Gi2V3uTywfxy2r7ZXLYoZA53c1uP57pq4+Y5ahUA53gsSXjatDEb?=
 =?us-ascii?Q?rJk18YOtj3gqyIc52diC1aMRlWbJ91g8OlSaALZdUSXjPtTQgQjWDObk+/A3?=
 =?us-ascii?Q?S9uXW1CrDmuBDfWxk083FC/NHUzoN6DSRk+D0xGEpT9qgMHTtlYCFloJp1EH?=
 =?us-ascii?Q?IBhRyURb4+cdnqHGoJhL2wW9zF4+4BdydbzucGFMBtGTKfKV4EE+Ub8d+1Vl?=
 =?us-ascii?Q?Du7fCi8X+/fWVmgJwpUCaCLUSwB4lYEsMXQVNMUpQhWXTyW2xw53g/xPMk9X?=
 =?us-ascii?Q?fn6tzHMCqcBp3a8mUeC1gf0/LeVfp8OftQ9Y6Rn7Hve5GLkHyU1YJQmQQ9NS?=
 =?us-ascii?Q?hj4EFgHUV5glPB7poVoRZIWnmxZjfqg4JbQk8LRA8brRPE94zTtOFJQxrepZ?=
 =?us-ascii?Q?5Y7IN/hZrzMdTJuSGtOrh1ENHf+Pi+1Ht6jRayGfysT0/mOSJpb11aUJskcN?=
 =?us-ascii?Q?GfkJx/IVmT3Zg3NjiQuyl0abc9DUkiQMhXON7Ms41Z3ry1YJmXIQnLFTe0/8?=
 =?us-ascii?Q?HTbnkI54XAcvM4F1NDL+M0rM1/SwYHVJrj+qhRRz6zLjVS2uDgpyRkxWdPs7?=
 =?us-ascii?Q?TnmwbBW6i9BhJoLQqEXO12CosYnlzR8n7DgFVHB3p1JlfFKnQXnyWOYXDcDH?=
 =?us-ascii?Q?HK7FDsY2mmy75jj0xGAetqoFngmsRzWlVtgKe4JwVfUYmZF9v5mDqHe2vUxf?=
 =?us-ascii?Q?XjKoHmHm4pXa6giImIoe/1iZ2UnWqbNN87kJ03ckQ3CX2dgpKi09O9p+PYwC?=
 =?us-ascii?Q?Nz+Z1nNg+0oNh+hFZke3vmu9lrW9uK91hrGC+ykTuUCiIlUhV0PvimceNvQb?=
 =?us-ascii?Q?4z8WNmnx/50YOBF5fKzwDC+vfV2ARh566kBy6HyKGNukdeb4HnMftGeU7H8A?=
 =?us-ascii?Q?IBDpzNL04gt4i9SksZrpxG1UKmMh0qK9puhcPIJosplDURRbbpwk6qMFieC/?=
 =?us-ascii?Q?5jThcVMPui0WvbZzu/ovt3Bv1q0eaGA=3D?=
X-Exchange-RoutingPolicyChecked: 
	Lt0Z/AdWYJZFSSIeWGpC/aHF5O01FEOOR0fIvs6/O4eUyXUeqc8a+Nonk4L7R7Oe/Ri2nwFycXdY6wxt+6CDbMeCSHpzYjNu2KHT207r/Fll3U4qv1O2M3EuP3jIY7H5Z2AFnsiEDkhnPwC00ZWvHUsy00gkKYXJU8javbqPF4hoSMzSD3ZOYVz8FAGxOVDH4VKTuGOiGthms4uAeeSRi+BkOj8Q1HnTeCkpvSjf+c1Ac8T+sQJLljOLPQ7IVxD914p/UWUO/XqKEEe2xYa8LvIe3VybocjH4I5WEOy/NXOzOA1UiuCm2ZeIcqCkZH0IArJNVa8kaWNxjI2e7/fTYg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da800731-e490-42bc-fc8d-08deb86a2cb8
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 01:25:29.1489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUA9dqqFEVJxJ/3NpRlMkKzYsCPix6PW8QCLGIY8z+sDKK3zNofOw4vFaWb3p6Pj3PhhpBciWLRV8uerUQ1on7RAE277FQksJrNk1duceuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8853
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDAxMSBTYWx0ZWRfXycD/V57BjXiw
 N00tOcDx3Ix823iDXN5VymVPwD2V3eER01pOwLbpnoEFWROQ4mQhIIxg4q1el4A436W726KjhxS
 3j0dOPq4F9rPOlSAsglryrEsRuU2PufE8lYTZxwLGNSQOWoXCUKnIogeyTYpIULEC2tmg09GgS8
 TJ8xStEajuM3NSxmwGuw9VB3bmyXFRozAgcD+g6d9NleDhJGEzNPeXz2Ett4YKQkq5VLi3kFy7O
 Um6+9MXb4pywkV4YWAsu2Gnc34XOb7rcqS9OMcH+WvsFu0sk0+fcrRVyIhC1ImW6ssJgmuj6Ey3
 EBni4PES7tHfvMRh0sSDMXYBfPhQWaZ8UMLEohPj8y57G6QlzF075qFNcgQzswfAINMduIIx8G+
 AfXiT3Wgu5rx045saRqCnOYqFPPWPXesbo04sKJiUg+P71IBKCwo/+xB4bewJI3AcmS+S0fMcmM
 /L+TTWMRB2VwFogjg1g==
X-Authority-Analysis: v=2.4 cv=XKYAjwhE c=1 sm=1 tr=0 ts=6a11020d cx=c_pps
 a=M67J7PRCWxeF1x+4vZEXtA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8Ad4tvYqdmIA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=w-b7ijB_SMik58dZssMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -04DEwA_qo7sYyO8DBRC60KfR8D211Jt
X-Proofpoint-ORIG-GUID: -04DEwA_qo7sYyO8DBRC60KfR8D211Jt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605230011
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 23 May 2026 01:25:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9802

During the last upgradeing, the source has been upgraded to v2.2.1,
but the PV is not. So make it be accurate.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index f73667a4..143673f2 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -40,7 +40,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd
 
 GO_IMPORT = "import"
 
-PV = "v2.2.0"
+PV = "v2.2.1"
 
 NERDCTL_PKG = "github.com/containerd/nerdctl"
 
-- 
2.49.0


