Return-Path: <richard.neill@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F25C636F7
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.82])
 by mx.groups.io with SMTP id smtpd.web10.9694.1649928569269858143
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 02:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=bvJ22/88;
 spf=pass (domain: arm.com, ip: 40.107.22.82, mailfrom: richard.neill@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtMtPRbgBFKxL6IXX1qSCQcQMRlwAWAlzi97MEX1zF4=;
 b=bvJ22/889IX6wfl3jioglaDyImUYyGG1ja97qBHSsCqcMkqF1NnjE3RJ0pIYhDPpTQDmZVrDcdx5J2iYfJ27LrhKllp2g1OlbciJHrmoENHvckv/ougufeUIlAJcS99zWeCt1oFttn35f/8ntYGGsUE7YFCpjGF9O4XPlMEXn2o=
Received: from AS9PR06CA0197.eurprd06.prod.outlook.com (2603:10a6:20b:45d::13)
 by AM6PR08MB4328.eurprd08.prod.outlook.com (2603:10a6:20b:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 09:29:25 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::2f) by AS9PR06CA0197.outlook.office365.com
 (2603:10a6:20b:45d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Thu, 14 Apr 2022 09:29:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Thu, 14 Apr 2022 09:29:24 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Thu, 14 Apr 2022 09:29:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 982b5b1586ebb85b
X-CR-MTA-TID: 64aa7808
Received: from 1100363d24f1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A9064F4B-400D-4B86-BCDC-593B4FD9582D.1;
	Thu, 14 Apr 2022 09:29:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 1100363d24f1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Apr 2022 09:29:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIMrh1kBONVq3wsVAr83CPzy8gTgYNQ0wZZ88cHnfLQyTZN1WpoUAhuhfWu6z2iqWG4DPURmYlH8/kXfZsQiP/C6c1G90u0s3yI+J/BcH0Q41XPH1Fdbqo/QpxlnaN6EM4Ul7qiq56rzyQncOQKrbJltCIx1px50dKdJSgs0No1abLZNW0k/3/dJaUHXyGf5+QRGWx1U5SfJQGnyU7v4hmkmcPWLDVp7qpdYnqHs4ldJSQzNLhRM9lNY3tz9BIzE2y/YEDuPzWqimzmnrp0M0vbklBItiUdJtieKJK/L086nwmawecKCkZ8ljLDYyV0AIxh7dBXg3T8b7/hG98Gw/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtMtPRbgBFKxL6IXX1qSCQcQMRlwAWAlzi97MEX1zF4=;
 b=TtT8p47tdiVGuCuNQ7UFfe94+3nYx104xK+d4FYgNLSuwOHcs1oISpcEaKQyi29FBo5mrmSDe+mT9ydz7IJEx2AWL/kwaNjQSHisy3CXz+9SRF2OT8sWfH7F1LN4rQ3eZPtqiRdbuXBPAOVwVhTWa1+dZ5Ivews+ADboAsRwaRUmOK4+q3k5MgS9JLzKTfumg5HnixwGWireVg98cXyiYNm+lWxKXMNhPFXiQF5wmfRvriUemV13k/7T0nouOy8blADtyUbztNN9HfGiPQYqM6M9zBjkaMAsVLEhDpyZ7F3uS6zxmxE3pxkaiPqSQ6fqwahzdS3YJSXTjZoN/lMaCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtMtPRbgBFKxL6IXX1qSCQcQMRlwAWAlzi97MEX1zF4=;
 b=bvJ22/889IX6wfl3jioglaDyImUYyGG1ja97qBHSsCqcMkqF1NnjE3RJ0pIYhDPpTQDmZVrDcdx5J2iYfJ27LrhKllp2g1OlbciJHrmoENHvckv/ougufeUIlAJcS99zWeCt1oFttn35f/8ntYGGsUE7YFCpjGF9O4XPlMEXn2o=
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com (2603:10a6:20b:8d::18)
 by DBBPR08MB5963.eurprd08.prod.outlook.com (2603:10a6:10:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 09:29:16 +0000
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::1993:670f:e5e4:15cb]) by AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::1993:670f:e5e4:15cb%4]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 09:29:16 +0000
From: Richard Neill <Richard.Neill@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH] k3s: Add missing IP Virtual Server
 (ip_vs) feature to the kernel config
Thread-Topic: [meta-virtualization] [PATCH] k3s: Add missing IP Virtual Server
 (ip_vs) feature to the kernel config
