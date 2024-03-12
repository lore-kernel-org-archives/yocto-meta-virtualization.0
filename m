Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E124C54E66
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 09:26:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4494.1710235611518864333
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 02:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38019c0178=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42C8BoD1005752
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Mar 2024 09:26:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrer6an8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Mar 2024 09:26:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGdvEZGhfAfZwonWmLtn0NIG+rC5RWTp9t1UUgnsqsU9Xw4Qc9x4MKXD0sgpgy0Qo9jPstbhXtKUCDW7NGC37xGxnjAd43r+1Ku50qGHyG61bKYm8Q3SuBh3OtpeymUXs2xffrGEOc6D7owpiOaSIhtKOkRwkyE5h5xrGubpFeJQ40fK0oiF2mWXmVbYrDoAuHib7Xw/FudttT6TTRiV/6XGSpJBrcJEVYpD9MjYLO6f9l1S80kiLu5NMdEM3JTLZdQrzLSPZlUdBRK+vJQUbtUX14jrrsfh76WGg1p6D4n1588ImoJqVZyXlASKAfX29V7SHeX0nKReyek2XwpQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxlFW09Ik2TJynzAO53w4rjdtx+fHy7COc8B3oBF96k=;
 b=dcZfDpgq9eY4MXd2dnDcaIimWVbFdj57slEwVH3K20070CrelloFT/NoPojmYAqsr1mHuoaGDX65Fz4giA2qLPy20Fp8XzSM1SRYRcjR9U4MGHqQC5OixAK0O9toC4GrxwnJzKtE6JPvb5zHluHbGPrnRkFUBw8WgNY5bsxMjs8kgmF5dhrylpJPqBEgAX8A3q5l4A0XfaEOprjpVcVguhK1GnkHEmhoQ2Cung8uEk7robvtZbvk0ReYGrk6NnRuGhgwaSE8xcY1xyVgCYDzl246OqljQdpxM6dhJO7PojPddQnvxT4i5/Ted9OqFgAN+4DeO0QkJY1XvIv5fkC/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 09:26:46 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 09:26:46 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirtd: don't allow named.service listening on libvirt network interface
