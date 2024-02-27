Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99595C54E51
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 05:12:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6264.1709010754462796312
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Feb 2024 21:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fm73Fccd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27871b5145=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R4t2tB005128
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Feb 2024 21:12:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=VKKpcYmBS5S1tQE4OeRvvEKZF5lAq041vP4QXNCMni8=; b=
	fm73Fccd+L1VQi/6ynPKl53kREi3qaGpxuvqJNb4/HDztKqkHXcsF54AR/1UFXIy
	RLLaUHyhzClNZgCW0BnB1xW4Zfj56dmmytFVbpZ/Z8IUrgzF9pPc4ITJQhcpvydW
	p+J1tYSP2ET/4aV4t917NZYgk+eLuv95z5DnsXtoA7Gmun19RyDAQtdBxZu+7+R7
	7efY3eKrJHT/yS4TSGjoO0JdObPILbLjTqyRStdgkMUh+VThPUTPh8tEU2hK3rMg
	Yb+OI1VAuCpNS2EvJzYTC+EkJtum+3nojZ0U8aCUrWpzxT3KfMX75lnOKQhl72eZ
	+Yu4CuUyt25h9xzQemu+0Q==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm42heg-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Feb 2024 21:12:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilKPoyjHXEHvhF2pgwT6CioDLq96dNt/qD4HVHG5eWpdrDEOYotapCXQXmwqXzgFGXGzfWztJXgwazkLsziBsYjVInT2qQKjtzZqOSxTjujEkXisRsDv4aMo7SQN1dEvVqKHReaKm8yeniLtPPTK9FrQF7UiQU79Lw4rp4933mmVhp+QDQtgwl9QDsOlF2q4AL1LuoQFwzSNZT12zqpoNboFRMr1FN1/hU+3+7tajZye287pLWbrbOb1y/FaajA4NoImydXIoM3zl7Cb9Yqa+CdxxEyOOwt0Ayi4055+nC3MKS8BuuOdftDojnuAbPLIqz87Ybq5H83BTaO2ixNCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKKpcYmBS5S1tQE4OeRvvEKZF5lAq041vP4QXNCMni8=;
 b=SnfjzO5oy7yJy1WSkIQupPg4vhhPeivRQYaxgKyTkmiOanUlL61ijwCZKEkvf7ug1xVOzMgX01RyoVSSb6woUswCz3j6ziKdkXzDzjw/KevTtXEo1OgEN0GR7jG+BStwNfn/y6V3W+m/JZSJXKWWudpdpE11efMNty2POM+eqlNSSYMCiuYowgpO8Gm3FuJGAoYCAvwmZNWHeExG0Udq50wBPC74s6lU/YWTKkFjV45vw2jpTCfjxo6WijiZyfHLkups2qXtlQp5sH9hRshSaDpWUe7zEn++Px4eNRK5WjYTvMJZWNzmQteCOGXZCp/MREzLltdaU0pain0ACcKwkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Tue, 27 Feb
 2024 05:12:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 05:12:25 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 3/4] meta-virt: remove pure go source packages
