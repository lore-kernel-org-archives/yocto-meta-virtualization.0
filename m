Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE110C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 09:38:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20275.1680082709665697330
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 02:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MD0UUT9I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=345261c62b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T9VpIL006029
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 09:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=cOA8vvywT9XH76eWvioN+SCM20cdO0dMx4VL/N228UE=;
 b=MD0UUT9IxunEtZ052DCmzgpDGy6eEfrN+3mmDhEKdDFFJhWbVNwDAvb9jlDbfTGspVJL
 VEfkUujqnBHEWhdaAZ6HugKsywZI490e0ja53h33H6+K2GiNxwRMtqvzv8fWm1gOwcOn
 Zlx/wk/g5qcCuLkmw5sYAHWQg2+eDFIT7dl5zZ2si61+Clgjd148qCFUV2gELy6immyA
 Ol36a5ZR4x82W8MNCPb6wVk71u8/uzx3TXYye4AA9vTU3JS4FhnLCH9X0ZEMmGwcOAhY
 COO08Wd1u9HTFdaSqbdsROLoHRr7weziKZofFlFg3YrvMTUcTFK45PXA46+etwX23S72 oQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxbvht7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 09:38:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlHml98wxYYfWrvoKDpNe0AFJ6zm2FwPG0ViW3296hIYnw9OvsCdGbkc8maGl5NY4P+RspKZKyKxS36psfGmA7dg1PskvnYseYK093KmYc8GRWAfMxjfk6szfP64nnLgqoUBdKh6vVMCRA3o2R2kcCCQyMPiFiaMH4Vr+VsMGjtYscuTPq1hEvWlomWBgCuXOt135qTxQSYcWWOS2+H609V7lNC4Di1dh4sFAuwUOtHd/OWK7E/CEr8t7YaHu00kMQp5/fjaungbQNuU+nZNVgF09l2bQfYXSApDOiBl6BV9PFd4OIt9U0JzrWcmFKRQtbiPnU9Wbwz/zibDtMRaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOA8vvywT9XH76eWvioN+SCM20cdO0dMx4VL/N228UE=;
 b=aPrORgldZ3UBtzYcKzCKNtdeHIy3yeQt29jtYf87y2q2VUCsi/hiZCh17Y6osIDw8hedpttrJE+FuSSvDcfHVno6Iilb63Sxk4JdupVRgK0tXCKiADgiU9x8cezaH22qED5dJ8jROWd31bq9wbxSsMseN3/k5S5kISqDwqK1CqEntUGZRKYzYBVDNjeJdrGRg/s7d8gSA4B1BRv1kdO9AKjc/s7N7ds5J4sQdTRFXfhk6COr5B+aYJH1VSEc/FCERvdpEl81ewABK1XUwDZACTvOOs6OqACiOfY5eGBP8izdDe20PMoOlK8nzObD7El9206B4iuzF41Jfd26EzlZzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH0PR11MB5378.namprd11.prod.outlook.com (2603:10b6:610:b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 09:38:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%6]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 09:38:25 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH] containerd: upgrade to 1.6.19
