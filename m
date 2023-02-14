Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E27C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 06:28:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.967.1676356118151926475
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 22:28:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kY5Khzog;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14099f99b8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E5uTxn031315
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Feb 2023 06:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=5XkOZ+tMx1nUQPFJxUlnSb/CSB6PHXnm/D8KCA9tJvg=;
 b=kY5KhzogEMWqmOhj18Vy/wadqxxe0F7/tINSvGy8xZT4gzJtkP9fgJa3SZxuTjWyhYIP
 l6jR0w6pHeMLA84oqDwxIdH8VgBr6oIzxsS5n47ywEAkrnOJnYHig9IWxfDKAX27VfjZ
 6GhWRBiYc4+Jdyxw4Son7ILXYcNyG0oXekV0+/QHUY1PW1UrLj1ifYAnxb1cfqvUrBE7
 5gy+XJoE+XTyWQZ9YY2Iur828AtlU5qKlk/9Jeg+XzRH4Vngimyvbz0G/yEnt2KvTRdY
 m2yG352EvblwpAz8sfgRypSn6eYDbaeS50KX95Dl8Vz6dOV5CFPnLwsDpEnLeENE90vm ZA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np20a2c97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Feb 2023 06:28:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lN7DeQqcDiVUJarQIT1TV6H7byohLL7sqZ+PY77mHWGrnKAC1uIj6axYrXPT+DeMwyWZqvfRS87y0BLZCKQ/bq1kA+lSfqgr/ovHxHZB8LBGKU7jMgvIcyJfcuq+6E3LM02nOnMEWQAL/vRwR5LuSc2/a10WGAoU5kej+OoWyv6hq9IXwpItpuUUtcK01jcMJpllygEqZYBjvqoMfkcd9CaeOTLfr0ZwoTF5ai8hV2rDx+B3yGQGq5uEDmQzHptIwmbfoTB13L40BLXrjDIJ4nav8ElMwWjOLSxlD36vz6CLb25J6+58jFNqk1w7w+bZ/f6mGR4v1OVTsrLh8EYv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XkOZ+tMx1nUQPFJxUlnSb/CSB6PHXnm/D8KCA9tJvg=;
 b=OcB1v6QNR5t5U8XzuoJTHdLDwnViS0M0RSLeyi/zT2WTv2sJ77ziFmiW2O00VvI2jpgLrbHjBQBpUH9mbaM9PjquG+soy9g9BXzFBwsp6ULhRay6E7JvYZBSU7rbsFvgM4MCEgmarIap7ROrrmypOMSZxooLPRThvewEVHCFnaBs/DEMAi2u6bdlntrnWYYCNzZxFLzHHJcLjWsHQovkQgQ8YmjXc8C4NZn+Wn1n6dMe0J+dzdiS9FSlnejQ3ZPCN7Vx55PjefuQMFxEeHBdl+9QiF/cl6Lh2xr+waVU/KmZ8u9Pe4H6oEJR/+fLjEiCKpazjYBQrdagLUKEvcGzcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 06:28:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%3]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 06:28:34 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] meta-virt: sync SRC_URIs between k8s and k3s
