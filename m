Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08215C54798
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 02:00:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2578.1709690437729565783
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 18:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3795de5e65=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4261o3dU027706
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 6 Mar 2024 02:00:36 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawuggc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Mar 2024 02:00:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFpLvd9Ht9mRRPl2KACey2BsYmTrkuEPXZIgjnvvhY9L6omxMr/g6AHZ+ZTo2gPiXR9C5Z7xKTTfi9RiaXKJMGxtZBAjUmvMzMYsUOBDaqntPBGCEC8EsSnQGCOkdyvdjjAAoYuFju1dzHqHyJBrTh/cGgVF/Vz3nxODjjvrzN7xb9wmXYwbkROuXsIuh8hnoRBhLLHhPt3Kig35v74bDGgDJG6NNLJTbGpi7vVGy4b/RMqY+ROAj7onvlNb2MAKil5k5jCcHT8dIasuFTAjdgbOvZaynxlLFHorcL6va8OfxEJpcGiVDR5xNN9cvFotAmASjkNeWzGcQgK2zTUPZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3Om+cUtUSuh7wZDjSs8/rTO0iVdND4fk12Oq3PIEIM=;
 b=h4ZhXcZVUG2spRISaq0pYIoiJtbTCgFLVQACIJkvyme0v0BUl3mM1lon/I1mVwIIfpdfi+090yHpqZ/bAfsc54MiFr9aKUpYO/bL35oLG9IPokvpJ6r4lM9Itek6HBMBmBydlsVF7Uq7R3mLDzPLD5FOeAWZOYGjzpPkw1y+w0eQjOgvdXpqYFG5RVcUqcpnvFzV6QFPE+E9nIKjx2kTUMNoA0Peup22I7Io/l2DGswO31b+HRPEIEiPPC57qvBkxdnoGeRdu+1rUVInj58/iakbK5i4zqb5/XMBPvMKKjZVDgozk9KIaJflJeB6ek33szbG6CK8eOefu/BjHcNyRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 02:00:34 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 02:00:33 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] kernel/cfg: add CONFIG_CGROUP_BPF to docker config
