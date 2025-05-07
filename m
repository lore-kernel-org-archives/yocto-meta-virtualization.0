Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9CBC3ABBC
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 02:44:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2494.1746585873592609423
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 May 2025 19:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=722276e421=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5472K1CY030288
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 7 May 2025 02:44:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46e430k73a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 May 2025 02:44:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/ro38bbddOJQ9ftVZms21LOJhJjxSi7hw6QdF33ND9x1fd2Y/Zy8tlFUfF7U40/PYjruVvK018dM1bBJNoE0x0XrLOBavrYScDkU+rKPYV0RK1XIN5XyKpG2wnJkBSG0knTGJ8m+QAAS9i39s8m/vWVKDePuU/AHklNKRCeAyw1iUiGBpIs8h3utpvyteEJ/PJslAA6p0bs1i9dXvsecfePJa6ssruITNhA/R3QNtAzpCITkP7mEDnM/lkZYie+z74B5oh1WjmEHtT40r50xhjqZgURjIaiWVtH623H9tV6ijrF7m9ftKqj1Njjy/b+ZrjLf7H3yiqEbAJE3lUvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDWlZKWfcvaOEYjtfUkQ9q1pjWFP/gCX2LEvLhsJjj8=;
 b=Ct8zQmBuQ9pMJNSPlrYYbZcxmLuZ6c5JC+a49+ROOjbRx93mgCrZbGW3gv/teWR87dd5V4+H5aMdX3iE01lNhaZ6m6/Doykg5bI+jBi9nMVEICaKjJ5TnYK0CEFg/8fRcvxKCzQuIJLBfc25tRNeN+xythkytQ9DVnsYkbjY3HWvXKCOfyje7gIum8x5tNoHMWsaKOziuABs4Qwv5gcYEppbB7iTaqsm61n/Oez3JPFKvR9GOaAjbLEgfR/15Jvy5a9YgIRFY80Ua6qOAPS8zcH4ka5ArY9TfRY5JPDvJ1B6mCdIoDPUhO8gYuKL/hciGl+/R0mxTQeQHlN+h8mkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ2PR11MB8538.namprd11.prod.outlook.com (2603:10b6:a03:578::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 02:44:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 02:44:29 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] yq_git: add back apply=no for SRC_URI diff
