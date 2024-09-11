Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E919EE57C0
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 16:32:35 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.50])
 by mx.groups.io with SMTP id smtpd.web11.26279.1726072354378636651
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Sep 2024 09:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=E+GLXZVw;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.50, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldA3AHAwi4WKUpEJ225pkHpRh8Pn3d9uCnOIRAUdlopWkglf5Ay1Z6QWon09KD6wCq9o4abY161Svvg6+EJlMKGK4TLTDwnqFFGssPkwvnYknURYmRkoiBYS6+xV/7zCTg9nWCL0hoLs6b60Gwt9e8lnwpnZpbt42gyfF/MU9on6qT+JvS3NS0NUpV8jx5JJOxG6w+mUNnkhLP4Ii7GA6ELPbY/LtE01ZHP8cXm3nVdX7yYD+TRT9nBewQzOboqn5NXPa0OR9hGmaGrKpj6OVFskgLpTTKtNZIaLPWVAgVfb/0bmnoLAP8MdqCO2dVL/pp5ciYxxr/s9uFKfKiWH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9MMxk1fWOfTOvPH0v+iwNEKSNX/0RSuRW9Wb3W/Eg8=;
 b=uheOOUJoxhG76UZdWtxwNTX81QCSuz0PKChVnXqcItb9ewjkZ77FXDbPCFAav80SpcU5LsdGioEVormQqa00TklmQpJ+of8YkRRVdUM++DcFKQA6pULvY6mZ6uR9o7dOYsElntPmY6GTPalaelBqU42psCzqWVhGSHpBU/1aRRj3qjUVNC9N+cVAqdtwqw/5vJ9F+IrRBmwokzK8QgpiJv06pk+nHOloE8t4YAFyL9PYot0vYGUomz9rcyBcfqgDCM00H5xgNL2Retnb1Uut6/S7dKkjSEFev+ASEad1MIUsKf1Wvp0DGxjeCXPYTtxGEdYH0mf/BoVbEGw1Y3TJ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9MMxk1fWOfTOvPH0v+iwNEKSNX/0RSuRW9Wb3W/Eg8=;
 b=E+GLXZVwIMjrng7zkpGh6twfGN3R0NhmKrSCPx3a/5pG6GMNot2aeg1NxpHoJdDQuNKNPDQzetCRbtT2a3BljF7zR7EXgkYf80vSiPCM80s/Jp29ivM76slm5RPrYSgGj9hk5W5XzqnKgiPVFfQBIpwyiSw8CtvbsBq5hlrRl3M=
