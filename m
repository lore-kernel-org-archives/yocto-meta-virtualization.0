Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295D1C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 08:29:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.38560.1737534541140953983
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 00:29:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31173a9983=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M6jh5d031042
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:00 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqk3g9nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqxGc71Znvm/UKnFKTET0DG1tplToNoVEKV9uL/rzz4KIOMtkCwZ1NFOSODJmXbaYfIR3WwO4cUh3od0cYCTDA4P0GX5fEpSxwar50EGgGs9P+fHt12Q/Qa12pAzX63lQWFtGueUEc9uQ2wisXeFM/T4kRwPF8SGehS/jFpJ9ELLjvoX+dqOYaa8GyNW7kadaAyotw3zqvRxazfGH3/R9CaCeAedJpuUCsH4/EfgcUxc0zQ3HRPkJaWRUhoDzNzO1bRlz+WimrxQ85VRTMwXsEzdBjHPOAWPnHIF86abgUFhRQsNmclOzlQmOwL8m6BTZJMj1Vi94J+cqsBBMnZcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BL+dhjLW+ORoxQSY1VRkkicr+AK6qQzR70cWOFLqzE=;
 b=e9BL+qV/op634DyoiXn4If/W0nlJONJPDUg0nn33gXiaSsR2XpjNX5JLpWl75wOBgJiJWXkcjGsl7PQOL9mjdk4vXcR2TD06NpBrUHLw6ITugxL6iSEQDy4GU63AM+wU8qQyoPaMgZyURoDv9VoCq9Hfzglk3x1STOrt2uVLFwuZSBdMPQT5HxC859JtRgwMlIghlZ7NMo5UNbEXR9wGvMst7/waBLPgrwySW+JmKAUrr5Ac7GsZzaOo72iWjkc3Cf7UxBqeCruE2W4TY3JduTuL4YL/+MZG5PCa8DMZuDkuNPOnfl4FJzrzxHf2KBMWx308grrA/VuMqgovX1vLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 08:28:58 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 08:28:57 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 2/5] buildah: add seccomp and ipv6 to REQUIRED_DISTRO_FEATURES
