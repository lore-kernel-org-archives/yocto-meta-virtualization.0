Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634BEC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 09:03:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.79])
 by mx.groups.io with SMTP id smtpd.web12.6907.1648026214197560680
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 02:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=GhYvtbtV;
 spf=pass (domain: arm.com, ip: 40.107.22.79,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85fkfGN2MvOy3w7frkzs7ZyYNqfIm6uswhg7zVQK5NE=;
 b=GhYvtbtV/aSrmzg3uU77QLq0luzAGKNu5Iu/toMp333BiSJwHxWbQrcIZ8XgJ//xeaGTR/YEDUTemiFRBfjQyUpRz0vt8nrAiWr4r2HRsD1ooKMOGDqGZzRG/WTeHeVYvghm2nsUTftpEVEHsZYwagWwsU0zyJ3EZhnZTFL/Z+g=
Received: from DB6PR0402CA0010.eurprd04.prod.outlook.com (2603:10a6:4:91::20)
 by AS8PR08MB6776.eurprd08.prod.outlook.com (2603:10a6:20b:350::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 23 Mar
 2022 09:03:31 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::9a) by DB6PR0402CA0010.outlook.office365.com
 (2603:10a6:4:91::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23 via Frontend
 Transport; Wed, 23 Mar 2022 09:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Wed, 23 Mar 2022 09:03:30 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Wed, 23 Mar 2022 09:03:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9021a91f7dd61ae8
X-CR-MTA-TID: 64aa7808
Received: from 56c91da25411.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 65B776C0-CFE8-4EFF-8D8F-03EAE2F86B2E.1;
	Wed, 23 Mar 2022 09:03:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 56c91da25411.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 23 Mar 2022 09:03:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jh9vCt5hN0f6xvcK2PpUovJXOCimoCRK4xZb7vndofwEbYorXoGibu7wl4+2MTuymOceOKAkiZGtzDhVnI/fEulsJMy3Xa3nH2QLPNzYXoW8StkJC3EXPw48I8H7eXC8Lyx+2ldjLHG4YEmVEOO7tiLEhU9GQ5WowqJ/bdACcJzibMet4+itdYm9qDGXhK2qTezH0rANyNYE2kbL4RBOzaMbO+hogiSzPrzefZ/oXEQhHGywcCt3ue9Kxu3Y/7LRBRxpl9f8isqhfWUHqqlPpNlH89jMNWdYUx9wxnobhAYZf/Km0rzoMThoLLtNYmqCSZsObriajKjtDfAlwnWr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85fkfGN2MvOy3w7frkzs7ZyYNqfIm6uswhg7zVQK5NE=;
 b=Byo9HrInK8HpBwGtG3icLCdZPnb1yWW1gF2jQ5tk6zX6brntudcgVmAziiBIoz3Vv79macptDPIJVEjyVJh/kA/1KiJrLdcXUjyLNSPJFwGTZBUuomgTHuynwQ/cV0E1MoO1mvpecwxUsXAwvONmN9F0oLPEeLSLzpYfMnjTbFvdghnFhMwoRDecCNYwjteUXcmPSJSV0b++XLua/KyIi7J5Vw9DDflQVzL7OPOUKtexSmCGZP0oUxb+Wl6NtKahl4jIXdEHRl/63nfA1Y2EVAJ3iVH39ijQnC2/xKSvNQdbjYSMG0ITOe5QOiokyOMZcNg0RB7MC8tQd0PtBrCH7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85fkfGN2MvOy3w7frkzs7ZyYNqfIm6uswhg7zVQK5NE=;
 b=GhYvtbtV/aSrmzg3uU77QLq0luzAGKNu5Iu/toMp333BiSJwHxWbQrcIZ8XgJ//xeaGTR/YEDUTemiFRBfjQyUpRz0vt8nrAiWr4r2HRsD1ooKMOGDqGZzRG/WTeHeVYvghm2nsUTftpEVEHsZYwagWwsU0zyJ3EZhnZTFL/Z+g=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR0801MB1701.eurprd08.prod.outlook.com (2603:10a6:4:3a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Wed, 23 Mar
 2022 09:03:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 09:03:13 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Paulo Sherring <pauloasherring@gmail.com>, Diego Sueiro
	<Diego.Sueiro@arm.com>, "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Topic: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Index: 
 AQHYPdhS69dDmEOgMUyYUvghdSytY6zLN9uAgAAFYICAABeWAIAAAxMAgAAFkQCAACJJAIAABfmAgAACFICAAAYkAIABGP0AgAAHB4A=
Date: Wed, 23 Mar 2022 09:03:12 +0000
Message-ID: <B0EA9CF2-1834-4441-9CC5-A55191A09470@arm.com>
References: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
 <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
 <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
 <CAG9RwPL2adysD-Wyu7eN2jmo85b-Ufx6TWoSe82dJ-XQRr02EQ@mail.gmail.com>
 <D673A4B9-BB22-41AA-A13C-E19F1EC52BCF@arm.com>
 <CAG9RwPKbpORfL3FkARJuT=fAM5PZGY-Lkv+PQ-rEjt1+j9qVeQ@mail.gmail.com>
 <26959151-CAA8-4FDC-808D-51F58228EC06@arm.com>
 <AM6PR08MB34615752123840EC55863F2492179@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CAG9RwP+_FzmRwL9O7wMuGPOtVDjh30Z=UZNfeav4ELxga=8n5A@mail.gmail.com>
 <16DEF5BD23F06258.15837@lists.yoctoproject.org>
In-Reply-To: <16DEF5BD23F06258.15837@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c6f18fae-cfd4-4eee-1c43-08da0cac008e
x-ms-traffictypediagnostic: 
	DB6PR0801MB1701:EE_|DB5EUR03FT018:EE_|AS8PR08MB6776:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB6776AC4F675E3391A53636509D189@AS8PR08MB6776.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZgcESG5nVTfc13qoIPSVW64lJxU/l+z7Ffyeq994yz3hcAUbhDkEcFFEHvpmrtcjVETQwB14/7vf2Q2dr6JT7KXScA3VC2Mye7ny7s3S3SofTYZgVWkHO/WlnaWl2vhz35j1v98V/b48hZC13IQo5kB75bcB1shQ/lSAuIlJ+XCZngDQPXvyU9QDekrcC2vxeIMsw8iplt95y++6LH9ttz5Sct1e3AReQaKAdlJ0+6LCkSwmki2jZDhYZrAglB7BYLemjy/3o8IG56VS6gI/02ljjR4nvXJMq7DcIPuocPNb9h853sYtNXI70Wby47xsf/sRv2Vq2gNA7fMFhp18CS4dXc0k8ZvcGsxrnaegliEgotrLU9VPuYy7HxoFLZrJL4uMOuc5wu/EbMhp65UobKx6518Vb419sXHxgame4Gva14TpnlSN26VrMA14J2xXYwrJLxsAXmiuzMg1vfYG+k9c6ivQeMzUxS2mvKhQczA2/n9nWM4uGharC6yfCsEeR7KMGY7C59qqFyY2fS6A0/ncDM+8jsK0ThLoXck2NeMsCYQU7C0FnZ2aHVpKDjoCVEJ28DlU0OY8VelEgnJYaRpdBNffjGJaIadwngHMbAZWAs/63S1cTbfzl5bMyI4XgwpaB2HXkHstGFhptVAHxxSr4Wb7GVWLxs1MxnQwm5tkhNf3yGiihenPWJAC1TTa4/xIg+kgB69X+LbzqB76FEwK20xe/FI7QqBuaoGTT0gf7Z6Ze/qdVwF2o4TQ13t1CETFUGTxFTv0sLaL63XCrlJ+5nLJZccvQ4iU5FqoRojMKDXCYqGwMxNS2MCzhHFdDntFFRo88bINcB3OtTzewZlWAXeF+w+61HgtT2sglfE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(2616005)(64756008)(76116006)(66476007)(4326008)(66446008)(8676002)(66946007)(66556008)(91956017)(316002)(8936002)(36756003)(6916009)(54906003)(186003)(5660300002)(38070700005)(86362001)(38100700002)(83380400001)(122000001)(966005)(6506007)(33656002)(508600001)(6486002)(71200400001)(2906002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A933050F10D9584D8CDA4BA5F3FAF4DF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1701
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a1ab9061-6cd7-400b-8243-08da0cabf5df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Umjs9ERKFl+m8w7YJclHvaDrpk5KZd1qi+sa9+2ahWLLhw5Y+m/CF0pSdA/GxwYk99/oKeJCiiARZvcUqXsxcW6INrby0NZPCOoMh4RofrKA18qywzoqgaRIFTxRfj08vxSvAruWFiCQlP7Xlh3oFrEHhVtvwSzKv2EguRnPyefF7/RjeE8A1RL+SXolJmVKaQwpKGzjwhLK+B8dLRXBqhGgRa/dHMAKdyIZAY643OUdB0yBuwauvbcb5tQjPvCGUcr++yh6YFuPhGx3EwBZ+j3EoIXWtCNp1NN/558oBnuIw6z3nc+6Xfo6ZtFGizp6I8rZvc2MNcnOwexyC7b15ZQGenkTwot1uNX7ctibuptGLOue+jE3QnJ9xvZ3SB7aushxPB5s5NWcC8s6Y7RLm29xcjjhBjjn0FgssXIDGGMG9TP5QV2jFjTbBCtlyweHV/KQ9WU1whAbR1IveH4TlAUL4uo70Tt7EXax3YsH90P6I/d3RMA89zpCJQABA7u5obRXYIePFLfHAo74H8UtmrIpx+nobuG5VQo2pKoTMVDl8NW6MRhbJyLJWAVzynsPjWSXyFdbCAIyPCDL1AWRzjjmx/mFC5bDSW07+dHbHE3dYZ1QbmTSQHJ5rb7Ccl0jp/FtVTMj61r+MIpYrLeQMAM1JWy0hlqjn/htgDgWZIUin8e28IlMHY6v+zs3lMGuVgJKg2O9uq01ZATAX20HDL6+rG61U5ibmYmbMN7bxxHJ/DIsaxOglhvvbdHNheDshoJCdONmDSuVRYIMRxQ2dQpo9/mzMr5nHcZP5Ir2IbQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(5660300002)(508600001)(8936002)(53546011)(70586007)(70206006)(8676002)(82310400004)(6862004)(4326008)(356005)(81166007)(36860700001)(86362001)(6512007)(6506007)(316002)(40460700003)(83380400001)(54906003)(26005)(336012)(186003)(2616005)(47076005)(33656002)(2906002)(36756003)(6486002)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 09:03:30.9568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c6f18fae-cfd4-4eee-1c43-08da0cac008e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6776
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Mar 2022 09:03:36 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7107

Hi Bruce

> On 23 Mar 2022, at 09:38, Bertrand Marquis via lists.yoctoproject.org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Hi Paulo
>=20
>> On 22 Mar 2022, at 16:52, Paulo Sherring via lists.yoctoproject.org <pau=
loasherring=3Dgmail.com@lists.yoctoproject.org> wrote:
>>=20
>> Hello Diego, Bertrand,
>> Just confirmed that by bringing these changes into hardknott, the
>> modules get correctly probed on bootup.
>=20
> Great thanks for the info.
>=20
> @Bruce: Maybe it would make sense to backport this as hardknott is LTS ?
> If yes, please ping me if you need support to do it.

In fact hardnott is not LTS (my mistake) but as support is broken it would =
still make sense to backport this I think.

Cheers
Bertrand

>=20
> Cheers
> Bertrand
>=20
>>=20
>> The xen.conf content, just for completeness:
>> xen-evtchn
>> xen-gntdev
>> xen-gntalloc
>> xen-blkback
>> xen-netback
>> xen-pciback
>> evtchn
>> gntdev
>> netbk
>> blkbk
>> xen-scsibk
>> usbbk
>> pciback
>>=20
>> Thanks for the support :)
>> Kind regards, Paulo.
>>=20
>> On Tue, Mar 22, 2022 at 3:30 PM Diego Sueiro <Diego.Sueiro@arm.com> wrot=
e:
>>>=20
>>> The xen modules load from systemd was fixed in master as https://git.yo=
ctoproject.org/meta-virtualization/commit/?id=3D44dad5105d408e7b6217600eba3=
672e72db0f42f and honister as https://git.yoctoproject.org/meta-virtualizat=
ion/commit/?h=3Dhonister&id=3D6cde8f2ccbde5ecc9997cf727939a0ae5e0fe11d.
>>>=20
>>> You might need to backport this to hardknott as well.
>>>=20
>>> --
>>> Diego Sueiro
>>> Staff Software Developer - Automotive and Industrial Solutions (CE-OSS)
>>>=20
>>>> -----Original Message-----
>>>> From: meta-virtualization@lists.yoctoproject.org <meta-
>>>> virtualization@lists.yoctoproject.org> On Behalf Of Bertrand Marquis v=
ia
>>>> lists.yoctoproject.org
>>>> Sent: 22 March 2022 15:23
>>>> To: Paulo Sherring <pauloasherring@gmail.com>
>>>> Cc: meta-virtualization@lists.yoctoproject.org; nd <nd@arm.com>; Bruce
>>>> Ashfield <bruce.ashfield@gmail.com>
>>>> Subject: Re: [meta-virtualization] Loading the module xen-gntdev on bo=
ot
>>>>=20
>>>> Hi Paulo,
>>>>=20
>>>>> On 22 Mar 2022, at 16:01, Paulo Sherring <pauloasherring@gmail.com>
>>>> wrote:
>>>>>=20
>>>>> Hi Bertrand,
>>>>> One very important piece of information I missed to disclose: I am no=
t
>>>>> using runqemu, as it was not being properly set by the resulting
>>>>> bitbake build (the resulting image was pointing to the kernel instead
>>>>> of the xen binary).
>>>>=20
>>>> This should not impact the module loading.
>>>>=20
>>>>>=20
>>>>> So, I am launching it "by hand":
>>>>>=20
>>>>> ./tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-nati=
v
>>>>> e/usr/bin/qemu-system-aarch64
>>>>> \
>>>>> -nographic  \
>>>>> -machine virt,gic-version=3D3 \
>>>>> -machine virtualization=3Dtrue \
>>>>> -cpu cortex-a57 -smp 4 -m 4G -machine type=3Dvirt \ -bios
>>>>> ./tmp/deploy/images/qemuarm64/u-boot-qemuarm64.bin \ -device
>>>>> loader,file=3D./tmp/deploy/images/qemuarm64/xen-
>>>> qemuarm64,addr=3D0x4500000
>>>>> 0
>>>>> \
>>>>> -device
>>>>> loader,file=3D./tmp/deploy/images/qemuarm64/Image--
>>>> 5.10.103+git0+792f127
>>>>> 2dd_3aab5bb12b-r0-qemuarm64-20220317212819.bin,addr=3D0x46000000
>>>>> \
>>>>> -device
>>>>> loader,file=3D./tmp/deploy/images/qemuarm64/Image--
>>>> 5.10.103+git0+792f127
>>>>> 2dd_3aab5bb12b-r0-qemuarm64-20220317212819.bin,addr=3D0x48000000
>>>>> \
>>>>> -device loader,file=3D./virt.dtb,addr=3D0x44000000 \ -drive
>>>>> id=3Ddisk0,file=3D./tmp/deploy/images/qemuarm64/xen-image-minimal-
>>>> qemuarm6
>>>>> 4.ext4,if=3Dnone,index=3D0,format=3Draw
>>>>> \
>>>>> -device virtio-blk-device,drive=3Ddisk0 \
>>>>>=20
>>>>> And then stop it on u-boot, and setup the fdt:
>>>>> ## Dom0 only:
>>>>> fdt addr 0x44000000
>>>>> fdt resize
>>>>> fdt set /chosen \#address-cells <1>
>>>>> fdt set /chosen \#size-cells <1>
>>>>> fdt set /chosen xen,xen-bootargs "dom0_mem=3D512M"
>>>>> fdt mknod /chosen module@0
>>>>> fdt set /chosen/module@0 compatible "xen,linux-zimage" "xen,multiboot=
-
>>>> module"
>>>>> fdt set /chosen/module@0 reg <0x46000000 0x1373a00> fdt set
>>>>> /chosen/module@0 bootargs "dom0_mem=3D512M root=3D/dev/vda rw
>>>>> earlyprintk=3Dserial,ttyAMA0 console=3DttyAMA0,115200n8 earlycon=3Dxe=
nboot"
>>>>> booti 0x45000000 - 0x44000000
>>>>>=20
>>>>> Please find also some more information below:
>>>>>=20
>>>>> On Tue, Mar 22, 2022 at 12:59 PM Bertrand Marquis
>>>>> <Bertrand.Marquis@arm.com> wrote:
>>>>>>=20
>>>>>> Hi Paulo,
>>>>>>=20
>>>>>> Hardknott is long term while honister is not but both are stable rel=
eases.
>>>>>>=20
>>>>>> I am not quite sure I get your 4.14 pulling 4.16. The 4.14 recipe is=
 building
>>>> the latest 4.14 version of Xen.
>>>>>>=20
>>>>> That was just me being silly. I was looking into xen_git.bb which
>>>>> clearly is not the preferred provider. I am in fact using Xen 4.14, a=
s
>>>>> you pointed out. Sorry for the mistake.
>>>>>> From what I see modules to load are in a xen.conf in modules-load.d
>>>> generated by Xen tools compilation.
>>>>>> Gntdev is properly listed in the current xen source tree as one of t=
he
>>>> default modules to actually load on boot.
>>>>>>=20
>>>>>> Can you check the content of modules-load.d/xen.conf (somewhere in /=
etc
>>>> in your dom0 roots) ?
>>>>>>=20
>>>>> I have nothing there. But, I did have two hits when searching the roo=
tfs:
>>>>> /etc/tmpfiles.d/xen.conf
>>>>> /lib/systemd/modules-load.d/xen.conf
>>>>=20
>>>> This is the interesting file.
>>>> It shall be used by systemd on boot to load the modules required by Xe=
n.
>>>> Please check if gntdev is listed there.
>>>>=20
>>>> If yes then this is a systemd issue, if not this is a Xen issue which =
appear to be
>>>> solved in xen master and I will have to check in the 4.14 version used=
 by Yocto
>>>> LTS.
>>>>=20
>>>>=20
>>>>> Not sure if there there is some sort of startup script that was
>>>>> supposed to move around these files or even if
>>>>> systemd-modules-load.service would be supposed to be looking
>>>>> elsewhere.
>>>>=20
>>>> No the lib one is the right one for systemd.
>>>>=20
>>>> Cheers
>>>> Bertrand
>>>>>=20
>>>>>> It could be that this was actually missing in the xen release you ar=
e building
>>>> or that systemd is not actually loading modules listed there.
>>>>>>=20
>>>>>> Cheers
>>>>>> Bertrand
>>>>> Cheers, Paulo.
>>>>=20
>>>=20
>>=20
>>=20
>>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7106): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7106
> Mute This Topic: https://lists.yoctoproject.org/mt/89949013/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