Date: Wed,  6 Mar 2024 10:39:58 +0800
Message-Id: <20240306023958.3779337-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 07db8654-068a-4f3d-fb90-08dc3d81356d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1wMnQwypZDfRZlcjmMvA9VO7004kT0cdmGqiQ/10hJSfe/nkYmFDe9cCwCcddQO+aRlgMWM53dddWhRyFygCXFekA5wgBcr99zEDfViXK3ADz8f3K7aCzqXLm9iLE487ZLhm2bsi8Rc9dn4RdVUbRYLgP7AN19KsOMY3BwVG1+XzK5rxj96vccjwextSn8Pbp0ePP8c94HLMlhrINKCyJCtc589ejHYKOgxxOSBuruFHETgTZlZVvCG5u+N9oEGL3R9UmGVUbQBCQ+P+OY0tLYPcrD251pYwXSp2yoaYGLavRzrunJTwfPAJ1RsDE7Hiol43ECZV1DSH4w+GrwhCPsdbADzisVYUHaJqQiTzydgt4SAjVhPLPA/qcnwJMc1h7JB8jMH6sYtOZSr8hm80yodjGqDlqkUY7QjgTfO0sXVCHyqVicV89PDMJNKEKrYSZvpgvmBN0BNu8ltJYW3eHvNacLFKg9238tW3ROlm6oPVoMbH1DwwFglYItCD66CLKLQnT6pE7l5vINetmKPXn1Gj84SXmtBE1zAfEn4BTG2ng9gQo0JLHgw/3l9YG4c7l+QBcH4EQHM2HaibMvqpwuRSELLlw8Gm1oFn4Stq+I0VpXp27QurLICa63MBV/HE3sAsSROT5dihQ/r0ta6jgaVi2QHsIA6by6D01HE6GwQuZ+rdkXQ7KTjJDTRXIQJ8ETKJHYDmmPnM878m7sG9+g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?biIkbBpNUkeW7XAFWpcUx13P5BHRLPhOHABHBxaY35u75ptMIJBF89O44dKs?=
 =?us-ascii?Q?+TiOZrDT88Bh+VyZK5DAFLsvbs2qZo7m27mIzsxsPW3GQEVcLDAX0FvKXEkq?=
 =?us-ascii?Q?EmfRt0ZEg3Hxao8mToOkdz4UrPS0xPR5MlGNnBexsMNWFQgcNLpR4mGkbfM5?=
 =?us-ascii?Q?4YXZKTYiiPeNAW2R8QvpPJtzvRUfiWxF5WMBWBkOdC/jf5dmUma8ut0O7hEG?=
 =?us-ascii?Q?TMWK2OOXgERdvZkSNzkJBTCTujbkdjYF55ixwYqTmnaOWcCU2uVMkEPoFJTi?=
 =?us-ascii?Q?QCXpuC4do5xMFSr7m2RY1uY0zTqoq23Y6PEWaWnrl1e/RBTcGSqdrEs4mRyt?=
 =?us-ascii?Q?ZLQjq/ger1YhaIh5MjZlHvlP2eI2qglmgdhkMqIkXmt9+DZJzdv0JMDbfAoQ?=
 =?us-ascii?Q?F2EDnlICc1guzZpuqU+06o12iat233thQzy2rWgjVhydR+uPWhuC6mOfjZpy?=
 =?us-ascii?Q?Vb5H8zKmgrQcv3s/Aams+bgfs3oF1Coev8rvyaErLZReoqIdigUzudp3W6ye?=
 =?us-ascii?Q?wpbBTs4M/yUffKKkBjTDl3KAkacyi4ie2KWR4Q2uwRV/YRfBD9llfjSAuWTq?=
 =?us-ascii?Q?3yFTjLTnKkPZud2ZqePlRRuF/rxcmY6fqXsiK4SI+JD4uRvJob72V6mcCVnr?=
 =?us-ascii?Q?4kfmpwxDv/45jQ70u2s6TkRV9SyGjxzYHjUQ9t6RNM6DOLWVrKMUTI+2R2+W?=
 =?us-ascii?Q?aKY4AjUJl+tXvziol9ufEpK1+ZMTdodSz6ij5HaIDMruEVNfXEGvIzyqhBjA?=
 =?us-ascii?Q?dyykSgRo+nAKFU+GLBaOmdqH9duHoJAcvpPCxvqXIT/FYjx4+c0GQGH1CLDZ?=
 =?us-ascii?Q?OISSxYF8/i5Upn3n70FtgGUj9sFF/1zwbGfgweNjJ6Eo2azxHqh5fNm/XWkv?=
 =?us-ascii?Q?kdYeJ1C7e3gi24REJMSOnHnLlyB7GNAdOB55VwXsBTQkhKTRmxR6t1itCqGg?=
 =?us-ascii?Q?65FN4lzIl7PxQzFz6EHTyNjg0aUxSQrz1giBVx1A1yQH+jMYE/D2r3mlP3Ps?=
 =?us-ascii?Q?TbYwBJ/fvApT7wmWMs68iBv6DPKyUNR4wKjDyo/OKMaQuX3sZ6XbT2WDxka5?=
 =?us-ascii?Q?FcbthaqmiSyyV+41DVN+gTtSkqF1E3AaAkVFJJgid6Rs5QSxHUoREHo8EGTw?=
 =?us-ascii?Q?igcBWtFEHBJNiRVhqRLfhfZld1IZVo8EdlzYwKti2YveKi9rN9/lkZDrd8ar?=
 =?us-ascii?Q?cPN8H2jKul7xYE0YBr7BXlpgXn8ZFl8Du+sJrFjjXoikWwonXN2cbW2DHzhJ?=
 =?us-ascii?Q?4gtUk8pwjcbpGe7/RoZEd3SI47/JNRdp+vXRO6B5dud4nxY9X2TX+tKDjLjH?=
 =?us-ascii?Q?l9MCe17Di0M59V3lqAJVzMWbjhMoZmdlqeYUmRqlQwrbdYjwgn6mDl5xcWel?=
 =?us-ascii?Q?7Qi2TAeKZ7ef1ooZRsNzdx18ZTTe1HhHiTcMu00GplWBOuUT7eFEEpu+xBQD?=
 =?us-ascii?Q?liA292xSK5N6oQUvU5yOISkpYwBLVpagQM/dtxxcskohZq2FyWMk8YZhthto?=
 =?us-ascii?Q?sE9ktY73eFrCNSpkWEISXEw9Xror3FNHn+37yTkuly/2T3I9YB16cMY9qQ3F?=
 =?us-ascii?Q?4FaT7uHG8iPY0twmuxpKZQGNlYMgevjjxylLoCNc/hpy4NoYLgwcQuM8nwX8?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07db8654-068a-4f3d-fb90-08dc3d81356d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 02:00:33.9302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOSzHukj20EhyzVDQgmyUKh+7zxtvBcS+Ir4SSmxKGtBSmDc0tSyMkkQjSPUIib+TN3DkIlw+5K9Ne5HZxmj0PiTmdY4deWOFogRQvXDUUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
X-Proofpoint-ORIG-GUID: pNE3qfoCJiMNJ706J9EHvaPVbcPrnkHS
X-Proofpoint-GUID: pNE3qfoCJiMNJ706J9EHvaPVbcPrnkHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-05_20,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=914
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060015
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Mar 2024 02:00:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8603

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Add CONFIG_CGROUP_BPF to ensure docker can be started under cgroup v2,
otherwise it would report the following error:

     Error: for ... error setting cgroup config for procHooks process:
     bpf_prog_query(BPF_CGROUP_DEVICE) failed: invalid argument: unknown

Cgroup v2 device controller has no interface files and is implemented on top
of cgroup BPF. To control access to device files, a user may create bpf programs
of type BPF_PROG_TYPE_CGROUP_DEVICE and attach them to cgroups with
BPF_CGROUP_DEVICE flag.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-kernel/linux/linux-yocto/docker.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-kernel/linux/linux-yocto/docker.cfg b/recipes-kernel/linux/linux-yocto/docker.cfg
index eeeaa242..4d8d7e04 100644
--- a/recipes-kernel/linux/linux-yocto/docker.cfg
+++ b/recipes-kernel/linux/linux-yocto/docker.cfg
@@ -11,3 +11,5 @@ CONFIG_IP_NF_TARGET_MASQUERADE=m
 CONFIG_NETFILTER_XT_MATCH_IPVS=m
 
 CONFIG_OVERLAY_FS=y
+
+CONFIG_CGROUP_BPF=y
-- 
2.25.1


