Return-Path: <Henry.Wang@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0454EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 04:04:57 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.70])
 by mx.groups.io with SMTP id smtpd.web10.14098.1688616294033042154
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 21:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BXDKgPcZ;
 spf=pass (domain: arm.com, ip: 40.107.8.70, mailfrom: henry.wang@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHpUsvrDo57rbLxNG8w5M8hlwnq8kP7eOZLJ7HmZR9A=;
 b=BXDKgPcZYm6xRRXZTGWIuN4b/e536qiJLdEyugkVj3qZF4gE4tQ3FqHirIlf2PRVrxc8UVIbmjPt+tqCVfvbhyJ1TqOhuXUIF6OkNniFn/uUNgqdDDDW3lYvuXTvijPOZr0HD6DQcGVdOfJyelHrAI/oWuYACrAQu5aTL0MuR1A=
Received: from DB6PR0301CA0078.eurprd03.prod.outlook.com (2603:10a6:6:30::25)
 by DB9PR08MB6730.eurprd08.prod.outlook.com (2603:10a6:10:2a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 04:04:50 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::db) by DB6PR0301CA0078.outlook.office365.com
 (2603:10a6:6:30::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 04:04:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 04:04:50 +0000
Received: ("Tessian outbound 546d04a74417:v142"); Thu, 06 Jul 2023 04:04:49 +0000
X-CR-MTA-TID: 64aa7808
Received: from a33c5d272b18.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 536B0EC5-79AE-4217-B059-17E72429EF11.1;
	Thu, 06 Jul 2023 04:04:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a33c5d272b18.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Jul 2023 04:04:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIq7Kj52xCWcxIIo3spymQ3FHPod7DJy871bVMS6QIx4GeYkNSPR7FM7hG8QkwN0LQ9oakQJT+I/sMs9PvJ5+ZmEg4AhjmE6JYtpbjLXC3/zpkCfVtW6lwVnV/8oqueHs7iMgRmRATFoPmfhoGqZW7I1/2pu0mAGziCDLPnnH6WARpexNNdnnO/5mp4n4LDLTRBfip9go3X/SjAULSMA0AVWNsqe3DmKmXsrkjiRJT3aLAF6hcNfN/4ARlGExCsyZCSg50vP43dm4e6EuUqNOLANyVm4qJ0RjODebkIms3AtE9B/aO+rXmG84dU/1jdpVUC5iOjWv94kwpwwSTbTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHpUsvrDo57rbLxNG8w5M8hlwnq8kP7eOZLJ7HmZR9A=;
 b=Fvv65jr09qV4X27X47vVvR/ODth60TxPXBrXk5msviqAPR2KosRxa6V6iVWbnVZidifY6ORyiWtXZYd3Ogymu3yZMkHZo8luNGuoLr7Nvzmsx5cjOOpHnK3dQYsFGF3G0NlVCDA966tV1buiLIyPACA+IUBCa37ULDemZoDPDvl2K8GLz/44Gwy0sddjQEcx3hhdgD4WO8S2Bz9JKkab0qLBneBmaLt4tCr8bM89gpVl1MieeS8CxYMxQWVj4emrikLVJwMQiXzOVp3fAXc3E/T3Xxlkrhds3zgHyy6iehU1EXkzbt15OCFcfaHeXQaj33MHKZl/X6Q7jNXBWFhz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHpUsvrDo57rbLxNG8w5M8hlwnq8kP7eOZLJ7HmZR9A=;
 b=BXDKgPcZYm6xRRXZTGWIuN4b/e536qiJLdEyugkVj3qZF4gE4tQ3FqHirIlf2PRVrxc8UVIbmjPt+tqCVfvbhyJ1TqOhuXUIF6OkNniFn/uUNgqdDDDW3lYvuXTvijPOZr0HD6DQcGVdOfJyelHrAI/oWuYACrAQu5aTL0MuR1A=
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6283.eurprd08.prod.outlook.com (2603:10a6:10:1f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 04:04:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 04:04:31 +0000
From: Henry Wang <Henry.Wang@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Diego Sueiro
	<Diego.Sueiro@arm.com>, Christopher Clark <christopher.w.clark@gmail.com>,
	Luca Fancellu <Luca.Fancellu@arm.com>
Subject: RE: [meta-virtualization] [mickledore][PATCH 0/2] Use linux-yocto 6.1
 for RPi4 in mickledore
Thread-Topic: [meta-virtualization] [mickledore][PATCH 0/2] Use linux-yocto
 6.1 for RPi4 in mickledore
Thread-Index: AQHZrmrrS2BF4m06Skyt8BECx4TFq6+sHoGAgAACGlA=
Date: Thu, 6 Jul 2023 04:04:31 +0000
Message-ID: 
 <AS8PR08MB7991CD05BCE5CE9F1CBF0F1E922CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230704112952.721002-1-Henry.Wang@arm.com>
 <ZKY7I4884rY7gO6u@gmail.com>
In-Reply-To: <ZKY7I4884rY7gO6u@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: FBDC39121D34424098710CEF5227D380.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB7991:EE_|DBBPR08MB6283:EE_|DBAEUR03FT045:EE_|DB9PR08MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: 6212f811-62de-45e2-96c1-08db7dd62501
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wlLzlnlMVn3RP9KXg84uLX1JzM+t2GPCfmpfGrynF8p+x+d90cuYwGYUkKBrtczHcmT4SYqD5fDfhfg9o8laME4LbDo/rQW9w3ldDWiRnHL2R9qf6QD5pJH1ns7e1UqsyuO99d8D39kT0tOn3AkJ3xGtGTY/StjPYp2WPO6yvW5ADPoyOGgDthC/wovxFJUoU7KRyNNBEyxTo7VjlttpjBEFOs5UEtM1ApnNcw1cWahRSd+7pyfTsII/vdrpyM88ueI2jaaR4wM5GzoAuANbSzvNMetLum2F/ucrGYDj9e2QtXDj6icVNEv/fFBh6sYix9JgwvyiT7DW18rDfeqxPTlgR32MnXXVpnPVfm8Tcz6dm33F5xbyrt/Hx55iU+FwBYqqUzNP2+SIJVYIXGRC0SC2j1yOUDT6s8277PJV6c6P69YDJPfA8y261ucF+84BHR2+tH95Epwh0pQdB6XIsmeRtP9RTXFUoYsIXunGWDPiLpGp3JoDBbJW6LLWVCaKGbd3tJbCCPdu2G6mFgoi+QsY1E5SO408IzrF195OgjrE4BXIDcNuNeBhGS87JkCADPbBDlWBQB1FRRsYhCMFi1h5o+UvEtD4kjsp/6GzzjN90bxR33RjXsVMuEf7KtT9
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199021)(66556008)(5660300002)(8676002)(2906002)(55016003)(76116006)(52536014)(8936002)(6506007)(26005)(186003)(66446008)(41300700001)(122000001)(71200400001)(64756008)(66476007)(4326008)(316002)(66946007)(33656002)(6916009)(7696005)(54906003)(478600001)(38070700005)(9686003)(38100700002)(86362001)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6283
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1a964483-1606-4685-3780-08db7dd61a14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aVvqmKUcVZeyt4daEMycowJrMYWFHM1RWy3gLOKDtBCmyQo2Wb0veeg+4xEtoPEDZIZMTKti6USYp7bmTJk3/KXzpPQ/knnfLNlDRFyIbVgx4E41uulHdad44fO4WDyRwinKYFB0HHF8t95M18nPAxTo86uv77lhRgQ2clXZtMq0ANN5y7TET/WcoUOvpSSYcQzeKTf6IBKzMUg5BUSQ11V6Y5YfIokCs3M8yAK3WU7FLMkIyoVS6iRgdL67SCvf4hJIp4PjqX4tBv5WP97RDZpH9uflqmISg5emR5wNgkuFdkn3sLK0U9QLVBQ4+PuODrI3Wj8P/tLWP6lY50kyycQLp9VZxRSnjkduFq+PRtwSxp4ri0XAnm8GAkexkKAo6VqXPIj9guyrEH5B08aNEyJjC5lQouVSka/fm9rRSYqIH8Tld71Ji9nPnIuWujWJaEu/ilrhe6sUuSrHtTLaAMQG+EoBlaeLAXt2LcizOtlYtOmFc+yD+Whfr7QJuzBJgyN5nCsCjgr1mMjJw+URTZAKzNJfQVmgMuFiZ2XAaZBc9bHfbDlPfqKg353cM8ghTXOetXOYP4+ap5hD4DskS94Umhps64+SrbNw+gmMrl9TMTHV5gTdkiaTkYlPSBVFggD+Ba+E/Hl+odUwnuPlC65hlRLBp0ErhgFV4OSzrLz9ByNBrOd3Nv1iouslyqa9kE3E3d4hHgIjgcjfw4A0jqgtKq+QpdM8LuJxH71AquQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(40470700004)(46966006)(36840700001)(40480700001)(55016003)(40460700003)(82740400003)(70206006)(54906003)(356005)(7696005)(478600001)(70586007)(6862004)(41300700001)(8676002)(8936002)(47076005)(4326008)(316002)(81166007)(336012)(186003)(83380400001)(36860700001)(9686003)(26005)(6506007)(33656002)(2906002)(5660300002)(86362001)(82310400005)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 04:04:50.0391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6212f811-62de-45e2-96c1-08db7dd62501
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6730
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Jul 2023 04:04:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8120

Hi Bruce,

> -----Original Message-----
> Subject: Re: [meta-virtualization] [mickledore][PATCH 0/2] Use linux-yoct=
o 6.1
> for RPi4 in mickledore
>=20
> In message: [mickledore][PATCH 0/2] Use linux-yocto 6.1 for RPi4 in
> mickledore
> on 04/07/2023 Henry Wang wrote:
>=20
> > This series is the original commits on master branch rebased on top
> > of mickledore. Sending to mickledore to make the RPi4 use linux-yocto 6=
.1.
>=20
> The changes look ok to me, but for mickledore, there's no reason
> to drop the 5.15 bbappend, we only removed it in master due to
> gcc-13 issues, it is still a valid kernel target in mickledore.

Yes you are correct, I missed that 5.15 is a valid kernel in mickledore :))

>=20
> So I've merged all but the bbappend drop.

Thanks!

Kind regards,
Henry

>=20
> Bruce
>=20
> >
> > I've verified latest Xen hypervisor with these patches can boot
> > linux-yocto 6.1 as Dom0 and all our internal Xen test cases passed.
> >
> > Christopher Clark (1):
> >   rpi, xen, linux-yocto: enable linux-yocto 6.1 for RPi4
> >
> > Martin Jansa (1):
> >   rpi: linux-yocto: drop 5.15 bbappend
> >
> >  .../{linux-yocto_5.15.bbappend =3D> linux-yocto_6.1.bbappend}   | 4 ++=
--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename dynamic-layers/raspberrypi/recipes-kernel/linux/{linux-
> yocto_5.15.bbappend =3D> linux-yocto_6.1.bbappend} (51%)
> >
> > --
> > 2.25.1
> >