Thread-Index: AQHYT63bqWfNxZuPfUCyIf987O+z+azvJGUz
Date: Thu, 14 Apr 2022 09:29:15 +0000
Message-ID: 
 <AM6PR08MB3893A1C65361DDF5AADB8959E0EF9@AM6PR08MB3893.eurprd08.prod.outlook.com>
References: <20220413091647.3749-1-richard.neill@arm.com>
 <CADkTA4MapjFi4qsdnuKarso6Qvt9JqfmfZ04A9Qx5hyQ4e2PKA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MapjFi4qsdnuKarso6Qvt9JqfmfZ04A9Qx5hyQ4e2PKA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 911f7d81-69c1-8c43-d00b-219e85971a6b
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7bd2f2e0-74a8-4137-fb4e-08da1df943d1
x-ms-traffictypediagnostic: 
	DBBPR08MB5963:EE_|AM5EUR03FT009:EE_|AM6PR08MB4328:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4328F74AA07D20C416938CAAE0EF9@AM6PR08MB4328.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YIlaGk5JUrKXdu4MasnWDGOwExhcU9sdw4udc0dKi7LJxD00Ln5C7kpzYcgx4ZrEiYZPaEci/XsUsfuMa2sWaEz5QgTHxWM3bpIm22Pm/kSrumEhw7IpM8nzYZIuY2jHmxTRun5KH+HD/uAoSrVvZ5QLOyoa2oUbiebpTAmBQShsmir7OXHJ+MzlAYHySLE2NSipvURHApX8K6vMKfDgkeuRbQvJcS2ewhy/bfvg3twvYNdaOwgRkxeSdiFn4D96I0bvTKhUnxsLkD8sqKJ1657DriAWP/y5zVssBVxAK9ogYjnsJB5xqBBd4Iq8xdQAVtsf005hQRQZhucNq6Eb6g2oCmiDfGvp6P4r1eLQF6cAivXl3J4g0lL0QTYpMAAN0WOMMbBAkQk3rLFPXMwP0UlvZUGr7Dth6QLPAs1FgOlT5A+RJ5+rFLNvo8mn1ASzwMPdL3AdBFaWXmEiwZrMSBXhCm5vizsAi2mbEmC7XZHnLpvQfkDqhXIhAtpgHDhAqEkXEtkXfRK/dprv7NK0ic7yRZCEtL34YrFnt6jKYYdsWUY+H4ueDuf4AaFRUHQ1+TmqtomFDUiOFUw+voPJrfHPoZGe8YZjVx6Y1qzFbudg747uKSOTY7uK9U5HZhIa50tY9MuGNt1NTXoRppCwn7fCOeiIp5UAoB0jxSrfpyoGCXs57RgPfbUBEIttMSca25F6e0jdltrHWTMmSLpXr//L9yECcvc6KvaumYed3hrkUUVXANAfFJ00K8jRsdRVJvQYCZz1TsTKB/d3trNQqnoUNm9EaLOt6S3ANJothfk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3893.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(316002)(83380400001)(6916009)(2906002)(38070700005)(26005)(8676002)(4326008)(55016003)(66556008)(186003)(66476007)(64756008)(66446008)(33656002)(86362001)(66946007)(91956017)(76116006)(19627405001)(7696005)(6506007)(5660300002)(52536014)(122000001)(9686003)(53546011)(8936002)(38100700002)(54906003)(966005)(508600001)(166002);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3893A1C65361DDF5AADB8959E0EF9AM6PR08MB3893eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5963
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9555b4e9-e4e9-4041-ec0a-08da1df93e9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gKcPnaTiyRyCeFoNqrrjkrygBGfNJykott64PxvxJwNkxQ6awSNbx15XBJJA2SgKfkIet5fLK79OHedBQWYbbkEP7ulQz+oi5lT2T6pBQatD5zRQ/YridVJKVYCdBBxjMWNH7efsUd8Nl2OGo9UE4mbaSawPcu3lQ5Y8xBRrbQ37rY712ZLkcGEz0Ir0aHl/XfumFfZ/5OjGwDlH2dMEph5SjHFLmq5MV2qOtm/hPc13GeFGgSnL3nqSyRiRil/3113HR6hypND5iT+MicFzsf6HJBJsNY0qXTZHF6NEd942LSH1bpmKM9jyYjLihkdyVuF78fkVm2msUHSFCOSlFV7MMijK8Kp67txCWS61bMGlR3ztiNxy+1d+XtEwUylXNQv4rqmWao6y6Yu9rrCa+UPE61DVf+A5aQWQltwM4edi/pWhFzK0112QO6E+aDOYh9KIStSMOUVcrLoMzWxv+4JOshwWO9H4fE4cM1Cc03Nb5VS2QRMpV9H/GsqZ74LytIZxCfo2v4qp5hPdTgY+O8nIXtLavJ+tEfXYOUH2aVsIhlY6C6/HqE44swnEaeZHtHNxpitnupu68iDLph2DTSj6JLJn46IWsqhwQacjKXl21Wp/ch4Jpnc6U8LPDs0NsRHK+P5qtmg3bRcyXL3fQBmDpY2+p7K1dk4qO7aMZkzOHFk6O3YH9enqRsM3r+zG2+cfXYN7bfwqmjC/3tHEBVpexfCKtQo72fDfvnJLKQOxM9XTLRe0ke1GX7p9ZKmlx7yrjmMrfULPNdDMUHLWbQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82310400005)(2906002)(70586007)(6862004)(83380400001)(53546011)(47076005)(52536014)(7696005)(6506007)(9686003)(81166007)(5660300002)(166002)(33656002)(356005)(8936002)(55016003)(336012)(36860700001)(4326008)(70206006)(8676002)(508600001)(316002)(966005)(19627405001)(86362001)(186003)(54906003)(40460700003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 09:29:24.7461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7bd2f2e0-74a8-4137-fb4e-08da1df943d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4328
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7173

--_000_AM6PR08MB3893A1C65361DDF5AADB8959E0EF9AM6PR08MB3893eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

OK, no problem, I will send an updated patch

Richard
________________________________
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Sent: Thursday, April 14, 2022 4:14 AM
To: Richard Neill <Richard.Neill@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>; nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH] k3s: Add missing IP Virtual Serv=
er (ip_vs) feature to the kernel config

