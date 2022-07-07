Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D424C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 01:53:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.817.1657158783204169755
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Jul 2022 18:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q1qkANVg;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=41872ca0c7=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2671qEfB016443
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 7 Jul 2022 01:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=/D8wl4F/LQ8dFk4x1OAvMMKZqpkuryAQ7ftwUaFo9t0=;
 b=Q1qkANVggcy8+KHV0lX09ldOJOHoJabCLbjMYE00mgmygS8DXPUS4Ac2pfmYk3+vDpjj
 wPHSiodt5vNzdVW2qea9SMpNbe0cN8sWypqaqABd+B6BqT09psVPIiiZmgvDssFyaxUX
 /YQxWO0mVrey8pijYu6JJ8dcakwed1JowdAPoyaQTGmqvAhaaofREwEIJn1sHkGuY1Nf
 UhgeUWomE73uzpTTeNhBcUl+omTgYaAVrvDgGmfF5MAXlkLbMcW/VsN3nQbB/ZIilbUj
 DZ6x0AwKn8+VJmGoA3Pz9F70dcU9zo5LSm36es2xuXdu6fCxPNHuy6aA/bf21kEjSPjJ LA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h4uh0s1ya-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 01:53:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/4qSbsAIz+lzXFqz8hrUimNuc/XQvCs255WZP1Zfm7k5D35m9ek/HRgGjvRKUKmE3ti63U8K7i6F1PIwTwI6G21gTlLGIE74Q2oYoGYdylPJegaqdo7HXL4oG7VY10MaxxqtQPpOwopKlTFZ9UsFJVlMjhcR0Qysjz9VzGv7s0uxeKiaJ5uWxACsBB4i3cbkDF1kXh5c0Hm7N4pOka9/2NNzezHbd7tq/NlgpPdfympHFMz33XeuFa9DR74WexrQV+7JMgChmdF9kgBGStqxZVHcMdP+teUxWopoFL2an/Pw22BvZ5o9o3nf49lmH2bhyF6mAe2Gn4y7/yvN/Ss/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D8wl4F/LQ8dFk4x1OAvMMKZqpkuryAQ7ftwUaFo9t0=;
 b=RpS4V8kPkvVx4yVwNLowcW+O7D4dnFLHCPyG7wIUiJ+xUnZtaWFJxkEnEKzEPWHU5X106KJedoeb9aR66aP+yaHA9ct68MUQThXV/F5g9kMGCikOg7nylzSQGol4xxAorZQJuK8INRff4fJVe5/w4V7aac2GOQDMm3LIkc2HtTm5Ka8Atfzluda+PFyAK8ovSY/SiMceBGWqNhkuJOyUPWqzPG5O1BtGVSby9B4JlmcwD91Hw8lY+Dv2TltmW9biYue/gd5MQV2ZaIxU1NjmzKilriFbAqne4/cTn3E4Ma9K6lZoN/Xk4aNXKaXTgAYsLWEKJPN7U8RQZPfUlNEQUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DM6PR11MB3817.namprd11.prod.outlook.com (2603:10b6:5:13a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 01:53:00 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::5cff:5bdf:9dcc:e393]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::5cff:5bdf:9dcc:e393%8]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 01:52:59 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 1/2] runc: update to 1.1.2
