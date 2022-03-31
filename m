Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5F4C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:06:01 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.53])
 by mx.groups.io with SMTP id smtpd.web09.383.1648749959441081914
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 11:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=zWz9sIPr;
 spf=pass (domain: arm.com, ip: 40.107.21.53, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruRsU6b/6wXMdjuE6ouDC3JFTbGM3SPIsk+cu7xEtrQ=;
 b=zWz9sIPr0Uq6AfAJ6IZXy0EtkboXZgxIBHPa/yJBP2+8nLdfcyEiE+JoL6E096jAklPoHTeq2H1R7po9ebz+Uko6jQ54xJ2aY2g4uBHUFxcR9pFyZrNWa4UqGMqYnOEBHPmzplB4oDvd7KzbJkKN3WUxtc5ueJNt1hBQasqUL0o=
Received: from AM0PR08CA0008.eurprd08.prod.outlook.com (2603:10a6:208:d2::21)
 by DBBPR08MB6169.eurprd08.prod.outlook.com (2603:10a6:10:205::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 18:05:55 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:d2:cafe::42) by AM0PR08CA0008.outlook.office365.com
 (2603:10a6:208:d2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Thu, 31 Mar 2022 18:05:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Thu, 31 Mar 2022 18:05:53 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Thu, 31 Mar 2022 18:05:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1226aabfb8b38859
X-CR-MTA-TID: 64aa7808
Received: from b02210cac0ba.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EB1CBD5C-5FDD-452B-909F-7804BD92779F.1;
	Thu, 31 Mar 2022 18:05:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 b02210cac0ba.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 31 Mar 2022 18:05:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6iBruNZgoCX6ZY1GNDDv97n/zlhdT1SxhFkxeiBpH4wmg8mZ9IQF3QHFzTsKJhAGFmZywYiEV5qc8jQOTp+wlYWjZ0Rsp78qJ9pAJH9NaQFyDAoV1stg+EW5gOgjeTy7/uKmUYgBBFwVY6ObxXxV2AIm8qI1UMnTU53Zb4rBqrIHwTHDX8cB3wgTPlaA+F+20m07PqI8yTnI1vqubcv1EBk/aKJq5izNN3s811b9OkLlvrLbbcRvgbOnocr+BVHGbBQCkY6OCUmohNRrKFwFe1ffTkalFwI/9wwA2da8lHB7OpLJNhE6bKTHNJyfusne7y8DIh34GhEbCyH8hiuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruRsU6b/6wXMdjuE6ouDC3JFTbGM3SPIsk+cu7xEtrQ=;
 b=jWUM2TAs6nsJqFkQtnvjXSDMYI7XUf1+svzoOM851P7crXeMZ2XE1HK3ZzwLUWe/tU+YImDuknZb3FuvkGaWvpSzMfrvIGNc/wgy6AqVxyCy3+rmGhPxHWdekQZAdLWRIAw+1qf2WixPZWoBFpl6RPkCwifrL2MPnVgNEoTYv152W2NnvK/i74+q6UDiWVd/HSnvrP1/nXUhjmS/xfGsMT2PVP/S3LMZr+WtBHbVNxL0qow1GNKkRlZtrwOQMWEM3soNrjFp7pxg47ykcGq3fqK1dCf8IRC94FDWTRNuLtnOTV/vLcx6ehtQAQdBJRjHpgUJBU+J8E5OoJS1N2nEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruRsU6b/6wXMdjuE6ouDC3JFTbGM3SPIsk+cu7xEtrQ=;
 b=zWz9sIPr0Uq6AfAJ6IZXy0EtkboXZgxIBHPa/yJBP2+8nLdfcyEiE+JoL6E096jAklPoHTeq2H1R7po9ebz+Uko6jQ54xJ2aY2g4uBHUFxcR9pFyZrNWa4UqGMqYnOEBHPmzplB4oDvd7KzbJkKN3WUxtc5ueJNt1hBQasqUL0o=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1905.eurprd08.prod.outlook.com (2603:10a6:203:43::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Thu, 31 Mar
 2022 18:05:44 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::54f4:50e6:8d68:da31]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::54f4:50e6:8d68:da31%2]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 18:05:44 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: k3s build issues on master
Thread-Topic: k3s build issues on master
Thread-Index: AQHYRReTMIE7ERoJt0+ZOCec/6CR4KzZsTMAgAAXe8A=
Date: Thu, 31 Mar 2022 18:05:43 +0000
Message-ID: 
 <AM6PR08MB3461DAC003FA7137609FBD0192E19@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <AM6PR08MB34610BFDE294473E6CFBAA7C92E19@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CADkTA4M26YRe4pH_pA=3xtYNf8S9d1gL9zv2cuE1xxk_j9jGjA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4M26YRe4pH_pA=3xtYNf8S9d1gL9zv2cuE1xxk_j9jGjA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4093bdf1-ef3a-4e5e-0805-08da13411904
x-ms-traffictypediagnostic: 
	AM5PR0801MB1905:EE_|AM5EUR03FT038:EE_|DBBPR08MB6169:EE_
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB61695FE857D0ADCC9393E80D92E19@DBBPR08MB6169.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 uwC2Dxacal/BgP9d4ebJkGTA03meRE/+uVQK6jwOefwcpxI3U8faZTYjO3/bYL8gDZciG8BBlamHvtSUC/JM2fOfRi1S/w8JDHSEbJwVvnG/QAOgVsmhTJnRUIQ4Ahlq9EkUvF/SGcBRjopj9MbyZspF1wXDfZdC2D7zOzK02JZXpOjl6DlJw8IsLv0Rnp7uTHZUw0voyo2FKV+OA2M4HLNeGytDl5AR0uljarwDzG8LOGVNrZlt4l4jFMgXhRbbHg+UoTsEHtSFigIMF97OU8bb9/H/MdZ/TV3LTDdPM52aaUx/bhaShyTOoYbIO0SUiYUTtwKUiWOXLtjZ1m91taQn7yCMLc2k7F4jv5YMP8pHLkC4M8jGhUva2v5n03ruMmwW7mebPzAlRsMV3nTFKLI/bQ7w6z900rbHKTlKghJykUuUYX5HoYmpbPSYl1X0mYr5HbX3Pzugfgsjc+XetNXiZBHZy6g8Wbl4cm8f3hSgBI31AW9DZdkqwKPUzcR2Hht4I3j+U++bsAEvD0TiWNvoiTgnLczCP5Lhy/8vp1J/CLCrs7guOatym366Hr5cPAwdZnr+leFchLchK0fGilBphg2h3TGzP4zFXxyq0D9LX04L/b7na+aDdbHSSldKIf6xcJtWDbMmoOuSVlGeTqqvwMc6zS6O9QAwNQ9etYPkNjZgwShLm2tnErHjGPLf2SEj25oJWxeFUQoXolEQCdboocT7/KUVoWoXUndyxeBCMe+W9DuXpljgGOvwNNPZYJ4jYdMmmSb0h/AAI7wQCGwLh0i97f1RgK5hZe1z6nbM7RC2mW2DSibZYNsgw/G+LfSvkZ2RxhObWQAfVHRb7dGZON4dd2qA3qkmpeIC4rmu1Pnef+Fl26+OR0l8KVEE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(19627405001)(2906002)(9686003)(26005)(186003)(55016003)(166002)(6506007)(7696005)(53546011)(122000001)(38100700002)(84970400001)(91956017)(6916009)(38070700005)(8936002)(316002)(33656002)(64756008)(54906003)(66446008)(66476007)(66556008)(66946007)(76116006)(5660300002)(52536014)(86362001)(71200400001)(8676002)(4326008)(508600001)(42413004)(10090945011);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3461DAC003FA7137609FBD0192E19AM6PR08MB3461eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1905
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e6569a43-5b71-4d0b-6c5e-08da1341132f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4PpuIwWBLUZesYyYLXYkYnyJmqkx/+S4Vf2/DPokntQWhulFdmQnafEqvT79VMY/CGoaLn4V8Cu3AEyN8YETHPTEtU0vIZjkaP47CTy3D0NSBdVaf4nQhyPAlfE0HUhxes9HC9EijHeT75Yk5K9nuLrmK9JXz+DHSmNO1WUpNh6kCWvkHThF/VyuvYky55+qUV6XFksHKT1zFcL5m/b1sLQXnVQeqtUbOwrkuBMQ0fzQtMjretEnPp4VACsfxhnvmd0JaUsUrSvx2xRAFzyZTw5eXfUu5gSh8z9tPhbZvvLArA96bEzLpjBsaOmIjo3PHD1fzhTtf94D2zrkJ1ONWnXotaJwR0qr1q8Cus4AOfbIxHk1t3t7MyJtg19vzmxjoD6lkcicm4ErUBJEUnYOOcVCmHsWLe/E+Pg4Wci9USipopX0CPZ98QqCgoYZwb95wN5vcJv5+DUBlvcd63Wh/RGo1hHCJx4p+e38LoSqvC/umFfOqhImY17iTp3HEQRMn3GvYEmWPCp0WzAhFAiUP0CrSAbx791Ger19yzcVoPhed1YBmBL3Ig577ywYc2GKVPfPkMxSVdJeyG3nZIrTfYDuvfHvwD0fMw2aWPkUmZZvmLwT5m7QkupH3AWoFxvimf2ugx2SeRiFWEyc7gDKEOOksN8trytSEy2C74UBAOJyXBCIJSUko/iBEn8altA0q6mGhDUzqqo4c04tBePB8nwf1SKj734daI5qge27AtMrDRhYv8mAVR1xJUQ0A2jTBjgcsH4OWeyNrpfnqyrlapQu3aGXrAEpNL2+oP9/drpGhTEgkSMPFJb4+mvyFwgGCpa0ijcerWjXhbeNI7LgRmB493cv+cexdKQnrk9XF3I=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6506007)(53546011)(7696005)(55016003)(33656002)(54906003)(83380400001)(316002)(52536014)(26005)(186003)(9686003)(336012)(84970400001)(508600001)(19627405001)(82310400004)(166002)(36860700001)(4326008)(86362001)(81166007)(2906002)(8936002)(5660300002)(40460700003)(356005)(47076005)(6862004)(70586007)(8676002)(70206006)(42413004)(10090945011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 18:05:53.9061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4093bdf1-ef3a-4e5e-0805-08da13411904
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6169
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Mar 2022 18:06:01 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7122

--_000_AM6PR08MB3461DAC003FA7137609FBD0192E19AM6PR08MB3461eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,
________________________________
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Sent: 31 March 2022 17:38
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>; nd <nd@arm.com>
Subject: Re: k3s build issues on master



On Thu, Mar 31, 2022 at 12:22 PM Diego Sueiro <Diego.Sueiro@arm.com<mailto:=
Diego.Sueiro@arm.com>> wrote:
Hi Bruce,

Whilst investigating a build problem on our CI related to sstate mirror of =
the k3s recipe, I found that the commit "k3s: update to 1.23.1" (8cba065209=
dd668afe939f878da340a017ecdd7d) didn't change the PV and SRCREV_k3s variabl=
es correctly.

I changed those values to v1.23.1+k3s1 and 08d538fb3a04a0fe904b34cf04f7e211=
91b82449 respectively and now I'm getting the following do_compile error:
```
go: inconsistent vendoring in /kas_build_dir/tmp/work/neoversen1-poky-linux=
/k3s/v1.23.3+k3s1-r0/k3s-v1.23.3+k3s1/src/import:
    github.com/google/cadvisor@v0.43.0<http://github.com/google/cadvisor@v0=
.43.0>: is explicitly required in go.mod, but not marked as explicit in ven=
dor/modules.txt
[...]
    k8s.io/sample-controller<http://k8s.io/sample-controller>: is marked as=
 replaced by github.com/k3s-io/kubernetes/staging/src/k8s.io/sample-control=
ler@v1.22.6-k3s1<http://github.com/k3s-io/kubernetes/staging/src/k8s.io/sam=
ple-controller@v1.22.6-k3s1> in vendor/modules.txt, but replaced by github.=
com/k3s-io/kubernetes/staging/src/k8s.io/sample-controller@v1.23.3-k3s1<htt=
p://github.com/k3s-io/kubernetes/staging/src/k8s.io/sample-controller@v1.23=
.3-k3s1> in go.mod

    To ignore the vendor directory, use -mod=3Dreadonly or -mod=3Dmod.
    To sync the vendor directory, run:
        go mod vendor
```


The short log is wrong, the SRCREV and PV are correct. There's some fundame=
ntal issues with 1.23.x that prevented it from building inside or outside o=
f bitbake, so I scaled back the version bump at the last minute to stay in =
1.22.x series.

In this case it seems that thev1.22.6+k3s1<https://github.com/k3s-io/k3s/tr=
ee/v1.22.6%2Bk3s1> tag is pointing to 3228d9cb9a4727d48f60de4f1ab472f7c50df=
904.

Cheers,

Diego

And yes, there's no more vendoring in k3s, so you can't just bump the SRCRE=
V and PV, we have to adjust all of the git clones and shuffling to make it =
build.

I have some more changes to that recipe pending, so I'll do a minor cleanup=
, with a shortlog that makes things clear.

Cheers,

Bruce


Unfortunately, I have zero knowledge in go and I have no idea how I could f=
ix this.


Diego Sueiro
Staff Software Developer =96 ARM =96 Automotive and Industrial Solutions (C=
E-OSS)


--
- Thou shalt not follow the NULL pointer, for chaos and madness await thee =
at its end
- "Use the force Harry" - Gandalf, Star Trek II


--_000_AM6PR08MB3461DAC003FA7137609FBD0192E19AM6PR08MB3461eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Bruce,</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Bruce Ashfield &lt;br=
uce.ashfield@gmail.com&gt;<br>
<b>Sent:</b> 31 March 2022 17:38<br>
<b>To:</b> Diego Sueiro &lt;Diego.Sueiro@arm.com&gt;<br>
<b>Cc:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;; nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: k3s build issues on master</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div class=3D"x_gmail_default" style=3D"font-size:small"><br>
</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Thu, Mar 31, 2022 at 12:22 PM Di=
ego Sueiro &lt;<a href=3D"mailto:Diego.Sueiro@arm.com" data-auth=3D"NotAppl=
icable">Diego.Sueiro@arm.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi Bruce,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Whilst investigating a build problem on our CI related to sstate mirror of =
the k3s recipe, I found that the commit &quot;<span style=3D"color:rgb(51,5=
1,51); font-family:sans-serif; font-size:16.6667px; background-color:rgb(25=
5,255,255); display:inline">k3s: update
 to 1.23.1&quot;</span><span style=3D"color:rgb(51,51,51); font-family:sans=