On Wed, Apr 13, 2022 at 5:16 AM Richard Neill <richard.neill@arm.com> wrote=
:
>
> K3s (and Kubernetes) supports load balancing via IPVS, and by default rep=
orts
> errors when IPVS kernel modules cannot be loaded.
>
> This patch adds the missing reported kernel modules to the k3s recipe, an=
d
> orders the kernel module list alphabetically:

I'd actually prefer that the list not be sorted, at the same time as
we are adding to it.

Can you re-submit with just the new kernel module recommendations added.

Bruce

>
>     * ip-vs
>     * ip-vs-rr
>     * ip-vs-wrr
>     * ip-vs-sh
>
> The modules are configured by including the ip_vs kernel feature.
>
> Signed-off-by: Richard Neill <richard.neill@arm.com>
> ---
>  recipes-containers/k3s/k3s_git.bb             | 22 +++++++++++--------
>  .../linux/linux-yocto/kubernetes.scc          |  1 +
>  2 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k=
3s_git.bb
> index e2a3ffc..0b56e3c 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -2690,20 +2690,24 @@ RDEPENDS:${PN}-server =3D "${PN}"
>  RDEPENDS:${PN}-agent =3D "${PN}"
>
>  RRECOMMENDS:${PN} =3D "\
> +                     kernel-module-ip-vs \
> +                     kernel-module-ip-vs-rr \
> +                     kernel-module-ip-vs-sh \
> +                     kernel-module-ip-vs-wrr \
> +                     kernel-module-nfnetlink-log \
> +                     kernel-module-vxlan \
>                       kernel-module-xt-addrtype \
> -                     kernel-module-xt-nat \
> -                     kernel-module-xt-multiport \
> -                     kernel-module-xt-conntrack \
>                       kernel-module-xt-comment \
> -                     kernel-module-xt-mark \
>                       kernel-module-xt-connmark \
> -                     kernel-module-vxlan \
> +                     kernel-module-xt-conntrack \
> +                     kernel-module-xt-limit \
> +                     kernel-module-xt-mark \
>                       kernel-module-xt-masquerade \
> -                     kernel-module-xt-statistic \
> -                     kernel-module-xt-physdev \
> +                     kernel-module-xt-multiport \
> +                     kernel-module-xt-nat \
>                       kernel-module-xt-nflog \
> -                     kernel-module-xt-limit \
> -                     kernel-module-nfnetlink-log \
> +                     kernel-module-xt-physdev \
> +                     kernel-module-xt-statistic \
>                       "
>
>  RCONFLICTS:${PN} =3D "kubectl"
> diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.scc b/recipes-ke=
rnel/linux/linux-yocto/kubernetes.scc
> index 1e93b70..a94ae84 100644
> --- a/recipes-kernel/linux/linux-yocto/kubernetes.scc
> +++ b/recipes-kernel/linux/linux-yocto/kubernetes.scc
> @@ -1,2 +1,3 @@
>  include docker.scc
> +include cgl/cfg/net/ip_vs.scc
>  kconf non-hardware kubernetes.cfg
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7165): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7165
> Mute This Topic: https://lists.yoctoproject.org/mt/90436886/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

