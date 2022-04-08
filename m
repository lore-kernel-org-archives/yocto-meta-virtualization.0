Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C63C47087
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.87])
 by mx.groups.io with SMTP id smtpd.web11.8481.1649436853035318138
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 09:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=Z2kKnJv3;
 spf=pass (domain: arm.com, ip: 40.107.2.87, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkRr4Y5Kc9ZGAaptX20i+xMDDdZI7+x/Z2uGYhAEzEM=;
 b=Z2kKnJv3sMDoq321YszrI7SVAnBUtx3OmzJD3w1SHY2AURiWCXP0NlQpZSbciA6vJAHdkMfGgs5Tfw6jsnafY8o6113bWU24Wewvh+CqC1LsWr9SDEfD6CSyc6o+TjbdI+m0ez4u8IKGzn5DoEzqhZEpT+gL/hyjpEx9bxp5liI=
Received: from AM6PR08CA0021.eurprd08.prod.outlook.com (2603:10a6:20b:b2::33)
 by AS8PR08MB7189.eurprd08.prod.outlook.com (2603:10a6:20b:404::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Fri, 8 Apr
 2022 16:54:05 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::1c) by AM6PR08CA0021.outlook.office365.com
 (2603:10a6:20b:b2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25 via Frontend
 Transport; Fri, 8 Apr 2022 16:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Fri, 8 Apr 2022 16:54:05 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Fri, 08 Apr 2022 16:54:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 55132af21f572db0
X-CR-MTA-TID: 64aa7808
Received: from bfbf348fce7a.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6B206F0C-B999-4038-BC4E-04699D665F05.1;
	Fri, 08 Apr 2022 16:53:54 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bfbf348fce7a.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 Apr 2022 16:53:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hioU5a7pDOrQgjawlgLdKpLtDX7PuJfNhwN5Z1sdNgfN0qxv/aEkXTpndA9Z2gICcQYPgCwhu6oXrphSh4dopMXVlRHQLujv2881gGtuslmVPVQt+nRN2duAne1N2RqZUAX8OryU5Q3G0zOPf3+0xwfpEgDgniPILzW2MGT66i1GKHJqYG3fDPjscjesK+tIKQO1RG/Iec72wNW2MICzKBPjcwLR1FnXO3Qcw8+ETdWsqemi8DuNpUkTasuVG5w5YtRgQ3q+KaU6FzpdROnd1uhndfRc8VhqbDAN+8u36Q49NfRvAW683wzyqzweCOczqMjEP6QSJ6RRCebIk0I1/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkRr4Y5Kc9ZGAaptX20i+xMDDdZI7+x/Z2uGYhAEzEM=;
 b=H1PiI31c2V3aDG1r1/mUP3Xv11bOASllJKzIL2rpIdDKHQonC1JO3WZ9Q+KYn2+F9gCp/Y0yMkHLurV88UsY7QYPgvz7zIcdEcYCpVW94U/JGBzX1ugdz+ZjGtmsohSMz98aRcUQjyUrLcWalpUMOaFIscn8Ohbozpy2EBOpFxRibi47L9XJ5QD+vNYXkRihfzELVxWfoiiJu0K2e+hxWKV9H9tZWSGpU8w39H9uu7EGypMUdPWiZI2gtSH1e0llA6hzW41n88NU0oiUEi5scP9GTB8ifo+6Fq9PppGUn5AbvgMOH8Qk/nhDwlZ0RiOuy/RvnQ0FdP8zpjhUeuKFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkRr4Y5Kc9ZGAaptX20i+xMDDdZI7+x/Z2uGYhAEzEM=;
 b=Z2kKnJv3sMDoq321YszrI7SVAnBUtx3OmzJD3w1SHY2AURiWCXP0NlQpZSbciA6vJAHdkMfGgs5Tfw6jsnafY8o6113bWU24Wewvh+CqC1LsWr9SDEfD6CSyc6o+TjbdI+m0ez4u8IKGzn5DoEzqhZEpT+gL/hyjpEx9bxp5liI=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by VI1PR0802MB2445.eurprd08.prod.outlook.com (2603:10a6:800:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 16:53:47 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e43f:7349:4eba:e0b7]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e43f:7349:4eba:e0b7%2]) with mapi id 15.20.5123.031; Fri, 8 Apr 2022
 16:53:46 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Neill
	<Richard.Neill@arm.com>, nd <nd@arm.com>
Subject: Issues with k3s runtime on master
Thread-Topic: Issues with k3s runtime on master
Thread-Index: AQHYS2bEfSlj480+D0+jbei6NRCQYA==
Date: Fri, 8 Apr 2022 16:53:46 +0000
Message-ID: 
 <AM6PR08MB3461FBC64EAFE017BD3EDFBC92E99@AM6PR08MB3461.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fc343b3e-e409-45b9-748f-08da19806429
