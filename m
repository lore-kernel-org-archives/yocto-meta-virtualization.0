Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727A5C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 14:51:44 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.82])
 by mx.groups.io with SMTP id smtpd.web10.12887.1699368694099257047
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 06:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0HSJiCG3;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0HSJiCG3;
 spf=pass (domain: arm.com, ip: 40.107.20.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BNgAcjtVei4POfxplI2o17MOTb03bnIGkPGKG90fCDbllw3TkY2R53u/ujNQdWbzfb+eHOhR+N3HHNC62J5gQYUnFP218fqCmkVj5X8RC5/J1+VFkJkG7hpThiUD5y5XP3jXbJAc/fK4DZ0hxBH17q32KedAr/4ETqybyCDVyVSUrlnDrtc6faAem4Ib+kr1Zzz/EeJi5NTqKwn2NKBeafENY0wsLid+MYp9S4bAVcwGHDg9cPimMRRtXiIaabRRGt1e9Uu15UNsZgfVLiR4KQWGZxSVsNhv5RsNAYI6NFCB9pZA95nGi7jZEJp1ouZJEJByLS7aNC4wN5gFb6ljtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fELC8VLa5txLlYZOxKQwnFuKH4YOt7EJieiAawJLVBQ=;
 b=R+xeDD0I+P5ZKiYDfKhRyKxPuFeRXhHG8iUKYMGplHHZvKNDlJiV6AYb4E6IWQssvhZZ3qlFfREmrf+bTiag7j9HJVzTvjMHYOJpJUK+n3HHecUFwbx5uVFDvzUcBaXxpifpT4GTE4GX1RVY+xzSN6F1lkMNPJqqJWnVGCcw3ekMHDyFh0NBwXk2Jt96xEBai5zDEEvWhkuPSTy9/p0shCPsaO+vc7/g9rwsFhHXJXz4Pda0ez7e1DCBdI9TvF6neAKMfK6IG4zVWh7ECh1Z85LklaQVKvw2KS4TNiyLNnHk+LCl6JKVPFVgv5lc/9qVJ5xBHffBZgawZ9Aw/2SP4g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fELC8VLa5txLlYZOxKQwnFuKH4YOt7EJieiAawJLVBQ=;
 b=0HSJiCG3fzqP7uPBvAeiw3j7RMGPVXDoaO09T39HTH3MqRNk4H9RFrxXmPbl16Ur10+nlI2Jrqal7yAMlAJ9hbRLOp6mXQKJtev8+E8mTXRJhs5iHxyePPTx1R16HTIWOwyYKpbrdSC5zpX7iuVTIT+IUfCmcU43zNeADyyyRoM=
Received: from AS8PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:20b:312::20)
 by AS8PR08MB9504.eurprd08.prod.outlook.com (2603:10a6:20b:61c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 14:51:30 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:312:cafe::55) by AS8PR04CA0045.outlook.office365.com
 (2603:10a6:20b:312::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 14:51:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 14:51:30 +0000
Received: ("Tessian outbound 26ee1d40577c:v228"); Tue, 07 Nov 2023 14:51:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 574e0c13db6d8b83
X-CR-MTA-TID: 64aa7808
Received: from 298931adc002.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CDA4A5D3-C2E2-497B-B9AC-8DBFAE878934.1;
	Tue, 07 Nov 2023 14:51:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 298931adc002.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 07 Nov 2023 14:51:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McFsP5FMwJTzXF/H3flADK6uEcs4btq7Tchmo7X+XqcsbZ95Gxoryz26/OuyTCtVcpwegjIvnebbADiiekD/PEstPoX9fXennu/aLy0YkW4WDDThNQf1wBQG2hYeGg8/Y1DcTwemY1PnHpbQIx6fVwGw9pRcZD8vNKEY2fvyU7CrA/djurQdjp06rcdizzJbCo1G9vjlJboJlYaAfsn2kaKEcnirX81T9BgVyWhkpJsQN4jhnlDKmuM82HBcRO6VQYH6Y3DIyUR+lqxRKdtethXs+SHMYK6R1izd7E2YM97ALN5jIi8Ks9zb1N7sNjcN5K1NROlMXucR2iI3m06DVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fELC8VLa5txLlYZOxKQwnFuKH4YOt7EJieiAawJLVBQ=;
 b=kqyMTzwsnEHdXDIpFISJrXWn78p//s+RuxApbIaJAXo0s2L/m3w1NfnSSmFHFAtwuAcLsSZLlfsJVYnQKTB02KGbb7u1aw3kRoIJzOqM/NhAFw8jgFDjpla2EKyzuuIxAfgZlksjwffEJoOv+HLYzQe0UnMl8nP2GNwsfwai4gchm+NYyXLpKDJeVvqoT7QsOJjyZIt5sW1c225FGsTfe1+M+/DQolIKVytYS10YaW0y0EVKc9+lJ9emVAPRzPmsUtoUzZsJ1eFPD0odV2t4r11zqCLg4LVlRjMWqTuIQFOaUOw23mW2knLz1Zd453s53KwogabN8GW6rgvfP+pYZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fELC8VLa5txLlYZOxKQwnFuKH4YOt7EJieiAawJLVBQ=;
 b=0HSJiCG3fzqP7uPBvAeiw3j7RMGPVXDoaO09T39HTH3MqRNk4H9RFrxXmPbl16Ur10+nlI2Jrqal7yAMlAJ9hbRLOp6mXQKJtev8+E8mTXRJhs5iHxyePPTx1R16HTIWOwyYKpbrdSC5zpX7iuVTIT+IUfCmcU43zNeADyyyRoM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7926.eurprd08.prod.outlook.com (2603:10a6:20b:575::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 14:51:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6954.027; Tue, 7 Nov 2023
 14:51:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Joshua Watt <JPEWhacker@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH v2] classes/image-oci: Map image
 architecture correctly
Thread-Topic: [meta-virtualization][PATCH v2] classes/image-oci: Map image
 architecture correctly
Thread-Index: AQHaEWZiIgVAwGDvrU6OYAZ1wYgz2bBu0gIAgAAe3oA=
Date: Tue, 7 Nov 2023 14:51:18 +0000
Message-ID: <75A405BB-43B0-4AE2-AFF6-C87429EC29F0@arm.com>
References: <EA68EAA4-BD24-4273-8F76-0725EB0F2FDB@arm.com>
 <CADkTA4N=HDdetz=wMh80c9NSu5rNjThVVkGvi1HcDwit-cBN3A@mail.gmail.com>
In-Reply-To: 
 <CADkTA4N=HDdetz=wMh80c9NSu5rNjThVVkGvi1HcDwit-cBN3A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7926:EE_|AMS0EPF000001AF:EE_|AS8PR08MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 53df3648-b30d-4539-d8d9-08dbdfa106dd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kPHB/tsZcFX8r04WGWjt2GWfQWy0OcrZwTbnYvzH3rW0OnJD6Dr1kK/wYSOtN3i6KVbNivR55VFrwYzl92BZuChAgIXBI47zk2lL76kgRulbQSSNaLPl1zPjBXtPnc1FCyTZBLbKp8OtOEsvPbLW0l76N5YJQvrSNj3oB3XW075SxYgWWj/qreL3/gU/Azvqa/fanmP9dmz3e1+QCsSHpbp2hB/XxKB1BZEu2BZTqKOWRFnsPx6Hkr9PSBI9ib4IsTioWDQaMLtNZKnBKO8INtn1+Av8qGUxcepKlH/e1xSkoVeLuV5EAxvqoQl86VDlwdbWeh7nMFB41/RMKQIJxdAL4Ke9TO0a2Sd3Z3rmCq75woo3ze/PT9Q8sWh/UMkfjIZh14w7JNsgeGexErTPcfBbhxTOeQ+W13XyPQ/iB8JLPVfWYMsar+bHnndDkndqsVvfJgYhVLN2H6iz9pBVowetLRqIooxs8GgimqNdb5BjPV9Cp9npCA1gjbGG60hpKV03TGinIiFgls1A/Nw9kBnVTCNl0TKuJdXQh3SUQAL7N81gv7QffvkTkaXRi54OikEzeJ2h7QSIrNo2/R/USPp4ifUJvcqkQiJbZwDkoMajqZMHJy1P0g1M+82hM5jeqFJDfSEEOT9Rd00pgnE8HQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(136003)(366004)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(53546011)(122000001)(6512007)(71200400001)(26005)(2616005)(6506007)(316002)(66446008)(478600001)(66556008)(6916009)(66476007)(64756008)(91956017)(4326008)(8936002)(8676002)(66946007)(54906003)(76116006)(36756003)(38100700002)(33656002)(2906002)(558084003)(41300700001)(86362001)(5660300002)(6486002)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D723CECA6221B64288CF75E82D480C3D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7926
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a9d322a4-9b73-4283-a133-08dbdfa0ffcb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mc5oQf6NFVTihGC6pa2vnqNY00GUQGZ8n3bF68KmPVIEJovUSTwYfyBwcWPAOcWxhZSvfxNjD0zHx9cTgK46CSPPrwAoZphyid+9sFPBegnmimvuXysenZxQ9ZXwqNfUp6wyU8jgk0XeWRCS+/XO4UoMg3Odhl9HVa+H/QGHviL3Z5fCaH99SqChK89v7+lJ4QYemgTXEW2hvDHB9h0jTw0KiW59sBaq9ZTkKmbglTFUNSm8R5eLdv1RPoYSWZSZkdNLNbQOQWC8qQK4ODgUWhLpL6VefyPYiIr9rEdCEhQ5VbSE4xcxDFZBpzxrJq2TVLTyoMEQSZ8FR0EwPWD6J6QMwpmRJHF6Tscy4UVBGVMKFELE3HH/fZVEuMg61WdJ7lYZU2g3dkm+AXSRzHfv30T99iN5jccDlCjBVjiE+dxMgNGHIDGT5X2gyc6+iIb5IkeSah0N0qiQrHY/Gf+mn/iLia4CZSKD7+cysePs9BVf4b+o2HXfIwAqUU6Xg4Ing+dYBQK5R847r1JwQjU8SO7ELkO48l09S1GVqvMT6kasa6ksR1n6cB+5znCcvXlmy38jEFfRfPIKr9LjYu0DNZNRdJLee3bG/0ozT2/fTWGuJchf80RLjQovG3P8rQI2tz0heKiX42cbK5B3F9roMwcsJ1HSKlM7XHiZNcbbvQd+Cffe0wMsPJPq/iSsywxeWY70zSRIF7M6rjL2QRoKwk5BuaKSCAMraI0j/HxDd+v2x7gYgXjMs8xVAp6fLK4M
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(82310400011)(40470700004)(46966006)(36840700001)(47076005)(40460700003)(26005)(2906002)(336012)(81166007)(356005)(82740400003)(36860700001)(41300700001)(8936002)(8676002)(4326008)(6862004)(478600001)(558084003)(6486002)(86362001)(53546011)(6506007)(316002)(70586007)(70206006)(54906003)(33656002)(40480700001)(2616005)(5660300002)(6512007)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 14:51:30.0519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53df3648-b30d-4539-d8d9-08dbdfa106dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9504
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 14:51:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8444

On 7 Nov 2023, at 13:00, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>=20
> I'll do both: branch and revert there.

Sounds sensible, thanks.

Ross