--_000_AM6PR08MB3893A1C65361DDF5AADB8959E0EF9AM6PR08MB3893eurp_
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
Hi Bruce,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
OK, no problem, I will send an updated patch</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Richard<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Bruce Ashfield &lt;br=
uce.ashfield@gmail.com&gt;<br>
<b>Sent:</b> Thursday, April 14, 2022 4:14 AM<br>
<b>To:</b> Richard Neill &lt;Richard.Neill@arm.com&gt;<br>
<b>Cc:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;; nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH] k3s: Add missing IP Virtu=
al Server (ip_vs) feature to the kernel config</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Apr 13, 2022 at 5:16 AM Richard Neill &lt;=
richard.neill@arm.com&gt; wrote:<br>
&gt;<br>
&gt; K3s (and Kubernetes) supports load balancing via IPVS, and by default =
reports<br>
&gt; errors when IPVS kernel modules cannot be loaded.<br>
&gt;<br>
&gt; This patch adds the missing reported kernel modules to the k3s recipe,=
 and<br>
&gt; orders the kernel module list alphabetically:<br>
<br>
I'd actually prefer that the list not be sorted, at the same time as<br>
we are adding to it.<br>
<br>
Can you re-submit with just the new kernel module recommendations added.<br=
>
<br>
Bruce<br>
<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; * ip-vs<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; * ip-vs-rr<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; * ip-vs-wrr<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; * ip-vs-sh<br>
&gt;<br>
&gt; The modules are configured by including the ip_vs kernel feature.<br>
&gt;<br>
&gt; Signed-off-by: Richard Neill &lt;richard.neill@arm.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; recipes-containers/k3s/k3s_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 22 +++++++++++--------<br>
&gt;&nbsp; .../linux/linux-yocto/kubernetes.scc&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 14 insertions(+), 9 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3=
s/k3s_git.bb<br>
&gt; index e2a3ffc..0b56e3c 100644<br>
&gt; --- a/recipes-containers/k3s/k3s_git.bb<br>
&gt; +++ b/recipes-containers/k3s/k3s_git.bb<br>
&gt; @@ -2690,20 +2690,24 @@ RDEPENDS:${PN}-server =3D &quot;${PN}&quot;<br=
>
&gt;&nbsp; RDEPENDS:${PN}-agent =3D &quot;${PN}&quot;<br>
&gt;<br>
&gt;&nbsp; RRECOMMENDS:${PN} =3D &quot;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-ip-vs \<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-ip-vs-rr =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-ip-vs-sh =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-ip-vs-wrr=
 \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-nfnetlink=
-log \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-vxlan \<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module=
-xt-addrtype \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-nat \<=
br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-multip=
ort \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-conntr=
ack \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module=
-xt-comment \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-mark \=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module=
-xt-connmark \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-vxlan \<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-conntr=
ack \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-limit =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-mark \=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module=
-xt-masquerade \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-statis=
tic \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-physde=
v \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-multip=
ort \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-nat \<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module=
-xt-nflog \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-limit =
\<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-nfnetlink=
-log \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-physde=
v \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-statis=
tic \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&gt;<br>
&gt;&nbsp; RCONFLICTS:${PN} =3D &quot;kubectl&quot;<br>
&gt; diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.scc b/recipes=
-kernel/linux/linux-yocto/kubernetes.scc<br>
&gt; index 1e93b70..a94ae84 100644<br>
&gt; --- a/recipes-kernel/linux/linux-yocto/kubernetes.scc<br>
&gt; +++ b/recipes-kernel/linux/linux-yocto/kubernetes.scc<br>
&gt; @@ -1,2 +1,3 @@<br>
&gt;&nbsp; include docker.scc<br>
&gt; +include cgl/cfg/net/ip_vs.scc<br>
&gt;&nbsp; kconf non-hardware kubernetes.cfg<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7165): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7165">
https://lists.yoctoproject.org/g/meta-virtualization/message/7165</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90436886=
/1050810">https://lists.yoctoproject.org/mt/90436886/1050810</a><br>
&gt; Group Owner: meta-virtualization+owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub">
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

--_000_AM6PR08MB3893A1C65361DDF5AADB8959E0EF9AM6PR08MB3893eurp_--

