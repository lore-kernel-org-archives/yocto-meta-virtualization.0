Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4CFE77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 09:04:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.108])
 by mx.groups.io with SMTP id smtpd.web10.6422.1733907890828963927
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Dec 2024 01:04:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=LJKOjfgh;
 spf=pass (domain: witekio.com, ip: 40.107.22.108, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPiF0aVYF8P+81B+6CtdIPpA2GqoD1GgrV7dpjM8ULio9tW1w29qHs1zPJ6Q1UnZ/2UKXZnfvM/wMNTWRP5hNzthcRPp1emBW5goTzaX0EJRAodVUk9xANCzSBc1xd48DgllOf8QebtkqtQnYsPZpkAvWu1eJMTW7+gYCBZOlx3RCOAcC7CUwyYykeZ0/p1bEs88Ckr4BLlPE/6NyjT4FGIXIhYd/FKPet1z47iDOMq3V8Lcu03nDHSFJuifkgMzeqjLrzt/rR+84IB3MpndjxhOVtBzl2PbWjivFHT6yi8R7JYMcPaNtaB6NUwtijBUebuaZQ8pbifQydrF3jONIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQ+NZajl4868sarzJ6ltO6oDFgnnvz2oDy7BOe1p/eo=;
 b=QJJpwRnHbNrMFBdlRxO/hLfxgiX4ePnnBmo6PIDH722eRFBxrS6HJ08puRCZ3VzHlqdBOsOKlO6BkCO0V9x/fgRIYQqoA4cxhD+i22zA9Gxy/JFaFlENRoDO81Dxrr0AXHNPHeLaJQPhzC2ZGCKj29lRs6ONAID+hadGY3nt1H+RacVSxGEVKudG6b47Jf6FCIjXsjXFNL4rmjm+GuV5xkDCvDmT9OOUDltWVpi3gs3vlpRTULabhKaoWz8cJF+OIDgV0e0gSssOIdGOWFYGNxotFYlkPd/EzlzlyGVFC1lISIFNnbiuMh97iXskwRa3JZimmr2ZIRpys0Ob643kFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQ+NZajl4868sarzJ6ltO6oDFgnnvz2oDy7BOe1p/eo=;
 b=LJKOjfghn4L9sNAJaZ+lwGnYkFkjGRK7z/OdHolB1255jaQvrBe8FoF7njE4RnglS4+6Twyf+niXXeqBhwmAFGpjx7zFoN6RGyUNyhjk2zb2lQURv4iErLnJ+TmeTXWtIzhlZep/YboTk2/olQu8KqFUFTzlYu+lfYXu5+n7T9WMfLjfJXw7c+huWRZbc/yTD6NN1tF/XAds287mmveiqukx5ZiGcjt2bieVAXBcmFkiLVSllOVLs5tjuDfudnjWapfX+5G2u/baZWSMcr+HLNgb4YX/5EKQC7yHCtUKXVN+RCihOdwB5OgkuYnQt6Wg4gvENnnYgrV/dqHvjApluQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by GV1P192MB1665.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:5d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Wed, 11 Dec
 2024 09:04:44 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::345f:a9e9:d884:3091]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::345f:a9e9:d884:3091%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 09:04:44 +0000
