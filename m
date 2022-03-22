Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC8AC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 15:23:13 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.51])
 by mx.groups.io with SMTP id smtpd.web11.11433.1647962591224703753
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 08:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=0J+pr3AO;
 spf=pass (domain: arm.com, ip: 40.107.7.51,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqQcNokYOBT3/vyBKRcrn0TwAG3yFWRfRAazRjYWDRI=;
 b=0J+pr3AOqJSX059BUCaTXTuJhhuXR+yMwqmQzVafxCYYgoh97iR+wU18n7eBs+7AukeWpVX5G/YZ4RWIEC8Sg4FHoaQnkWYWvYwvM535fOnF6dFF+3oWs9sMYz5Ac77JV+OcOCqAm5LqhQG8GJfad5ZtJjEpwDwiBdIIMN/XkyA=
Received: from DB6P191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::34) by
 AM0PR08MB3411.eurprd08.prod.outlook.com (2603:10a6:208:dd::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.16; Tue, 22 Mar 2022 15:23:06 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::7e) by DB6P191CA0024.outlook.office365.com
 (2603:10a6:6:28::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26 via Frontend
 Transport; Tue, 22 Mar 2022 15:23:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 15:23:06 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Tue, 22 Mar 2022 15:23:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: deb065dcfdebf0de
X-CR-MTA-TID: 64aa7808
Received: from 5977b02dbdd9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F24B3936-BB09-4B2B-A3DF-6C21FED28131.1;
	Tue, 22 Mar 2022 15:22:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 5977b02dbdd9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Mar 2022 15:22:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7mCYcL/yPJr6qSwEp2FfRLhICGRvhF0vfEav+EgGZNirH+SHpXAY8VrYa/pUeSjIdduOY8t8hNvfmBP3k7eu9Sy+2kY1chIVPmM6ktUwKPhrztzCLKnwp8F1t1gCDVsaQ3mRSqEHVo09cuYbGnsqt2faic7Xs/T7qCDnvkSOfiGhJQ5OE4Ur0pTqQcnoJcRDU25mwWNdgZ6WcfklgZteNiJ5CcrFFYuGKc58mR30PiPCSdy0vyNF4NaVruLK/LD53NvhDqkWoSz0DFwdy8d/4dZdJOamIc8u58HEMOcQkton6GZl/ahyz1NEcZhFiGvV5FHeOHxoLr9iSrVX2ZFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqQcNokYOBT3/vyBKRcrn0TwAG3yFWRfRAazRjYWDRI=;
 b=NciXYC3bk6Ayu+QVHRX8Vc0+YTn4C89D8T3heaSRLHUwvzNMvOQWID7g24QIT42Pck/CQcCBQXFwiAX4kbl6Al4Ytd+9vACW65s6Bj6uxnvawaK+jZ9c0WEXiFQoXaBH9qDlFIVR98QuJHdx4lTj0p0wQN0oEi5aO0zAOM65tk+ZN6pwR+y7ojLLKKoX16hKBfwUNOr4Nop9EsLjg7erQ2+IztrdR2gNh+ah2Xne8LWfoiO1vUV+CX983hx6rZB4r38+vqaZnd1pV8r0XCJLj1QDughfjkPzYri3i+N+a70yYM6V9/hQ5/TIyUzIoC6eIxUFLVCXXeO/Vgo980m0nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqQcNokYOBT3/vyBKRcrn0TwAG3yFWRfRAazRjYWDRI=;
 b=0J+pr3AOqJSX059BUCaTXTuJhhuXR+yMwqmQzVafxCYYgoh97iR+wU18n7eBs+7AukeWpVX5G/YZ4RWIEC8Sg4FHoaQnkWYWvYwvM535fOnF6dFF+3oWs9sMYz5Ac77JV+OcOCqAm5LqhQG8GJfad5ZtJjEpwDwiBdIIMN/XkyA=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6358.eurprd08.prod.outlook.com (2603:10a6:20b:337::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 15:22:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 15:22:56 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Paulo Sherring <pauloasherring@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Topic: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Index: 
 AQHYPdhS69dDmEOgMUyYUvghdSytY6zLN9uAgAAFYICAABeWAIAAAxMAgAAFkQCAACJJAIAABfmA
Date: Tue, 22 Mar 2022 15:22:56 +0000
Message-ID: <26959151-CAA8-4FDC-808D-51F58228EC06@arm.com>
References: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
 <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
 <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
 <CAG9RwPL2adysD-Wyu7eN2jmo85b-Ufx6TWoSe82dJ-XQRr02EQ@mail.gmail.com>
 <D673A4B9-BB22-41AA-A13C-E19F1EC52BCF@arm.com>
 <CAG9RwPKbpORfL3FkARJuT=fAM5PZGY-Lkv+PQ-rEjt1+j9qVeQ@mail.gmail.com>
In-Reply-To: 
 <CAG9RwPKbpORfL3FkARJuT=fAM5PZGY-Lkv+PQ-rEjt1+j9qVeQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e93cd9ec-1577-44c6-8657-08da0c17dd3a
x-ms-traffictypediagnostic: 
	AS8PR08MB6358:EE_|DB5EUR03FT036:EE_|AM0PR08MB3411:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB34110F1E2C9042AD3846EAB89D179@AM0PR08MB3411.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ri/j7T45MLQjuc/aQDnivoD/IeARgD7WQ7Dkey60DT66cpZHsFiDBa6S/yIxYhJynY9Y7wR79d8OyjDBfIzx5cXs26rKMUkGS+YVl3uijZLAH6M1ajsO5g52inc51X0EVBi/RZWOtc4dKLysmJVlY+MAVjxU+JsB97erEymk8GlheYIhxVLuL5qy0FzZbkEM5Dw1orafx48x6U3YEJoHDC4Jpftu+h/dT7eg8RHBgRAGoH2HG4mVXShBpZbEitzAiANrAJJZSKtWYx3j2HNKGshAp14DHOelQ5GwA8K7JCqu4CggZQzz9QWdbvvI7ndTV1d4BcHf+ROtDL2PlYOh85Mdu7DQxLzxaTOfNyxHNXXWUSJjXJVxXi7a2DgZBn6Dbttqj/nUWl4zJJGaeGSO9dwCU5Iqh5cEkYzDlLYPa09s0vASsJPT/NggPcbtGiN70L9MJuGdcu9TD18Ntmc7NRQB1twviahiQIo72KvWraJ70MRqO3WzK1Lps6p8c+XymKT06CdwmY7aVQjKLrzRY8v6rnGznlGowUq4+wvP0Nd4lKqekAJpnX8okioRMSgwuqqaNeflIs7DLywN4fhvsJCOkcqQsqatnl0w5fR62I3p6kJJzLox2u3/jQjHuPoZ7qlukrz7r6t3ioj4mmR1KuwnTSdJUzjn36Mq7jZ7Fpdbh3cnXOkSE76+BKLJER6MKJiRNKbZTiRMO6dohR9BlBPfcWBAABDIU+HcyJJLzTxN4do5tL/8zCN8ZvtHADsC
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(54906003)(316002)(83380400001)(6916009)(38100700002)(6512007)(6506007)(71200400001)(53546011)(122000001)(86362001)(36756003)(26005)(186003)(64756008)(66556008)(76116006)(66946007)(91956017)(2906002)(66476007)(66446008)(508600001)(5660300002)(8676002)(4326008)(8936002)(33656002)(2616005)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA0C196BB28EA14CA2F89F99E65347A9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6358
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aeb45dce-dc3c-455f-3fcc-08da0c17d79a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aqjAjWtb5Ov55aeTFnAH5WcbcgloUirppaqPr8Fc35MjuVsnRL3zXj+gIW4PI9CT84n3+i3vN+I2Rena9+huQDyNwa7woi75QJiRnXQBUrBVBrtq7S5PJYvb+BPn7ZlB87JCmyLT8hKbEkwcFn6CQF8cYPYIBQAK7lRTp7VKUGEAfvtdXFwdvfZMJOlKjZQln7eTRQulTw2vOYI+wvvtCmg2gzu8A6701ygJSQeOv5f1hIVtQeZ3VMTG4/CXqnltL5tbqrTYVzMDu3AToJy0Ob8PYay6gCnuG7qO7V8n0JAS8tvo/diZjLQQuTpfR7vK10oNSb5pPjRITokRkLlp6Yd1OuyNKrDubOzgPQ0BtL+C7c7mQnqCGQdU/wuwb2An33OLBd/Y4JzhfoOXYo8K866u6jEZg6kZI9XpKtDILMVwP5g3Oe0gphCzzEe2sle+yTobSRtQXeUyJNDHyrDDDzINl5z7y7ShBHA6cXHDZU6m7Pgm0eq9ZwwBJEWr0cTE1aFlOR52VX+hmG4DHe0twnvLmrkeksjJUA/mAh7ApikC2zIFV90onQGtLYG/IBm9J1SbxSuChPrOsbCAOCGB/fKg/zs5oIewahDVMkRwys+6nR12ZFUQOSolZQsjiYCgBXPu86nsUeGW3Is0B/n/XnLpjHkBu0M1ZwPl3OVecYNtlURn8eV6SNti7xxi6yzQ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(33656002)(508600001)(6506007)(6486002)(8936002)(5660300002)(8676002)(6862004)(4326008)(47076005)(70586007)(70206006)(356005)(81166007)(2906002)(53546011)(107886003)(336012)(2616005)(82310400004)(54906003)(186003)(26005)(6512007)(40460700003)(83380400001)(86362001)(36860700001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 15:23:06.1727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e93cd9ec-1577-44c6-8657-08da0c17dd3a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3411
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Mar 2022 15:23:13 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7101

Hi Paulo,

> On 22 Mar 2022, at 16:01, Paulo Sherring <pauloasherring@gmail.com> wrote=
:
>=20
> Hi Bertrand,
> One very important piece of information I missed to disclose: I am not
> using runqemu,
> as it was not being properly set by the resulting bitbake build (the
> resulting image was
> pointing to the kernel instead of the xen binary).

This should not impact the module loading.

>=20
> So, I am launching it "by hand":
>=20
> ./tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/u=
sr/bin/qemu-system-aarch64
> \
> -nographic  \
> -machine virt,gic-version=3D3 \
> -machine virtualization=3Dtrue \
> -cpu cortex-a57 -smp 4 -m 4G -machine type=3Dvirt \
> -bios ./tmp/deploy/images/qemuarm64/u-boot-qemuarm64.bin \
> -device loader,file=3D./tmp/deploy/images/qemuarm64/xen-qemuarm64,addr=3D=
0x45000000
> \
> -device loader,file=3D./tmp/deploy/images/qemuarm64/Image--5.10.103+git0+=
792f1272dd_3aab5bb12b-r0-qemuarm64-20220317212819.bin,addr=3D0x46000000
> \
> -device loader,file=3D./tmp/deploy/images/qemuarm64/Image--5.10.103+git0+=
792f1272dd_3aab5bb12b-r0-qemuarm64-20220317212819.bin,addr=3D0x48000000
> \
> -device loader,file=3D./virt.dtb,addr=3D0x44000000 \
> -drive id=3Ddisk0,file=3D./tmp/deploy/images/qemuarm64/xen-image-minimal-=
qemuarm64.ext4,if=3Dnone,index=3D0,format=3Draw
> \
> -device virtio-blk-device,drive=3Ddisk0 \
>=20
> And then stop it on u-boot, and setup the fdt:
> ## Dom0 only:
> fdt addr 0x44000000
> fdt resize
> fdt set /chosen \#address-cells <1>
> fdt set /chosen \#size-cells <1>
> fdt set /chosen xen,xen-bootargs "dom0_mem=3D512M"
> fdt mknod /chosen module@0
> fdt set /chosen/module@0 compatible "xen,linux-zimage" "xen,multiboot-mod=
ule"
> fdt set /chosen/module@0 reg <0x46000000 0x1373a00>
> fdt set /chosen/module@0 bootargs "dom0_mem=3D512M root=3D/dev/vda rw
> earlyprintk=3Dserial,ttyAMA0 console=3DttyAMA0,115200n8 earlycon=3Dxenboo=
t"
> booti 0x45000000 - 0x44000000
>=20
> Please find also some more information below:
>=20
> On Tue, Mar 22, 2022 at 12:59 PM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>=20
>> Hi Paulo,
>>=20
>> Hardknott is long term while honister is not but both are stable release=
s.
>>=20
>> I am not quite sure I get your 4.14 pulling 4.16. The 4.14 recipe is bui=
lding the latest 4.14 version of Xen.
>>=20
> That was just me being silly. I was looking into xen_git.bb which
> clearly is not the preferred provider. I am in fact using Xen 4.14, as
> you pointed out. Sorry for the mistake.
>> From what I see modules to load are in a xen.conf in modules-load.d gene=
rated by Xen tools compilation.
>> Gntdev is properly listed in the current xen source tree as one of the d=
efault modules to actually load on boot.
>>=20
>> Can you check the content of modules-load.d/xen.conf (somewhere in /etc =
in your dom0 roots) ?
>>=20
> I have nothing there. But, I did have two hits when searching the rootfs:
> /etc/tmpfiles.d/xen.conf
> /lib/systemd/modules-load.d/xen.conf

This is the interesting file.
It shall be used by systemd on boot to load the modules required by Xen.
Please check if gntdev is listed there.

If yes then this is a systemd issue, if not this is a Xen issue which appea=
r to be solved in xen master and I will have to check in the 4.14 version u=
sed by Yocto LTS.


> Not sure if there there is some sort of startup script that was
> supposed to move around these files
> or even if systemd-modules-load.service would be supposed to be
> looking elsewhere.

No the lib one is the right one for systemd.

Cheers
Bertrand
>=20
>> It could be that this was actually missing in the xen release you are bu=
ilding or that systemd is not actually loading modules listed there.
>>=20
>> Cheers
>> Bertrand
> Cheers, Paulo.