Date: Tue, 12 Mar 2024 18:06:19 +0800
Message-Id: <20240312100619.1724680-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ0PR11MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fbb6882-dc08-44e7-de98-08dc4276894b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c66EacPuYE0py18wHYUptnegpQrfI7Mc0BvWQ6xQx8m4NSUA+c7KHr3UOAaDdrT4xrTrpfdWx5RPQRSnHk6m8EDpLhrPGcY0EPwIeRlEkQ8zM2JE+rlwoHpjknSJxHwzNYaec2QSOG6/vgj8ETcElSqDzIkUJpitYKx5muaCqQKB7a3O7jI9VYhi+S3nla7o2L4VvX+AoTC1KrsaFX8+VMnJh+FG2Yj8pr4BWU9M401monH3d7o/Cb1kGJkSaJGokXSifrw0cVhJuJ1Mf9WdFLrcfEztfPsnxY7GksansoLxA3KjH2a8N1id1PfCdxr+wXuXj/DWyKrc7m51CBBLEY9gyj79HTnOJ4mecKkw7OELQB+u7TGHojOC8COAYqG22e1bAVYmqsUvrzE5RYvAim/3yz6/6gbKhJzOGVZTsoYLDqLZW7iqmwv792a5WL4qqBNitkPrY45j++twBUMPH38buG6kZOf9PN5WuP8eUj9NACitF+bgXEygLpgoYAyaEun4Z7esLUd88Wok53YrwF60inev1MzO9WPo6ZrOjhbOq3awt9MEVqeuMqo3WawWGMD19aPh7AdtFCCCYthoYI9toZF8rso5fZNyaSWKvACfLlISGAnudqQPh4qLKYNJz/MMi9oyf0rS+XwtxamT/mWiqxYDCC52yeq+HlArMrsJTAU/fDLxfu4hqTBrtbbOdnWF7Zjs5h6f2iZxQYM7K8dPoMaHXUJ4cHmWUjNnMUo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d04oazizdqexVbEgp/jEYEZlyE7Amqxpufa6ZIPchvAK6yIjJw8sFj4O6nJo?=
 =?us-ascii?Q?GUaFeJUk+L5zR1x3vR2IfVENNKmevxUyCx99nhrLaLoGVAROZym8T4oZ3vWy?=
 =?us-ascii?Q?Dis8R5jZFI7BnsUKlByxJjnJ5oE7o452yJUSJV8X1YqpDPnyxjt9QIlBwGAE?=
 =?us-ascii?Q?v+c+I46SGUvYSkCDz/O9PhMq7nIeb+yDLYtMzzl4sDZNxzFxONrX1BezE+MK?=
 =?us-ascii?Q?N/NFxFRN/L9SZI4JltLQkRkZFtBivkqG1o4qvrDCcn8rlCM2Gizmlq/+bcCZ?=
 =?us-ascii?Q?sCPtcxwYIv4D9Y+ELBYaTQaDtX8xDW7eIpVKRRRbIebpcPFuBmU+Q8+3oNpQ?=
 =?us-ascii?Q?tUwe/12fizUBY1wzpGkj1SIwbnLRt9VAYFQeRefGkZv1zURvDzA9IXzp1puI?=
 =?us-ascii?Q?iitFxQeeLvLVQaF2kLBCw0yHxPMLjp25GtqxQF3qWbLFKFDeRKr5OLK76zDJ?=
 =?us-ascii?Q?ASStdP7YDGwX0GuxKMFnomKCBfx85FU5cdhjruYsaZomIBFWQvFU7/m4oFmY?=
 =?us-ascii?Q?ogow8Y0bq8OTJVFIdIDYVfuRBtWgyp9CJyWsytWl1LuBkDOuwpovnhFz6EKp?=
 =?us-ascii?Q?w9lCjbW2mKHeCnwYxeaZ7GutTzTyEMerycD0tlLCiOGn/JhX6djSU6SZFTIL?=
 =?us-ascii?Q?vB+SNMhxeNs+tsu9sZ/POVar786HTgSitPvjD0r4IMLjFNyPxtbiRUVgKTwz?=
 =?us-ascii?Q?qA1HpIuHIipfunmd2tfD4roAJ5Sge0cFLUZQMJDKbORG12jUx9AhhDjttsxL?=
 =?us-ascii?Q?fwdpxsot1WfFuLigdODmPRPfNjkjzcD73wy+hnOWFOSqtqJ0DUv2YOrbO/1t?=
 =?us-ascii?Q?WQ9vjHE7NqUopYDKYlcmkmeNXMtWbHdK3+pb5LAZNI5oDrnm0DLSXocsSAcH?=
 =?us-ascii?Q?oUQcj8AWC1OT6rKOjvkARYMSiH3CyogDvYdku2dFFu1bmA/tHQI///pjaLZe?=
 =?us-ascii?Q?iFNGzm+nQsCy6HoL0OewZhHuBunIepDEIM4U6jXxeaFA/HLBunGNwmpGgVob?=
 =?us-ascii?Q?vWrH8Lg6K5/ClyeAET6A4sc4sOkTaZt11Ehx8+oxHWFmfKN4gP3xARjfvfdL?=
 =?us-ascii?Q?FSPWHSmxMaaCUtAYrEPsVvgdtXjrvGRtEZQwG8FFm0u/H95jEnv4jBxY5hqI?=
 =?us-ascii?Q?QmDEM0637YOWntIx30DOv2CQnSr/aTYwSgozWtVYHgHKD7s6GpZ6x3xK/3DK?=
 =?us-ascii?Q?MW3VstayuzNiXylh2sGyW39L49uBnq2AX6jAyeKT1/USzS2yFDFZc3iUxqHl?=
 =?us-ascii?Q?gQH51NcGvK3XZLhG4fDkI7PPDotuATEkpwWnBoLOSStmb3D5vkS6MNvOD/Id?=
 =?us-ascii?Q?OguRAK64zUAnISj6YzR4u6/IxuYQ+KZsnu5oWx0e1AwQ3gdZc7vP/NyXXY8r?=
 =?us-ascii?Q?LGujEQj666kApU1UbzLHDQc8HpYejuVGki+bNl59nC81xQ9UAl8WVKG+SzqL?=
 =?us-ascii?Q?ppvmtiYWTqYOWvVO66Pspk2pHySncodbkdUCgqUeWqAS//x1BsqqBgHVTtwf?=
 =?us-ascii?Q?KEwQEPGFQ4Nwu7zXGh8Q8MbwMJcDwzA2KzB5DSxu9QVKwwrXim9Yz7gfLRZN?=
 =?us-ascii?Q?ljSz24uqcZrIdqlhPv87tHi0csP5HMbpnBu5hIBPPmHVYcdd1I3JVBOWYivN?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbb6882-dc08-44e7-de98-08dc4276894b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 09:26:45.9822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6KZy+hgWztMKSIWZzPJiXLGWaIYMFMPW1+OSuwmzy3VpmL3KSvriTOowiIfIKyR4mhQuCrcIfE4qfjkRo8qsYcmiHpP9yczsDkmuT4SCLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
X-Proofpoint-ORIG-GUID: fv4Q_tNNLmSIa4KvUbd3xQaiyvD5pmxr
X-Proofpoint-GUID: fv4Q_tNNLmSIa4KvUbd3xQaiyvD5pmxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_08,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=915 adultscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120073
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Mar 2024 09:26:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8627

From: Xiangyu Chen <xiangyu.chen@windriver.com>

libvirtd has its own network interface named virbr0, and it using
dnsmasq to setup the DNS. the named.service also listen interface and try to
bind the port 59 on virtbr0, that cause dnsmasq report following error:

dnsmasq: failed to create listening socket for 192.168.122.1: Address already in use

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-core/bind/bind_virtualization.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/bind/bind_virtualization.inc b/recipes-core/bind/bind_virtualization.inc
index dc63b2aa..a6e39049 100644
--- a/recipes-core/bind/bind_virtualization.inc
+++ b/recipes-core/bind/bind_virtualization.inc
@@ -1,4 +1,4 @@
-# Tell named not to bother listening on the IP address that lxc handles itself.
+# Tell named not to bother listening on the IP address that lxc and libvirtd handles itself.
 do_install:append() {
-	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc would take care of this address itself\n\tlisten-on { ! 10.0.3.1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
+	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc and libvirtd would take care of this address itself\n\tlisten-on { ! 10.0.3.1; ! 192.168.122.1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
 }
-- 
2.35.5


