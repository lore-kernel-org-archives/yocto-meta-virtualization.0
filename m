Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.70])
 by mx.groups.io with SMTP id smtpd.web10.8994.1619598907371755125
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Apr 2021 01:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MHUJCZJn;
 spf=pass (domain: arm.com, ip: 40.107.15.70, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDrm5iYoNu/CafuBCAmHNUzE29LyHXUc7Sk+Slv/ySg=;
 b=MHUJCZJnNS0lANHXNKLr+7xc4dk0501f9W9lRV73K1eJYdM50T6GnCvcj05mXKYGHiK/jkHyVm6Vu0yOhlQet3lmPSTl56VNH1FMoihX92Ps2MiD+/7UN8DrAWWX6B60EaorjJy5IwpVUKTWF8PfOPzSmJ9DcmRoWe7VSCIl5sE=
Received: from AS8PR04CA0201.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::26)
 by HE1PR0801MB1660.eurprd08.prod.outlook.com (2603:10a6:3:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Wed, 28 Apr
 2021 08:35:00 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::c1) by AS8PR04CA0201.outlook.office365.com
 (2603:10a6:20b:2f3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Wed, 28 Apr 2021 08:34:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Wed, 28 Apr 2021 08:34:59 +0000
Received: ("Tessian outbound 700fd1fc53d5:v90"); Wed, 28 Apr 2021 08:34:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aed11c4c0562060c
X-CR-MTA-TID: 64aa7808
Received: from dc788c8d7740.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 932C8962-DA6D-4B53-9EBC-CB951AE9CB81.1;
	Wed, 28 Apr 2021 08:34:51 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc788c8d7740.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Apr 2021 08:34:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OahmtfH2zD+aKo8rSCwERy2n2KEZz+aenxztrp8TIXZ18jD4U2P3Hhk8wbutF0wiFP9rVInFpch24pOBDUMw9Qd0W1ClZBL9+cNiQNeecolVDDJJT7TltafL2gTewdlfvUgQsILRs8hlxP+d/+pGjgQ7q1Z8bt+/YWxm3p44gI7q9r43k0sm15xeTvL1b9hD6vG/68PR1dbZwBrJEP2ExrfDKMjhQkoM7G90K2H2PV/q08tze3pypUwimjgzAcmXUE4sNU4XXJ+ZsE1ebQgjbNjZSW8DbupRyZ3Ny5vdnmi4H8okH73AD0T/2k4ChoGowKnTXAo8Q4qf9ODAMKxYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDrm5iYoNu/CafuBCAmHNUzE29LyHXUc7Sk+Slv/ySg=;
 b=MogeQPNghizUxNFndxkNIzr9AU2J2OnXGB6ecnvoik82iAR4IwU9+/CjdoSNoTKZQCb0lnr9zNgCjJh4e1ZnC9O4foH2+F2ItV+AlBBdVmt2hKw/P/+FramtebkDxnjbrnIqaabFYaiXW3dA9pbgqk5Dyq7Ql+9vPTA2JG1KrMzqL+7QSEJ6H2xLXlJXKD9KvxqR+vkBdO5cwk7AxZ62NN8HWRD42mZOmd6kuhU+yOST+AUySG3uWBOT+jGQi/MAjXhhvvOmEVFvJBluccCWDtK9VFDz9ZePUwLjyYFSVtxs9YB+IiSg8FvMAHpMLPecHcqrJMOxUw2AXziTM16CHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDrm5iYoNu/CafuBCAmHNUzE29LyHXUc7Sk+Slv/ySg=;
 b=MHUJCZJnNS0lANHXNKLr+7xc4dk0501f9W9lRV73K1eJYdM50T6GnCvcj05mXKYGHiK/jkHyVm6Vu0yOhlQet3lmPSTl56VNH1FMoihX92Ps2MiD+/7UN8DrAWWX6B60EaorjJy5IwpVUKTWF8PfOPzSmJ9DcmRoWe7VSCIl5sE=
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6271.eurprd08.prod.outlook.com (2603:10a6:102:eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 08:34:50 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::f4f6:3d5e:251c:efcd]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::f4f6:3d5e:251c:efcd%6]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 08:34:49 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@gentoo.org"
	<cardoe@gentoo.org>, "ticotimo@gmail.com" <ticotimo@gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/8] Xen and Yocto Linux on Raspberry Pi 4
