Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.7969.1605106700127768063
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 06:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DYM3AqvW;
 spf=fail (domain: arm.com, ip: 198.145.29.25, mailfrom: bertrand.marquis@arm.com)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
	by mail.yoctoproject.org (Postfix) with ESMTPS id C520638C0483
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Nov 2020 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxItqDyqp28ZjMK9ufBe9aLvANcuYawRMxqZtA3i3LM=;
 b=DYM3AqvWEE/yCi9J93vo2rKgRUh8e7SHgvpDkE9rfPzQtVpdYuNWXcWALzmSr9VydxL1QmuXjmLVMBLH/3b5qje+/FEv1ZR77YiP5+D2EnIIkdCdxzh/PXkNf8aZFarka6GC0/3RwwdDzfdIflu7K/DoOYT7a4cXTHUg6nlGwpw=
Received: from AM6PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:20b:b2::31)
 by DBBPR08MB4252.eurprd08.prod.outlook.com (2603:10a6:10:c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 11 Nov
 2020 14:58:17 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::e0) by AM6PR08CA0019.outlook.office365.com
 (2603:10a6:20b:b2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Wed, 11 Nov 2020 14:58:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; yoctoproject.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;yoctoproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Wed, 11 Nov 2020 14:58:16 +0000
Received: ("Tessian outbound 814be617737e:v71"); Wed, 11 Nov 2020 14:58:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 986df5d7bfca2c34
X-CR-MTA-TID: 64aa7808
Received: from b65015bc9165.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DCD22721-906A-46B1-B799-645DB56B24F2.1;
	Wed, 11 Nov 2020 14:58:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b65015bc9165.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Nov 2020 14:58:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elQBjhaeX998CxK/jVOCr+VzXENSoZNW3CACynNrqvxmVrFVkzY1MK1JWgjXu3wxeYmo+Fb/ghKfN49PrvSlm/mM6RJ2XZRp+7H6QxYntzgWjOjzs8eiAWCB4X/vus8guL8r9/N3wZG1f9LeaLX5+OlQ20oRDIGOeXoqxZ/Z8qlG/dFm1OyrO7GjQQpmtx1PWp56NmMWL3o6YEkNzHw3xLshJzNObqFAa8oz6sax2TpyXpWro9rkT3r7+TS3Csn7pthJeP0tQHjIm9pSx1WLsRWQjrNcotBphkbVpCteVKEq1iQt3qmMYNb15cS/sRGBCDHwG426LMCS7EnmH7cluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxItqDyqp28ZjMK9ufBe9aLvANcuYawRMxqZtA3i3LM=;
 b=jdQLN/onJBrLPW+LfcBpFzjwcRK70yTHAcp048h0esYO0KK+Y6Mf3W07Uosi/orvLFDE069NHczpAXk51KqmZOy0qsyWD9L+b0uoZ/8uGV7USx8v3rrgam6MO0CayLekxf+mQYwM7VTwnZar0sLtcg/8DjCPtFxdoGz13CXWbmQHdzH4dkiHaCXcsajda01YYcjMWCj2SZGvoeKLss7RYYt7o9qI1dVndoQ/NWyA9Jij0X6iX+AvK1XOM4AmNjwGtC+ZAsN/ePF2oUQE060E7pyRdyOXnFu518OLvLrS7RUU6xnuIbVol2b/8sKaTltpqFh99hAbW3TqTZxofO0tEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxItqDyqp28ZjMK9ufBe9aLvANcuYawRMxqZtA3i3LM=;
 b=DYM3AqvWEE/yCi9J93vo2rKgRUh8e7SHgvpDkE9rfPzQtVpdYuNWXcWALzmSr9VydxL1QmuXjmLVMBLH/3b5qje+/FEv1ZR77YiP5+D2EnIIkdCdxzh/PXkNf8aZFarka6GC0/3RwwdDzfdIflu7K/DoOYT7a4cXTHUg6nlGwpw=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3850.eurprd08.prod.outlook.com (2603:10a6:10:7b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 14:57:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 14:57:59 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [meta-virtualization] FYI: branching for Gatesgarth
Thread-Topic: [meta-virtualization] FYI: branching for Gatesgarth
Thread-Index: AQHWuDIIidhgYoXLykqZTSQ+ZUsKJqnDBbEA
Date: Wed, 11 Nov 2020 14:57:59 +0000
Message-ID: <4260110D-F30E-4658-8016-C6AC19B22C32@arm.com>
References: 
 <CADkTA4On0R769cvDqmZ1NPHfLr2gcniNt1CfpJ=ZRMAqEF60cw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4On0R769cvDqmZ1NPHfLr2gcniNt1CfpJ=ZRMAqEF60cw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0541d75f-0860-4dd7-f81b-08d8865238ac
x-ms-traffictypediagnostic: DB7PR08MB3850:|DBBPR08MB4252:
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB4252963978EF29C1EA8D82349DE80@DBBPR08MB4252.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zJB5nhAyK6TY8J3F66ZiBblALhMfy8xkS4BxnAUVOG6MVWXZXkg7gqiCY2xSPj1Y51yEWzLPt5578au/N7UYFDs3MgJirJoABYGDa/3oouxYbzurPTUbDBa1qyYeYPUw7fD3S+J5PHf4MFURvMQGM567gR6SY43yGC/7+fs6R7KVjyIpOccHDkp7YOEF+AiGqQkS8dOXmOMwj0EyUIIfmB4vHK4/hTXAC8qmew0xkHflgETz87JRpLX9SjZQDwFhcqHPuw/i0vV59tgQjJAui+lEy1n13Rn7+5Ef8cG1z1anE7gmQuFNIeGjt6BuM+C49ExsDgxeQMVjYgAMQ3zEOWvcoEM9hyJHGRifBWTptH68gursGdQfMOYfkA32jBUxJBGWbtrixXZtG3Y4ULIX5w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(6486002)(6916009)(8676002)(83380400001)(33656002)(478600001)(186003)(4326008)(26005)(53546011)(6506007)(966005)(5660300002)(2616005)(6512007)(66446008)(66556008)(66946007)(66476007)(8936002)(91956017)(71200400001)(76116006)(316002)(2906002)(36756003)(64756008)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 PihM1SdthCu/7QH2uUp/2WaKOzQEu4iS8+yXGti00mgj/1pVNNNbQ4XDtKEWYDBZ63x64a8d+VwBeuKMGthGhmOYbKJpxLlwh2OwmAJkgWuRZBMgY2FYYlZr9eUm9+PJYTIW4J10stLqqeEusuXdtCffiG++69d5wF2v5fjL42IVJ6R6obMB7zC39ehD+Xba116zGaz50Y8hMasEy5/i4OcmQbkgaUDE+AInSaw8JLYFXhS2XY/Z/b7VnAkXpbTh82qUXZTa0phpCDTousCsegllfsbDA5t7bqbmNYnOaPx43Br8i9f2bSqkwxj/acrfdVvUDJID7ThUQ4er/s45VMsi9k1iJb3fD6ywq3iSJydTK4Le1LEpiGlbbSDHsC6K9sRrXNT3lPeuRI1bjyEOScOes9SornYRr2yDRIs0Jhk6ZbbmnQm4l6JlMFtADSwZ6HchKwecHJZ+ZKke3jDC6P857BoRNBOroiNcGwEwkxSJDa//7VLQwzjTVoHg6DAQRRkdV0qi6L1d4UFgwcgwyAy8HDNIQYXRXthGwa4rXWpV2MEofemGbaHh7UKS34FoO3RyWZ2BKgwjTtYqYyoiKKwcQTukfd+v0PEQc+umb5Lmyep3aipGp7sksm+4GPRHUF4sKz/Cof64iw63mBS8Ag==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3850
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f80d70a6-b4db-4620-93d0-08d886522e1a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DQre4Z6GblY3N77xpaKJpfbhsvBKTWZ4pioPWVtpIx6HH27OX+Fu2lI5bd3VUtZsI1OQ/dUXf4L06oObj/eolKgbg9FrYi78GUR1OEz9cBGPmHs0fl5awaRCIqf9ScGsuruSpYw+ZIi1BKGtd3SN7gNGFg3iE6YKGuAReeBxaB+Fvdia/XCSiv1XMZrKQJgSbfbuOcgWNq7pWSYfr8vYfMSSK+Iu2hXycJ6hFYvB5i2/oQsJG0j/OSeEGWj99EfT4Be8ULbbCFv6ohBZk8nN3TyJaILsh3tt8u71941M2nuxtMiUBiYbxXWovT3oE4/JjaeaQ+SPiZ+KncweAcpTRpCznLa1XVal1pKoHzrhi1B0ciG0bmdii8AgdOF2Cbu8qLVBICHy0mgMfFCExRhpobYgBD7CAtUcDL9wmeg1489ARFahBybDJOao42mRWbo91Hqkc+J57/YWO4T434oEbvxTDSfaOr0eyvw2pA9wvlM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(2906002)(6862004)(186003)(83380400001)(26005)(5660300002)(316002)(4326008)(36906005)(53546011)(336012)(8936002)(6512007)(81166007)(70206006)(86362001)(33656002)(6506007)(47076004)(82740400003)(966005)(6486002)(356005)(478600001)(8676002)(70586007)(2616005)(82310400003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 14:58:16.8635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0541d75f-0860-4dd7-f81b-08d8865238ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4252
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BE39066CE711CF47BF366A30A52045AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

> On 11 Nov 2020, at 13:52, Bruce Ashfield via lists.yoctoproject.org <bru=
ce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Hi all,
>
> I had hoped to finish some k3s work before branching gatesgarth in meta-=
virt.
>
> That effort is dragging on a bit, so I'm doing some final sanity
> builds now. If I'm not happen with k3s in the next couple of days,
> I'll branch without it.
>
> So either way, by the end of week, there will be a branch in the repo
> .. in case anyone cares, or was waiting for it!

Could you consider to push in my serie to fix Xen compilation ?

Thanks
Bertrand

>
> Cheers,
>
> Bruce
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>=20
>

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