-serif; font-size:16.6667px; font-weight:700; background-color:rgb(255,255,=
255); display:inline">&nbsp;</span>(8cba065209dd668afe939f878da340a017ecdd7=
d) didn't change the PV and&nbsp;SRCREV_k3s variables
 correctly.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I changed those values to&nbsp;v1.23.1+k3s1 and&nbsp;08d538fb3a04a0fe904b34=
cf04f7e21191b82449 respectively and now I'm getting the following do_compil=
e error:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
```</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
go: inconsistent vendoring in /kas_build_dir/tmp/work/neoversen1-poky-linux=
/k3s/v1.23.3+k3s1-r0/k3s-v1.23.3+k3s1/src/import:<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp; <a href=3D"http://github.com/google/cadvisor@v0.43.0" data-au=
th=3D"NotApplicable">
github.com/google/cadvisor@v0.43.0</a>: is explicitly required in go.mod, b=
ut not marked as explicit in vendor/modules.txt<br>
<span><span style=3D"background-color:rgb(255,255,255); display:inline">[..=
.]</span></span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><span style=3D"background-color:rgb(255,255,255); display:inline">&nb=
sp; &nbsp; <a href=3D"http://k8s.io/sample-controller" data-auth=3D"NotAppl=
icable">
k8s.io/sample-controller</a>: is marked as replaced by <a href=3D"http://gi=
thub.com/k3s-io/kubernetes/staging/src/k8s.io/sample-controller@v1.22.6-k3s=
1" data-auth=3D"NotApplicable">
github.com/k3s-io/kubernetes/staging/src/k8s.io/sample-controller@v1.22.6-k=
3s1</a> in vendor/modules.txt, but replaced by
<a href=3D"http://github.com/k3s-io/kubernetes/staging/src/k8s.io/sample-co=
ntroller@v1.23.3-k3s1" data-auth=3D"NotApplicable">
github.com/k3s-io/kubernetes/staging/src/k8s.io/sample-controller@v1.23.3-k=
3s1</a> in go.mod
<div><br>
</div>
<div>&nbsp; &nbsp; To ignore the vendor directory, use -mod=3Dreadonly or -=
mod=3Dmod.</div>
<div>&nbsp; &nbsp; To sync the vendor directory, run:</div>
<span>&nbsp; &nbsp; &nbsp; &nbsp; go mod vendor</span></span></span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
```</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>
<blockquote itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quoted=
Text" style=3D"border-left: 3px solid rgb(200, 200, 200); border-top-color:=
 rgb(200, 200, 200); border-right-color: rgb(200, 200, 200); border-bottom-=