Date: Mon, 26 Feb 2024 21:12:10 -0800
Message-ID: <20240227051211.3390256-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240227051211.3390256-1-Qi.Chen@windriver.com>
References: <20240227051211.3390256-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: e86eaa21-b9df-45f8-6c8d-08dc3752af0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nSVb59SaZ6MRhE1Wg5lGapIbNDaVwahLZkrJkxwJ6YmfAqMgBOVuz74t9Zy5o/o7H7PLA4UFJvdP7iDPPX09hf/PuRiVVd7wT7efVIQ53PNbHtlBo8t3O1sZ6j+56B+lMMIiS1tXIfR9lI9+qZ9Ga2VIA0l+fZb1zH3HxPBWb95ueE4FxqWV1XVVj89oG45fXsdzpRCnOFUAPdDFf285wHN2aAFjjCJhYnS1pw61D9Nl+Ec5KAaXBQAhmGnBbLolgVbrX4Tc87dvHm3IPawDh2PLA8RMasrs94tDbqAtFOSN+vcwqGxhHSRgsvSSRZGxDTg4q/2nC7Svi0mWSB/DjmBIzz220hjXTxhFDUHrPkHIgw6mwb9dZGDt+HTVfXtu8JMRQ42jjGmTsRhYm8ADrEKqScwWzwyZSVu4stTT2eTcwRJEhcSO/JshiAj9O6FEo4ZxkW490Yw4XyUQFbYzV6th+rObtIw3qbGvDvkPfLrT/UR1L1i3c959yjI9JjZIA+KJ3vGTXc2shPR+8Hux0zKF1CYzMW4AlXZkAoiNpHi4s6bh0jTp2X/rhJYCeJkozyh3JjLc2SDLqqOli5Xbb7AZ4Tj+7EDH25nYXEbAag5ewkaZsPnbT/BvHyMvDY17YiZ20bizXB4vggl70o3EGRyK82RzdoAwtE/+oZ7bJkVGAIgfH3d6EQGdTEY9iBVvzH97B3YGuHPbRGuVTOGJtg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?15Ocey6kzDlysm1KpWxLb2lravnu6WJcCI60/TC5ia5kV/Wsb6fO7ZMsTQVk?=
 =?us-ascii?Q?N/8ZOYIaN4ma+8Yexq6HaXAyNwFmTtK9AZljYFEZd5JZk6qCzWqbNlDzL97p?=
 =?us-ascii?Q?AN0qvcBV8UKLPfcsCYJkpxKoSEfKo8+3ltNXTvrsVK8GlIIuP1HReqzu9eZR?=
 =?us-ascii?Q?Gxj4/2KJT4eLHGiMYJsGdniLrSSiMeg81cO/8U/tdYKRrstrRFRdhsrZZPqf?=
 =?us-ascii?Q?FsN5fMKJw9L1zDcPPZ6faxBJAojYUWIDWMgGl/M0thYNVvtZABEOr6l1aHzX?=
 =?us-ascii?Q?mfjrYqyP/d30L8PwqLFkywQrF0WS8neUVZ8sv147Pio0HdW+Mu4xHUptlrjo?=
 =?us-ascii?Q?087+WuElKoX3Xe5YdURsuEhNEHEBy++tbOca4kY1WExgYys9+DaSm3DvsHaf?=
 =?us-ascii?Q?vOgPWbbm2mhQE1/8Cn25qGcFr+OiteTaXFqIH08KNQzNwgEaRBCuzuCHGT2E?=
 =?us-ascii?Q?ze3kZgh1pmJz9M4+0GVaGQSztXxMDANr8t6rYHSdq8BVVRJJ3qZgb2kpQj1D?=
 =?us-ascii?Q?wMeK6IhaBJxm2udO8dIqgGL8VUov1K7pPNHxuwzeEbtqqDuLSuS5U5Xh0z7v?=
 =?us-ascii?Q?u/pW3dN3W++iABPm/G0v4TZ+jzBND98BvRMygybR2PK2/szokLaTLyDRAYvW?=
 =?us-ascii?Q?RYxBFKOlUtEBm2mdTN9JhpwcHKWmPvWPp1H8hm1WOTs0673zYMWpaBEH6CaN?=
 =?us-ascii?Q?fRMXWkVt3F+88jRxTlv6cP1EQDByY0MM8geCEV2SqXxREHcQCvAHamwA4saA?=
 =?us-ascii?Q?Um7v6Gdnvc4VPgsayL6W8G+NjXQ8UkjgSdB8CBR2Fp0XbzTl4HiQ3BmWuQxT?=
 =?us-ascii?Q?q1+ZlflKH1Kj9GevPSBlHxYl5B8ApQ1RRqG/BnL+gg2r43cb3g1YGYsWiNc2?=
 =?us-ascii?Q?oEaoLLp8TkoF6yNI7H2NDrWt16+za73Nv7PF4lbu+sYxSI5xsM0rsoLBpVrM?=
 =?us-ascii?Q?4XBCsqJLFgMlxbANEHd1edeTUXCULRR04jhXiY18wOkQm1cZPHhsHhjrKDH/?=
 =?us-ascii?Q?npx5hTehiWWMoY+78rOTqak4cdbqaBaljoqks6OzBio4ldPHHRx5uVJeTJRa?=
 =?us-ascii?Q?eDGppFWNZiF2zVwy1g6aQ0UNSlph7Vfo1lhmp7OuZN60C9qS8lEWTeY6ixHC?=
 =?us-ascii?Q?Yq3CfWjGqBAqJZ6SYldqJeVf/Q0j1gYWmN01C1fsGRQ8EJ7CPLUUB4XkwxYs?=
 =?us-ascii?Q?XgqDDeAVshxrXXQmG9ULnls+kzcO2VHKgLeSudkfdbf0Kg5L/0UHfJNDMWHA?=
 =?us-ascii?Q?zRoEF9r8XuJ2Ncy8UKukWOwlXGiuUzHxfni4fEsfgsoc52wtzN5Multsd6lO?=
 =?us-ascii?Q?UVDqqA/lLVwa023vH4QQqIU04yMxpeF6vigd5eGlBIAoMv5+LPKmu0H1iztj?=
 =?us-ascii?Q?gDRTVclP9iSJ2HTLQISwX2Zln5kQQhqJ2ixXuM0sJZmzEhP2kR589BRi2keq?=
 =?us-ascii?Q?NB9jhkx1K/40ttvKD78hx8wEMtb+eqqkqqdMy5JbhuF6WP+8oq3MzvYAJQKa?=
 =?us-ascii?Q?aATLp0+cem5vf8qyFR23TAGXPPI16ailQoylaqsMwBMpfORaX3aOVaSaBJje?=
 =?us-ascii?Q?cWt9JlPOwKQ9y2ZDqfQs8BCBq4OSeaFZKJ/i5ZPioYB2aRzj+J7iEY0DTm6d?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e86eaa21-b9df-45f8-6c8d-08dc3752af0f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 05:12:24.4917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifvCzeSP/nEAxLHTQSEiZKGlnHetCtrHev/03/avR+AXRwsxXfhJvMghI97EoEFlGITgWU0cE3vvLGBc7SVheA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
