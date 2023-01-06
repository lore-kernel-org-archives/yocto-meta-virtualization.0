Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D165C54E76
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 10:10:39 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.41])
 by mx.groups.io with SMTP id smtpd.web10.10736.1672999833750341942
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Jan 2023 02:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=rnJXJwb1;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.41, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3a2n294CfhzuFlzv0RjnY9h4eEwbnk7TyR1KSv6/fQHAF1SlhiqVnenONF6iMa+8Q9kfLkZv0JtQIOqp68VAjMZ9eCujui6oiciUT1vBE1u4LlodyTQPuTfWhI3xlMx7SFewk3hcfEoFiVsOLjHN+Xd4XkAtk1saYyE4OyUIP2MG0bc33cuSDlu4GNSRe8W5wxIylqK9YGM4jvDIsz1Vbib7nPOs6uAlRghmmL/0UdI6cp4F2fik2p8CDUa9ZhVh6yxt/tLsItIkkA+LjoFSEO4b9Py5q6kIp3HgKCXJXgSVF2wnI8buuP2LnRr6seVM6dLyPfTiDHqqPEw7xT7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFDCPaL4p9qxNh+hiyfEsHMcPiTnsxg9URD7f8GTAKc=;
 b=j995esem04MxPsaxPQtRtLlcevpOITX9BemrH72i5OKl5Yv9vICo1/epKwHIfVzNoEmjxdLkdbCIBbmRMQe+WuYGcgvm2MGJmP1xyvMDyByYhvipjT6+mApJiTYM/JyBNx3zgpj0dMXnCiaY4EP4s2mW7JNwx91RFP5qgpzRHF+HgrZG6PLDo3upcSe4yZygKIwGL4ZGlvSwQyvTynMVFvPKaZu0bWnhIFg5lzDZsLkCYz141LaPN+CipENnpuL47eteNYrYr//5AZ/1TLMW4pL+lUr7gRpEpIS2nJysPWYYQ3Gd0qQcJKqEJ3HPunRisW2P+v2NnH2N0filJ9OaSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFDCPaL4p9qxNh+hiyfEsHMcPiTnsxg9URD7f8GTAKc=;
 b=rnJXJwb1d7oVSTjFyj0FxEaSbQpiA49lGMcjS+JhVxhEEM3Ng2OkAWt+Q+Mm57M047LNg96b7osElcb9WBLezS7t19DPAVzcbDq+xAUBl1EXFtSIcCt0WMvYcv+6jyi1OUM1h8lNY+7+j/GkZmjCsdb03oyjNTkf7Ux/+hNB90Y=
