Return-Path: <richard.neill@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1321C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:11:18 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.79])
 by mx.groups.io with SMTP id smtpd.web12.7060.1651673470744416423
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 May 2022 07:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=btr5vAjI;
 spf=pass (domain: arm.com, ip: 40.107.1.79, mailfrom: richard.neill@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=I3tZgAs6S/CjKsdCChvCxtJ98KyaCwUb1H5npaylcqlC6GMnQ3KgcjNcXA7XtDKWJPwrXmnQ9lRCgY7a7vbZxAj2qHa5Y4STV43Jm7oAiJbypjSQe6mxYQN3PKUytFuG1F3wbfAkJZoiUntTCjMfcGOOqxkxvudB8ToA9v6n3KoxABCkiVbt8/v8mG2ss/m8u0MuYQqK4oamQhCGpr+41U3KGCdyspTlRQ+45TRxJUdo1JFEAUY+1IPEWMqbpZtP5gBu0N6okAh5ehpdtK5jM32h6Q2YmT1i3tLyx+HGf4G/9n4l+3DKRBaI1Pg5k5jyKTcKoXe1lQKwKmBZ4UDwLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lx8pcBd5BfZNUaiB8EatwolTvOwuMQpzQXcWsyY9328=;
 b=RlDghR4mSXSis2J2e/+tUyOEQh35kJDeB6Oemp163pp4/d60aFTtWlP/PHm2BwCmwzYef2gyD9vVHdPzzcB72nuobeEitqwdqnhOK3J8zIXp7z18blgQlQg1vEI2aJHMd01hFQcPgSUmXDPlG+x8urcwCHK++3WgP6w2QuGLmVpKTIBaT42Os75XQAEdgX1ihTUsambGcgaOV9U0znQ3I11JOJMm7qK0Ny+Ei9Njs7G3qPUJc+fip2pwRsIeNm+HTifxeD7IGmHSYhW4+zGbOw+xiv8UTHdkWR2u6j8wPQfd+WyQre+neHEr9/JHZKqRqMFPDZ7nLemjqWnIlBlBHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx8pcBd5BfZNUaiB8EatwolTvOwuMQpzQXcWsyY9328=;
 b=btr5vAjIKLQu/k6puHly+/WzdlhdigUCkSHkzYiSnM/INE7O4SI+RayTHDUFZgjeVFkWbnbYfX5Vnkkibg635cOziKxzDZkqyVc2mBQ4lDAiiNSfBP6shn5tpAEX/R1nIKiFm/OQo/rUVDNRR2rR2o4mScrvfHY7Mf6UR8v9xnk=
Received: from AS9P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::16)
 by PAXPR08MB7319.eurprd08.prod.outlook.com (2603:10a6:102:220::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 4 May
 2022 14:11:05 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::ea) by AS9P250CA0017.outlook.office365.com
 (2603:10a6:20b:532::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25 via Frontend
 Transport; Wed, 4 May 2022 14:11:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 14:11:04 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Wed, 04 May 2022 14:11:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70f3abe721562cd8
X-CR-MTA-TID: 64aa7808
Received: from 97bdf0f8999e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF428B3B-A59B-48EF-B642-EBD7BED84EF7.1;
	Wed, 04 May 2022 14:10:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 97bdf0f8999e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 May 2022 14:10:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqDWsuVRuPPqQvmmgVKmufibr7ghS774eUoOMEyUhfLoh8KFMs1clZh+5+4EPG4CIIBQrVBl8Tjmuov1Toq0tl0SiWZ57PR3xXhbyj0s0AspMexEonCFvLLU3GmBaWxdov+efKEHhvpitFI3bIl6cGJK7tsqUgFGbM8DecQ92rXGKA43br1bNQfA8mljK0bT9l7uu3zGpWO/MySvwvHgJZH8OT7f53aHn9K3vIUVtfQuIgybDSukLLsDV3JQvNjrcugO/UV974UcTV2aTibGJhxl7aSizpfER2BDrCdu3CR93wItP2uKywfSj/CUZhNueAEQfV/kD9RtVD+ejH22uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lx8pcBd5BfZNUaiB8EatwolTvOwuMQpzQXcWsyY9328=;
 b=BgEmF31DefiDIcFeKAPg+iVyTIz3sgEmlvNgEnxmAu1gBdfGOLcJkx/j/hqOId4+xhSw0CT7zAeohIkzswMI1aBV68FNbfsnmcirHujsOgEnutYYfADEmBCqop4MszRmB43jgJ7IMfEs81D18d8YxHIvATtZyRmP+KHaTYWMgjkVRWuIozKdZhene2MtoM4Z4NXXtfjfTpDDbSNU+mxrbEaHrI4tHilKu70+XoenC33DDwN0evvHDIwJkUuTT/rZyatPZkLmaS6eXS9waOSnF39Wt+m24Lh/8K7BmAbrUc+T+9zvlAyON4kuTeJIgGZqdIUa5z1UMdfXlh7DLK80rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx8pcBd5BfZNUaiB8EatwolTvOwuMQpzQXcWsyY9328=;
 b=btr5vAjIKLQu/k6puHly+/WzdlhdigUCkSHkzYiSnM/INE7O4SI+RayTHDUFZgjeVFkWbnbYfX5Vnkkibg635cOziKxzDZkqyVc2mBQ4lDAiiNSfBP6shn5tpAEX/R1nIKiFm/OQo/rUVDNRR2rR2o4mScrvfHY7Mf6UR8v9xnk=
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com (2603:10a6:20b:8d::18)
 by DB9PR08MB7493.eurprd08.prod.outlook.com (2603:10a6:10:36e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 14:10:56 +0000
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::a875:6426:da0a:78b4]) by AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::a875:6426:da0a:78b4%7]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 14:10:55 +0000
From: Richard Neill <Richard.Neill@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH] docker: Add runtime provide for
 virtual-docker
