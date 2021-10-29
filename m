Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.48])
 by mx.groups.io with SMTP id smtpd.web12.2552.1635494949547249269
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Oct 2021 01:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dBYeScJ2;
 spf=pass (domain: arm.com, ip: 40.107.14.48, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQpvIXBEslLPbXG7wuQDL1c03PzSkvEq1p9D//yc0yw=;
 b=dBYeScJ2/qnGevyENOUoywGcCKRUgCcM/ojwMvfptA/JqqauHfVTdH/9pNwyhdEPxKaKBVGz7oaUcCrgxh7Y9O12htfN354c7TrcKSFcKYw5L/a6BaHtCQRWaBhLeMj1b25QNq5on1AdB902uAt9hDi+duiEX8/SPs3Jmwluntc=
Received: from AS8P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::13)
 by AM8PR08MB5811.eurprd08.prod.outlook.com (2603:10a6:20b:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 08:09:05 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::d) by AS8P189CA0028.outlook.office365.com
 (2603:10a6:20b:31f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.22 via Frontend
 Transport; Fri, 29 Oct 2021 08:09:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 08:09:04 +0000
Received: ("Tessian outbound 2bb1f94ba47e:v108"); Fri, 29 Oct 2021 08:09:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d660c717167cad23
X-CR-MTA-TID: 64aa7808
Received: from 321bf1abb2bb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C95EE795-5B51-46BB-9C4A-3955503EFB01.1;
	Fri, 29 Oct 2021 08:08:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 321bf1abb2bb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 29 Oct 2021 08:08:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TX/SzRDQkJG0576lwB0dmaqeEXParST3mzia4ctSoSQOB4B9RF8quaw32OCRRo6xq93URjSlB6cmJeDa5jU3790dlGG3fzJfIaJneMoUT2YLPNlD9hvjYLy0wuIVnEK9sUzhzOboS9U68Zc/yW8GhHId2jUD95EObfThbqGJgJPYqRxitkDQV2QUx8QV8oZRkkG8vlrmdJN/xaaHsDiS05dopmlYoIKcT1hLcJ2hcKvS2t6Msdf9QIZdCK/Nmfo+VtBX9N/HaeqINb/yVDIuSDy+17abAuJWbiP1kl6iGReOXK1zSbTas89X7laFkWmal0vUzDraPlcUF1qqL9Jp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQpvIXBEslLPbXG7wuQDL1c03PzSkvEq1p9D//yc0yw=;
 b=CrTuSYrhmVDF8RBSQtZ4h1MuNIHmxAX5X4/brBBTPW94e9AtWHfMpm//+UBPszB5Xp3sxrzclnfnBK0rZmLJIyiUe0z7Do65+tvdBkxb/TyFGik4rjK/pLkq/g/mP4j4XE8o/hNUcuWJJbmvYZ+zTDiNxho6XKFnnldx7QDBQp/fq20nY5tg8k9iGw0wRCFUOCUCTiUSO39qBixg/VoFvqLfsxbWPeCkcK1XCMZH4BM61t3nB/fWK7ElKrpN0g/YIFlZXCNb1JgNSYGpRtxlFoeT5KGs1PfnKnWatAYj2Do5Rr3PzyJCNgl19pEpBO1Ay8TbsiqlA6V12LmIzQ/JGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQpvIXBEslLPbXG7wuQDL1c03PzSkvEq1p9D//yc0yw=;
 b=dBYeScJ2/qnGevyENOUoywGcCKRUgCcM/ojwMvfptA/JqqauHfVTdH/9pNwyhdEPxKaKBVGz7oaUcCrgxh7Y9O12htfN354c7TrcKSFcKYw5L/a6BaHtCQRWaBhLeMj1b25QNq5on1AdB902uAt9hDi+duiEX8/SPs3Jmwluntc=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 08:08:52 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba%7]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 08:08:52 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>,
	=?iso-8859-2?Q?Kamil_Dzie=BFyk?= <Kamil.Dziezyk@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service configuration
Thread-Topic: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service
 configuration
