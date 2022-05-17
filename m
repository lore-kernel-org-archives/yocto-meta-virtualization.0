Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FC8C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 08:16:31 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.76])
 by mx.groups.io with SMTP id smtpd.web11.4726.1652775386971776323
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 May 2022 01:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=xyLKAYf7;
 spf=pass (domain: arm.com, ip: 40.107.22.76,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kGf8AUQWZaWCdT03ypN6ZgI8MIoQvySqvhNJVsBwHAMqTKLBKJx+tH8xoMmM6bR0h8HCHBvy3e3FrwtSQvJDZxxgfVJ+pMzvEk29IMQpnQpDKfEhxe1L6xRGePOgfDGaLr4fdluNZoJ+CYoUGJ8rCEgHxMledxUzIGkRfC5G3HlfBJAbzqYqxfdyKFQA9Ly7y6s0wUfs+k6PN9GdjRnxTvi32E+jPvio20IG0B/yCbZHs3DHhGdI82MPtkN6iQGIhKe5JIR9YA3Rsp/xGR52xroqIJGBmvlbVhBS19ynLwSFRaemwOrHw935XgIRpjqKIUHrmhkpVWgw0TFGBiIIgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHHYiegCrpSFG55E/p+4fsWyL7s01qMWQoz/M5R7eNk=;
 b=cIyJ/fBjtcFGh/ix3mytfRAzb0MuhKmij8zDHBkRB4u/KTrkdPBDz2AlzPbh9re1fP+PTJ2STUeue+Xnt+tzihsnrKSAzumddIOjLPJ14hXlvJ3AX9VNZtNvRngTVdVPkMeAjCbfBlL+YOHCxbtD+nKpi+9xpu7EtdaZW73nfIIKPunygXcvz572WtgpqzOurObIsu+T4k4U323NfDMyQ0pynq2vN6ijMVWcPQgHZxjQyJ5N/I5Q4lQ3mmQRbx/JdtrskdoHUu9sfepa2uobZNHMnRBeJ+reyEQThqlzeNkzrBzvyQ9W9Ql6Q6atV0m3Ix3O0CMQUG2ofCw5avOzqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHHYiegCrpSFG55E/p+4fsWyL7s01qMWQoz/M5R7eNk=;
 b=xyLKAYf7pLjs3yAMbrBu5RLalBkVmf5RrlcLPPKtyjPmUFrtSUfXzag68TvQLFXdemzEJC6Mub2cwpLPOh8Y7WaX5F24vrD4pQHN57zaTouFbJk31BjZFjQqHL0q5OawE3sjDtGVkEmLdu7H2SWyE4hZo9WNbTEAn698kg6adgU=
Received: from AS9PR06CA0201.eurprd06.prod.outlook.com (2603:10a6:20b:45d::19)
 by AM6PR08MB3639.eurprd08.prod.outlook.com (2603:10a6:20b:51::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 08:16:23 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::cc) by AS9PR06CA0201.outlook.office365.com
 (2603:10a6:20b:45d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Tue, 17 May 2022 08:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 08:16:22 +0000
Received: ("Tessian outbound 6580ae46f51e:v119");
 Tue, 17 May 2022 08:16:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c65867b3ed71175
X-CR-MTA-TID: 64aa7808
Received: from 64a6c2dafdc8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7327D0CD-C6D3-4A38-9A76-DE4E49D5F9F9.1;
	Tue, 17 May 2022 08:16:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 64a6c2dafdc8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 May 2022 08:16:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dynQPNyE1pjKMwPz7ZRqiVaHcPHaFN4uzAmW5E+EflMXKIiRdU+wEJVbp7BgVvRIodDHM6ICy81FGwdD3jouOBnP2mcxVaWWI782XxgvRngHKQHRkTqGiK9vR8bymED1fUzlK9FYcFXOvqvtzz4dmIQ3hGXJqgAnNqTK3rRi+bbwAmlQGTUvA6ouVJMER6LLemaB9WV+rA0ghWNoQC+y+stBC8WqM1g2POwrZUKM3QSYMMVtxhsSGQhEpEtAOpa9z4XaFu4dWPGY9ygZDBeZ1+zKE12b+GvO08UTbtnFoU7Ps9BNNwGDPkBoxcvrEHBaWNXisf4i1SwbRxc9GlduIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHHYiegCrpSFG55E/p+4fsWyL7s01qMWQoz/M5R7eNk=;
 b=Cu8VX8q9g1hT8UPnOB9lWJend0vFqJMCxnS1jkkyUGwYm5VrLg9D6ojKDTYlU+4m9XBhjpBxvpyRLZHJyF6y05zuDGOGHwppgh7stXB/vbjkGfr2T15steXvSNYvDglI6TAlQ9on6SoSJoee4VFQGUwXJpR7aiGMf0D+T/XlrAYRR10k4MhSS323voDXt3kSKSmy2X5ijtlK4U3QPnsdoaI/E7zXJqpZXzkJx74FRAjz8RJF5lTHAPiAqGQbbj2lr2MzundSzZPVg3Wai5pu92slDiyElZoKdzjBvN/vwLlNI1wcxJAcLLkpkkF2StjhgLCKJI4262SWHKT5u7YoQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHHYiegCrpSFG55E/p+4fsWyL7s01qMWQoz/M5R7eNk=;
 b=xyLKAYf7pLjs3yAMbrBu5RLalBkVmf5RrlcLPPKtyjPmUFrtSUfXzag68TvQLFXdemzEJC6Mub2cwpLPOh8Y7WaX5F24vrD4pQHN57zaTouFbJk31BjZFjQqHL0q5OawE3sjDtGVkEmLdu7H2SWyE4hZo9WNbTEAn698kg6adgU=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7400.eurprd08.prod.outlook.com (2603:10a6:10:370::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 08:16:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 08:16:14 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>, "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH v2 0/4] Vairous fixes for qemu
 support
Thread-Topic: [meta-virtualization] [PATCH v2 0/4] Vairous fixes for qemu
 support
Thread-Index: AQHYZIOiSs6iNUcYDUexyp/9kWxJDK0iwlwAgAABXAA=
Date: Tue, 17 May 2022 08:16:14 +0000
Message-ID: <1A72E4E2-7DF9-449C-912A-86324874AE0A@arm.com>
References: <16EDC85ADC96BC5F.7065@lists.yoctoproject.org>
 <16EFD632AAA4CAF6.1719@lists.yoctoproject.org>
In-Reply-To: <16EFD632AAA4CAF6.1719@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1fc18d69-c414-4e22-8f5a-08da37dd87b0
x-ms-traffictypediagnostic: 
	DB9PR08MB7400:EE_|VE1EUR03FT046:EE_|AM6PR08MB3639:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB363951800EA2B87F63A28A999DCE9@AM6PR08MB3639.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 igE3LVdx31r0XOJoHqNE5dAyhHuugj0BYVS8G0DUxmfVIpe4IZyLExdegwLZADB3nFEIDl+FDoo36fYJXqooR88mRrjZgh3tpo1826xr3ZXnTa/IsvLPEBAVxqc6btUlu7GRnucpi0FmSqeXuFEzrUjCal+kbc86fIIt7UpIHXpKrUiDw95rqtLeKOuNufndTES6nRhvZOxZaa9PCetNHTsbnboC3j6m7D7tj9vGb4pFtykUm2k2Rgfq6MTxSgPIwFBTpAIvyACVsxbggi0pWWnIZAqnFAf2JRLYOweAE1TV2I9Wwr0NkH9MA72MLfiecQoxPChV92fuC1RuUSroYLIr1s65ka11J8cjuEiowSAcFreRfLmh+ZqgxxawIh9CfPMueRnz7NTroYng3S35qybGaYvWLML1QFHEqkxc8yqhYp/elF2P05cPBBRbFjsVp1su+3U/o8YQjjPPHYcnuNn9+dKCpMdnrzpYq3zeNvLzQJaVhSXjEq1XuynjFEivWINDkr1BI0E4lj8anVCwSxuBjfZ9CX2YJh1SBTKPx9zUemttF2NR9rfIqLzKlBBGIv52s/RPTG5P7ubsQhNtg/8rIevppM37ZHwspDOnZc1B02+VL88+2MpUhjoSs2IJS+546VpZG//Fj7s8dpwaW8Th+m0S1knYKZVIMvFtC+NoMmmI0yGXuo1hYqAbuM6nIhtiNFQQFSoNVMiDuVVMU3Ktc2swiqp5cub3zYDOEtRh0mOCPsTCBUsvjWdM9qoTaq94YG6FaLBS0mMxiOiDM1kRVZ78J3FoNwNolGnTO4/M7RpZcZytjT7FxHZBt7RTRhhIitpLxBzlPzkg7camaowzjcPb7B5xpTkczq9Riyk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(508600001)(2906002)(6486002)(966005)(66556008)(37006003)(66446008)(66476007)(71200400001)(64756008)(122000001)(5660300002)(66946007)(76116006)(316002)(38100700002)(38070700005)(54906003)(8936002)(8676002)(4326008)(91956017)(6862004)(33656002)(6512007)(26005)(6506007)(83380400001)(53546011)(2616005)(186003)(36756003)(6200100001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E9F15B2838326478F7A30970B5E70CC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7400
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ad6ac205-7f9b-4685-f376-08da37dd82bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	as9Kk55KIOEFFmj7wSIklClN6PzhWuGFAdZeaZ1G9k0x8bhJyGzx3463GIUZo+iuAeMaClE6QEDMvRDz9oRQKYg+CXQ7L4maKYcBgo3L/mH38zFrW0YuTSlnbQCuyJFe4Z64+Pqhkt3xO8/UPblADdsRrGacsUURvvgdIXhV/UF4xOAYY558Lx4Nb+b36DC/eCfi+nwbybCFvhUsivECWj6A1wrGgijYPSGeywQDfZ3oGuE5JGeroOh1CVUmZQVlnHhLCqLsDLg8zqifMYpt4nkEhIqvvyBo508qfBY9CuoiHNaA4+zTqr4WxjL5nqKQhiP0BHDgLeOJQCtZqtm0rnCFnt7U5HrvAysoKciduXBDnTHN5rI6PuE3ciT2MiLEHExVo91QBupcmdnGdxO0yfNtTu4aV84GfYVfDBs8n/C0Gi2m1+qOlJWWb8O2tenP6NRXG7bDuOlwRybOLW24mWUSdEhujkIW0o56HoM+qQ23nY+rTaI38iFyFcKxwpecYrfdFyvWF7E+vnMUrBnNz6ZQP0Qr+BvaIAH2IzZN2RSKDbr1hx1uGybNFNIoJRjsSY0WC5vqWDPeN8eLDRtymZvJgcEdg5qX3CoSu0Mdg4xTEMso+u1VX7GS57yZzSAF5lRjdYxR0okBAg7EwhLDIrrbqmtXnt8m/S/xDdO6tAFwL7RaPeLJe8yr67AW948+JGmHYO8rQ4CpN5/n44awalpkPBt53JsZqW7LkZHcGISJsvfYZjwSD2Vgu6wWcsgA1MTYsXs5utO6wnnr7plJulb+p8kjWSgHtVXZe3sCxQU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(81166007)(2906002)(54906003)(47076005)(356005)(336012)(6512007)(186003)(82310400005)(37006003)(316002)(36860700001)(83380400001)(86362001)(6200100001)(40460700003)(6486002)(966005)(5660300002)(508600001)(6862004)(8676002)(70586007)(70206006)(8936002)(4326008)(33656002)(26005)(6506007)(53546011)(36756003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 08:16:22.9113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1fc18d69-c414-4e22-8f5a-08da37dd87b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3639
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 May 2022 08:16:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7281

DQoNCj4gT24gMTcgTWF5IDIwMjIsIGF0IDA5OjExLCBCZXJ0cmFuZCBNYXJxdWlzIHZpYSBsaXN0
cy55b2N0b3Byb2plY3Qub3JnIDxiZXJ0cmFuZC5tYXJxdWlzPWFybS5jb21AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IEFueSBuZXdzIG5vdCB0aG9zZSBw
YXRjaGVzID8NCg0KU29ycnkgZm9yIHRoZSB0eXBvLCB0aGlzIHdhcyBzdXBwb3NlIHRvIGJlIOKA
nG9uIg0KDQo+IA0KPiBDaGVlcnMNCj4gQmVydHJhbmQNCj4gDQo+PiBPbiAxMCBNYXkgMjAyMiwg
YXQgMTY6MzUsIEJlcnRyYW5kIE1hcnF1aXMgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPGJl
cnRyYW5kLm1hcnF1aXM9YXJtLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4+
IA0KPj4gVGhpcyBzZXJpZSBpcyBhIHJld29yayBvZiB0aGUgcGF0Y2ggbmFtZWQgIltQQVRDSF0g
eGVuOiBlbmFibGUgcWVtdWJvb3QNCj4+IGZvciBhcm0zMiIgdG8gZml4IHNvbWUgaXNzdWVzIGlu
IHRoZSBxZW11Ym9vdCBzdXBwb3J0IGZvciBhcm0gYW5kDQo+PiBpbnRyb2R1Y2UgYXJtMzIgc3Vw
cG9ydCBmb3IgaXQuDQo+PiANCj4+IEZpcnN0IDIgcGF0Y2hlcyBhcmUgc21hbGwgZml4ZXMvZW5o
YW5jZW1lbnRzDQo+PiBQYXRjaCAzIGlzIGFkZGluZyBxZW11IGFybTMyIHN1cHBvcnQNCj4+IFBh
dGNoIDQgbmVlZHMgdG8gYmUgZGlzY3VzcyBidXQgaXMgYSB3b3JrYXJvdW5kIHRvIGxldCBxZW11
LWFybTMyIGJvb3QNCj4+IHJpZ2h0IG5vdyBieSBkaXNhYmxpbmcgUENJIGFzIGl0IGNhdXNlIGRv
bTAgdG8gaGFuZyBhdCB0aGUgbW9tZW50Lg0KPj4gDQo+PiBCZXJ0cmFuZCBNYXJxdWlzICg0KToN
Cj4+IHhlbjogRml4IGNsYXNzIGluaGVyaXQgaW4geGVuLWltYWdlDQo+PiBxZW11Ym9vdDogRml4
IGNvbW1hbmQgbGluZSBhbmQgZW5hYmxlIG90aGVyIG1hY2hpbmVzDQo+PiB4ZW46IGVuYWJsZSBx
ZW11Ym9vdCBmb3IgYXJtMzINCj4+IHhlbjogRGlzYWJsZSBQQ0kgb24gcWVtdWFybSB3aXRoIFhl
bg0KPj4gDQo+PiBjbGFzc2VzL3FlbXVib290LXhlbi1kZWZhdWx0cy5iYmNsYXNzIHwgMjAgKysr
KysrKysrLS0tLQ0KPj4gY2xhc3Nlcy9xZW11Ym9vdC14ZW4tZHRiLmJiY2xhc3MgfCAzMSArKysr
KysrKysrKysrKysrKy0tLQ0KPj4gcmVjaXBlcy1leHRlbmRlZC9pbWFnZXMveGVuLWltYWdlLW1p
bmltYWwuYmIgfCAyICstDQo+PiAzIGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiAtLSANCj4+IDIuMjUuMQ0KPj4gDQo+PiANCj4+IA0KPj4g
DQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZl
IGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgj
NzI4MCk6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRp
b24vbWVzc2FnZS83MjgwDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3By
b2plY3Qub3JnL210LzkxMDE1Nzk3LzM2MTkwODkNCj4gR3JvdXAgT3duZXI6IG1ldGEtdmlydHVh
bGl6YXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0
cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvbWV0YS12aXJ0dWFsaXphdGlvbi91bnN1YiBb
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KDQo=