Thread-Topic: [meta-virtualization] [PATCH] docker: Add runtime provide for
 virtual-docker
Thread-Index: AQHYX8CZ3EBw3w0IU0mGg5ds5ZT+360Owc6K
Date: Wed, 4 May 2022 14:10:55 +0000
Message-ID: 
 <AM6PR08MB389368C0523C2FF560F9559FE0C39@AM6PR08MB3893.eurprd08.prod.outlook.com>
References: <16EBEC2A1E9CA56E.21000@lists.yoctoproject.org>
In-Reply-To: <16EBEC2A1E9CA56E.21000@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: a0208727-8f42-585b-d4a2-33c56c7825b9
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0ebbd32f-bc38-4538-a8ca-08da2dd7ed60
x-ms-traffictypediagnostic: 
	DB9PR08MB7493:EE_|VE1EUR03FT010:EE_|PAXPR08MB7319:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB7319F1DEF34C7F23304C4208E0C39@PAXPR08MB7319.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 q8bd7Oi5Ws4Z94ho+fVrGHAOfBVVrki6slGOcVG4RmLTVqj3bSQ3dhIQnkZLW8b6cJZB/+Uj6+Fy3v6xBX2BwZ3GWjBL3scfSmdYqYeTzPnCM7svLVoq0lLRLSo0VJ395O5nowH66Ja7TTs4ay7fq7CuSEA+wTZgmR8UrI0rg7MT12n13mq8G8aMhEHMhO95PLMVNN6Tl2jB4WiQXEiEpQnoQ3JsEJRcPJsp06nP3ui+OCxhIeZRYZL+yG2pcKTLwNG5+44PtdLqb9WCWdQ3xy+Mx1EhdX65YaghEddCQfTGZtcpxMdaQZ24xAqA1W08tGG4Wvw/Y8ZJh2+ACEXnDNmeWY37yuKX2p+iFrRjfPWe7hYwvYnYFWZnKZBov62bHSU0rlWGs/zALe+oFkzWVW8wHAYIWwOcDqOo7QHqlf/OHZ5BOaV+KBhxCbAcTwuouIJ9LvSk3ThEBbY+vRYKLUhQFS0/kkjfEqGEsI6TkUIaXpphBsOwxG9eddsDZi1HaCGtl1DIMCJdLm0hr/uTccrkANL3Oc9S+L+WthQFZN6wAa4ektBspK7bceYhDZ6Lnots+vZZT5dHm/58NjZLHdoThZcNRo3u7RTk+l5vedj0j+Js6LlS33ziCdEw+UdZnuiYdmLYU3GtnLMwh8r7AO91e7yq+bK02opSGeTfk7U5jvhHS4k5MiiBBK+a8fkb4Kd37at9RZ33fjcDMvj1YSTAEgPq+HZHQ0JIz08F1HIKnzUutx0Ubb558qMU49tdO1f2HQsl9X0BpDrVGv8remkc9/wbF3Ty0AAGfJCz69U=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3893.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(52536014)(508600001)(5660300002)(33656002)(66476007)(64756008)(91956017)(86362001)(9686003)(26005)(2906002)(66446008)(7696005)(6506007)(55016003)(38070700005)(122000001)(38100700002)(166002)(71200400001)(186003)(8676002)(6916009)(4326008)(316002)(66556008)(66946007)(19627405001)(76116006);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB389368C0523C2FF560F9559FE0C39AM6PR08MB3893eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7493
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b514a5e6-3a7b-4283-58e9-08da2dd7e7aa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yM12mBA1cXnBs7W3Yn5eNx3kdsCvjWm2W9LBgA/56/xTgEsufD2px2zFcCOr6oRPCYHBvW9SVNqdD0KkJRs+0Vt3Ez+0gQb7n+yhU1xoi93SgVadn1CNvBd4Z0LvrWE9mBPizhu7/Qh1J1FgcuJAueB7wQmmnpjUM6smSqCe728RU0mwOxLvAJiPN1DIS580DEUf8jeCF15eSkzcQMqZisk+1ZIeHIVQ/Ji8lKwLkhDB36OdFD9gnvg3lZWOndbyqdUUYcB9PkD7fXYGkFgSi97vJPqZcReroGLXzTjGJbde0f7UhQvZNGstg1lhuU4z2iVblzmsDjppnRa9nby1e92hZ2niGrNj7yt7aziKzC6VOQfSrZq3gxycRVz9GfcY8Oo3vEt8LmjYB3d1kB3SfHJLVJSkejqhN9TCdpa6vRSvpi9JQAebJO+PQ2hq1yund8v6ucfpfpG3Ln3qG/fe9RCIlVntLajf6FvwgdC7u4BLXVrYmZPBWxkQHs97gwF+Zm0D2cCiUPE9MGNvCLKsuEXSYwqg/II5SV20QAKTIIT861EJxGzBYH3Y06L1D3CIpkO31KABdUVKJKNs6SHsKQePv82nF4v+kGPHfnOUq+XszJODJvJqJJ4ZIklkeTw/eSRVwIpWCvQk9yYZ/HBuZu9lJViivcqz5pEZFTiYxN9KWoT/Er3wfGdAIMaQ5iNr2cSDNPTI4JxZPSQBTgOwHklrDIrsgO32ObYTmwq6Pte1kmDKvQxhEXZtZkzITJC6A9JrfFINnPQu8NKerkWZOw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(4326008)(70206006)(186003)(19627405001)(9686003)(36860700001)(86362001)(8676002)(70586007)(82310400005)(40460700003)(166002)(7696005)(26005)(47076005)(6506007)(508600001)(33656002)(336012)(316002)(2906002)(6916009)(52536014)(8936002)(356005)(55016003)(81166007)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 14:11:04.9031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ebbd32f-bc38-4538-a8ca-08da2dd7ed60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7319
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 May 2022 14:11:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7242

