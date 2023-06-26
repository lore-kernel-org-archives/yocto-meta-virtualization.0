Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E53EEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 06:44:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2278.1687761882663084238
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 25 Jun 2023 23:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pWR75Z+u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5541ef15b8=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35Q5s1Vb027714
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 06:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=sm0Cvp+OJIv4LzhBYm
	m/H2aK+JPfrnXaJO7iac8uI6I=; b=pWR75Z+u+bsSCSPh0GDbwO6OwLbr+St4Pu
	539FwW/NlSdRcLucNkX63FzVT5CaSC3cZudMxE1DQyDaEfyNs8CkR4MIdp3SHIvv
	F56XxZf8DGzkyByoLI/lAUAWDax8PKKr+2o31NwU47WW3kqBU//SdeJwx0Fbmef3
	VO9xf4Ixp9zABx/xOtqoqY8Ttz8MbzisXdxsY5Q8Q8gozM7giZ+7lcvH0kwsOm2k
	1Lebo/7a51o8X2xCwIRIvR4Y19SGQpy8WfIjJvzEtVzUCAIK6jJ+3krMY/aQjxqv
	rkE3OKvH5f0Xqd59vNCKNrA6dh2w+zw3gsESsVFyw3T5Yeo0aekg==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb1gaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 06:44:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3H8kFLbdrwZGnd87KS2xE+YUmHeia171b51kZi8mqrEayGpGlKXWsYa4GLbRLWtgF7KtVUhXNmXx/Oy3p9lbg9kz/Vzbfu4KUlAyDxZ2sIQV59oqKFEDUHYOct8ruzu2tKk/oo+j9IQFNJFrRSmsgU9wsR7a2SI4/7d2qabAQ0WozDZMhKw1MkkkqhIBESarY51D57QDAIArLzvdl8w1jgFI2biKUExr/eeKJVSVzyY/t7TOdIKS4NkCEhHMvOC/tzWyHBRBCXaEUQAVRnWXiiXhxJ5ZeorWmJxVresHJ7rXAWraQgPXVz2EPClxl4AqZRqkNJ08c0vrYpzhJuGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sm0Cvp+OJIv4LzhBYmm/H2aK+JPfrnXaJO7iac8uI6I=;
 b=gaCUSpeb7QmAvDsL6YF108jPMMtYh8OT8IuPXX6cuEhn+AD/0qTHTDS3BycFLw99rz8mGhu5Znos1Z161NuhHkcEtoYTadj3b1beomui4JGFVZma98qtmsX3gvUks1ypOO/0lCF9lWFdKDxRbFNKolyR07A+dlINOiAZw+kkCB11uzJIBelrPl+as9PkwZuKnp9WSZ2IM6u4tqCzYsvE9du1qnjHEmXxE28nJc2u+3doGqCyo1+UYci3UwRnVaO9/GI4gr598gQMwEgAkPMHKU8HDXe1OMzkc6rB5gusjpXS9+L7pk2UPwuAtmybkVVLo+Youu+f6tbEG7bc91THaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB7711.namprd11.prod.outlook.com (2603:10b6:510:291::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 06:44:37 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6521.023; Mon, 26 Jun 2023
 06:44:36 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/2] containerd: fix HOMEPAGE
