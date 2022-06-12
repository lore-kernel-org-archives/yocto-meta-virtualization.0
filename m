Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01C8CCA483
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 08:00:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14121.1655020842761589823
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 01:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cHrSCiNn;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31623a79e8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25C80eTl006753
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=vkfyqN8267myoI8ElHPqEsyfOWWUmpxSttNnrSLqxFw=;
 b=cHrSCiNnvWnHHRIvJ+CtTgsxNUiTFY0m7TgqWKVQDpRxZaxs0wn9Uxcp/6n/KyM2t4n0
 jTCLk3Vau86yvKFKuFnQMdbbuYYpu+W7YqiowbDsukwB6aE457dmfSNyKw5rAtS8f50k
 SzTnbY9hvz6NUpYb/ZgzXobvhvhmDPI7nXyPimVfSma/58LltXoI8uCd3/5BpmyI5WRT
 P4vh/j4//yY8l40Gm31JJbqTIP4xl2FsstUYYXvBCUyN5MBwy+FYbzLfcgn4YxHQ7Hfw
 UDPJ6h+p+yOGz5q5TY7ZC4sGKCdY5IqvN1f2F+DemwEGc+fAylVmvQCM4lVC0NZhvb0R Ww==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmj198pw7-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sxqy3cW6PiUMxEqJIeb+SamV7GEip9Us7GLekMZKUL7+h0W1KArYCdIYUtncnK4AyFoTajFoFGml0GvA2w6jtmC1Rp17NcwsQrwMt39+w59LPoF+GsJ4aumyDV30GtMOhgrbbDoyou/bvioqiSggS/I0ytqtmkLzt7ogx1PsN7fOxYhB1l8Rrk+j7slaPFNA/I8xOxYFT1l2qzDcC5W+x+Ngx6uW9TrAI+dz8mXiVjCi61Tu0FWdFcet5+Fqv508pKxpGZX/bjCzqTQbS6DP4v9CSVOvvUUJ4Vv/+mHvQi3ijghs7abkzl48j+NfRl/Qio1+TrSkUFejHq2yUMc8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkfyqN8267myoI8ElHPqEsyfOWWUmpxSttNnrSLqxFw=;
 b=QA9T2AYQgzgXDVFW4elUbZk+KMH3OjM79h69jj1rxEm9i3nNL9a6j3LDRGgBTc2zY/3Bz3rlS+AgP4yn3PtCDyKxRoqgJCkJ8O8MGDlfhDue9pztBEFjHVHlBBt5iB8L/sx4WD9ZFBcj/RvE77BpCfUJTgQFmYSPACgDJLhdFHtmf/AxvpMHwEgsNJ8Q3ZTFqECqNQOVdHJkUHtUx4AHXbtLBCZuz9w+appqutoBgUrAolWnEAnJI2esZLW79EU0wH/FD+D1xlFGeIkPP28V8WKapuvNzmmxt6YMIyKdd5szQ6lI2IK693TUGKZpQjdvtsz8xwCVbKAiHzHfTnl/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL0PR11MB3396.namprd11.prod.outlook.com (2603:10b6:208:6d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Sun, 12 Jun
 2022 08:00:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.019; Sun, 12 Jun 2022
 08:00:39 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH V2 3/9] docker-distribution: upgrade to
 2.8.1
