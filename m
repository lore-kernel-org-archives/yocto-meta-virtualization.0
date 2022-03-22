Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9644CC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:44:32 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.50])
 by mx.groups.io with SMTP id smtpd.web08.8324.1647945870266927546
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 03:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=S5QtsWKH;
 spf=pass (domain: arm.com, ip: 40.107.2.50,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lCjtno9ksuSFEUc6WeOBgwH2tsUI5J4/dNXvUz1eFo=;
 b=S5QtsWKHLLIDl36s5Vspq0d/8dZ8knEW/R0pBXSx432ZjrUPmhxaDwIhWZOzQKLpRkvh1AEU2uFk8guzrxXpQOjbmQCxnuZSEzUrGSuMAK6IyRn1ureGMuQdmgcImj5AWlUrFlPpNSOBbJhNMyuqOG1L0+dIrjJEYodvTdNCC+4=
Received: from AS9P194CA0003.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::12)
 by AM0PR08MB3617.eurprd08.prod.outlook.com (2603:10a6:208:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 10:44:26 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::4f) by AS9P194CA0003.outlook.office365.com
 (2603:10a6:20b:46d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22 via Frontend
 Transport; Tue, 22 Mar 2022 10:44:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 10:44:25 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Tue, 22 Mar 2022 10:44:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b553c44d7ec362ac
X-CR-MTA-TID: 64aa7808
Received: from 049894cdf6fd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D3B1C940-9B00-4D3F-821B-C71BE96A0C39.1;
	Tue, 22 Mar 2022 10:44:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 049894cdf6fd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Mar 2022 10:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzHRB/mFLX77hqBF0sg8cQbCfRgy+qr/FW5tVxT2cv9h483YLtBV5yEFbxrQXeL0rPh+SyxWojBhtR/wKSTCaTyAJXJ0HE6ND5KT8ftNyU9xm6whVMeBY/AlS53100Dz3Fwg5+N7tJzo3oYR/WTIbkTzPoX8GWOrSGoyulNNo3V7f6T5E++MYlaPeLpXu2zJ0HmhcXw5cyBzQ2VOo0Sir/PMMrTw7ExsxKJpQMOgHx9YWkEGCETXO8+DkksoIZtxsd+dFeJGGqMTnuoQxGwFQjw5KtDrJXxN13RiUMHghnNC1OXu2bmLfdSg/rSrz0L8Ft8nL6Kk0lNrwmAdKf5J9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lCjtno9ksuSFEUc6WeOBgwH2tsUI5J4/dNXvUz1eFo=;
 b=ByXv0gzHByf+pKZHiPkJoH79XKb7CNab1Vfn03wCpexDEbwv8faKdUFkNAABOgnT4K/AX1lLA7AG+Al3MB028Nz/mB23/oWOZR/gBMNc6swPsvz9KMcGkIiBCV1NkaEW4mgcl7I468ywziIZ+9OutYjxwETCADEuoZh4bpS8Ruf56Q1ONiC4KdWMUgvQGedhUEX+aFXLjdUCMkZMyKAMXJd2c6/kjHeSU+hGPit0bU3qZvselPRsGM0deMoycPZF3Q2Ei8pD7ZzPM6HVP0BjckLHxae3cs/alkgjR7SagJmqr9aPBQGEaox4PuihMQdzBnYKvylrYS16muBCWxgTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lCjtno9ksuSFEUc6WeOBgwH2tsUI5J4/dNXvUz1eFo=;
 b=S5QtsWKHLLIDl36s5Vspq0d/8dZ8knEW/R0pBXSx432ZjrUPmhxaDwIhWZOzQKLpRkvh1AEU2uFk8guzrxXpQOjbmQCxnuZSEzUrGSuMAK6IyRn1ureGMuQdmgcImj5AWlUrFlPpNSOBbJhNMyuqOG1L0+dIrjJEYodvTdNCC+4=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB2848.eurprd08.prod.outlook.com (2603:10a6:802:23::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 22 Mar
 2022 10:44:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 10:44:15 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "pauloasherring@gmail.com" <pauloasherring@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Topic: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Index: AQHYPdhS69dDmEOgMUyYUvghdSytY6zLN9uA
Date: Tue, 22 Mar 2022 10:44:15 +0000
Message-ID: <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
References: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
In-Reply-To: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 58385799-74b9-46d6-0e64-08da0bf0ef1c
x-ms-traffictypediagnostic: 
	VI1PR08MB2848:EE_|VE1EUR03FT038:EE_|AM0PR08MB3617:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB36172EDC092E1EDCF8A349249D179@AM0PR08MB3617.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aboHtEqVrQXp/VLR4f78YHNnK790R/WrOxWSiRnJ1calWPDi9Gi97HMuTXXS9RcRSSReEPI2mP+3ozp4iPIQyhgmI/U1U8WcIBYsGVAUJHxfJV9OWtK+Y9JCj2j7JScEoNQxtuW3ps0w2smDqYD4GTD1UdPo6sOZ14EYu6dVYdlkn/QbCz9JgzBRMIaPdoaNdyJW8D6al6E/GRbTg4nc+oFrQ4GxFUqcCCOY4+ySIygvYwG7bf8i41KnDhRQivIV8N6FbKf9oO1YxkAlrUg+D9eRtdCmtmH1M0uVqhDKyak+OBxItMSWsS0oo1Dt2fqg9H6dRM5QcgNOp7rF+ybt7E16tDPvnMqmbGrHjakLqlUozjRkEMh7afPH828tVNf9XCt7xLeAeFDwvLwHBlR7K4HgbTgrznX4YMf8PI8SNlJu3wnqeyDCOSWpfx/t/cMTe5DCKuWgHxv9FfHGPVG1h1rSiMR+VxiebL5v0hIEd7aIESv0WHZfHsumi5SHLu95NgiYtY3YZogdmMlFuvEB+WNLvo6BZLgEbndWP9aesQO0Bar0yazufMaLoeYoaSeZPVg7rp0/pQChzFQscgnVDaEPQE7rvZOT86fsOit9ugTXjoOEafBfc+RdKblofsi4xhYMSwX1YEd8RBWePOQDI6HEcCKSuNyMtBRUQ96qgJIEZrMe9oZ+kbyw3/6ww+EgyJkeyhnZ0VWC5Wrvou6NsQBOQQf1kqKShEjFm9THaWxtWaJYExZIK9GJJqT2m/TK5RL/uLw/lvqcwth6qxPrsYvo0cIkghePn0zzTDx2ncv8wKM1eNEl8Qm+xMP/3JlXL82uSE0AI3vap6YV66mMYCQdDaV8uFHx5hGeAIq53Uw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(6512007)(53546011)(36756003)(6506007)(64756008)(66446008)(8676002)(76116006)(4326008)(66946007)(86362001)(316002)(83380400001)(66476007)(66556008)(186003)(26005)(2616005)(91956017)(2906002)(33656002)(122000001)(6486002)(71200400001)(966005)(38100700002)(508600001)(8936002)(6916009)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EE93282104D22C49806D716D53ABC10B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2848
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	05fb3580-89f8-4d84-c13d-08da0bf0e92e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o8tQC+MtZRPzv77qBv5/cylFcmVgT5Jfgrjy45LqQSRvVLUKIGcdjbmrOg0j30N97QjQc/X0+nbWixBtjrnG2t9Y0k4Ax6Jvgw5Q0mqfaazIHbe9qMu3souZ4VsGbjtfVQeSIY54Mbag6XZUAbzLCkZaVGatRpV8cP+O7JJx7J9Uj0E0SvvklRf/6jUlzoCIyumS69ZaVuRYWN584+gLLyGZ6tye1yWoGrAqzohVuz42nFp1X0buR23nHU7GKUOQbcfokx6jF9YKQRfftW39fVpJ1Myk98siJcZIm3lG99MO1jPvftF0El0HROsxpb57+MNOg/jPGvb4LuqvblXh29oGLsb/CQJ8M6A4E22d+HoBDNxNPJQYzLzmlDaknylDs0Iw77v7pdJxknlATpMDCv8wtyS9I3XNszGwt9OSFcye+9KYON530D63WRSpqBk8dFeQtnThdEkRGr/0T2vOATMmqGrdrTVaovPWljpLgBWh5NrUVEp2t6C7Ky5YlCY+LAmraC44sATDuMixVIIHh7KhhFhdyQxtMOmMLnoWeyE7xtMRpFGi2f2WQNZ0PBMgVPHkju0OFSaCv4A2nqOvZINnDM5bdqDtyZBrWGdUmuN/kbRjcM36llM5U+XF9S7BHzHYxC7CZHF2eql3/KiKViNWNExWTMob/xa0orBv00e6+nHbv0pdqDm6RKNmJwMZLmVfUQjM0iS4dKNIIBH8Y0YVzNnXY2jyJ7WxoMDrnnEDzN0Gobn9fDGR1cWgo7gBR8qu4BQRPI0+bQuPhOPyiJVVRVqR61tRBLOBO0K6PTY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(53546011)(33656002)(5660300002)(70206006)(70586007)(356005)(81166007)(6512007)(316002)(6506007)(8936002)(40460700003)(47076005)(36860700001)(2906002)(36756003)(508600001)(2616005)(83380400001)(82310400004)(6486002)(966005)(86362001)(8676002)(336012)(6862004)(186003)(4326008)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 10:44:25.6902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 58385799-74b9-46d6-0e64-08da0bf0ef1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3617
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Mar 2022 10:44:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7096

Hi Paulo,

> On 22 Mar 2022, at 11:33, Paulo Sherring via lists.yoctoproject.org <paul=
oasherring=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Hello all,
> I am a bit new to meta-virtualization and to the Xen project And to
> virtualizations, so please bear with me :)
> I've been trying to make use of the xen project, currently targeting
> qemu (and later on, rpi4). After messing around, I was able to boot
> dom0 and a domU.
> But, I had to add the xen-gntdev to the `modules-load.d,` because
> `xenstored` was failing to start, due to some missing connection,
> probably brought up by xen-gntdev module.
>
> As I am new to all this, I was just wondering if this is by design, or
> this is an issue (and therefore, I should/could submit a patch).

No problem at all and thanks a lot for the feedback.
This should not happen and should be fixed.

Could you tell us what you are building (which image) and what parameters d=
id you set in your local.conf ?

Kind regards
Bertrand

>
> Kind regards, Paulo
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7095): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7095
> Mute This Topic: https://lists.yoctoproject.org/mt/89949013/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