Thread-Topic: [meta-virtualization][PATCH 0/8] Xen and Yocto Linux on
 Raspberry Pi 4
Thread-Index: AQHXOORAnTE5WKsK6UW3Ud1FIczooqrJQfiAgABe84A=
Date: Wed, 28 Apr 2021 08:34:49 +0000
Message-ID: <8553D8FA-9713-4FAE-9BDF-A00F3FD0E154@arm.com>
References: <20210424083103.202107-1-christopher.w.clark@gmail.com>
 <20210428025458.GB50215@gmail.com>
In-Reply-To: <20210428025458.GB50215@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.227.221]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: afb87e59-1e80-4d39-b044-08d90a2082a5
x-ms-traffictypediagnostic: PA4PR08MB6271:|HE1PR0801MB1660:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB166021021B68DEEFD1FCC6BE9D409@HE1PR0801MB1660.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zkt2RWPPou2CqONRZwIo4m7CvY4+cdKoUyK5JNyJ6ZMYIiaj9+LFMUcg3XujknBYAB+ce8dNqbpDlzxSt7WRNQmdyKtamEfEv2critK8oI1f3Spccm/gI4FnNU6hXXXbN+jGdl/BtPPL03DB+R60ypgHbkRE8sft1sE+lBndbkTGe6eoDjOnDqLnzVky0UW6yHpk7n4N1gbJLcAEaaNyaWM3WBHhpUMzRXIHL3y7xdJe3q1ffUkEl46xwi2HIUn5fbKTgHb+eU6iaECszFFIIWzA8nB3ZKcceogn6KfCgVHA3JNkOpfIFMSBj1DsjBkiy3swjzvJpmSEiZsfCz7ysU0zk1pX/g1n+DBsDO4oByK3B9ps4miCziCbf/C3kClt7kT2pSBLsmYcpa3QksYfVMF51+enw4EACmA1omgkOOt8aLnXC2SevoGjRPMu8YVLbuOOmHY8kYssv11hCF2lBkX+3BkRY1gjL28F2QmXMu4r6d3XO6T0a7MSk92IBfWik4x/GV+1GXp3QP3UhgbvKY2xvGQDAD73dQNIKGdL10RQCKiXWbpTVIo06XPC6fyLbnoYzZL0BNf30WdUqrPDimXPDgKAvLq2FqZ5giRqcOJHm6KfxdusGZErXj9qxNv6mN6YwfMDVCK2V/GW26MTANGmgQGv035TZZRtPo+0J/QxTMBl2KKcJBxYaA6a8Kc4RPW5K8vRe3HL1N+PTUZqaWUa7S/XUpEFZpFU2lK909M=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(122000001)(86362001)(36756003)(2616005)(76116006)(66946007)(4326008)(186003)(66476007)(66446008)(33656002)(26005)(54906003)(91956017)(6512007)(8676002)(8936002)(5660300002)(38100700002)(53546011)(6486002)(2906002)(66556008)(71200400001)(83380400001)(6916009)(966005)(6506007)(64756008)(478600001)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?DPdhFjOuuqcbApixwN83NTK58mju0z3uHvNl/eLbHg5JGW9UmD2Zouy9ovti?=
 =?us-ascii?Q?vtbpsnm+zw0ou4zjmAdKleKk7/PFw+ZkRMMDyzqBGUZyUCUD52ys8p+lnz57?=
 =?us-ascii?Q?C7uARbm8mRagvQNIj0fwTR8+favh517H56V6dtMJuQyTbMcpyePhwubmWtIy?=
 =?us-ascii?Q?PyLASs7G89ZfqhsFSKuZXcxDPd4FZ5QrPvoYZt5e8F9xvzNId5+PaJ2RQK7E?=
 =?us-ascii?Q?H/gxN4D7E3nGzlUTjpdw8ah9vk4hzZ1GF3oJfoIY5qHb0/gwMqjjmekALkKS?=
 =?us-ascii?Q?7QXx6A+9nTMuWX4IOn0hIIiI8aNF3CYpXwMsouxfkt4vcCCNTZi97qet4SAT?=
 =?us-ascii?Q?7s7tMu4DiW/NgIAUXEt4988NQlf79Kq6PkgiHhK2D8wgzm8Th94/rajUdFHY?=
 =?us-ascii?Q?b7wJbDHG1euxdP9uZH4Y2FcEXClByHW7WjBojrruvVA8zDRmtN4g7FNt8sFZ?=
 =?us-ascii?Q?MGB5ILNGPQ9UxVTtFeMXphv+BAbJUbssUEf8dokhsPWL4sZXcczShbGGqxDt?=
 =?us-ascii?Q?8vPYblo2TCH4/9vjiJL07UKKGYPvjaHorjUBMd7q09qwsTMkY3uTYCbsaazu?=
 =?us-ascii?Q?5OzJihC4SEYvAJ4VosGkeHE5BSPsxpQkMjtvposwyS4rZb9HVK/XxaWsrosT?=
 =?us-ascii?Q?fcC0irS9kW5FuR6VlPsrz5IKdv1fyq5AU+7v0yrQzJ7ZlE9qjskIWSS6lF/m?=
 =?us-ascii?Q?0uDhRY/igb2GU/MBArt/w2txAjufqUYAfDBDlG+KL0a4FgHfo3ina36byKuK?=
 =?us-ascii?Q?Kjdvtl6qTYWJ+sGdoNCVFZalGbo1f0LE/XTB+Ha+pl2ZbzHtc3hnlFw0sE+N?=
 =?us-ascii?Q?sSfsIdjQ/znnR7AzIg7xtrWp1gqXr/q7slkzYILt9iWGHAB/oHMSpInt08lN?=
 =?us-ascii?Q?TI2Wg2MBxn3tipjMua2VSPZoZLtS+LuSyHJj80HmtJ/LPAA8/jpTuPdGUYew?=
 =?us-ascii?Q?+A1POF4V5liuyLCHoSZyW90HT35joMI+roVtL+3p6/0IObpSiLBSPoz+sZDg?=
 =?us-ascii?Q?h5Rz2cFJcjftFh+7JqnAF6QG7vs0R9gMSALAONYwnYn8Yq5ttwDvfeh4YDl6?=
 =?us-ascii?Q?7dhubVjMraXBI4BxboZDZDVeFaYwwIbmdIxGC9zkS0UikASqlmb1PH+gaE6h?=
 =?us-ascii?Q?FqG+IW2dLb0y3dP3qHNdgQ+jEkkqSSFxq/eBADdYA6SgHFKyOWr0OR1rsAgW?=
 =?us-ascii?Q?cGiSiv0OvgQ1KT5EUh2FWfLDmaW1HXGly0Wtb1raTiOaTVQc9PaUbpbnaULw?=
 =?us-ascii?Q?7PXG+e/7x4sPv5WHwtsJLGPyoxxQe2ebdnjpoJSZJvdiNCWzDRJ/5t+fvaoz?=
 =?us-ascii?Q?5F1fXepZvY+Ozwz4+0KwjBh/CT/sCUzZ0c587loj8Mx+2Q=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6271
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	322bd7c6-017c-420e-2b31-08d90a207cd5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CY37wCqXIDjv+YlwCaH8CrF1svXskeITDx500VyrROPzwcgH70FYGHg4FhwhV2CaoobTQtYB7PwEfinPK71ZdJkxwnnVg/Z8cIhM8fQ8ERbgiyocLlms2SLMxwcUXw94UrL0TFsxeM4uV9uyF3+HhTVvrmzssvH82xL25cHWUTqQl25wKIDO5BHTAe3vzw1CKPxx3ZLUqj52Jvo6SLNya68KUw9BQlvGVlC/qg5+yLyyF3eJFKkgEOS2KiZtj+1LPy9g0YdQSjF/vrw8FfQS2vjGnoTsTUJnIDU7c5htfJgtypLv61r6NXGZbBIyDLfWsRRLWxguyhq1VqtcWFnJ1C6yFgKdeROVxqD5wSMApaDnuv2X3xEoIsl/7owRpl614dvnBmhnqHLuglDVqcdZ2kvJLNgHDnq4eGMaTqUfv3lI3ub3v0dqz//DAxbxChKnH3dT0H2xA4Dcr/8Irxm/527TXeRR3p0AZiNGI9MwIPIshGYEnSmexFpGrXoxfagEB8pJmWDSnYKItm/kOjAGZxu5n0cOyTDn2EYn/5fsJQgepWaA1R4W4br9k3xMt62/ovS6RvjN2Iyfas3FSPCU/NvgEnDBTvo9pwOV9kxJGyu1OBcdpSwqka+wioYVBZaI1odZHuIfv8se6TdEwjn+h+f1Hsg/CaYBh5Nkq7a7HYugPl3FmIjw4SY3hIKYbOVZHxtMfcZ4J6u/YsBcD+793r/8vhwhTRca5q5D0rogQGxqzxsYWEXz5iQxAtX2GMzkF8LQQjPMnlYGdHj8kIamEw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966006)(36840700001)(26005)(34020700004)(186003)(83380400001)(36860700001)(86362001)(107886003)(336012)(6512007)(8936002)(36756003)(316002)(47076005)(356005)(33656002)(82310400003)(2906002)(81166007)(82740400003)(6486002)(478600001)(966005)(54906003)(6506007)(8676002)(4326008)(6862004)(70206006)(5660300002)(2616005)(70586007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 08:34:59.5504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afb87e59-1e80-4d39-b044-08d90a2082a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1660
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <877FCF4BB08060439A1721A08316BD6B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