--_000_AM6PR08MB389368C0523C2FF560F9559FE0C39AM6PR08MB3893eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please also backport this patch to the honister branch if possible, thanks!

Richard
________________________________
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> on behalf of Richard Neill via lists.yoctoproject.org <r=
ichard.neill=3Darm.com@lists.yoctoproject.org>
Sent: Wednesday, May 4, 2022 3:09 PM
To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Cc: nd <nd@arm.com>
Subject: [meta-virtualization] [PATCH] docker: Add runtime provide for virt=
ual-docker

This patch enables successful runtime-dependency on the Docker preferred
provider, as virtual/docker does not resolve. Doing so aligns with other vi=
rtual
package providers (e.g. virtual-runc), and follows the Yocto Project
documentation
(https://docs.yoctoproject.org/singleindex.html#virtual-runtime-provides).

Signed-off-by: Richard Neill <richard.neill@arm.com>
---
 recipes-containers/docker/docker.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/dock=
er/docker.inc
index 40a3642..e196f9b 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -32,6 +32,7 @@ RDEPENDS:${PN} +=3D "virtual-containerd virtual-runc"
 RRECOMMENDS:${PN} =3D "kernel-module-dm-thin-pool kernel-module-nf-nat ker=
nel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-module-xt-=
masquerade"

 PROVIDES +=3D "virtual/docker"
+RPROVIDES:${PN} +=3D "virtual-docker"

 # we want all the docker variant recpes to be installable via "docker"
 PACKAGE_NAME =3D "docker"
--
2.25.1


--_000_AM6PR08MB389368C0523C2FF560F9559FE0C39AM6PR08MB3893eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Please also backport this patch to the honister branch if possible, thanks!
<div style=3D"color:black !important;font-size:12pt"><br>
</div>
<span style=3D"color:black !important;font-size:12pt">Richard</span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-virtualization@l=
ists.yoctoproject.org &lt;meta-virtualization@lists.yoctoproject.org&gt; on=
 behalf of Richard Neill via lists.yoctoproject.org
 &lt;richard.neill=3Darm.com@lists.yoctoproject.org&gt;<br>
<b>Sent:</b> Wednesday, May 4, 2022 3:09 PM<br>
<b>To:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Cc:</b> nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> [meta-virtualization] [PATCH] docker: Add runtime provide f=
or virtual-docker</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This patch enables successful runtime-dependency o=
n the Docker preferred<br>
provider, as virtual/docker does not resolve. Doing so aligns with other vi=
rtual<br>
package providers (e.g. virtual-runc), and follows the Yocto Project<br>
documentation<br>
(<a href=3D"https://docs.yoctoproject.org/singleindex.html#virtual-runtime-=
provides">https://docs.yoctoproject.org/singleindex.html#virtual-runtime-pr=
ovides</a>).<br>
<br>
Signed-off-by: Richard Neill &lt;richard.neill@arm.com&gt;<br>
---<br>
&nbsp;recipes-containers/docker/docker.inc | 1 +<br>
&nbsp;1 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/dock=
er/docker.inc<br>
index 40a3642..e196f9b 100644<br>
--- a/recipes-containers/docker/docker.inc<br>
+++ b/recipes-containers/docker/docker.inc<br>
@@ -32,6 +32,7 @@ RDEPENDS:${PN} +=3D &quot;virtual-containerd virtual-runc=
&quot;<br>
&nbsp;RRECOMMENDS:${PN} =3D &quot;kernel-module-dm-thin-pool kernel-module-=
nf-nat kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-=
module-xt-masquerade&quot;<br>
<br>
&nbsp;PROVIDES +=3D &quot;virtual/docker&quot;<br>
+RPROVIDES:${PN} +=3D &quot;virtual-docker&quot;<br>
<br>
&nbsp;# we want all the docker variant recpes to be installable via &quot;d=
ocker&quot;<br>
&nbsp;PACKAGE_NAME =3D &quot;docker&quot;<br>
--<br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR08MB389368C0523C2FF560F9559FE0C39AM6PR08MB3893eurp_--