From: hsimeliere.opensource@witekio.com
To: meta-virtualization@lists.yoctoproject.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [scarthgap][PATCH] runc-opencontainers: upgrade 1.1.12 -> 1.1.14
Date: Wed, 11 Dec 2024 10:04:17 +0100
Message-ID: <20241211090417.8979-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0251.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::19) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|GV1P192MB1665:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ae0d52-365e-4cdb-5466-08dd19c2dac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h7e1d/0GR0xTBwWvfRhkJ+PLNTLmz9T1GxuzRyHnlVzZKidiM2NMQX6hZdtR?=
 =?us-ascii?Q?4d3jPU8HGe/TtABxKCcF3FOwGWuEfktd2dA1enWJJSa/qeV4AwZGChmOEUTg?=
 =?us-ascii?Q?N/e4YQ6dHb8K1D2cwDJs5zjMCJxqCTs+OKtxAV/22l8DZuHux4e50bJ7GLVz?=
 =?us-ascii?Q?1pDG1M/uoNw+n5XS9nAG0FNSjbNTiAkBB22pLNSwWsd55UXulSsz7u7TG5Z/?=
 =?us-ascii?Q?izhY9PFHnPasaosUlCYYRPHd1vOh6Tgc3HKF5w22xzd+MJSMw7ngtcPazukn?=
 =?us-ascii?Q?52anJCFbrF7akhapb+IRyND9Ax+yEltdocu0zm9eZXfUvgaLFSek8sYWka3M?=
 =?us-ascii?Q?ahHDyIYJmhaZS1xxhjfcjO8IvvE9enQjUuTAvI4UFdMF4/stR6ZMN4jl1+PE?=
 =?us-ascii?Q?njk0KNuRFZRnvg5AuALXXZr71At7oLGrb9FYwHK2dv5zazdPejzsGUEppVxx?=
 =?us-ascii?Q?nbVzdmCYTpriAxektJ6eKmcqiRWZEgYc3gumwMNPIM+lOGBDMfWWtnJpXrzT?=
 =?us-ascii?Q?pzrKTYhwi/QHnQjO/WsvFA6L1nJzuxFHnbIjum2TfYdn1FE4yyyE0UrCi4pS?=
 =?us-ascii?Q?+UkWbA2LEG3XHUUpaeTeqJ3+qdNI4dvDh5tVR0REXL+tN2pqWN9J4zJ2KJsP?=
 =?us-ascii?Q?JF8meCYdkMBsH67wmdYFTt3DQyEHhdNtbVSAS3jgvyAzaCcFxWr4EZb622Ir?=
 =?us-ascii?Q?c/FVIHOABBgQopohn44MZaGsmsKDaLXnLz6V5hFU92/siPEuh0GOu3gfKBRe?=
 =?us-ascii?Q?8HFQo24BpE2i9/qgUOFDoPU96c7ERnTc516RFgBYb7+Rd/lH7DzMath75kNj?=
 =?us-ascii?Q?2w+GObxwXVjr3KjZR8/Hj9F78bCdKzBR6HgY8tGUS8rqnLPZgmAyXvncps2Q?=
 =?us-ascii?Q?AqCegU3n/zfcsEIygBvpC6jP/6sMQJJe8yMnti1YrOjIMnEFhit22cSDx0kZ?=
 =?us-ascii?Q?+fFcdZF83mclxaDLqJD6i9+nrtybu7XLoq8RU72zzbVOjuOQm4PtjFEY2Mo+?=
 =?us-ascii?Q?Xah2AgQqtJYyjt4aZScjCRkv/VNm0fqMlwzv9KwMxy0dXjgyn+J8DmVBi5mS?=
 =?us-ascii?Q?tKgMHDkF0ZvyJjaIjwGCCgIU2vvVVQ+1o+lrwXY69gvgH+W6/DAR+mNP2fY2?=
 =?us-ascii?Q?dQBGOWdZ4lm7GieTZpCIvxKfyUWE3iLEM2CLR+wf7qU5P8z/53+RE3nHKiiO?=
 =?us-ascii?Q?aGKqSGZg2dXvIvL5JW/AVLcLJVcr/ld0Q4Yn3Shil4xWiXBO3Rs4O2Ugg0w6?=
 =?us-ascii?Q?Fldnh/ZCs8xTJ4aia993S0I3bCe1YgWAUaluLNiEiF+Uu8UQ/uEE8ArroFvA?=
 =?us-ascii?Q?okZ+WbS4sunDburI/TMyfV6azjM3c63S7pXAPcvx6p96EzkKyNzI3fOTyWRY?=
 =?us-ascii?Q?CTvg/Hw0Dyup8wGCtIvoQtOx/m66lK02MtXYXqYLMgE/d4VJ2A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P536dFYYjynKW2LBbffeT8/4ULE1IBIiUyAuujLOneArftiic4cobzZU196D?=
 =?us-ascii?Q?/o+TJ9T78TLZnyx9g8ZF57tCVWdxTZubpF0YmGE2C+3t158ZKEPIohZSt30b?=
 =?us-ascii?Q?gEf62vAFd9oX5mpxKac2rRiW3px7B+vCvyR90xZilG/j4Y4oeGR6/65oNZjx?=
 =?us-ascii?Q?wyVYcFc0SL2k0D4tB+Ui9hTRb5cCg6SnnyxeH3E0kvBTGLzt2l2KOV2mgZzu?=
 =?us-ascii?Q?YkH/um66v4i3RNYKs5HkksaVBgkqBaPSmpt3dQqeldMw800M1cJLIenyB6g4?=
 =?us-ascii?Q?ymMOrHAj6hOGqfFpYCGzj/fzD7fzuAB5hiduUn5q7z3risB0SxazD7I8id5e?=
 =?us-ascii?Q?msVcqDi3jjRoPL+/mFSbmwQOewVSEj/f59P/TvpwZjfA4TLkXPCsJzWzoW+c?=
 =?us-ascii?Q?l9XEp0umnNmRGdhbYW/jraeyw/18VHLRHDtFkQ3decGBxvG0m1/NPCM6BShT?=
 =?us-ascii?Q?fV38XfquBxR5Z8uv+/rhKCU6hQdK1lJcr8xmmKEES0TJWfrcoTFAejLPeuct?=
 =?us-ascii?Q?MRujJML8IFZDuNesQew+KvXI/DemVZACCs2XGu1Whha8RtY8oXbk5AR9VOqj?=
 =?us-ascii?Q?6SEyy/mW3sCuY3PMxSDk0r+vswK/YRHbFTu//vtr2Q0473SnsBl9n/uF1Vc4?=
 =?us-ascii?Q?/An6NuctwUbEa3p/WasxbuCYVIsVHOxzwriNGF0FhK1yA+Tn7MDVb2I6lSfL?=
 =?us-ascii?Q?tMr78M/QnXYKGgSRqOEjwp/r6cVvN16KFfodLpRPOdN3d6Ic32BIqjF3Xkze?=
 =?us-ascii?Q?tUaAcXBNvQLX6sDy+T86mupKXc51Aqwg5/PtxRPuLqdcwBnhlssYQGqkpfS8?=
 =?us-ascii?Q?unb1wzdBgQj1XTYifZ3Tp52XJLRfqzQAcXFaDyhRDvN448ue/qz/vZOjvlCB?=
 =?us-ascii?Q?QrGh9BXEmO6frHcsQkoBAQA/PZF0oO8u+mR6N4V5OJcVuTYm8jhLGVtZuMpY?=
 =?us-ascii?Q?ivZiWZSdSnBrxgtCJgdQfq2GvoEwT64ncfF4/jWqLq9yCxpxzf2XY0NfSe42?=
 =?us-ascii?Q?b8zdaBIXrNWT27P/xEHOEdUd+QMa62O1vIqtp8K+apjEe1MOv0yCFj0oUioE?=
 =?us-ascii?Q?qWWJ9BdLJfsqIEFkvc4aPuVBpb+OYlbiPy3/RioDidE4i7oMdVS7BQXfESrL?=
 =?us-ascii?Q?6h7uIYOOoJNLtmrMG+behHtQGq2dbL7BhbEgw45qVpOPkX0dM+bbllqoKBqB?=
 =?us-ascii?Q?Jadg3J6/p/mVkMXxjT42UnlmgfHQj8bwtoa+1b3FcDbKihtYYNeDP3JYTvXI?=
 =?us-ascii?Q?+3zkLTHGjDk7Nj7SguNrgMsolfCLLQtxr8ZkCHbLDJruINcXP6wg8GaI9tWZ?=
 =?us-ascii?Q?0nhw7r5h1XCCc4Y8hIVZXoNQutK3lVdcQsDwiNXfVREDazXUq2Z+GTt1F7rp?=
 =?us-ascii?Q?V77P8e9XG5XVfCUsO/xGA6F8x5cIfcFjUey3c66NkCOT7TCJk2ZYsAux7na5?=
 =?us-ascii?Q?wNyTsKmnqCxyDXNNHJcxRtfWG0/4d2iNsw1e2YtjWVz7BGYSXxvmRJQgA7Pz?=
 =?us-ascii?Q?Wr+yGXlUAjRA+BmT+Its+oePfImTCqkrGFi9e3zH7fBZxe5ZIFNTpRSNcd3L?=
 =?us-ascii?Q?p1VJkmpAOe0yvdgRWsemUnwMTCBEMAQ9NrxyvDyo?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ae0d52-365e-4cdb-5466-08dd19c2dac2
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 09:04:44.7713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NU+vb1R/36SOxE+l5yU6m0C0QG0b7cUXbLZ1SRI18hYQjzo24zwXXUlsyYav8fSoxFdd0HFv05WnhpsIMT6IgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB1665
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Dec 2024 09:04:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9058

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Alignment with runc-docker version
Includes fix for CVE-2024-45310 and other bug fixes

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
https://github.com/opencontainers/runc/blob/v1.1.14/CHANGELOG.md

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-c=
ontainers/runc/runc-opencontainers_git.bb
index 188b8440..6eef2c8f 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,11 +1,11 @@
 include runc.inc
=20
-SRCREV =3D "a9833ff391a71b30069a6c3f816db113379a4346"
+SRCREV =3D "2c9f5602f0ba3d9da1c2596322dfc4e156844890"
 SRC_URI =3D " \
     git://github.com/opencontainers/runc;branch=3Drelease-1.1;protocol=3Dh=
ttps \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch=
 \
     "
-RUNC_VERSION =3D "1.1.12"
+RUNC_VERSION =3D "1.1.14"
=20
 CVE_PRODUCT =3D "runc"
=20
--=20
2.43.0