color: rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.8ex; color: rg=
b(102, 102, 102);">
<div class=3D"x_gmail_default" style=3D"font-size:small">The short log is w=
rong, the SRCREV and PV are correct. There's some fundamental issues with 1=
.23.x that prevented it from building inside or outside of bitbake, so I sc=
aled back the version bump at the last
 minute to stay in 1.22.x series.</div>
</blockquote>
<div class=3D"x_gmail_default" style=3D"font-size:small"><br>
</div>
<div class=3D"x_gmail_default" style=3D"font-size:small">In this case it se=
ems that the<a href=3D"https://github.com/k3s-io/k3s/tree/v1.22.6%2Bk3s1" d=
ata-view-component=3D"true" class=3D"Link--muted" style=3D"box-sizing:borde=
r-box;background-color:rgb(255, 255, 255);color:var(--color-fg-muted)  !imp=
ortant;font-family:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;,=
 Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe U=
I Emoji&quot;;font-size:14px" id=3D"LPlnk380860"><span data-view-component=
=3D"true" class=3D"css-truncate css-truncate-target" style=3D"box-sizing:bo=
rder-box;overflow:hidden;text-overflow:ellipsis;display:inline-block;max-wi=
dth:125px;vertical-align:top"><span class=3D"ml-1" style=3D"box-sizing: bor=
der-box; margin-left: 4px !important; font-family: &quot;Segoe UI&quot;, &q=
uot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system=
, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-=
size: 9.75pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">v1.=
22.6+k3s1</span></span></a>&nbsp;tag
 is pointing to&nbsp;3228d9cb9a4727d48f60de4f1ab472f7c50df904.</div>