Date: Tue,  6 May 2025 19:44:19 -0700
Message-ID: <20250507024419.4032646-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ2PR11MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e65ef1b-99fc-4b09-ece7-08dd8d11167f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4Hmlbeu6KfL0+eLLele9qcjcBabO3f2kEOEreeQOoWJZz6Rhs9S/LMAJ6eOl?=
 =?us-ascii?Q?tTl0+nxV8x6VZzWLxY2n2SukA92kSiS5oEWOdH0F8HaMcsWzWTrnzIrTDTWG?=
 =?us-ascii?Q?kyG2N8o4n6lHbrVubxznVauoa3wXAyuX4CQL1qfEtlSTma+XoEuyR1zB5FLL?=
 =?us-ascii?Q?BsZiOyVxnmqljwL0cWHuf494dKBZEobIHydkUsZBEOdjD2UONzG4YJnJL4kO?=
 =?us-ascii?Q?u02L+dJU9L438Jc4wSRMwR0H9nCfg0plzvlrAEqJ+UXb+eGxtRfLZb73naYj?=
 =?us-ascii?Q?0PmLx/KivRhHU9GOMu6M/S1k+uluRK+uRd+IS7vV5xTbM7x8Palqzf0W0QQF?=
 =?us-ascii?Q?aBSQhsyqa4xOneyGCswJ5bFqoXHtS1lyLDQIunbnWMvUPTlZ59HNHcGQvjw6?=
 =?us-ascii?Q?HT8OMd201HLJ+mufFQ1k/GY3cxBJ+UGXm6A8WlmAnbHLZhhM5FE3mIBepyeE?=
 =?us-ascii?Q?UGAzOgRGNt3c96HeGTd+ODk3Zo5LLjmTLFiC4coS2NnXzANQaq8gH1YPYF8a?=
 =?us-ascii?Q?UUGFi61Yt1Qgd+4fXM6QvjNyHaLthPbeyBxOvL6bRLO2pmeBcMfaLmo3yB6U?=
 =?us-ascii?Q?EjLVHF2ACt1Vq/2HJzmT5I7+gLNQyf8N9PH+wlkiEoSgJZ+iOlfKMgKnAE3b?=
 =?us-ascii?Q?FHpdEUXNctEGSykAPvxGbNGlf+pYZ+kmduP33GgbfTZ4Rm9s3Q1850X31Yy8?=
 =?us-ascii?Q?0ulRI4ZKCibrXVFrB7hl7CYCkUuixnV1kqw4MeSDMN8OQqvi8bR/GDiK/nEa?=
 =?us-ascii?Q?do4tj/1dh12E8Zi7SjZdFmgN+NfUGkd6B4nPz6UwE8xbrYqXgeJtsDROUyRM?=
 =?us-ascii?Q?ff6zy/hyq/vcI4p92cJ3n19zJtBsXbVemhHiDipwd5Ztejp5qqEGHPNIb1RJ?=
 =?us-ascii?Q?xDZ+iHd83GHZrkMJbwXvYt3ncwCeyljV1/qVPbL4JlIfi3wXhjyKCKxGLjps?=
 =?us-ascii?Q?eeBceVU4zdGGOZc6r1sLiDwtndx+Q2K5Czou27i0CKjcWx3qmuD3f6MXHKL8?=
 =?us-ascii?Q?+2MLQaGocmJ0FLa3KRhHhWqY3OWllr+DLDNj+ikqW7gzn2w2PdR7gMWQbynm?=
 =?us-ascii?Q?qXZKsI8+OGeI8NEtMHm0SZpYcTap3E7l9J+3S3Vu5OTyvD0DqpJ8uzAklPpI?=
 =?us-ascii?Q?wBnSPZVjNDcti0m+hiR+wNFybWe04aAiSH23ST56ts9Tq+pGkEL1tqEG2wcW?=
 =?us-ascii?Q?WUQYDEYfqOs6WO9tLvVVRrP/0E7F0tHSEc4oQH5pRvEdU3EPHQQVcwYz29Wj?=
 =?us-ascii?Q?OKderj64d+rHAnQdcj4Wj0Ee6HQO8OrpLiPWOL3WSxDxDCia0mWEZD8eLQzV?=
 =?us-ascii?Q?D8/5i2OqcVlXXXvi6+1LUrIj3WDZZCBr9eg/f3UEpdjv+6ynLIEqb8VWcKlL?=
 =?us-ascii?Q?BCOVcqy6+NWsLWQYB9kybGComuQ85+9A3oJLZw2+IfTdEW+BMl1Nk8IXkoQW?=
 =?us-ascii?Q?+U218XAkQC4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0IVyM9eFriMt9DYky/HYWg8wbA9btnR+xLRgCIJkFaZtbc8jlphkMFmlRiCe?=
 =?us-ascii?Q?hxkjdOtEFqIIagPAu/GtoEqmD2myUkIlAEL3K3y+P6FC9BB1aflnhKPHeQKV?=
 =?us-ascii?Q?RUm7HoM287kk2AfMa8dWs24ae25MxWMzHYKJOPXlsh8l+yuZoQtP7yzwrq08?=
 =?us-ascii?Q?1+x0GUaBjozRV97g3mcUjkAlX74elMVj15tL4bxwXJ+F5JwqXkGS8NA6k5If?=
 =?us-ascii?Q?goldUhCfd0pyeCdf4ogo6OYo4rie3s0nMBK6+gkHDoA37A1eDaNiiKRZfUC1?=
 =?us-ascii?Q?K0m6iMkkJmeouFhCvCC2au2hpHO2x6Rh+37v5IHsUsGM/DQcR8Xu6fJO2a21?=
 =?us-ascii?Q?XfBN/JwCXJV9IgsmA79F2wFmWiT+W2y1Xxa7iZxEw58Gwf7Qp6NG0bmUPBcP?=
 =?us-ascii?Q?IaahsBJyZP9FL/AsX/4QWbFsGcgTtN3tpf/BY3L9Fa7OSnKBAxerLcqVeCrN?=
 =?us-ascii?Q?asH9NjbQVy1rHRYEeZ/VQEVwoXX0syKIAIYj+LFvXQ1cWsgJjA37EX/ZKLJA?=
 =?us-ascii?Q?KBa461NWfwgYykPbOCwrAI6IvReGmDcl9NE/1XP3jKg52XwU3s/FFQCVUpR9?=
 =?us-ascii?Q?G1eAPZawPMecDnVSuJDvBp19WSFlZlWXMoTIWJet1J3rK0j96uhy2R7c019I?=
 =?us-ascii?Q?tlepJMQSU+bFKBcAg9FnE2D+3x+vCklBCyxWZtszFoWUCCL0fPXCpiGt5p4f?=
 =?us-ascii?Q?QU1EClipn8PysObcVoR9SA+8AGQIyWBHPNut2bb4Ed3QQGxHu6tb86HcPxch?=
 =?us-ascii?Q?t4T2Uzh7E1usFDorp3jYSttfZXBYcf1E61HrgBIEqHUQzjVN/LJVxWBOT3VU?=
 =?us-ascii?Q?FP2x7jMHMiv+ZCNb5oRijfDFaSYvDrQaGQ4omWRyO+W8W0e2JJwgj5g6pLP0?=
 =?us-ascii?Q?CkK0bYXR7ImfB9xdkH8Zz4mbFggjnN40Yr5niuWWZUZQ94LyVtno2Wj79TOo?=
 =?us-ascii?Q?bmMQ6dO3DJ5+6pKwaadu8dXPUd/ItBPthVi4K5qxZUJyPWQvtz3R1DNjwvsx?=
 =?us-ascii?Q?DjkUVuONcg3lZwhyaQl+4Tf1ruKf1ALA5ocZWX1sV/m0BCicvBuoGOk3p0h7?=
 =?us-ascii?Q?Clbh0eZAtbaJNnS+sFLUD4YmFZb7LEdErkXcwjL/gRh34BK2MEnXLTSqFdwC?=
 =?us-ascii?Q?B3MzzkG0h0rCA3t1k97zmDSr+5A/L9RAph72VZLOcg8gN/ny+pryZznkyBEZ?=
 =?us-ascii?Q?PN5IYPcggyep2HRbOAMki++/hhlBs3D/Lbc8ZDkLejYTfdy4F7FgayhWiv33?=
 =?us-ascii?Q?ec3Jb8YvdjVvsKGVSSeBRMjh8zVKVc7vY6AfbGtPguSJRjWAOHPcE/vEEm1k?=
 =?us-ascii?Q?jJqU0bkOMaNThTppBe5BbKIS2FPlWKpnzvnIkqXhXNDUWrXN0q2aLy12O103?=
 =?us-ascii?Q?dGVmpp9U9dV4woJQuckDm33FF/KCeJxqisZB9baFYV/Z4fVUcaufiF50wng6?=
 =?us-ascii?Q?2/yjfL8nGeJHoMnIbpYzAMREGKb8Z3PmCafHmDkb2eRbEkQfvQv0FDLyrvPL?=
 =?us-ascii?Q?g0zef9LQdYAWZ+44X+52GcE9d+fg9duByG6cOyWyOeGU6OjbthAF7d/+zo/8?=
 =?us-ascii?Q?HJ6jvH8IS2F978V/kJQL1ubqC72V/enkwIR5oqvPs/MFnP06fsLoVOnwSyYR?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e65ef1b-99fc-4b09-ece7-08dd8d11167f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 02:44:29.2197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkZxexfNYQ3h1IFF2iIw69Jls5/w4vuEMMNjsY2FE5+EwZNRj2aMXDN06fJZ38uLZRIX9m+y6PFxQQ0BlGDF/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8538
