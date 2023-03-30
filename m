Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04ECDC74A5B
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 02:50:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16323.1680144647565006028
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 19:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=efRbysxK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34532b16d4=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U2VVfB027621
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 02:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=9Vbi59LZeJCbJ6w7yep5eRVtl9gOo02BrHO/t44rDhg=;
 b=efRbysxKX3AfwnFBDluMCMlUfmBiHxHYWMxXjKrNO0uGOtQQL1NbEQhAbbJVuCW9baI1
 E+dburQP1PH7ZC6bEyDEeimQ96QSmV8aT2IvUusiFcQXaU5bazdE54AMBRfS08iUi5jH
 l0MwyOjkHWs6RfnaElc23q0x9cjcW7pShhDKSIGIRjee8TJGa/8B16SGERgJi5lwmk/u
 ISo1CazvtBWy9dodp04fy/rEOaWmpN+HwfWcDHlTCIz0ITHHuFHZmlH5B58qpqC7b/mN
 qQqI/JAiz62xzNC6iKBdd2XCgDNXM6hs6ROsMi+wcZmPcjDV2ise830UsEgngB2EM2Xl jw== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php645s73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 02:50:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgJE44Ey8aKt1Eqf1+Psi7H7shLZC1RDPWZJRFs8meO7yEjncZ7DJHs6ciXh9/kNrK5fD0ZJofx76h/aJE9dWc2jpklfE1E1Zpf80ce2cv5UpDAblcYbSP9wN8LkkUIHJceaM+omD9CQu39J4bzKYa1U6aR/tSoyrvlo1Ve2UYlQVL0WmBNAscQRfpDepNY2vVXkHwxBaQaFHj2rlbDANocVKrjugStFXJpv9TGXeVZW5bp9XzKtuhaGbGI+KAVqqXaArBrWZG8q50EQftPizmN3Mc0ZDCXTQuzwpGhgvr7Ru06vmpXQv0hth5zJenOyAxhBXKcKlpUY2Y0+t6qMhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Vbi59LZeJCbJ6w7yep5eRVtl9gOo02BrHO/t44rDhg=;
 b=L2gUkwOQC7JRkNb7j9PPYTw+8PazBp9qaeMvdnFyrA8KBSyDd4SpnNcydcHMnipTX2qO+GYLWuxdnKK/CzVGh3YtdAJ1gW+KvOZXy/+XqLN+hBpWx86NbjRgEkmmQaVGc2mZDnV93mnKnz6FPqnoDAOo8+AK1JKUN6xmzKCWL4z8TbQrUMPnJ7urRMnUDfA0FlWwgd5xWjNoinVMuOHUF6ZvyloLjz4NvHBuKj48gbwS/SxCA4Wi7fysciWagkJiZxCuhf5gk4fzVUMNqNUroqaaQEY0AE4ygDpc+63EWf3Xmy1rn/P9iU5Gsvlr2feSWvoR/jw9Rdc1mnLUC3P5bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Thu, 30 Mar 2023 02:50:43 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%6]) with mapi id 15.20.6222.035; Thu, 30 Mar 2023
 02:50:43 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH] runc: upgrade to 1.1.5
