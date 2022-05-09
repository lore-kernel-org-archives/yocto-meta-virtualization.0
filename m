Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DC0C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 15:43:33 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.51])
 by mx.groups.io with SMTP id smtpd.web12.48.1652111004933734164
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 08:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=jfdjiZZQ;
 spf=pass (domain: arm.com, ip: 40.107.2.51,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=l2gd1tRLy9CmNjBdQ/gU8Fco0rDz5av64H2Fe5RMtikV1417GS5ivpAhvbY85E8RUzAFb9NfxiFpjqvJ1aW2ll7C/xwfl9ieUu6qPOo1xtIlN4o8+YAqCeLaatvJoXQElGWaZGX1evqZr0vsUK9hPmJe+IVH/5gZgcmsQ5j6fbv7RdOO/uaq+JN9BXZX9gKFPT3SNwT1/nVsVZgRdnwTjuAjZpxOc7jEd+nJY1Uj1qxhUK2HkjI+4RZkOmKrOJhNlnWbViAepVBDZb1Pn+C4zvhFbAXR6rAIodTEEivErLGNiSMOCyvJCYwzCrkvRMvjN+RCaQe5RaRh4ofTVfYZBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4qQOvNmJeS6CP41OTxpgegFTHppC2AeK6N+LI7Zk6Q=;
 b=DH6SqlVCxvfgAKxk0/f/1aFVopGWSEXHZSs5NAQ2nc0y3Fg+hNSDhiMUQvDMdUMPJaPeCTSkbrpC9p0DPk+nBposo4gGysfdJWKQdB3FvMID/ds2Q5wGdxerTakB/ytjqCF3ZUHTnznA3zhZRsfTUV5avib5qrkOANsUMkjkC2/pU2kbdd46qstJJvWnler53NkpG6B6shglAmWaYGefVoLDtmYjMOkIRR1wvickwYNkts9SiKbXfL4lMFO/7qjgXxjbyJ5BUQZTXAO8wUquB3LkYZcntY4iQ7ciE9Vgl4anDBzYob0LWoFHissqv7JlJvbKefpnHaoXC01ulJ9c2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4qQOvNmJeS6CP41OTxpgegFTHppC2AeK6N+LI7Zk6Q=;
 b=jfdjiZZQrvXn8I6zMprT5UGXO7P45sap7TcgX5/k8youLtKGUfDPyrdY/aHEwPEKztfOVtP8mozkCRz4xYqXVrF/M6Fjh+UdKQSK9UONuOHBl5swWYT5DBPPFRBvwX+yZabewZyCyzKv0pHk/j5GI9QDsRW8GoddLRU7hbfT9yk=
Received: from DB8P191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::30)
 by VI1PR08MB2832.eurprd08.prod.outlook.com (2603:10a6:802:25::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Mon, 9 May
 2022 15:43:19 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::11) by DB8P191CA0020.outlook.office365.com
 (2603:10a6:10:130::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Mon, 9 May 2022 15:43:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 15:43:18 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Mon, 09 May 2022 15:43:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e2827465b13da391
X-CR-MTA-TID: 64aa7808
Received: from f3c4869e07d0.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8584C98E-989A-4CE9-8D2F-BF2A5A29596A.1;
	Mon, 09 May 2022 15:43:08 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 f3c4869e07d0.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 May 2022 15:43:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzwFavsWewyQiLhWoSDeERw6hSHu1b7SdxaS8LOVlC5HEQL0JrwwhWLfxlO2jT5hsKDinhenAKjja43L5t5Xd0BHeWfg8teWcTUknb4B8xM7hd837nNnzqKbkoT1FLwB43bjM2DjcVOhKcLJyu8vzs74RpnrKFEjYjGZbrkS/+ZVu+z5Kbst3RQ92rmBbNtlAOXrm+HpjPhlVqod/IV3XVALhwHqsLaSZyyT2gSbmbcnz06rBtuGpLfS4N7g8RaOAx9FaRDUE8XfhPyL6enGb8ETs06fd6erMPCF6Lba0LyMiltXkH0wNigYXDsfZ8H4BzFJrIDx9rn8FVHpjNVUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4qQOvNmJeS6CP41OTxpgegFTHppC2AeK6N+LI7Zk6Q=;
 b=SrZoDba83YI1n/CtIDa4uMGHZXmsdMshQ50PTlWW4QXTP7lcapCTXqC7+0CogWGcD95Q6P0dSe+aNWbMqf17jgZr1rscJlOCdxpYbdLuHyl8bME8sJZeh9uZk022vo4KlQWPOwGHFCkldQrPZIAX+ap/y9UaZxpxptb+vPlcn2Gvg1DrvemmwqQiJKDjXiAimfj0s83/YiCQFoDdb55lDkryUdtp46JqpwM/n5PgITl6WTUmQ8RwZgH+tJQspT9NqI9jcYM/bqKjDUOzR1t/JiMgkDM8W5GCdUqHiQnTCptOsydhOSbtbFsoQE787zcjwODaqFR8+tHNOSASRH/Prw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4qQOvNmJeS6CP41OTxpgegFTHppC2AeK6N+LI7Zk6Q=;
 b=jfdjiZZQrvXn8I6zMprT5UGXO7P45sap7TcgX5/k8youLtKGUfDPyrdY/aHEwPEKztfOVtP8mozkCRz4xYqXVrF/M6Fjh+UdKQSK9UONuOHBl5swWYT5DBPPFRBvwX+yZabewZyCyzKv0pHk/j5GI9QDsRW8GoddLRU7hbfT9yk=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4852.eurprd08.prod.outlook.com (2603:10a6:20b:cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 15:43:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 15:43:05 +0000
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
Thread-Index: AQHYWpPTnFu3WGfk1EKQOEqfK1rWW60WkL+AgAAxC4A=
Date: Mon, 9 May 2022 15:43:05 +0000
Message-ID: <247E48CB-975F-49C0-BA08-03474C4A5229@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: a1a02470-f757-4f58-84de-08da31d2a3f3
x-ms-traffictypediagnostic: 
	AM6PR08MB4852:EE_|DBAEUR03FT062:EE_|VI1PR08MB2832:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB283258A1E7635991454AB2B29DC69@VI1PR08MB2832.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IMwcMAJA3WsTqepSFmYQD5GewAq6jGriR2WGZcHJqsflUJ0iusxGDkjibyXAymEiRV48VJZgeDauws8Z4h9hDddOCfjbkPg56moeZdg4ybgKisikeZtKdSZAKUrS9wfO3iGIXAYRwsdRMiGc3mVBAuQwSnKTVJyTiNkn71aD99M0wUSjI0xKIjgAgRk0wPJweJ2khVMQXQlK/lZeBGgqqpHDnglnQWHLuxAsBvEwZ3gPyrHJuU5W2JZb0GD82hWO4Fpv2Qf4dC7jiU5DwHcKad2xy5fSLFGLgipp+aafJRAKOSWqdxj+OnaoSV/uiUsQKtYttekikI3JuITpXm3xWUthat2msMcliu2GR9jAvH6QbAvYJuvETL3Kh6ewLivT1yiwQqvKq7CGVsCHYwbqxcK9oMDc9aPawonf60AO3pRjIEYVw7FCcbsnvDBFEoM+IthgZpOi6EIjcEL7arqXFv+isbC4QhxBzxX3jS+eTuF6WxHOgZRpuufra/HgdrM7MK07yHuNjWvdnqdalfj8V9Ib+EG0Vbz+giGcmsRuC7l7/16LMlIcYimTeECym3yEuGC+egNtTOTjEZLWM2vS6tm4taYMnNS55TuHk32oPPVvyFPwJvCmPvfmDLHk9ijzre4/skolFP0vRFYrrqBH+dOBJBhYB54aDQ3l3QuCaet9ZWyIEQ9IoZ61asozJZNyshhKsqUB5eVDW/Ja+lHhi2C7jVnSQBqNvgNXSr90YcHnRWbRUd83Zo9GQ+bE0s8bIYbZpuucHlhN/ZLH3FwYIvMmY6oaguT38Y898+v+lQr6Lbgvgf0HwdbR6b6P1PI4AoNF+7cClMuZpY+UVkjST3oyZAs3DMms6nBHZ+Y9vl8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(26005)(2616005)(91956017)(122000001)(186003)(66556008)(4326008)(8676002)(76116006)(64756008)(66446008)(66476007)(66946007)(54906003)(2906002)(33656002)(5660300002)(36756003)(6916009)(316002)(38070700005)(6486002)(508600001)(38100700002)(966005)(71200400001)(86362001)(53546011)(6506007)(83380400001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <40597CA01D12084BB5BD059BC4A95CC4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4852
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cfaaf208-1c3c-4069-d89f-08da31d29bf0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bXMzXxz4PBwZf7zU80tGlusQk6fmTfA8Irs0zXA/73rV28YNKDmyF+DDMzuVBJcmKKxoOXYjYcdMffpD8B2U0vbcIMjfQvkVjQsZ3Y1USsrLnZwrDSKG7Y2bs9GzT1XJbwwEuxtD6bafEs2XCkNWBXBqg7bUsiDUuROMWrkj1f2giUfxGmkd8n2iIuGAG07FyiGjE93tp70hHwIY0MFTVmtoqljp2LrXeFesnHPL1kgyK5MCg7BpsaVZfHxPmbhjACf99lJyaVvVQHnMmV2IMGDJSB5CH0jEhos3zlRWEqOSMqwBEp/1KJMsBxtmCyF22pQbLrQLGxIrlmeRBqDBCsA5KVbK+JhAfMDbbWLKvg0XqzlPj9F3mWKY5mGWTf9fxvB/By39zakuCqO0RgvbCAGOeHScN0CCU6DaEGsBOx7r5Wa/V+dxb7ZEA7xzAfef5d+AIN7+6IC++W5jVAqCzKRqtFLE2cPH49Uy+ilmJw6R29ICLg+6nfBvPbrB0EC14ecTpidOh7OJQFp71r959PZmGm/f/pxCLLgvRzHSqSHI0fL5lPNVc5a5nJ+VB573VSEwJRsPUbzERGB2Gn9k8btDYUBuo8HNQpFokDmp6T3ucwGTC0cbsr41usX3oOaiqu/O/JpT1pyStkVJ39Gp4ighwP7SX5d9k4suf5L2N/gX1lnWxJh0gTYbdgZaXIVsLidz3ewIufxNj75hHvbH17Bxy+qo7NPpeT3iAIeqRe8ec4Mx7TZlITSO/FIGHbJGeUVbReW4shwGZca/K8OEaocJCOJdzWSUpSQ8TN6g6Jo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(82310400005)(107886003)(70206006)(70586007)(8676002)(2616005)(36860700001)(6862004)(33656002)(4326008)(26005)(6506007)(2906002)(966005)(6512007)(356005)(6486002)(53546011)(508600001)(5660300002)(8936002)(40460700003)(81166007)(86362001)(36756003)(316002)(54906003)(83380400001)(47076005)(336012)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 15:43:18.9885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a1a02470-f757-4f58-84de-08da31d2a3f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2832
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 15:43:33 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7259

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

Using current master status I can confirm that I have now dom0 booting prop=
erly on arm64.

I now have issues with the generated DTB (command line of dom0 is wrong so =
I have no kernel logs, just the prompt).
I am digging into this and will come back to you.

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