Date: Wed, 29 Mar 2023 02:38:15 -0700
Message-Id: <20230329093815.46676-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0052.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::29) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH0PR11MB5378:EE_
X-MS-Office365-Filtering-Correlation-Id: dda07cb2-f5e0-44e3-ca56-08db303957e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z5OfDhJOn8t0URbYuYp3XElFG2MGWooBpdqajbkwcZ4I5xjC3RDPlhGtl/nVbw5uVC15psTqvKDzymmcCwmRPHiONLx2ByIt7CGQ0Yapd1555lfNEafWwEf9iq4BUeZsZ2zFx25gycoAMrE7zn08b6ogXUsSmwWQFLu+VwTlKhdiaFexFLp2VoffbA/QFCb+XmxZedL2yrpIOfLii+pE7zWWAumv/Ww6DuAAo3U7Njv8zgt+sMeCOj3ARNd/eAyPjoVOeZ0AMgoKB3EcfWhIP1qMdmVJtQE3FZg5I7OJSN7Y9IlAuJ+xqn3m9rqBrPKNtlJkmqP6lXyEMPui9rI1wsYsjWdkdtBXe8bSs3XyJIqWdaPp0RWoYjE3wpiybgx/RqcIZMyualorc+ojbiZwWzHGh2EY4O+edykiAJDPAw0FVRmlnsgm8LSOBlOl4bkfUKHJ7nFg89PtaRS/PotMLOdmqGgkcGACdbjglNr1/unQbTUgem/Z822T7WhfkHtGkkm4pSMLPl/c/E8ZtXy6EvEjZiL08kxX2JYhu8hCytzNbD8z8Iyz3yUyvGng3tM4K1Z1zcGe61dycGafA2m2Dowtr9yDd7e/AtpVidJ2eYVJsle7eBHaXyteykXT5yH9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(39850400004)(136003)(451199021)(2906002)(8936002)(83380400001)(52116002)(38100700002)(86362001)(36756003)(6486002)(38350700002)(5660300002)(6916009)(66476007)(66556008)(8676002)(41300700001)(186003)(66946007)(316002)(6512007)(26005)(6666004)(6506007)(478600001)(1076003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BzInN4n5Hte3E7cNzpoL4c+6MlTaaMkgSj4FP/9yfKcFp29Tz7KFBrp44HVu?=
 =?us-ascii?Q?mkRnOc/6cX9PzBbJq6mO2a7gPyMTg4Wozc8zcrNi2Rb8EyHTW301NeuGQz5O?=
 =?us-ascii?Q?rprmK+N4B467sX2G4V78pqsLsYvHlav+8Iyt5e3x1SHfo58t1p21xBT60kAF?=
 =?us-ascii?Q?J6+q+FYr/qMlb5nVWsFcwJXQjrbjbJQjYtxuCe8lnejY4J9KThLmWFPZoeQY?=
 =?us-ascii?Q?rKuAxQ/J8+1gGQ7tz07AaxsncU7lkESDnb26MKnpr+ok8zGHxwVEI7joyrTR?=
 =?us-ascii?Q?WQjRACwzXUH3TsRGrfgVwBmc7qeTIMMsu5ELfVqucrsV7vnyWt+0ZrRaHDqj?=
 =?us-ascii?Q?jAyhaGvh9SpZBQmKh86WNSDfrTa0nI0RrVyuY0fKmQYvIkwfAV3Dx4LVzX92?=
 =?us-ascii?Q?Iz+BBAmdtn9hukV8DiwsrF4/16XLH3ZVkOo0lJp3+AV+CvtY+9+hkrzIWNdW?=
 =?us-ascii?Q?eDAA8UoXlrwW0FK1Ifsp1d+YESG+IxT2ypJeq48VezruX5IZAiDWsTr/b1Qj?=
 =?us-ascii?Q?FSyC49BUjhJUnT+Tqe5sR8la6f7krUA60g7H1mS6BMrRs7AA1VpLc9HdZHg/?=
 =?us-ascii?Q?pJnPt9SK4lJF0wDpCmfTS/68CWShQ+TImUQWK7ahuOmagi5NXcXJYKfrDC0f?=
 =?us-ascii?Q?MpHlACq5ezo6GS0lW3z7P9anHTEHTIfmnno5rlUb4dMJE+hc6jP0gVrL1+Q9?=
 =?us-ascii?Q?EingJ5bJp40AoAms9KGc1BEmVoCXdFmesQ+GN25zJAva4Rj1ur7+7/Hc710w?=
 =?us-ascii?Q?cSZfyCIoGoDu4zTpb4mbL8HDbBQ0jdyU6OBvRLBv7+/D3yGT6rOKRbovf3LU?=
 =?us-ascii?Q?lG7uQFCdJ4iXXIoxP51e6v9oLiGkYv4RKr0ysuq1Hr4zUZ3vni2/0yxRRrfS?=
 =?us-ascii?Q?wnnkyLEnVXxJU5jd3KFahjEhgrdMDnDQD/4xq6R3vmeBsj19W/8u3rj6ZwpX?=
 =?us-ascii?Q?0oVkIGEZ345OizLpXRjPq5Q+lbPhiIdX6/jGimBHPDNzH5KbPYEtSNArNeST?=
 =?us-ascii?Q?eFvdlE1AIPi5pjzxJCiuD9A4aKW+3z53qIV1KQq10aAWzIxcB+1QTMIZVXe5?=
 =?us-ascii?Q?c75MHFVHd89qEaJ1JcymouV9j3dPDxGLW5eZ6TBSYzVQb/8I52vsS4ozulBB?=
 =?us-ascii?Q?+tHyWjOhWmK2O2lTpVROX6biATSuXNHBuNrtYB6XWdTLAKXMpIjV6V0ncKQQ?=
 =?us-ascii?Q?dBS4+x23rczr3qPVxkwZzR9ixY9XldnNSWyotK0QJ/NwnAgS3Wfh7dDhwoSD?=
 =?us-ascii?Q?YEIH8c7ZYATc+H3Odnj6yA91Br1HlKOXXIq/OTAu5Bd9I7JV1xXT1k00fq0t?=
 =?us-ascii?Q?ZmraxjZdOuhZ7HyAtokEsxLlYmP4RVhxUpPV/VJuLAtDkGhsot1eYajSmbbC?=
 =?us-ascii?Q?CNkQbAr5/BbL4jIIjeO+3FjLql3jNsxpg2IRB1chmnwkqdovhNgDul6Fwuwk?=
 =?us-ascii?Q?iIuA05vbeHfgV2/Ss0GMBM471620CoBmLDgMt3N22coeaT/swsC5C5VlJYly?=
 =?us-ascii?Q?A3Npd4pfbdvBGeCSoiVfG5q55vg1kdD8LOzvQl2cSxUZ4nHELgLfvxYWqIpO?=
 =?us-ascii?Q?fSKsk3Je0963OnCeuM0skoqjq6qj6fi6xD4h3g8ZtGdP+yT7GSemeRVrhE5n?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda07cb2-f5e0-44e3-ca56-08db303957e6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 09:38:25.1049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25lKbPIYgV1SHhGhoo43nFu1+NelbKDUtrvt/Lyseomn3KLO+ZXYOpx1POpIMu6sSEmcGoLS2xG2BV2AsJ/hRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5378
X-Proofpoint-GUID: S3NNzD2Jqbjg8MaFSleVoZN2L7DuS2xO
X-Proofpoint-ORIG-GUID: S3NNzD2Jqbjg8MaFSleVoZN2L7DuS2xO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_03,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=712
 spamscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290079
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 09:38:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7962

1.6.19 is the latest release for 1.6 branch.
This upgrade fixes CVEs such as CVE-2023-25173 and CVE-2023-25153.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../containerd/containerd-opencontainers_git.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 5fe3e4fa..6c0266ac 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "ccfc27e30d9f599efe6a7471ea1932dedf2beec8"
+SRCREV = "1e1ea6e986c6c86565bc33d52e34b81b3e2bc71f"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https;destsuffix=git/src/github.com/containerd/containerd \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
@@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v1.6.12"
-CVE_VERSION = "1.6.12"
+CONTAINERD_VERSION = "v1.6.19"
+CVE_VERSION = "1.6.19"
 
 # EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.37.1