Date: Sun, 12 Jun 2022 01:00:03 -0700
Message-Id: <20220612080009.130993-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220612080009.130993-1-Qi.Chen@windriver.com>
References: <20220612080009.130993-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5d62a38-1320-4388-9220-08da4c49a35f
X-MS-TrafficTypeDiagnostic: BL0PR11MB3396:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB3396474883D7F385A3C40AA6EDA89@BL0PR11MB3396.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XEpxJjeSVX13a1258a8t+7hL2POaP8pO2074j0OoNJEE/Q6BozCYvzpFmYZuaJiTa7298Mby+QUoSUn02xK0d6SeOGlG6ivnfunnqNh27cGeZtnpueSqmOYzsDxb6fgtSfpT5NPnWPp6TeXseDeFDfF384aH8b/UvL42UkZph7pgav17DuNRU7quVqi5HoT07+/xkRMS4aEjJ7DRcjBUnWfjwdiiTda4Fn7OxTezyRUa3c/OIAMiQLMRtFo4MA3+R4Ab09PNqB1cwUaz1YbFDQ4IzEjkWJGkRj/87UY1DDtCH2B87R3HbTJNYGOHM3lQq7zD3TX8d6nOs83Yfq1zxUQfTHo7SFegmQ8n/HJZ8Uja1nRGs6dELq8KDzpyNh3amyQeIfIq6H3TscJJKayg8/LW3VAwMASI2UJBoEwzMS6kfFdBKbAYoNB0BlgRNjb9K5fIR5H98Z6Zga7dsKpvm8IHZ2/mMaDcqPqw+HcstfXboBBLaAINcJizSp8I8Hy1ykwV/FYRkICMA8SPDXFBnMyy+mtuN1S3gZcD19IHFx5/B8JT22AxL9UvELlJ4hR9Ia5WzK0UaRPJGtGa9XqPDlN06ATcflelFG7luGtN1geg/hqofIx1YtKZhx7fb8FEnWR2GKzHB9OxQ3IS77RWbuu6LC8gZ2vKk/yv97V/hWbvHuykUp31Y7OflQCal+VCI7bKA+G4mj5gBEIEZgnjlQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(38100700002)(8676002)(2906002)(66476007)(66556008)(66946007)(8936002)(186003)(38350700002)(5660300002)(316002)(508600001)(86362001)(6486002)(6666004)(2616005)(6916009)(52116002)(6512007)(36756003)(6506007)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YRDU3gHWtEiCCNbOQ1chHZ4nmzVsbocRJFqzneNm9McYfGTb7IFVwASsfTDb?=
 =?us-ascii?Q?hJDbXYN03ab7ulZdfpYEQDe4i76LxpRcm0VZbI3inhhrSw+oft5+rCvEBhkb?=
 =?us-ascii?Q?hZ+kDsDsR3pevJ3HfaFVw2/JSs8M+CjC9W3dUrY2mTYxCXSHmAPHoTYT2ouw?=
 =?us-ascii?Q?x4fFtoH0dUWx1toyO5qNtqCpDy9m65HKYzfgHCpgohOf4mdNkVpxddZdE926?=
 =?us-ascii?Q?Ku6Dce6OhuQdbo+yCXciFpwQNZ0hrHk5kNYZCPikenaUSwnLiNlkmtSoA9DJ?=
 =?us-ascii?Q?5ZUrkfPm0+bQWx5f4T0zESdIOjX6gzjpZMpZX7/yfB7aScyk56yxW27gwfit?=
 =?us-ascii?Q?ThqGo/pKAZHCo6X8Sr8a8uDbsU32k8uuqoE/kZSm+Ye293Iea/tkVZtzZ8ZA?=
 =?us-ascii?Q?Y4w1xZncUQOCDaqaNjf6batqc57Y1nxaP28sOawqLL8k2u0EVuPKUM+lwsWL?=
 =?us-ascii?Q?A2PtTldEFMoF6gG/R4eWalnLOllSnkRE+A+EINRq3z0fM1nelBDyMzbTvLnK?=
 =?us-ascii?Q?mcaiXK2PSJ4hbDZm9JErPDf+FPOWNIhW3Omlibac/J4zTEJ91hsg1HSaR1YT?=
 =?us-ascii?Q?YQ3tZ/xWBngZq/UThJ0Scs1mk7UfuXFVtWEeB6bQ2fyynbqIlRVokyomdN5C?=
 =?us-ascii?Q?0Z84OOtIXEeVtdOlVVequQPnXKOJr//WTexWOlH/pnug4+ltJXcMmNUna93p?=
 =?us-ascii?Q?Wv1QfsT6lqWcYzMjC9TKpb/YDZi3rBs3aE3duX9lNb8bpwbQOceh14n58Lpb?=
 =?us-ascii?Q?apNUzxvpONpbbVvNY42dKxu/ryky0dN9QnaVRx3/63eE+PVPORbuLxqqk8dD?=
 =?us-ascii?Q?JW1+fm9hMrfazU7MB7csyW67U0dvkHkQ1wDWg7Syh+OzvhLyTwmoafJaIQdr?=
 =?us-ascii?Q?Jj+IQQSTnOUqYnAe3YDyVtG1PUk2xGrocbijhDQfNkkNiRLReksFQgDBS43p?=
 =?us-ascii?Q?OucRjkBNKzwC0V6Qt0lzlu2ZoOFl3D2yLTmRC0jKljA61uDl8BJDUVu6qHcA?=
 =?us-ascii?Q?dxoAdFcb8KMfvEfODrWHJljOSticRV+XOh28/CpTyqmo55jR5dtkfhAuwmCA?=
 =?us-ascii?Q?Px7FinPYsH09YgwM5sl+K3CC+45dd2cP2UZFFgIpK4+gMCMJ4RXZ2+jLUVwg?=
 =?us-ascii?Q?b4UtvBPVtD93+3yuf2ZsTv2i/gn1bOg0GqX0Ua7dPOVrmSoMhLLeIkmhxKtm?=
 =?us-ascii?Q?UJZY1yj/+4iANFs/lOL0fRBRC8yq9j4iC6srQiaD/VVMSONI+86rQrX7uTD0?=
 =?us-ascii?Q?bO/jGdi9kOf8XEIjK/XaTkK72cS1J/VU5xzr3gUL1dOAXeCcE74Cx8qq5i3S?=
 =?us-ascii?Q?kue95OTeQpC2P1BsmPhhODIzjyVtaahkV3ljEGD0wJ7brtjL/vTizBwtx2TQ?=
 =?us-ascii?Q?TP2HzscdGpPaOeLCh86eXEhlcWNw31qIDvIyEHBldRmveeQ/9rIH2lOvnFQI?=
 =?us-ascii?Q?y699CKNNBm0Exzpni+8QRaEX2fINj+xZJ13qXXsUjnOAWv6Wicf/oC3TyHuw?=
 =?us-ascii?Q?zru32fwruRlH1NtQaqaNuIUvQ199irTjX7MnJWFxUR04ypGqdObFu2ddHwtS?=
 =?us-ascii?Q?Gt2O9bg8oy9jIMaNzVMU4jMSaNQP9KVybgInFraQK6Y1Ls1aE37avXIEJtFx?=
 =?us-ascii?Q?C6mj8NygxCTB6mOdn5yyrsGI2rk80joYZT1hMr5qBcoiM4/fVTQ2bnham1bD?=
 =?us-ascii?Q?/Sz/e3qs5Vzrncg/9GWGMNdcPmd31bIwmGvsV4/F0H6fAyh5Jhk3VbrJYb8d?=
 =?us-ascii?Q?N6IphDw4qYObpbzdpUT7h5hh2zDsTIM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5d62a38-1320-4388-9220-08da4c49a35f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 08:00:38.5650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 e2SYtSWHK4//L1wMkMkifpQF9omx1eZhB1Axie+0iT+wz/9J3SS6hUvFf5hCVYkU06RPKFJimowjkIoimQCmtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3396