> On 28 Apr 2021, at 03:54, Bruce Ashfield via lists.yoctoproject.org <bru=
ce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> In message: [meta-virtualization][PATCH 0/8] Xen and Yocto Linux on Rasp=
berry Pi 4
> on 24/04/2021 Christopher Clark wrote:
>
>> This series enables running Xen 4.14 and 4.15, with Yocto Linux 5.10,
>> on the Raspberry Pi 4 board.
>>
>> Sets a new default kernel preference for linux-yocto for Xen on RPi4.
>> Applies some clean up to the config settings and dynamic layer.
>
> Everything looks good to me. I'll have to do some similar cleanups
> to the xilinx layers as well .. we have a RunX talk accepted for
> the upcoming Xen conf, so that's a good reason for me to do that
> part.
>
> I'll merge these on Wednesday if I don't hear any objections.

The serie looks good to me so you can add on the whole serie my:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I will not have the opportunity to actually test it this week though.

Regards
Bertrand

>
> Bruce
>
>>
>> Tested with kernel v5.10.25:
>> SRCREV_machine =3D "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
>> SRCREV_meta=3D"031f6c76e488a3563f35258c72ff1de3e25a512e"
>>
>> Christopher Clark (8):
>>  xen, rpi4: use the preferred generic multiboot,module compatible
>>    string
>>  xen, rpi4: drop the raspberrypi4-64 defconfig, xen_git.bbappend
>>  xen, rpi4, linux-yocto: enable linux-yocto 5.10 for RPi4
>>  xen, rpi4: switch Xen-on-Rpi4 kernel preference to linux-yocto
>>  xen, rpi4: fix u-boot script to load binaries from boot partition
>>  xen, rpi4: apply workaround to fix crash on boot with Xen 4.14
>>  xen, rpi4: move rpi4-machine+xen-distro cfg into dynamic layer
>>  xen, rpi4: add xen-rpi-u-boot-scr recipe for default u-boot script
>>
>> conf/distro/include/meta-virt-xen.inc         |  21 +---
>> .../distro/include/xen-raspberrypi4-64.inc    |  25 ++++
>> .../rpi-u-boot-scr/rpi-u-boot-scr.bbappend    |  17 ---
>> .../files/boot.cmd.xen.in                     |  12 +-
>> .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb  |  34 +++++
>> .../xen/files/defconfig_raspberrypi4-64       | 117 ------------------
>> .../recipes-extended/xen/xen_git.bbappend     |  11 --
>> .../linux/linux-yocto-dev.bbappend            |   6 +-
>> .../linux/linux-yocto_5.10.bbappend           |   6 +
>> .../linux/linux-yocto_xen-rpi.inc             |   6 +
>> 10 files changed, 87 insertions(+), 168 deletions(-)
>> create mode 100644 dynamic-layers/raspberrypi/conf/distro/include/xen-r=
aspberrypi4-64.inc
>> delete mode 100644 dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-sc=
r/rpi-u-boot-scr.bbappend
>> rename dynamic-layers/raspberrypi/recipes-bsp/{rpi-u-boot-scr =3D> xen-=
rpi-u-boot-scr}/files/boot.cmd.xen.in (80%)
>> create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boo=
t-scr/xen-rpi-u-boot-scr.bb
>> delete mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/file=
s/defconfig_raspberrypi4-64
>> delete mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/xen_=
git.bbappend
>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linu=
x-yocto_5.10.bbappend
>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linu=
x-yocto_xen-rpi.inc
>>
>> --
>> 2.25.1
>>
>
>=20

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
