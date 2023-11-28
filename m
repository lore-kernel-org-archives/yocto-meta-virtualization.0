Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9B0C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:42:14 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.41])
 by mx.groups.io with SMTP id smtpd.web11.28559.1701160931284724734
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Nov 2023 00:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=DsZ5AMPU;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.41, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VILamiMrarPipf/iR37VHDWE6FK4odPLZ5f30bzZyAU8cSGXFUBd3vbGQocxH9La4+8rWFCptn4SjHIPMHaPZMVh6XnOXfBCOg2wMJUlqYL9iN6J+BXGudsKV6+AZh8YzwmcP7jI2lYC9hsjT9rNvyoC8ZdeabVbpWgDcfW3hjauQz8PEGIgd71sJg8sbUVFmm2C8kfebZA2NT1B53jlRXT4MbVl+oQc5k4YDqb795LqCG3fEFTQk9nRCCbyeTFUZxdZnc1y0RsOo/XEmYiivxPwK/hFjDdsqDBfZhxksf+Uc76k1TMb3xAEq7O3hPluUkznu11jvBnK5Kq8IOBf2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4L/ESBRcTzNFyss8YzyUFi8voLRBfp3zUezM+iNsH4=;
 b=YSB6DuGq7JOipYNsRLPjsgGnHHh5Awq85JeZs22iIn1hbR/r9C9//eSLiZ4v3oXO/5UARkQY+hIEgQQWX+/bJbt0hrPGSFheC0IVcw93uiM72v3rkr0LsvOEVoXw8KJvAHM7KCVB9WFkk6OY3ZWzHZdb/JVBg5fSXveTVYAJJ4SaaYnqAdoeNHjnqhOjMCSe1Twyb+lOh7FvbkUw/vHZuubLDTL/ijLWArrAyw6IzQsy4btM9pGiXc/O1qlXB9Z9YKvVhp/Zrsq9r7tQ86LZ+lQg3CtZOvw6p5fxNhcZ02aRQEM/v/dff9TftQm8MzvNnp6JVsBM6dxEWCvhQotaew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4L/ESBRcTzNFyss8YzyUFi8voLRBfp3zUezM+iNsH4=;
 b=DsZ5AMPUCCrCWoGQ0bCyKyE+z9nkwfH0RBtS7oi//K1qW999CIxtUG6hLR4praISOxSy8l52wYmFMaLEHk//2H5pDc2okp7oZRUEJmsD7XuXY1D2p+pMOEu8Cfpmdrt7EFbqU7yHuhTM9qwlV9WOp05J5Hkb4waZ+JiAAmVvjXM=
