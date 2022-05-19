Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55361C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 07:21:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.81])
 by mx.groups.io with SMTP id smtpd.web11.4754.1652944890806182407
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 May 2022 00:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=GKEmA9PT;
 spf=pass (domain: arm.com, ip: 40.107.22.81,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Tm2s4rtUhBWCg1nnWctz8cCXDC5HuqjOsUIpaH1SGa7ix7nL7JbceJ+/wAeLA/ZmWnP6e1Nb6HnabCTNksC5Ve/I3u1x8/yj/QQlnAhQGVRXd0MyYQdLW1aQwYWXP+vz3KTOKNFfip1L7jbpDMa0WSnk8PrJfgdFT7xWkf19lY/Bk0izmoaO2ThZror9TX3W5ZgVnQPKpYvtH1htohV+jGHEaVd9FFC4VEvbYwwuQdsUMcQ4DfQ6fYXUIsYAiqk74MO0OqhHoAa3Wqs2eJSKAH5NHcFQxJ0pQN0HVOCFD/GMGVUVYVWeN2Gp86AjbVnez2x+pC6pgnkdjyW6Ggi9mQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwACIqVLpxiZhzP70x3MsImmOYF4pF0OXueLfTqaewE=;
 b=mdDu8PF0NW4rd+tF4Z5HYtsPEUmOEgEkyfDA1drD8nNS4W/KlGLox/KdF1FxRo37guKUlSrQQTUn4KrcOTnaumLCeGfLzWsS6hNHCe1OIfDALHhMj4/UlaweEog/yz8k5KYHvlUzQMIrbHF8ej72054wiNwW4S9JQpeB3348dIq+epUdMI2bDoKCHpNV4BXJFIBQyMx6MVk/4JxTtEhjkQJbdBuCxelIPjKWlupwjKiEsqt5rgRXOIH1K/lp7akNTyiiNB72FV+pUJYHETj8mK9ZwyOsVsM+GyUtvSdSoo+xj0JmpKpyWFFIGKmi1FBU7DpRyz0qtysFxYrdvYVJAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwACIqVLpxiZhzP70x3MsImmOYF4pF0OXueLfTqaewE=;
 b=GKEmA9PT6kUQPPAvgbGt4gknIgiB5T7Rc6KXYc0DkeVNK4UA4i6u/f3n984jXPMUtcYpkENMPA/AT/cXXyjM0O7r0zkR2IV7CAG2hJMCuhN4c0Fb05nly7C5r/dux7laHu55T3l/2FBF3aioR7mCLLQoexzdmnM8m8p7609wypM=
Received: from AM6P191CA0106.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::47)
 by AS8PR08MB8136.eurprd08.prod.outlook.com (2603:10a6:20b:561::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 19 May
 2022 07:21:27 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::3d) by AM6P191CA0106.outlook.office365.com
 (2603:10a6:209:8a::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Thu, 19 May 2022 07:21:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 07:21:26 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Thu, 19 May 2022 07:21:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d02c5b84885f2e5
X-CR-MTA-TID: 64aa7808
Received: from edc119ce3fc1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6CF30F22-B927-4327-AF41-E433EDB85D2B.1;
	Thu, 19 May 2022 07:21:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 edc119ce3fc1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 May 2022 07:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jy2ubPzDporRQ8SkM78bG0YgxCN4I1P0Bt93UrtyK2L9VV9stavB/035hWOgEqxiWApvsOgjnQPR4ft0qcCojZv2VlAr/OQRSGShcetHWRG3OIViiEBQZ3hIi2xCt+x/nXpEv72bCIEe4PpcQ/YxM6aZJCO1comqy1XsFieseZ6XOywzDyvbBXtuk0SZtQLpoBoQskDEr9+u1SE6pQyEkfH7ykrK31QGvLi/o90V8dO623EtvWyQisNF+amt1MkPVimavcgGGwinBJfbWoW3RYwHD1QPmR29ooNDQLZZy4hW8ZOmjplyX6zr8no59YJM4H5YmoDML1/gSRpZiyzcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwACIqVLpxiZhzP70x3MsImmOYF4pF0OXueLfTqaewE=;
 b=gWzbSvCyvGFqlFwVAFPHIpoAbwJStzIVG+zGksluhLnaaZ6plS+t5OdGS3Ao52TWMObiMo1h3DOTGJZZeR9RPsK83A4Lnf2n3Z4rfeqELEaHNw1YMjxqusv61dNw791JGJWbQuJNyPZicgJTzqGKe5+37mJbwtm198HWuMWWKUerjw1oUklnJkeih/IHNWOHijeYwUxU+x4uJCMJSwDXmXN8xkmFbNv3qZzwyrR4YZCtCuJWxBuCRwmEmEfNQDtFbanq9fZxtXpVGNeHwRI4Fn/JKH8s0Ex08jFceDOQKu+jbCkXwV+K8uhyao2y1QM20mjKcEq8kLWIOGfJqSKAzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwACIqVLpxiZhzP70x3MsImmOYF4pF0OXueLfTqaewE=;
 b=GKEmA9PT6kUQPPAvgbGt4gknIgiB5T7Rc6KXYc0DkeVNK4UA4i6u/f3n984jXPMUtcYpkENMPA/AT/cXXyjM0O7r0zkR2IV7CAG2hJMCuhN4c0Fb05nly7C5r/dux7laHu55T3l/2FBF3aioR7mCLLQoexzdmnM8m8p7609wypM=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB5257.eurprd08.prod.outlook.com (2603:10a6:10:e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Thu, 19 May
 2022 07:21:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5250.018; Thu, 19 May 2022
 07:21:16 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH v2 4/4] xen: Disable PCI on qemuarm
 with Xen
Thread-Topic: [meta-virtualization] [PATCH v2 4/4] xen: Disable PCI on qemuarm
 with Xen
Thread-Index: AQHYakw86rzHsXQKCUOErMX005B1e60k7XGAgADgA4A=
Date: Thu, 19 May 2022 07:21:16 +0000
Message-ID: <FF458867-D61F-43BA-A551-E7547E6FA9A8@arm.com>
References: <cover.1652196703.git.bertrand.marquis@arm.com>
 <39d2a5b406c9445ad1e19a1315254e2d049ced60.1652196703.git.bertrand.marquis@arm.com>
 <CACMJ4GZ1ApagfEG-g6Wf46Ea29YVLowtP2Mi0-CK8_h++eKrrw@mail.gmail.com>
 <CADkTA4PszL3E0H4T3U-J2Gu72MNagtHppEDsUWEB+q3ax1fHnQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PszL3E0H4T3U-J2Gu72MNagtHppEDsUWEB+q3ax1fHnQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e2fccd16-a44e-458d-28f1-08da39682f66
x-ms-traffictypediagnostic: 
	DB8PR08MB5257:EE_|AM5EUR03FT045:EE_|AS8PR08MB8136:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB813643698CB40999DBAA7EEE9DD09@AS8PR08MB8136.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2SCQ8CvCmtpMQJ9KEUkccYrysJ7blskh74uNNfy4AprzxMBKFsgU4+Xp1RG46Y8UGOfEagDDvreE7O7lTP3kUHWFtx68nSEIaQzSWpRXAnwNbg4iEtpNLyo6NVgSjLCfJe7m9YTJEPVEfxzDnKP1u5jiKgXeRQzFW1COXAz2f0HsD0i4Ovf+yv+fvQFxcwEEhXQ6R1Bfo/0ZbxSupvCHowekhWMEVoIxDzryvrcI8SIurpa1kIIfElqrqRsWIVd2eJx1pZei+tysGG2on+0JMI27FzmicvE60T7hJG1YDpAOudoeWRe06qAkItA6JCIeJNdFb0bOl3PhhyPAdI7EPRmiY0bikm4TafBfjeZdgZsk4vjQMIfsvhMd/PT4K/zV+593OLPUs/JpnRSV3D9DmVZTqTV/VBhBc1rGqziqrTeqsRxVKzKwWK1TEHbC4Fak4V5JzNVbMpcLy9zzNnGjmEFIGhz3JpiMmbLSawrxuVM+8j9wiP25aaAY2eqfUgkFw6dXNaKeOXh4x4V6nTLWABA3mR9S6c251+LOypfnFPXG5AUexsPWItuP5QvlG5q9ezgRuXL58FZBvo20GTnL5UvRmoD8fAxVyesW9fUcUeLL5QOrEYs0ghYw1ba9VSq9gc9ZlxUf2dA5j1irUISTlUobLpi5CWo1Xl7e7V/JHJMUQY8A8vBMAGXuCwPHtbghP7hT/grJuj8ThZG57mHDy05TdKR06kVzPDI51Dlb7ium/PJ/ONrGXTE2O/LjdqxB1t9BzcW856cf4r1NsyuCMCgMc6ndl8izKSGn+Hy9ZERQUI3M/jkDIeBNvqK3EZCTJp7CwM3DKRxZlZXAbH78rmmzxl4gECeelP1kR+y58FY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(6512007)(38070700005)(186003)(83380400001)(2616005)(38100700002)(5660300002)(33656002)(8936002)(2906002)(53546011)(26005)(66446008)(966005)(4326008)(66476007)(91956017)(66946007)(76116006)(54906003)(71200400001)(86362001)(6916009)(8676002)(66556008)(6506007)(36756003)(64756008)(316002)(6486002)(508600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A9C8D7224BDB0F44BE6168AB8E99D0CF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5257
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cf844a21-6de2-43eb-55ae-08da396829b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TXUyF5xWCOMVPaL2xeTyHKEoO9Gn4GO9uhg8C9CjJ9f4imPu6LYKBgJUQd3sBfZCq1sDHm+ZKi232/fKwHOGsWAJHDHoJumtEuP9T9/nlzZzuEYrxdU0jm+nUUNzFVU+gOhMO6Nh0K1Dqr1FFybPcf+VjF4qCoQ8nzNOe1Q4OZvK/QTrC6xPZuxXJ2gMqbSkUm1NLROiMMtHm2i/YEslaOWkZULJSArEJT0mOPS4HGcVQF5UEtWWaMA1BM8FUznFW0k2C/F8T+CZKoPrhT0Q44Q7lzwFWS2y2s6cs+4Au+pOIBAcaL3MmmW7ZZx201/ETu8/ON+Yc6Fs5401zMmnXJpQul5Al8pxXbm8Vz6TMEbGPCmeFEipNmj5yutzPapY8BdzJBXsXKdvLxDHcKmCdhNiBE2Xsq+osRw7FwiIYYY7Le6a+IBOtK8Yqgz5gzcNnShvfUzz7Tpj2h0ktg1ugXlr+HsJab9FRYvd1a5pHC/NSOTk+tn4g/zIbcq1i0Ls+4YU7J73n7/cHvh3U9W8f++QtkUqrFRqNOLzNRVXwFb9EUS2hSD5Oc8gIbwf9LqWH7ZIB5M2QPqTgRrtyssTucZzdT5gxN3vRLx/YrdR0V6aBuH9yyfWur+QqER84UZiGjWOMtoqXBAwU1D+Yr/5Hv/LT+Kz9p/Oh5zitkrHTon8I+f0fH0sNUQnXnpXV/OlZEg75f/A+yl1FR/z7xkQf2k5jKhNLCnXMfEWidlKC7i+/8o1fefQKrrJmZ1mwqF/nT0Xp7blRwbSj9tjPl4qlW8BBm8YwND8+o2k5l4OCdHAyezvmz36vEBXguiJbjRUeUM41St1JjSuJMXhfXyG4w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(966005)(54906003)(6486002)(40460700003)(508600001)(5660300002)(86362001)(81166007)(36860700001)(2906002)(356005)(70206006)(70586007)(8676002)(4326008)(2616005)(47076005)(186003)(336012)(83380400001)(6862004)(316002)(8936002)(53546011)(6506007)(6512007)(82310400005)(26005)(33656002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 07:21:26.0383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e2fccd16-a44e-458d-28f1-08da39682f66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8136
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 May 2022 07:21:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7289

Hi Bruce,

> On 18 May 2022, at 18:59, Bruce Ashfield <bruce.ashfield@gmail.com> wrote=
:
>=20
> On Tue, May 17, 2022 at 8:14 PM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>>=20
>> On Tue, May 10, 2022 at 8:35 AM Bertrand Marquis
>> <bertrand.marquis@arm.com> wrote:
>>>=20
>>> Remove the pci node from the qemu device tree when runqemu is used with
>>> xen-qemuboot.
>>>=20
>>> Linux is ending up in an infinite loop when trying to access PCI
>>> configuration space when running on top of Xen on arm32.
>>> As we do not need or support any of the devices on PCI on arm32 at the
>>> moment, just remove the node from the device tree generated by qemu.
>>>=20
>>> The problem does not appear at the moment without Xen and it is unclear
>>> why it is with Xen.
>>> This will be investigated but in the meantime provide a working
>>> configuration for users.
>>>=20
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>=20
>> Thanks for this - my review is from inspecting the patch applied; I
>> have yet to test it but there's no need to hold this back with
>> positive reports now from Bruce and Bertrand.
>>=20
>> Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
>>=20
>> thanks,
>>=20
>=20
> Everything is merged to master and kirkstone.

Great, thanks a lot :-)

Cheers
Bertrand

>=20
> Bruce
>=20
>> Christopher
>>=20
>>> ---
>>> classes/qemuboot-xen-dtb.bbclass | 22 ++++++++++++++++++++++
>>> 1 file changed, 22 insertions(+)
>>>=20
>>> diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dt=
b.bbclass
>>> index d43d23a..1f17a86 100644
>>> --- a/classes/qemuboot-xen-dtb.bbclass
>>> +++ b/classes/qemuboot-xen-dtb.bbclass
>>> @@ -63,6 +63,21 @@ write_lops_xen_section() {
>>> EOF
>>> }
>>>=20
>>> +write_lop_rm_pci() {
>>> + cat <<EOF >"$1"
>>> +/dts-v1/;
>>> +/ {
>>> + compatible =3D "system-device-tree-v1";
>>> + lops {
>>> + lop_1 {
>>> + compatible =3D "system-device-tree-v1,lop,modify";
>>> + modify =3D "/pcie@10000000::";
>>> + };
>>> + };
>>> +};
>>> +EOF
>>> +}
>>> +
>>> write_lop_add_to_xen_cmdline() {
>>> EXTRA_XEN_BOOTARGS=3D"$2"
>>> cat <<EOF >"$1"
>>> @@ -135,6 +150,13 @@ generate_xen_qemuboot_dtb() {
>>> write_lop_add_to_xen_cmdline "${B}/lop-xen-cmdline.dts" \
>>> "${QB_XEN_CMDLINE_EXTRA}"
>>>=20
>>> + # On Qemu Arm32, Dom0 accessing PCI config space ends up in an
>>> + # infinite loop. Remove pci node from the device tree
>>> + if [ "${MACHINE}" =3D "qemuarm" ]; then
>>> + write_lop_rm_pci "${B}/lop-rm-pci.dts"
>>> + LOP_MODULE_ARGS=3D"${LOP_MODULE_ARGS} -i ${B}/lop-rm-pci.dts"
>>> + fi
>>> +
>>> if [ -z "${QB_XEN_DOMAIN_MODULES}" ]; then
>>> bbwarn "No domain modules: please set QB_XEN_DOMAIN_MODULES"
>>> fi
>>> --
>>> 2.25.1
>>>=20
>>>=20
>>>=20
>>>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7285): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/7285
>> Mute This Topic: https://lists.yoctoproject.org/mt/91015801/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II


