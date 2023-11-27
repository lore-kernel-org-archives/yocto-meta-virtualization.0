Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5958AC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 14:08:39 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.88])
 by mx.groups.io with SMTP id smtpd.web10.95494.1701094109219033820
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 06:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=y9JQd+0Y;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.88, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpVe213WNrNN2QpNTylpHXZl2SbqIOfD1r5KQysAZNLFAKvmaWT1RiBOVAi2PBPNscaoQ2F5o9W8LNeXsFXnFBFT2RMuzr2YKOq7Nio+bkFDqb+OjokqsotzuLp54Sf8YQ7w5I/WvjwKlOBQYVv9HS/6U9RBd+zbAthP0/XkjxecYYAhxDS0gaPOfVHkvAqlRjrpCB+jG9G3ooYmt3Xpu/DlVeJbwUIpdHCXzz4iN8A5dmoJXbf/hXU5G+C+5TyIaDzrIkB3LhhJSMfW9ICBdLYbRNWz1NxY/fKMQXTzwPyA2MxCSROvPdVh6qm5rmrrOhwBTl83aYFl1I4twNwiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5ZBbKSfzqZqoihMdfyIQg5r5pWSm0nLFVC3MpGtIMo=;
 b=f++iqkSFGOleNi8c3adbOd5tZuxxBWRnBkvU3iNhB9IQrMEfzLPIkz58USGVqScnjFSVmOl8W1ePcwPufBRK7OVLXroN0wyYVVjLPXnStYNxs2Kp0rGHLhV2i3ld4wc9Dxhsnu2SCgpX2vck0ExW8hVWr/LKYXIK4GiWE0ZxD/2ZkGy1HR5L10Otq8XwwmZQf1ibQSMllnCNvLi9G0rfnqPo2nl2nNBP4Gj1EiUo9cPxQzP9JLjdg01WW/MeiFO70XJmtBvxYe0ZQ/fmbfqdSu6HGWAiXPhiNYL0wMDfWZF8yGwXm6t5ILIdcspGJVLdthwstH3Wco1DK6Dw9POzAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5ZBbKSfzqZqoihMdfyIQg5r5pWSm0nLFVC3MpGtIMo=;
 b=y9JQd+0Yo0MYRe6EvliET/G85Ok84BKtdcsl/oPUHOn5D7hlD7r8nf/M/31yTjR9mgHHqHCRVmJFaxO/8PYoq+5ZG1RuV80CZ84E8VB3+8OQUdgx78WpGy7Ri6vwMcByU2D9IRZGS1cnbfNBDrnwndX4PVnhweMscfWq9DvMyWI=
Received: from MN2PR19CA0033.namprd19.prod.outlook.com (2603:10b6:208:178::46)
 by DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Mon, 27 Nov
 2023 14:08:25 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:178:cafe::73) by MN2PR19CA0033.outlook.office365.com
 (2603:10b6:208:178::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Mon, 27 Nov 2023 14:08:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 14:08:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 27 Nov
 2023 08:08:25 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 27 Nov 2023 08:08:24 -0600
Message-ID: <7f42849e-6ea3-4530-9a73-f1bc1bcc61be@amd.com>
Date: Mon, 27 Nov 2023 15:08:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH 0/2] xen: follow-up to recent recipes
 update
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>,
	<christopher.w.clark@gmail.com>