Received: from SJ0PR05CA0031.namprd05.prod.outlook.com (2603:10b6:a03:33f::6)
 by LV8PR12MB9231.namprd12.prod.outlook.com (2603:10b6:408:192::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Wed, 11 Sep
 2024 16:32:28 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::a8) by SJ0PR05CA0031.outlook.office365.com
 (2603:10b6:a03:33f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 16:32:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 16:32:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 11:32:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 11:32:26 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Sep 2024 11:32:25 -0500
Message-ID: <6e9e999d-ca62-4dd1-bea2-4e7cbd89c91f@amd.com>
Date: Wed, 11 Sep 2024 18:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Fix XEN_REL of xen-tools_git.bb
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>,
	<christopher.w.clark@gmail.com>
References: <20240911093107.85557-1-michal.orzel@amd.com>
 <CADkTA4NYi4S9zDWVTE6OvPgkPk6s3CTbP+qEbvZL-UizzkJMYg@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CADkTA4NYi4S9zDWVTE6OvPgkPk6s3CTbP+qEbvZL-UizzkJMYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|LV8PR12MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cbedcea-7e97-4fd9-54e9-08dcd27f5338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ysuj9gPaJo7a4rcS2npWSS3qMaq46D+pWdqd/k6U/B3zIeXP3i78lMX7WaZe?=
 =?us-ascii?Q?LSeDQKar3y3ZgsPn7bj0ifXWKuFC0ylKxZ8u/zrJPyUds5q+GK2hQPqOEa3n?=
 =?us-ascii?Q?blxllHSLx3Z2IcJMlqRk7OPyQFY540/oCegE0ome/F/jC6cSzCM2JE8f/b+/?=
 =?us-ascii?Q?BqOusnIVlNDrGryPf1Qhu3LlCTZnJ4sEEyoAWPzD+rXa4v03B+tSsQysZ4Dk?=
 =?us-ascii?Q?eBbX/505FS9ZulCI2nl/EuU7SF7LK24AP0ERhLOUOP97080muH0N+Bp1gN9O?=
 =?us-ascii?Q?azAob2woYHl8/XCnRPmoF/nO/y9/KYmq6kWaIWrTlvyVHyKAgT5Z8IOWO6o8?=
 =?us-ascii?Q?8i4ZtC1cumOEDCRCy4s0opIZXbRd9xFTPthMUvmsKqztO0fetHICgpPhgTtB?=
 =?us-ascii?Q?u+6ztYxHdsW2yEoPaELNB+DznJWmtKt+RLn/cjZqoqTCfD6CaGFJ8NROG2x0?=
 =?us-ascii?Q?l/riw4UG0fd76yQ2x5NaObjaZQzWgCuJEYdMjnFVmTFPLKLikiXB83awUg4Z?=
 =?us-ascii?Q?WhHJOibXI2xqucqlfDyhSNbncuTgNEQOpHLBS9RWbXRQ24qcnfH2zTJfJdvQ?=
 =?us-ascii?Q?XK2i5rjW1tV0f7v+wbq254y4wsY4ulY6NTtQf+D1V7hHrBf50KI/SINYdcEV?=
 =?us-ascii?Q?qmDsZDXLE5z+SMOBTSvkvfILvEVwIdyd4T8WYXTEBINSKKlHc3DMxMW0LbWI?=
 =?us-ascii?Q?fmlvCac0sM11v8BKGTgmqUl54iKW6+HDnMWTuticoY0+Md/UvGYXQGDhp1mC?=
 =?us-ascii?Q?3vApgxgCdNtf7oGV5GNYRfWVqeHImq1beWgIknufyaKRdSsj2FRf9H1r5jCb?=
 =?us-ascii?Q?OQ5jR6a3gBsxTzAj8FSITGZgEF3mbMnfgdGvBngEAgAokCdNrrqU4/sZlrhk?=
 =?us-ascii?Q?D/cdMkw5jjQNHOvkQEUv0YCGPyX242rudfh8pWSlZl/h/dsN7/XQHY279ICs?=
 =?us-ascii?Q?MaDKiAIJjYq6sMl8kQWn+7MEMa7r2COV4Bt+kyny0O4HiiMX/og1iKKA5wmB?=
 =?us-ascii?Q?AqH9IKJimfqlDIQXZWbV5kd8OGTVo7A/8xupqms/88d5TXKbCso9Dm3xgR80?=
 =?us-ascii?Q?SIPY/Z8kQZ7UC/v3wduhBopXgyv3ok9Ffzq0uisyZAYnXL+Zzd+ytVPa6x/c?=
 =?us-ascii?Q?xMrsUgXr/dViNQB5JjcE/PYi3u+efZFchEqjRYSNlV671e1Q+Z81RsschdMi?=
 =?us-ascii?Q?vEHuF6NxZv14ywbJ7wSEotzUo3FoKoluM+kuGAzOmcS2ouOD/e6YYjdTA2dw?=
 =?us-ascii?Q?+egBJ7rXYdryC3K9bRQn0wyrS67Gs+WOZgYU90rYi4xk0Rzp6SrWRLOcnFnB?=
 =?us-ascii?Q?u4rDrP7ZUAeZYDYM9hgr4e9wwc/qpc0DHF4KRSSqqDEObEIiaTJzzU4nmK+G?=
 =?us-ascii?Q?0597wD5Nyhlbn6ndNYXFWEODZvdC?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 16:32:27.7085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbedcea-7e97-4fd9-54e9-08dcd27f5338
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9231
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Sep 2024 16:32:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8881



On 11/09/2024 15:50, Bruce Ashfield wrote:
> =09
>=20
>=20
>=20
>=20
> On Wed, Sep 11, 2024 at 5:31=E2=80=AFAM Michal Orzel <michal.orzel@amd.co=
m <mailto:michal.orzel@amd.com>> wrote:
>=20
>     It should match the master recipe of Xen hypervisor which sets XEN_RE=
L
>     to 4.19.
>=20
>=20
> While on the master branch, the current SRCREV of the tools is 4.18 based
> (at least in my checking). I was going to bump _git just before the relea=
se as
> I didn't want to it to exactly match 4.19 when I was adding the new recip=
es.
If both xen and xen_tools specify the same commit SHA, we should use the sa=
me XEN_REL.
Otherwise it looks strange. The issue is also with scarthgap, where we obse=
rve warnings
due to this difference (i.e. tools specify 4.18 instead of 4.19).

> =C2=A0
>=20
>=20
>     Also, take opportunity to remove no longer needed patches.
>=20
>=20
> We should log why they are unneeded in the commit. Yes it is obvious
> in most cases, but a one line statement for them helps me when I'm
> looking later.
Ok.

>=20
> =C2=A0
>=20
>=20
>     Signed-off-by: Michal Orzel <michal.orzel@amd.com <mailto:michal.orze=
l@amd.com>>
>     ---
>     We could also update xen and tools to 4.20 right away to reflect the =
current
>     development version but I'm not sure if we want to do it at this poin=
t.
>=20
>=20
> See above: that is already my plan for the next few weeks. I'll move _git
> away from 4.19 so the _git will be available in the release. It is ok for
> them to be unfinished and in development in that recipe.
Do you mean that we should drop this patch completely because you are going=
 to
bump master recipes to XEN_REL ?=3D 4.20 development branch (i.e. current m=
aster)
in the upcoming weeks?

>=20
> =C2=A0
>=20
>     Unrelated question:
>     When vmsep is enabled, the tools recipe RRECOMMENDS qemu-x86_64 and q=
emu-i386.
>     What is the reason behind it given that the only qemu that is needed =
in the
>     target rootfs for Xen is qemu-system-i386? What would be the best way=
 to build
>     only the QEMU required by Xen (upstream) and not all the possible com=
binations?
>=20
>=20
> I'm not concerned about extra building of qemu components, it is only
I am concerned. It takes definitely more time which is something we can obs=
erve in our upstream Xen CI.
The less time we spend in the CI loop, the more patches we can test.

> an issue if they are installed on the target (which of course they are
> if images are configured to add rreccomends automatically).=C2=A0
Yes, both user and system qemu for all the arches gets installed in the tar=
get.

>=20
> That's why meta-virt was the first part of the ecosystem to even offer
> split qemu packages. It was all or nothing before that. You can see
> that in some of the image=C2=A0 recipes that I'm still working on fixing =
up.
> This is an artifact / holdover from that history.
>=20
> The vmsep=C2=A0based splitting covers quite a few different runtimes so i=
t is
> a bit different than OEcore splitting, and I've kept it for compatibility=
 with
> other layers.=C2=A0
>=20
> We can absolutely change our rrecommends in the recipes. In the short
> term, you could always :remove the packages you don't want and/or=C2=A0
> configure your build to not automatically install rreccomends (but that
> is more drastic and will likely break more).
>=20
> IIRC (and as you are saying) xen uses i366-system regardless of the
> xen-host (target) architecture, so it does look like we should move=C2=A0
> to qemu-i386-system for that rrecommend.
Yes, that's what I'm saying. Will you look into it or should I send a patch=
?

~Michal

>=20
> Bruce=C2=A0
> =C2=A0
>=20
>     ---
>     =C2=A0...ython-pygrub-pass-DISTUTILS-xen-4.15.patch | 73 ------------=
-------
>     =C2=A0...enstored_control.c-correctly-print-t.patch | 34 ---------
>     =C2=A0recipes-extended/xen/xen-tools_git.bb <http://xen-tools_git.bb>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-
>     =C2=A03 files changed, 1 insertion(+), 108 deletions(-)
>     =C2=A0delete mode 100644 recipes-extended/xen/files/0001-python-pygru=
b-pass-DISTUTILS-xen-4.15.patch
>     =C2=A0delete mode 100644 recipes-extended/xen/files/0001-tools-xensto=
re-xenstored_control.c-correctly-print-t.patch
>=20
>     diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTU=
TILS-xen-4.15.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DI=
STUTILS-xen-4.15.patch
>     deleted file mode 100644
>     index 476f5ddcf1c6..000000000000
>     --- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xe=
n-4.15.patch
>     +++ /dev/null
>     @@ -1,73 +0,0 @@
>     -From 6db88791d923167f160afbcadeffad84a4cbdbc5 Mon Sep 17 00:00:00 20=
01
>     -Message-Id: <6db88791d923167f160afbcadeffad84a4cbdbc5.1612262706.git=
.bertrand.marquis@arm.com <mailto:6db88791d923167f160afbcadeffad84a4cbdbc5.=
1612262706.git.bertrand.marquis@arm.com>>
>     -From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com <mailto:maciej.=
pijanowski@3mdeb.com>>
>     -Date: Fri, 19 Oct 2018 11:01:37 +0200
>     -Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py =
args
>     -
>     -Upstream-Status: Inappropriate [oe specific, python install issues]
>     -
>     -Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
>     -as well as other parameters set by the OpenEmbedded build system.
>     -This is especially useful when the target libdir is not the default =
one
>     -(/usr/lib), but for example /usr/lib64.
>     -
>     -Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com <mailt=
o:maciej.pijanowski@3mdeb.com>>
>     -
>     -Forward-ported to Xen 4.12.0
>     -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com =
<mailto:christopher.clark6@baesystems.com>>
>     -
>     -Modified to support pygrub installation with python 3
>     -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com =
<mailto:christopher.clark6@baesystems.com>>
>     -
>     -Forward-ported to Xen 4.14.0
>     -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com =
<mailto:christopher.clark6@baesystems.com>>
>     -
>     -Forward-ported to Xen 4.15.0
>     -Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com <mailto:be=
rtrand.marquis@arm.com>>
>     -
>     ----
>     - tools/pygrub/Makefile | 7 +++++--
>     - tools/python/Makefile | 2 +-
>     - 2 files changed, 6 insertions(+), 3 deletions(-)
>     -
>     -diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
>     -index 37b2146214..ffb9270065 100644
>     ---- a/tools/pygrub/Makefile
>     -+++ b/tools/pygrub/Makefile
>     -@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
>     - all: build
>     - .PHONY: build
>     - build:
>     --=C2=A0 =C2=A0 =C2=A0 CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=
=3D"$(CC)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py build
>     -+=C2=A0 =C2=A0 =C2=A0 CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=
=3D"$(CC)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_B=
UILD_ARGS)
>     -
>     - .PHONY: install
>     - install: all
>     -@@ -18,7 +18,10 @@ install: all
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSH=
ARED=3D"$(CC)" \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D"$(=
PY_LDFLAGS)" $(PYTHON) setup.py install \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--record $(IN=
STALL_LOG) $(PYTHON_PREFIX_ARG) \
>     --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--root=3D"$(=
DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--root=3D"$(=
DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force \
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DISTUTILS_=
INSTALL_ARGS)
>     -+=C2=A0 =C2=A0 =C2=A0 rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
>     -+=C2=A0 =C2=A0 =C2=A0 $(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$=
(LIBEXEC_BIN)/pygrub
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN=
) -a \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 "`readlink -f $(LIBEXEC_BIN)`" ]; then \
>     -diff --git a/tools/python/Makefile b/tools/python/Makefile
>     -index cc76423647..5cb11ae453 100644
>     ---- a/tools/python/Makefile
>     -+++ b/tools/python/Makefile
>     -@@ -12,7 +12,7 @@ setup.py =3D CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" =
LDSHARED=3D"$(CC)" LDFLAGS=3D"$(PY_LDFLA
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHLIB_libxenctrl=3D"$(SHLI=
B_libxenctrl)" \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHLIB_libxenguest=3D"$(SHL=
IB_libxenguest)" \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHLIB_libxenstore=3D"$(SHL=
IB_libxenstore)" \
>     --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON) setup.py
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON) setup.py $(DISTU=
TILS_BUILD_ARGS)
>     -
>     - .PHONY: build
>     - build:
>     ---
>     -2.17.1
>     -
>     diff --git a/recipes-extended/xen/files/0001-tools-xenstore-xenstored=
_control.c-correctly-print-t.patch b/recipes-extended/xen/files/0001-tools-=
xenstore-xenstored_control.c-correctly-print-t.patch
>     deleted file mode 100644
>     index bf99f5e8c54c..000000000000
>     --- a/recipes-extended/xen/files/0001-tools-xenstore-xenstored_contro=
l.c-correctly-print-t.patch
>     +++ /dev/null
>     @@ -1,34 +0,0 @@
>     -From c7c43c4531fe1cd188f62d9905c3f5c7a29a6fb0 Mon Sep 17 00:00:00 20=
01
>     -From: Alexander Kanavin <alex@linutronix.de <mailto:alex@linutronix.=
de>>
>     -Date: Wed, 12 Apr 2023 10:30:18 +0200
>     -Subject: [PATCH] tools/xenstore/xenstored_control.c: correctly print=
 time_t
