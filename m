Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.60])
 by mx.groups.io with SMTP id smtpd.web10.13946.1633014178360781066
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 08:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3Q8JxtPB;
 spf=pass (domain: arm.com, ip: 40.107.0.60, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7TEA+jY1BBZvKwfepAPParoTdJqRN2Hckr6gWxNm44=;
 b=3Q8JxtPBykDVTHdUU3HydD4be213Rnl0+0Z6D/Ll+adyOsSyTKAtMr6F6bx6qRNsznvGGrfBHWkfbgKduWgDtgRFr4ivzmYXqFt2u+znwBOX8n7BacWwvsX7Ydx84ydAmUaxVWggskUJhfPeitId8aGrteksKCzY60ulbqJXMpY=
Received: from DU2PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:10:3b::9) by
 DB6PR0802MB2550.eurprd08.prod.outlook.com (2603:10a6:4:a1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15; Thu, 30 Sep 2021 15:02:54 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::91) by DU2PR04CA0004.outlook.office365.com
 (2603:10a6:10:3b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 15:02:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 15:02:53 +0000
Received: ("Tessian outbound a492f2284909:v103"); Thu, 30 Sep 2021 15:02:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90a655e6391636ff
X-CR-MTA-TID: 64aa7808
Received: from 77f9e4f21de3.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 00A23F14-4349-4793-B52F-7ABAE192ACD4.1;
	Thu, 30 Sep 2021 15:02:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77f9e4f21de3.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Sep 2021 15:02:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlgyCxm6f5UG7bqeq8QC93OJCI7QGSHpQRyRiWs/V1EVb6EW+iKQrKWN/3md+wmmc0L8X3SXUJNzwAiWQ9r9UHoi+T/lPiNH35oFmtOGwXeUtmGkHXZpihREqS3NLwtldK/jM20LqXOAASuDOLfpQrWhv2nA8Ttpdci7d7YeTffngdGreq72p8jPdWi53vynTJCtLUNhxAD5lNZtE/g1qFMygfPpGT8bojBCBCtnRXaTHDqz/oKf10+YosHaEuPFmSj1epCQQm8Odr9SdGpOrO+UscliwoWrSLlzkyJyM5/yFxHRlc4D9WtIkA80dHZUdWzuHastq0F0NPuXKo9D1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=P7TEA+jY1BBZvKwfepAPParoTdJqRN2Hckr6gWxNm44=;
 b=k3sfvTUHFSNCNisBt3aI9Xvu7jcgCOTIc3bk7uG3hzDfNLro85ci7Klb6MXX+yGPKMnRmE06ui+PahB3LKbXFBTLJoAl+QfYqXpF7pqIbjhwCuw4MgHEL8HboGf3Ev6Il/34mimOduwClAndaSMh1OYI5V9xZwlxptXk4+DqSKm48Okydu2gRHxBzx1gmA0k/S+8oB1yfBREDe9sjuQ6j3w9gQgAt0hUT0bWDd7FI44mjNLcE4WFIZYIpSaXsMs0l1Pb/gPAOKBQGWcXCpPoDs4GfZA8W1v7IYCvTuoQltx4YcqtUvn4N8mhHprQwsBkFpgcWy+TqnflZQHQD1B9Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7TEA+jY1BBZvKwfepAPParoTdJqRN2Hckr6gWxNm44=;
 b=3Q8JxtPBykDVTHdUU3HydD4be213Rnl0+0Z6D/Ll+adyOsSyTKAtMr6F6bx6qRNsznvGGrfBHWkfbgKduWgDtgRFr4ivzmYXqFt2u+znwBOX8n7BacWwvsX7Ydx84ydAmUaxVWggskUJhfPeitId8aGrteksKCzY60ulbqJXMpY=
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16; Thu, 30 Sep
 2021 15:02:31 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4566.017; Thu, 30 Sep 2021
 15:02:31 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [PATCH 1/2] xen, rpi4: Fix syntax in linux-yocto bbappend
Thread-Topic: [PATCH 1/2] xen, rpi4: Fix syntax in linux-yocto bbappend
Thread-Index: AQHXtgsZsQ/hs+xE9U6sWcdbrmaMBKu8rEoA
Date: Thu, 30 Sep 2021 15:02:30 +0000
Message-ID: <8A9B1FAB-2A24-446D-BAC3-FF505225C2F8@arm.com>
References: <20210930145423.17162-1-luca.fancellu@arm.com>
In-Reply-To: <20210930145423.17162-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2c98412c-34d6-4f29-abe9-08d9842360e5
x-ms-traffictypediagnostic: PAXPR08MB6446:|DB6PR0802MB2550:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB255087BB3720DDAEC1C802CC9DAA9@DB6PR0802MB2550.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EmTQHu0fINobpjrTDLUST3tlZ8QF1mX0OHOkrNoq3oNORnyATTAVkXIhG9Re9zqxx6j3p521nKdW2+m/2x4ehF6cJm+9cokuVjb03BiwUUYJnPn/LMZZ9ueaqQM+SLOaSsfQG9S/EfM9OzESvHId6kITJ67SwUI1/Ii62rqf6ipKlRxC6hCiaV461uCix70xrBH+q6A7zxph2CJb+IUajP66+PtTKuQFjZKmLXEgmb9Zk7sqEzf0wn9vtyVwW/owB6ZG3/0cpQW02kaPvOBl/NSTyZ4l10qc5hBsHyElx6Fcv0F2bDGs9ZLA5zr4snZz8sSbqTcsjJE3GoLEVvOnI/56PTdAQmHpcWFT7bplIcwXtc4jTiJVlLGtL6tFFEDZ9LnCxAZkoJEv5rzB648Fhy2bcbG0dv/OnIBw1J707G/FdaM+7ftCw+zR3f85Pz+hbZ/1M/2DJGjv28xVyEvA6ZEJ292HtIVsan7YPE2BnC9LkO7tA482yzjQbYUCQGdfbKHAm9RgjZVqdpet7CoA1Q+eoF29YAB3pnWNHHM/BF05LPauAigFF15dEruY27CQ+NWeAtA4uIf7Qvj4hmgLeB8mh5/SbcB9btYWW8OgwJlUTZhXN43DogfYGxvjp2qTCLlrRKOkcOyqYQDXFS3GoLp/oBErnPlvL9JkeyfVBbSsadN1t/jJXqS1FSgbH3nYxL7EV7Umz8RP7XScrVOHJS4tayj+FwH2s3Hf1NbU7LXJJT6E3Pj1x/+6yLfV5FWM
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6636002)(71200400001)(8936002)(6512007)(2616005)(83380400001)(26005)(37006003)(6862004)(316002)(64756008)(66476007)(38100700002)(66556008)(8676002)(5660300002)(66946007)(86362001)(6506007)(66446008)(122000001)(36756003)(33656002)(91956017)(2906002)(4326008)(76116006)(53546011)(38070700005)(508600001)(6486002)(186003)(45980500001);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6446
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8a8598d6-9618-42f7-7747-08d984235399
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KsrJLAs5cuK9utFnz/fS95BOEIGl7ui26vDWUKm+Sjod/jnYy6iuS4sjRdQpv0SEMZRc4EwOr7h+cp0/KAF5xfdiVHxCwEVt4VZDHjif+Wmt89cY8ahbPP2EI5OhC8Ni7JVLKVysEG+M2d3M8ggDV0uJPcXCRuDVibNFVrjSXUYnnlgccWquqQZli2XZXJLDoQa9xKVw/CfrD3JIdhidZWbHecTIw6JJHKhBjFKoKQ6S/j1kTTgKUQ4StWQUax4i0qCIFC1JqaGwsog4ol+Gxz+yqjhqVymtw2DC10kxW6m5Sy0vF6Ph70y3cSuyullzoveRfnQp65AvKzBDaK8/G+7rfZp+CsmsC8n97VJuf6W4rnt5Nfls5oTojNlScIoNsUjxfNSltGHOmxIMA5rrb4WLcxDDxsg/7/RvvKpzLP2L75fHsEAgrG5U+7oaQ8xTEbHWnVwDgYpURdNxuDCzUCEN3fvnXFPONUQdUrZtsq+aTtklCYJoXp/SSpfIi/0ROzZYMuaTSNHjr8mzgVvfTjRcVBoj1wpMqXq2Fv7OXyrmUl1cOQrlpHj2n/BZ4DPiDIujSlajcovNG0+1fEV4jL10dkV0pV4IAj5x2KB5My3skinZHO1bc34oilHK/yXwBjXhCVoYkprEqob4RLmYTrTr3rclV4wk2X+eQeIc4EVlK5l06zD97AsIGZnNTl/DM0SgoFLPSpGARKFTYSG4XA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6862004)(316002)(8936002)(508600001)(81166007)(37006003)(53546011)(6506007)(47076005)(6512007)(8676002)(4326008)(70206006)(70586007)(86362001)(83380400001)(36756003)(82310400003)(33656002)(5660300002)(6636002)(356005)(186003)(26005)(336012)(2616005)(36860700001)(2906002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 15:02:53.2772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c98412c-34d6-4f29-abe9-08d9842360e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2550
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F187B37C9B1A7D47A4CDCCA466DA9FE6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Luca,

> On 30 Sep 2021, at 15:54, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>
> Syntax conversion for bbappend linux-yocto_5.10
> and linux-yocto-dev inside the raspberrypi
> dynamic layer.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks a lot for that :-)

