Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3E4C63697
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web08.9264.1649923323530498963
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 01:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=BTyoiZ+W;
 spf=pass (domain: arm.com, ip: 40.107.22.74,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ighcYwpZOExyU2XrA0TMQizN4S1XWEyKqulv7Kl7XyI=;
 b=BTyoiZ+WMc3/z1KLjYr5WvBRfQA/2Y9/ossW7SZlKvLfLhQt572z8xlY5XxHVun72SJ0TurHkbwzdhk3wNS+LjbTJ6pHjfMpIJLGpydE7L0KWHaETVzJs07ukvRwdiM060JGf3xPHqqpViyymHG+VFxvmkmaHJJmtI+mc6R1G9s=
Received: from DB6PR0802CA0027.eurprd08.prod.outlook.com (2603:10a6:4:a3::13)
 by DB6PR0802MB2341.eurprd08.prod.outlook.com (2603:10a6:4:89::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 08:02:00 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::57) by DB6PR0802CA0027.outlook.office365.com
 (2603:10a6:4:a3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16 via Frontend
 Transport; Thu, 14 Apr 2022 08:02:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Thu, 14 Apr 2022 08:01:59 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Thu, 14 Apr 2022 08:01:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8617aef4ad81046f
X-CR-MTA-TID: 64aa7808
Received: from 2252c5f7f5ab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6F4468D-AA35-4259-8469-9703D1F9FB00.1;
	Thu, 14 Apr 2022 08:01:49 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 2252c5f7f5ab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Apr 2022 08:01:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ft4A90a9WoIIZsF1XvR5+k/+aIfeZf4EaEotWPdPQ5+2Zj7WFnKk/cy7dvvGmXrvc0i8aTkuLC8BF6AODyo+HzZx93ket3iIVbWk/N84xT4NSTdmnsOpk+gRyFqVCCqawTCdxDpoLFCMJwP6mhyQTmfzFW47PIzh/qNIOpx2jTx5jrk7zLu4VZ/+flue6TW4leeXaEilCIw3iRXX8GqH1khS+EKEXoMeBiQgJkJcz/NJ6nZqIxV04jNR/0YMHHVEvMwSQ3GMMNAl1Foaw5ofRoIToVIZAeMLywHIJbQIS0Z1NLHsvyoBgWG3EvXSU/HzxLf1Olo8ZvKl3gGvaLbG0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ighcYwpZOExyU2XrA0TMQizN4S1XWEyKqulv7Kl7XyI=;
 b=K4TK1DSdoYSKzJrK6CFo9ywiMyVF7UbXkTwW1EcAXzLCOS2O5EVZDL++gRb+qWYO9dqnm7+3lDj75oFmZ0IhvUXHZgGXIeFo7uSMTu34gnNWeXZvO4M217EmxEJJctqNJLyKZgkmi8RNEulQex/4DVRhjTYQLLc8u83ZHfvGKStGq1w8lrNdqMZBVShqOSGoe+xsxa9JwtjVnrM14m2kQ0x3cqtYbkxIxEspVTvpn38LSeRIDTJzuytKCtwAZNq8G0pTJiEjaWJro5Swl17pUT2M/1d9dpczehTrvewXWqe/XyLlqayGLY55vkr7aDJjay7J0uc/M+z0RJa0yZiw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ighcYwpZOExyU2XrA0TMQizN4S1XWEyKqulv7Kl7XyI=;
 b=BTyoiZ+WMc3/z1KLjYr5WvBRfQA/2Y9/ossW7SZlKvLfLhQt572z8xlY5XxHVun72SJ0TurHkbwzdhk3wNS+LjbTJ6pHjfMpIJLGpydE7L0KWHaETVzJs07ukvRwdiM060JGf3xPHqqpViyymHG+VFxvmkmaHJJmtI+mc6R1G9s=
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by HE1PR08MB2905.eurprd08.prod.outlook.com (2603:10a6:7:31::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 08:01:45 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::e05d:b3fc:609a:df20]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::e05d:b3fc:609a:df20%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 08:01:45 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Michal Orzel <Michal.Orzel@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Christopher Clark
	<christopher.w.clark@gmail.com>, Doug Goldstein <cardoe@gentoo.org>, nd
	<nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] xen: Update recipes for xen and
 xen-tools
Thread-Topic: [meta-virtualization] [PATCH 0/3] xen: Update recipes for xen
 and xen-tools
Thread-Index: AQHYSyT3PeROfVQ/8EmQnVCX2MDFSKzuxO4AgABQiwA=
Date: Thu, 14 Apr 2022 08:01:45 +0000
Message-ID: <A524ADAA-241A-4206-AA65-6B2778D5FE01@arm.com>
References: <20220408084420.102085-1-michal.orzel@arm.com>
 <CADkTA4MxDwunJex7NnjFpLs2k0sUo354XUysH0PeYww+gYxA_A@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MxDwunJex7NnjFpLs2k0sUo354XUysH0PeYww+gYxA_A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 533edadd-6c4a-4fb6-ee86-08da1ded0d99
x-ms-traffictypediagnostic: 
	HE1PR08MB2905:EE_|DB5EUR03FT039:EE_|DB6PR0802MB2341:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2341991C615DB6128EF22EED9DEF9@DB6PR0802MB2341.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wEvLgr4Y3Cel52vNwxCorW5X5vP8IVTHar2C+lhrfwK2EOSt2A+MNiEIUdLAGfwZzT2IAeEYM1COS3P299qvMXNSQer8onmSvngksokF5ghKuEE4o952Wlr2qya+BiXdJmL6zHhfP9ScsZq4B6ivRpYKOFqfdZOSQkvGlhg8H3oyHbmQbhweREPQ42ReWh8rMimSAVSXhSnpQJu6Zc8uH4RydAAYSF5Jl79yorjutEW+6FhkXnZi5CqGicTO61vbJWW5RZgS4/9PEz79qAbi563KOwmf+uYZVW/eWr40DrAlx7tf1wg8LjXt1c/oMBndtJmlpZ0L3uvPqakUV2eHJfY39Ua1eU3mETdDvV5HrtyYZxtnSq5qVTcG9zevGXzWJRXRt7cDHslY4NauNhSz1i0CR7/lLLlAlDY0XNTD0Zhc5Pwb/OQB7vDvF7BDB46FKJiFF0UAvCeFdcYy8Pd1BNdevS6FbhG+JovmTAQoI0ylc2HTYnWi+lcW6z4pzfnBAUgO/1ZxKYgp3iEO7q39YkGRPhHRhonwLJkmMsrVbUCgbdljV1kWWC11P+zhbEHGesLXEATf+KF09Hki/YWFiN8EhLvR8GEUgtMYjucFaYmI5vrlrGpMTg3VyBH2xZmDz36bMuqDGiVy8bFxY9Sib9xMSUgPHubm0YIuY6qvwc9WP7YjVv1lWaR+NvDdylSgHBNLs+xfrb/Mr/8JWiYoakne1+8IZapRVr6zijropQYcxS005BhqRIHyMqMQNfDOxx0l52TyT/+JcMamZUWrzA7puX6ZAZfwAvybmPaaMlaH4Aoc0VCrqaGF3FwOoHMb
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(38070700005)(4326008)(8936002)(83380400001)(6512007)(122000001)(966005)(6486002)(53546011)(64756008)(66446008)(66556008)(76116006)(8676002)(5660300002)(91956017)(36756003)(66946007)(66476007)(186003)(26005)(15650500001)(54906003)(316002)(508600001)(6916009)(6506007)(33656002)(2906002)(38100700002)(71200400001)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46ED89FFFF65EC458BA2E964F95E2BBC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2905
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b6746ce9-7fc1-4837-9511-08da1ded04ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PS0cyhcVmwp1NIDBQKPJ/f22cgkKN20l3xuQ4antJKeK8c2JEp4liYEtx5lYxxHCm5YPMWJ0GDmlEsXljztmgMyLSPgemP+lLCGlw0xwhYSniVnU63pvPbLXx6xDOFtM+0MKtj7p89p42jMhNhJ/Ficcbfp3/PF+l3vtWmaueTO0+IFfDZsedmLxkMkpHgCkt+26U6dH1wDfknsJ3XzaZks1oG1Mb6TPzdjQbXaYCJ3kmdIbStkMlAA1pRE+jXgFitWKGCaVDUL2RQOKxKOE5v9Rb0ZjEvz/cqSnPUVR/LjqgWfGcAjRL1B+SSegaRHWuiuh18ui49abv6C0x8EzcqafV2L4MZhoftlvHgcOHy7jO5eNo5xHqC9C4veaFArpSKU3+sJ+9Hdy6fE/2LtNQYoMR7VUUXfNomklRoVBltWLv30B++tt3rhO/ctO6m7etudv0qnLQFxJt8o4ZYzQOhyBle2azcOeZvJ+u1NP5tWi9H4zUVArFrUkH9S0qU8jMFvjQII9X96XLOAzIctjdl8RCmVbf+DuLTpGCcb8316l9Y7WVVsvUGwjnCbGM5MWOZZX/SYJ1WpQ7yN4Rl2P+DCloY9tZtzGEh6veM2TUrHpe3JLO5QN6u8jYAeA0Gztr50NeuMKVMKR6bCJwBJSM4WOhTRNrcHil9AdWyvfH9rWM6o6oWBXeB6IGyyz52MqrQZfgKskmgUokm7ag7YUBmNSeJ+FJd7rsOhI3bOWV3jwYqVUZzc3zxQs9Q99LnOS1Lmz+GbscsqshOLaL/igYw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(47076005)(186003)(36860700001)(4326008)(82310400005)(8676002)(6862004)(26005)(8936002)(36756003)(70206006)(70586007)(336012)(83380400001)(6512007)(15650500001)(508600001)(5660300002)(53546011)(81166007)(6506007)(2616005)(54906003)(33656002)(2906002)(316002)(86362001)(40460700003)(6486002)(966005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 08:01:59.8993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 533edadd-6c4a-4fb6-ee86-08da1ded0d99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2341
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7172

Hi Bruce,

> On 14 Apr 2022, at 04:13, Bruce Ashfield <bruce.ashfield@gmail.com> wrote=
:
>=20
> On Fri, Apr 8, 2022 at 4:44 AM Michal Orzel <michal.orzel@arm.com> wrote:
>>=20
>> Before the next Yocto release, Xen recipes need to be updated.
>> This patch series:
>> - updates 4.15 recipes
>> - introduces 4.16 recipes
>> - removes 4.14 recipes
>=20
> FYI: I'm not ignoring these, and I will make sure they get into the
> upcoming release branch and are in place for the LTS release. I'm just
> waiting until Christopher gets a chance to review and see if these
> match up with what he was thinking about for versions.

Thanks.

For LTS, I think we said the strategy should be a bit different:
- keep the original versions and update them.
- keep the same default version
- add/update other recipe upon request

I do not think we need to push this change to LTS branch, there it might ma=
ke more sense to update the present versions.
I can check that in the next weeks.

Cheers
Bertrand

>=20
> Bruce
>=20
>>=20
>> Michal Orzel (3):
>>  xen: Bump SRCREV of 4.15 recipes to 4.15.2
>>  xen: Add recipes for stable Xen 4.16 release and update master
>>  xen: Remove 4.14 recipes and related patches
>>=20
>> .../include/meta-virt-default-versions.inc    |   4 +-
>> ...-stand-alone-set-of-headers-Xen-4.14.patch | 178 ------------------
>> ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch |  66 -------
>> ...d-firmware-as-ffreestanding-Xen-4.14.patch |  83 --------
>> recipes-extended/xen/xen-tools_4.14.bb        |  21 ---
>> recipes-extended/xen/xen-tools_4.15.bb        |   4 +-
>> recipes-extended/xen/xen-tools_4.16.bb        |  19 ++
>> recipes-extended/xen/xen-tools_git.bb         |   6 +-
>> recipes-extended/xen/xen_4.15.bb              |   4 +-
>> .../xen/{xen_4.14.bb =3D> xen_4.16.bb}          |   6 +-
>> recipes-extended/xen/xen_git.bb               |   6 +-
>> 11 files changed, 34 insertions(+), 363 deletions(-)
>> delete mode 100644 recipes-extended/xen/files/0001-firmware-provide-a-st=
and-alone-set-of-headers-Xen-4.14.patch
>> delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DI=
STUTILS-xen-4.14.patch
>> delete mode 100644 recipes-extended/xen/files/0001-tools-firmware-Build-=
firmware-as-ffreestanding-Xen-4.14.patch
>> delete mode 100644 recipes-extended/xen/xen-tools_4.14.bb
>> create mode 100644 recipes-extended/xen/xen-tools_4.16.bb
>> rename recipes-extended/xen/{xen_4.14.bb =3D> xen_4.16.bb} (79%)
>>=20
>> --
>> 2.25.1
>>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7130): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/7130
>> Mute This Topic: https://lists.yoctoproject.org/mt/90331599/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II