X-Proofpoint-ORIG-GUID: amQF37MBe4Hg0Ik6HpK-sydvZoPG21ti
X-Proofpoint-GUID: amQF37MBe4Hg0Ik6HpK-sydvZoPG21ti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270039
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 05:12:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8587

From: Chen Qi <Qi.Chen@windriver.com>

These pure go source packages are no longer needed. They were added
to satisfy build dependency. But we now have another way for the go
mod vendoring, we don't need them any more. There recipes are also
not depended upon by any recipe in meta-virt.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/go-digest/go-digest_git.bb | 41 -----------------
 recipes-containers/go-errors/go-errors_git.bb | 41 -----------------
 .../go-spf13-cobra/spf13-cobra_git.bb         | 41 -----------------
 .../go-spf13-pflag/spf13-pflag_git.bb         | 41 -----------------
 recipes-devtools/go/compose-file_git.bb       | 41 -----------------
 recipes-devtools/go/go-capability_git.bb      | 29 ------------
 recipes-devtools/go/go-cli_git.bb             | 29 ------------
 recipes-devtools/go/go-connections_git.bb     | 39 ----------------
 recipes-devtools/go/go-context_git.bb         | 34 --------------
 recipes-devtools/go/go-dbus_git.bb            | 29 ------------
 recipes-devtools/go/go-distribution_git.bb    | 39 ----------------
 recipes-devtools/go/go-fsnotify_git.bb        | 29 ------------
 recipes-devtools/go/go-libtrust_git.bb        | 29 ------------
 recipes-devtools/go/go-logrus_git.bb          | 29 ------------
 recipes-devtools/go/go-mux_git.bb             | 31 -------------
 recipes-devtools/go/go-patricia_git.bb        | 29 ------------
 recipes-devtools/go/go-pty_git.bb             | 28 ------------
 recipes-devtools/go/go-systemd_git.bb         | 31 -------------
 recipes-devtools/go/grpc-go_git.bb            | 45 -------------------
 recipes-devtools/go/notary_git.bb             | 39 ----------------
 20 files changed, 694 deletions(-)
 delete mode 100644 recipes-containers/go-digest/go-digest_git.bb
 delete mode 100644 recipes-containers/go-errors/go-errors_git.bb
 delete mode 100644 recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
 delete mode 100644 recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
 delete mode 100644 recipes-devtools/go/compose-file_git.bb
 delete mode 100644 recipes-devtools/go/go-capability_git.bb
 delete mode 100644 recipes-devtools/go/go-cli_git.bb
 delete mode 100644 recipes-devtools/go/go-connections_git.bb
 delete mode 100644 recipes-devtools/go/go-context_git.bb
 delete mode 100644 recipes-devtools/go/go-dbus_git.bb
 delete mode 100644 recipes-devtools/go/go-distribution_git.bb
 delete mode 100644 recipes-devtools/go/go-fsnotify_git.bb
 delete mode 100644 recipes-devtools/go/go-libtrust_git.bb
 delete mode 100644 recipes-devtools/go/go-logrus_git.bb
 delete mode 100644 recipes-devtools/go/go-mux_git.bb
 delete mode 100644 recipes-devtools/go/go-patricia_git.bb
 delete mode 100644 recipes-devtools/go/go-pty_git.bb
 delete mode 100644 recipes-devtools/go/go-systemd_git.bb
 delete mode 100644 recipes-devtools/go/grpc-go_git.bb
 delete mode 100644 recipes-devtools/go/notary_git.bb

