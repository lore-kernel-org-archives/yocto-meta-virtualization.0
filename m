Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4ABC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 10:01:41 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.81])
 by mx.groups.io with SMTP id smtpd.web12.9067.1654768897279129467
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 03:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=JIUDogvW;
 spf=pass (domain: arm.com, ip: 40.107.8.81,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CR/DuMaKgKLBY5HPOQkXZWhKKYb9W5duiAU94GujXDT1nO0gwJtX6XVp+28RJWOTjuCYKD6ikY2GZOKGI5YTq4EGkLOKWTfG91yNcYUayd+q/mI1qmHbXHN0vGWGmfyZmbrslJdgDGgzk+Lt/X4NRb4gVDhhdvHHFB8qcZmlnuqDM1zPH9WuhmeuRJ8wEYHa8yqmq9a1fZz1gV8iQmawu4MZ3Vmna9JrGmT2FeN6qbQMRDKcnz3nEzO31jfNcMHzltHX+27qGgGS+ASpR2RFpbm0m5FqH1VmE7DgBU2u+6bhy/nmIbuyIjAI4UY45FfEHN0lGN0WeCEaDgUff2jmyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBfyElql+fhrkywvVVchMS4bi/8PwsYz/qrCWdxrSZQ=;
 b=byc6PAlBRUfk8+xYITDnJU3QVgYVtWmwkqPVPGFYsJFXOxKoZLGNDQoJhBXAHUud0peNJv6G0guFlnBoQEEB4MmRAroVaB8PpO7sA4/cutzs4xvTOfJg6P4h12XRxc1UPQslqyv/ixqk4BdsQGPSRRcYazoxMlExKeh7Th8o/6hQpWbdpp6l2rS5BobU44k8l+tw6485Ve9IRQpc9aVyGWZQXsTC6EvuU7XiVasjgtDgJvfh1qtBAW3B0gFSdSHT/GL5YiLE+JQU9kDxaOj2AhHYuh3sYHTmZsFPBGuBNbSu/Rt89ApG43UMPBa0oKRQMionjs13mmkToh4Mm6LxKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBfyElql+fhrkywvVVchMS4bi/8PwsYz/qrCWdxrSZQ=;
 b=JIUDogvWfKNWyQCmRuOxoEAD71p78JLMVFYRPfjGHU1hPaCB/INfHLi53ziHjKpGA1Eoc6QwIJiEtTphWNMv1IcZScnLd8KG9tLBhkUoAyihZT8oimFMdJHicOy4xebE6DvvHVFnKADWg+es22hBM4K4me/cxfvACFx+1n5uD7I=
Received: from DB7PR05CA0044.eurprd05.prod.outlook.com (2603:10a6:10:2e::21)
 by DB9PR08MB7795.eurprd08.prod.outlook.com (2603:10a6:10:39a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Thu, 9 Jun
 2022 10:01:33 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::17) by DB7PR05CA0044.outlook.office365.com
 (2603:10a6:10:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23 via Frontend
 Transport; Thu, 9 Jun 2022 10:01:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 10:01:32 +0000
Received: ("Tessian outbound 4ab5a053767b:v120");
 Thu, 09 Jun 2022 10:01:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5497af871d680df0
X-CR-MTA-TID: 64aa7808
Received: from 178bdc221031.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CB1F216B-7405-48F1-AC28-8D6B7BCA8BF4.1;
	Thu, 09 Jun 2022 10:01:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 178bdc221031.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Jun 2022 10:01:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IM4D8dReAQkASBbOpezxlQ1ZYI1hK5R3u4vnbG9tScgh/uEqtwIj7lfZS5VBTiGcI107RxFcN/I29NPcOliLNgy/JC7B64HKeAsOZqANA/SSnVaBxrquCMQCZBl5fplsNzjb2j6ew8IsxlRI8Cg10FQBcHcu5mHeqy3O+7t5AGpGKSchVDX9Qzvmh1kxgfT035N2ZxVZLf4mbD0Qb0uDUay/DnPh7hfW1EHj1ZI4J3I4/T0y+xMnCwgCli1xsMnl94XArDu51e39WM9J+5GDeUsWjK8lSMJokxR7XkwPK+K6mFU59qwGKhXxdB0dyAaWzpf3Id/lfx/QT8qQl1eXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBfyElql+fhrkywvVVchMS4bi/8PwsYz/qrCWdxrSZQ=;
 b=Y7+XqwwlAJvSAiTuADE2u6JpUJ0ma+R4CfQkgVgIhkOdZNEmUkZQEwP9DBiWkXG6D70FQ0jkqrbj4CW/UxNV+MM+zzxXSZu9W8dOaThukBJL0hLXtyff5UMAdfVysudeMyJqzM+QOCh4ErFgRlM24qGN7UlT24/snXd2tJxnXa+SUGbfhkzahyXIphf73oDGEgH2bjenMauK/nWJf/baVzI4o+GXG+uivEyIzfsbpHkxn60vmHrx5XpQPsTmZ6tjQNOuR2r9urQmsjmSY7oJWD3q0xDW0YPIRkqUctkmAdbZ0PMDixQXVUETyNoHZQyI8hOSEE2fVifOoY2kC4x6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBfyElql+fhrkywvVVchMS4bi/8PwsYz/qrCWdxrSZQ=;
 b=JIUDogvWfKNWyQCmRuOxoEAD71p78JLMVFYRPfjGHU1hPaCB/INfHLi53ziHjKpGA1Eoc6QwIJiEtTphWNMv1IcZScnLd8KG9tLBhkUoAyihZT8oimFMdJHicOy4xebE6DvvHVFnKADWg+es22hBM4K4me/cxfvACFx+1n5uD7I=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:01:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 10:01:20 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] xen: Disable highmem on qemuarm
Thread-Topic: [meta-virtualization] [PATCH 2/2] xen: Disable highmem on
 qemuarm
Thread-Index: AQHYe+eHWHi+7gzmMUiy/hP0BhGlcK1G1+uA
Date: Thu, 9 Jun 2022 10:01:20 +0000
Message-ID: <63C89F72-E463-4C2B-8026-B959173F5754@arm.com>
References: <20220609095748.176486-1-michal.orzel@arm.com>
 <20220609095748.176486-3-michal.orzel@arm.com>
In-Reply-To: <20220609095748.176486-3-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1beb749a-fd01-4d21-b69a-08da49ff0821
x-ms-traffictypediagnostic: 
	AS8PR08MB6839:EE_|DBAEUR03FT040:EE_|DB9PR08MB7795:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR08MB7795F4952EE0D4C57390B0E89DA79@DB9PR08MB7795.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +xQkU0pZszJXYieOHg8QOZHQILkO98CRYwleSF3CyATw6OKcstW85D75dy0CCTe1Lwy01wEeQvx9s+KAutVAZPye2ET251l6+hHaPakU3K12tREtsGwcpRCuh72bN3dFhH/ZNTnF3BZrmtMUrtj3v4j1oZBme+IfHXYHq87/yK6dKxXZgv1RJOc6xm77N0jNTMfPWswNnQliA/IhI/HGV1nV5qA8NWCOBhV24B0v7+2EMJWLqp7226gHsca9I/RCWLZQlUM/188mT3x5uilk9qfnIP+18IXTj+Yz1Nj6p4UlQNbh2+Q92eaoeWRvWskdomVQyi5Km8s/eM6+MvqUf/zI73qI4G3vquyKpYL/PWOnQsyzimcQR2PhHooe0+fux/sKK0GKzJjDJyt9Dt0HJZxx42TRDOYsORy9eNlILd0zx2bTeXVN1wR8ai0LcvYiqeXZ8aYW9A9iTkYTeCmV99CIKi7HBMHtw+/aFjPcZ5KLEFvH+w6sqn8qCjlQOJyreSA6u4xcmjXsjS9aG2NwRdPmIV9VpF+43NTgH7K//pB10mJ053ou948r4/afPOzjr3XpTZtCMj9Yl0UR/60znPbsZ2GZrIgOCVRXPU0IROSMYeB1COkXQUA3IekOPGhUX3XZIt9K0Z/BuUe/5X+zVAto4IEnh6NM0TjgZVeKnCir4o3sGVAcVFD8ZVGH/taPyzLJmwZgiWbzGozJPBQ+ej3yLiuj2f7ptkd/qL7K60y6gHmpVzVjX4nyXY3GixeruQy9uPVTfZUcv9pxyjnp0/BsHvxxPwQuZs15zIMrF8a//YYvEr8u4n/PEbyMcQ4rBCYdTeb93f06Z6S50OeJoSV+hwQHz69IzDcogoqJN3U=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(5660300002)(33656002)(71200400001)(66446008)(64756008)(4326008)(8676002)(122000001)(76116006)(91956017)(6862004)(8936002)(66556008)(66946007)(66476007)(37006003)(54906003)(316002)(6636002)(38100700002)(6486002)(966005)(6512007)(53546011)(26005)(6506007)(2616005)(38070700005)(508600001)(86362001)(186003)(83380400001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <74511DB454D3FE44B0012DFAFCE116CF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	210f6a1c-12fc-4ac3-9864-08da49ff0097
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lpk8WpfHdl9p4Y29T6RfFjfkz+WjqYKWcAA0VH2OtQYDocDuHOWZcfKJRBr38pwb18ZXeaRlooXosz1+5MZq2OvkweCTdH8N40FzUd5PzTgnuiZF6BWx3jBP8JZ7rTLToUCSWAX8PvHAEcj4gHFI1ZVklrTS4tbMGnNtiF1RL8alE/4ts6cCD9/t+zdfieA60MTRiRTEAc9J3hXb193ZoKKTTa+UnpyixhARav2rz+abZJjo543EBaZSj1/9XHgek8eoXzkAmgtt4zRz0pRA4RM3O4gh+qAdCdhxSywuYM8UNlqtx4docAkdyRFbkQd0Uef/wnA4QxJ40NwmgDFVPN1iJWe9W/MgIBeXQRCva41M4iWCfurWh84Fcprxw0nAoc89uc2Oagu9TmTqY4nIZgR1vYUkpuTVNoIbpg/M90OoxztcNH7dx7Jdpkyhy2YOLsfeeK2EJpRp/Xn8UqS/do1J6BZhehjP5TRHBwktBuZn9qPs+6qOyUxS2pccMHgVqSwTnp9CTHqVa7kCUcL6NlbP/h+dscRfzp7n5IS+QRTuUq+KEJLk+BwrF5Cfbrp3dDqExQlw6Hfjpw2DnP9rrPGwD8/d0ozPXiVYYZg29zIo5jeyfBh3tFc3+aYcl5N8ysbeMf/17z1QHXZuULFz9XBNvnHBTxG0yXJTmbp98Agyo10oGXszJsBgWvVpmrxCcAyc+TYMqURaZM1ERMWGY/Fj6wdqn/YN0CUjHoi/C0ePDOwGsEcylhugxD9TQAu45+DjEqNg0Tb1vtt5NMpvQEklWLQFKZzmyFI94uFxXRw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6486002)(40460700003)(47076005)(336012)(186003)(966005)(53546011)(33656002)(2906002)(6506007)(8936002)(2616005)(508600001)(6512007)(5660300002)(86362001)(26005)(37006003)(82310400005)(356005)(316002)(6862004)(54906003)(6636002)(81166007)(4326008)(70586007)(70206006)(8676002)(83380400001)(36756003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:01:32.8105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1beb749a-fd01-4d21-b69a-08da49ff0821
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7795
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Jun 2022 10:01:41 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7354

Hi Michal,

> On 9 Jun 2022, at 10:57, Michal Orzel via lists.yoctoproject.org <michal.=
orzel=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> By default, highmem option is enabled for machine types later than
> virt-2.12. This allows qemu to place devices and RAM in physical
> address space above 32-bits. This can cause issues as according to the
> documentation Xen supports up to 12GiB of physical address space.
> Recently the issue was observed using runqemu, that was causing Linux
> running on top of Xen to stall when trying to access ECAM space placed
> by qemu at 256GiB mark. Even though this issue is most probably related
> to QEMU and not Xen (the investigation showed that it can map ECAM
> space correctly), it is best to avoid such issues by disabling highmem
> on qemuarm.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Also tested on kirkstone and dom0 boots fine and pci is working.

Thanks a lot
Cheers
Bertrand

> ---
> classes/qemuboot-xen-defaults.bbclass | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen=
-defaults.bbclass
> index f1550cc..460cbe6 100644
> --- a/classes/qemuboot-xen-defaults.bbclass
> +++ b/classes/qemuboot-xen-defaults.bbclass
> @@ -23,8 +23,10 @@ QB_DEFAULT_KERNEL:qemuarm =3D "xen-${MACHINE}"
>=20
> # 64-bit Arm: gic version 3
> QB_MACHINE:qemuarm64 =3D "-machine virt,gic-version=3D3 -machine virtuali=
zation=3Dtrue"
> -# 32-bit Arm
> -QB_MACHINE:qemuarm =3D "-machine virt -machine virtualization=3Dtrue"
> +# 32-bit Arm: highmem=3Doff
> +# Disable highmem so that qemu does not use highmem IO regions that end =
up
> +# being placed at the 256GiB mark (e.g. ECAM space) and can cause issues=
 in Xen.
> +QB_MACHINE:qemuarm =3D "-machine virt,highmem=3Doff -machine virtualizat=
ion=3Dtrue"
>=20
> # Increase the default qemu memory allocation to allow for the hypervisor=
.
> # Use a weak assignment to allow for change of default and override elsew=
here.
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7352): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7352
> Mute This Topic: https://lists.yoctoproject.org/mt/91642064/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