Date: Wed,  6 Jul 2022 18:52:45 -0700
Message-Id: <20220707015246.14696-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::28) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10ca32f9-2065-4a6b-ce5e-08da5fbb6b81
X-MS-TrafficTypeDiagnostic: DM6PR11MB3817:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fD486aMcYHhoKSV2PvwS0W/4yiuRvXIlDz1Iqam42OfGywhZ3xmuOym8xga6ktUsMtGsnhmgR6ttUWoZtT7wRkr9k+EvAfQ8BXG6YL2p+hp8s2ayWIbwjJO1IvKdIU1Gxqq9Fkp2HtvQdmG1pO+45f2e92gEQQ+WLyI+WUPxlwGNH2UuSfsz4OxySBOZ+mn9vfP4NlLcLbSkk+a9IqnMPQLlqZVDp2xmm45ayyYaCfCt2GaNq+ImDq1Uru5FHiwVCDbJVoTDGDD7540aztcc3AL6dAOU+VnVD+/RbBWbl83pn5sqaSpsAjxUUGXyhIwIJwffbUy5L79gqgAm5OrW0tv0U/QAEQQ8Czky6rnB+8vccC0Or9g2kSN9R0PafTrvSJXXSMKeTxJ78Uako5E6SbGXkrnWeu7mIR20rgXoro1iD+93NGzSbxr20tHB1HpTd++EtHXWTnX93u59zZgxfOfnR7mqHY8KT23hgYUX1M+77YAoq/VAHGcuUz74zZVj+idoEpi8pyW2qufPME0jARWlfxKjwyv7RfWtfWUEIUdWott253VYSEuWs2m+bII2Vvns+JNuTQxkcg/RH1YqDVxDLl+HF6m9aZSGuG/7vXiOtp9X1jJz5jnUfH+8Zf4XzvasFAEwRUva8v8471dBeSTBBqCHdtUE7sCZCbE+q6Vx25NnTqrfKTYw974MhBpH18SfDHfycrBnoDJHOlRpDMuBdzMn9IVJACIooKZbbSTi26DQJrtyaLL9RGL835zxsyX/Yrm7JNzHdKjgOB6AZwZU5Z0iNV7Rf0T3M0Ra+SRyIygsfZbULbsS+BpSBTxI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39850400004)(366004)(478600001)(52116002)(5660300002)(6486002)(86362001)(8936002)(6506007)(41300700001)(2906002)(6512007)(15650500001)(6666004)(26005)(38350700002)(2616005)(186003)(66556008)(66476007)(83380400001)(36756003)(316002)(6916009)(66946007)(38100700002)(8676002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ykOD8YgzQh21hKvwFwx4AW37u7uuNuRl/U6KLpf/78D0QRYtCbOgLxkYxvd/?=
 =?us-ascii?Q?WhrBEt3Ak2w6RhlCmskhETapkWOC60Uxb0ZvgxAEwjCm/tnXdrt1JamVLgSw?=
 =?us-ascii?Q?DPErGMtF/32AwTtTDAbWz3hgGiTEsBK7j0W78MPTzuAQQbpXXB/Z2U2QEEnG?=
 =?us-ascii?Q?ZRYbneyj2KcLnu/VocrbHyx7W7Skp0J+TkSCya3zFSqxBo5buye8mb+nsjwU?=
 =?us-ascii?Q?EGccyfUKmrKBaFfYzCCUFzPCwqHkBguuU1B60HFwAsZy33b5biZLZwMQkMYP?=
 =?us-ascii?Q?f55lRdy3vbaSHGZW+8Gyb5FlzUonj1EYZ1fUTLb4jBxevQTBAPFwXr5YQ6lf?=
 =?us-ascii?Q?1Mf1zMw+9i6rN9/FiKblaIbsrLHQ81JO0/pQw2iirtZFmfmqZHftGA4aoZrE?=
 =?us-ascii?Q?qBRwrwF0uXunKrSfWE+UhB9jO+2ffZecGBpdNxUzFmOd7f8DAdgMtblLfLqN?=
 =?us-ascii?Q?WSKYs8mgosdtIZBWm9mWZ/Ee5110oXvowN70KEqMoTYAlOVQysf3DGxi8pzO?=
 =?us-ascii?Q?2Q8HcpmAoHFQqplmM7BYES60n0Ztl5hpRSRGGig7l26DPlO3a6BzUm21yrGa?=
 =?us-ascii?Q?MMSZEHe18HVjMvjGIv6vCMr6yOTgNcAbf/Ce6TdrK3nkbM49i803WlCgt3Kv?=
 =?us-ascii?Q?YR0wK7N3ahk6O0VN81y+TQzHwDkw3YDNFyyruf4tEIVFXvaegZgI1kXNaMvP?=
 =?us-ascii?Q?eX4Z5s3F4DykQ4HRHaoqTF9q3pQczYqXzo7TT4VeqnkvmMGR3xyeXo2Q/RQ+?=
 =?us-ascii?Q?pysHKu1IEzlRir/U9pSGJ72PwxUT3meWXcmxcgP+EDSBdQYA8TAFq5wTBnAV?=
 =?us-ascii?Q?vdlEwys+ntXG4pw96uoCa8hUndAF7rJz0VljY/1d+nf893tfEtgEY98z3nIW?=
 =?us-ascii?Q?Qi7CjlXO16DAefjGGani061HuRviPJUV2AB04uU0pq0EtuyDnNaLqbvwMqCK?=
 =?us-ascii?Q?eFi6WM8RBbiWP6A+duLONzordHS8P/9Pq8nhLftc+itoTT7VPkqMKN+Y9fLg?=
 =?us-ascii?Q?pTXTAuyKCMq9GEcwFW/YH3+AkSHP1RPvNUnKwYZjAj2U48c/P5TDo2+pJBCf?=
 =?us-ascii?Q?5rOrG/l9szJLM3vs+tAstBfFTjMDabCKzxXy3U98K05obkhCYIj8QIOQ+1IV?=
 =?us-ascii?Q?2NsQWldQDbKXoYMjLxfSMxill7fY5rpBBhfjB66B6TxqX+PfHvsCOUQQSq/4?=
 =?us-ascii?Q?Ac/9gGCbvPrZ5TVnKGBLuX5CXZZ3z2Kyyih8XxjlVT1Fg1c4Z/tBYysZQSwp?=
 =?us-ascii?Q?1+QFxqsUrR1HTxVV01MUoeth0Y80If3HpUzjX9dXiRMMV3C3Ir53BrBDL4m5?=
 =?us-ascii?Q?NdzvNnb29DV6HtYQ0Ji1n9sA+1C0PmsZbIfcD+O6J94SN3f8LsebtcbgS7Un?=
 =?us-ascii?Q?kUclrGR6++OtD29Rbv2WRL0zgbtnNlY5ryU8DbjDxEWlEn2JNnhs7s8Wuulo?=
 =?us-ascii?Q?WY9J0/FrpZtwtp4d44IuBL2xQOqVJqVY/gnfafWq/81C3Ut8y6YAn/8KSUb9?=
 =?us-ascii?Q?8VpXyGUogi4P3IDM+wJwXy8TJo20vTxslylEWd021DPztNC/CGbLv3H5vK3k?=
 =?us-ascii?Q?6imxRDWPXCbLTFzAN3gK0gmHuG9EIgnpNs+bLeiF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 10ca32f9-2065-4a6b-ce5e-08da5fbb6b81
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 01:52:59.4631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oI3l09W2OGlIAIYqbJwz9eeuzJYfmzgnNoxQ6skD4UCsclnNYSXUImiGwcZNZigE7ZEYVpghZNpzvSQhiy/tLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3817
X-Proofpoint-GUID: -hJByawJvFwHY3xQ3ilz737lhLBmFGVL
X-Proofpoint-ORIG-GUID: -hJByawJvFwHY3xQ3ilz737lhLBmFGVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_14,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=663 suspectscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207070006
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Jul 2022 01:53:11 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7413

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping runc to version v1.1.2-9-gb507e2da, which comprises the following commits:

    bf1cd884 ci: use golangci-lint-action v3, GO_VERSION
    1feafc31 ci: bump golangci-lint to v1.44
    89f79ff0 libct: StartInitialization: fix %w related warning
    3b7f2605 Format sources using gofumpt 0.2.1
    eeac4e77 build(deps): bump actions/checkout from 2 to 3
    cd7fa00d Vagrantfile.fedora: fix build wrt new git
    cdfdbe55 VERSION: back to development
    a916309f VERSION: release 1.1.2
    364ec0f1 runc: do not set inheritable capabilities
    8959e372 VERSION: back to development
    52de29d7 VERSION: release 1.1.1
    2636e1cb CHANGELOG.md: add 1.1.1 release notes
    036cc348 CI/cirrus: add centos-stream-9
    db953158 README.md: add cirrus-ci badge
    ea19181e README,libct/README: fix pkg.go.dev badges
    8290c4cf libct/cg: IsCgroup2HybridMode: don't panic
    ee7ba6cb configs/validate: looser validation for RDT
    96193422 libct/cg/sd/v2: fix ENOENT on cgroup delegation
    35784a3e ensure the path is a sub-cgroup path
    986e7c53 libct: fixStdioPermissions: ignore EROFS
    5053a065 libct: fixStdioPermissions: skip chown if not needed
    d2939b6b libct: fixStdioPermissions: minor refactoring

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index ab573107..14570b9d 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,10 +1,10 @@
 include runc.inc
 
-SRCREV = "b9460f26b49efa086b99f32557219d0f24bd23ae"
+SRCREV = "b507e2da6c6a3a328f208fa415a56ad7cd58761b"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     "
-RUNC_VERSION = "1.1.0"
+RUNC_VERSION = "1.1.2"
 
 CVE_PRODUCT = "runc"
-- 
2.37.0