X-Proofpoint-GUID: gfn5Nw2tg5hjtnSRNNNxTzqkoMkXC5Zf
X-Proofpoint-ORIG-GUID: gfn5Nw2tg5hjtnSRNNNxTzqkoMkXC5Zf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-12_03,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=806 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206120038
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 12 Jun 2022 08:00:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7372

v2.8.1 is the latest stable version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 89c5980..93c2067 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -3,15 +3,15 @@ SUMMARY = "The Docker toolset to pack, ship, store, and deliver content"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRCREV_distribution= "3b7b534569220c840993aad03e3eafe54b923f4d"
-SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.7;name=distribution;destsuffix=git/src/github.com/docker/distribution;protocol=https \
+SRCREV_distribution= "b5ca020cfbe998e5af3457fda087444cf5116496"
+SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=distribution;destsuffix=git/src/github.com/docker/distribution;protocol=https \
            file://docker-registry.service \
            file://0001-build-use-to-use-cross-go-compiler.patch \
           "
 
 PACKAGES =+ "docker-registry"
 
-PV = "v2.8.0+git${SRCPV}"
+PV = "v2.8.1+git${SRCPV}"
 S = "${WORKDIR}/git/src/github.com/docker/distribution"
 
 GO_IMPORT = "import"
-- 
2.36.0


