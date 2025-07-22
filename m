Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02D9C83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 10:17:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8929.1753179439283866859
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Jul 2025 03:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9298947c17=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56M2Jqu23269556
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Jul 2025 03:17:19 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqt0kbb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Jul 2025 03:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dc5th1qnaFqAeO75VPCBC7Nzw6ZdapamXdRN/3QRIJm88TlSb0BaSihrKo+V6CejHDjyNy/rr9tZARYSPIQMfd+9tLQ2733+LY+l6UfvHO2BtwYvu924GpuWUNryAO2W0cq9LGSWj2YbUX9wChIjSedZdb6fwRalq+C2R9yihBlE6L81dqX856ZYWFpT4ba37IxRi8jC4jbf9FghJj6pTgnXwP0tJZFZwGwqvNKaHbgRr8r2Anw8AtZcejJ51ukgUCe5jmHnpOlqkQEqbyV8XV6xba3Cw7SPAffoZYxt86nT7snd8LVnGKYVYW1oGswfLdwMs09GB2hkprYZJfgaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p79IyjoQIGhPhoZetFAk+QwfPAuSQw/leLlgg0wvZz8=;
 b=brBtlI2vPnZhK6T6Qp4183OOoMceKlMRop2SKEMe14bjYcNF7PnAhQkdxj10XgNVs1a0b141VQeF41RlRAVQOLvKsKDlx30tAb6UklPKpF49eTr6DxBz7QnyB4cCp+ikhC63PprAL0qofklguB3M/vMP/pn8lX3aX/2Vv1iqCd0s6ikKpO28THCc6mhOwWE7eYC5Cc6kBJAzkwXq1WvKaJVMhbc/kdVlUG62xpsDvKueNWRNJ18bBqCoF7R6qu42E2VRyvorDnJFnO+5R1PFlJOaUVhOiMpAcX5G8qxMo2Wr0DPt933lcV1mRYPPuL2fB35SzTlV5KOlFZXuZp+psw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB7337.namprd11.prod.outlook.com (2603:10b6:930:9d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 10:17:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8964.019; Tue, 22 Jul 2025
 10:17:16 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] containerd: drop CVE_VERSION
