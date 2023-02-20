Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83388C64EC4
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 04:54:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6490.1676868880557556820
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Feb 2023 20:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LO2VHnJQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14150b1c1b=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K4jmoT012246
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 19 Feb 2023 20:54:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=dho38KKKe9Gi29JETCf/e54dLqaXz/qpQ6WFQBw8/aM=;
 b=LO2VHnJQ/LT2wbLtDKmhf3N2RBuTLQCpaYA4PyLx1H4AkW+rsP0F0uGIuS3ZBVI3eSgM
 ncqnFMb2YhXvx5u4gk894o2cBVT8UOFdLyasiZ0/Aof94MT1YdijHCmbAf5X/2V4FKST
 7zmaBh0IDvfUcV91Tol8mATcNHSsGukh2g/FfjEcfnOQubFmOfZfbJQlLiif4XO8Gh3f
 ixdYKeNtX+F3N+S1Y0HyVTjyftjwR//SJQRKqjMp7jP/vU/O6m4WrX1LD+GyV0gbjXwe
 tIHn6PfWaebrQN7dMSg2gvIs5K9CwWCrB5o1sqf2FVS3RDZhLVwiz0zqN9HQCmBcumnx zg== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6s9dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 19 Feb 2023 20:54:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOPlcCe4S7wBwbAFlo5b2ZE1Huw/GKH/LGP45BA4hob/efyShLgPvtkjbwPpygw5+oAop4ktD8xWvFY7rwN2oU5Fg7wSuKTLEOXTcFjeL3Uby/pzGqo6unCBBlGTD7GbdQNsZjO5Z+KwFfoI1vBURVsok3OK83na0UYtOzQVS62ryBP0P4/BqHDosLxv3ecJSyfzaK1a0wfEPvq10/c2s1yW+rME+dWpBHUISxmNAOSvjxuCaY6nNGsku5/jC/Rxu71L55ttCC7X+Qp1AkHhMHQzNVa+T2BAOLbWf1aG0qd/rnCIF2aEZFsJIcMAUWZLSFITFQYQXwGQsATbgX61nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dho38KKKe9Gi29JETCf/e54dLqaXz/qpQ6WFQBw8/aM=;
 b=C7wfsbe8wOlrgwn7iMbhEfqyHO/kz9m5ndqEYDcOWhnRbp1th3g9EGwJW3vKzWvGXrEPTKKJ+c2GbXeztSi7UDKC3a2XHsxnzB7aDWWjgInkObc6rH/Q1ctBNs49oaCN3j4WTEze+O1Byp/A8JAHcu4wsDwm6cdsyVUr/CqhHXTJAmKp0kiKllZWlfsZxefrmzVMAzVtDvMjLWgivj/rUaE+MyGCOCmYs9USekwsF0Rxdk6BbZbQ+h79jG3xFQqiy010Wet3bjdiATgsfe+Dskv5KbAkEIwjuEYp80p4R1l9XXhIokFE38Y6GX+Mny0b8QvKCBVQfKFlCPfbC12sxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 04:54:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%6]) with mapi id 15.20.6111.017; Mon, 20 Feb 2023
 04:54:36 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master-next][PATCH 1/3] Revert "cri-o: install policy.json to avoid image pulling error"
