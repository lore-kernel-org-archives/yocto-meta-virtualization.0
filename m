Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.80])
 by mx.groups.io with SMTP id smtpd.web09.5723.1618818483472276204
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 00:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oR89Hf7g;
 spf=pass (domain: arm.com, ip: 40.107.14.80, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4bcTJgoBQ/3FXm0xCliVtaOfvhnvd32zbfsmVehJso=;
 b=oR89Hf7gn9NkCCKcLNoYqzFPc1muVMN9/PyXX0QN+y5N3WhLG6mXErcOWfyL4XyCBWq/KSl962ev3+RyRTaA8vz1kod+nfDHP2LUp+9o84GEkakSfo6G4xI96NcRK4arY7M+zdU9CX1ddgvX9pQW1UvV7mDyp7RH7lwe2qKJVLs=
Received: from MR2P264CA0098.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::14)
 by HE1PR0801MB1626.eurprd08.prod.outlook.com (2603:10a6:3:86::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 07:48:00 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::11) by MR2P264CA0098.outlook.office365.com
 (2603:10a6:500:33::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Mon, 19 Apr 2021 07:48:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 07:47:59 +0000
Received: ("Tessian outbound 81a4524e9a48:v90"); Mon, 19 Apr 2021 07:47:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83312dea453c9ca1
X-CR-MTA-TID: 64aa7808
Received: from 2821de8e65a9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3E6DA1F5-7D86-41E9-8DF9-4AFFBA44426C.1;
	Mon, 19 Apr 2021 07:47:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2821de8e65a9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 19 Apr 2021 07:47:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDJnbKh5Ybq1pdiFYkfL9ZEyifHGaxf1SYOaXpNx6TFJ83+WguuQiOeZNrWaiOpkkWWVlBNPJmyahhFo3fq78C+EzCYV+f/pW+lQvuIrYVweNRTJN/Ge+vpIiUUXi8v1MkZXE5PgCQbB44RYP+6gceGKgx5O0Wcqd9066AWMID5SIMUb/6UxpxN1um5DJkz4OmdC54EVTHdjzoWJyqnIZeh95BJ0roB9rSvJBLWaY0sYnufoJbIklX55Fh9sCnKNNRP3YTsMGi56bJv4Vv4fDKeRp3SZkOT/1/gcRcyB8bjKB7kex0rofPKLrE9Hx5YDgmGW2buoTiKk8/3lG5SNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4bcTJgoBQ/3FXm0xCliVtaOfvhnvd32zbfsmVehJso=;
 b=Nd2iWPawwR9PaxTeYrsX7lQl0bYsc9+D9yMtsUi0R5QRl9GLwOHVcNbPMagY14rAA6ePWeS3c1nLWSCeZik0RfibAp8y28MB0Ehz9oK014SnISvS+fof7UN7emSVxfqJjMLP7aPmP482zmpQIjnOSLf71ecHYv9UnxJgFRD1nxiglFx3pn8Np5Hm2nTd+m9LRbs8j8ZJ4a/HyyBRLZ5Pza5dcaa3JRQsADxHAxVxqp5llVnY5GKRYyQ8R+wRuAuekASOxY0hQuyoRj31F2+b7X9zKBL/RIiVnL5i4+UpRj5+ncnRrAb4JDXtxPudLE6//EFi2kYVD4LPJbyYqyFj8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4bcTJgoBQ/3FXm0xCliVtaOfvhnvd32zbfsmVehJso=;
 b=oR89Hf7gn9NkCCKcLNoYqzFPc1muVMN9/PyXX0QN+y5N3WhLG6mXErcOWfyL4XyCBWq/KSl962ev3+RyRTaA8vz1kod+nfDHP2LUp+9o84GEkakSfo6G4xI96NcRK4arY7M+zdU9CX1ddgvX9pQW1UvV7mDyp7RH7lwe2qKJVLs=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4333.eurprd08.prod.outlook.com (2603:10a6:803:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 07:47:50 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 07:47:49 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Doug Goldstein
	<cardoe@gentoo.org>, "martin.jansa@gmail.com" <martin.jansa@gmail.com>, nd
	<nd@arm.com>
Subject: Re: [meta-virtualization][PATCH v3 1/6] xen-tools: fix 32-bit x86 build by setting pvshim configure flags
Thread-Topic: [meta-virtualization][PATCH v3 1/6] xen-tools: fix 32-bit x86
 build by setting pvshim configure flags
Thread-Index: AQHXNMg1fMGlluHY3kGPRwgiUXi77Kq7dwaA
Date: Mon, 19 Apr 2021 07:47:49 +0000
Message-ID: <72C465B9-BCC7-46D6-8FB9-B013476E68E9@arm.com>
References: <20210419030029.GC61503@gmail.com>
In-Reply-To: <20210419030029.GC61503@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 347f6ecd-1c20-45c3-75fd-08d9030773f3
x-ms-traffictypediagnostic: VI1PR08MB4333:|HE1PR0801MB1626:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB1626C440CA3D58A857809D099D499@HE1PR0801MB1626.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aJGuM5OxlxELodyjs+k+s7SZ0Xlmwjajfq11VHBj6TnW7VFRkiGsbbxKzyYmACMGgd7pDuwTxes8t/MG6E8aP9HiQoh8A49FYa4JZFhw618GAYmLAkBXEOOu+sH6ftc1Wr3Q6PLg0w2+GwMxXpulWfSoZ9el1oYSxV6ymJVcpsjuyzS79DdsaYgA8BZ1x4nga9GN5N9jA8U3VZtNvZngIqrZbatMQ2MyPtWGefK5G3RzXxwERTWtIjb8Nv1YVQgmJuiP57CNo4R9K7PcUOFYkBIfpU1OPzlfULniJElIWsYs+Jridgl+aAih/It4C0AVc0HogSgogfukIE5MrUA+m/MlxGd+srC4yy7hkhrvUCVurLjtC6QGleOoUeWE4vZ25fQlZwpRhkzH7BpcU738EacLsmA+iXkcj0Ly8yGFkI4uOS7LOu1OzT1WtqzTilQlwJ2R2j+u3xZLBWTN2f1IWaVZmMvcjpK+EvdLs2h5PM6HKOHKHQ1p6bs0nDDihPYHpXthzJVaVUXyBSVlbHJHeJJfQcSthE/9ZvCay6+aB/wkNn7ftFUi+kisVCcUrvYHT02s6XirmFK9cHB2XIYCgWe3aMqu/6esywzDv7LEhjrlMqzFOCk7MvD9+42EvmQg40OIgTD1Y2Hj1no3GwtfUiER4GwNr1Vq/DcDwxvVHT1bwDHIZhRIGXWq/IfHZHm2ohDCYq1S3dZ+gOUv00VlQEj8k3Xk+k/B3mi7u6YvNPs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(6486002)(316002)(6506007)(26005)(53546011)(186003)(54906003)(6512007)(6916009)(2906002)(33656002)(478600001)(8936002)(966005)(91956017)(30864003)(66446008)(66556008)(76116006)(66946007)(64756008)(2616005)(66476007)(5660300002)(8676002)(122000001)(71200400001)(36756003)(86362001)(4326008)(83380400001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?kztaNSwrR+1r1ccTmx+Kn9GKIwZ5oHbMKTADtU8cOwocC4UWk/GVZav4WQMY?=
 =?us-ascii?Q?mksVxea0w9onySXFVaW1rmmhDP2AZBNYWpJNL950BQTO/CR4qKOX3QoLkiAs?=
 =?us-ascii?Q?/12e6UrIIenJNAEWeqawBzw5BCzJGMU9r1aMW2sPnqCChjh+aypxtIbvuQH3?=
 =?us-ascii?Q?vVOGb7JUl2nMEhZsCKxsI3oBI7RFGQ9XtRCFE3lITmkbZ9MswhXcDFXlkV/C?=
 =?us-ascii?Q?1L3Sw+7yr2IZCKXGvRaCi6dTaCFtey8Xzjzu6O1bBREx2F0WbAJIu4R9/95C?=
 =?us-ascii?Q?BhwwBsnHheYGg9Lb1Iko3MNIfXsJwokTBaoIdPToX/fhDmVWMgVx4FV5T5vl?=
 =?us-ascii?Q?yd/wdurHroZmue2JBCMRHp+tmAh0URX7XhxDj1V0hdFnVTdDn4mHysGb4P16?=
 =?us-ascii?Q?uVXpeVgv9MYJyDAJfNgR9aOnl0j9ynp0DU+iSBHp1ZblDVtPxAE/eupD20SD?=
 =?us-ascii?Q?7mQnv5W2+FcPMapyfKd2YYpyxTlso4GGgUx8F6lq04sjqA+WBbE7gZiqgAqM?=
 =?us-ascii?Q?P9+hbn/TgURkPn/qiNWgkBEsmqfOKYd9f3YIF4YEvyHHa0HbsPrrltfFIBAc?=
 =?us-ascii?Q?S4nAF3+34IrzkEWJBlavKoYX0AnFbuQDroYDQ9/iXHkIS5uPxsLQoqWoK9uF?=
 =?us-ascii?Q?ljQnTFYGS7QXLsLpxnvqPiJc8wlO75JNThsWqFB+xBEpzGsvketXwEN/TMpI?=
 =?us-ascii?Q?lQpCJVafNNTdaiFKBR3rdVs9FSI1Tw005RaGTj4NdYH/Nuu0CRjqzVXjwq25?=
 =?us-ascii?Q?5LXRJrFysoOL7HHWw8RRXcDk3hcNxX9+dVKk5WEeiHznYyhXdvr4HA1iTEu5?=
 =?us-ascii?Q?FgH0Ybnj0yniLkT5EqeETbWodReMvBwZ6/KdMYBZxf7rknVjqwHyTSP6wWSB?=
 =?us-ascii?Q?eQA6KI3PGZjUURJo2xmtG2tMSJHrnW8iMU4wcU3ftJ/36MYOibOA5FAqc08Y?=
 =?us-ascii?Q?zLFBuu/AaArgr0BF34oai78Z6+bJCDbsEmU+HgyU5wpl0HWWJL0youduozuu?=
 =?us-ascii?Q?jBEuhsQvLU/XQPve3g9wWEkTIorKSN3T/pJ2pdOTxbf2/OVb8CSus3WLutTW?=
 =?us-ascii?Q?lU/splSiqfBiO9h59yISUkdklzpv2G1uyBxjifw0igF3Scw2nw878Gz9Vfc4?=
 =?us-ascii?Q?31bOIHpSIvIBqjDVjg+IGaeUNdFPTwunVUhq2gd55B0nzdI+uJfAksUWMoFs?=
 =?us-ascii?Q?draepOO44FLkICmR4AoqvbZio1ULovRpP8EHXYYAskTUGKXEML5x7HX/pcZS?=
 =?us-ascii?Q?602pXAcP41JF5ZXBOp+aCplcNaTaEbeJBt0odirKl5DiI8NZ1QQNsNfZtDGp?=
 =?us-ascii?Q?iKE+EaUJpuZncJW7LY5jFED2?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4333
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	beb8d970-70c6-492f-7a94-08d903076e4e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BgCU3/TGQw2Zqq4PPt6uyj5Jpe+mEt47VnKs/iIKKMgcVHG5NAdQfEFErctsQahUUX2Ms4VkDsdrBenlTEG8uSlWHD1tXTNc1suOrguPmBUtdUNy8hqtN1ZfljI6CsSJM2qU+ko6eV/qWBwJcbFDd0v3WHFjPuOJbp8iHH7KEM31HmKzmXc64bh7GYQOYiqdVfXfmIXPzXivCLOKxU/Hv5QZCSx4KLNOJ1HLLUMSOkn9wNBqXLt7TTgbQgUgDDobbsi3g9v4gTkVW2/hIu59qWfFdVOaKdZPBhgII6OjFnYfoyrxijvv8mtyKntZxvQdKAmCgL8iCQWGVn/N45BiBKnsa8dL6ZbhAZlvUaju25rSdlZkYqNQu2ZUDG6UBnGjgt+D3fePR3xomNZlo1CJULGjFeoN8o9HJZbPuvuBLYeZL9LFjlhFlkRKUzR2CQ/GlgBZG5nRAZTaVDUvozyUjjCpE/+eOVjVs9DxfQn0gBbJBpL1MFSGAc/HhyucTvmozWinNUXtuBcv/PGCAr/mXHOKRILnZTybQ+JXB9TpJ71Do/zzi514+QakQBZCcAoXHx6/+2On9XaGGD8+FS5/YBe8lS0yOR6+2Guvsuhepv9A8E/WQgJtC5QqIs1vpi2utSLrmhPVHNOx9/KmkySYd5FPRhC5dlzkJCawhZRHfpAL2aAt955P6Ctd77MZOw/p4sAq2RqhzNs1Sy+FG6BZj4a/THubEZYh7jzlKAuqk/o=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966006)(36840700001)(478600001)(336012)(8936002)(2906002)(2616005)(966005)(26005)(30864003)(83380400001)(186003)(82740400003)(53546011)(8676002)(81166007)(6486002)(86362001)(6506007)(6862004)(82310400003)(356005)(47076005)(5660300002)(4326008)(36860700001)(70206006)(36756003)(316002)(70586007)(33656002)(54906003)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 07:47:59.2928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 347f6ecd-1c20-45c3-75fd-08d9030773f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1626
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2AE8F7E1089C0040B7FE7508DB7D3E11@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

> On 19 Apr 2021, at 04:00, Bruce Ashfield via lists.yoctoproject.org <bru=
ce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> I've merged v3.
>=20
> I also have a patch on master to bump the default version to 4.15,
> but ran into a syslinux build issue (unrelated) that I'm sorting
> out.

If you share it, I could help do some testing with that.

>=20
> When I have that 4.15 build tested, I'll push it as well.
>=20
> To confirm, we also want to remove 4.14 from master ? I've
> done that as well, but would like an Ack before I push it.

Could I request to wait some time to do that ?
This would ease the transition on my side (and for some people using what =
we do).

Something like a month would be great.

Regards
Bertrand

>=20
> Cheers,
>=20
> Bruce
>=20
> In message: [meta-virtualization][PATCH v3 1/6] xen-tools: fix 32-bit x8=
6 build by setting pvshim configure flags
> on 16/04/2021 Christopher Clark wrote:
>=20
>> Enable building the PV shim for x86_64 only.
>>=20
>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> recipes-extended/xen/xen.inc | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
>> index 9e8fcad..2fbdb3a 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -125,6 +125,7 @@ EXTRA_OECONF +=3D " \
>>     --disable-rombios \
>>     --disable-ocamltools \
>>     --disable-qemu-traditional \
>> +    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim=
', '--disable-pvshim', d)} \
>>     "
>>=20
>> EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmware/=
vgabios-0.7a.bin"
>> --=20
>> 2.25.1
>>=20
>=20
> In message: [meta-virtualization][PATCH v3 6/6] xtf-image: add a new ima=
ge for the Xen Test Framework
> on 16/04/2021 Christopher Clark wrote:
>=20
>> Testing the Xen hypervisor, with the qemux86-64 MACHINE:
>>    runqemu xtf-image nographic slirp
>>        (login as root)
>>        cd /usr/libexec/xtf
>>        ./xtf-runner --list pv
>>        # run an example test:
>>        ./xtf-runner test-pv64-livepatch-priv-check
>>=20
>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> recipes-extended/images/xtf-image.bb | 24 ++++++++++++++++++++++++
>> 1 file changed, 24 insertions(+)
>> create mode 100644 recipes-extended/images/xtf-image.bb
>>=20
>> diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/im=
ages/xtf-image.bb
>> new file mode 100644
>> index 0000000..3f9af25
>> --- /dev/null
>> +++ b/recipes-extended/images/xtf-image.bb
>> @@ -0,0 +1,24 @@
>> +require recipes-extended/images/xen-image-minimal.bb
>> +DESCRIPTION =3D "A minimal Xen Test Framework (XTF) image for testing =
the Xen hypervisor"
>> +
>> +# To run XTF tests with an image built for the qemux86-64 MACHINE:
>> +#
>> +#   runqemu xtf-image nographic slirp
>> +#       (login as root)
>> +#       # xtf-runner expects to be run from the top of the tests direc=
tory:
>> +#       cd /usr/libexec/xtf
>> +#       # list the tests available for PV guest types:
>> +#       ./xtf-runner --list pv
>> +#       # run an example test:
>> +#       ./xtf-runner test-pv64-livepatch-priv-check
>> +
>> +IMAGE_NAME=3D"xtf"
>> +
>> +IMAGE_INSTALL_append =3D " xtf"
>> +
>> +QB_DEFAULT_FSTYPE =3D "wic"
>> +
>> +# Set the dom0 memory level lower than that assigned to qemu so that X=
en has
>> +# some available memory for allocating to the XTF microkernel guests t=
o run:
>> +QB_MEM =3D "-m 400"
>> +SYSLINUX_XEN_ARGS_append =3D " dom0_mem=3D256M"
>> --=20
>> 2.25.1
>>=20
>=20
> In message: [meta-virtualization][PATCH v3 5/6] xtf: introduce recipe fo=
r the Xen Test Framework
> on 16/04/2021 Christopher Clark wrote:
>=20
>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> recipes-extended/xen/xtf_git.bb | 72 +++++++++++++++++++++++++++++++++
>> 1 file changed, 72 insertions(+)
>> create mode 100644 recipes-extended/xen/xtf_git.bb
>>=20
>> diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf=
_git.bb
>> new file mode 100644
>> index 0000000..db08643
>> --- /dev/null
>> +++ b/recipes-extended/xen/xtf_git.bb
>> @@ -0,0 +1,72 @@
>> +SUMMARY =3D "Xen Test Framework"
>> +HOMEPAGE =3D "https://xenbits.xenproject.org/docs/xtf/"
>> +LICENSE =3D "BSD-2-Clause"
>> +
>> +# For additional reference on XTF, please see:
>> +# https://static.sched.com/hosted_files/xendeveloperanddesignsummit201=
7/79/xtf.pdf
>> +
>> +SRC_URI =3D "git://xenbits.xen.org/xtf"
>> +SRCREV =3D "8ab15139728a8efd3ebbb60beb16a958a6a93fa1"
>> +
>> +COMPATIBLE_HOST =3D '(x86_64.*).*-linux'
>> +
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da5680865974e05cf0510615ee1d=
745d8"
>> +
>> +PV =3D "0+git${SRCPV}"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit python3native
>> +
>> +# To build 32-bit binaries some files from 32-bit glibc are needed.
>> +# To enable multilib, please add the following to your local.conf -:
>> +#
>> +#    require conf/multilib.conf
>> +#    MULTILIBS =3D "multilib:lib32"
>> +#    DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
>> +
>> +# Use this multilib prefix for x86 32-bit to match local.conf:
>> +MLPREFIX32 =3D "lib32-"
>> +# Add the multilib 32-bit glibc to DEPENDS only when necessary:
>> +# The DEPENDS on a multilib 32-bit glibc is only added when target is =
x86-64
>> +# This x86-64 override is never intended for native use, so clear that=
.
>> +GLIBC32 =3D ""
>> +GLIBC32_x86-64 =3D "${MLPREFIX32}glibc"
>> +GLIBC32_class-native =3D ""
>> +DEPENDS +=3D "${GLIBC32}"
>> +
>> +PACKAGES =3D "${PN}"
>> +
>> +FILES_${PN} =3D " \
>> +    ${libexecdir}/* \
>> +    "
>> +
>> +RDEPENDS_${PN} =3D " \
>> +    xen-tools-xl \
>> +    python3 \
>> +    "
>> +
>> +do_compile() {
>> +    oe_runmake CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} -I${RECI=
PE_SYSROOT}/../${MLPREFIX32}recipe-sysroot/usr/include" \
>> +               CPP=3D"${CPP}" \
>> +               OBJCOPY=3D"${OBJCOPY}" \
>> +               PYTHON=3D"${PYTHON}"
>> +    # switch the shebang to python3
>> +    sed 's,^\(#!/usr/bin/env python\)$,\13,' -i "${B}/xtf-runner"
>> +}
>> +
>> +do_install() {
>> +    # packaging: rpmbuild can package the XTF test unikernels when the=
y are
>> +    # installed as non-executable files (they are run within VMs anywa=
y).
>> +    oe_runmake install DESTDIR=3D"${D}" \
>> +                       xtfdir=3D"${libexecdir}/${BPN}" \
>> +                       PYTHON=3D"${PYTHON}" \
>> +                       INSTALL_PROGRAM=3D"install -m 644 -p"
>> +    install -m 755 -p "${B}/xtf-runner" "${D}${libexecdir}/${BPN}/xtf-=
runner"
>> +}
>> +
>> +INSANE_SKIP =3D "arch"
>> +# xen-tools-xl is a runtime but not build time dependency
>> +INSANE_SKIP_${PN} =3D "build-deps"
>> +INHIBIT_PACKAGE_STRIP =3D "1"
>> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
>> --=20
>> 2.25.1
>>=20
>=20
> In message: [meta-virtualization][PATCH v3 4/6] xen, xen-tools: Document=
 the version update process in README
