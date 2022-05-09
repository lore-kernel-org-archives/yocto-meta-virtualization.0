Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09161C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 13:01:25 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.87])
 by mx.groups.io with SMTP id smtpd.web09.31586.1652101275588064114
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 06:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=hjPUxcLZ;
 spf=pass (domain: arm.com, ip: 40.107.7.87,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LZWIwEgf5W1l+iPWDgD6Ec06vID5nlmAlbnpU7kaDhLHRiSaj1I+cZgB3jrl8mFQascE6PpwtIx+yf3ag0dq2kqqA7fpL2Bclvk57AR0dSR3Xyh21/HfWxwSp5c0TYA6NW75XH6WmWiYVSzx33IJNt/0cUlRvRUKfMosegqPA0E1YYJa7jOuBmIzqxeUMZk7yqMjpfdOQUts6+ifIblUdEv6wuTWMSxNVlOvgTjq2Wv/90eY7XBjQImZ2DOkdeUcpgYi1MPi6plLFVHEC3yXUHWGH2SzJIK1zkC2e8YWiFX3uitduNc4ZRnUs1YlLgQBKF+fUr1nUILO/IwiBSIpCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNUGQ1Fs/TltYpf9cNQNtiMNC4o7DdiMFDVQP3sl2fc=;
 b=mAd52ImjkrwDhH5JqoJ8480ocU6Rx4aAeG1QEZrs81etx16mD+bPwY4XmaqJPKKSIQuyavF4BeANoZNY2C9WzrzwejrwgEwXorf57AUH6/Cpoh0dRXuBJNsPiBwoPjfZ3Q5RrUsg8zpSEwyz+Y8By9IlDhr0qst1TMHkKTFxrmFctDCfSiomLP68jcAFRPYYQVLs4Fq2/ab/b8n7wLDIWwDOZujhi9JG5leIlznLVASUQqqHHFUywQZkpbjUQoGmeVt0H7SWebxizdjjPbHu7EVhYbYH/xJ+dIddy8DknGEDclMoQAFU7NMR77YNpNbVTS0UheT3fiawOROs/rjuSQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNUGQ1Fs/TltYpf9cNQNtiMNC4o7DdiMFDVQP3sl2fc=;
 b=hjPUxcLZja4GGIdo5r+9YZnEpAMGeglCiBEwv7rz37i04wADx7exUcF9Qh/OP6C0QMHxwgMJrUPm6oQAqi1sAZYoTJUTV2YlUA2a9kk4jLuiBYmklbnqPk0sbf67HUMZhYNIpTyIp/BerYroF/oV5vYcVNwoG9Zfl5aQ/qnWB3M=
Received: from AS8PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:20b:310::12)
 by AM0PR08MB4196.eurprd08.prod.outlook.com (2603:10a6:208:129::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 13:01:11 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::41) by AS8PR04CA0007.outlook.office365.com
 (2603:10a6:20b:310::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Mon, 9 May 2022 13:01:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 13:01:10 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Mon, 09 May 2022 13:01:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f040dcd79025cef8
X-CR-MTA-TID: 64aa7808
Received: from 2eb1cc36242e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA670499-3261-4CC8-B026-5E0559765E6B.1;
	Mon, 09 May 2022 13:00:59 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 2eb1cc36242e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 May 2022 13:00:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dr40zocMh6EBwkyfOCb6rb3yljOpsR+J3T8QE7vffb9QHjHH2vnX847z1DhsWczba9tSu33C+tFf2O5S13sW4iG/U5Krz8ORBNyutE5Nuvus0MhE1ffUdWwgEPZb2n/7JHih/W7UZakkyV+6U0PoJe69IH2xi5CiBZTcf04o4hI6X+1MUdwcQ4cB9ygHEjmg73++qAM7u2M15UsuLubmxuWxZeiDo/Gri3MhNXkap7mxUEDQy/DzbAWks4bUhlPMdTsx6djCGc3Jz54PzgVcfbW5bd1H1rq/Juu7KPt9Wn+9muuohzWCeLVk0kxLgZCznERgcUE/P2lRhYZnyIr9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNUGQ1Fs/TltYpf9cNQNtiMNC4o7DdiMFDVQP3sl2fc=;
 b=fnZ+i1s6L8UIoDKHMAzcLD3x4VNtOwrtiQHRPiA8KBScFpFzAQDTXevRKnuJ4LrhaHUu+4RNm+vYM1PgknByEzWByeD4uLlEKdh5UNduoQQV2g6BPfufrBqe5fQlntG0oRH4zTlv6qSleTZCO9Efs6y/TtUEdS22dQBwGjA9LiHljZH17xWA1L/6NcXlTwEEbR5HGQoQEa613QItdu2uaZtepxrKC0H/n43ISGUkBeShXXd/vf6xr7VwZp/ED3UZiC7JiA6LoK0HlY1mzhfe2CEIg0KSKHLm4s2gPwZ1xBgpV607pFdZvfGW/+XHCwj4cbckYVbfcz5SiiQHvnGL1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNUGQ1Fs/TltYpf9cNQNtiMNC4o7DdiMFDVQP3sl2fc=;
 b=hjPUxcLZja4GGIdo5r+9YZnEpAMGeglCiBEwv7rz37i04wADx7exUcF9Qh/OP6C0QMHxwgMJrUPm6oQAqi1sAZYoTJUTV2YlUA2a9kk4jLuiBYmklbnqPk0sbf67HUMZhYNIpTyIp/BerYroF/oV5vYcVNwoG9Zfl5aQ/qnWB3M=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB3994.eurprd08.prod.outlook.com (2603:10a6:10:a6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Mon, 9 May
 2022 13:00:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 13:00:56 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Daniel Smith <dpsmith@apertussolutions.com>, Scott Davis
	<scott.davis@starlab.io>, Diego Sueiro <Diego.Sueiro@arm.com>, Jon Mason
	<jdmason@kudzu.us>
Subject: Re: [meta-virtualization][PATCH v2 0/3] Xen: improve Qemu integration
Thread-Topic: [meta-virtualization][PATCH v2 0/3] Xen: improve Qemu
 integration
Thread-Index: AQHYWpPTnFu3WGfk1EKQOEqfK1rWW60WkL+AgAADvIA=
Date: Mon, 9 May 2022 13:00:56 +0000
Message-ID: <6C681FA0-E19C-4499-95DD-A0FE0B7B4EF7@arm.com>
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <CADkTA4OBc-C3UXRrjHkWHNYpNi7ZxX8RpiODOdoQCXdf4a7AMg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OBc-C3UXRrjHkWHNYpNi7ZxX8RpiODOdoQCXdf4a7AMg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2f38ec4a-69df-4b2a-8ee0-08da31bbfd39
x-ms-traffictypediagnostic: 
	DB8PR08MB3994:EE_|VE1EUR03FT058:EE_|AM0PR08MB4196:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB419653495165246B19E822889DC69@AM0PR08MB4196.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AKOi0Q3jYLvLUau76MqJubA5y/tlbWUtr2sUs0II4B8oR+oUrs2Pl4Yj7RqJWVdV7SBgzTyGQh+auG+txPURUFjQY8NFMHWRv4LzOIQJyzBLKYYMhBZ9ctuq8nTPUgXBcQ/yifwMUCVjU0HO0ImGQQkQbXwcgLMU5z6YEUDPRl5gjexG3uH+TQmNDjJ0IXrdLE2udMvNA4sdDUGDBVReWcPUcQxtSVrxMo8zL5z7/cwVVnYCFQGKsdA+5K+kqD1pv02XmofbSZtLgZr97PP1IdpTwDLL3NTFnM89LxKhIDRe3+39EhFD28kTLQo/J9CymDuQ4sRw4ksuHdpGXM1pEIlLOj6NVSRRVYmiJKRojdo8pSlUYeNX80aSEOTmvKuv5k6agAkxHpikaYMUoN9AWDwohPCHQNvoYzEJp+CpqTbTMJJHYasFg5qmVx8+WCLLSCVIF9S5bVs3jQD6qjiI7sX5eFVR5qL5snuYHWNyRyRIKdeKMwJId4dp4mKivbL4SvLccLijyit4ROJFSDGf6FEC+NQQ396xwXXL/nlcO+HZfNaHGwIMt0gsWfoA70L1D83G2jVuugXzGf9SGuCFf8W/vddYDEcWuMVqhMZzhbqmJlVyE9q6PtqezmWsYmGYYp0CahN4nWGuw+DgdjRElCr3Lk9xhcrPaJOxm673+h359D2JGRZrQy9C02p4OWOsMPbm/SoP7O59c9Wc5hrIECYazlEEDNuC0MJTZPsD2yk2OiNbi0V0SqJ/aLEYTtLbjuReyLPbz1hl4yIRQK7/ztrCsUS3K9vXC9flmQI3YIthv3FXu9ms6L0Nl7lzbifunCwCo8l/ZBReD4X2ooY5RR6ByVk2tLhfuUeZQVzLaUI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(6512007)(36756003)(53546011)(38070700005)(6506007)(5660300002)(66946007)(6486002)(83380400001)(8936002)(966005)(26005)(508600001)(71200400001)(33656002)(54906003)(86362001)(2906002)(6916009)(316002)(2616005)(186003)(4326008)(122000001)(66476007)(91956017)(76116006)(64756008)(66556008)(66446008)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D8D6D430E3E310448BEA97046A033137@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3994
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	37103eea-d79a-4c9b-6604-08da31bbf4eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8EyzMTQFED8AwrYVm5pTRH+4HPq0Pub8xDbct7vFMsCiKx4EyZ5RBItoGk+F/wA2yZhaF5TBXLlMO4nb1SPinbNBRLeQxhqIuj/ijJGTv1RV6HmDbdtpNRVZ7i1CWHqiF8wkiETClOE1TcHV4nRF4LGhxksEREobFS4AnDL/slfYTiuVTf+eG9eBB7qKnogQ4AcFG64izuChEXr3TQZQy1xI4ynwOqAz7Vsy2NMEB6HkjlPhz+PHxUFPWo6seGXp/I+Jl6jv8aWJhoWMhRAglEE2+o2bqAb0tgCN5rtrNXbcvKQocMx/jlmi1q9JrmVO9PwBkia8jWEDqdiOcDdgGqQV0vOcfGQ78+OvhalOLtmvOoo0XHrwYdK0wo9BghoXMl0vZgGS0wvmdElrt/EPSPs5PadwF0NRP52UIsWMBwWSCUoIEI9mEwTRHFWw+SJCSnXiZf5cAAr5eqAqQiaL/IdR6Mu3fEInBx3jQie2gI9wXLnIYIwNywGui+hfvtEOLk5aoX7TTaPMZm1GfuloMbyetg0uolwLO/UrxQAwQw6GQTzfjPIOHjNemECtFC3LfQRSqdTOjTXUFIchIeqmmk4fYYPwoMhl/GKNNbDfpuIa4Ngpb6VTiPGk/coia1M/nf8o9yaQ0ymTpavZhTTHync0O2AMOyuKSBxbiM4cBnpi405uhnIcbFQL3KPRNotqASkgsSdk5NCQOLDDHR/s247WoP6Zt+Y2aM4rRGM8IBUkEcLHWm3i1qC5Zt4s/oBpXU0Fcxv09hNLjgFThITdqpWHfW34xT+LdlOlepqf9FA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(2616005)(53546011)(86362001)(8936002)(36756003)(6506007)(70586007)(81166007)(54906003)(70206006)(316002)(82310400005)(8676002)(6862004)(4326008)(107886003)(83380400001)(356005)(508600001)(2906002)(6486002)(966005)(36860700001)(336012)(47076005)(5660300002)(40460700003)(6512007)(186003)(26005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:01:10.2305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2f38ec4a-69df-4b2a-8ee0-08da31bbfd39
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4196
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 13:01:25 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7256

Hi Bruce,

> On 9 May 2022, at 13:47, Bruce Ashfield via lists.yoctoproject.org <bruce=
.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Wed, Apr 27, 2022 at 8:06 PM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>>
>> A series of improvements to Qemu integration with the Xen recipes:
>>
>> - update the Qemu package dependency for the x86 Xen tools
>> - add support for testing Arm 32-bit images with Qemu and testimage
>> - configure a standard Xen bridged network xenbr0 for Xen images in qemu
>> to improve support for configuring guest virtual machine networking
>>
>> v2 coalesces these patches into a series and addresses feedback on v1
>
> I've gone ahead and merged all three patches of the v2 series.
>
> As for the qemuarm boot (with uboot or not), we can address that in
> follow up patches, since I see that Betrand did send what he's been
> using to the list. And I'm interested to hear if that also works for
> Christopher.

My review on the second patches was mentioning that it does not work on my =
side so why merging that one ?

I will try to test this to check if init issues are solved and come back to=
 you

Cheers
Bertrand


>
> Bruce
>
>
>>
>> Christopher Clark (3):
>> xen, xen-tools: add recommendation for Qemu for non-hvm x86
>> qemuboot, xen-image-minimal: enable runqemu for qemuarm Xen images
>> xen images, qemuboot: configure xenbr0 bridge for runqemu, testimage
>>
>> classes/qemuboot-testimage-network.bbclass | 36 +++++-
>> classes/qemuboot-xen-defaults.bbclass | 26 +++-
>> classes/qemuboot-xen-u-boot.bbclass | 128 +++++++++++++++++++
>> conf/distro/include/meta-virt-xen.inc | 1 +
>> recipes-extended/images/xen-image-minimal.bb | 8 +-
>> recipes-extended/xen/xen-tools.inc | 9 +-
>> recipes-extended/xen/xen.inc | 6 +-
>> 7 files changed, 197 insertions(+), 17 deletions(-)
>> create mode 100644 classes/qemuboot-xen-u-boot.bbclass
>>
>> --
>> 2.25.1
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7255): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7255
> Mute This Topic: https://lists.yoctoproject.org/mt/90743681/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