References: <20231127103811.319149-1-michal.orzel@amd.com>
 <CADkTA4P7xjs7Db+_j6NTde3j0gyKS0R5kGYm9O5pPp+Vu54mMA@mail.gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CADkTA4P7xjs7Db+_j6NTde3j0gyKS0R5kGYm9O5pPp+Vu54mMA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|DM6PR12MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: b6208d6c-4418-4b7e-9fd5-08dbef5252c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LPaJOD1Vj17F3hGX8a61/M9Dmx/89X1jbqEsy0V4Qls0YvDMT2PKfZ4acff96Dj8d7ARen3rknjhDiyuCF27cVC7R/zFdrH7FnbRICBwsSOmbFYI3eRIcwZeFLtg1Vknn6Mzyia2q+OLdXeNOS3+eh5m7PCW2O1QYNwlTxFyOEgedhL8IwD3n0d6Ef31TNFcXLVHyMRntykY7DpwZ9BgvsEW58uVFmzVShB//CXQJHvMskkE4cYZtlvDgbTTlk0QcS7P5BLaiMrBIp74gW0Qcw24GJiPHv+NiVmf3xQFiNyY2nWr0uiiY1LHB5eJ4xWUUpysw5W5keOaTGewr/f5abXMJDhXhJz3KddIr+GcBj6w7RzI8wdBg0RvDsWuHal8Hzpt9dKMd7/vy4EIr/LBwoBU1WvNZWL7KFyRswZXUfAEhr8CfUuM4P7CP855qjL9TKsZ1erbDqSvH8zwQz2nrKWtrwtrW7E7gH8ix/XQSIH1Lio72Qin8OtFgS3OeOGdt4JarDvGcVNyyOxYLZpeEyxKnfa3lESzhr4B9BPQP2ocbTjsX7w4S9LNaNZ4uNivmcq9Mpd4l0s5FPfbL+F2ULAh8b4KWoLxVIt2McXK091nKnipi/kpmHblwhqXkFKLv/K8AvP/YfL6mlPMAA0p7OvxgaJCNXpkPXbgTSr9k+d4AIQuy0Na0RFfF4nZGjI3x26DUKwX4zwZZ1JSWtoZZBumSGDy/IbdtbEvVW1bsD50/cEpqJ8+8iyslJtMg2KT8zDnoaUJMRrXFzwXq3v2lrOqFWhTZf9j6fVcxfXnexs=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(186009)(64100799003)(451199024)(82310400011)(1800799012)(40470700004)(36840700001)(46966006)(31696002)(86362001)(82740400003)(356005)(81166007)(36756003)(40460700003)(478600001)(966005)(16576012)(6916009)(316002)(54906003)(70586007)(70206006)(26005)(426003)(336012)(2616005)(53546011)(5660300002)(44832011)(2906002)(15650500001)(4326008)(41300700001)(8936002)(8676002)(31686004)(36860700001)(40480700001)(83380400001)(47076005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 14:08:25.7850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6208d6c-4418-4b7e-9fd5-08dbef5252c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 14:08:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8469

Hi Bruce,

On 27/11/2023 14:55, Bruce Ashfield wrote:
>=20
>=20
> On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Michal Orzel <michal.orzel@amd.co=
m> wrote:
>>
>> Some follow-up patches after a recent Xen recipes update.
>>
>> Open question:
>> Shouldn't we set 4.18 as a default version?
>=20
> Not yet (and definitely not for nanbield). Perhaps once it has been under
> test for a few weeks. I did the updates to get them some extra soak time
> and make them available in both the upcoming release (nanbield) and
> master for those that want to use the latest, without making it a default
> version jump so late in the cycle.
Ok.

>=20
> As for the changes in master, the 4.18 version on the _git recipes is
> intentional, as there's been no 4.19 tag that I can find and I don't bump
> versions until I see that in the repo .. so for now, it is just the +git
> and +stable that is the difference between the 4.18 and _git versions.
You won't see any 4.19 tag until the next release. The version is advertise=
d in
the main Makefile [1] and this is what user can see in the system
(e.g. in the boot log, xl info, xen_version hypercall).
Bumping the XEN_REL of master recipes to reflect the current development ve=
rsion
is what I've been doing for the last 2 cycles [2], [3]:

[1] https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/Makefile#l=
8
[2] https://git.yoctoproject.org/meta-virtualization/commit/?id=3D3581dd56a=
a97ae17b480692aeb733ca0d1fa0eec
[3] https://git.yoctoproject.org/meta-virtualization/commit/?id=3D265518e68=
99726a47bb150f248a18d56dfbbffdf
>=20
> I've grabbed the 4.17 version bump from the series.
+ master tools recipe SHA update

~Michal