Received: from DS0PR17CA0001.namprd17.prod.outlook.com (2603:10b6:8:191::19)
 by SA1PR12MB7247.namprd12.prod.outlook.com (2603:10b6:806:2bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.25; Tue, 28 Nov
 2023 08:42:08 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:8:191:cafe::c3) by DS0PR17CA0001.outlook.office365.com
 (2603:10b6:8:191::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Tue, 28 Nov 2023 08:42:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 08:42:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 02:41:54 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 02:41:53 -0600
Message-ID: <e4512578-4783-4ea2-943e-4187bda3184b@amd.com>
Date: Tue, 28 Nov 2023 09:41:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH 0/2] xen: follow-up to recent recipes
 update
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	<meta-virtualization@lists.yoctoproject.org>
References: <20231127103811.319149-1-michal.orzel@amd.com>
 <CADkTA4P7xjs7Db+_j6NTde3j0gyKS0R5kGYm9O5pPp+Vu54mMA@mail.gmail.com>
 <7f42849e-6ea3-4530-9a73-f1bc1bcc61be@amd.com>
 <CACMJ4GYJdMYGgQSoTUzD7MLu+U11Xd4H2ccYjpJDg_y64W4HbQ@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CACMJ4GYJdMYGgQSoTUzD7MLu+U11Xd4H2ccYjpJDg_y64W4HbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SA1PR12MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b2c774-1219-48ad-4d31-08dbefede819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7nSKF2Y+lk+4uPg4ItbjOX4XMbdqwwR9vbym1VWSI53p2m7a6qK47jv0Syw+xkNNktQktKob8j2me1fNCMmIqjV5LT2XgaJKrITSIxTtnB3d7nX9jrnxAVcf3ibS+hBXqEfsGA4hTfDLMuDwOP3lpEm4BRzyHmb3OTZb66AKyhdQ69qgbqQyPf0ODkSCgjWGz2T1dre+rZVo2yxbWXe3fN93GyE8RjG4iYWrO0irim3rxHhDue16XwEkbSFQ249ply8v11SsrpAsf0mvUunPWEvSiZCh6eRW4tZ9mvqpdDC0BNeNSjKViL73b2ot/hYg+JGVGdSUvk6Xr20rVYKnzQfPSArEw++fA5qIo8NbBQhpXBT+18/14XMfsBEkbGjZ+FsUrfYguxD5HJdtLiTQ9lECMkRQA3NySbRjcrmMf75DvH7JEj2AXHfWBH3anJwM+qxidH3FtaGKuieEDE1dywkgC6366wKuDefPjMKhOFjJTrmH5ClQ+nfAHAD3AcEdSQEPwAvPX5eVSHynAcD5WgUs0UlO3DiUwYcPZIelU0BVOxyzoJ3zyHT58tJOEpOBWQCOyHuRxvqorGLBXjlT1XikNtncmX583Y5eCwASq3/7+LBpBbB0540l9EDN/MLAGnVuO0MWAu3NsCrLXMcnfKc7KxNQ6TpTrvEfWZlnwHsJf20+ifnWAtYdWAa+TIylZIEn0dI+a5Ur7bcTRGCsQLOWAUH4eERDX9N6ZUQ7ZgGVUkc73zaNgpEj/RFAIDIreFD+EiLQueUYqlW5U9pv4GjT4d6bHKb7iW7l+bsobrZ2yDCZp+nH+18KFo9ksgCP
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(54906003)(36860700001)(15650500001)(5660300002)(40460700003)(478600001)(2906002)(8936002)(8676002)(44832011)(86362001)(31696002)(70586007)(4326008)(70206006)(6916009)(40480700001)(2616005)(16576012)(336012)(82740400003)(426003)(83380400001)(316002)(41300700001)(26005)(53546011)(356005)(81166007)(36756003)(31686004)(47076005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 08:42:08.2692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b2c774-1219-48ad-4d31-08dbefede819
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7247
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 08:42:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8476

Hello,

On 28/11/2023 04:11, Christopher Clark wrote:
> =09
>=20
>=20
>=20
>=20
> On Mon, Nov 27, 2023 at 6:08=E2=80=AFAM Michal Orzel <michal.orzel@amd.co=
m <mailto:michal.orzel@amd.com>> wrote:
>=20
>     Hi Bruce,
>=20
>     On 27/11/2023 14:55, Bruce Ashfield wrote:
>     >
>     >
>     > On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Michal Orzel <michal.orzel@=
amd.com <mailto:michal.orzel@amd.com>> wrote:
>     >>
>     >> Some follow-up patches after a recent Xen recipes update.
>     >>
>     >> Open question:
>     >> Shouldn't we set 4.18 as a default version?
>     >
>     > Not yet (and definitely not for nanbield). Perhaps once it has been=
 under
>     > test for a few weeks. I did the updates to get them some extra soak=
 time
>     > and make them available in both the upcoming release (nanbield) and
>     > master for those that want to use the latest, without making it a d=
efault
>     > version jump so late in the cycle.
>     Ok.
>=20
>=20
> Thanks, Bruce.
> =C2=A0
>=20
>=20
>     >
>     > As for the changes in master, the 4.18 version on the _git recipes =
is
>     > intentional, as there's been no 4.19 tag that I can find and I don'=
t bump
>     > versions until I see that in the repo .. so for now, it is just the=
 +git
>     > and +stable that is the difference between the 4.18 and _git versio=
ns.
>     You won't see any 4.19 tag until the next release. The version is adv=
ertised in
>     the main Makefile [1] and this is what user can see in the system
>     (e.g. in the boot log, xl info, xen_version hypercall).
>     Bumping the XEN_REL of master recipes=20
>=20
>=20
> I think it could be helpful for the=C2=A0context of this thread to descri=
be them as the "git recipes" rather than using the term "master recipe", be=
cause the latter unfortunately seems to convey that they are somehow superi=
or to the other, versioned, Xen recipes, when in practice they are not -- t=
hey are deliberately not the default version of Xen that is built since, as=
 you note, they are defined:
> =C2=A0
>=20
>     to reflect the current development version
>=20
>=20
> of Xen. ie. The git recipes are present alongside the other recipes that =
provide the stable release version(s) of Xen.
>=20
> As Michal has noted above, putting 4.19 for XEN_REL into the git recipe d=
oes look right from a Xen source tree perspective for that SRCREV, even tho=
ugh there is not a 4.19 Xen release, but the proposed commit message should=
 be updated to avoid the term "master recipe".
Sounds good to me.

@Bruce, may I please ask you to take my patch modifying XEN_REL and do s/ma=
ster/git in title on commit?
If not, I will push a v2 of this patch.

~Michal