Date: Wed, 22 Jan 2025 00:28:44 -0800
Message-Id: <20250122082847.3470429-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122082847.3470429-1-Qi.Chen@windriver.com>
References: <20250122082847.3470429-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::17) To DM8PR11MB5605.namprd11.prod.outlook.com
 (2603:10b6:8:26::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5605:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: d46f1829-16eb-4314-fb5e-08dd3abed085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cT+Ya+Jh1PDRZJic8guGYPE0D2yRS8tdR1f3gs3s3EQiWcJMHQTKo8A6Cth6?=
 =?us-ascii?Q?7YYZZ9WkhLGs0OuLWoVxxheESuU8MHJHIuIjjmA+y3yHwUEbYng27RzxO1yS?=
 =?us-ascii?Q?vgXPex6WF0SUMa3qCFExKhlrUl/E+naviQTgYmHmjsAHPHLTcxlyqXxNdZnR?=
 =?us-ascii?Q?oyo1h+5C2i71Re0nNiN4suQgq+Gn4N//OO44hUYDB2RwHigZo6sZqa6jFdXM?=
 =?us-ascii?Q?s6yWp1j6LCmBTiBNCPLNbipKnXWqgvTYRnIq9PuJA2+trHFET13q+WPC1QAz?=
 =?us-ascii?Q?5NKI3Xk66FJ+0VzdewcsS71+5F4E0+hk+ph9C4Ka+ub1/cY/tNzkZhKNpHEa?=
 =?us-ascii?Q?RXr+q04mzyOU2VoPtgqIcoK00ANs33bB7bUFb2/TafetChkbUVWN+B5mDCMK?=
 =?us-ascii?Q?y2/FT2RIGhXtycgifEjtnZMmLfIMEl8LU/XbZCRNMw+1gc4hOPCnY8662NrW?=
 =?us-ascii?Q?loXAGntt68GFEjdHHH/IibHOfOtgtdXdwNTD5ukqkSMvzGSsY36VQ5+pfZd8?=
 =?us-ascii?Q?/qRv/jh+2QLUyRP3KLhr7bDblYc4U3jJQbWKNxhj/kthU66juoMSavPlJjqF?=
 =?us-ascii?Q?guQP3STwPdgla5PbJqxmmYZABesimwg+vb5Lum2E7eDcOK+/AoHu6fX58ESj?=
 =?us-ascii?Q?CoTQX1PnMANitAC/0VBnzN2b6CrCQvt+iLTkGJYjmU4eEY45Wc6AknjXrrE4?=
 =?us-ascii?Q?VmJfRzc+RFsS6Du99P66Q+qwopNV/AX1ZhvP+qnByIdg6z5Ox81qCF9uhVAT?=
 =?us-ascii?Q?JCrGNf12IcP1eVreQKN+2NgmULSmrHazma4iD6R29wV+jdj3wKoklf4AmZxw?=
 =?us-ascii?Q?D04SCvJcU0T1uLGchMbv6TtuYyZ8uetZsy6CGrU61XNMpaqih5T4lHWFYoa9?=
 =?us-ascii?Q?5WtNETb1NUc3xp6oqTqW1o2QHsfq7qprwMTvqeQT+4NyVnwTJ47c/MRjAmsV?=
 =?us-ascii?Q?WUObigvKBfwxx+C4SVmxF08ZafmoaEUBJVh7gnruiYsJJ1cjjXtjIw59QmCV?=
 =?us-ascii?Q?7ANlskpoqomvxXkxc2ZqjHQwcyOW+echQ08OZRyeLHg8U2+MI01Rhz1taMlG?=
 =?us-ascii?Q?BEmfdkkqVACjo5xAzVd6G9aRdCH5AsrUqmNUDJMlaaWJ1sGb2snhORKFtG0J?=
 =?us-ascii?Q?Y+cdhXGkt/QH80wCDWeFdGkv1dOGQAWJGcFuwcVDLoVsytAcwlqIGEMbGZwQ?=
 =?us-ascii?Q?0Ese342Tnquky62X9AQQgeM2l9UXdZiVOUkZWnnnZbvkQrl3IL2vgQYfjtkx?=
 =?us-ascii?Q?DJqkCAkCyO08XVJBqCoxBuQJlG5aJTqozodswK1Ol2xpWre7Y62da0DCR6Uk?=
 =?us-ascii?Q?qS3v3AWdhDqibCRNLtrEro176NytPIkuhrQwEv/wHygZ7rEb9HAyRyX5VzEA?=
 =?us-ascii?Q?GLb84iOACdeBxYflxfQbnG8mqNDRQKOPKXrrB7B/uT19IHz8Eg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tgOXeiPz9zGA10SFvAORhz3SEdZwOK1BNU4q7RYEQpppFrEZZYbRwF0e61W6?=
 =?us-ascii?Q?a/XHLxQ96EEiyhNIQ/5HImNgjG1lgHPxv6E/O52ZV0EbCOuHMgjzrM2NTTlq?=
 =?us-ascii?Q?fmP50lNBkdOZLe3RBeEf4JlHJZ2m9KncMv7l3NvXpsk79IdY2gqyQAVu/HJI?=
 =?us-ascii?Q?cCiPIHDhJaAVcK9y2ETNNTxCYJ/FT7rXbZNaN+ap14smMUQ7RSZWuogtKvn1?=
 =?us-ascii?Q?kVe2nbhXpDnJwm+lIM5tg6//ImD//gSXOFpkNKokea9n+Vh4SxYpOdKSpY8H?=
 =?us-ascii?Q?zDglZEAJCTQDUtc5oKaAz5wRta9Zmz99FHZMVPPCNIfsJpF72O69H5+/S1iU?=
 =?us-ascii?Q?dZBgkUDtwe2wgK5ddejXcImy90PPMbG4LkYufFA1DeP+qcQtAHaZnHyDYneA?=
 =?us-ascii?Q?zjdSol1R4JiD/s9rkxHfCSAH3kSGTUN3i3BBMqALViHXjTrhrRETSpcGohWm?=
 =?us-ascii?Q?XeE6Tue6mD4zU6gpgmr31yQnnc18nM5OCe0wLwaQhnBzNe8dPlN2wSBwRDan?=
 =?us-ascii?Q?t4ao8rK95we+nlW/RSy9Ai+UpC1b8rqfm2yuhUUyzIKMRYn1zqXxcyj3os5x?=
 =?us-ascii?Q?1uHKNkyh8CCJY1HDhlolwr0mIudH6xjP5PzQfq0s+3heBfjUsPtTUsJIWKsu?=
 =?us-ascii?Q?SrzmcSTnbbP9107qUI9MDm0Qx+ekruR3Rznh42keAqDDCFvAIfJDT65S0gLx?=
 =?us-ascii?Q?nf1HpIbF7W3+cVurHVxr7cORQgfqRsIgfwels11Zk3DMYqpQGgihWphkiJzI?=
 =?us-ascii?Q?SkF2wYHQdqRxkYIWTR6kcy3MgADXzw+lefj/9Lq36XoG7+NV1moFfC439tPr?=
 =?us-ascii?Q?YfgB4jDvRkHGhTHQfhXIoXsOoDxIIYC/9OogTOZcTGM7HyErfRysFvv7gY0z?=
 =?us-ascii?Q?aPdVuvdN8n79tpsKk5o7pj30M0ds4gkeqvCeo3L9O9P8ByrOvNKsYxDQ8soh?=
 =?us-ascii?Q?UGxflPAsuOoNTyqoaRXtTMrvcAMvY0fNGy1OAcnUJAjWI3dq+ak+HYdCRKen?=
 =?us-ascii?Q?Hx0CRr/tMOBZgwxhdgtglQfDdfhru0/psMGhnVPX1YRmX0BNI4n28ZFE3yYR?=
 =?us-ascii?Q?PDKkHW/VJXz9AgUzs+zIyTI9CWFw0zzU7toxVAa32tFTbvZItRSTV2pR/Z8T?=
 =?us-ascii?Q?fLrnSnD+DjjjNIssaB6mVifvAUcDFQKmbDcbtqwMuABwktxk3Hetwkd+adOP?=
 =?us-ascii?Q?agKLEzBAPBlgw5nfDn4F0WlkbNWQodezRWwOjXYj29TTQmO3dI0XSERNBAfG?=
 =?us-ascii?Q?YGcKdC+5Iy9B254zlhRrpEX2TziGnRfqgp4bp8pobreyu/kh4Z1wpaMfLLBt?=
 =?us-ascii?Q?irVHF7mxOynqn11ggGtnRV0+Tu9KLsTQCU5L3wq+VeUJMgs0F9xD0+DJSe3J?=
 =?us-ascii?Q?9QRO9LpkyYGKa0RvWxTCDNuzAKHueAsB9GlSFPyqTNCDLXNWeNiGTEJbZQyx?=
 =?us-ascii?Q?BvasBftiSqKYqjR9dVlyLAhGdwMtJ2KtpGu90NH++YseyCSZx/JNtV6ld03f?=
 =?us-ascii?Q?DnMwjoi1crwAAtRdi/Un+RR4QFSj5YhZmV5zPakihPHIbjUWAuoFMdWxV5HT?=
 =?us-ascii?Q?CamIjbo7WktD7wCS/8LHL4QfRDrhPPwfoGFpwjyrJC7GvH2oGuzsTlcmcetB?=
 =?us-ascii?Q?CA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46f1829-16eb-4314-fb5e-08dd3abed085
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 08:28:57.4565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dgBOeEvdQ+Zm0oqaZW3Svz04jp6Q3+9P598t9Op4+CiRraVpqA4DyHy1a59z7An3ACLgdO1h9B2Ix5VxuYXSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
X-Proofpoint-GUID: zzBgffkumC-uyd_eyBRvZHf05QJT_kns
X-Proofpoint-ORIG-GUID: zzBgffkumC-uyd_eyBRvZHf05QJT_kns
X-Authority-Analysis: v=2.4 cv=fZVXy1QF c=1 sm=1 tr=0 ts=6790ac4c cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Ljcx4Z80PikA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=rAFUqe2Vs7s_xDEkrVkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=930 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501220060
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9106

From: Martin Jansa <Martin.Jansa@gmail.com>

* because it rdepends on podman with the same restriction

* BTW: .gitignore has:
  build*/
  which gets triggered for buildah as well:
  meta-virtualization $ git add ./recipes-containers/buildah/buildah_git.bb
  The following paths are ignored by one of your .gitignore files:
  recipes-containers/buildah

  I've adjusted it to /build*/ only.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .gitignore                                | 2 +-
 recipes-containers/buildah/buildah_git.bb | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index a61332ef..daeb43d5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,4 @@
-build*/
+/build*/
 pyshtables.py
 *.swp
 *.orig
diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 9e074415..1c33291a 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -16,6 +16,10 @@ inherit go
 inherit goarch
 inherit pkgconfig
 
+# Rdepends on podman which needs seccomp and ipv6
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "seccomp ipv6"
+
 GO_IMPORT = "github.com/containers/buildah"
 GO_INSTALL = "${GO_IMPORT}"
 GO_WORKDIR = "${GO_INSTALL}"
-- 
2.25.1


