Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0DAD11183
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 13:54:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18775.1764251637865502265
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Nov 2025 05:53:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GHgpnJeL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34268059e3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARBnnBT1169249
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Nov 2025 13:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=cWyRe/VlKQrYcDPvddYB
	EFzHiZ3HCGDadwrF9S/NigA=; b=GHgpnJeLoLSXDGhs11oIU3+iJkmTMfnVioR4
	4LGSUNNaAurAfHKP2DzOkWxuzUsmFpxOrzVnu3rND686U0ldkenso04aOJBuZeeN
	0VKbhr8vZ+qsZSDYjMUHExuN/J+vjK7qipN24K36v4QAcgia3R8vSW908JXmw92G
	nyBS6CTbNRmNxWN4MQ6Wkxv6aLHVjmTyNRY0ooACY+aAyirorl4WuQPXuw2TxMq8
	+qjjV78HV6LIG2kOluizPVTYizO3MjKbRvloYj1AhLkfqvop2DoDu/DRr74sZrL3
	Jr5ysNhxob6ggRYXpO4KIvzIWg27sGZvJrAsfWCUcEUIS4tT5A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak455nu2s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Nov 2025 13:53:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKFhB8rqH13SkrE1DEtgQBoZ9vxLr8GtHpd1Fx7Z1Jqaw0N9bA7nw28dnRPgyILNTlHPsHqOIBRBSEE7y52bdD+A+yR/gMZPZtOao3j4ToBMHQTKIPwEWLbaBH3A1y7XwL+eoFXGDVICHOI9/9TLfQHWDK1wt0Sy97JfN+Cc6m+vP1hZH3uyy/UcGa2UWyV90JrntYkLhUSj1V7g/9HFlm1z0c1nye5afD3dtUJNZKmPa6heg6IKsFm+S3/F53rzrPqCl0+748xB4ZGgpLm98ekUiwBUgyvoXbxnETfflqgw0t4jX/hh9jAG5FipVLuMVSELRNOoLCt4J9js9u/03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWyRe/VlKQrYcDPvddYBEFzHiZ3HCGDadwrF9S/NigA=;
 b=sHAsLi5IkqzVuaRGJoky8L5jSOUSqHie4e1hPozEVOj7n6eDiL8fRHwDqTxLXuKbO3Z3H/878Mh13zTX/XYrBNnjCl//KKXTxuCuoWxuWq0pFXiM/Z14T6ThpmMhrce4qKMx+HTn6TW7ug/D4xCxt3vjfTyNbg6FhNTw6NgNQKJ02tQPHL8uZnLfivHj4qvDVkdhPiSWVUsox7o806uBauVq1320MCrk+6mAc3g95hwUeIErJsMRczPQ+qbZSAfGCvw9ijXT5OCmu3SSdXzNPk+Ym+P/PWp5s8LnQRgI6/HS5Dqd/mG10g8TLEYo8KJfsfDESNfDmeOLP8STjsUxVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB6196.namprd11.prod.outlook.com (2603:10b6:208:3e8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.12; Thu, 27 Nov 2025 13:53:55 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 13:53:54 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [m-c-s][PATCH] nss-pam-ldapd: add UPSTREAM_CHECK_URI
