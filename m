Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C96C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 15:30:39 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.89])
 by mx.groups.io with SMTP id smtpd.web12.11377.1647963037304217022
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 08:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=16H5jJMa;
 spf=pass (domain: arm.com, ip: 40.107.0.89, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+4/v5znAfKeWPO+9tsHGB8JeVbLHxa2qwg2O+AZ1fU=;
 b=16H5jJMaNTrJtbxFclXbe7LYf6/d3gB2AMsSUlLpZGJ4+f4XR4TDDQPJRfFVCZcp6U/YObMeTi+pWe+FTP79TToaqBVa1ijWwCDNVvjEQwYdO2yqGQCXZX7gT8RMFC2tamgd2IpS8XWLmWAfWrj4VAS3nL2FP1rUImT90cHBsZ0=
Received: from AM7PR02CA0004.eurprd02.prod.outlook.com (2603:10a6:20b:100::14)
 by DB6PR0801MB1925.eurprd08.prod.outlook.com (2603:10a6:4:74::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Tue, 22 Mar
 2022 15:30:32 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::22) by AM7PR02CA0004.outlook.office365.com
 (2603:10a6:20b:100::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23 via Frontend
 Transport; Tue, 22 Mar 2022 15:30:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 15:30:30 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Tue, 22 Mar 2022 15:30:30 +0000
X-CR-MTA-TID: 64aa7808
Received: from b8128b40eabb.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54CBFEC6-67EF-4735-918C-01C32BC57278.1;
	Tue, 22 Mar 2022 15:30:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 b8128b40eabb.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Mar 2022 15:30:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5rVxuJ3OEUdqOeSJgQoeKXfm1Rn2+95boAdUXifb9hDJpacIZKQjxV89p7atbCldCmZQDjo/JxF+crxHZmVLmx+Qeta8X0yzrxWPUwamJxvcJsJJ31xiUe0+qd+8i77v5K0upuS5uM6UBTApuRrqhB2IE1oYTxyVBO3nRfzU/mEU2pyZXQ2BViamQStB6MqVwDhoWq3CUg44JG0KTB6hukdXVfM0JPCCrupPcJMjQnW18cFjv2LwYGoDaWVyaukJBXwexZNcXYae/RdR1heQJSgV1lqVuCxha+Rthq0mkhUI8QQWhij6vmy25ZRgRVe9kYV8tGd+O16kKDvSH+YiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+4/v5znAfKeWPO+9tsHGB8JeVbLHxa2qwg2O+AZ1fU=;
 b=Q9NXCFUtmmiOAdRmNP5lDFXkhimyUbqSQTD29eZZN/fYnB0QwQnSgMuNfaVBVrQ53Iwk2FW18HjjSCRKgzOrEklp82w20jvXxtIbqHtcoTjZDhej32czvni4Du4TN8hLPOi8A9qt4oOkJ+hJgE5oc2RM/ihyxs30LU++kdiZkrt2xfEbR7guKcQcwbQ2X0nd7Z1ovgwHM+qkwGQs0dbItPKOErviQyOz4T+OtWLYx4fCmGQ30N2h1VNlCjsvVM/sBwPNN5857HKOGQJQ65Hz/rVIpMd4vTrUYmQA0Vsu0kUK1OyUHin+6wc5S5NC1uCXqJN3H3U4lGl4gFGr3NC36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+4/v5znAfKeWPO+9tsHGB8JeVbLHxa2qwg2O+AZ1fU=;
 b=16H5jJMaNTrJtbxFclXbe7LYf6/d3gB2AMsSUlLpZGJ4+f4XR4TDDQPJRfFVCZcp6U/YObMeTi+pWe+FTP79TToaqBVa1ijWwCDNVvjEQwYdO2yqGQCXZX7gT8RMFC2tamgd2IpS8XWLmWAfWrj4VAS3nL2FP1rUImT90cHBsZ0=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by HE1PR0801MB1978.eurprd08.prod.outlook.com (2603:10a6:3:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Tue, 22 Mar
 2022 15:30:21 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::49e0:1543:4b70:6f89]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::49e0:1543:4b70:6f89%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 15:30:21 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paulo Sherring
	<pauloasherring@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Subject: RE: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Topic: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Index: 
 AQHYPdhSEyBkl7iYAk+Vhzf9QNfad6zLN9uAgAAFYICAABeWAIAAAxMAgAAFk4CAACJHAIAABfoAgAABcOA=
Date: Tue, 22 Mar 2022 15:30:21 +0000
Message-ID: 
 <AM6PR08MB34615752123840EC55863F2492179@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
 <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
 <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
 <CAG9RwPL2adysD-Wyu7eN2jmo85b-Ufx6TWoSe82dJ-XQRr02EQ@mail.gmail.com>
 <D673A4B9-BB22-41AA-A13C-E19F1EC52BCF@arm.com>
 <CAG9RwPKbpORfL3FkARJuT=fAM5PZGY-Lkv+PQ-rEjt1+j9qVeQ@mail.gmail.com>
 <26959151-CAA8-4FDC-808D-51F58228EC06@arm.com>
In-Reply-To: <26959151-CAA8-4FDC-808D-51F58228EC06@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: BEC6400FBEC98344B4BDE5474FFB044E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0f4d0451-b8c9-4902-4ce8-08da0c18e64c
x-ms-traffictypediagnostic: 
	HE1PR0801MB1978:EE_|VE1EUR03FT034:EE_|DB6PR0801MB1925:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB19254EE16C717A4E65755EBB92179@DB6PR0801MB1925.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PDfA/P+ScjSHxiKD28Tr0lFnrLG0jZXvGFwmemh7Mp6mfk2e/tvvCPCd94WMP0hYhwA+vUCdF9PutexGAlC+1AtfEupUjw89/22n8MBC2Jn7ss1Y8jp7E6gzK1xu/g/r4B95FTPYqofo1L9fGc9JdraIVuiu4EbkoyzLFEcefSPEobvv5HXXlz3LNbxaSYZOLBPujyEKTuh950QiJI5By9xgIFSW7/07BlzwKK+JfvFB3pW7iyiLQDozWwIe67TqlbYht/vMyLwiAWYUwMdLSm+KG9M2FnTaiHeooBj6C52EMtEOwi60zWe2HzF8c+TEPrXuQC12+J0y/CnFnYXQmot/+MbZUVY+c6lho8aHmOy0NmKWyZlbL1WDiFNqKdWxd4a6aCU7pjIM5JWdjPI/MlOwrdpLPtAkq+N/Zb9PkHXOwfhFxOTFqkWkQGQGG8oNvs86W9R40CMO8XuyX2TfbVyq0LmZNfTbqUQ681TvbSbsacUlxxyezXqdacJiQI6uL1wKUBVK2XDdcvY94BDGH2khTJiXiLrj6W3bJiUNgV/1J5Tv8nAKKKm86OJCkrYHpiChjJsnEV0IujaaTJ25DSOzGHo8BPk5f9A9j+neYiPTQm0U/5lBjoGTJLmKi1HMrpDxDkyspWjx/uxidWYGpxhE54+X6IIjZRT6c3etvqiaFrKL+t1VBOqQSRNLNUBKXPmCxHaCIEzCatfbeZH1Wx9F39rs4hg+zJeQWU/jMZFtQs3D6Z+b2COXiEhFyO/KEfad/+iKqrJJ902Eo3mVirRkKtS9/a45gIUwdmYupWhUHvENw5OTf0h9dJHx52CbHhUqgU6PooiFwyyaZz82ZA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(7696005)(508600001)(6506007)(54906003)(316002)(110136005)(71200400001)(55016003)(33656002)(26005)(186003)(53546011)(38100700002)(64756008)(966005)(66446008)(66476007)(66946007)(76116006)(4326008)(66556008)(8676002)(8936002)(2906002)(52536014)(38070700005)(83380400001)(86362001)(5660300002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1978
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2d8e15f2-0ba7-4dcd-e31c-08da0c18e0bd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ebyz/N4bhqmHtUfKW8/jMLty/sxj8QtbJNjTrjGCuBblC3V1km62seyA/tHORGdG7sSZsUBJfgmeg2t05YH/ATjEUpLU/faKygpOs1vEl2Zsabr3nvaherPxkGfUXxn1nYACueVxstnPwW5cmUxiDh44wCIZa0IcR/m+DM3nacHkHvJI2F4R++Ck6tV+Poro4/Y8/YcltHxotmsuR2cyn/5DTML8fFD/Cwmc1UhmGFvG/jLPsN8qeqgAQD8oyptywtQUjtwrtAh1yEeq6/jYUZi4iIF6wdaPFDBgG5Af9stAdZ4gWGxFh5GWuW/6tip2B1N/VIuj3pNL9C5aKMl70CzQROKssx/RmoA3JQQf8CJ/s5IoGdKTjyju/hVDVo+XpCkd+pkLfCvl27YaOYghyUmxUTLJM35aKMpAJY0XgDz5zOvfSdWl5WkC9Xye+yGolNMCUYCqr0+gu1Kso7/S37YS/kdoCACiE4idGyTxM83kItcLcBA7bX/UCtjSDBxFYCZKiOmTp//o9T5oUxe5ezBP4JC0mVklko6mjXaDAZesjtSz8x/IdkAe+JX6kMGrpK/SKpo9i8VmANVnEZOQIv22gmNFPujEC591Ft27v1LmS631u9Jot18RxUPCfs3g4jxM/vuY7SG3rHKrZeQpRZjwkFuVz7kdeKoxDGswyN8Dd2EK4izu8ka5aO5dV4A7Qy+LK4mGap0ZOShisLvhBFqkypSH3ggTF1ikB0hExzdqp/EVnRzwPEpM+UcLLxD88X3XHc2zZnxYzW9hdd8Q8cGCrT/KJrjmbslfSCYfbgQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(4326008)(83380400001)(70206006)(70586007)(8676002)(26005)(336012)(186003)(107886003)(508600001)(82310400004)(966005)(86362001)(356005)(316002)(9686003)(81166007)(54906003)(53546011)(7696005)(6506007)(110136005)(2906002)(47076005)(36860700001)(52536014)(33656002)(8936002)(5660300002)(40460700003)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 15:30:30.7917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f4d0451-b8c9-4902-4ce8-08da0c18e64c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1925
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Mar 2022 15:30:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7102

The xen modules load from systemd was fixed in master as https://git.yoctop=
roject.org/meta-virtualization/commit/?id=3D44dad5105d408e7b6217600eba3672e=
72db0f42f and honister as https://git.yoctoproject.org/meta-virtualization/=
commit/?h=3Dhonister&id=3D6cde8f2ccbde5ecc9997cf727939a0ae5e0fe11d.

You might need to backport this to hardknott as well.

--
Diego Sueiro
Staff Software Developer - Automotive and Industrial Solutions (CE-OSS)

>-----Original Message-----
>From: meta-virtualization@lists.yoctoproject.org <meta-
>virtualization@lists.yoctoproject.org> On Behalf Of Bertrand Marquis via
>lists.yoctoproject.org
>Sent: 22 March 2022 15:23
>To: Paulo Sherring <pauloasherring@gmail.com>
>Cc: meta-virtualization@lists.yoctoproject.org; nd <nd@arm.com>; Bruce
>Ashfield <bruce.ashfield@gmail.com>
>Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
>
>Hi Paulo,
>
>> On 22 Mar 2022, at 16:01, Paulo Sherring <pauloasherring@gmail.com>
>wrote:
>>
>> Hi Bertrand,
>> One very important piece of information I missed to disclose: I am not
>> using runqemu, as it was not being properly set by the resulting
>> bitbake build (the resulting image was pointing to the kernel instead
>> of the xen binary).
>
>This should not impact the module loading.
>
>>
>> So, I am launching it "by hand":
>>
>> ./tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-nativ
>> e/usr/bin/qemu-system-aarch64
>> \
>> -nographic  \
>> -machine virt,gic-version=3D3 \
>> -machine virtualization=3Dtrue \
>> -cpu cortex-a57 -smp 4 -m 4G -machine type=3Dvirt \ -bios
>> ./tmp/deploy/images/qemuarm64/u-boot-qemuarm64.bin \ -device
>> loader,file=3D./tmp/deploy/images/qemuarm64/xen-
>qemuarm64,addr=3D0x4500000
>> 0
>> \
>> -device
>> loader,file=3D./tmp/deploy/images/qemuarm64/Image--
>5.10.103+git0+792f127
>> 2dd_3aab5bb12b-r0-qemuarm64-20220317212819.bin,addr=3D0x46000000
>> \
>> -device
>> loader,file=3D./tmp/deploy/images/qemuarm64/Image--
>5.10.103+git0+792f127
>> 2dd_3aab5bb12b-r0-qemuarm64-20220317212819.bin,addr=3D0x48000000
>> \
>> -device loader,file=3D./virt.dtb,addr=3D0x44000000 \ -drive
>> id=3Ddisk0,file=3D./tmp/deploy/images/qemuarm64/xen-image-minimal-
>qemuarm6
>> 4.ext4,if=3Dnone,index=3D0,format=3Draw
>> \
>> -device virtio-blk-device,drive=3Ddisk0 \
>>
>> And then stop it on u-boot, and setup the fdt:
>> ## Dom0 only:
>> fdt addr 0x44000000
>> fdt resize
>> fdt set /chosen \#address-cells <1>
>> fdt set /chosen \#size-cells <1>
>> fdt set /chosen xen,xen-bootargs "dom0_mem=3D512M"
>> fdt mknod /chosen module@0
>> fdt set /chosen/module@0 compatible "xen,linux-zimage" "xen,multiboot-
>module"
>> fdt set /chosen/module@0 reg <0x46000000 0x1373a00> fdt set
>> /chosen/module@0 bootargs "dom0_mem=3D512M root=3D/dev/vda rw
>> earlyprintk=3Dserial,ttyAMA0 console=3DttyAMA0,115200n8 earlycon=3Dxenbo=
ot"
>> booti 0x45000000 - 0x44000000
>>
>> Please find also some more information below:
>>
>> On Tue, Mar 22, 2022 at 12:59 PM Bertrand Marquis
>> <Bertrand.Marquis@arm.com> wrote:
>>>
>>> Hi Paulo,
>>>
>>> Hardknott is long term while honister is not but both are stable releas=
es.
>>>
>>> I am not quite sure I get your 4.14 pulling 4.16. The 4.14 recipe is bu=
ilding
>the latest 4.14 version of Xen.
>>>
>> That was just me being silly. I was looking into xen_git.bb which
>> clearly is not the preferred provider. I am in fact using Xen 4.14, as
>> you pointed out. Sorry for the mistake.
>>> From what I see modules to load are in a xen.conf in modules-load.d
>generated by Xen tools compilation.
>>> Gntdev is properly listed in the current xen source tree as one of the
>default modules to actually load on boot.
>>>
>>> Can you check the content of modules-load.d/xen.conf (somewhere in /etc
>in your dom0 roots) ?
>>>
>> I have nothing there. But, I did have two hits when searching the rootfs=
:
>> /etc/tmpfiles.d/xen.conf
>> /lib/systemd/modules-load.d/xen.conf
>
>This is the interesting file.
>It shall be used by systemd on boot to load the modules required by Xen.
>Please check if gntdev is listed there.
>
>If yes then this is a systemd issue, if not this is a Xen issue which appe=
ar to be
>solved in xen master and I will have to check in the 4.14 version used by =
Yocto
>LTS.
>
>
>> Not sure if there there is some sort of startup script that was
>> supposed to move around these files or even if
>> systemd-modules-load.service would be supposed to be looking
>> elsewhere.
>
>No the lib one is the right one for systemd.
>
>Cheers
>Bertrand
>>
>>> It could be that this was actually missing in the xen release you are b=
uilding
>or that systemd is not actually loading modules listed there.
>>>
>>> Cheers
>>> Bertrand
>> Cheers, Paulo.
>


