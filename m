Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EA7C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 15:58:07 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.59])
 by mx.groups.io with SMTP id smtpd.web11.114.1652111878610489390
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 08:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=zfU8QpYw;
 spf=pass (domain: arm.com, ip: 40.107.8.59,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=T3mU8Bhs//BjzIPerDpHAaH/B5nwea4Se47qbw5z/EFPOzHfAGHHxRWiPdA6J21OI0DPMGpSMX4AaZ50bMewNuj+JsbolYfzRhqXDVOMPJ0BOZasuf9ry1O2+f+wMO0SFw1JZ9cUEkqwRy9pD2utY2O6KZ5zHC6l985lC15bQxrMvBo4B54WgpFcuqBEIAWOah0jlrB4mGjU8FGJ8LL+lp3ainBHwqnmQjazIVhUCRV7taXk2TrEj9uB+kCfGFvslh3KGRcSia/IK0k2rFOVQIVQeRVigb89Myxm2uqcBud4xY48cpcw5fpK4fm+UK1k1CMElZcsE2NA/nEKV+BBvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jX3tJs+1RLDZj9fLPiyMtSw+E8NLbaGYHubRlAliab0=;
 b=NpgcL2AN+frKUSXssQM8iQTr3QhC056VCNBP+VdZk7txxMz8qPthIMqqsuMJrvz/q6+ZpmcHNTfZClBDlLPsFNUMl/7RLNNJzEJWFaPkZDi6/hFlffKLly+m79XvKVeQdvcbD6D7udixxH4Ourkolr4jkwPXGL6o4k5ZesCod8LH3Odh9FJuADPi1zIe5GmcxE9iD8ciw7xLXo2EbiGJCqpVLIT54WjZZVpipLsY+Og1+ku924wD6d+19Bp6DiMmWn9PH9K6YTBz05dnSjamNvuPT2mb9Nj2aiztEEdKynYMDrkBe1fq5SpN5ufgcD7fZ9TTKY3zFQpoJ9gbFI8Weg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jX3tJs+1RLDZj9fLPiyMtSw+E8NLbaGYHubRlAliab0=;
 b=zfU8QpYwZVy51qW2edxYCOSWla349/ya+wug8OM/rwSpvCIU9VEo6Gdt1PDGWOjDP84l5V6eAewIg5ZPStQ98+iYQcDi/57p8uCCAFO2cQ5LiXUBiOBgVixPOGA0WWw6x5HcwWaRsNEsk/GZHV7n+FyUtWiwoQgPMu2vUz9Dtn4=
Received: from AS9PR06CA0348.eurprd06.prod.outlook.com (2603:10a6:20b:466::8)
 by DB8PR08MB4075.eurprd08.prod.outlook.com (2603:10a6:10:aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 15:57:53 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::4a) by AS9PR06CA0348.outlook.office365.com
 (2603:10a6:20b:466::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Mon, 9 May 2022 15:57:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 15:57:52 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Mon, 09 May 2022 15:57:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29112270015d18e4
X-CR-MTA-TID: 64aa7808
Received: from b508c3de10a0.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A9220D4-CA7A-41CF-BD49-B3951205D90C.1;
	Mon, 09 May 2022 15:57:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 b508c3de10a0.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 May 2022 15:57:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZPvTLNbDULRC9o6YmuQj25flFelP7aMg2/1sVvH3PQ2Vai/zqb98JLqDhd3PfAicXIqRKdPnwuWXI/cSB6YoLnm6b/jsbymreSI43CdFe4b8fV/wyXJaiB/W3Ok6I4K5+FhkwiMkYl5C+08f+vRpftXqjN48OAycbWNhm7rD3JwjAn3MB6JZAQ/yiOn9Lccsr6vG8AixK3Ooesc/8b4Bt27sLS3AFYM9XZMvWQkcyVOg+drtc2OlzJ5DQUwgh2ugKUZDSDBV9KtpysCZjejtdd8F8za/atbqG/10gFjrOZquXXQKBlay1tv3iJmH/yVHj3GiA7n7d4TElvb060Ulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jX3tJs+1RLDZj9fLPiyMtSw+E8NLbaGYHubRlAliab0=;
 b=FXOvbj7GCi2VW07eULY1+wFYwtH6kSQNlRh6vBQGR5zJnL0x/0x53EKnmwMcT1BUS4JWgDAczeaTtG+v0l38Ey5aJbKgT7NngdvsEc4hy7vvX114y6RVcP2oN5EfV5AN9awYBY8KClK9D0ED8zDfAk87UI5Qd3KLT5sc36ZSwf7rcofafX/S5r765/PicvMnzkYxvxCIT/sQkA4QDFIYTiOF7kXDox+U2ywtgcYQETuocsmaY4p+39uPIVokwXJm84J+rV7H8LcIatouRGgUhvLYDI4iTEXbQdFES9skJGJGu0yL1SSomBW68yHaSsDeUu7bt+z0eS0pneHCJutnFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jX3tJs+1RLDZj9fLPiyMtSw+E8NLbaGYHubRlAliab0=;
 b=zfU8QpYwZVy51qW2edxYCOSWla349/ya+wug8OM/rwSpvCIU9VEo6Gdt1PDGWOjDP84l5V6eAewIg5ZPStQ98+iYQcDi/57p8uCCAFO2cQ5LiXUBiOBgVixPOGA0WWw6x5HcwWaRsNEsk/GZHV7n+FyUtWiwoQgPMu2vUz9Dtn4=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBAPR08MB5638.eurprd08.prod.outlook.com (2603:10a6:10:1b2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 15:57:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 15:57:38 +0000
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
Thread-Index: 
 AQHYWpPTnFu3WGfk1EKQOEqfK1rWW60WkL+AgAADvICAAAhOAIAAB7gAgAAgRQCAAAEUgA==
Date: Mon, 9 May 2022 15:57:37 +0000
Message-ID: <CB3D7DB1-6D77-4ED3-89F3-B48F8B881F05@arm.com>
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <CADkTA4OBc-C3UXRrjHkWHNYpNi7ZxX8RpiODOdoQCXdf4a7AMg@mail.gmail.com>
 <6C681FA0-E19C-4499-95DD-A0FE0B7B4EF7@arm.com>
 <CADkTA4Pa3C+XdESD0Ynxv-8RnaWfeQMTNU7iUymNsE002Z6BoQ@mail.gmail.com>
 <0EE9D5E6-5FE9-4E32-8D04-B552236E31DE@arm.com>
 <CADkTA4OR779FnG=F06qEzqZ7v0KVUs7iyHCTziuXU9Z6EKnR-g@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OR779FnG=F06qEzqZ7v0KVUs7iyHCTziuXU9Z6EKnR-g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4f1e44d7-c67b-4d0f-90f9-08da31d4acdc
x-ms-traffictypediagnostic: 
	DBAPR08MB5638:EE_|VE1EUR03FT043:EE_|DB8PR08MB4075:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB407542EC05B06BF00D10D23D9DC69@DB8PR08MB4075.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 p/nLLxpS6+TCBlw0dpOUJwdVLWdy1F0hhaoNU07pW1Oq2UlcAalJh1TnFHahuLBnhQNUHiMbbxHMHvPMwULL6dVuAekYfWAgkzYGbg9S5MbdhvbbhDyO8ydXAQsQVwf03sXJ8a6/5SxMq6AhyOnuLZW2pa/qXHet6DTOflBNRt/TbCgvxS++WWiGEZApg5KNLZDan7KfFCxAvhlW/PwGSprYw6t67R7n8HQa7x2El7QfIewop1vyqkJ7uvCSjMmq6XehJNSZ5y68GwryJ5Ci/71J+uJtT4oKbfVEVCBelbBX2cJfmUFxEbKbLruua9hGTwjRvaMCVHQRehH4y6U1oA0v4qqWms3zvfTj7g3pXdHev51BV4T8UJQ50zLKUr0SY0vaaUrNE8QXt1cF3xSrcabtl1HZkmcVz0qGEITbmRzGA6Y8RxUf/s4tSNje5c2vcthgM1J8HIVBkeksc4QfRTQ+MwO6b24926ig6LBU47+qp4GKFzpZGl+cUnQI3Khxmykr9hP8pey5/PsWdG82dLLKMj8fcCVlLPtskjsKHxVi+1W47pi5sE4yYAjhFp12RcC9TyVpCdKrzO45N2PcWVAQCfojLUsSgPurxRuh8vJKylLFtR1VtDD4koAqg5Vz/RhorPXD+DCc5GniANX74ZBBBz3NAvd/2kNoO3B3XKaqnk9IAyeU0BBw12zu1TYlaG0SJEUask81NK4tH70IbsZGjeawEL08RwCK8JibKGYykTAlzECXFFWhENMUiZFSyCvx4H2uVQX9LI0vpeers7JrtcBUBJzxmUt8PwMOABhihnYzY5Ymwev8M9aAYU3YYqJBRsfytdmgJlTtBCwJ+awAKIc/5sl6gbcNDPkb6fw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(2616005)(6512007)(186003)(122000001)(64756008)(76116006)(4326008)(66446008)(66476007)(66556008)(8676002)(66946007)(33656002)(5660300002)(36756003)(316002)(6916009)(2906002)(54906003)(6506007)(6486002)(91956017)(508600001)(966005)(38100700002)(38070700005)(86362001)(71200400001)(53546011)(83380400001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7113A2B5E226D44682C84261545814BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5638
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b7837057-2e44-4638-7734-08da31d4a3f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YalTQXzua7oizPpr+T/y/7xL16fldMfSc1Tis1Qo2O9Fw1dgvYHVkSw54ngsR8+hT7VOy7qVqsQ83fJ7qEToh54CYAT+YpoPDcZhKMgmKpoVu2PmBCJMtekDgGbR+Uln//Fr95o3xQcSiwucLMGQm5G5q7rvq8klqt62rYck2JWYhDfL7wZ5tTz2n6xW/eCMH4jrmkYqroHJlKKtE3SJX+bVMo6gVgZR5wqqQOKlTo5sxhi3RffjJcggLBhg7FvyymOPGHiroVeWQFMYrr3y++zsbcAAf+U4Wq4Bt9cuj0MuKr9v0Y43eLZOj/LPGrg62x3hhRYho2zebEv3mP7DipFt5lAERc+zByNVmfdQXQ66IqgipEnIjoCIjzEyNDJLmvAvEiZg0IzcFxJXNutnlxDZ9ULbYCpBTZd2CKECzI1mf0XXSSnq3EEN1ZdacvG4nW8e8+Gxy0O8wUiJKAvlgK4bwpzfP1hzeMBVZnEdWDKG6zPPGyZlLg6EtZfkfQCeDtrxYsFGNM0JPtNwD7RIcabjT8oJnXPlRvMf50IX05N712V9ytWYAa4CyoeDbQotQ1mtESgr0REw+InFD3TlXntomNzDt/FJbT0IlGhZYa0HSb8WFSTpPZIfQcojH0iTBvoirL+xO5pecHXO+PLOl1UNgRKzmMDWztNJFrOaJqxSpFnki1orefbTCpaKDFWBVE7e+zMRKkeJWZWBfQETF9JSdY8+JxdiRDOCvRd+SdetJ8wMPOjC4rmBTHnrMJaMiUgXwNEWYsUVPwS0rBtvHG3qEUJkJu6HznwKPJDODLw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(36756003)(81166007)(8936002)(36860700001)(40460700003)(508600001)(4326008)(2616005)(6862004)(8676002)(2906002)(70206006)(70586007)(33656002)(356005)(83380400001)(54906003)(26005)(6512007)(6506007)(186003)(107886003)(53546011)(5660300002)(6486002)(966005)(316002)(47076005)(86362001)(82310400005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 15:57:52.7904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f1e44d7-c67b-4d0f-90f9-08da31d4acdc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4075
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 15:58:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7261

Hi Bruce

> On 9 May 2022, at 16:53, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Mon, May 9, 2022 at 9:58 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>
>>
>>
>>> On 9 May 2022, at 14:30, Bruce Ashfield via lists.yoctoproject.org <bru=
ce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>
>>> On Mon, May 9, 2022 at 9:01 AM Bertrand Marquis
>>> <Bertrand.Marquis@arm.com> wrote:
>>>>
>>>> Hi Bruce,
>>>>
>>>>> On 9 May 2022, at 13:47, Bruce Ashfield via lists.yoctoproject.org <b=
ruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>>
>>>>> On Wed, Apr 27, 2022 at 8:06 PM Christopher Clark
>>>>> <christopher.w.clark@gmail.com> wrote:
>>>>>>
>>>>>> A series of improvements to Qemu integration with the Xen recipes:
>>>>>>
>>>>>> - update the Qemu package dependency for the x86 Xen tools
>>>>>> - add support for testing Arm 32-bit images with Qemu and testimage
>>>>>> - configure a standard Xen bridged network xenbr0 for Xen images in =
qemu
>>>>>> to improve support for configuring guest virtual machine networking
>>>>>>
>>>>>> v2 coalesces these patches into a series and addresses feedback on v=
1
>>>>>
>>>>> I've gone ahead and merged all three patches of the v2 series.
>>>>>
>>>>> As for the qemuarm boot (with uboot or not), we can address that in
>>>>> follow up patches, since I see that Betrand did send what he's been
>>>>> using to the list. And I'm interested to hear if that also works for
>>>>> Christopher.
>>>>
>>>> My review on the second patches was mentioning that it does not work o=
n my side so why merging that one ?
>>>>
>>>
>>> It worked here, and obviously it works for Christopher. So at that
>>> point, I wouldn't hold it out of the tree.
>>
>> Could you at least explain me what I did wrong.
>>
>> As said qemu is blocked waiting for a dhcp/tftp to answer in uboot.
>> Why do you guys have something starting a tftp server and I do not ?
>> Is it something that might happen to somebody else ?
>
> I used a setup that I have for kubernetes testing that does have a
> bootp/dhcp server available, so that could be the difference. But it
> is best to get Christopher's setup, as that is the reference he's
> using in his maintainer cycles.

If there are some external dependencies, this would kind of odd to
have this as default if we can have something working out of the box.

>
> Note: I only merged this to master, not kirkstone. But without this
> patch only patch 1/3 from Christopher went to kirkstone, so there is
> possibly more work required there as well.

Ok

>
> So we can debug the setup in master, and not worry about it hurting
> the release, but if we don't get an answer from Christopher, or
> otherwise get it working in the next few days, I'll revert in master
> as well.

I am debugging while kernel log and init log are not seen for dom0.
Dom0 bootargs are wrong and I am digging to find out why.

>
> I didn't see any replies to your qemuarm patch, but I'm doing a rebase
> to master, and will test to see if it can co-exist or just be the
> default behaviour.

Yep it needs a proper review.

Cheers
Bertrand

>
> Bruce
>
>
> Bruce
>
>
>>
>> Cheers
>> Bertrand
>>
>>>
>>> Bruce
>>>
>>>> I will try to test this to check if init issues are solved and come ba=
ck to you
>>>>
>>>> Cheers
>>>> Bertrand
>>>>
>>>>
>>>>>
>>>>> Bruce
>>>>>
>>>>>
>>>>>>
>>>>>> Christopher Clark (3):
>>>>>> xen, xen-tools: add recommendation for Qemu for non-hvm x86
>>>>>> qemuboot, xen-image-minimal: enable runqemu for qemuarm Xen images
>>>>>> xen images, qemuboot: configure xenbr0 bridge for runqemu, testimage
>>>>>>
>>>>>> classes/qemuboot-testimage-network.bbclass | 36 +++++-
>>>>>> classes/qemuboot-xen-defaults.bbclass | 26 +++-
>>>>>> classes/qemuboot-xen-u-boot.bbclass | 128 +++++++++++++++++++
>>>>>> conf/distro/include/meta-virt-xen.inc | 1 +
>>>>>> recipes-extended/images/xen-image-minimal.bb | 8 +-
>>>>>> recipes-extended/xen/xen-tools.inc | 9 +-
>>>>>> recipes-extended/xen/xen.inc | 6 +-
>>>>>> 7 files changed, 197 insertions(+), 17 deletions(-)
>>>>>> create mode 100644 classes/qemuboot-xen-u-boot.bbclass
>>>>>>
>>>>>> --
>>>>>> 2.25.1
>>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>>>> thee at its end
>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>
>>>>>
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
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#7257): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/7257
>>> Mute This Topic: https://lists.yoctoproject.org/mt/90743681/3619089
>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bertrand.marquis@arm.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
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