Date: Thu, 27 Nov 2025 21:53:39 +0800
Message-Id: <20251127135339.428115-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: 45df0828-e579-4f42-2635-08de2dbc6773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MDBYlTX3O9XDCvI1fOrGsgXGpDz65YB4wj0ISRlhUjMH+BhWtEokJMW3TxUk?=
 =?us-ascii?Q?5WUI10cSsGtUU3HGz5H7M6XiljeIs0y6ffmDcSgp0IUz15JJnGwIgH9HiKSv?=
 =?us-ascii?Q?pAN//x5N5O15bOdSfIHpc5hzbnhyM1Yx7Iry3KKCwdsXAZaareRVWbZdLeYt?=
 =?us-ascii?Q?6ZW4ijwuOwM01LaVPeXxHaOn8zJsT6wn2kAyKFXlYxUbKtEVu7XEs5at0Goq?=
 =?us-ascii?Q?XbwJbPZBEJA15aNSQ4HJcXSe+2Cgo92Ta6ZtDXtAngGct7bfFFyuwnSznqw0?=
 =?us-ascii?Q?0gMkLKTcu2ujTTYHdxHwtSARkiOpMJI6u6mMOPERUQU3F5zAnkHLNL+s4Stm?=
 =?us-ascii?Q?Um+LjgY1i+oJFIz2P7W55Jo0448klumo034+/RW9Tj9fkmLe4molYgLFl83v?=
 =?us-ascii?Q?v+Zr9Dokm/Kc+5UqFthL6qe3akxomgI3mwLy6DBIRjKcLLSlO639HviB1EKD?=
 =?us-ascii?Q?UoeeE7v90K6Kv+Wke3w1Tdas0eLQfPJjShiFkvSURHXC4S9cT1Ej2sBy0Ees?=
 =?us-ascii?Q?cRmIsLX4Wzi7lTvd4xufm5pwWFQkB9Oui+qQitkygqDvwOVvlqjdy4hoY1GY?=
 =?us-ascii?Q?rKth9V4qJ0ltWJlcO9i0wIgUBXOArs/aoPklSjnlQfvCBiL3V5GDtD9K3iRh?=
 =?us-ascii?Q?cjaRX1wm+I9fT9oI0BOu7OC1IFe8KC5G3ibnVgs8twCkEUqNX7Fqe6eeb7n9?=
 =?us-ascii?Q?3kY0FwnRmKKve4xZPCIrXrhLqdIkp1Ms8t6tHPLav618Valf9oA57aljXjBX?=
 =?us-ascii?Q?ncIwnDHw2rh6avj8hgp4S9pipa+J8kkxK+aLeqIzxOiMGJpMmTblxmHJfOCB?=
 =?us-ascii?Q?LvhxYl2Y0cdmyutgnmYKUjHYUdJMMzvZuBN/LRvNOZPb+jaDvOnC+z7Gn6zK?=
 =?us-ascii?Q?P3eeDdtbr5lC1hTTVntcZDuGNlJlI8ENERbaKxFTHc5ppzVX0R3pj4sAfHju?=
 =?us-ascii?Q?H737ehVJfJmA6GZc2vwhEwYiIqpuCeZ+klILdl0vZxzAE+fbU0X3DBRoXbQz?=
 =?us-ascii?Q?yyEXxOJW/7bkKGrihMxy+wMiPvTS5Qxnmt+ZLDwOrELkLe/RjVAkMDGX4VQY?=
 =?us-ascii?Q?+WYq6W1ltWfNhsu860ausV0aNHP4Thq/sye878WwKpN3D0gST/9Go5wv0L1S?=
 =?us-ascii?Q?AGmcbLnZDvtoswNDGTWVRd0uViLkVAa33PdFPkRgCBOQbfOfdxu7QwOXXTPI?=
 =?us-ascii?Q?MmqwpHWthqxKQ4wjU6pwU8mcckSH1INTCfApDrZ2wIy7mVni2y/6A9oInfWi?=
 =?us-ascii?Q?i7bx/9m41duyibozTxupt4J/YoWVJRuqrS8c+ZDxo/3Fa5Vw4D3K/140ATD2?=
 =?us-ascii?Q?ckOU8swooIco+p38XkPCFnNHZaW6A2boqcpFGHxTpRsZ0eT3s1XkcZ2EiSWF?=
 =?us-ascii?Q?RGOu77HE53yzi80S5VAsGvWuCtqoOHIJoWiJenxeChP/Pdz4oREGu9dMNIjU?=
 =?us-ascii?Q?TeQi5tOlDRtnSw6qLnhWP1zpClLZNOvHWBFxDUdx1YPgGG1sboT/38LHmSla?=
 =?us-ascii?Q?GGTLRgTELN+VxWT7aoVPv89l7zrkkgT8PtP3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ERTseCLMsr3I1gXmx8tAS6Dt9aVhq2ZtznyQzfZaWxIgP+TYVF7VCrkVqR05?=
 =?us-ascii?Q?8f3nrqvJqaTUH/pKgjcW3P4Ko2ipHoDaVD/uN0uOkCJM7Pg99p2PqKdTVtYB?=
 =?us-ascii?Q?QCttMpyoLloLC5PHbzQBw+RiOEl5CJqtKhfFQsRduL63iJsT3sreNez2/DGI?=
 =?us-ascii?Q?Y0ytEOw3e3+pqrJlCXRCSxCFyuopfCSrmB+mBWJ6rKIpO8aEV9fqD7DwFtel?=
 =?us-ascii?Q?c16qDDfAJYDs+qyd5sCVulTTcmVIs6ix1Ky8TgSYrt8YkHDhkXTF3ISspB60?=
 =?us-ascii?Q?qNSsRF1ineggSiZoUuWZoJDTlcpvdcKJv6fJfKUEDGksq9fMSN9H5sPf+Va3?=
 =?us-ascii?Q?mJfUlmdui0RvN/GNFiwK+aJ0dpOWmqClmf5N4CMtsyOmzLIrmvOCiNd5mxcQ?=
 =?us-ascii?Q?17lmfV044j1pRN02B6f5GBHAoGcikRVffuWnfgNBSHLjl1uqcbex9xNLttAE?=
 =?us-ascii?Q?9xpkOpivz2M38MBeHahsJpTCIkpZ18ewwZG3osNi0KTY7wsQ/vd4wVTWrAip?=
 =?us-ascii?Q?Nwusu3iMom+gJSNVdnFr93qYQX6g9gWqfXgYq1pWwTBomK/kX9auqvI5Yhpb?=
 =?us-ascii?Q?CrrnEIIyCII64iMKjxoz+WrUEGKCTGQzyfBzo3TUqt6ul8b1gRFJQ+stRoyS?=
 =?us-ascii?Q?+psuEbX5cFD5HoCu/KhmfnovvB2PWrwuXIT5Y/EAGnRInxGbsVyMUqtvSkgR?=
 =?us-ascii?Q?vgYZQ45AWP85zUk8Ti4oTSdYsamxBgkBCAETNsIrsBMDA2VeysTFowqHWMYY?=
 =?us-ascii?Q?xTy+q7LFMXw3mxu3T9DBMHYMM3ekMitXy64u8C2AlGKiAv2Eq6ZhPrtasw5f?=
 =?us-ascii?Q?cYbiZwwuXYj3OHRT49M/hyAIXeLiNkA8vv+2QMI9+HNo3NOONkSSMAEoKNrC?=
 =?us-ascii?Q?bGlfG0z1RGfU+EjZKTe/A3hCwQWKhY78Iczz+ohcTCqBE95SMSQ5EvqMRkKt?=
 =?us-ascii?Q?W/CfZd8MMWe6qjl+EYjUa69cEljgq9drzpGRbpRYZjJE/sqHZc6zU9s0fcg8?=
 =?us-ascii?Q?2ElqYkf+N+8vAwJkvLTx7q4PWp7G49d/9c0en94Ai8Ku55wqW/2ywR80C0Pi?=
 =?us-ascii?Q?9HK7thqFoRRwoZQFx3IQhHPLR6I/3quNf2q4S1dsEhKdTceBaR0D46Txm3Tn?=
 =?us-ascii?Q?griuyvn1lHmPTKUgG5xwjePXu6NgirzQt3Cm7pb9K9GSRjwSmz4G8f4IyKCg?=
 =?us-ascii?Q?I79Y3s9LP0/oizblzrqgA6R2WGPbM2yok9ZMNrz5pTope83ZjtywQHNclP+d?=
 =?us-ascii?Q?IKleP9l2eRoj/WtzYhnGD6rPWVRXehlFbJfY346a/lK4SufuxusVOfR1w4mA?=
 =?us-ascii?Q?xqlCoaYSjfJfNNSNhbT8vdH8rahsfmeEGso7TX89rd11dE+ozY28R9AsaKOP?=
 =?us-ascii?Q?i9VZPJl0edDJv1x4kN9Vmy/7UNENjUGDHTvS7AlwM9q/z0szT8/+OzGZz552?=
 =?us-ascii?Q?lX2RBWnX3hHo6H4lvOrjbmkTUT7XUGvI7ekGr+TgGmdcv+CRH8zMXdkTlKMF?=
 =?us-ascii?Q?/trz2gRzhSpeLxYEUgQRfnnLhVVRKcqklojlBUSBhtQdx8T+RS6e2huvC55L?=
 =?us-ascii?Q?7h8NLAPwAntycNg5cZixeMh3KXnOz5Hr4IlxnKmM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45df0828-e579-4f42-2635-08de2dbc6773
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 13:53:54.9003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrSTSgNCHd733UP0ZqBDHAOOx1mJOc5KW4lCvYp5b+8EoKJCglhjT2ci8aZ2+53aOqMyYTXiTDU/aSYeu+0oUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6196
X-Proofpoint-ORIG-GUID: tg1n_YMlVvL04AVUr61XhJlR3hTYcM1V
X-Proofpoint-GUID: tg1n_YMlVvL04AVUr61XhJlR3hTYcM1V
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=692857f4 cx=c_pps
 a=NYN33YLW5Jwrh4oiy2kjMw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=-AOZETJZAAAA:8 a=t7CeM3EgAAAA:8 a=UNqtoOf11K1xkACp2_kA:9
 a=gTUbfCpnf6_oZ-kkFPom:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwMyBTYWx0ZWRfX1pjTznn5+krH
 hOKDSKh7+fYIDhNbzlXUIBA+jXZGHbnmhzUU8pzjWY2U6wkQv4tgFNI78/VX82+9fL2cAvYIhNx
 AO3mOXmZA4QA9Wpb4qeSHaL9C52NGmF6p/uTlO8+OQqpij8qxCLXtVWdjJfjt5tOgMKU99pjkGO
 ATRnatls84u24B0uZJNfbSUFYtJYYpyi/fdSGrkSv77VZEkXQR28vQyeRaqaJ22U13QFbCoqesc
 brBKH0jX3qr8Hvof8BGz7OP2D0ad7DBGT0OzUa3Qz6GUkcCSD1B3wVqmRjcrTKEVOIvjMRdM1T1
 1cmUbsJCMfxoQWUsXsNmxFhpco+3Nojtt1BoiPUY7pD27oPdZgqCvX1/6hbrriy6CMbixPZoSPL
 P18DA7Mf8eG0lQ/aY5vNkz44b7LHcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270103
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Nov 2025 13:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9463

Add UPSTREAM_CHECK_URI to check the correct latest stable verison.

Before the patch:
$ devtool latest-version nss-pam-ldapd
INFO: Current version: 0.9.12
INFO: Latest version:

After the patch:
$ devtool latest-version nss-pam-ldapd
INFO: Current version: 0.9.12
INFO: Latest version: 0.9.13

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
index 08923275..98fcc0b3 100644
--- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
+++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
@@ -21,6 +21,8 @@ SRC_URI = "\
 	file://nslcd.service \
 	"
 
+UPSTREAM_CHECK_URI = "https://arthurdejong.org/nss-pam-ldapd/downloads"
+
 inherit autotools features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-- 
2.34.1


