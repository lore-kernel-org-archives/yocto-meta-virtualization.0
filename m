Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1917FC369B5
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 10:04:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.46224.1744625050181606677
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 03:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61994136b9=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5nrET026886
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 10:04:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yf58htsu-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 10:04:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=up/J4iaWp8HNCEdWebAcJDORiZ8gdzB8DqJa1XI7JcbCTilh640A7YxL1bUxvWFPjYZcGEZG+tiw0R5qN/FdQ8sZ6+c9NXc1dLZqD/7OVpPFpNba3Uix35VnEYl98SC8NgNuY2yIlP2alGCOz75SBOlervB0kK8eok0PD3KvhPej1ZGu/04KuJu+VJaVxYQvJkvoMtziNkKGesohR4okNxxhJ1thMjHQS+14aIJz8GhnvZO0wPamcnEToYS7PrILf6aIaN8hIDJja1jX9YisCJXfqFhYi884xhbeEI2icDPspZO/uG0D1sSajzblOcoc5K8WXJZMbC+du+zwV4d/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waXCoQ4Y4triKG1lYQPL71P5Kn/cq3M2XT0YTtRqXGI=;
 b=AjtokNYsulFCJ+IhXtuFW5wNfTim8mgev3nBxSitZW1m1stZpnUt2Dmmfv1r+yVXuQ/Cx+cS65R34F4KQDRfv4Uj6q4pxbRaFFYf2HFQivEy2RjQI9MMLVr7p/yMXRZpyCjcFNtKaefFtfoqMpW2c730OLy255Bw/GSs59BbkL/TnEfffkdYOImsWZwza82dFnXfiNeYE5UM4IAgC3lQE8IbnmOcTcMdf2eDmyf5VD1xkvD9/aXgYNt5AFcP5iZyP3SkgttsbBpK9a58OSHryAEQQLERma64UqLFEVSD/n8ntx6Vk4d/bKYqLi7X0Lk4JS3E2vLXP5vhG4tvN59Gxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4686.namprd11.prod.outlook.com (2603:10b6:806:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 10:04:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 10:04:06 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 3/3] runc-opencontainers: upgrade to 1.2.6