Date: Sun, 19 Feb 2023 20:54:21 -0800
Message-Id: <20230220045423.84802-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d8319b-6a69-447b-deed-08db12fe90c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OitU4Lqhm6fhDGIDjKDgWeC9gXLbwRlZb0jehRVS2QDJ+irX4OtLWMiuxhlpojkfHsutWggsWJ2SVZf0NN9hvinIZnPQwjvObgI5RMSdV06aBHz49euS2wlpiw+so6trVsDm7u25JKPBrxNgoCWJ91Ryur/H2aWIEKqeeexHRcGJFY7v+a6Zrbc1YrKevHKecFQ4U5VPARG39aUgHic+ARZc4T+TZsn2PLVqyD9KWemgwDNfIZC2Cxu2YC+h1b1iq5l2Iyc3afAy6O5KWjR0osmQVBi5OQf8IjH2tp0Fz8l+x7uo1fm7KIwlI2wnmsLXb0pYXYIID+X2cn0RxoGyFDTY4ebyz780M306P5lZcXGvPchUG2stHpK1s0nnbzeWcsY3vPwkLp1mbl2IYHkzLbue1cvRL4c1eBBtwbUtP5N3maRt/BMl+DbVn+RHxHdPd82KI6sJuCVmpEYWffUehYldIUSY8frMl0g0C6+xI1v4wWX+7S7vUnSktBf3/ExFppsC5kMkSy/lJAV5aC/ZXw5JsC850cCdJS7h7Ajq/ass5quu/JV/BW1UH+65r2xJGcsj6c2NupKl10URqREaOmFDCV5Op/uK00KhxdF3duMm8w3I2bjK24ZD8CSfcl80yyNkJS1bN1w+/tVgOIeFA5HW2p3NsiOsOneaxKj1jZtd0vS2SEiAeK6tNmdq0ywc89lkHpjKnOLXCyd+BhxolA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(39850400004)(366004)(376002)(451199018)(8676002)(6916009)(66946007)(66556008)(66476007)(6486002)(316002)(52116002)(8936002)(5660300002)(41300700001)(86362001)(36756003)(478600001)(6666004)(38350700002)(38100700002)(6512007)(6506007)(1076003)(26005)(186003)(2616005)(4744005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dt2EsTnvNdAhzmDFMpVsWsQ7xFZ5AMTKzVvyCzadScHP9/e3CYD6j2S1+0A0?=
 =?us-ascii?Q?3+15VnSKXHT4FRyRSzMwdxZZOMhFBReOioowjzRcxS59RKeVa/r4mhqf4yIU?=
 =?us-ascii?Q?jmIeBYR8P+InMHQpiJGZeK0cGYmV9begXLu80IlvigGVTCzyxgWnkywYFQGT?=
 =?us-ascii?Q?CRzfu9G9wloyhvq5AVti3NbJec/XYwmen7hIA8voNUEgblHqK2zFniRdyGTV?=
 =?us-ascii?Q?w5KbQ2cJaIQNARnYFLodE3aNIH/h3zItqBbyvwLqoaVI5BwUdpW01RrMcsk9?=
 =?us-ascii?Q?ZzUstfQl1rTHQWc2ps8haLvMqdGc2HZhU5UztNCZbgpCybUE0lu41Sk5AbUq?=
 =?us-ascii?Q?dNb4NXRIvQZQ3FSTvsXe+BERYAaMpp/K9lcBZHqHiUojHmFluBSqkLN84jJP?=
 =?us-ascii?Q?WlMnGBEn+E9zNAs4PQe3KGQSflSrrh0poaw/8yfnggXOBo0XJQ++I0MNZ5KE?=
 =?us-ascii?Q?wcE0Bts88UOnyJG1ZbwKiz+fapLBoTuVsELk50l4Y/ad3sd9g0Uq6IbSd5uC?=
 =?us-ascii?Q?x7AeaP9/XCjwk4TCdc4YRXw0or2ZzDizdNH3gl0muZ8jK7l6ZU0w+Ym8/Qsd?=
 =?us-ascii?Q?EHfkjCpEUrBUncG+PCncgfVdRrcQlxcm2BPmiogEzUgGBlSBKybZpNJLYYhM?=
 =?us-ascii?Q?EQ//6s1EP9ybZIM+VCgvsOZRVc4CjeYnoDZ3eQSLzTxVrnbjciJA9hmYgFaD?=
 =?us-ascii?Q?BeSjgigikJywf2zeJYE2fDbbRa60tc6NG82Y1NiKtit7j5BHD7UIlGxOcd2D?=
 =?us-ascii?Q?2QqJB8xnhV20dwL7MyElYzuszmmxFpgyl0tdHjRbGWIh+w8drWoQSv1vFvRA?=
 =?us-ascii?Q?3lZbvsUMOcq47n5yFeHk0fhp3Sk89h1G8ZnIb8FGUaYv6tnOjM+ce2dFV0B4?=
 =?us-ascii?Q?ESvjpN6FQupwHOvi8KguzTi2DLPdIt6PTBhLnVNJKkC+5cHFIqJmGlwKJPKM?=
 =?us-ascii?Q?3kIrSAh8+/p5oqTe1vuHMYQgh49T+G5cb2PeUstZ7lmFT321EA6w47APy54u?=
 =?us-ascii?Q?uwnGWX+f05jGx30IYv7qyoN/xsWDOxczJ9mVy7T+tIurkBYr6L9l9ahmiyop?=
 =?us-ascii?Q?y35EPZBBl9dvgVfG5oWt2TIG8wnuBG+hmFo/txm/fVwIQNYHxF/Y73qGOmQf?=
 =?us-ascii?Q?i25+d7Y0nXh06ljVS5WObNrGseWTBbBrvJst1PXM7lepJ0Co8z62YgwBg0BE?=
 =?us-ascii?Q?PtQ+cl2jO60YklbnOdRiT/CJ292yfnrAK1cElIJBVaXAJ0+UoNhJMWYRHemW?=
 =?us-ascii?Q?NXiMXvaA4uk4jzNpYqkbyL2J40KFK79zmFoZW7RM3TtUyZAb4M9+VFVAMN+0?=
 =?us-ascii?Q?6AoKQTnZgnM/978/K2D5912MEDQ4raHk5QsVC7CYPg0NfbMEAlAwvFYzVXr8?=
 =?us-ascii?Q?HYDY2BkNKQGbU2KKceOT0VZ3krxdAW12pdEGXB1zLO3dc5ebYmWdkJ2p4Z4l?=
 =?us-ascii?Q?IiH1neVqMEXiAQz/pRTFMwEnBXEyu7zoLy4+1debkgyZU4qmFKAiBKaaRja/?=
 =?us-ascii?Q?WUU52LNfJGQ/pACLdJHnruEfFLVuSpmp47Fvnkr3tER9YiRF8hYRKWjSpfEe?=
 =?us-ascii?Q?hkDjN669XH6hujReqYN8ujM0CD2B97VBWg9ClDjOgBea0JZOd7h2fgVpEnK1?=
 =?us-ascii?Q?VQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d8319b-6a69-447b-deed-08db12fe90c8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 04:54:36.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Wh0brNEcbe0be7FLQCWhsHiRl9eicobffFLnG5O1YhTXP61J/JvGMz8ElFQKmxdRgi8LSAj1U4R5j0WdOUQqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
X-Proofpoint-ORIG-GUID: pUHvNkCCtFLNmVlp6chX9K-r42eic8jf
X-Proofpoint-GUID: pUHvNkCCtFLNmVlp6chX9K-r42eic8jf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_02,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=966 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302200044
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Feb 2023 04:54:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7881

Do NOT merge this patch. This revert-type patch is only an indication
that the original patch on master-next should be dropped.

A follow-up patch to master-next will be sent to add policy.json to
container-host-config.

This reverts commit 3a905978b2e6eb558072e65b2688a1ced5aa50a3.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 57dfe8e..9467cf1 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -98,8 +98,6 @@ do_install() {
     install -m 0644 ${S}/src/import/contrib/systemd/crio-wipe.service  ${D}${systemd_unitdir}/system/
 
     install -d ${D}${localstatedir}/lib/crio
-    install -d ${D}${sysconfdir}/containers
-    install -m 0644 ${S}/src/import/contrib/policy.json ${D}${sysconfdir}/containers
 }
 
 FILES:${PN}-config = "${sysconfdir}/crio/config/*"
-- 
2.37.1