Date: Mon, 13 Feb 2023 22:28:18 -0800
Message-Id: <20230214062818.103627-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:a03:100::38) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cf4df5-7ddd-4241-ad01-08db0e54b275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	btAoQSjeAEZSXK4f+W5cHl5DO9B/PNbki3DykEJkNic3KmjnhhE/94Hs8BBMa1xIgt0leOithBAQ4/MBH9Ov2yjAetLOwRbXs4HsvP6u0B2iKJXDmxtL1WNDYaWE1lmzyIXPGTFqus4Nnc7dxqGrR9pMTd8cXHyLohw97+p9yqdtKJEdFpp5hFKcpWy2Y4EnF8HX0rXbDdKWczC7/8fS65P6ZfpRtU9CRTiXSra/msgZUd0dVw+XMxaEmBofEtY8a3p+PeW5enbpw/xbbZXpmUSbMKwUd6fRU+vzQ1jh+8zD9lbGq/gwSRypUFU+HA5u49cdO/TAO/70+7e6/ePYyeosGEdmGVaqpvX/OWDVJhreYL0IlTzUVsn2GOTfCTPdhzVkV+9swEzaOVd0Qxq8rHXlYDsdDtAGRpdak46tUi0+CneBertiMo6zPc1DPerjsYKCK8hid8cjXB7m65iNZCoqUFGnMcjCKdv17i3ef6O1JeQVMyrNeIxNpExTGNT+xBZ4Ldl5UWzc6f7QBBoKNZ5MzkXmLqgxg6Equ/TF0cAPQmT6PYvG2iq7IIQJ3lTkE2x0uX/xqdit6WKdEO0ST33rxdxta2dE94sVpty3Wd48NJAYqUEKmaaBRgQlxPRX1OYlG7nVFMTVzg4CkxxoFutUeDdbAHS2oPkZVKna5NkKxZKEm7Sz7DZyUTQNmUN2oPlYskO2A2VKcAEq+HJy+g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199018)(66476007)(66946007)(66556008)(6916009)(8676002)(41300700001)(316002)(8936002)(52116002)(36756003)(83380400001)(5660300002)(2906002)(6486002)(478600001)(26005)(86362001)(186003)(1076003)(6666004)(6506007)(38350700002)(38100700002)(2616005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PLFdAt3CByYsboy+fXivEjLDL0sAGr6ftPmgZLghJee+4Yn+lDcTFHhlM+nu?=
 =?us-ascii?Q?fE5bGPiVG+BGRghM5FCScT/7QL9hfeDBvmNeG30V13vr9McpQvo6jRdjNg5E?=
 =?us-ascii?Q?knRudt1+2GG7eOFKx5SseEANU74BpDFH9grhZHmuI1JsG7ORfWrCe1xA2PCe?=
 =?us-ascii?Q?3IrTDqqq+vRWM0xK9yAecEtkKU4EX9R4lKlqNj0YQwfcSJmrPaflCthNz5Xo?=
 =?us-ascii?Q?WIS2Iylw5tL/mTAhh2rcPldv8+Z4DjlmahMnETTXrsY7ICJN1ZHhbCysHuat?=
 =?us-ascii?Q?wvZbef9gjMtWsZCdTT2426PTUjn3aT0fP8b/PAUjA2vMCWIWdNnxB8tacMrk?=
 =?us-ascii?Q?RmkF3yDwAiktEoYy8Vbw/SAvVByKGlF35m0VzZzQZFiQOB7wlBlezj0mq/mv?=
 =?us-ascii?Q?tY0Y7UsdnOK40Y523QnsqmC4UsSUUPpWz3wj4jAmC6A6UjCenRr1Xx36jBOH?=
 =?us-ascii?Q?Do+j8CtWwrPA02a54Orwc21svmPTII4qn7TT34vAlcIrh7e9vSmZ+egDFsWB?=
 =?us-ascii?Q?hMfavdn6nxsy/iFnwkMCghX3nmCO1ZL2LXwVnsTtc17Vekqvyft2lGsPzkD+?=
 =?us-ascii?Q?vQeTomHWe/UasFDPYZ4vEkF2fi3ftPbFtkPfANJtUhXmn9mfUbw0oNKnp7+w?=
 =?us-ascii?Q?1dGhSsFCL6dXPxi2xmOivmmx6o+gaNiP/iaRNDNk9Hg3R/8gYkWt2ZGN6kcZ?=
 =?us-ascii?Q?DsqAOW1QbIoOxoV8YnVySN0JE3rF1bTaKTkxgASPKAACY7CBe2H9OVMHW4y5?=
 =?us-ascii?Q?r9HzMCXDu2EhvRMc+PSdsWa1sXgafJd4LgUuSvBDU8ncmHYjht46Tw2tNgx8?=
 =?us-ascii?Q?UDvdo/lAKOViKyNlvYf31zDbIMpfQSGolcTIX/ilfBP+e8wGHVWHNMd9dTBa?=
 =?us-ascii?Q?k5d4Uga+b6AO6SVxg1BuluWPRglWm7tdDRapmIiw1tXL/SywMpj1cIydPKeN?=
 =?us-ascii?Q?7egmBhw7xGcKAufbZE7F3lMOAl6HfI7meixK34OgiZp4d7jYOpfuT0wUMkgw?=
 =?us-ascii?Q?uqyZB55NqDjmENMYB2dn3E3JAV8OYzmIYM/9+Ou5CAXNJv8bGIlf4POCR7+H?=
 =?us-ascii?Q?oxiXtacdSFyzDul9q79By1UVkSbHv8J3iLAhhdNI7JqErxQZEaGHVraOJXXP?=
 =?us-ascii?Q?9mh7ReGxdrNfVvg6ZSik4PE6Gbm22Nahuk+JONuTRL+bnwyM9g9LoL96gN4P?=
 =?us-ascii?Q?3jQuz6uvsh9AWtm18oGPE7p7Yxn1kds4Sd0yrdeS2cXb3rU/XYRlQQxTlyTJ?=
 =?us-ascii?Q?wxibk8hnJnrQth0pTAI1iZHpM8C0JifVG19fjdlHtVZTdcm/Mh/WSWVpY2GG?=
 =?us-ascii?Q?DcXbO6uyScIG9tSKWXCsIVwU1yAr7DenJBV40t4mp/4YOZV1ahy/3Ed+c5aE?=
 =?us-ascii?Q?EFwP+za7P1DmJcKVztS/3m9UrsgyVETPygO1atzh1sW/HtPz3U7sFCmXBnPC?=
 =?us-ascii?Q?3g/xrIutsFIb2h8v4X89eY2t5KEc3oRZUs41u5UK2Vgss7ZrfLrLFmz4eFmp?=
 =?us-ascii?Q?sGApKsCHH16iohvLewdDrWB7IBASw5dwUbtn5x1tZKfWIH6FlX8jM+HeqQll?=
 =?us-ascii?Q?TihuEfHQ/72gfGhwxvqNKYAvSVNJQ63hq3hdJ4lXMq78gGqWijsDofJkxDPC?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cf4df5-7ddd-4241-ad01-08db0e54b275
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 06:28:33.9030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/lHvfBFGEX2hyRsnGaBsKgLH3NSBmLFdr6jDIZ1l7q+TFA35O0OtQWPDN8X3w0oUf8CXcQod1D6+ClSD63F5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
X-Proofpoint-ORIG-GUID: -xcfk0M4K2iTx8S4k9yN9DAp46H1Dws1
X-Proofpoint-GUID: -xcfk0M4K2iTx8S4k9yN9DAp46H1Dws1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_03,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxlogscore=982 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302140051
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Feb 2023 06:28:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7852

k3s is using a lot of SRC_URIs and some of them have corrsponding
recipe in meta-virt, which are used by k8s. These components'
SRC_URIs are better to be kept in sync, because this avoids two
local git repos (Yocto supports fetching locally) which are totally
the same. Remove the '.git' suffix from these recipes to sync the
SRC_URIs.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/go-digest/go-digest_git.bb               | 2 +-
 recipes-containers/go-errors/go-errors_git.bb               | 2 +-
 recipes-containers/go-spf13-cobra/spf13-cobra_git.bb        | 2 +-
 recipes-containers/go-spf13-pflag/spf13-pflag_git.bb        | 2 +-
 recipes-containers/oci-image-spec/oci-image-spec_git.bb     | 2 +-
 recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-containers/go-digest/go-digest_git.bb b/recipes-containers/go-digest/go-digest_git.bb
index c06a1420..ad2da25d 100644
--- a/recipes-containers/go-digest/go-digest_git.bb
+++ b/recipes-containers/go-digest/go-digest_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE.code;md5=9cd86830b557232ce55e
 SRCNAME = "go-digest"
 
 PKG_NAME = "github.com/opencontainers/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
+SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "b6234c321f263c503268e3b205f3d9755f9d14ed"
 PV = "v1.0.0-rc0+git${SRCPV}"
diff --git a/recipes-containers/go-errors/go-errors_git.bb b/recipes-containers/go-errors/go-errors_git.bb
index f1d7ef3b..678b0242 100644
--- a/recipes-containers/go-errors/go-errors_git.bb
+++ b/recipes-containers/go-errors/go-errors_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=6fe682a02df52c6653f33bd0f
 SRCNAME = "errors"
 
 PKG_NAME = "github.com/pkg/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
+SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "5dd12d0cfe7f152f80558d591504ce685299311e"
 PV = "v0.8.1+git${SRCPV}"
diff --git a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb b/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
index b272f164..b2ae9191 100644
--- a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
+++ b/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE.txt;md5=920d76114a32b0fb75b3f
 SRCNAME = "cobra"
 
 PKG_NAME = "github.com/spf13/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
+SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "b5d8e8f46a2f829f755b6e33b454e25c61c935e1"
 PV = "v0.0.1+git${SRCPV}"
diff --git a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb b/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
index ea63029a..5d66de3a 100644
--- a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
+++ b/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=1e8b7dc8b906737639131047a
 SRCNAME = "pflag"
 
 PKG_NAME = "github.com/spf13/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
+SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "d5e0c0615acee7028e1e2740a11102313be88de1"
 PV = "v1.0.5+git${SRCPV}"
diff --git a/recipes-containers/oci-image-spec/oci-image-spec_git.bb b/recipes-containers/oci-image-spec/oci-image-spec_git.bb
index d13e3d63..22cb8913 100644
--- a/recipes-containers/oci-image-spec/oci-image-spec_git.bb
+++ b/recipes-containers/oci-image-spec/oci-image-spec_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=27ef03aa2da6e424307f102e8
 SRCNAME = "image-spec"
 
 PKG_NAME = "github.com/opencontainers/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=main;protocol=https"
+SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=main;protocol=https"
 
 SRCREV = "02efb9a75ee11e05937b535cc5f228f9343ab2f5"
 PV = "v1.0.2+git${SRCPV}"
diff --git a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
index 5e0be285..e5a9ef04 100644
--- a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
+++ b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=b355a61a394a504dacde901c9
 SRCNAME = "runtime-spec"
 
 PKG_NAME = "github.com/opencontainers/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=main;protocol=https"
+SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=main;protocol=https"
 
 SRCREV = "7ceeb8af52593e37d8ef28bd350f50044b7adf1d"
 PV = "v1.0.2+git${SRCPV}"
-- 
2.37.1


