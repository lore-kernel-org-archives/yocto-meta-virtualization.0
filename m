Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A636ACCA480
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 09:45:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24961.1654854323382452293
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 02:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dA2+MCts;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31600aeb41=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25A9Y3Fi009195
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 09:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=775SMGMKoWU/Nvkoyn6lVc1ahb1gxKBfMNNDCBQBo1w=;
 b=dA2+MCts5zu6RvFW72DI93yjBET/RP1pnZ2TRSCstrfNFSqldcpgjfNMGor4FLTXrl3C
 6NeSfoTSk7m/q/FOak0kEPNJ2vekykn/gSh2PDmoiFQuWcZ4tGcLBRnxeiABnBScY1iD
 0dkx55NaV6GFJeY5iVqCUr4U9P3vAXG72a3VrNhfV3uxicr8+YCsvP8f3Fz1cuWp87Ov
 wNMhThpEhhqjR3eYO11oPCfZtnL/mxbUF6afBAJfjlALj97eSm/whepAzwayvXFiuZW1
 f5thA+GuarKeBofgBM7XJUvgVk2jDMdViPFPFF9wv/eAWe3Nw3alJ9lDOnzvXSoMQLNn zg==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gkuvb080g-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 09:45:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBQcOe0GuguGU0NQF9VK3m8nODGs3mC7RmhGaRndg9rzCEAHYIs+aKX1nuUCRlXEmZMqbMQpjGnHSakpQomu7rxa9te5jEAaDuGKq1Pq0D/UfYj0PSO/eECJy+Taxxpp2zvnHNcBAmVVlQ8SXLC6ul9MHnAJM2GZsFr9kVHArDrYqyklISaP/rEE+gZK0v32XsREi66wRRj8ojjVUm3QIPbyWBpoHQqDa+VwPVayG4rg/+GyYWZNnr3xznBSAJiAol1EBd7DJleZiwJtDWqN47elNKphIESzY+HiS1IQ2db2tBccf8TfNHYywCqGgjjYHfH7XOjvU+dVz1I8vLyXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=775SMGMKoWU/Nvkoyn6lVc1ahb1gxKBfMNNDCBQBo1w=;
 b=XAR653KrPZNLJJkznppUPvf+fVHtM9Hj1qC7kjYl3Mj/q6nta2iTliTgQ+F36cDeQD3qTrK6i1IXWbHk8KR3EZ6g59dzFKKYYVTIwUnfmWTfdBENAr5TdYul1zK9+YB+2QXC++jR+LqPtGmqXFo4brPcQfZLy+XN5e9J+sX0UV05J5dVRCeoH6iv/tMdb+OVEQcWfw+I+983yYxDjWyGbQjC/eBYAfzjsDh4kxCL0YFx5FJ8Ig7NTmWnoq8YI1iKw4NKolJOQ/NLW9UjuysBIImD57WuaQXxNBCmAnkawXvUuPz+0VNOYQkDKmojAQsBHe/MusRyRkga4QZcQaYrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY4PR11MB1365.namprd11.prod.outlook.com (2603:10b6:903:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 09:45:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.015; Fri, 10 Jun 2022
 09:45:20 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 5/5] netns: adjust inherit and fix CGO
 settings