Date: Mon, 14 Apr 2025 03:03:58 -0700
Message-ID: <20250414100358.2940529-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414100358.2940529-1-Qi.Chen@windriver.com>
References: <20250414100358.2940529-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB4686:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d2c0e0-ba8f-4743-28e8-08dd7b3bb0b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AGT+h1ry0xauNUOIxBFLHuKghsWfwjzZSug+WGswS/LEhJYvs23qO99rwLBj?=
 =?us-ascii?Q?J4vbe4o7d/EqxF9varQqmoHHXz9DZP4AMGHUoCCOsHK5PYYjnEbr6NeUDLIv?=
 =?us-ascii?Q?LOCEYgVW7K4kKx4yScxsqBY/yWNh308x71diwpAhOPWk1s08eDx6m5kQ6Oi1?=
 =?us-ascii?Q?4c3D4++lCDBzz7hGN447Yoab/cgeSiG8cQB/SmF8q7dXEJbQD4QmxgjEaKp1?=
 =?us-ascii?Q?IDPNFyWX2EcOlaOtSh5sYo9ShtRhFrJbDuzjEBDoilZ73wazAFxVnD90R3Rc?=
 =?us-ascii?Q?xficH7L0VEDw+q+IMmmAZpg+CucGSBIXaBpDCroR6xum23CrjiuFmO2q8LG1?=
 =?us-ascii?Q?2DFEcPF9FHZyfbhMwJ4ftn1HrYra0gCiVP6NB6w0iy5+q1udwexe8xE3Xj2E?=
 =?us-ascii?Q?CHP1rWz5LB88RB8Bdtt0dgxQgZYUe0r0vMV/NMMJJWsBdjfrf/Pe5CbamWOj?=
 =?us-ascii?Q?MmnROMNRMvFitHjf0zlnONXu2wIY02603y0Cvbh+JAgxw7GKLx4n+8qh/Txa?=
 =?us-ascii?Q?DjCea9TRa6UwzCF/2AiL6OHb+Nq2x+Yu0vQVgvHadqobJGc8t2bDw7Ladt3J?=
 =?us-ascii?Q?n3ogItH40TgOBTpFuYG9K575zfpW4t8tFlVaBOCh4hXV/zp+P1zvaOzY3/em?=
 =?us-ascii?Q?gM9cunZtlsBZtXSNk2VNvMZCw2tzyWIZQgdhoF2Z9b8h1NPM34PZyqwlrREi?=
 =?us-ascii?Q?xh8gZYxCEW7MqySUCzQ6Qw8b3XrwtlPpwxkKjTiVwr7KFr41kgcLjPeZWqpr?=
 =?us-ascii?Q?Yhrv8luapHBJx/qXzq9cL+UXQgX03qRFVGV5TOR+IH+3p3mRvA8EHi54XOKY?=
 =?us-ascii?Q?5+a/7eAz23Z43F+LbpXSCYXEYoKtACRi7vtGae8CWFg7IIb36KBLAijphXW7?=
 =?us-ascii?Q?huo/E7pobChIbjO+OYS3hvDQiwpf617Ch47flZm7EQpM/x/xrqnZjbNikTBw?=
 =?us-ascii?Q?gVak53M7iclHL71DlpX0gjdgWhwFEtEwpqj/IQDGx872MXc4ytaM4oaPrjQJ?=
 =?us-ascii?Q?dRMxTATyI6ilaOxdXeaEp9Zm8RxkztCcij9/VuJFCjznu2itbM+6efdi2zG5?=
 =?us-ascii?Q?hzB7USc/Hl1yFg6bb7Y7Zm7+MNTuXCuQZghYYp0SoHg1DYsfJW2h+ZrGd01z?=
 =?us-ascii?Q?nf4BZy22lEb7km6yi6wzw8nFDn/bawJ1HSxFX5iHH7kIRgaGRgQrOQd/yMB8?=
 =?us-ascii?Q?ZjexYQOH4fXEOmJ1hQditbsCNNH6ywm5WYYbAWyqR4cwovoN+OEcDDAAsZmR?=
 =?us-ascii?Q?xanFMCZOOqX+/rZyq68Psc6d9ZgswL7dOnEf1hvZK2O4x2Z+JgFDa04BpnXp?=
 =?us-ascii?Q?MndmNUZQyBOTuDBFysUGF6ZmMTRgfqMK6eLmwf/j4katpyzzLkQ4hTyJNEUt?=
 =?us-ascii?Q?oIlovVn4QjmCKuQ+oqvycwxkN9Ew4pHQEZsZQb4ZTQV3SSxnOdjaeryDNMd8?=
 =?us-ascii?Q?Q0lInho1pbtutkqX0AMKvvOJqOg8Zp9RLoyWWze06WeZPLqEFM5nLQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?26+UqRXJAj7++FlYtNZ/FGaFG4by9aryiymAIqPDT9/Z8K/zgu0qK8/OJS1R?=
 =?us-ascii?Q?oznGgQArwjmyF/NOdy3jqfQtqkMl92Dmt5PolEegR3r2YFeOVZ2YH0SwOZJm?=
 =?us-ascii?Q?zbG0LVEppyY5FfFZ87nw+6vGpELqk95rpXmfjv1MmPqy1Tv9LfPcKF7d8yc/?=
 =?us-ascii?Q?l7tN4hrwmHDeRKL1cV05cBTR2Rgyk4T/piCO2xmXUQOGvFqEcJ89RXsPc28n?=
 =?us-ascii?Q?eZIzi2FSs2BrSvQCBugbpPJhR3+TxLDz6/LWFgthwyPR5GNHN187pTvuIAu2?=
 =?us-ascii?Q?sRgxEmMQYi+UrJtSUTmSZVmbonrqPU5ckvvxUpRdcx6S3ARgJOq195ZfguGH?=
 =?us-ascii?Q?htFm3jbjvJTlE1slN7Xk3GYNtbGjd7WukjBE2Dn42fBpMopyFP5YjM2lbB6w?=
 =?us-ascii?Q?MEPVBp0mXgYLXNxYTPwUtomiuS4v+v35pohaT6xbfrUEzX4NFaSmrqhqgGYv?=
 =?us-ascii?Q?4FjQ0qSTE7hWGrUJbxxy/bqZVlsGAaMtLfOfiABrZWZ3PsBvnJ4dOseyrYsN?=
 =?us-ascii?Q?cG9b18x4t9r1Zq3Hq9LEq7vfeF63/wzTby4lNiX06+rREmcfm32Za2AddC30?=
 =?us-ascii?Q?rR3K3l2OHUQBVIKGdgQMvBWXqeGNrq4y9YXe8Ki/quiHlvqIHvfyv/rl3+IV?=
 =?us-ascii?Q?h1qYvKZlTtwlZUwiQNq6VVUBY3z6GrYAeJwndL7ln2ol4W4Ce9JCH2P6lmrx?=
 =?us-ascii?Q?+hLA2rnATrsF7YIx6diSQ7yKRh3xJZ05tSigQprD/zn67Ncx3GfHj40hhamg?=
 =?us-ascii?Q?gSlh1JGqIwj/pBy4u8EU7fGMwHQI7xTeLQ2Acbpnw3XEIK7Q5SJBoE4GD7rz?=
 =?us-ascii?Q?5dC+baKPVXHpj4dlTY9rrw0qb1PtJqjtATeXa7cS1EsfK9UG3RurYqC2B8Rr?=
 =?us-ascii?Q?1Ygu2sSftNAtrlxJgRLPdslWbulKkhSMIN2Ws+EVtD/OiMbuFOYxSF8q1FKR?=
 =?us-ascii?Q?W5Yl1x8FssDaJOHyQhTToI4nXcUCAlzG2++pAc6mBQcbaOf4H0sQIT2GkePe?=
 =?us-ascii?Q?+T9uZDsDxxuJSxk1XMuT//YSfIwh7C2mKPrdwkB5O7uJgdqOpCGaP9nwWq/N?=
 =?us-ascii?Q?np1IiOdfDq4n8QdFMxd1/PYo7Hy9bzoDaU1oPeU+zWpRnWzt8fgmyPyDOoxR?=
 =?us-ascii?Q?4ZmCAtA54DDjjfBNMqYjEQEfIquejX7Jpc9bCZSqvgVWpCjqfeijmlayt5lw?=
 =?us-ascii?Q?4R8yKY9w8nFrYkPW+bDLNb1fmuBMH9MatFoMvQCmw3PHOHua5nXlYIQ1SXNq?=
 =?us-ascii?Q?0ZpTfAqIX2CFjFXvy/2wkL2ZG5ufaJ416mohkEa16QHJsJoXUIxJ02a8JZii?=
 =?us-ascii?Q?678q5Pa+R89pz8IOymWcH8T6tB8DOrxt7UN8LtIig12pTiO3FP9vciLyVGuO?=
 =?us-ascii?Q?k2534KKPOUGDGCOXmNQNDP5Z/6bmEciw6oJ3qnk0/jfEA8OAGJ2OquoPMM1b?=
 =?us-ascii?Q?cua+McMuFD3VRF8jIPJjS5K/WME6XSAwVQdCsBkl/+eIWYqPm1CIorhbhSfc?=
 =?us-ascii?Q?33lzNxgQXh+qqg9LNkIyxUNLGagWrXglScV5o2J4MPrOeDobrkN7wvFfLD58?=
 =?us-ascii?Q?HOJ9Oy7P5SgTxOLpXjQv2BhFywysGUOrXiBOVhxz8MPZZ4T+3JjBozbHWiXe?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d2c0e0-ba8f-4743-28e8-08dd7b3bb0b3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 10:04:05.6084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5o1jV5GCPZ9K7dk4OOgWteVE7F7ly0nkJqmcjpM4g4ydBdPNcIx/LX/SqLnL0/tkqY++bhLu/R6dJcvuAseUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4686
X-Authority-Analysis: v=2.4 cv=UPPdHDfy c=1 sm=1 tr=0 ts=67fcdd99 cx=c_pps a=dIBsZBmI1wyUZqnlzmwqRg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=sCU6nBChsn9xwy389loA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kuXG-11d8NVdg-IGnHRgg8vPazbFSp9W
X-Proofpoint-ORIG-GUID: kuXG-11d8NVdg-IGnHRgg8vPazbFSp9W
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=855 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140072
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 10:04:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9220

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade runc-opencontainers from 1.2.0+ to 1.2.6.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index b84f666b..d22ca4cd 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,11 +1,11 @@
 include runc.inc
 
-SRCREV = "25d476443207db333bcc6dd076db7cd3a9eea1d7"
+SRCREV = "e89a29929c775025419ab0d218a43588b4c12b9a"
 SRC_URI = " \
-    git://github.com/opencontainers/runc;branch=main;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+    git://github.com/opencontainers/runc;branch=release-1.2;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     "
-RUNC_VERSION = "1.2.0"
+RUNC_VERSION = "1.2.6"
 
 # for compatibility with existing RDEPENDS that have existed since
 # runc-docker and runc-opencontainers were separate
-- 
2.49.0


