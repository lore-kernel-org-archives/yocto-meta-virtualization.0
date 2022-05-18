Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC7EC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 07:37:14 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.57])
 by mx.groups.io with SMTP id smtpd.web12.2121.1652859432943668234
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 May 2022 00:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=WbeY+UC9;
 spf=pass (domain: arm.com, ip: 40.107.22.57,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VKmvU9VKK9FQ1kqDQ4Qat0Xq+ODYo3wzUhJ6rtWNJ14Zq975OuJ+/2yr3nIVh8z9m06CH7hUUdGu2ejridid0Ly7vHaQnAl6DKwECV7XdbNqVHFn5lEvs0BOK1dg+TpN6oSQ6He3XbfbfVnTQ7TyC1hg47K3vMnv2FoCCVXvubp6pD1+GGHb1VxSxFeAmVlrryQ5XD2aZYeq/uIp1qfPcyJM9m1VsWElRaNUtOGxQsZoTGFNGHoljW1SHRg8pkVQCtogD7wYwXVmKTggVTcJUEyGJNQK1IMIXtXK02FVWNQtr0yevKQ9SWAExo+mz06+ppVZlZrBMwJbQKK0x0J/Ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VvRYHQIYo9vV/StRwNFietYyVVVis0pz8p0SxClr6o=;
 b=OmlxpQwpbZqC8rK8i8hywjpkMIbJqTgf3r/wq9hkdNBrIR1078JnFKn5Fi4C5KRibGIibcjwxMl+ItVFka2hXlWAqJuyHhWmncVEMF5YgL3EzPWcTDS5l1QiiwbF70wEszduT4yIwS5vy24oHkrLx5Wy2Gv6T6iwqVIAjL75R4D9klooFPcG5MpfoDK2X6NjiIzjGk6IBw434lE3Ci/2zKTT/DquCbS0jtWoTjZlBHpglQpAqeZDveZ4zKU5I13SrhL2R3gL8kOxUmNbi2DebGuT0Wn9HLrqTsRK0v0hH2jijOdsngwursTms8VKTQ2ej1hReQC+HN6x1SDcMK8JNg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VvRYHQIYo9vV/StRwNFietYyVVVis0pz8p0SxClr6o=;
 b=WbeY+UC9gl4ITCg8uxadFElTYpVIO790W2mINenvN5SUfYJ77Nhgrx3kL193zn1Byslred6RRlJPikfLrdsVZU65JBqoyvPal1JvKbyC4IjRPtV6rPQMCD3P1+obbTbKe8eeJG8iKwnkJBEelx+KObEYmkTy2BP+VVnSfp+0duQ=
Received: from AM5PR0301CA0031.eurprd03.prod.outlook.com
 (2603:10a6:206:14::44) by PR2PR08MB4762.eurprd08.prod.outlook.com
 (2603:10a6:101:1e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 07:37:08 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::e) by AM5PR0301CA0031.outlook.office365.com
 (2603:10a6:206:14::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Wed, 18 May 2022 07:37:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 07:37:07 +0000
Received: ("Tessian outbound 07c1c99345b0:v119");
 Wed, 18 May 2022 07:37:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c78c5155278dd600
X-CR-MTA-TID: 64aa7808
Received: from 60a57df5538f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A39C5FA0-2921-480A-84B2-F3ABC53590B3.1;
	Wed, 18 May 2022 07:37:00 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 60a57df5538f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 May 2022 07:37:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfLtm04sLH3+5u7FD1o4jKA69ikiXBe1E6eX4Cwk70cMIEXzQubMjkLyLlX/jTVmKktbcP/zJRaQ8yQx0okbAcGRs/4OjLkGBC63cMPtHPeh3ywGb1qSIaLt07gAm0YQ3DTWLPukjLNuigOyTCWm1lxioUOvOLu4VJfG9fIXf4iPwjiIHAhkYsAizygYBUT9YaKDLLknn/BJPT3wmBtV17NU0wvVFM7akE20fbKQslXdaR3yWSbaiSJ7WuBRI5R429AEUhCJ0RX4DgtltEwkGqJWtjaGQQFOcSp8lSW6d4Ko7Ft6uMOXcPanb5kecCrp3S4dWCltI8K7XNDOfMT6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VvRYHQIYo9vV/StRwNFietYyVVVis0pz8p0SxClr6o=;
 b=ae+/zREfrvqNc2BPeDizPjp/wsP9nDqWCw+nZAkWeAfc4iZKJYtAkSs1y1qBMCIZd15WPc/GXkD7lps0N2fvDrbZHgqghNXkBWIu76XTzd3JY+RE+yQuU0WQ5KAY5+z7h4hee53+Qffz/jJJUq+Z0cbsIvVTv+IrAFOblZHlVAgQS9ap3LLPkVQEimyYop2OcNXHWdfnEVozZ9dLg94fRi/bhLkBBxG4FqpT519zW4BuKMiBZIiq4sJzpslcuqjwVjaM8JCdmcCQuBrmNKwoG9W5dfx6WCt0+UivTdMu+uww25TFHCpbDlQzn3/SJknQ0lmlLW9JU+Be5kq3LPKzYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VvRYHQIYo9vV/StRwNFietYyVVVis0pz8p0SxClr6o=;
 b=WbeY+UC9gl4ITCg8uxadFElTYpVIO790W2mINenvN5SUfYJ77Nhgrx3kL193zn1Byslred6RRlJPikfLrdsVZU65JBqoyvPal1JvKbyC4IjRPtV6rPQMCD3P1+obbTbKe8eeJG8iKwnkJBEelx+KObEYmkTy2BP+VVnSfp+0duQ=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3845.eurprd08.prod.outlook.com (2603:10a6:20b:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 07:36:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 07:36:57 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH v2 4/4] xen: Disable PCI on qemuarm
 with Xen
Thread-Topic: [meta-virtualization] [PATCH v2 4/4] xen: Disable PCI on qemuarm
 with Xen
Thread-Index: AQHYakw86rzHsXQKCUOErMX005B1e60kP3+A
Date: Wed, 18 May 2022 07:36:57 +0000
Message-ID: <4C590024-2307-4743-9F3E-1B04B2014727@arm.com>
References: <cover.1652196703.git.bertrand.marquis@arm.com>
 <39d2a5b406c9445ad1e19a1315254e2d049ced60.1652196703.git.bertrand.marquis@arm.com>
 <CACMJ4GZ1ApagfEG-g6Wf46Ea29YVLowtP2Mi0-CK8_h++eKrrw@mail.gmail.com>
In-Reply-To: 
 <CACMJ4GZ1ApagfEG-g6Wf46Ea29YVLowtP2Mi0-CK8_h++eKrrw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b1b8b093-d3f0-446e-725e-08da38a13646
x-ms-traffictypediagnostic: 
	AM6PR08MB3845:EE_|AM5EUR03FT031:EE_|PR2PR08MB4762:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB47622DD06D39831A8C2E46139DD19@PR2PR08MB4762.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YDDz3Yr7uCGRY+iXPjYuieW1ekTk8sh1+EyQKU+RhpkLi5OMVvvmR4nY5zBXHU8zIzE5K4s9ZqvH5Pl2qwCa6+CirT9IhKe2I25fpB51LGep5uNGCMhhnnnvdei9QVO59VgJJ83h0aFAzHXv8EpL4EDcj0pAZ78zXNCumWunBNRFXn809ib8fVF+pC0wqbF39vukgklI3XR5k73iJre765aGn4ofXB96GO2lYJPA4u82WatjKe0FM5nBG36Xv3RSxMVNX2VX04VPsGtpAasLRhOhZEOEKahvUjGFbAz7nf30JbU0Gd63J/17t4s3s4pb70AR3qO1N5K5djrb312wCkjITey2ZkUkNvJb9jM03R43z+BX19bShoC1p1VTvhipuwZh0KBPjaOIwv2kv/Z8fGxRQNu2CJTzjhoPcgqK1iVbq3/Ux++rpqlwSC56LZRD8c/g2QDwNymq5+qy7DSMptSWzhi4dF1sCQQKVvkq19I/kqL22yKvHcPmyU7QjIytHHUyLwLFb+tBDuKpnmuBNckPiT0VswWKw7xSdfJKcMCFgtr8h//8Epm0JMP/+p67N1wdn26diFHKio84ZurILXZB7W8pphzKe2iqZNy8UvtS1L4MsaVVZ/h7EqQLL1VdqbD++ooeYNZXNytZOGdOUS7fjyDeh+0GqigdsaiLiXh4bYH5dlbj8Zf4Nl6ChqyoTUTNh0kt4AD9bFxx0NHpnbS2DMtNOQXCmBObn+wL81bzSSDlZ9ePAJY959ngZgcbKnUtjv1DLXLzT0kbJ+8Ru4aYplt2boyWrughADlTa7wIpUa6zyRvqTVmVPNWAN/epkdgBSZUCMw0ALOVhoo9dNaPe8RxZU7loSdrcVVzFFo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(2616005)(64756008)(2906002)(6916009)(186003)(4326008)(76116006)(66476007)(66946007)(91956017)(66556008)(5660300002)(33656002)(122000001)(53546011)(6506007)(6512007)(71200400001)(966005)(508600001)(6486002)(316002)(86362001)(36756003)(54906003)(83380400001)(66446008)(38100700002)(38070700005)(8936002)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <49FCBD23693AAE43ACF326D469094352@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3845
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3297cda1-da92-4476-541b-08da38a12fe5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QcKpj0AigoS/luBk28fxCmarziFM06eMDeuDYoxKZr5N7TJOZtKO59rSo4OZq4Nvrnjm2dV08pN4QAqWbESIUibIlozxJRDe8i8CNZSdFyScBT2qjnaQBbnJ+URos3rlkBQyC4C3RJ6lTbmiW6MCYVc/dq3rWjLI+wfH+ucwStUZi4F3O1SvTpEqg9OZ1rXVwnAu4WTaRQEzhcqf+qSJDHbz2PnGU334YinDj0VVlTZiRvCAgHIygDKyuNBP+6pFReO8sAGqNx0uwMHMsFewLUYTHN+pliY8OVS3AfB2uzRFjb677cVLUbMN9gLG0TaqWW/Oq/h+UfMq+6EA/i956M8r3u9RrQWJ34/SeWAjgOp4vxzJhi4GlqYwVYUmgYJiipS2g6S4ioUPQbnEMp8vlCUKu5tR34klIjkBw8fByuEH0Z3gkY01h3rJG512WfCai/fBYE3unm0TvtN3w3QwGk2kdowAFE/zF7iramxCOfnmNCPVP5AG1WboS/z0xPJ5YbVR9dYOHsGWx3VnPgCI4pQfmZE0nlJ6Gq/2KuAAeKt7OBsFOfCIPzn9wYOh/5fxHwiI3ER4L7Ac3MtEIT8uh1bNPK7pG9qCHCMKWoI1oh9rtCS6b/SmZ0l1KvL4bX0eeGMxTFXhwHqgEXbPrA6KYGaVYCbqATspaPGSQXyhiZh90dOv5+u0Dv8iX5iM7u+/4KcKFfbefh5RQoo2YytvCa4Tq+uffR5Dq5bad5NheoJjj8JCXvFfvqSNePc+nHm/Aq5vH75uMWMaKFOgKLDNAe9oBSupmdA+6yUA9HN0xiw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(336012)(186003)(47076005)(86362001)(36860700001)(2616005)(83380400001)(356005)(8676002)(6862004)(81166007)(4326008)(70206006)(40460700003)(33656002)(54906003)(70586007)(82310400005)(8936002)(5660300002)(36756003)(2906002)(53546011)(508600001)(316002)(966005)(6512007)(6486002)(6506007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 07:37:07.7198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b1b8b093-d3f0-446e-725e-08da38a13646
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4762
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 18 May 2022 07:37:14 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7286

Hi Christopher,

> On 18 May 2022, at 01:14, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>=20
> On Tue, May 10, 2022 at 8:35 AM Bertrand Marquis
> <bertrand.marquis@arm.com> wrote:
>>=20
>> Remove the pci node from the qemu device tree when runqemu is used with
>> xen-qemuboot.
>>=20
>> Linux is ending up in an infinite loop when trying to access PCI
>> configuration space when running on top of Xen on arm32.
>> As we do not need or support any of the devices on PCI on arm32 at the
>> moment, just remove the node from the device tree generated by qemu.
>>=20
>> The problem does not appear at the moment without Xen and it is unclear
>> why it is with Xen.
>> This will be investigated but in the meantime provide a working
>> configuration for users.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Thanks for this - my review is from inspecting the patch applied; I
> have yet to test it but there's no need to hold this back with
> positive reports now from Bruce and Bertrand.
>=20
> Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
>=20

Thanks and I agree.

This is an hack but I think it is better at the moment to have something ru=
nning and I will create a task on my side to investigate this in the future=
.

Cheers
Bertrand


> thanks,
>=20
> Christopher
>=20
>> ---
>> classes/qemuboot-xen-dtb.bbclass | 22 ++++++++++++++++++++++
>> 1 file changed, 22 insertions(+)
>>=20
>> diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb=
.bbclass
>> index d43d23a..1f17a86 100644
>> --- a/classes/qemuboot-xen-dtb.bbclass
>> +++ b/classes/qemuboot-xen-dtb.bbclass
>> @@ -63,6 +63,21 @@ write_lops_xen_section() {
>> EOF
>> }
>>=20
>> +write_lop_rm_pci() {
>> +    cat <<EOF >"$1"
>> +/dts-v1/;
>> +/ {
>> +    compatible =3D "system-device-tree-v1";
>> +    lops {
>> +        lop_1 {
>> +            compatible =3D "system-device-tree-v1,lop,modify";
>> +            modify =3D "/pcie@10000000::";
>> +        };
>> +     };
>> +};
>> +EOF
>> +}
>> +
>> write_lop_add_to_xen_cmdline() {
>>     EXTRA_XEN_BOOTARGS=3D"$2"
>>     cat <<EOF >"$1"
>> @@ -135,6 +150,13 @@ generate_xen_qemuboot_dtb() {
>>     write_lop_add_to_xen_cmdline "${B}/lop-xen-cmdline.dts" \
>>         "${QB_XEN_CMDLINE_EXTRA}"
>>=20
>> +    # On Qemu Arm32, Dom0 accessing PCI config space ends up in an
>> +    # infinite loop. Remove pci node from the device tree
>> +    if [ "${MACHINE}" =3D "qemuarm" ]; then
>> +        write_lop_rm_pci "${B}/lop-rm-pci.dts"
>> +        LOP_MODULE_ARGS=3D"${LOP_MODULE_ARGS} -i ${B}/lop-rm-pci.dts"
>> +    fi
>> +
>>     if [ -z "${QB_XEN_DOMAIN_MODULES}" ]; then
>>         bbwarn "No domain modules: please set QB_XEN_DOMAIN_MODULES"
>>     fi
>> --
>> 2.25.1
>>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7273): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/7273
>> Mute This Topic: https://lists.yoctoproject.org/mt/91015801/3619037
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[christopher.w.clark@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


