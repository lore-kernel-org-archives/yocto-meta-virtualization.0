Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A540C433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 15:08:29 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.85])
 by mx.groups.io with SMTP id smtpd.web09.10705.1651849697993329105
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 May 2022 08:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=mQPAtyoB;
 spf=pass (domain: arm.com, ip: 40.107.21.85,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NRE64NuYk7Td7J89omznycGfWyxZpoFubHvtG9hP3Zgit1CtL2HxvyicOD8Az81H/c0zEH/zlqeYPtebIWGj8LI3URwllwQ+qaNiUejez6ZxaKDaf3vBlXOx4fkX2+D8b3h2ay0u4NW1STAIfOyr7B4lHA6LYhBg78cZS2qDpZiklNk6xxZ5pj9zs6wo/y8TIxlBWAQu5xN8ApyZ/QIa85srY/J7TOHckOuxI7DsNgkZNDfkK/+nQ36L2J+lKJOhDRPfnIvWU5NpFJRYgxYF/T59DBh9me2sOX9xgDnSBLWwPqrdIV0um3lyl3ARAuzQZmo139cshB+ggHZenviO4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csrakxgyQIIa0xAahgKfBd/WAcOdhKRSENLqGtrNZ6E=;
 b=hoe6ETULeZ/Pnnh43I7ql6Udjbv8OyCBuuiq06S/qHslOVnVJZ+fssC8YzL3C9ohmumHP1mv4juM73CTm16PlV5w8lBw2du/HcHYWQdk7Dkj1Su4Yzku0p0sDNSuw1LXzUSeI8cpeuUKgEqUyXKDvtwsx82tzCkZVGCz2dmarTYoz0nxa3Cfp8BKnYvcu2586oYEuTDNqkWYKF+5jAGqvfkMcaBtwQZpga6RzuPwh40XbMuCXw+r0VGrxyvvR04Ma3i5f7U93R3GdnBsXvQWYLYssq5ZJYL+az9N4SNHAnJ/BC8RbnK08oB9pTC7DOkxe4oMBVn3nncUtG5sGAdCIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csrakxgyQIIa0xAahgKfBd/WAcOdhKRSENLqGtrNZ6E=;
 b=mQPAtyoBAuns28cEYM7J7SOGFL8vTpRbuOJpqJwwBhMXC1LK+60njmkJG0kbkXpSmzxCQBw6bE7CBlQ6AMhYzVv3mjJTzQhV8rfTGyVciJtfFSIPPD2Bzx9fDa1QKmRXQIxq9u604eLajBaBPI7D1BMmqDc4dXwPmtXGWltRUKg=
Received: from DB8PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:10:100::37)
 by DBBPR08MB4380.eurprd08.prod.outlook.com (2603:10a6:10:cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23; Fri, 6 May
 2022 15:08:13 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::b6) by DB8PR06CA0024.outlook.office365.com
 (2603:10a6:10:100::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Fri, 6 May 2022 15:08:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Fri, 6 May 2022 15:08:13 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Fri, 06 May 2022 15:08:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 60107479f2344d94
X-CR-MTA-TID: 64aa7808
Received: from e9a6da77a5ed.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EE1D5E9F-1753-4947-B733-6366EF38F468.1;
	Fri, 06 May 2022 15:08:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 e9a6da77a5ed.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 May 2022 15:08:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dp/NSdKuFsOZoIBvmQNBNGfB1MWXLHlhbxAWyNStD5leu4bGxnp3aTl/RCSFUZLz+NY5+9VQsemKq9Mt5cazja5vv97GMMSLDwiQBaLmOAywmSO4RHLJaPUeqqvX8jeyt2Rn6J4bEcGfW++hwQ/jtBUUxJFx8LlzGqzhcfLF462W77jufcADBYMjQEaooR8G4kWMC3Rt3a1Kq0erxB6hHGAepdW9LPMHfeN4eG1yNwu93nWYL0XN0qEVuPLJSB9YzlFNpFY+leNNTKrKnxwg6tKNtNTYs1EhwLoy25GVOg+iRBF6Fj12m46KZ9sQI9jZo7T+4bwC7QGFDcKA3chaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csrakxgyQIIa0xAahgKfBd/WAcOdhKRSENLqGtrNZ6E=;
 b=RA7kXy1334chrLNhcJCzqqhpKww5iKmJv6qO/wsJ1zEG+MNvBXRlVXlUnJKIp0CTv4a8wl0i84bIORo2ssRW2OuiCDwMpj97xIRbQigpzfkkbIiEqPr2n4OYVO9bRxQjDJPOgj+DfI++4J5rZJ6wqScZ1ssyxgFYNbGRJ8JZ1WHb/VcmE/Ihd2NRhiqeL94ecWHPEmAaan2zAGfaKG/YSqEQ3hg0RAyLv8+5YE2m5kYGFMLv03q+Rkh4SC9qtus1LFLzhkHxtX0Pt9SW4KPh40RbklEGsEYVrjEK+Wy2jtSFZzKso2TgqHNX/lyj1/1L73cxKoliMv7cb5O89wnqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csrakxgyQIIa0xAahgKfBd/WAcOdhKRSENLqGtrNZ6E=;
 b=mQPAtyoBAuns28cEYM7J7SOGFL8vTpRbuOJpqJwwBhMXC1LK+60njmkJG0kbkXpSmzxCQBw6bE7CBlQ6AMhYzVv3mjJTzQhV8rfTGyVciJtfFSIPPD2Bzx9fDa1QKmRXQIxq9u604eLajBaBPI7D1BMmqDc4dXwPmtXGWltRUKg=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB4837.eurprd08.prod.outlook.com (2603:10a6:10:d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 15:08:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 15:08:02 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@cardoe.com"
	<cardoe@cardoe.com>, "dpsmith@apertussolutions.com"
	<dpsmith@apertussolutions.com>, "scott.davis@starlab.io"
	<scott.davis@starlab.io>, Diego Sueiro <Diego.Sueiro@arm.com>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>
Subject: Re: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
Thread-Topic: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
Thread-Index: 
 AQHYWpPid/oZQrV6gE+p6K0H2pRecq0G43AAgAAB4gCAAALWgIAJf9QAgAF2UICAAAoGAIAAGK2A
Date: Fri, 6 May 2022 15:08:02 +0000
Message-ID: <4B991E23-6D0F-46B7-BDD9-5A94662FA0F2@arm.com>
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <20220428000609.26814-2-christopher.w.clark@gmail.com>
 <C3A15DC1-B8FA-41D5-9408-295188560535@arm.com>
 <CADkTA4MhC2yN4-At7MUy8JHPme5O8kzT-Cj4u6wPnfHuZ=n7nA@mail.gmail.com>
 <C28D13C0-958B-4AF1-950A-F25E15288072@arm.com>
 <CADkTA4MMzCMUM1-o-G5W=P7AXf5b4umHf=w3NEJEthLuHPMneA@mail.gmail.com>
 <E67177DB-D51F-4C4D-ABB7-92E2BC937C17@arm.com>
 <CADkTA4Mr7KNkhSyA9v4ZJ+krso9o=6JSYhFKm=Dho1bPXaLfbA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Mr7KNkhSyA9v4ZJ+krso9o=6JSYhFKm=Dho1bPXaLfbA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f5520a5b-d6b2-4c75-f98f-08da2f723d97
x-ms-traffictypediagnostic: 
	DBBPR08MB4837:EE_|DB5EUR03FT019:EE_|DBBPR08MB4380:EE_
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB4380CE12071943273E2611B09DC59@DBBPR08MB4380.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zOW6pM/autV0pwwGfVRxXqXBTr5GRhQyRHQFUWeCthpuH2N9NP9cJyx149Bmnyf8V4CbQualt3goptbxz+6P0bDVgeBFfHOEe8mmlXx5QG+r+ypsnCh9ICgvXJD1YQsOIr+yAlUeVZyZ9TfMzcLSygXBhPd1/O4RvJBf8kPKhXdAQz0wyq1Tb2JWSJufaL8kcj7iZX53bWWxQCUx2J9QLu4hc/U775erJg1EnE9qQwJ+aYGUYtK4QlEQIYiYcvOz+IbobPkZvqAp7JhkCTmn5hQQ2f15MZnZXOgltH1CZ9p8q7AqtO45mGuR9TbM4hal5Yvsg1/AW/JsnEImfkPELH1M71EaUBx+rc8eIzwXA1/uRL6Zt1NU17jqNcuTcUqb09jJEBURdQ4vdCMQNAQGP7lvfQP625cTYtHaxVXZpSzvn/KHo1jfabK1FnhZfeMOAT3xCUZ/nFGZk8W8vkdNkiP6gD9doMry+rFR1guLnL1rslzHzkGhZ3k5/s7vRAECfBQm8cJg5kHtrPqYpcqW4zqFV3mecdMbziyqXqPNEYx9tbCT/rxTVAiKLlMhNUCEnxkaSQcdEfqP3LO1W7MB/lSS4MXhiw6fY/7XJphN9ZacvcBK6FhjUA0ZxSiamh88BlpuVfHiXhjNo4iJhfzJTG3F3e5AKkahsclEz1BuTD80s2TeKOZbe4sYH57rT8GHD2H58k4qJbXb+y7evNHkNaNJ3QGWHmzM+VK+LWXiOSZ0VtW+DfXfnXjO87PNVZLU+YUXSM3WljUj/hzZMkbNxFJ+xyVK8UMCYbWWHPjHTRss/xMjGftlj/ir7AtlJuhANY4lYw+K4S2OFwy6vesmQHJkxJWy8xKApkc4Xlo57bQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(33656002)(6916009)(508600001)(6486002)(966005)(54906003)(8936002)(19627235002)(316002)(122000001)(36756003)(6512007)(38070700005)(83380400001)(86362001)(66446008)(64756008)(66556008)(8676002)(38100700002)(66476007)(66946007)(76116006)(4326008)(2616005)(26005)(5660300002)(53546011)(6506007)(91956017)(2906002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78C34E4E12BB514FA6A7531387201D47@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4837
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	603f007a-4708-4842-bb37-08da2f723720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sZUcrmSRvEp3efsaDB/RaU6BU5JQ1Cg+70Ojyt6wRWhBwWfYkmj7lWpzdezfX5trpJpX3pMHHv8aA5060DzJB9rQQ6UMQOdQUUP34iwQ5D18LOiOLEG03roERg6hnHF9HTGM/+XcRZpMYkvnkrKrz/HQT3jVMW7i5R+f4Pk0vZ/kEKS7l7Vd8OXx59orgNqJUAOCkH6jyp9lnNfW/G5rfoUWnIVdoOIw6xckEkOhHitzV5wf+OAu6LKCyf1Vu+tTUkova7g8pw0mlsNOwMnCOBsS3bCr9sugZPTI/tsmkjg1mfsNmMk2dP9XrcbBUa62xlI9H5/bryxrUNcwy4cmZil0iHb1I9UJj6LHA7N6sP3wkqGxl1tRBVPZx3iq/6WHS6EQIWH4gAIpZi80rzcCzVXN69TSJTElw7X2ZagjRiUc8o/ZVP/NTPOXJor+jpDyXexqC0l7jAe97cwUTW4e3HaBwA5EG3lhCktcu+99ZozJt8E0YXTFVSmtzneNzEO1iKCMsEv8oDDBd8I2BMJibJgKPhyTkzLmBQVuY84er79DRZzDIcDsD57YoCC9humDZoADpvVUb/ljlf8RFv8rzAum6oUsv34Z4rFbjJ1aNubl/pq1X7XggoNOPd+ATAnwSGAYXW+W4yl1ZgqdHY+Ij2QfH4KHjEw5XgXI3IMHtsUsIlnDUoksWPuytJbyR+WUr0XOo4qep6ubekmbdxPoSrgEvhvTbEzF04LrWazQ/WAFvUswKPUlSAytqDbUOQ1MKI4GkYkBg2pe1c0gdnWXf1RrJ3nhYX10WYVfaxlHMuM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(4326008)(8676002)(82310400005)(6486002)(30864003)(19627235002)(966005)(81166007)(5660300002)(6862004)(6512007)(54906003)(83380400001)(70586007)(70206006)(86362001)(316002)(8936002)(40460700003)(36860700001)(47076005)(2616005)(336012)(107886003)(186003)(36756003)(26005)(33656002)(2906002)(356005)(508600001)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 15:08:13.2337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5520a5b-d6b2-4c75-f98f-08da2f723d97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4380
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 May 2022 15:08:29 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7251



> On 6 May 2022, at 14:39, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, May 6, 2022 at 9:04 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Bruce,
>>
>>> On 5 May 2022, at 15:44, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
>>>
>>> On Fri, Apr 29, 2022 at 9:40 AM Bertrand Marquis
>>> <Bertrand.Marquis@arm.com> wrote:
>>>>
>>>> Hi Bruce,
>>>>
>>>>> On 29 Apr 2022, at 14:30, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>>>>>
>>>>> On Fri, Apr 29, 2022 at 9:23 AM Bertrand Marquis
>>>>> <Bertrand.Marquis@arm.com> wrote:
>>>>>>
>>>>>> Hi Christopher,
>>>>>>
>>>>>>> On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctoproject.=
org <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>>>>
>>>>>>> The Spectre and Meltdown mitigations for Xen run PV guests within
>>>>>>> HVM virtual machines, so Qemu is no longer only needed for systems
>>>>>>> configured to run HVM guests.
>>>>>>>
>>>>>>> With the split xen hypervisor and tools recipes, the bios dependenc=
ies
>>>>>>> belong in the tools recipe, so move them and replace the hvm
>>>>>>> PACKAGECONFIG option with the recommendation based on target arch.
>>>>>>>
>>>>>>> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
>>>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>>>
>>>>>> I can build and run on x86 qemu and I get stuck during init in Dom0 =
(which is apparently already known).
>>>>>>
>>>>>
>>>>> It is likely the xencommond init.d still causing issues.
>>>>>
>>>>> I'm doing a revert of all those changes locally, and will start some =
tests.
>>>>
>>>> Please let me know if you need some testing.
>>>> On my side, I have the issue on arm64, arm32 and x86 at the moment.
>>>
>>> I'm still able to build and boot here, so I haven't reproduced the
>>> issue .. so I'm still hesitating to revert all the xencommons changes,
>>> as I can't prove to myself they are the issue.
>>>
>>> I created a kirkstone branch today, and I'll be adding the latest Xen
>>> patches to it, but I need to get a handle on what everyone is seeing
>>> for failures.
>>>
>>> I assume you are still seeing problems with the boot on all the
>>> platforms you mentioned above ?
>>
>> Here is the linux logs for dom0 on my system:
>> [ 7.854317] EXT4-fs (vda): re-mounted. Opts: (null). Quota mode: disable=
d.
>> Configuring packages on first boot....
>> (This may take several minutes. Please do not power off the machine.)
>> Running postinst /etc/rpm-postinsts/100-sysvinit-inittab...
>> update-rc.d: /etc/init.d/run-postinsts exists during rc.d purge (continu=
ing)
>> Removing any system startup links for run-postinsts ...
>> /etc/rcS.d/S99run-postinsts
>> INIT: Entering runlevel: 5
>> Configuring network interfaces... udhcpc: started, v1.35.0
>> udhcpc: broadcasting discover
>> udhcpc: broadcasting discover
>> udhcpc: broadcasting discover
>> udhcpc: no lease, failing
>> ifup: failed to bring up eth0
>> Starting random number generator daemon.
>> Starting OpenBSD Secure Shell server: sshd
>> generating ssh RSA host key...
>> sync: ignoring all arguments
>> sync: ignoring all arguments
>> generating ssh ECDSA host key...
>> sync: ignoring all arguments
>> sync: ignoring all arguments
>> generating ssh ED25519 host key...
>> sync: ignoring all arguments
>> sync: ignoring all arguments
>> done.
>> Starting syslogd/klogd: done
>> Starting domain watchdog daemon: xenwatchdogd startup
>>
>>
>> And it stays stuck there.
>>
>> This is arm64 but I have the same on x86 with almost the same logs.
>>
>> If you want me to test something in particular to check if it solves the=
 issue, just tell me what.
>> I do not have much time to investigate right now but I will try to dig a=
 bit from middle of next week so please keep me in touch.
>>
>
> Thanks for the data point .. it is very helpful!
>
> Would it be possible to get a log of the image you built, and how you
> launched it ? I'm assuming it is standard, but i'm looking for
> anything that might show how I'm doing something differently!

For the easy parts:
- config: MACHINE=3Dqemuarm64, DISTRO_FEATURES =3D " virtualization xen"
- build Xen-image-minimal
- launch: runqemu serialstdio nographic

I am using current xen staging with a modified xen recipe but I just tried =
with stable 4.16 and I have exactly the same.

Here is my build config:
Build Configuration:
BB_VERSION           =3D "2.0.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "aarch64-poky-linux"
MACHINE              =3D "qemuarm64"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "4.0"
TUNE_FEATURES        =3D "aarch64 armv8a crc cortexa57"
TARGET_FPU           =3D ""
meta
meta-poky
meta-yocto-bsp       =3D "stable:d53ac6e9561d782818d5491b7c4066f4a712d358"
meta-oe
meta-python
meta-filesystems
meta-networking      =3D "stable:bb2b5b31a80eb164e47649036878773614e4dbdf"
meta-virtualization  =3D "stable:ea91e97711e3ceda4f4eab9db0d393568ee8bb46"
meta-arm-toolchain
meta-arm
meta-arm-bsp         =3D "stable:50b34c5cc9496441152ad28bf1022e5fc5ab0a7e"

For the build log could you be a bit more specific as there are a lot of lo=
gs.

Meta-virtualization status is kirkstone + patch for qemu-arm32 support.

Cheers
Bertrand

>
> Bruce
>
>> Cheers
>> Bertrand
>>
>>
>>>
>>> Bruce
>>>
>>>>
>>>> Chees
>>>> Bertrand
>>>>
>>>>>
>>>>> Bruce
>>>>>
>>>>>> Cheers
>>>>>> Bertrand
>>>>>>
>>>>>>
>>>>>>> ---
>>>>>>> Unchanged since v1
>>>>>>>
>>>>>>> recipes-extended/xen/xen-tools.inc | 9 ++-------
>>>>>>> recipes-extended/xen/xen.inc | 6 +++---
>>>>>>> 2 files changed, 5 insertions(+), 10 deletions(-)
>>>>>>>
>>>>>>> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/=
xen/xen-tools.inc
>>>>>>> index 6bbc8cd..54bc477 100644
>>>>>>> --- a/recipes-extended/xen/xen-tools.inc
>>>>>>> +++ b/recipes-extended/xen/xen-tools.inc
>>>>>>> @@ -30,14 +30,9 @@ RDEPENDS:${PN} =3D "\
>>>>>>>
>>>>>>> RDEPENDS:${PN}-dev =3D ""
>>>>>>>
>>>>>>> -# Qemu is necessary on ARM platforms, and to support HVM guests on=
 x86
>>>>>>> -QEMU =3D "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu', '',=
 d)}"
>>>>>>> -QEMU:arm =3D "qemu"
>>>>>>> -QEMU:aarch64 =3D "qemu"
>>>>>>> -
>>>>>>> RRECOMMENDS:${PN} =3D " \
>>>>>>> - ${QEMU} \
>>>>>>> - ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
>>>>>>> + qemu \
>>>>>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'seabios ipxe v=
gabios', '', d)} \
>>>>>>> ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKT=
AP_RRECOMMENDS}', d)} \
>>>>>>> ${PN}-flask \
>>>>>>> ${PN}-hvmloader \
>>>>>>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xe=
n.inc
>>>>>>> index 8b86de5..4c38ccf 100644
>>>>>>> --- a/recipes-extended/xen/xen.inc
>>>>>>> +++ b/recipes-extended/xen/xen.inc
>>>>>>> @@ -9,13 +9,11 @@ require xen-arch.inc
>>>>>>> PACKAGECONFIG ??=3D " \
>>>>>>> sdl \
>>>>>>> ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d=
)} \
>>>>>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} =
\
>>>>>>> "
>>>>>>>
>>>>>>> PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl,"
>>>>>>> PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolicy,chec=
kpolicy-native,"
>>>>>>> PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,syst=
emd,"
>>>>>>> -PACKAGECONFIG[hvm] =3D "--with-system-seabios=3D"/usr/share/firmwa=
re/bios.bin",--disable-seabios,seabios ipxe vgabios,"
>>>>>>> PACKAGECONFIG[externalblktap] =3D ",,,"
>>>>>>>
>>>>>>> DEPENDS =3D " \
>>>>>>> @@ -132,7 +130,9 @@ EXTRA_OECONF +=3D " \
>>>>>>> --disable-rombios \
>>>>>>> --disable-ocamltools \
>>>>>>> --disable-qemu-traditional \
>>>>>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshi=
m', '--disable-pvshim', d)} \
>>>>>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', \
>>>>>>> + '--enable-pvshim --with-system-seabios=3D"/usr/share/firmware/bio=
s.bin"', \
>>>>>>> + '--disable-pvshim --disable-seabios', d)} \
>>>>>>> "
>>>>>>>
>>>>>>> EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmw=
are/vgabios-0.7a.bin"
>>>>>>> --
>>>>>>> 2.25.1
>>>>>>>
>>>>>>>
>>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>> Links: You receive all messages sent to this group.
>>>>>>> View/Reply Online (#7226): https://lists.yoctoproject.org/g/meta-vi=
rtualization/message/7226
>>>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/90743682/3619089
>>>>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/u=
nsub [bertrand.marquis@arm.com]
>>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>>
>>>>>>
>>>>>> IMPORTANT NOTICE: The contents of this email and any attachments are=
 confidential and may also be privileged. If you are not the intended recip=
ient, please notify the sender immediately and do not disclose the contents=
 to any other person, use it for any purpose, or store or copy the informat=
ion in any medium. Thank you.
>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>>>> thee at its end
>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>
>>>> IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.
>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

