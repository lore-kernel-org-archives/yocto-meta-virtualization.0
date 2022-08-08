Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4A8C25B06
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 09:19:17 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.50])
 by mx.groups.io with SMTP id smtpd.web12.23445.1659950353415655001
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 02:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=hUh3rij7;
 spf=pass (domain: arm.com, ip: 40.107.22.50, mailfrom: diego.sueiro@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=X6L93cIiCbm0WyZsNXLaA54rLh2kzYpIHnj5T3NNNgpARtLQ0yEldSDrhyBl/kOmb65RasILIiC2+JxIh5iT8UOexQr9fOEx+CZjZxZLiV0tlQhfPZlocQmC2uIdlTNjRp5LLLs1TY4J2LicY4sTQb35N5eLjnVghSXIkeJLdoh0YP8p3oxqpHD4pl4M3VB8e4q0gTIrLBhUUbdjNLBXoA17JcErgBsR6qc3jvRt8826SYOHmHInqpqyUA4xd1LmrAInTpXufVwnCc1Z+OBfMCV/XXC4SgmNNH62A1MW2P3T9gTUyg+Lr5ayHPqXgxKUYsR75YjOPLmOdGm9XdwXEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdWe8Dnp0Uq76KzbENaUoJsAXwzOu7kYSYcK6t223lg=;
 b=RRk1+iGK8ldtBqa6aEirEmxvdfuXRy0xSmc372Htb4AN9FNTFE9roQvCsXHjfZ08cE6M5llq1lJtN9p6ikZ5pujJ2zd3N2pPByqTxYvdJtgmnSiE/NUVVMo2JuK4vKVnLaZSMWS57ZZmD1lhA8w2gMCEscL1hn9lBKj2kqKFqA1n43BZ/EAgwNPJMfGMkzb9t3d90EOm6jPN8pyrNPU8UOnpCsfYFi1u71ZCivvXvBHUFzfzvkAsda2BHE/qfInWnoTN/mp6sfl+QUoimM9KSnOcix25Kdl/MKED/vFZ1feic0BcWNn8ddJPuXYo7YEx1WXfeDVCLIbaxXpJaHOs0g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdWe8Dnp0Uq76KzbENaUoJsAXwzOu7kYSYcK6t223lg=;
 b=hUh3rij7wTY85EsSRtTMF3520GOWyNvZCpxQczBHircqtIqYndY6HuC3c5XjwGrK0LXUM1ydJVOyIavEfnBlhc2ut/woWqhSUMnjcTrLwCA8lC+nU1HU9hq4hhZp1nFmX3gNmGv4mrC7Q2ECAylgc8Y9UglKl+vo8GogBi1Ogio=
Received: from AM6P194CA0011.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::24)
 by AM6PR08MB3942.eurprd08.prod.outlook.com (2603:10a6:20b:ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 09:19:08 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::eb) by AM6P194CA0011.outlook.office365.com
 (2603:10a6:209:90::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Mon, 8 Aug 2022 09:19:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Mon, 8 Aug 2022 09:19:08 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Mon, 08 Aug 2022 09:19:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 58ddc41306f38497
X-CR-MTA-TID: 64aa7808
Received: from d7f43b5c3343.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 08FDB4CF-D718-41DA-A332-105DD1DBCB70.1;
	Mon, 08 Aug 2022 09:19:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 d7f43b5c3343.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 08 Aug 2022 09:19:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxrOvJApB5rw4HaToMlH7tt9+GPMsu4a0WG5PTVVyEtvAvo4M2XP59Q7GiH1dj05ZkHmonThNchlU2fTVmgt5Pl0zwxRI4jQznRqLbq+ZxVefrZ9CFqLY161ecVTIAWyJdHnDZZTmoArKMRwft008Vd2gdLEL6gUa9sE/PxNMQUGrioOlmuGZ+r9g/K5nYwjFY3WDMxr3Mnmd9DsOk9wAOM6Q645q0twlDexjfWNtx1hPxoqJfVDxBmDEcAktHa519NIn8JZ7TjXapXWio84uRCFogSRPuRTLwjJeKD0oVUCTvmtkRmhZ/7b637GprjJFxLG9kIIE9keCCyJMtSlPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdWe8Dnp0Uq76KzbENaUoJsAXwzOu7kYSYcK6t223lg=;
 b=BVVuvOh4dvZ7ikpWkaE4CWlbVLLJOWYIDzd7/BT0OCF576oVAucbah+EUWk7tkuienHSitTIHiIimSEBhiYtYmeCR/sHfEcafbZHv+JXjITmYimeXwCL9XAzU9r9JsvpR7RfMccCYxrv+sInPJkRiuygPVcdJBF22KU9LQZws2gT21Emm5k6ahtfw90Gu2fXEb1F/qHORBYTtNUIV7EAq89re/Hg7xn1x+MXhT/QZCBzNZEwFa+gXzgr7nwk5s6gLZqm3lB7ozMESgv1s5QRaMz0frKzJQ7nAE+UEIU8o2U5aNfBReX4WQrMbnhXVnH9kojdjZ7jSfcRZKYY7MxTww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdWe8Dnp0Uq76KzbENaUoJsAXwzOu7kYSYcK6t223lg=;
 b=hUh3rij7wTY85EsSRtTMF3520GOWyNvZCpxQczBHircqtIqYndY6HuC3c5XjwGrK0LXUM1ydJVOyIavEfnBlhc2ut/woWqhSUMnjcTrLwCA8lC+nU1HU9hq4hhZp1nFmX3gNmGv4mrC7Q2ECAylgc8Y9UglKl+vo8GogBi1Ogio=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by DB9PR08MB6876.eurprd08.prod.outlook.com (2603:10a6:10:2ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 09:18:58 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a867:84c4:f3de:939c]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a867:84c4:f3de:939c%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 09:18:58 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Richard Neill
	<Richard.Neill@arm.com>
Subject: Re: [meta-virtualization] K3s service not starting after go-lang
 version update in poky
Thread-Topic: [meta-virtualization] K3s service not starting after go-lang
 version update in poky
Thread-Index: AQHYh8GgvVtGTeuAVEep9vbHBTsGsa1jB323gAAyM4CALskoAIAPKuytgAPRt+s=
Date: Mon, 8 Aug 2022 09:18:57 +0000
Message-ID: 
 <AM6PR08MB3461DD84FFE2DD5B6152C60092639@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <CADkTA4OwycAA=stusCGHrEjRga+JP3vjm+U5anU50y-D-0o8kA@mail.gmail.com>
 <8237.1658906356879254972@lists.yoctoproject.org>
 <1705B28225E1CC82.3155@lists.yoctoproject.org>
 <CADkTA4OPBa3TkWQOXqxZ3=-k7vEzuOCGVRPCeVeUDDEg_qCYuw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OPBa3TkWQOXqxZ3=-k7vEzuOCGVRPCeVeUDDEg_qCYuw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 58a85771-f661-4758-5bca-08da791f0c21
x-ms-traffictypediagnostic: 
	DB9PR08MB6876:EE_|AM5EUR03FT007:EE_|AM6PR08MB3942:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rLiLlzLn/A3OT9yVsdgZo2jTwvrhcdJThJAvDGAIWBKQ2he95+mvzlHe6DuqaZO0c85uJ1SBYO0/y6wm7BrBeUjGPNufl5qdy7VyZzB2hCNx0EQWbDZjbzKAL00arP7ly4cZhTpDxG53gmWGZHmOeVIxVXc/R6gZzaUSZ8d6WB49lcqeKH3I971DSiGKFniQy9x1cvtuQhhGJrmzNiA0cNIyAPFTYkam9XOAw42L78NyC+pNAWBD2SYmDZPFnhKCy5u7Cecn/k1/G4UB2cmFDG/QeMNIKSVqPzGA1wJmcC/uXm7hh6g/RIUFDQoAhR81nasigFuEPKxe1gHKNGY3L/4YBx2+hxdy1jRR6KIW+9TrKVr22sJc3UCkCzXNMJm5o/y0LY5r5Z9xNWWlWVlVkqCu836NzSXMEXlj4tDw/oQK93N5/aT6qfyE5+MFdjOoEGUkPrrlIIPOWmLBhYAST/VOLviyaVRuXSiNC30qeXW70yAIGH1P24M66aI4kLZaUUHPahYuo9KSy0Q9Q8gCEPn9EZdbZ3puYvrJfu1AwCgHuXFpQ3QqunPAzdtnjVstnCNiIyfif8ICcHGuVca8ncVim46yudMP0iEY1qHyL8qkC3IVJa/MLvoHq4QuIDNDNc/MhHBzaCXJWfNW7WGJueO2Zm2rF/4FiAFuRZ32ZtUdnq79R2bUxJUNhohMmUiEzHBvztYsYLk/oizSNrhRAFzPoLiYniHjNLR6Mpxfd6jseeFd5e5G5hSflV7r11TsFtBzqgWO5eEWusBKABvkHqrcBqkQOQGunlxztFmy4fprCzBlbaq7lKqHmfahIs+URZCU0HlvoqCbpWnZHCpfNAwlhmTL6NZ/HBhGnn7QrTNsNNsmOrPvhru8+2swJnZ56etUlHY6PP7Qp2z0stvDlQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(41300700001)(55016003)(122000001)(66556008)(66476007)(53546011)(76116006)(8676002)(6506007)(66446008)(64756008)(4326008)(7696005)(66946007)(8936002)(91956017)(33656002)(52536014)(478600001)(966005)(38070700005)(5660300002)(71200400001)(2906002)(166002)(83380400001)(38100700002)(86362001)(54906003)(15650500001)(66574015)(316002)(9686003)(186003)(6916009)(19627405001)(26005)(10126625003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3461DD84FFE2DD5B6152C60092639AM6PR08MB3461eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6876
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7efe35f8-5a05-4d8c-6a0a-08da791f061f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O70x2rMYujdo2DKwKupeZfA2/hIqwdepGskD+x4lI2hHP9n62a+0JzYHS/+YHVRLk+Gxc4lwp+VTp/JAkoMZw6obkbGm8KD9cCU+f599H732YcKi2EHkoKpuz1wunJEhCd/Z76pMzRlZhrHuvBjgLviKdxNEEkrfI4zic5mkrRreHZ9XAGvTKDbO4fU2ZfvaEhN7HM0IEXB8KGV/Vnlg3Gt5MjwkQTXcFWFhibyRJzuhnbRj+U/Qk2nJ/rtnj4UXW6WnJVs6V2PLFPo44SkoBF0zykgEUGIBafJ4W+rKR1Y4wawJnCr7NgDKywz/AMlr4aF0iaCafzKEhllAZfQYWNaWUweFMbVkZdiz6S9VAmHn9dza6c/HpClfuOudn60bquWrxEy28yfBXUWpJQFKOl7z6KiffRqHELTzArVkqvZSTJVCY/BH8VgY+xtajp04iuXART/Ec9yl1flIK14rE6Oj3SrlwpA9X0lBETs9JVr8UFVdnf9jWLJnM6szfa92XUmkSdijJaQcCqGA1r5A6Snuy68eIR307lTdqzgHiStNehOPqVOatBXF7A0LUCm7OCAdpIbQPq/QfsABNHjItd2hqfjaWR/55hptxhGwc7I57lXG8W47fOHfsrlns+5wcynyjic/lldnJnHWhuN9GUPmQmXeoG4v74LmGmEIY4apP8f6nvp3ej6Ow7mMAmTYvIdI/d3iYV/wAeqds6sPlrirhOcZqkGWxriOWRQgQ3kyl1oi6lqCWh0T3TtFpogZzLRaDYGQ8+Nq6xaHWfgtnG9fTwx/H3L3aOrHVanI7q03jodFxZlTYd8nOdLplJK3H9zCaO+OmPLzpBnEJb1nPEoFaN8/7MSkgkAOiVaIJn1Sy/26Okp0PgaQSMCWdEWOOoDQ/fe6tcoEOlOUv4gIAQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(136003)(40470700004)(46966006)(36840700001)(82310400005)(66574015)(47076005)(15650500001)(186003)(336012)(316002)(5660300002)(19627405001)(54906003)(70206006)(6862004)(2906002)(4326008)(8676002)(70586007)(8936002)(52536014)(86362001)(966005)(81166007)(356005)(166002)(478600001)(40480700001)(26005)(6506007)(82740400003)(41300700001)(55016003)(9686003)(7696005)(53546011)(83380400001)(33656002)(36860700001)(40460700003)(10126625003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 09:19:08.0025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 58a85771-f661-4758-5bca-08da791f0c21
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3942
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Aug 2022 09:19:17 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7494

--_000_AM6PR08MB3461DD84FFE2DD5B6152C60092639AM6PR08MB3461eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,



________________________________
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Sent: 05 August 2022 23:56
To: bruce.ashfield@gmail.com <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>; meta-virtualization@lists.yoctopro=
ject.org <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] K3s service not starting after go-lang v=
ersion update in poky

On Wed, Jul 27, 2022 at 9:25 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Wed, Jul 27, 2022 at 3:19 AM Diego Sueiro <diego.sueiro@arm.com> wrote=
:
> >
> > Hi Bruce,
> >
> > On Mon, Jun 27, 2022 at 01:51 PM, Bruce Ashfield wrote:
> >
> > >
> > > On Mon, Jun 27, 2022 at 6:00 AM Kamil Dzie=BFyk <Kamil.Dziezyk@arm.co=
m> wrote:
> > > >
> > > > Hello Bruce,
> > > >
> > > > There is a problem with the k3s service starting when the Yocto ima=
ge is
> > > built with the meta-virtualization master branch.
> > > >
> > > > This issue might be related to the go-lang version(1.18) used to bu=
ild the
> > > k3s.
> > > > After this patch was merged:
> > > https://git.yoctoproject.org/poky/commit/?id=3D8dc1f28aa10c775e64b527=
5679b1f8142e8cd038
> > > > a warning pops up during the k3s build:
> > > > ```
> > > > WARNING: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90=
e2-r0
> > > do_package_qa: QA Issue: k3s: ELF binary /usr/local/bin/k3s has reloc=
ations in
> > > .text [textrel]
> > >
> > > That warning has actually been around for a while.
> > >
> > > > ```
> > > > See k3s service start logs here: https://pastebin.com/uXvsjPFu
> > > > I have tried a more recent version of k3s 1.22.8 with a small chang=
e and
> > > this version of the k3s starts successfully.
> > > > However, I did not manage to update all k3s build dependency source=
s from
> > > the recipes-container/k3s/src_uri.inc.
> > > > I have built the k3s with this change: https://pastebin.com/3QGvcqt=
a
> > > >
> > > > Could you update the k3s recipe on the master branch, to build a mo=
re recent
> > > version 1.23 or 1.24?
> > >
> > > I have a 1.24 update already underway. So hopefully things will be
> > > sorted out shortly.
> >
> > Do you have an ETA for this?
>
> I ran into some really nasty runtime issues, along with build issues,
> so I'm now on the 4th micro bump to deal with problems.
>
> There was also a week of squashing buildpath issues in oe-core that
> slowed things down.
>
> I have an arbitrary deadline of M3 for these sorts of updates, so that
> is the goal and one that is quickly approaching!

FYI: I finally managed to figure out the build issues, and have pushed
an initial bump to v1.24.x to master-next.

I have done some tests and I can confirm that we are not seeing the runtime=
 issues
reported by Kamil anymore.

Thanks for working on it.

--
Diego Sueiro

I spent nearly a day thinking it was our build, or the dependencies
that were the issue .. and as it turns out, even in a native / non-OE,
vendored or not-vendored build .. you get the same Sandbox build error
that I was debugging. I've changed the tags to avoid the ctrd internal
build and we at least get a binary.

This should also have the golang -> github substitutions that were
suggested for the previous version, I'll do a closer check later on
that.

I still have more runtime testing to do, but the fact that there's a
building jumping off point, I wanted to at least get it to master-next
and let folks know.

Bruce

>
> Bruce
>
> >
> > --
> > Diego Sueiro
> >
> > >
> > > Bruce
> > >
> > > >
> > > > Thanks,
> > > >
> > > > Kamil Dzie=BFyk
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7478): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7478
> Mute This Topic: https://lists.yoctoproject.org/mt/92017071/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

--_000_AM6PR08MB3461DD84FFE2DD5B6152C60092639AM6PR08MB3461eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Bruce,</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0px; margin-bottom:0px; margin-top:0; margin-bottom:=
0"><br>
</p>
</div>
</div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Bruce Ashfield &lt;br=
uce.ashfield@gmail.com&gt;<br>
<b>Sent:</b> 05 August 2022 23:56<br>
<b>To:</b> bruce.ashfield@gmail.com &lt;bruce.ashfield@gmail.com&gt;<br>
<b>Cc:</b> Diego Sueiro &lt;Diego.Sueiro@arm.com&gt;; meta-virtualization@l=
ists.yoctoproject.org &lt;meta-virtualization@lists.yoctoproject.org&gt;<br=
>
<b>Subject:</b> Re: [meta-virtualization] K3s service not starting after go=
-lang version update in poky</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">On Wed, Jul 27, 2022 at 9:25 AM Bru=
ce Ashfield via<br>
lists.yoctoproject.org<br>
&lt;bruce.ashfield=3Dgmail.com@lists.yoctoproject.org&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Jul 27, 2022 at 3:19 AM Diego Sueiro &lt;diego.sueiro@arm.com&=
gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Bruce,<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Jun 27, 2022 at 01:51 PM, Bruce Ashfield wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Jun 27, 2022 at 6:00 AM Kamil Dzie=BFyk &lt;Kamil.Dz=
iezyk@arm.com&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hello Bruce,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; There is a problem with the k3s service starting when t=
he Yocto image is<br>
&gt; &gt; &gt; built with the meta-virtualization master branch.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This issue might be related to the go-lang version(1.18=
) used to build the<br>
&gt; &gt; &gt; k3s.<br>
&gt; &gt; &gt; &gt; After this patch was merged:<br>
&gt; &gt; &gt; <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D8d=
c1f28aa10c775e64b5275679b1f8142e8cd038" data-auth=3D"NotApplicable">
https://git.yoctoproject.org/poky/commit/?id=3D8dc1f28aa10c775e64b5275679b1=
f8142e8cd038</a><br>
&gt; &gt; &gt; &gt; a warning pops up during the k3s build:<br>
&gt; &gt; &gt; &gt; ```<br>
&gt; &gt; &gt; &gt; WARNING: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff=
8b8715949f90e2-r0<br>
&gt; &gt; &gt; do_package_qa: QA Issue: k3s: ELF binary /usr/local/bin/k3s =
has relocations in<br>
&gt; &gt; &gt; .text [textrel]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; That warning has actually been around for a while.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; ```<br>
&gt; &gt; &gt; &gt; See k3s service start logs here: <a href=3D"https://pas=
tebin.com/uXvsjPFu" data-auth=3D"NotApplicable">
https://pastebin.com/uXvsjPFu</a><br>
&gt; &gt; &gt; &gt; I have tried a more recent version of k3s 1.22.8 with a=
 small change and<br>
&gt; &gt; &gt; this version of the k3s starts successfully.<br>
&gt; &gt; &gt; &gt; However, I did not manage to update all k3s build depen=
dency sources from<br>
&gt; &gt; &gt; the recipes-container/k3s/src_uri.inc.<br>
&gt; &gt; &gt; &gt; I have built the k3s with this change: <a href=3D"https=
://pastebin.com/3QGvcqta" data-auth=3D"NotApplicable">
https://pastebin.com/3QGvcqta</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Could you update the k3s recipe on the master branch, t=
o build a more recent<br>
&gt; &gt; &gt; version 1.23 or 1.24?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have a 1.24 update already underway. So hopefully things w=
ill be<br>
&gt; &gt; &gt; sorted out shortly.<br>
&gt; &gt;<br>
&gt; &gt; Do you have an ETA for this?<br>
&gt;<br>
&gt; I ran into some really nasty runtime issues, along with build issues,<=
br>
&gt; so I'm now on the 4th micro bump to deal with problems.<br>
&gt;<br>
&gt; There was also a week of squashing buildpath issues in oe-core that<br=
>
&gt; slowed things down.<br>
&gt;<br>
&gt; I have an arbitrary deadline of M3 for these sorts of updates, so that=
<br>
&gt; is the goal and one that is quickly approaching!<br>
<br>
</div>
<blockquote itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quoted=
Text" style=3D"border-left: 3px solid rgb(200, 200, 200); border-top-color:=
 rgb(200, 200, 200); border-right-color: rgb(200, 200, 200); border-bottom-=
color: rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.8ex; color: rg=
b(102, 102, 102);">
<div class=3D"PlainText elementToProof">FYI: I finally managed to figure ou=
t the build issues, and have pushed<br>
an initial bump to v1.24.x to master-next.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
</blockquote>
<div class=3D"PlainText elementToProof">I have done some tests and I can co=
nfirm that we are not seeing the runtime issues</div>
<div class=3D"PlainText elementToProof">reported by Kamil anymore.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Thanks for working on it.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">--</div>
<div class=3D"PlainText elementToProof">Diego Sueiro<br>
<br>
<blockquote itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quoted=
Text" style=3D"border-left: 3px solid rgb(200, 200, 200); border-top-color:=
 rgb(200, 200, 200); border-right-color: rgb(200, 200, 200); border-bottom-=
color: rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.8ex; color: rg=
b(102, 102, 102);">
I spent nearly a day thinking it was our build, or the dependencies<br>
that were the issue .. and as it turns out, even in a native / non-OE,<br>
vendored or not-vendored build .. you get the same Sandbox build error<br>
that I was debugging. I've changed the tags to avoid the ctrd internal<br>
build and we at least get a binary.<br>
<br>
This should also have the golang -&gt; github substitutions that were<br>
suggested for the previous version, I'll do a closer check later on<br>
that.<br>
<br>
I still have more runtime testing to do, but the fact that there's a<br>
building jumping off point, I wanted to at least get it to master-next<br>
and let folks know.<br>
<br>
Bruce<br>
</blockquote>
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Diego Sueiro<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Bruce<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Kamil Dzie=BFyk<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and madn=
ess await<br>
&gt; &gt; &gt; thee at its end<br>
&gt; &gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7478): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7478" data-auth=3D"NotApplicable">
https://lists.yoctoproject.org/g/meta-virtualization/message/7478</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/92017071=
/1050810" data-auth=3D"NotApplicable">
https://lists.yoctoproject.org/mt/92017071/1050810</a><br>
&gt; Group Owner: meta-virtualization+owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" data-auth=3D"NotApplicable">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [bruce.ashfi=
eld@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR08MB3461DD84FFE2DD5B6152C60092639AM6PR08MB3461eurp_--