Thread-Index: AQHXx7y5U+7KFW6xA0+Y0RBuSfyMw6voHdCXgAC35SeAANMzbA==
Date: Fri, 29 Oct 2021 08:08:51 +0000
Message-ID: 
 <AM6PR08MB3461AFFCF7CB92585347F2ED92879@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <CADkTA4Ppi=7SLtd4hbDPZT1WARmaxs_7dwKMqa33wPuxz9aGLA@mail.gmail.com>
 <29697.1634888278709637812@lists.yoctoproject.org>
 <AM6PR08MB346139074D6A33370A78A2DB92869@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <16B232F25D90C384.11077@lists.yoctoproject.org>
 <CADkTA4PGDpxzYR+czzoHCKH23tEA2OFty8QaMPoA5GTsR5PEwQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PGDpxzYR+czzoHCKH23tEA2OFty8QaMPoA5GTsR5PEwQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 8f79d888-b6e4-4223-1fe6-6084967d8728
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d0f7cf3b-30a2-4e83-3800-08d99ab35fcc
x-ms-traffictypediagnostic: AS8PR08MB6263:|AM8PR08MB5811:
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB5811CEF869927E017DF7297492879@AM8PR08MB5811.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NZPz0+5F9fxwq6cUf0D8ln75pyvy2gxa1tGiZ9JK08qrFka/eia2nqOiLpJTOVukDAM189SbBqCLG0QUHm0uMeAVysU1cGrhuwi5fPws3PwPCstS8X+uXUiGyl+sm5dVXhCYQnpAit/IckeQjrGQRa7W7TNUPpZElqQxyR2IROkvbYGCTMKNPmphU1yEFGnj7eFkcZD1cZUFXhxvqu6IgzzecEGgT6F868oxfGUjFOKLu/zm1R/naHu2PCUIKpOc8oXYcCn1PbVTV0x3tzCue7s+QYCnpn9sYQ6OZjKQ26tTgdGmw7PmO6SObejBaslUAdqqpeZ0unrtU126P01p0qQ9gIAaXQG74a+OHBvff+PN7avL7uBPQefK65H0zQmti26JndIKvvqgMaHkR4yWfMqqvoIrytXPYj8t95MARSt8xJW4AWMZHmGbuRbWmeswtIxAd7sG/AQRBuNIW6Q21eLnwj2yUQDwk22rqD6tuMSsVlUvn3Wl/BBhuKF5eaTxM79rvjAqhIxAPOg06reSFiXP/RNWuw9gu5Bl/tzaEbxCibEPzfyReRGOFMkNe6BxW0p30ecNt5Zk3ERln/6YulJ59rH6r3FF53IERJ135DL540xjzTgv+IfYa19B2ezqFyIAzQxK6lf1v+jOj0t5mL/QixxtwetJhZh5WTrdv4ZJGtg2VyO3ZO9Epc5UpwL8ltrp/X1VFudbZpAuQNPYX7vPafeaOjELMbpHYox6GUjgL6qkliMOHpPS6HsHCaJXLmPwwgUOjy9UnoayJNwVLTmmE1cCuwt7HDusBDNxUIiXVffcPWS0U9QRJHFVcaQu
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(15650500001)(64756008)(55016002)(8676002)(38100700002)(186003)(7696005)(316002)(4326008)(52536014)(71200400001)(6916009)(122000001)(2906002)(66476007)(508600001)(33656002)(5660300002)(86362001)(8936002)(66946007)(66574015)(83380400001)(38070700005)(6506007)(66446008)(66556008)(76116006)(53546011)(26005)(19627405001)(54906003)(166002)(42413004);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6263
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b141b09a-0d07-49fe-9350-08d99ab35849
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A/iPwXYrOcw0fbjQeZ7NpGIcmZid9C5eXKdqHUOORl8JK8Pc9UziOxa5GJi3zjCCfYsEDQo/w7MYzCqoGaMhrM4Q7q6NqAs+6JxGHfGTYa5P/vZMvSPmPukhaZDBEPkMvWc1O7j8JoSRvMP25zK96LRilrY59qXgx4jtZsyyFskDq9CWlhIHV7wopkpDqqCSkGq+qJ+SbhIbuR1ycDg4/9hlf8EAC5z7gAoW27nP5N+aJu7MUIIl0wV/Q97ANDd8yMuoyZZVO+r5UdiyXENp8qWUroUJLQZudCe1Z7ob/Kzxv+U/qPae5PHgTHoljraIvQWwy7yiMP4Q0cUTDt4v0bd3UnfiZqC/08ugnS+jY1Y1E8bM5/rt9I8D9NI+5eQgOhB1UrOKbZe1Rftxpeag/YGV1WqCbx8J5I1UjMGjMktMZnNKEHvfKlMMlZYp77LILkK5QSfHkS3kCm0ZgBGf+1WUBsARwcfjcnloIywdB1cPZTd/jpP0N9oUBp8qWzo/f3E/0WJ3bMhR7t5RXRrpR1l/sVRafqt8Vg4L07RpVAx+IyAuuO60tUwI9I48TYgVqAmwxWzu4XUw9pFu5kAuPXZVVaglCmxVqlrkRIE6PRug/czhFn1CUjIn1b2awC171JDFLKc+0eYa+v4dASpjvfj4ufAQPBPns2H2RYYwKPy0FHgE2lBYtIqy1hA3Cm4EnGWuFDPHGil49nVvxRrEqXRZ9q/zBpz7uiaZlhbWu3mzcpsHJqWewhWZluxCbM2gnf7zqBs+ESGKBbw/o9lOiAXJ14DRNk7WQXaat69Ha4WdNaeaN16GRHwPzrszyJRA
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(70586007)(53546011)(52536014)(6506007)(33656002)(36860700001)(70206006)(55016002)(5660300002)(186003)(83380400001)(19627405001)(81166007)(86362001)(166002)(8936002)(8676002)(356005)(7696005)(82310400003)(9686003)(508600001)(316002)(2906002)(6862004)(4326008)(336012)(47076005)(15650500001)(66574015)(54906003)(42413004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 08:09:04.5259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f7cf3b-30a2-4e83-3800-08d99ab35fcc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5811
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3461AFFCF7CB92585347F2ED92879AM6PR08MB3461eurp_"

--_000_AM6PR08MB3461AFFCF7CB92585347F2ED92879AM6PR08MB3461eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Thanks


Diego Sueiro


________________________________
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> on behalf of Bruce Ashfield via lists.yoctoproject.org <=
bruce.ashfield=3Dgmail.com@lists.yoctoproject.org>
Sent: 28 October 2021 20:32
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>; meta-virtualization@lists.yoctopro=
ject.org <meta-virtualization@lists.yoctoproject.org>; Kamil Dzie=BFyk <Kam=
il.Dziezyk@arm.com>; nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service conf=
iguration



On Thu, Oct 28, 2021 at 8:53 AM Bruce Ashfield via lists.yoctoproject.org<h=
ttp://lists.yoctoproject.org> <bruce.ashfield=3Dgmail.com@lists.yoctoprojec=
t.org<mailto:gmail.com@lists.yoctoproject.org>> wrote:
On Thu, Oct 28, 2021 at 4:36 AM Diego Sueiro <Diego.Sueiro@arm.com<mailto:D=
iego.Sueiro@arm.com>> wrote:
>
>
> Hi Bruce,
>
> Any expectations to have this patch chain backported to honister?
>

I've tagged them for backport, I was just busy trying to figure out
why python 3.10 is breaking master.

I expect to get to them shortly.


... and they are now on honister as well.

Bruce


Bruce


> If it helps, we can send the patches targeting honister to the mailing li=
st.
>
> Regards,
> Diego Sueiro
>
> ________________________________
> From: meta-virtualization@lists.yoctoproject.org<mailto:meta-virtualizati=
on@lists.yoctoproject.org> <meta-virtualization@lists.yoctoproject.org<mail=
to:meta-virtualization@lists.yoctoproject.org>> on behalf of Kamil Dziezyk =
via lists.yoctoproject.org<http://lists.yoctoproject.org> <kamil.dziezyk=3D=
arm.com@lists.yoctoproject.org<mailto:arm.com@lists.yoctoproject.org>>
> Sent: 22 October 2021 08:37
> To: meta-virtualization@lists.yoctoproject.org<mailto:meta-virtualization=
@lists.yoctoproject.org> <meta-virtualization@lists.yoctoproject.org<mailto=
:meta-virtualization@lists.yoctoproject.org>>
> Subject: Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service co=
nfiguration
>
>
> Hello Bruce,
>
> Can you backport these two k3s patches to honister branch?
>
> Thanks,
>
> Kamil



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II





--
- Thou shalt not follow the NULL pointer, for chaos and madness await thee =
at its end
- "Use the force Harry" - Gandalf, Star Trek II


--_000_AM6PR08MB3461AFFCF7CB92585347F2ED92879AM6PR08MB3461eurp_
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
: 12pt; color: rgb(0, 0, 0);">
Thanks</div>
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
0"><span lang=3D"PT-BR" style=3D"font-size:11.0pt; font-family:&quot;Calibr=
i&quot;,sans-serif">Diego Sueiro<br>
</span><br>
</p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-virtualization@l=
ists.yoctoproject.org &lt;meta-virtualization@lists.yoctoproject.org&gt; on=
 behalf of Bruce Ashfield via lists.yoctoproject.org
 &lt;bruce.ashfield=3Dgmail.com@lists.yoctoproject.org&gt;<br>
<b>Sent:</b> 28 October 2021 20:32<br>
<b>To:</b> Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt;<br>
<b>Cc:</b> Diego Sueiro &lt;Diego.Sueiro@arm.com&gt;; meta-virtualization@l=
ists.yoctoproject.org &lt;meta-virtualization@lists.yoctoproject.org&gt;; K=
amil Dzie=BFyk &lt;Kamil.Dziezyk@arm.com&gt;; nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s servi=
ce configuration</font>
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
<div dir=3D"ltr" class=3D"x_gmail_attr">On Thu, Oct 28, 2021 at 8:53 AM Bru=
ce Ashfield via
<a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;br=
uce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.co=
m@lists.yoctoproject.org</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
On Thu, Oct 28, 2021 at 4:36 AM Diego Sueiro &lt;<a href=3D"mailto:Diego.Su=
eiro@arm.com" target=3D"_blank">Diego.Sueiro@arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; Hi Bruce,<br>
&gt;<br>
&gt; Any expectations to have this patch chain backported to honister?<br>
&gt;<br>
<br>
I've tagged them for backport, I was just busy trying to figure out<br>
why python 3.10 is breaking master.<br>
<br>
I expect to get to them shortly.<br>
<br>
</blockquote>
<div><br>
</div>
<div>
<div class=3D"x_gmail_default" style=3D"font-size:small">... and they are n=
ow on honister as well.</div>
<div class=3D"x_gmail_default" style=3D"font-size:small"><br>
</div>
<div class=3D"x_gmail_default" style=3D"font-size:small">Bruce</div>
<br>
</div>
<div>&nbsp;</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
Bruce<br>
<br>
<br>
&gt; If it helps, we can send the patches targeting honister to the mailing=
 list.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Diego Sueiro<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">
meta-virtualization@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:meta-v=
irtualization@lists.yoctoproject.org" target=3D"_blank">meta-virtualization=
@lists.yoctoproject.org</a>&gt; on behalf of Kamil Dziezyk via
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> &lt;kamil.dziezyk=3D<a href=3D"mailto:arm.co=
m@lists.yoctoproject.org" target=3D"_blank">arm.com@lists.yoctoproject.org<=
/a>&gt;<br>
&gt; Sent: 22 October 2021 08:37<br>
&gt; To: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targ=
et=3D"_blank">
meta-virtualization@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:meta-v=
irtualization@lists.yoctoproject.org" target=3D"_blank">meta-virtualization=
@lists.yoctoproject.org</a>&gt;<br>
&gt; Subject: Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service=
 configuration<br>
&gt;<br>
&gt;<br>
&gt; Hello Bruce,<br>
&gt;<br>
&gt; Can you backport these two k3s patches to honister branch?<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Kamil<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
</blockquote>
</div>
<br clear=3D"all">
<div><br>
</div>
-- <br>
<div dir=3D"ltr" class=3D"x_gmail_signature">- Thou shalt not follow the NU=
LL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</div>
</div>
</div>
</body>
</html>

--_000_AM6PR08MB3461AFFCF7CB92585347F2ED92879AM6PR08MB3461eurp_--