Date: Tue, 22 Jul 2025 18:16:48 +0800
Message-Id: <20250722101648.2113984-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0177.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::19) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: e123017f-0006-4066-0694-08ddc908ee90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/fd8dlqn4tSiH1Zv3SburvRCeRHFXGw4lKbatd6Wr+/zrC79wXmjW7WD263a?=
 =?us-ascii?Q?ZZva84zFLqG2K2hftDLA5nq7E2VQZsG/7wRBRRFd2MHXp6biNfetwOi556+5?=
 =?us-ascii?Q?xDhF94onmuHmMh1CUPomAqcjUfQLPv2u0hlHlB/0BNX1o5U2HFR0UlwJ8Snd?=
 =?us-ascii?Q?LH0ZKGnGzzrqfxC1HCqyJFPHss5Vy6ebHkwt1qSA5ID5fhLaIrK2+58aeqoy?=
 =?us-ascii?Q?anCuVYsCHxTneZF3c/iffZufd15ma8y22UFFTo0lzzy3Lplrk4GGDQfa3gr8?=
 =?us-ascii?Q?zDekskuDMN4RhxKS6MclYmLvdCd3XUZlHu3wCL99amO5Yauy1BSTcuS+p17Z?=
 =?us-ascii?Q?NdzqxuuR3TKhoH1jMNpeFcZuavkvo0cR0f/SoE8wkdSeaiqFcubWnDTZuNqS?=
 =?us-ascii?Q?h5uaOE6jan8xDG9Ft2mR/Okk4Xa/AsNdLjxZ3bdENwW+qSwQH2v/ST/Vm83R?=
 =?us-ascii?Q?lbxBK8lH3FFM8wd7RZA+h4mu/hACoxxbTOFSpXcz/NNPgxa5JMrQkHMX5A5u?=
 =?us-ascii?Q?8qmfuEDmvrIqZMwjt5MzWwmR5Z921E3XOyUcrr0zKPkxRJ+y78cWS+g8yUeq?=
 =?us-ascii?Q?9olAnDvmLo6rhejkrblpy5Dok8n6YGLngt09K3z+zo0OfE0YZYdRsG8GSQWw?=
 =?us-ascii?Q?lDiXhztoNERBd8N2R/86slzH9hK7xzJJmwWNenoqrbUj+1G0emr1HfOWhPAc?=
 =?us-ascii?Q?P9IjPjoAkf3xM00fIID6s+TeV9GpfEpj564Qq9CL3t4L3UZkAli4SEG3AL/E?=
 =?us-ascii?Q?dhds2hA6AUYUU6Gd4HgnjYLA9MINg1VfhlJkBERcWJ4h2KjkErv+SK6UfBNG?=
 =?us-ascii?Q?H1HJwYPWP2Nfm1ud7vkiz5Yf/cx4CPDWHUwtSJxNUp693B1u3Mu4OAn3iBkq?=
 =?us-ascii?Q?5usNBvmrXdS4Tjgc8iSbayDNIpbPK9Vx8eZCAlSwYOFletENohEVzFNwi4JF?=
 =?us-ascii?Q?+1fWqt6fIPV2tzLOQexMinpCbv5tVDq/H55B24wqeqYTv1VHYWxsE07h0gDI?=
 =?us-ascii?Q?vyKaFiMo9HKYN5XRVkg5zMRUu20F3rfdWu8Uw1cAsRQEvLa4W3t6pa5kd3ld?=
 =?us-ascii?Q?4+zbKf20lUfqo7Dx656IJ1H6dmn9/Tp520p6wHVk+Rbe/MxypuFzA10LoFxR?=
 =?us-ascii?Q?3aJijKhZ79wVoRdQ5b6tTcvLAPuWrJ9xYjm0jBOO233kRuFpB7GK9H4mGOGx?=
 =?us-ascii?Q?jDs5GjnQ3AqlLfBFFeCEYJ7BAvnUAFbQqFl74C7M6qvoO83TA5VJf/WxX/E9?=
 =?us-ascii?Q?RmROIif5X5sIcWCs2Dq/Fixr3Jq1qLcMlT5re5W01nC72QhYDbg2I+/GR2fF?=
 =?us-ascii?Q?v8iXkh2tYTe5papn+6/A2NdQqFShnDDsdFnelMHtoVtAFSZEuSDmwtKHdixW?=
 =?us-ascii?Q?1JvRq3o9P8Faa7O9kk+pa1QsK9y3JzOrfq7JNURV0SQDRoBnhxm4kFolnraS?=
 =?us-ascii?Q?zpmvr9i+xGuzh9bSOMIMea9pa0etzGnruAuc4Ed2EiqQabd/A1Hikg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Kq+V/Dyqo0+YmuDvsI5fftD6wI8nRNfcCkxrApq12s1JcUmmWubB3tVDCdB9?=
 =?us-ascii?Q?F/G/5XAH1/3Zy9AekBAaBT4Er2YzGlxSJ2HJ6MCbUZM3xcXM7IrCrjVkJbbB?=
 =?us-ascii?Q?2nTADurmzYKlDKKHof/rKsUSC4c2oA32NqcA+1C0EBx9ICjJJC+sF1j1IEf4?=
 =?us-ascii?Q?92ODYyir5kZczmFVwBoQlN3+fMnKAJCG+YQb+Oz8fbU6qeGAmEU2xF6DY6dJ?=
 =?us-ascii?Q?pEtV3Buf7yAOxAdW52hFYsRm+OBEdbjqFmaDcRO3U4kumb4c0Mypc85oe4wd?=
 =?us-ascii?Q?ypvJh2jchtc9Yf+qdMZ6VJ9MH0z/0N+qthtRnBKvgNWfa3eLMMFEwbIwf0Ik?=
 =?us-ascii?Q?TD1ZN0+eEJR/sBspt0DpV8V//euRIlN0YBRR/OtyRbxWJMzpTN9jYE1KF/3D?=
 =?us-ascii?Q?Pfwr9J6hPzBnHmj3XLWTpeerPreW0K+xuM3SGR1I0CMn9Z1GMhXhg0IulzvR?=
 =?us-ascii?Q?bP95M98XvRTzq6d3pItlZqdRlq/PZaKk8VAny2NcrClLVILQE9vL6d/TJLic?=
 =?us-ascii?Q?tplfcen9sd72dOu+sJcWojuX6bzwiypaj4pkW++aH0OGhKjRVbGlZE+iUXnw?=
 =?us-ascii?Q?Rt3s+n7crb64m4vWap47/408Ttgy0NyIc2zi+SfGHYXx3/01l/7teuhcaC7q?=
 =?us-ascii?Q?0khQAe+EiFDDQ66YIjZFnFLtrAfZtE2/07RNyYtNinrNq0hjfu9LZ2Xa1WyH?=
 =?us-ascii?Q?idymP2Iv+Vd3UvobwNCBFx0Db6Xjnta4kRq/j/glT/yxW79n3vY1XsrbGD5x?=
 =?us-ascii?Q?ZiCb4yqyYlkGrkPPdLebUMYaPCCL6CEtzxm9DOS2GAgF9cCHXcflwSeLDhD3?=
 =?us-ascii?Q?QdnShVzHdUhNFx8GEoFyvM8t3qt+GCUZX7VSlN/fpXZb8mOhd1jBGYl+Q6PM?=
 =?us-ascii?Q?ZIcMzqYcWobEBcLbcBcUiBZW4+SlVSuuUE+koKtzWUzyS3Hbfz+hR7gdNXI3?=
 =?us-ascii?Q?iXcx6qR6kPHK+lIRHZvSVp5fcK5e8yoxQJ21fX97PwsxFK9GkwZ1WdwRMk2A?=
 =?us-ascii?Q?fh32uY76/slknTRxhdEEgl6zoshw9Ou7MYqorImEM5lwb54ioV1huEeIm9oe?=
 =?us-ascii?Q?gNAoPY7N5LkNpE9CEq5uEUsJu5Y6qtY5sAqF1fm0ZKglSEUDNus4lXrv2TO/?=
 =?us-ascii?Q?Nn/0J7hYcmeYHefXDS0MudNrBCyN64rm89kPrOZ36GlSeehADEUwaX3Aix/z?=
 =?us-ascii?Q?NAqkcSFGQqSBDGOl90gi575PGUaqHkgUIoH5PC8jjugT0qF1og0nS2mAoeeb?=
 =?us-ascii?Q?zJiXQUQz8/3JgEEuvW1wIKy7hPbAiz2k7N7LTgBr3CbPhM3ECL1SoNAgi05m?=
 =?us-ascii?Q?uQTCS80G1uJ+SDmXTs+1wufDGQkWbjxPNwm6iVDlvv8u4pms1nyciEZfYAsm?=
 =?us-ascii?Q?DGPdkNEHGrLdHSO75snmT6doOoB+1MTnQultKYa4PCkgipTH6O/Hkl9c5luf?=
 =?us-ascii?Q?a0sXU6yoPRyoAVRbeuhsgaBSe7BJPI75MwD7ibXi5SJhDWpvrTscSLLIpvrf?=
 =?us-ascii?Q?01YL2lbAzlCeBTiavtnF/XQc2eKC38fBe759d7L7QGvly/Qhkp1PCjL7LklS?=
 =?us-ascii?Q?OV9knm73C4/BXQ/51gdqiuP18XR6R7VXV3x2lH1Yh9Ae8btgCHelOc+GvJYu?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e123017f-0006-4066-0694-08ddc908ee90
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 10:17:16.5728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m43+y1nxmwV1RnuLZSjAW8bf32u1t6hLwGSL0fyNkg/n0lF56UnHVFpUy1Wa9MflzF+tabZAone42QK3sgQUiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7337
X-Proofpoint-ORIG-GUID: Rl0IIR31u6jx13cVN9k3oIR-lmFtuuNQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4NCBTYWx0ZWRfX4r6EJYCRXSsK
 6O08t0Q2OJ2MqE/3an1qt2ok2f6UNvw0un8GOH19RMGLKm+ENk7gHr4Nrc4jkanEtritoVolw56
 whD8BtGk2tk24u2w5/xfBkJtKXHS60ZnZvK/hOXll98bUmOryKSnWoMKshtejREsBgnus/qUYVf
 t+oJFvJgjlPYSOECZyvAS3Ehpp0kzJ1Lc4dTAi5WV2NS9aAdwOecJupu/Qn6HZetYqSZn4yxbRb
 oTRkI/yTYBQCN0rVZk1Fh8dcCqiW9HF6iMACGnPEnty+2psgWt2IXdC0TyYcJNHgLrOFEImtz13
 2OIcasGyzPoqL/6lkA3SV6yDsZvcICwDzxT0VfhQrf3SkT0ewNYNUBN4jd9PNU9SXh8uT1SA5m2
 TRCuCVen
X-Proofpoint-GUID: Rl0IIR31u6jx13cVN9k3oIR-lmFtuuNQ
X-Authority-Analysis: v=2.4 cv=Z9/sHGRA c=1 sm=1 tr=0 ts=687f652e cx=c_pps
 a=XXikXukjthQYDL6FPtOYxQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=zEkg5Y7H_cRdZd1viDMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Jul 2025 10:17:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9328

From: Chen Qi <Qi.Chen@windriver.com>

It's easy to forget to update this CVE_VERSION setting. So remove
it. The default value of CVE_VERSION is PV.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/containerd/containerd_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index b1723547..022f9123 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -17,7 +17,6 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
 CONTAINERD_VERSION = "v2.1.3"
-CVE_VERSION = "v2.0.2"
 
 # EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.34.1