Date: Fri, 10 Jun 2022 02:45:07 -0700
Message-Id: <20220610094507.74342-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220610094507.74342-1-Qi.Chen@windriver.com>
References: <20220610094507.74342-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:a03:54::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36eaeb2f-cb05-419d-74ce-08da4ac5eeb8
X-MS-TrafficTypeDiagnostic: CY4PR11MB1365:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB13655EAD1801B209DFF1D773EDA69@CY4PR11MB1365.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pzApAN7Hii/Yr4h6EUMihIuHlQ5rKS5osgDTsDapfnvgcjNHgzuJXy78r9ShYsF5vnZE823eWyCIdxhFflNk9/OZm1kAAUnFAmhFuAAeSWIwPMNv9rCdwbfGU8lKdSlnIeEihHCH6Ltu38MR5a4OhPTeY7Tn3gn2Lh/YEdCmBFC9ut5BB3HGuImT06hBAMKiXZpykkuSE2pdjfPHQL2L2PoD8VpRF8P2SuMTEWdd65NNMHRwQzsZPWmo6WRZZu9whs3Oue5RSn/TPD5XhchDJTgCW7rrpHJ2iCaBNycTZQTMGha1yyXO7OZX9z10qe0DXdxl+8yuUts0q9f06aLo6CFFGpaGTVM6jNqH/HoVS+WDeI893cfI5vX9R8Th7JVFdKnRtoB4XF8oBcfF+4qqo9SK8+k2GwDDHh9qC55G/X6aKnUIl3BGJUjPAstYnacXpSODYsIeOcZL3n9R0/IQ+kFWZGx/hY3Zv7jyGP0wryI75Fr3rofvthPGKTSgY/CiaSyUipX+d6Mbfk/v1Evb+Lu/h0lNysYXk5y0pjY96b9HMR67YmXYFcy6gw2KfvkYx4gqzmpA7ml6/CYYwMlIV71rswRKuIp4g6Hv9M4eVIu5ywlR8p+yctPBWViqIcpk0aPlljejIYPVv108P8uI5I+1QBBsz3gAIaGP5NCYv0bUoycH1tsWbl3HXlJGpQyZWvL279GzqpLePAMcHjXriA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(26005)(83380400001)(6512007)(5660300002)(508600001)(66946007)(66556008)(38350700002)(66476007)(38100700002)(8676002)(6916009)(1076003)(316002)(2616005)(186003)(52116002)(86362001)(8936002)(6486002)(6506007)(2906002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aNwYzFJCkiAvPWnzS3ce34WRPG4ADhkGuIwR+zbVlgvLLf3q/hmlPbm72GvZ?=
 =?us-ascii?Q?7Gl0Is2+AI2SStVzWLvOh3d45aNAiDX8g2YY00K7zmZu8kkjp1sFnSsCPVG5?=
 =?us-ascii?Q?s3lRXl5mshm/b9TAhI7+fjkIWC1vQuQcDj9m6U5P6Alto8NTq0NcePsygp/1?=
 =?us-ascii?Q?p1+8lVwYwrMlZg2qwzbVwM58eMPX5o969GNoC3KH/CaK1+PA6ghdbGBPxN4B?=
 =?us-ascii?Q?kdhElTSRpzQT23wkaQQWYmwl2Ve+pKzx5j+f6Ol9EJslUf78HA5JfP5pEDlT?=
 =?us-ascii?Q?z7ycm81M9MgctyRfWrVJ6C/bKbZ0yoOnexy45ZJFzzy6Js+9akY/TYP8M2/k?=
 =?us-ascii?Q?02PXVdZqgI+3++IUFZoAl1EAJ6V1HAoTFoAos/PL/UvgA7hoqBNo5GJ0d7x9?=
 =?us-ascii?Q?9YOvlz0a1/iPjQCkI8HDaHPn0BeynJWmQZ16ZJhLlhq60LCQz4IN1t1N8Upc?=
 =?us-ascii?Q?8+l6bkFOfUcNlMuRo4cDfncJnXbm+DVLAGTx/tikSuZXXSHXywFTwGMT7eiy?=
 =?us-ascii?Q?blMdsHEtBxriCTHpfmoB5UwCQTc1aYL0BqAcu2neZFrG79YcsDst15G1jZxM?=
 =?us-ascii?Q?xOoOT2gUUHEwk98rvtqO6cvmLmq6oRphOjheXApwU529VBRTS9WalxK1TC6l?=
 =?us-ascii?Q?jKK2Az55HXTcMzcaDj6mwhE9s3Ru2Vvcur7A2nvqAS+AQGJfyqFlEA1LLcId?=
 =?us-ascii?Q?5zj8wontP+Ieb2t0Rcw8LIuEUoa6pc2U3AXgGlw/3lZGabaGRUJmotUyO/eZ?=
 =?us-ascii?Q?zMC0OiMnOw2wkpCJHSCLMhAK12gwnNUdWSvY7YOlRWY4U+cKVZifIxl4//cQ?=
 =?us-ascii?Q?nQvCJx2rB/kp2PYGB9PQZoYdCdT0Yh/k5dCBBzMa3edChcgvida/7QsmjjnJ?=
 =?us-ascii?Q?vFzsQK68s3SbNMQdrg8G/Y4qF9zi7/vxMrvru5P1NoBrl0ddNZyXMP80MUFE?=
 =?us-ascii?Q?Qiq4gaHrCOzeuELoh8renVaX1DeT9degtwABGHYA49BYuNdXFkLorZUeafib?=
 =?us-ascii?Q?Ik5P7enFjM5YoebwDZVHiQRA5wZQ9bfWW7XLXPXtGEC7gC2fxeT22c8LvzmV?=
 =?us-ascii?Q?yZ8iSSvjtk4mt6Yo1hb9UbGV3uux6madpXRFwS0Q6jLR8/EgJOYb/+4dOmo6?=
 =?us-ascii?Q?j0zwD5defe48tJpJsBKzQwf3B9dtohAoofeUv7YTn/7q2jYJLLYoNp11xBvD?=
 =?us-ascii?Q?bTT9NQQkpXcxZTmtOgqeTqpHvPBvElhAL74I7NH7NfUpP7Ps8+q0NM1rVEaN?=
 =?us-ascii?Q?z+bfhAn5OR8hMejFSu7Nyp+gBGxXyoCju3BNKjvS1Bd6rDCKyHe25/Czh/+W?=
 =?us-ascii?Q?MFOx0SkmXU+9FmQnx/ZQQuP/7KQBAX7mfOnIbIqAMy7Jce+kwNgZ7BHClpIw?=
 =?us-ascii?Q?5G1WFMXb0sILsvBro+IeKe9BYV+WzR04W8Ub8dHsFlTLWLLKxHAPu3gUv+Gf?=
 =?us-ascii?Q?iutX61uFBCN3UrXrhW1xgD4tB3xLBlo+QSnN5SaYI7M+zhtrIIGVK0XoYN7R?=
 =?us-ascii?Q?M1icWTXQ1E3P3jKDoi54x1eGwH6d2acsONoSEbjOvTBJg9d4XQtcbs9s0EDH?=
 =?us-ascii?Q?KShz7HXU1gdhwsl+7ETtUVho7Uw1JZFjfEBEtA/p4Pi4SQ7KnA0GIkclFvsM?=
 =?us-ascii?Q?r5ZJV6e2tAiRkSMBlkpl7ARWU7vmjs/V63DXKfqDWpbkNOimYkykMt5/LEzi?=
 =?us-ascii?Q?N8qSX2QD+M02NdLiJOM56OdPItiLEF+PM0/XZ7XdurReGP30l6tFxdiav5uz?=
 =?us-ascii?Q?KSRgkgvsJnX1ZAZNYytHPTjjTniYT4o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 36eaeb2f-cb05-419d-74ce-08da4ac5eeb8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:45:20.2612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wmc0MsST+qBCCT1bV7Bf+dx7y6phsnBrnis+vLgY3R+Go5jHiBDBRbD+h08gPhTVD5MavxQWT82ZViCNnpwBmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1365
X-Proofpoint-GUID: sq38y1HUdkEL6IQ6m50bjtMS4n2M1wbc
X-Proofpoint-ORIG-GUID: sq38y1HUdkEL6IQ6m50bjtMS4n2M1wbc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=596 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206100035
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 09:45:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7360

go.bbclass already inherits goarch.bbclass.

The CGO_CFLAGS and CGO_LDFLAGS should use target flags as set in
oe-core's go.bbclass, not the SDK related ones.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/netns/netns_git.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index cd17e1a..cf5ce39 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -12,14 +12,11 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-inherit goarch
 inherit go
 
 EXTRA_OEMAKE = "GO='${GO}'"
 
 do_compile() {
-	export GOARCH="${TARGET_GOARCH}"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 	# Setup vendor directory so that it can be used in GOPATH.
 	#
 	# Go looks in a src directory under any directory in GOPATH but netns
@@ -37,8 +34,6 @@ do_compile() {
 	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export GOFLAGS="-mod=vendor"
 
 	cd ${S}/src/import
-- 
2.36.0


