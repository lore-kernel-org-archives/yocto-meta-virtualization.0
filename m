Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4463.1608694756551156604
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 19:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B7LrBcMR;
 spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: mingli.yu@windriver.com)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (mail-eopbgr750087.outbound.protection.outlook.com [40.107.75.87])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A081838C08E2
	for <meta-virtualization@yoctoproject.org>; Wed, 23 Dec 2020 03:39:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmaBRQ6hSin/k2LFOm5lbnbgYUo4BhmjPVKt8XYUiYrlIQrq+7bYqbNXNmDtRaoKoPjrGtzaAy9Jzsq8CO87hlSHAWHcjbKIp2aA9mP7iCWeRvtAu1MJNBRoE7U2WmDz0rMVBX+SYnumHrH/jthQ400c3HywKOi8hQcFj+9I3cyF8VkiWzdAgz1oxHCQNhiqmRKLPMqN1pHWkSHoOOEu5qapGpm+HdgViAG1YPnAGqRkhPJxtN9onuZrxDwh4u3auoJLXc352ZBCmmutDlCudoQI3RWQnQ9g1frpn7QOdZcBn/1fhwvMhO/Ig/8oPERctXITcFrre7bz8l2LyzhhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3GbtZ7RW+t/sY41srsmJOAdigc8dQfpGyi0F1F0yRE=;
 b=IbI3iZfdsGir9SZO38ymKL/M6AgajzfCWNy2FqsqKYxlH77jcOdfyxjgh6tO2eL7dqKgiR+fcAriY4kiZyKst9uNSZuKBwm1Rzi3CxyWh3WYY3wfWX8IqHel8xXcNZlfl6Dt15zW0THvEE5h9s9GwVGBgHaHE2tm7G+RDeuhQL0N+l6BOv+n+U7YBTEK1I8M9ug0Tq4ws62ulZEC5DEyAUEEj+BjMn85cDyMU1J3coLLjJpYigk1Ao0fcRp0hVQzrdpd8FxF0hekIm2B6RR9YIShc2skv6GFuot7cstaCC8NYz/vehSAxcIJ4Pfd5+pjUEXmiLs+LOCHBqdAfERCKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3GbtZ7RW+t/sY41srsmJOAdigc8dQfpGyi0F1F0yRE=;
 b=B7LrBcMR4zRllgnTT6ArDeAT856IgEZ5TK1nFD6FqnlIUkdlFtNy/5Sd8v2iIM3Vj8LXh+F0G9Rn1rQc4zGRrnWGG7bmYSxlvJS+RvHSfIADMinoi41Yx2BjgNXUufy2y8xKRIONg3fM1JP59P5MMfrYRbeOdfwgT8nM+FoGNx0=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1310.namprd11.prod.outlook.com (2603:10b6:300:28::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Wed, 23 Dec
 2020 03:39:13 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 03:39:13 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: meta-virtualization@yoctoproject.org
Subject: [PATCH] containerd-docker: remove the recipe
Date: Wed, 23 Dec 2020 11:37:51 +0800
Message-Id: <20201223033751.3553-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0110.apcprd03.prod.outlook.com
 (2603:1096:203:b0::26) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK0PR03CA0110.apcprd03.prod.outlook.com (2603:1096:203:b0::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Wed, 23 Dec 2020 03:39:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68eea60b-3bd7-4fd8-d82b-08d8a6f45140
X-MS-TrafficTypeDiagnostic: MWHPR11MB1310:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB13101ADCFBAE880A8A1550C2F1DE0@MWHPR11MB1310.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ww2ZzkpShTOuTFqSJruux6Ezit0sf2dSU06Yfman3UNNLl6/2+mmss5q6tt0ErIqF34qrFmnMZA+D+/q8rzZIsrKeL5cxYX9r0mItbVRQ7KDt8QHSFuS5jm7sTyAOEwzu1cy2/A9TnxjZL8uMyu9ZGmlGNGH59t+NnsBQNe0BI4KYajl/lVIJdrVj86FeEgd+2RZffbjGEiT+Yx1brH4nhbalqlfKPVclMRhNoS16/2HkQmtzsBQyfp3fRpp9Ple16k3hcucCu0W3mOnyCR/xxY4QeweTn/MxVC7qK1k2Q+DUdlEKfu3jsuk1egPmvrDLnUjNwqiWX5MVdoSDLtcLR8yM39EgakXFY+03A629R64fOnrPtD38sUDKL4GYH/njqRm7tAGfRd7GaRsI6BjvA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39830400003)(9686003)(6512007)(8936002)(6916009)(66476007)(66556008)(86362001)(186003)(16526019)(316002)(26005)(2906002)(8676002)(6506007)(6486002)(52116002)(1076003)(83380400001)(66946007)(2616005)(36756003)(5660300002)(956004)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?65greEaZ57QzQUf4BhNdf1pwew0GhSMDIzsxo/WKf+oebn/HP1kprAACLHeM?=
 =?us-ascii?Q?2VKj7uv6ulNEWZkwdHKmnjSe5Ej4XAQIedjBGIxdVmJi3etYRwBFZ004tvhM?=
 =?us-ascii?Q?ojjlKpd7w+rBrC2o7IzXEItu1EmkkaKjV2v5NgLmt0BfezrEd8Bb2AfGF8nX?=
 =?us-ascii?Q?150VBEqQWWRXatb9m6uYgO6qZ6lDBAcwX01+Y8ZysxRhDyx/GVzrFI1SPtqs?=
 =?us-ascii?Q?+5pRH0yssG9OX/vY0Eji8wwWXCZmBSBhq5y4p1G76Xedv/9/bderKoCU1Gqg?=
 =?us-ascii?Q?t2Mx6d8nXxcb22714kfb3HdodU+pvxD/Etp1RtQ9LrJMydwHCrncz0PW9fs/?=
 =?us-ascii?Q?CtX8wUx27GK4JuTEDVXEFVWS0VHw8nO9m4D9rdCAHStLUT0JQPdkidPYQ843?=
 =?us-ascii?Q?UBAL/wV5nPiUctTkLAC1qXkc9LaNenxvAMc9zeUNxKBF6+uwSDosEeIzGQQ5?=
 =?us-ascii?Q?l53K5r3SwwQ1WzcGFXJQqtI67pweOXiJMD6Y+0ZDocNUXGxLF+TtbY+4OdDq?=
 =?us-ascii?Q?7l5NZbdwm1ccP+5qB2JeR/Ityontl6Ym2nf2mMd5bM9MMQbtxo80I9w8iavN?=
 =?us-ascii?Q?lkao/hQpp2aaYLhe/T0Z1ZWeVLYirhC86gsL4LME1z7z7WDYH+Ppt8Eefu6q?=
 =?us-ascii?Q?gLWVdhGwXRiWuqCLVFu9j2d2WOH6NpiL3yHvM6DpRoL0E+GCgPvBIR4y5FtR?=
 =?us-ascii?Q?GESVXfMK4Dl0OKu0oDMHykINnIvVPFY+frZxNlNedkiYKwx3/0QTePr0JIA2?=
 =?us-ascii?Q?6VgQcNydG4v6fvlRxs89j0LlegN3acFQYdf5oBVH09RrEff45MNq/3plSdCR?=
 =?us-ascii?Q?UkToUCDGXAo3otcFu3vpX8R1wRvsmfsDnVq+ekE2M9d6GYEpO0oZbygHnNxa?=
 =?us-ascii?Q?6oiUIifkOZDmgkGbW8jKoyD9kDIIHfPQG6Kr6E1fySrNbpEqVIox2LbEfHBJ?=
 =?us-ascii?Q?UEshY4ATR7EB8OKtvT3OuHZPxTB3O4KygpzxIl06hmbm4o+n2UpefsqlYHqf?=
 =?us-ascii?Q?1gWE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 03:39:13.7653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 68eea60b-3bd7-4fd8-d82b-08d8a6f45140
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVsGwA6mhTCOy6SdJD75oDxNsGgStihdYjQqHFH635I3kC7qFAYC5prm/Bx3CBlTD6n+QW6nOEzzoI95tjeZVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1310
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Mingli Yu <mingli.yu@windriver.com>

There is build failure for containerd-docker as the below logic in
containerd-docker recipe.
do_compile_prepend() {
        bberror "${PN} is depreciated and will be removed in the future"
        bbfatal "use container-opencontainers for a working configuration=
"
}

So remove the containerd-docker recipe to avoid confusion.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../containerd/containerd-docker_git.bb       | 22 -------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 recipes-containers/containerd/containerd-docker_git.b=
b

diff --git a/recipes-containers/containerd/containerd-docker_git.bb b/rec=
ipes-containers/containerd/containerd-docker_git.bb
deleted file mode 100644
index 8d1a27a..0000000
--- a/recipes-containers/containerd/containerd-docker_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SRCREV =3D "3addd840653146c90a254301d6c3a663c7fd6429"
-SRC_URI =3D "\
-	git://github.com/docker/containerd.git;branch=3Dv0.2.x;destsuffix=3Dgit=
/src/github.com/containerd/containerd \
-	"
-
-
-LIC_FILES_CHKSUM =3D "file://LICENSE.code;md5=3Daadc30f9c14d876ded7bedc0=
afd2d3d7"
-
-include containerd.inc
-
-CONTAINERD_VERSION =3D "v0.2.x"
-S =3D "${WORKDIR}/git/src/github.com/containerd/containerd"
-
-PROVIDES +=3D "virtual/containerd"
-RPROVIDES_${PN} =3D "virtual/containerd"
-
-DEPENDS +=3D "btrfs-tools"
-
-do_compile_prepend() {
-	bberror "${PN} is depreciated and will be removed in the future"
-	bbfatal "use container-opencontainers for a working configuration"
-}
--=20
2.26.2