diff --git a/recipes-containers/go-digest/go-digest_git.bb b/recipes-containers/go-digest/go-digest_git.bb
deleted file mode 100644
index a231cf7b..00000000
--- a/recipes-containers/go-digest/go-digest_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "Common digest package used across the container ecosystem."
-HOMEPAGE = "https://github.com/opencontainers/go-digest.git"
-SECTION = "devel/go"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=2d6fc0e85c3f118af64c85a78d56d3cf"
-
-SRCNAME = "go-digest"
-
-PKG_NAME = "github.com/opencontainers/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
-
-SRCREV = "65fac7b55eb714642e9359458656939349dcb766"
-PV = "v1.0.0-rc0+git"
-
-S = "${WORKDIR}/git"
-
-# NO-OP the do compile rule because this recipe is source only.
-do_compile() {
-}
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_digest_file_sysroot_preprocess"
-
-go_digest_file_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
-
-CLEANBROKEN = "1"
diff --git a/recipes-containers/go-errors/go-errors_git.bb b/recipes-containers/go-errors/go-errors_git.bb
deleted file mode 100644
index 87486358..00000000
--- a/recipes-containers/go-errors/go-errors_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "Simple error handling primitives"
-HOMEPAGE = "https://github.com/pkg/errors"
-SECTION = "devel/go"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=6fe682a02df52c6653f33bd0f7126b5a"
-
-SRCNAME = "errors"
-
-PKG_NAME = "github.com/pkg/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
-
-SRCREV = "5dd12d0cfe7f152f80558d591504ce685299311e"
-PV = "v0.8.1+git"
-
-S = "${WORKDIR}/git"
-
-# NO-OP the do compile rule because this recipe is source only.
-do_compile() {
-}
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go" -not -path "*/.tool/*"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_errors_file_sysroot_preprocess"
-
-go_errors_file_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
-
-CLEANBROKEN = "1"
diff --git a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb b/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
deleted file mode 100644
index c6629014..00000000
--- a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "A Commander for modern Go CLI interactions"
-HOMEPAGE = "https://github.com/spf13/cobra"
-SECTION = "devel/go"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE.txt;md5=920d76114a32b0fb75b3f2718c5a91be"
-
-SRCNAME = "cobra"
-
-PKG_NAME = "github.com/spf13/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=main;protocol=https"
-
-SRCREV = "4dd4b25de38418174a6e859e8a32eaccca32dccc"
-PV = "v1.6.0+git"
-
-S = "${WORKDIR}/git"
-
-# NO-OP the do compile rule because this recipe is source only.
-do_compile() {
-}
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go" -not -path "*/.tool/*"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE.txt ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "cobra_file_sysroot_preprocess"
-
-cobra_file_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
-
-CLEANBROKEN = "1"
diff --git a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb b/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
deleted file mode 100644
index 201f183a..00000000
--- a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "Drop-in replacement for Go's flag package, implementing POSIX/GNU-style --flags."
-HOMEPAGE = "https://github.com/spf13/pflag"
-SECTION = "devel/go"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=1e8b7dc8b906737639131047a590f21d"
-
-SRCNAME = "pflag"
-
-PKG_NAME = "github.com/spf13/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
-
-SRCREV = "d5e0c0615acee7028e1e2740a11102313be88de1"
-PV = "v1.0.5+git"
-
-S = "${WORKDIR}/git"
-
-# NO-OP the do compile rule because this recipe is source only.
-do_compile() {
-}
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go" -not -path "*/.tool/*"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "pflag_file_sysroot_preprocess"
-
-pflag_file_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
-
-CLEANBROKEN = "1"
diff --git a/recipes-devtools/go/compose-file_git.bb b/recipes-devtools/go/compose-file_git.bb
deleted file mode 100644
index 7fedc407..00000000
--- a/recipes-devtools/go/compose-file_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "Parser for the Compose file format (version 3)"
-HOMEPAGE = "https://github.com/aanand/compose-file"
-SECTION = "devel/go"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=9cd86830b557232ce55e2a6b47387471"
-
-SRCNAME = "compose-file"
-
-PKG_NAME = "github.com/aanand/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
-
-SRCREV = "a3e58764f50597b6217fec07e9bff7225c4a1719"
-PV = "3.0+git"
-
-S = "${WORKDIR}/git"
-
-# NO-OP the do compile rule because this recipe is source only.
-do_compile() {
-}
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_compose_file_sysroot_preprocess"
-
-go_compose_file_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
-
-CLEANBROKEN = "1"
diff --git a/recipes-devtools/go/go-capability_git.bb b/recipes-devtools/go/go-capability_git.bb
deleted file mode 100644
index e01a83d1..00000000
--- a/recipes-devtools/go/go-capability_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "Utilities for manipulating POSIX capabilities in Go."
-HOMEPAGE = "https://github.com/syndtr/gocapability"
-SECTION = "devel/go"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a7304f5073e7be4ba7bffabbf9f2bbca"
-
-SRCNAME = "gocapability"
-
-PKG_NAME = "github.com/syndtr/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
-
-SRCREV = "2c00daeb6c3b45114c80ac44119e7b8801fdd852"
-PV = "0.0+git"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_capability_sysroot_preprocess"
-
-go_capability_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go-cli_git.bb
deleted file mode 100644
index affe38ec..00000000
--- a/recipes-devtools/go/go-cli_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "A small package for building command line apps in Go"
-HOMEPAGE = "https://github.com/codegangsta/cli"
-SECTION = "devel/go"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ed9b539ed65d73926f30ff1f1587dc44"
-
-SRCNAME = "cli"
-
-PKG_NAME = "github.com/codegangsta/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
-
-SRCREV = "27ecc97192df1bf053a22b04463f2b51b8b8373e"
-PV = "1.1.0+git"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_cli_sysroot_preprocess"
-
-go_cli_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-connections_git.bb b/recipes-devtools/go/go-connections_git.bb
deleted file mode 100644
index 7e8f020d..00000000
--- a/recipes-devtools/go/go-connections_git.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION = "Utility package to work with network connections"
-HOMEPAGE = "https://github.com/docker/connections"
-SECTION = "devel/go"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=04424bc6f5a5be60691b9824d65c2ad8"
-
-SRCNAME = "go-connections"
-
-PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
-
-SRCREV = "4ccf312bf1d35e5dbda654e57a9be4c3f3cd0366"
-PV = "0.2.1+git"
-
-S = "${WORKDIR}/git"
-
-# NO-OP the do compile rule because this recipe is source only.
-do_compile() {
-}
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_connections_sysroot_preprocess"
-
-go_connections_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-devtools/go/go-context_git.bb
deleted file mode 100644
index 580463d3..00000000
--- a/recipes-devtools/go/go-context_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "A golang registry for global request variables."
-HOMEPAGE = "https://github.com/gorilla/context"
-SECTION = "devel/go"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c30eee78985cf2584cded5f89ba3d787"
-
-SRCNAME = "context"
-
-PKG_NAME = "github.com/gorilla/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
-
-SRCREV = "1cbd4c16de64273a6e63fc710b0d89bfad72cd32"
-
-S = "${WORKDIR}/git"
-
-do_compile() {
-    true
-}
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_context_sysroot_preprocess"
-
-go_context_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
-
-CLEANBROKEN = "1"
diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/go-dbus_git.bb
deleted file mode 100644
index 49b2de3b..00000000
--- a/recipes-devtools/go/go-dbus_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "Native Go bindings for D-Bus"
-HOMEPAGE = "https://github.com/godbus/dbus"
-SECTION = "devel/go"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed"
-
-SRCNAME = "dbus"
-
-PKG_NAME = "github.com/godbus/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
-
-SRCREV = "5f6efc7ef2759c81b7ba876593971bfce311eab3"
-PV = "4.0.0+git"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_dbus_sysroot_preprocess"
-
-go_dbus_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-distribution_git.bb b/recipes-devtools/go/go-distribution_git.bb
deleted file mode 100644
index dd98a317..00000000
--- a/recipes-devtools/go/go-distribution_git.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION = "The Docker toolset to pack, ship, store, and deliver content"
-HOMEPAGE = "https://github.com/docker/distribution"
-SECTION = "devel/go"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=d2794c0df5b907fdace235a619d80314"
-
-SRCNAME = "distribution"
-
-PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=docker/1.13;destsuffix=git/src/${PKG_NAME};protocol=https"
-
-SRCREV = "28602af35aceda2f8d571bad7ca37a54cf0250bc"
-PV = "2.6.0+git"
-
-S = "${WORKDIR}/git"
-
-# NO-OP the do compile rule because this recipe is source only.
-do_compile() {
-}
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_distribution_digeset_sysroot_preprocess"
-
-go_distribution_digeset_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
deleted file mode 100644
index 052658b8..00000000
--- a/recipes-devtools/go/go-fsnotify_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "A golang registry for global request variables."
-HOMEPAGE = "https://github.com/go-fsnotify/fsnotify"
-SECTION = "devel/go"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=68f2948d3c4943313d07e084a362486c"
-
-SRCNAME = "fsnotify"
-
-PKG_NAME = "github.com/fsnotify/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
-
-SRCREV = "af855d7e6014ec848882bb2ed7d40d536872d275"
-PV = "v1.5.1+git"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_fsnotify_sysroot_preprocess"
-
-go_fsnotify_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-libtrust_git.bb b/recipes-devtools/go/go-libtrust_git.bb
deleted file mode 100644
index c578008a..00000000
--- a/recipes-devtools/go/go-libtrust_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "Primitives for identity and authorization"
-HOMEPAGE = "https://github.com/docker/libtrust"
-SECTION = "devel/go"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
-
-SRCNAME = "libtrust"
-
-PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
-
-SRCREV = "9cbd2a1374f46905c68a4eb3694a130610adc62a"
-PV = "0.0+git"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_libtrust_sysroot_preprocess"
-
-go_libtrust_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/go-logrus_git.bb
deleted file mode 100644
index 211d07c9..00000000
--- a/recipes-devtools/go/go-logrus_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "A golang registry for global request variables."
-HOMEPAGE = "https://github.com/Sirupsen/logrus"
-SECTION = "devel/go"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8dadfef729c08ec4e631c4f6fc5d43a0"
-
-SRCNAME = "logrus"
-
-PKG_NAME = "github.com/sirupsen/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME};branch=master;protocol=https"
-
-SRCREV = "d26492970760ca5d33129d2d799e34be5c4782eb"
-PV = "0.11.0+git"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_logrus_sysroot_preprocess"
-
-go_logrus_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-mux_git.bb
deleted file mode 100644
index 0d69fc58..00000000
--- a/recipes-devtools/go/go-mux_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "A powerful URL router and dispatcher for golang."
-HOMEPAGE = "https://github.com/gorilla/mux"
-SECTION = "devel/go"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c30eee78985cf2584cded5f89ba3d787"
-
-SRCNAME = "mux"
-
-PKG_NAME = "github.com/gorilla/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
-
-SRCREV = "85123bf20e069b156415b871dea10517f6a8938a"
-
-S = "${WORKDIR}/git"
-
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_mux_sysroot_preprocess"
-
-go_mux_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-patricia_git.bb b/recipes-devtools/go/go-patricia_git.bb
deleted file mode 100644
index 0a3c3f35..00000000
--- a/recipes-devtools/go/go-patricia_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "A generic patricia trie (also called radix tree) implemented in Go (Golang)"
-HOMEPAGE = "https://github.com/gorilla/context"
-SECTION = "devel/go"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9949b99212edd6b1e24ce702376c3baf"
-
-SRCNAME = "go-patricia"
-
-PKG_NAME = "github.com/tchap/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
-
-SRCREV = "666120de432aea38ab06bd5c818f04f4129882c9"
-PV = "2.2.6+git"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_patricia_sysroot_preprocess"
-
-go_patricia_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-pty_git.bb b/recipes-devtools/go/go-pty_git.bb
deleted file mode 100644
index 132e82d1..00000000
--- a/recipes-devtools/go/go-pty_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "PTY interface for Go"
-HOMEPAGE = "https://github.com/creack/pty"
-SECTION = "devel/go"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://License;md5=93958070863d769117fa33b129020050"
-
-SRCNAME = "pty"
-
-PKG_NAME = "github.com/creack/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
-
-SRCREV = "05017fcccf23c823bfdea560dcc958a136e54fb7"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_pty_sysroot_preprocess"
-
-go_pty_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/go-systemd_git.bb
deleted file mode 100644
index 3aa837aa..00000000
--- a/recipes-devtools/go/go-systemd_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "Go bindings to systemd socket activation, journal, D-Bus, and unit files"
-HOMEPAGE = "https://github.com/coreos/go-systemd"
-SECTION = "devel/go"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
-
-SRCNAME = "systemd"
-
-PKG_NAME = "github.com/coreos/go-${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
-
-SRCREV = "b4a58d95188dd092ae20072bac14cece0e67c388"
-PV = "4+git"
-
-RDEPENDS:${PN} += "bash"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_systemd_sysroot_preprocess"
-
-go_systemd_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
deleted file mode 100644
index 7989c02f..00000000
--- a/recipes-devtools/go/grpc-go_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-DESCRIPTION = "The Go language implementation of gRPC. HTTP/2 based RPC"
-HOMEPAGE = "https://github.com/grpc/grpc-go"
-SECTION = "devel/go"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-SRCNAME = "grpc-go"
-
-PKG_NAME = "google.golang.org/grpc"
-SRC_URI = "git://github.com/grpc/${SRCNAME}.git;destsuffix=git/src/${PKG_NAME};branch=v1.59.x;protocol=https"
-
-SRCREV = "7765221f4bf6104973db7946d56936cf838cad46"
-PV = "1.59.0+git"
-
-S = "${WORKDIR}/git"
-
-# NO-OP the do compile rule because this recipe is source only.
-do_compile() {
-}
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_grpc_sysroot_preprocess"
-
-go_grpc_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += " \
-    ${prefix}/local/go/src/${PKG_NAME}/* \
-"
-
-# some CVEs are reported with "cpe:2.3:a:grpc:grpc:*:*:*:*:*:go:*:*"
-# it's better to have false positives than false negatives
-CVE_PRODUCT += "grpc"
diff --git a/recipes-devtools/go/notary_git.bb b/recipes-devtools/go/notary_git.bb
deleted file mode 100644
index 1b877d62..00000000
--- a/recipes-devtools/go/notary_git.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION = "Notary is a Docker project that allows anyone to have trust over arbitrary collections of data"
-HOMEPAGE = "https://github.com/docker/notary"
-SECTION = "devel/go"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=3596b980bb036e0875174ed15e4b982a"
-
-SRCNAME = "notary"
-
-PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
-
-SRCREV = "d6e1431feb32348e0650bf7551ac5cffd01d857b"
-PV = "0.6.1+git"
-
-S = "${WORKDIR}/git"
-
-# NO-OP the do compile rule because this recipe is source only.
-do_compile() {
-}
-
-do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
-}
-
-SYSROOT_PREPROCESS_FUNCS += "go_notary_sysroot_preprocess"
-
-go_notary_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-}
-
-FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
-- 
2.42.0