<div class=3D"x_gmail_default" style=3D"font-size:small"><br>
</div>
<div class=3D"x_gmail_default" style=3D"font-size:small">Cheers,</div>
<div class=3D"x_gmail_default" style=3D"font-size:small"><br>
</div>
<div class=3D"x_gmail_default" style=3D"font-size:small">Diego</div>
<div class=3D"x_gmail_default" style=3D"font-size:small"><br>
</div>
<blockquote itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quoted=
Text" style=3D"border-left: 3px solid rgb(200, 200, 200); border-top-color:=
 rgb(200, 200, 200); border-right-color: rgb(200, 200, 200); border-bottom-=
color: rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.8ex; color: rg=
b(102, 102, 102);">
<div class=3D"x_gmail_default" style=3D"font-size:small">And yes, there's n=
o more vendoring in k3s, so you can't just bump the SRCREV and PV, we have =
to adjust all of the git clones and shuffling to make it build.</div>
<div class=3D"x_gmail_default" style=3D"font-size:small"><br>
</div>
<div class=3D"x_gmail_default" style=3D"font-size:small">I have some more c=
hanges to that recipe pending, so I'll do a minor cleanup, with a shortlog =
that makes things clear.</div>
</blockquote>
<div class=3D"x_gmail_default" style=3D"font-size:small"><br>
</div>
<div class=3D"x_gmail_default" style=3D"font-size:small">Cheers,</div>
<div class=3D"x_gmail_default" style=3D"font-size:small"><br>
</div>
<div class=3D"x_gmail_default" style=3D"font-size:small">Bruce<br>
</div>
<br>
</div>
<div>&nbsp;</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Unfortunately, I have zero knowledge in go and I have no idea how I could f=
ix this.<span style=3D"font-family:Arial,Helvetica,sans-serif; font-size:sm=
all; color:rgb(34,34,34)">&nbsp;</span><br>
</div>
</div>
</blockquote>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div id=3D"x_m_-1049742980418175207gmail-m_-8072067739783875034Signature">
<div>
<div></div>
<div id=3D"x_m_-1049742980418175207gmail-m_-8072067739783875034divtagdefaul=
twrapper" dir=3D"ltr" style=3D"font-size:12pt; color:rgb(0,0,0); font-famil=
y:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0px; margin-bottom:0px"><span lang=3D"PT-BR" style=
=3D"font-size:11pt; font-family:Calibri,sans-serif">Diego Sueiro<br>
Staff Software Developer =96 ARM <span style=3D"background-color:rgb(255,25=
5,255); display:inline">
=96&nbsp;</span>Automotive and Industrial Solutions (CE-OSS)</span><br>
</p>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<br clear=3D"all">
<div><br>
</div>
-- <br>
<div dir=3D"ltr">- Thou shalt not follow the NULL pointer, for chaos and ma=
dness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</div>
</div>
</div>
</body>
</html>

--_000_AM6PR08MB3461DAC003FA7137609FBD0192E19AM6PR08MB3461eurp_--