x-ms-traffictypediagnostic: 
	VI1PR0802MB2445:EE_|AM5EUR03FT015:EE_|AS8PR08MB7189:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB718940A2BE22FB7BB1BEBB2E92E99@AS8PR08MB7189.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Yt5ASxNEQJfyH9MWh/VmLggjOVh0+zkbPPKeaCOwOFeEnd1aAJBfhUmfdKW5yQO6Mm3JoiJ/qxBu5gKXSayRpZz27KuFPqhik+csIwvWYyN38gQoiZkxTli0OeP66+EMPXJM/an3Hixg3RuimyDkw0ls9SDmrvzjal7I/qUlazPZ+tN2B22bc7+a8bCrsVkAtxYXz4ZXDCcgbgvcUoxjFSgN3G8cmdAabBr0/evGGpcPHv+FVjuFn+eQ7MbqRm/wTnCn7v5RR8TOw0PB5zhwCw+n76QEK8vlApnkOfu8nOv8khGTiOVBoWm1zBzqKWb1Mp94E3Lc0WuZRW6fhe9zZ0D9lSjXqcKmUg5dfk4sAkEAB7iAA5llwWvT4aHyAKOXBGDxigEvMa3Wr1mvs6C8n/UvtBUqdOXQooWWRCOtQLaZFOQ2H8CjlZqMao+R6FUJ7ksd5rNkk4CVq4+brIUh9lf9eZMQPeIbolnUAoOojMNsY+yAuMaF6cdwhgNQC33pWB7CPAHnq5edTXBVlCDGvqgQlk6N8U+O6edXQVKKXjrYfbF7E87wVa0evHej4TCU0qP/FdeZIGbOlfkXdmNWxuwXGOlkun8sQy5TUZEV/mlxxaqPmwtqlCsSJr0xM8FNLQOsw80oUHjzJZyzfCPwtR+My6VlnabDkF/1JOS5T54hbO2XSHBjck+4R97tmzgFTE4BMpUe35WpslLHj/tTIGQ3LhvQwoweXe8u6FJUg80=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(8936002)(83380400001)(508600001)(76116006)(122000001)(38100700002)(52536014)(64756008)(8676002)(6916009)(5660300002)(55016003)(54906003)(38070700005)(4326008)(66476007)(66946007)(66556008)(66446008)(19627235002)(71200400001)(9686003)(91956017)(86362001)(316002)(2906002)(19627405001)(7696005)(26005)(4744005)(6506007)(186003)(42413004);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3461FBC64EAFE017BD3EDFBC92E99AM6PR08MB3461eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2445
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	627dc8c7-b1f9-4b77-39b3-08da1980592e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	imvXSWwLnEILojG2nFJcwFYRoGJKoQAAhOaeWDwpPOZ2xHAPYYg65SEpkhE+PayFvFZWEIiYqdidCHHeH0rVuTohwCazJV8fONM1cewZQCENYTEOKHTejoYXtWOAplr4ceX/sYMOkh05A4lOmzRScQeHK4gfL9oeBqVWg82ynVQyvdyvoWsl/wrDlZqcTK1RzXcIp2sL+Mr6hy8FBYJrx/TCt3KMEH75jz8XMHxr5coqyfeDbO1iTdQ4ENLwOZSdao5WvNk+vTXmMuUfR0vmPn5Ym25UKHT8z/n61BcnvWcN8nHxB8QLGvZYKUkgYllOKoFy2huROpjHtJi1h203TymCKutRj6TnR23JPBPNjJEeJhrGR40NSfwPBn8Rgknzmkw+Nb18y0gD3ZzOTbWqedpGxAjxVWHIYQzy2jiIzjOM9i5k1TryZ8hMnkPdyJN2DC6i3S6ueYVxorKJD/64p0TogeQ+bgmhEFEBArNo0Npzn77tme7Vk8rInxXRdUzE/0GPjn7t8NAJLffQwJSBC2X5cB+nN0jYh0C1/TAEc0t7D1c3aTQXWReOfHBhs3Y4MwjSs+PhiD9XIoseSAu8Q8Uft/ok6/BdPY2ixirLT7ZzBjWPLhSHE+yRQMkXCqq+ULNtkgCn1XW87wIMII0Yd7wBMqzYxk3N+SpdZJrhqk+GPWXxEB1cnA06qYpXt+AVp09S6gnbBPQ1LtDQTMwHTQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(19627405001)(81166007)(5660300002)(7696005)(508600001)(6916009)(36860700001)(52536014)(356005)(336012)(9686003)(83380400001)(82310400005)(186003)(26005)(2906002)(8936002)(47076005)(86362001)(6506007)(4326008)(33656002)(19627235002)(55016003)(70586007)(54906003)(70206006)(316002)(40460700003)(8676002)(42413004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 16:54:05.2668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fc343b3e-e409-45b9-748f-08da19806429
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7189
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7137

--_000_AM6PR08MB3461FBC64EAFE017BD3EDFBC92E99AM6PR08MB3461eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

I'm having k3s runtime issues where during the k3s.service start I'm gettin=
g error messages about missing /usr/libexec/cni/flannel.

I saw that the cni_git.bb recipe was bumped to versions where flannel and i=
ts plugin are not available anymore.

In this case, should we have a recipe to provide both flannel and its plugi=
n?



--_000_AM6PR08MB3461FBC64EAFE017BD3EDFBC92E99AM6PR08MB3461eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Bruce,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I'm having k3s runtime issues where during the k3s.service start I'm gettin=
g error messages about missing
<span style=3D"font-size:12pt;font-variant-ligatures:none;text-align:left;b=
ackground-color:rgba(0, 0, 0, 0);display:inline !important">
/usr/libexec/cni/flannel</span><span style=3D"color: rgb(0, 0, 0); font-fam=
ily: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;">.</span></div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I saw that the cni_git.bb recipe was bumped to versions where flannel and i=
ts plugin are not available anymore.</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_1 _EReadonl=
y_1"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
In this case, should we have a recipe to provide both flannel and its plugi=
n?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_AM6PR08MB3461FBC64EAFE017BD3EDFBC92E99AM6PR08MB3461eurp_--