Date: Mon, 26 Jun 2023 14:44:19 +0800
Message-Id: <20230626064420.1012760-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f52c68-5970-4cc2-0e7b-08db7610cec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XGxd3G7WMFjhZyJn7SM2baTuz/+HBrtrpdi6eDnV4X5DrNC/ExZVvbMXoWDqTPRSymweVVu1RbxCAyQNDQB5KkMwpS8uudMwZTDlfDd+9dMBli9gOsxyHUCj+IUOp18pp1YRLD1j/HVj+i467X6Kt9HjhW/AkxzMooz7zoIk0jqmiXmI3ajgFPRuDNDmI3SFGA9u/O90YFrBj875Dx86V++RnBOnCCsmk5sQ0UtBI0z1e1Tj2OnUpInGsBmX4emsGCPPD3+PUYxmICC2qCeCDGfSeVjS4TmtWOk6ToMZvo7DF9ZfsIne8rpFIHtupaWGMj07faTks0eys3HIeScLoD6YpYnoGJNHJvXmIcyuBrKsLz/K3veRu+hUdDeO1Q8ydBrcGVySbCcQ+Y8Qz3DqqPiNeSoPJK2ewrvv9wuKZBao83msK6IB7WRM3RozCjLBHiAs3PLLzOcZU9n10i2s3AxD9NO/JFvsxswLg0e49aPP7DUKpBwHGhAfpdJ4cfJVw9cs85LHbwfYquOqrvdvow/uWf68Ia/q1p2iaUFse4P0+vpKWOmyyo82RFWd4L7ph5803LrLyc9dtsYKASTy1ILQzJps1iWmcmUj//xz2coqJxa2aqQzNzTXY5vNrk352jbPNLMKFvhGKFJUetQ4rg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(39840400004)(136003)(346002)(451199021)(26005)(36756003)(5660300002)(6916009)(8936002)(66556008)(8676002)(41300700001)(86362001)(66476007)(38350700002)(38100700002)(316002)(66946007)(6506007)(2906002)(4744005)(6512007)(1076003)(6486002)(9686003)(186003)(6666004)(52116002)(478600001)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H3Cnfluqfwn3CjXwxRqL2XBvecDoXvOpcUgcdTGIWwXavEgiSR4PZ0fael/y?=
 =?us-ascii?Q?BQHjPjc/ZNvtPb5JxofrdB7EDJEXWVlNWSAN1U3iqB5FXrZURsgOtbCFvhPO?=
 =?us-ascii?Q?oCQBzp3qoes8kyoSl+QUryObSTo7u2+HiZFhmdFpfgW0D89vhH+z2yFMWl4Y?=
 =?us-ascii?Q?j9H43hZNju1S64tBZ6e2ShAwor2/3V9ykydpbDTEh/TvGBnQbaQ6pyuKBTXr?=
 =?us-ascii?Q?W6pK4ZwvJKBCIoDL4OhTHxT5CfeuM5eF/IR1OEZo7nQ60GmeWhdm5D8Fe5si?=
 =?us-ascii?Q?Iaf2Mu/aXK28nyCTrAPlN/9Y8gkuUu2KcTSAeYB+unsp9JKiSqvpxfHI3mpX?=
 =?us-ascii?Q?zF90CKoL1pDyAdq38Vp80WeO22SHmYnmPCDuVfKjgsdGQGPIBP5bqRjrXA4I?=
 =?us-ascii?Q?iN3v9QHSCz2vBLX1sazbRRPMUTO0YCn3Qsdy77vlMlNdZfg/LulIHtF0XpgV?=
 =?us-ascii?Q?VGhv+g5naqD5XOMQAtIiytWiMSJSeu3y6R06SZJoIloZTypGHkdY51+P8Iv5?=
 =?us-ascii?Q?LYPavgIhkhjq5xanl2JqtBtZBmXcGAy3Zolp5KMR36HLxdbqNRRrDehtfNZ6?=
 =?us-ascii?Q?cM2YE9hTsdF7417s9Rf9hyGkdZP0PEyQ8ZPs/rC+6OQLc8C12Nt80fLtJVHj?=
 =?us-ascii?Q?SOo9W+2jMEU+aumeK1o6tG9N09QbdjhanJgRd17VgVVW4qTS/jwIKbL20UbE?=
 =?us-ascii?Q?RGilPWmjv34fLn74t495GOm2/v7Zbmxfbd0BUEZWaTT1FwHjyDsseSXIwNoi?=
 =?us-ascii?Q?8yt+KrVNF2ADI++1KO4VhF22cmv+5WMeuhLTAUwMCZySCWzYC+WUkJ8LKqPc?=
 =?us-ascii?Q?7Vo7iN/ys201BvfTq5vx98upknTFO6LAQUy8plKgGXtU15VC6ykKby8wM0BN?=
 =?us-ascii?Q?cwq0hXzT0vRDiCyi7mYzSlBqKOJRmVs6TdSrpSEoDmmo5MGrHRyRZFm4O2os?=
 =?us-ascii?Q?eFAudj82HYixlgGCS60XjwmXFluYCCZErQ+hsgPmBemo2rGLBGYCg8W2IiMS?=
 =?us-ascii?Q?V9keMAnCUQuayp1N1zEjTg5o7HxOTtPcwwFmBfvzzaENWl1TxTCwV3NdSxYo?=
 =?us-ascii?Q?7bz4xciYAzhJeO2CS9bEcMx2AFDZ6Epr4V8KusJsI2pWTLwI0qinAuDvSri5?=
 =?us-ascii?Q?raEu3xXxAawxgEznVP1SxCGKSJSEThTSzPaUX9ExoP6ZISTuKAhR9MKXwcG+?=
 =?us-ascii?Q?GzBezPq93h3iqtgLgL8ytGsNzFTar0gwGLbXQ4lArXo07ulT0YInsmj53rz8?=
 =?us-ascii?Q?VbRW2c3NjY8SJ1OAyFrNKRwTetPghazgijns5srdV3JsQffd8JsZ9BK+acsq?=
 =?us-ascii?Q?KeGU4biGzdu7aDk+0xvCCsw1QQlEF2EJpXBc3UtN+yHvRmP/QCPlLC2jzaYc?=
 =?us-ascii?Q?/UZRuGGIoE9i+bHD1YJQQufiO1eh6gYcdXIUMCLiPT8zMwRn8ovEIkT7w8r0?=
 =?us-ascii?Q?SyS5ALhDciOnfklVX0SS5RPfH05RIt/umesWwGyuwc19rGdP0zaH0fEKoM6X?=
 =?us-ascii?Q?Knulgim+1yQVFcmY8drg7iNaEhkL5XRqwOZJxag+YFgQz8f+ykYeM5IS9zjH?=
 =?us-ascii?Q?aNT2uPbhq/CwwO5k7DcSkHVINVdKGBeTOo+uUB/k?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f52c68-5970-4cc2-0e7b-08db7610cec6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 06:44:36.5689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLtQNyshIwr1Foe1O6jaOsF71ua8v0CNP0hhm6WROhhsXw50azh33F8lhuaMy9rzkCPR+RWHDLXj6oEZDIvQGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7711
X-Proofpoint-ORIG-GUID: 8pBSnduUdpkP3SYjoB0-u8HHCidpUqSf
X-Proofpoint-GUID: 8pBSnduUdpkP3SYjoB0-u8HHCidpUqSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_04,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306260060
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 06:44:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8105

From: Chen Qi <Qi.Chen@windriver.com>

The previous HOMEPAGE has been archived. Use the active one.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/containerd/containerd-opencontainers_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index beb65db..c804caa 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -1,4 +1,4 @@
-HOMEPAGE = "https://github.com/docker/containerd"
+HOMEPAGE = "https://github.com/containerd/containerd"
 SUMMARY = "containerd is a daemon to control runC"
 DESCRIPTION = "containerd is a daemon to control runC, built for performance and density. \
                containerd leverages runC's advanced features such as seccomp and user namespace \
-- 
2.34.1