>     -
>     -On 32 bit systems with 64 bit time_t (hello, Y2038 problem),
>     -the following error occurs otherwise:
>     -
>     -| xenstored_control.c: In function 'lu_reject_reason':
>     -| xenstored_control.c:646:70: error: format '%ld' expects argument o=
f type 'long int', but argument 5 has type 'time_t' {aka 'long long int'} [=
-Werror=3Dformat=3D]
>     -
>     -Upstream-Status: Submitted [by email to xen-devel@lists.xenproject.o=
rg <mailto:xen-devel@lists.xenproject.org> and maintainers as suggested by =
add_maintainers.pl <http://add_maintainers.pl> script]
>     -Signed-off-by: Alexander Kanavin <alex@linutronix.de <mailto:alex@li=
nutronix.de>>
>     ----
>     - tools/xenstore/xenstored_control.c | 4 ++--
>     - 1 file changed, 2 insertions(+), 2 deletions(-)
>     -
>     -diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xen=
stored_control.c
>     -index d1aaa00bf4..8d318c0399 100644
>     ---- a/tools/xenstore/xenstored_control.c
>     -+++ b/tools/xenstore/xenstored_control.c
>     -@@ -643,10 +643,10 @@ static const char *lu_reject_reason(const void=
 *ctx)
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(conn, &connections, l=
ist) {
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (conn->ta_=
start_time &&
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(now - conn->ta_start_time >=3D lu_status->timeout)) {
>     --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D talloc_asprintf(ctx, "%s\nDomain %u: %ld s",
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D talloc_asprintf(ctx, "%s\nDomain %u: %jd s",
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret ? : "Domains with long running transactions:",
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0conn->id,
>     --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 now - conn->ta_start_time);
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (intmax_t)now - conn->ta_start_time);
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     -
>     diff --git a/recipes-extended/xen/xen-tools_git.bb <http://xen-tools_=
git.bb> b/recipes-extended/xen/xen-tools_git.bb <http://xen-tools_git.bb>
>     index 8397178e8d4b..b443b13eeab3 100644
>     --- a/recipes-extended/xen/xen-tools_git.bb <http://xen-tools_git.bb>
>     +++ b/recipes-extended/xen/xen-tools_git.bb <http://xen-tools_git.bb>
>     @@ -1,7 +1,7 @@
>     =C2=A0# master status on 2023-05-26
>     =C2=A0SRCREV ?=3D "03cf7ca23e0e876075954c558485b267b7d02406"
>=20
>     -XEN_REL ?=3D "4.18"
>     +XEN_REL ?=3D "4.19"
>     =C2=A0XEN_BRANCH ?=3D "master"
>=20
>     =C2=A0SRC_URI =3D " \
>     --=20
>     2.25.1
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20