Date: Wed, 29 Mar 2023 19:50:33 -0700
Message-Id: <20230330025033.47156-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::29) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a5d262-e1ca-4b22-d2ea-08db30c98dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X4qU1L+BFafHzOQQ5NJseAxbGLZy22Jg+rL63RMci1tad2QrY3d+ayxiL+DrWTQzLxVd/zzBB47pg+JUxxdJ503W7C8gC8wk2qJVdm1Ecxrwrr/jNbFKBuvQ064POyGHJV3e10qitsD8m8kLNHbGMRSAnJzFyX5efC2Mu3NFYl4/zkosQLuAU9ihe67klViuPJmezKUdVO/p3v7KDVnMz8Pdx5uG3doG8gYjk7e03aazggitIQiX3qqliFSbc/tzIE9BXukgWTYHYZTkpMSSUURwpKSmO99PZ1QLQOa7sPPKbFrrWJbyQXTl7Pi4x0NH7Xps8H/cpoaXv/shnyejUxSnNHu2sC7JleD9UzTHK+oIFr52oaVTBS3Ewhzv0PNdsICck88MDNQ4HlhK12olY42BiG0AC7dbImnpJ1sTCtqQSn2e10WTJdxsI6GGzCL0n7DK1ebhFKQVKQLvPl2xC+2Uj1/uzSiNxd7WvW5PELNiD3PLLssIdXd/P4ud5bSnLGDXjRIRdk0W1eVPDhjQw3YYAkUn0z7gdenAc/0gpIS6NTCymkXKKg8hzhM+r4xM3oDKAEbHGphnSsM1+glrAqJRV17Jk+NZb76H9gU1/LkFEMmIQNZOPfvk4ESNKuUJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(136003)(376002)(39850400004)(451199021)(6486002)(26005)(186003)(2906002)(36756003)(6512007)(66556008)(2616005)(83380400001)(1076003)(52116002)(6666004)(316002)(38350700002)(38100700002)(8936002)(8676002)(86362001)(66946007)(41300700001)(6916009)(478600001)(66476007)(5660300002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QRqXd48CtyOxq/SmCyLrTYj/xrjWOftm0whpcy77t8SDKqe9E880vqJUpGdX?=
 =?us-ascii?Q?+V79sk5ZnI4UlnwfBgArj9zi3KwDbm838RTCHomxmL8wps08u24uW8LPgq5C?=
 =?us-ascii?Q?0S2xFEWuwDzpowvYUSP3V+cvLRQZdjnNG5xFKFcjksP4zPNc8hGxfW8kWJ07?=
 =?us-ascii?Q?fk0M07PTctNjQCjTQfLXJtmqLsx1Xj4TdY6i7O8ySieWHD7+03NjhXPF2j/a?=
 =?us-ascii?Q?r1tvfCIw4/EGtw0zreBhxkrp8U2AvRkwaekOwxQE2Cx4bEG5DSXIxZfIUS4W?=
 =?us-ascii?Q?3rM6fZDgTkXlEeC/ILaIn4n7NWWzwjOjWA7xiHrKRvwRy4OMcRGTDAEri0ji?=
 =?us-ascii?Q?sdwxewwzapFBJNc9f/bcqa+JNKoLj392AJKXRukYr8B4Dsqjb8h7erUDC7/e?=
 =?us-ascii?Q?Y+vpKmWP24rYjehQHkSbG8hxRK8fc833UYVZeClOBxla1SBz05NNv6mru5iu?=
 =?us-ascii?Q?vA3eqjARUBkGqp4OIbogULQvYh7Y0UfE3C7JgfB4OwSDqGTHxG86OEdfrynP?=
 =?us-ascii?Q?okSckqi3tH+anaQ8A4rK4qoi9ug4Aji4WskZlTEPME77P++vsq6m7ytoewDu?=
 =?us-ascii?Q?Rc5eBIwN8RvmGvxUFMElGx8I7gWzgvOHU97yb/h37q8/6BuZ+vVo2r7bzFY6?=
 =?us-ascii?Q?OucOxYOkbrxVVShzz0ts+A3PAg/j7ZB4z0C5wzZuWObhn7iLyKlt5b8ViGFg?=
 =?us-ascii?Q?46c3xJ2kx5IqKPzBLjXcMHFnA4WZaK9EKeGueoCf8NQrNwtTiF6Ou7cy7ajn?=
 =?us-ascii?Q?WwXJGT45U0vA/z1e4PZ/uyMjkQM5k5NtlEWrgM0iuSrBs1KI4FgR5vZ3c5XH?=
 =?us-ascii?Q?ncurux1pglaBm4KzfYpzBqC72GWnS4eoUPGLpyC+K1Besho6kDgpWEfa9HDf?=
 =?us-ascii?Q?/W9GEhM4+9niHrsYroILQZQKRdlea2o/TkU05PgVhpZKtVOMkmo1GktbYLc6?=
 =?us-ascii?Q?4OLaUzu54yKPwTF4uq1yvOSFqAZdJnMA5DU2L0EvX47bDO54mzzdBTLycarK?=
 =?us-ascii?Q?VPydk0KoFydcRWLlU8ntVkIKoCv7THiEFyLVGJJXayN3WtFK/hTUEhiICTuq?=
 =?us-ascii?Q?kPd8XcRhY26THWWJ+rj8ZW6zBTPkgH47/0dL2PoMSCIrSk5jLIcMBN8jxS+l?=
 =?us-ascii?Q?QZBMha9sloosOCOxb3cx0ado9oE9FUdasV5DJ3Abnwi+ezz4DqGUogsCs1e7?=
 =?us-ascii?Q?oRbaj7XusntUXLC3qdVocSXdY/FpeHd5C8RlM0a9TLe0iK8eubfI7qjusMWP?=
 =?us-ascii?Q?0PMLnsgbcgNaPCCutksjEHC86GTw8hnv9aAPXiNr10Xh0EY5+gwGsyb2yHSc?=
 =?us-ascii?Q?RFk97wvHbsZJmFp2zBoR9fylgAI1hxgPCVCFM39zrYPaH717q3eLaGyOqgtw?=
 =?us-ascii?Q?W7zKm3OyZNyaD53CegQdit6Y9V9R7+88qCz7ouxaGcvrQ0+GtICy1G9H8L2/?=
 =?us-ascii?Q?VAiVcltBOlXhezlInQTGUa5fH8hJLIDA49gqFsrWUxhgRhFeuL4juqHc/yRn?=
 =?us-ascii?Q?QYmfwzv6l4kop1HBgulAtvdMu/SwtNRF0qUH/KvW+f5EfRyMvXyoaEd1kkkA?=
 =?us-ascii?Q?rje4MaZZULKjmKYOHJI0Uruh/UscL1pjyvAPdYJS+cDdkzRsR9voYjwqSbWy?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a5d262-e1ca-4b22-d2ea-08db30c98dcc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 02:50:42.9463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTKCQngjd+6X4lWIzNDgnJk7sMy3WA8+TuO2b08VGrEGcZYqzGt2k/Hm3JcSx9TH3XkCqjFCNzitLV9yr0ky4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
X-Proofpoint-ORIG-GUID: q6t6kEzmqhkw7788XdLIa11lDcQquz-u
X-Proofpoint-GUID: q6t6kEzmqhkw7788XdLIa11lDcQquz-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_16,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=388 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303300019
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 02:50:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7968

This upgrade fixes a few CVEs:
- CVE-2023-27561
- CVE-2023-25809
- CVE-2023-28642

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/runc/runc-docker_git.bb         | 4 ++--
 recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 97373a72..9bed441d 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,13 +2,13 @@ include runc.inc
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV_runc-docker = "974efd2dfca0abec041a3708a2b66bfac6bd2484"
+SRCREV_runc-docker = "f19387a6bec4944c770f7668ab51c4348d9c2f38"
 SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
            file://0001-runc-docker-SIGUSR1-daemonize.patch \
           "
 
-RUNC_VERSION = "1.1.4"
+RUNC_VERSION = "1.1.5"
 
 CVE_PRODUCT = "runc"
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 59ddca9b..235a01b5 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,10 +1,10 @@
 include runc.inc
 
-SRCREV = "974efd2dfca0abec041a3708a2b66bfac6bd2484"
+SRCREV = "f19387a6bec4944c770f7668ab51c4348d9c2f38"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     "
-RUNC_VERSION = "1.1.4"
+RUNC_VERSION = "1.1.5"
 
 CVE_PRODUCT = "runc"
-- 
2.37.1