Cheers
Bertrand

> ---
> .../recipes-kernel/linux/linux-yocto-dev.bbappend           | 6 +++---
> .../recipes-kernel/linux/linux-yocto_5.10.bbappend          | 6 +++---
> 2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-=
dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-=
dev.bbappend
> index 8381e44..5f43052 100644
> --- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bba=
ppend
> +++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bba=
ppend
> @@ -1,8 +1,8 @@
> # For a Xen-enabled distro on the Raspberry Pi, override the contents of =
cmdline.txt
> # with Xen-on-ARM-specific command line options
>
> -KBRANCH_raspberrypi4-64 ?=3D "standard/bcm-2xxx-rpi"
> -KMACHINE_raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
> -COMPATIBLE_MACHINE_raspberrypi4-64 =3D "(raspberrypi4-64)"
> +KBRANCH:raspberrypi4-64 ?=3D "standard/bcm-2xxx-rpi"
> +KMACHINE:raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
> +COMPATIBLE_MACHINE:raspberrypi4-64 =3D "(raspberrypi4-64)"
>
> require linux-yocto_xen-rpi.inc
> diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_=
5.10.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto=
_5.10.bbappend
> index af92493..f279ef7 100644
> --- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bb=
append
> +++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bb=
append
> @@ -1,6 +1,6 @@
> # Enable use of the linux-yocto 5.10 kernel for the Raspberry Pi 4
> -KBRANCH_raspberrypi4-64 ?=3D "v5.10/standard/bcm-2xxx-rpi"
> -KMACHINE_raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
> -COMPATIBLE_MACHINE_raspberrypi4-64 =3D "(raspberrypi4-64)"
> +KBRANCH:raspberrypi4-64 ?=3D "v5.10/standard/bcm-2xxx-rpi"
> +KMACHINE:raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
> +COMPATIBLE_MACHINE:raspberrypi4-64 =3D "(raspberrypi4-64)"
>
> require linux-yocto_xen-rpi.inc
> --
> 2.17.1
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