Received: from DM6PR02CA0056.namprd02.prod.outlook.com (2603:10b6:5:177::33)
 by CH0PR12MB5154.namprd12.prod.outlook.com (2603:10b6:610:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 10:10:31 +0000
Received: from DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::26) by DM6PR02CA0056.outlook.office365.com
 (2603:10b6:5:177::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 10:10:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT078.mail.protection.outlook.com (10.13.173.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Fri, 6 Jan 2023 10:10:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 6 Jan
 2023 04:10:30 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 6 Jan 2023 04:10:28 -0600
Message-ID: <e3e6ce98-6f72-a416-f28a-ba9d9f1f6725@amd.com>
Date: Fri, 6 Jan 2023 11:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3 RESEND] xen: Add recipes for stable Xen 4.17 release
 and update master
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>, <bertrand.marquis@arm.com>,
	<stefano.stabellini@amd.com>, <stewart.hildebrand@amd.com>,
	<bruce.ashfield@gmail.com>
References: <20230105135405.10168-1-michal.orzel@amd.com>
 <20230105135405.10168-3-michal.orzel@amd.com>
 <CACMJ4GZWr8rnsd16QK0BT8yeCuUgfuU6F=e7vWegKRwFEkyJBA@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CACMJ4GZWr8rnsd16QK0BT8yeCuUgfuU6F=e7vWegKRwFEkyJBA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT078:EE_|CH0PR12MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9a6818-cc69-4575-c507-08daefce3e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YMXLr+R0Rv7SzPnZczHfiIa6ZJHpstVlPUDqirBXIS0T/9x9fMf6XwswNJFCK/0JHIQIL2leLIJQAC6+LOuHgeiXng6KZwy4FbXQtsAF8UE6Qt7aA6hnfRKVOtI+++lGDLAch68TSmwepcpvyEnqud0sLVV3b/tg5gbOgv6V+kPBJFGZnU312w67wRsAYNbLg298GSxxR8o2rB0HrKUvam6DswBYTcIp1CUUQpmn2S4uAs442515jXYBLp/xE9IZQCmPE0oWUXFJP3QGjbp62JwJCvjR6yNGMAAvbsZx60UzK7IUv/o8vD/6bIgR/ZnCRzrS+hVU8/3AzgJpMV2TlYtK7diTROahX2PfzM+VAbsSOjQ3Jp3LtURu5gwgotrKMBERpRpjuUDbc3i0TlrTVbI2OZVKvZGxmdK9DHuX+befmRYsnvxNgzzH3l/zitiuAC234Qqoqlz3AsNFDiwFNN2xrZCNBOVQv2P294Z+mxwe5e1kr1fWDmxOP2DmlHZwBLbv2knsJ35bkYbjMRNFoxXejONNprVaN/37oPWgSviMJJ6TSiQozr3psuI2Ur7QWTfL+7qFlUrJFBeTRx/kOZ2UNTBw0g3Xmq8/yJNOdhKRTF9HqPgB4v/IdjgpY8D+c277bQsshVpT5qj8SJu+Mz8axG8TLDKQbvtpwCJCE68efJEzhN/XJS2q+JYZtJdGAqLBfoJ/qogjhO/GqLvNNg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(336012)(4326008)(70586007)(2616005)(8676002)(81166007)(36756003)(40460700003)(41300700001)(426003)(47076005)(54906003)(70206006)(16576012)(316002)(6916009)(45080400002)(31696002)(86362001)(82310400005)(356005)(15650500001)(2906002)(5660300002)(36860700001)(82740400003)(40480700001)(83380400001)(8936002)(44832011)(53546011)(478600001)(26005)(6666004)(66899015)(186003)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 10:10:31.0332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9a6818-cc69-4575-c507-08daefce3e22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5154
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Jan 2023 10:10:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7795

Hi Chris,

On 06/01/2023 08:18, Christopher Clark wrote:
> =09
>=20
>=20
>=20
> On Thu, Jan 5, 2023 at 5:54 AM Michal Orzel <michal.orzel@amd.com <mailto=
:michal.orzel@amd.com>> wrote:
>=20
>     Add recipes for xen and tools for the newly released 4.17 version and
>     take the opportunity to update master recipes.
>=20
>=20
> Thanks for taking this on, Michal.
> =C2=A0
>=20
>=20
>     Reflect 4.17 tools changes in xen-tools.inc:
>     =C2=A0- add test-paging-mempool to test package,
>     =C2=A0- add a new package init-dom0less that contains init-dom0less s=
cript,
>=20
>=20
> This tool requires control domain privileges and it depends upon several =
Xen libraries including libxl, so would it be better to just include in the=
 standard xl package, alongside the existing xen-init-dom0?
Yes, this would look better to be present next to xen-init-dom0. I will add=
 this into ${PN}-xl.

>=20
> If it does belong in a new separate package, would it make sense for any =
of the existing packages to RRECOMMEND it, to ensure that it gets installed=
 where it is expected to be present?
> =C2=A0
>=20
>     =C2=A0- add localstatedir to dev package.
>=20
>=20
> (I've replied to your comment about localstatedir below.)
> =C2=A0
>=20
>=20
>     Signed-off-by: Michal Orzel <michal.orzel@amd.com <mailto:michal.orze=
l@amd.com>>
>     ---
>     Adding localstatedir to dev package is a little quirk just to keep th=
e old
>     behavior unchanged and silence Yocto installed-but-not-shipped error.
>     The reason being, 4.17 onwards removed /var/lib/xenstored as it is mo=
stly
>     unused. This leaves the build with empty /var and /var/lib. There are=
 other
>     possible ways to handle this problem. We could remove the complete lo=
calstatedir
>     while removing installed volatiles or add some checks for the version=
.
>     Suggestions are welcomed.
>=20
>=20
> In the same xen-tools.inc file, there is a reference to var-lib-xenstored=
 in the SYSTEMD_SERVICE declaration for the xencommons package, so: would i=
t make more sense to add localstatedir to xencommons, which is typically in=
stalled in the control domain, rather than the dev package, which is not? T=
hat should handle the case where there does happen to be a runtime dependen=
cy in the Xen tools on the presence of a /var/lib directory.
Sounds good to me. I will add this into ${PN}-xencommons where var-lib-xens=
tored.mount already is.

>=20
> =C2=A0
>=20
>     ---
>     =C2=A0recipes-extended/xen/xen-tools.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 8=
 ++++++++
>     =C2=A0recipes-extended/xen/xen-tools_4.17.bb <https://nam11.safelinks=
.protection.outlook.com/?url=3Dhttp%3A%2F%2Fxen-tools_4.17.bb%2F&data=3D05%=
7C01%7Cmichal.orzel%40amd.com%7Cbcb1629273014bb2320e08daefb64d1b%7C3dd8961f=
e4884e608e11a82d994e183d%7C0%7C0%7C638085863517570625%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300=
0%7C%7C%7C&sdata=3DM1xgeAw3kTynautLaKMyx07D0ZbwMK2MyODbBzqz1WQ%3D&reserved=
=3D0> | 19 +++++++++++++++++++
>     =C2=A0recipes-extended/xen/xen-tools_git.bb <https://nam11.safelinks.=
protection.outlook.com/?url=3Dhttp%3A%2F%2Fxen-tools_git.bb%2F&data=3D05%7C=
01%7Cmichal.orzel%40amd.com%7Cbcb1629273014bb2320e08daefb64d1b%7C3dd8961fe4=
884e608e11a82d994e183d%7C0%7C0%7C638085863517570625%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&sdata=3D6%2F80CN3U7TxiL1oda%2FwqNL6Whbg2ogQDEkCJaRoZL%2BE%3D&reser=
ved=3D0>=C2=A0 |=C2=A0 8 ++++----
>     =C2=A0recipes-extended/xen/xen_4.17.bb <https://nam11.safelinks.prote=
ction.outlook.com/?url=3Dhttp%3A%2F%2Fxen_4.17.bb%2F&data=3D05%7C01%7Cmicha=
l.orzel%40amd.com%7Cbcb1629273014bb2320e08daefb64d1b%7C3dd8961fe4884e608e11=
a82d994e183d%7C0%7C0%7C638085863517570625%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&s=
data=3Do5Fa47Bd89zLwAFQDj4ahsnt%2FXOYs9%2F%2BimHJHb7PC0s%3D&reserved=3D0>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++++++++++++++++++
>     =C2=A0recipes-extended/xen/xen_git.bb <https://nam11.safelinks.protec=
tion.outlook.com/?url=3Dhttp%3A%2F%2Fxen_git.bb%2F&data=3D05%7C01%7Cmichal.=
orzel%40amd.com%7Cbcb1629273014bb2320e08daefb64d1b%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C638085863517570625%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sda=
ta=3Dx0xaDPMAK6HZS2oGP2FRouM6hoA7NZrJMdtVinzhtbg%3D&reserved=3D0>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++----
>     =C2=A05 files changed, 54 insertions(+), 8 deletions(-)
>     =C2=A0create mode 100644 recipes-extended/xen/xen-tools_4.17.bb <http=
s://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fxen-tools_4.=
17.bb%2F&data=3D05%7C01%7Cmichal.orzel%40amd.com%7Cbcb1629273014bb2320e08da=
efb64d1b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638085863517570625%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DM1xgeAw3kTynautLaKMyx07D0ZbwMK2MyODbB=
zqz1WQ%3D&reserved=3D0>
>     =C2=A0create mode 100644 recipes-extended/xen/xen_4.17.bb <https://na=
m11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fxen_4.17.bb%2F&dat=
a=3D05%7C01%7Cmichal.orzel%40amd.com%7Cbcb1629273014bb2320e08daefb64d1b%7C3=
dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638085863517570625%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000%7C%7C%7C&sdata=3Do5Fa47Bd89zLwAFQDj4ahsnt%2FXOYs9%2F%2BimHJHb7PC0s=
%3D&reserved=3D0>
>=20
>     diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xe=
n/xen-tools.inc
>     index d47309a72b1c..1a422255014e 100644
>     --- a/recipes-extended/xen/xen-tools.inc
>     +++ b/recipes-extended/xen/xen-tools.inc
>     @@ -212,6 +212,7 @@ PACKAGES =3D " \
>     =C2=A0 =C2=A0 =C2=A0${PN}-test \
>     =C2=A0 =C2=A0 =C2=A0${PN}-xen-vmtrace \
>     =C2=A0 =C2=A0 =C2=A0${PN}-xen-mceinj \
>     +=C2=A0 =C2=A0 ${PN}-init-dom0less \
>     =C2=A0 =C2=A0 =C2=A0"
>=20
>     =C2=A0PROVIDES =3D+ " \
>     @@ -245,6 +246,7 @@ FILES:${PN}-dbg +=3D "\
>=20
>     =C2=A0FILES:${PN}-dev =3D "\
>     =C2=A0 =C2=A0 =C2=A0${includedir} \
>     +=C2=A0 =C2=A0 ${localstatedir} \
>     =C2=A0 =C2=A0 =C2=A0"
>=20
>     =C2=A0FILES:${PN}-doc =3D "\
>     @@ -688,6 +690,7 @@ FILES:${PN}-test +=3D "\
>     =C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/test-resource \
>     =C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/test-cpu-policy \
>     =C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/test-tsx \
>     +=C2=A0 =C2=A0 ${libdir}/xen/bin/test-paging-mempool \
>     =C2=A0 =C2=A0 =C2=A0"
>=20
>     =C2=A0# test-xenstore and test-resource currently only exist in 4.16
>     @@ -708,6 +711,11 @@ FILES:${PN}-xen-vmtrace +=3D"\
>     =C2=A0# xen-vmtrace is only built for x86 4.16, so allow empty packag=
e
>     =C2=A0ALLOW_EMPTY:${PN}-xen-vmtrace =3D "1"
>=20
>     +FILES:${PN}-init-dom0less +=3D "${libdir}/xen/bin/init-dom0less"
>=20
>=20
> All the existing FILES:${PN} definitions are sorted alphabetically, so wh=
en adding a new one, please could you insert it at the correct point -- whi=
ch would be after FILES:${PN}-hvmloader in this case.
There will be no need for that as there will be no new package for init-dom=
0less.

>=20
> thanks,
> Christopher
>=20

I will send a v2 today with the remarks handled.

~Michal


