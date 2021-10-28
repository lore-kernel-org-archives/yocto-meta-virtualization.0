Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.40])
 by mx.groups.io with SMTP id smtpd.web12.9738.1635410212473002697
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Oct 2021 01:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2LgTnIwv;
 spf=pass (domain: arm.com, ip: 40.107.22.40, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbUJMY55RNtHUih7C0Nj3ERiL6VCFl19Jq+ctQ4XpXM=;
 b=2LgTnIwv+BZPj501zo7N9RQQn0Fw0l8Ry+wTm2sqz5r0w2jrDvkpfq6uiZ9GpGXzL8armOn/PwkKDCilJQtPLY9ySuRNjC8aXkzKCQUhaYWlXBn0kqPWd3trRBXXmHuuN4YgtQBCtn0u2Wythe/UKayGGNFZGo1YoCiO9uZ2vFM=
Received: from AM6PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:20b:2e::21)
 by VI1PR08MB3102.eurprd08.prod.outlook.com (2603:10a6:803:3e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 08:36:47 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::5b) by AM6PR05CA0008.outlook.office365.com
 (2603:10a6:20b:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Thu, 28 Oct 2021 08:36:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Thu, 28 Oct 2021 08:36:46 +0000
Received: ("Tessian outbound b9598e0ead92:v103"); Thu, 28 Oct 2021 08:36:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3a3a00aed538a294
X-CR-MTA-TID: 64aa7808
Received: from b9bc758b80e2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F087E11E-5B6B-4048-9105-A6EE487A17B8.1;
	Thu, 28 Oct 2021 08:36:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9bc758b80e2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 28 Oct 2021 08:36:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maUxF6M1lh+LkWzQN5tE6BYMLYINnEDGucsYUiZIP7aLHETOeySWHGUCmvby5GRekKL4RZWKU+2ZR3NTtuYYyGCLzxunjT5100aZmUHkr9vJJa3aE1eEvTCW0CxDd+LCVoHVIeMNtmy5Ci9gXvYb2IyQ2KEojdtm15Lg5C5+i1BDIk2iIdSD1lKJx8bUX5JwLIyRx71VC1fzSqWkxhSv/yigXh4RWPziUGGdV8THf9k+9YjiFDo1rtMJGaODngccjRYKdLguWY/WK6Mr64DDoZZidM90rZc2KTS9qqFLqh0JU4d22nwLMV7E6XnuYEzEkzQ5gi826MOe2hE7zIkQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbUJMY55RNtHUih7C0Nj3ERiL6VCFl19Jq+ctQ4XpXM=;
 b=DMpj0yJ/TIe9FHzQ0nM0fhX3ExORhgvLvDwF6ca8QnOKMsPJ0p9Ezq/+/HyUx7wL9ZvxrNcJubfXwq2XXiiZJTNBb10GaTr6stTCYyeaZSf6xPh1UCAfcC8kuadRpnvQTsjUPS8X+F0Faglr7+SUlCHfLvcbVQSWSTijLNIvXkSb16zOWsVbpzKvqgRa0i3HQL1782IfHCfxzoU3j2XXb2fR7+wP8ujp0sQzwoRdtnryBQy1ZkwrkXK2734oeoN8VCoF1skTwpR9AA7cnAsjScLjtSuPXQNhelHvXqg/jpm0BJv5azlzPeQmbwikhZz+6cLXmojX6PJ5iftxyazqVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbUJMY55RNtHUih7C0Nj3ERiL6VCFl19Jq+ctQ4XpXM=;
 b=2LgTnIwv+BZPj501zo7N9RQQn0Fw0l8Ry+wTm2sqz5r0w2jrDvkpfq6uiZ9GpGXzL8armOn/PwkKDCilJQtPLY9ySuRNjC8aXkzKCQUhaYWlXBn0kqPWd3trRBXXmHuuN4YgtQBCtn0u2Wythe/UKayGGNFZGo1YoCiO9uZ2vFM=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4657.eurprd08.prod.outlook.com (2603:10a6:20b:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 08:36:30 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba%7]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 08:36:29 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>,
	=?iso-8859-2?Q?Kamil_Dzie=BFyk?= <Kamil.Dziezyk@arm.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
CC: nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service configuration
Thread-Topic: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service
 configuration
Thread-Index: AQHXx7y5U+7KFW6xA0+Y0RBuSfyMw6voHdCX
Date: Thu, 28 Oct 2021 08:36:28 +0000
Message-ID: 
 <AM6PR08MB346139074D6A33370A78A2DB92869@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <CADkTA4Ppi=7SLtd4hbDPZT1WARmaxs_7dwKMqa33wPuxz9aGLA@mail.gmail.com>
 <29697.1634888278709637812@lists.yoctoproject.org>
In-Reply-To: <29697.1634888278709637812@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 015d5ac3-eac5-9ad1-481f-77b5d9364556
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 21b699ac-242d-4c70-82a9-08d999ee1403
x-ms-traffictypediagnostic: AM6PR08MB4657:|VI1PR08MB3102:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB31028B7109F0C32AE0F2B66A92869@VI1PR08MB3102.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5ckweZs/A8v0jkNFuqG07cFYb/tRUPlBwNhJKAACcFQlVSUN38EWjeBK2z97ja3MQU6U8r/HSy57Qs3rX6KycUWVEIaagzOqikVikLb5L+IZEuAXmyXG0oQ18XJQmYKoq+KeYNG11Xqz3nYl/tkuB31HalX4Fw7GyE5gdSmVbGy4Wehpuzwk6X1MipIw1x+sUYhdO4IMduC4nOub294Ul65eTWGanA8he7/6f303x6pQaNpV/GnmER8QRkCGLO0McM15KOU8OEjy+d9/t40Sf2N7vGzAxEkTdKnwGDC/VqG1905ksHfhYHL+SCAvQV+FVZG8Fl+CASF+M8CnLP1n3CMFRQvfXrGpWtjY02jv7uo1UMeN8cQ93AgJyQRYorLDTSRH5rbgZ0y36tHMB4pesyo+U0TkLZDGz3y1yNrOjvHWRsiZMFZyd5gFmdUvdCDMK+tXA6qRBNa78VtGLQ6i5Ym73NaO3SH7R3au/ud88HP+twsyZmXsmmxTbGaHiSAir/jDNF7l+XpCjTdPaR/5t9KMn7WQ0js5bvp7b3c8eSFN9vXc1hGGtDcHy89eAN6CYY5vCoaKjGoXwB9od+eDU+sMbogSHmzc9sqC8JlwrvI3ZkEWd2I47g0Rlim1H59mH5EC13Gt0HZP05xEcShWL4xzWdFus0mFQ9X+G4UASs+FXAo5cpNYAagS9wgFCFP2hWsLNyHYBzzTtZp7H0vjj0BgN7oB03rtvmfpYbmwpsA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(66476007)(66446008)(122000001)(26005)(76116006)(4326008)(71200400001)(64756008)(66946007)(33656002)(186003)(38100700002)(52536014)(66556008)(91956017)(7696005)(8676002)(110136005)(8936002)(15650500001)(5660300002)(316002)(4744005)(19627405001)(83380400001)(6506007)(86362001)(508600001)(55016002)(38070700005)(9686003)(42413004);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4657
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a5799c1e-44c3-422f-1b84-08d999ee09c3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I68hJw8hTbGzuAqQRz+UvPItwGTGRDJdexZRvbpPiC9AKN+6e6Ex80dLJ6C6R94CPyCynoSQecDb4BEk1bYRLlLGoOiXpVGu2lyCnC3hd8A6g2eO8fvbTo8KKb+xp6YvH0azrNfY444errx2BF1dZSNiuXAKBIvpCkEF0ltSEymj2Q5dkLKSQ3pKO7HONWYwh3klaK5Rsia07j5y5EqakKqCjpCi1GTBFjU788Xb0P1YysYD4mnKyr415pWqISQlwf0gKsqLVpPb3v0IRD+ljf6aGrmxq89jyGcxrHyC3n+xd7GlGiMqrVTtvQ9B7WqLf8I+X1Xt34s6TFZb9ZIINzbRxyBmZJZ37VOUzNj+GRGMFrnqRem1XpfYO9lMf6lZshtSXg2yAkHNW4sftb91x1NbX9gikWoMjttpBwBgaiTnW3o/C1ith5h8TKHnySQhh3qDzGa3aaMxVH4VoUvx0aGnlaPcV/Y5wPyEC939Op+aQ4q82e4mO8eElq32cmTwLUXb3CLqiqhFbFbepBeXFmHFS6iFq4mhK3AnRWff/Oeolv8X2qIb9Q1ydlfMo7W9PbLkoD3VjxwlVaLoVLGgM5CgQtM3ilL6tbJCEY/yV0qAT5XuuvAiOVYvY7Lc9X63Ymu3oqbYwrq2cm3KUD2wlq0+IqvnwVrtZ4apuoRs9DKnleQsbbgtDiNRqKquhA4A2Zg1ywrWSnVhnPeYMTRUhHxxKpZ902y46d37FVFeJfQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(15650500001)(33656002)(82310400003)(5660300002)(336012)(19627405001)(83380400001)(36860700001)(47076005)(4326008)(26005)(110136005)(70206006)(70586007)(81166007)(55016002)(7696005)(6506007)(508600001)(356005)(8676002)(316002)(186003)(9686003)(52536014)(8936002)(2906002)(86362001)(42413004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 08:36:46.5616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b699ac-242d-4c70-82a9-08d999ee1403
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3102
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB346139074D6A33370A78A2DB92869AM6PR08MB3461eurp_"

--_000_AM6PR08MB346139074D6A33370A78A2DB92869AM6PR08MB3461eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable


Hi Bruce,

Any expectations to have this patch chain backported to honister?

If it helps, we can send the patches targeting honister to the mailing list=
.

Regards,
Diego Sueiro

________________________________
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> on behalf of Kamil Dziezyk via lists.yoctoproject.org <k=
amil.dziezyk=3Darm.com@lists.yoctoproject.org>
Sent: 22 October 2021 08:37
To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Subject: Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s service conf=
iguration


Hello Bruce,

Can you backport these two k3s patches to honister branch?

Thanks,

Kamil

--_000_AM6PR08MB346139074D6A33370A78A2DB92869AM6PR08MB3461eurp_
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
<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Bruce,</div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Any expectations to have this patch chain backported to honister?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
If it helps, we can send the patches targeting honister to the mailing list=
.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Diego Sueiro</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> meta-virtualization@l=
ists.yoctoproject.org &lt;meta-virtualization@lists.yoctoproject.org&gt; on=
 behalf of Kamil Dziezyk via lists.yoctoproject.org
 &lt;kamil.dziezyk=3Darm.com@lists.yoctoproject.org&gt;<br>
<b>Sent:</b> 22 October 2021 08:37<br>
<b>To:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH 1/2] k3s: Update k3s servi=
ce configuration</font>
<div>&nbsp;</div>
</div>
<div>
<p>Hello Bruce,</p>
<p>Can you backport these two k3s patches to honister branch?<br>
<br>
Thanks,</p>
<p>Kamil</p>
</div>
</body>
</html>

--_000_AM6PR08MB346139074D6A33370A78A2DB92869AM6PR08MB3461eurp_--