> on 16/04/2021 Christopher Clark wrote:
>=20
>> Describes the versions of Xen to be included in meta-virtualization
>> and recipe maintenance in release branches.
>>=20
>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> recipes-extended/xen/README | 50 +++++++++++++++++++++++++++++++++++++
>> 1 file changed, 50 insertions(+)
>>=20
>> diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
>> index f286bb5..b9117f0 100644
>> --- a/recipes-extended/xen/README
>> +++ b/recipes-extended/xen/README
>> @@ -36,3 +36,53 @@ as XSAs (http://xenbits.xen.org/xsa/). The easiest w=
ay to include those is to
>> drop patches in 'recipes-extened/xen/files' and create a bbappend addin=
g those
>> patches to SRC_URI and they will be applied. Alternatively, you can ove=
rride
>> the SRC_URI to a git repo you provide that contains the patches.
>> +
>> +recipe maintenance
>> +------------------
>> +
>> +# Xen version update
>> +
>> +The following rules shall be followed to define which versions of Xen =
have
>> +recipes in meta-virtualization:
>> +
>> +- Before a Yocto release meta-virtualization shall have recipes for:
>> +    - the latest stable major version of Xen, and
>> +
>> +    - the current version of the Xen master branch (known as the git r=
ecipes)
>> +
>> +    - In addition, there may also be recipes included for the previous=
 stable
>> +      major version of Xen, in the case where the latest stable major =
version
>> +      is new and the prior stable major version of Xen is to be the pr=
eferred
>> +      version for the Yocto release
>> +
>> +- On Yocto LTS and the latest stable Yocto release branch, the preferr=
ed Xen
>> +  major version that is present when the Yocto release is issued must =
stay
>> +  supported and the recipes shall be regularly updated to follow updat=
es
>> +  available in the Xen stable branch for that Xen major release.
>> +
>> +- On Yocto LTS and the latest stable Yocto release branch, the recipes=
 for the
>> +  latest Xen major version shall also be regularly updated to follow u=
pdates
>> +  available in the Xen stable branch for that Xen major release.
>> +
>> +- On the master / in-development Yocto branch, new Xen recipes shall b=
e added
>> +  when there is a new Xen major release.
>> +
>> +    - depending on the timing of the next Yocto release, the new recip=
es may
>> +      be preferred, or the prior major version recipes may remain pref=
erred
>> +      until after the Yocto release
>> +
>> +    - the recipes for the previous Xen stable major version shall be r=
emoved
>> +      from the branch when it is no longer the preferred Xen version
>> +
>> +- On Yocto LTS and the latest stable Yocto release branch, new Xen rec=
ipes
>> +  shall be added when there is a new Xen major release.
>> +
>> +    - The preferred version of the Xen recipes shall always stay at th=
e same
>> +      Xen major version once a Yocto release has been issued, and shal=
l receive
>> +      regular updates to track the stable Xen branch of that Xen relea=
se.
>> +
>> +    - When new Xen recipes are added to a Yocto branch for a new Xen m=
ajor
>> +      version, then any older Xen recipes present, except for the orig=
inal
>> +      preferred version recipes, shall be marked as not updated anymor=
e by
>> +      adding a comment inside the recipes. The older recipes will not =
receive
>> +      any build tests or be updated to follow the Xen branch.
>> --=20
>> 2.25.1
>>=20
>=20
> In message: [meta-virtualization][PATCH v3 3/6] xen, xen-tools: uprev gi=
t recipes after 4.15 release
> on 16/04/2021 Christopher Clark wrote:
>=20
>> Updated to the branch point for 4.16 development.
>>=20
>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> recipes-extended/xen/xen-tools_git.bb | 4 ++--
>> recipes-extended/xen/xen_git.bb       | 4 ++--
>> 2 files changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/x=
en/xen-tools_git.bb
>> index 71850ee..0188bdd 100644
>> --- a/recipes-extended/xen/xen-tools_git.bb
>> +++ b/recipes-extended/xen/xen-tools_git.bb
>> @@ -1,6 +1,6 @@
>> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
>> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
>>=20
>> -XEN_REL ?=3D "4.15"
>> +XEN_REL ?=3D "4.16"
>> XEN_BRANCH ?=3D "master"
>>=20
>> SRC_URI =3D " \
>> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen=
_git.bb
>> index 2b62c5c..eaf3956 100644
>> --- a/recipes-extended/xen/xen_git.bb
>> +++ b/recipes-extended/xen/xen_git.bb
>> @@ -1,6 +1,6 @@
>> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
>> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
>>=20
>> -XEN_REL ?=3D "4.15"
>> +XEN_REL ?=3D "4.16"
>> XEN_BRANCH ?=3D "master"
>>=20
>> SRC_URI =3D " \
>> --=20
>> 2.25.1
>>=20
>=20
> In message: [meta-virtualization][PATCH v3 2/6] xen, xen-tools: add reci=
pes for new stable Xen 4.15 release
> on 16/04/2021 Christopher Clark wrote:
>=20
>> The recipes are introduced as the non-default version by adding an
>> expressed PREFERRED_VERSION for 4.14 in:
>>    conf/distro/include/meta-virt-default-versions.inc
>>=20
>> to keep the Xen 4.14 recipes as default for the Hardknott release.
>>=20
>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>> ---
>> .../include/meta-virt-default-versions.inc    |  3 ++-
>> recipes-extended/xen/xen-tools_4.15.bb        | 18 ++++++++++++++++++
>> recipes-extended/xen/xen_4.15.bb              | 19 +++++++++++++++++++
>> 3 files changed, 39 insertions(+), 1 deletion(-)
>> create mode 100644 recipes-extended/xen/xen-tools_4.15.bb
>> create mode 100644 recipes-extended/xen/xen_4.15.bb
>>=20
>> diff --git a/conf/distro/include/meta-virt-default-versions.inc b/conf/=
distro/include/meta-virt-default-versions.inc
>> index 299b5df..b85827b 100644
>> --- a/conf/distro/include/meta-virt-default-versions.inc
>> +++ b/conf/distro/include/meta-virt-default-versions.inc
>> @@ -1,3 +1,4 @@
>> # Meta-virtuailization PREFERED_VERSION
>>=20
>> -# placeholder for preferred versions
>> +PREFERRED_VERSION_xen ?=3D "4.14+stable%"
>> +PREFERRED_VERSION_xen-tools ?=3D "4.14+stable%"
>> diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/=
xen/xen-tools_4.15.bb
>> new file mode 100644
>> index 0000000..314dc52
>> --- /dev/null
>> +++ b/recipes-extended/xen/xen-tools_4.15.bb
>> @@ -0,0 +1,18 @@
>> +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
>> +
>> +XEN_REL ?=3D "4.15"
>> +XEN_BRANCH ?=3D "stable-${XEN_REL}"
>> +
>> +SRC_URI =3D " \
>> +    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
>> +    "
>> +
>> +LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e=
44a4e5"
>> +
>> +PV =3D "${XEN_REL}+stable${SRCPV}"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +require xen.inc
>> +require xen-tools.inc
>> diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xe=
n_4.15.bb
>> new file mode 100644
>> index 0000000..2842c0a
>> --- /dev/null
>> +++ b/recipes-extended/xen/xen_4.15.bb
>> @@ -0,0 +1,19 @@
>> +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
>> +
>> +XEN_REL ?=3D "4.15"
>> +XEN_BRANCH ?=3D "stable-${XEN_REL}"
>> +
>> +SRC_URI =3D " \
>> +    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>> +    file://xen-arm64-implement-atomic-fetch-add.patch \
>> +    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-lo=
cation.patch \
>> +    "
>> +
>> +LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e=
44a4e5"
>> +
>> +PV =3D "${XEN_REL}+stable${SRCPV}"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +require xen.inc
>> +require xen-hypervisor.inc
>> --=20
>> 2.25.1
>>=20
>=20
>=20
>=20