X-Authority-Analysis: v=2.4 cv=BajY0qt2 c=1 sm=1 tr=0 ts=681ac910 cx=c_pps a=oQ/SuO94mqEoePT5f2hFBg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=Oh2cFVv5AAAA:8 a=pM9yUfARAAAA:8 a=NEAV23lmAAAA:8 a=Ki53DCe9eRFX6RkdjzMA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22 a=7KeoIwV6GZqOttXkcoxL:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-GUID: nKGF-t7vmXp5ReQqncNx77AorJGaLiCH
X-Proofpoint-ORIG-GUID: nKGF-t7vmXp5ReQqncNx77AorJGaLiCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAyNCBTYWx0ZWRfX9ZeuO7R4JGy6 L2UmWGmHEQOWvrPboaYK2JvXnCTliAa7f9jopbZh7t8GMdCTSkkHLPFbDEz2jqew6chT+iOx2sg YtM6YvXbyYY/l7uUl8Dk5ZbYvJJsHMZFmbsXxLVF49gEnXec/Afny4NCPu2M8ICamOTPYmXt8RJ
 gpznlsNAhCNNIZxjVDoR52uugAhCaVQBiLLE5lI5ZD8yoZ5RudxiOILrGiUq3JErRLbYUnvv1oy hhapTD3wUXKr+XBIG2YaTvP7ioUwU5HVhJz+ca6e9uRjAqWJqL1HMt/Tu5Ch6zz10r5z8lgGt4x 1YaHw9c666lExj7suRV2w1SwAJNg/o3/9xnoEd8ki30/DHEfYT6mMMXzHnQN9qj7tiqFuJ7NzCe
 Qdwpe4VN2AEyXfYURU1rSbWxr4EF8j27lgPfCkrdvEExM7SCtGX/RkR3zsiCN0jjb4q+Af1i
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=850
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505070024
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 May 2025 02:44:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9245

From: Chen Qi <Qi.Chen@windriver.com>

This apply=no was accidently dropped during last upgrade. This causes
do_patch error when using git shallow tarball.

The original patch that added apply=no is:
https://lists.yoctoproject.org/g/meta-virtualization/message/8804

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-devtools/yq/yq_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 9682ec95..b1700bd2 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -25,7 +25,7 @@ SRCREV_text = "566b44fc931e2542778a18423c655ce99b4f1402"
 SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/golang.org/x/text"
 
 SRCREV_diff = "20ebb0f2a09e612109b224b32f79370409108bcc"
-SRC_URI += "git://github.com/pkg/diff;name=diff;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/pkg/diff"
+SRC_URI += "git://github.com/pkg/diff;name=diff;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/pkg/diff;apply=no"
 
 SRCREV_color = "1c8d8706604ee5fb9a464e5097ba113101828a75"
 SRC_URI += "git://github.com/fatih/color;name=color;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/fatih/color"
-- 
2.48.1


