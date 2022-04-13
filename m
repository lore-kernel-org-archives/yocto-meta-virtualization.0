Return-Path: <richard.neill@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6059EC4708D
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.40])
 by mx.groups.io with SMTP id smtpd.web09.4163.1649841680782057865
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 02:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=RAIdd1oK;
 spf=pass (domain: arm.com, ip: 40.107.14.40, mailfrom: richard.neill@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUfS32T8G4mbasZrppSDbxZsRBRTQjaH6K9pnpHcAlU=;
 b=RAIdd1oKhjgBrPuCk8KGO1zTxgll2fg7juI4NFWzuVS9yh6DjtTQY6cOjVYFD5tNg96DN3lpD+oe9Z7Q5y/NAVB0eE8YMDEXUHqN3pSAmv2IrZFvqoWDacA5kCK9wjT2wK+2pskyvjTkBzpLdjA/H94hYZ4kRrGFYTMG4xwLvtw=
Received: from AS9PR06CA0407.eurprd06.prod.outlook.com (2603:10a6:20b:461::14)
 by DU0PR08MB7762.eurprd08.prod.outlook.com (2603:10a6:10:3ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Wed, 13 Apr
 2022 09:21:16 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::1b) by AS9PR06CA0407.outlook.office365.com
 (2603:10a6:20b:461::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Wed, 13 Apr 2022 09:21:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Wed, 13 Apr 2022 09:21:15 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Wed, 13 Apr 2022 09:21:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b427921df09fcb7c
X-CR-MTA-TID: 64aa7808
Received: from 1268ec32ed36.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 20CC966C-F583-4923-8884-4A299F43B6C4.1;
	Wed, 13 Apr 2022 09:21:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 1268ec32ed36.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 Apr 2022 09:21:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyUCwTeYpLV3RdIeeEzcQrIz/+Pmim0qt1sAHJWcEz/jKBBBeHzvzZfrdriP6dAcSL0wBzeQnBf89CmVFrJ86MfSevFOVbKk0zCYnD/bHtEWRzGx7SdbOMo5DeNTy70+JE6PnqPw1ZpU6mfWV5TTwmnkHWzqpy4qXD195Kado411qXPoNn9Ovvv/ghDq5TN1RiHZRf8bkPdMmaLFZCzmrupmFmfzPkoeqfJZ/Qn5sGrKFTzDIxRSl75eX7hKaWqj5SVuLkumhet0kOQgi7R9o+NYZCaNIwoarG3oKKezcgyYO9kUYCTzoWZjT4R4/3Gakc0CjuOOryjQRutKPFiMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUfS32T8G4mbasZrppSDbxZsRBRTQjaH6K9pnpHcAlU=;
 b=V5IjVhg2+IOoi4P9P6EtxXCSIxqdOklCfjvDSt/0aYODPIavzsb66UAQL9AKNjnck8D4KNUdQYsuG2K51kbNmuv1n+eeIZgjp3D/4DsOeIOntpNvyRSHPNW9M0IsoNAJAzMRlohMe+1ZZAzzL62FYP+ZlkjAqA8heKnYBoYvThnwuQOoQFNTAQZHDErEZ7PReMvgpgoSHmmZXOAHAanA6w3Hhd5KHAQzOY28IYr/BbGDL8hinaFdQvq9B27vWJty3zBFeUdyAtKaycY6K6JKx+ST4KgE7ooh7ZqkzOS3Ypr1JuC5ovVNBi4jLYazUi6SeuBzkUyWOBaadI3w9Ww0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUfS32T8G4mbasZrppSDbxZsRBRTQjaH6K9pnpHcAlU=;
 b=RAIdd1oKhjgBrPuCk8KGO1zTxgll2fg7juI4NFWzuVS9yh6DjtTQY6cOjVYFD5tNg96DN3lpD+oe9Z7Q5y/NAVB0eE8YMDEXUHqN3pSAmv2IrZFvqoWDacA5kCK9wjT2wK+2pskyvjTkBzpLdjA/H94hYZ4kRrGFYTMG4xwLvtw=
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com (2603:10a6:20b:8d::18)
 by PA4PR08MB6158.eurprd08.prod.outlook.com (2603:10a6:102:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 09:21:03 +0000
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::1993:670f:e5e4:15cb]) by AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::1993:670f:e5e4:15cb%4]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 09:21:03 +0000
From: Richard Neill <Richard.Neill@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH] k3s: Add missing IP Virtual Server
 (ip_vs) feature to the kernel config
Thread-Topic: [meta-virtualization] [PATCH] k3s: Add missing IP Virtual Server
 (ip_vs) feature to the kernel config
Thread-Index: AQHYTxcwL2xhufL/okyciD5MMwqTvKztkHPT
Date: Wed, 13 Apr 2022 09:21:03 +0000
Message-ID: 
 <AM6PR08MB3893FBF5E47F185E880995ACE0EC9@AM6PR08MB3893.eurprd08.prod.outlook.com>
References: <16E569FF005E4AC7.11417@lists.yoctoproject.org>
In-Reply-To: <16E569FF005E4AC7.11417@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 07fb2070-5120-f88c-d3ff-4aad30efaff4
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 78daedc6-e2d4-49a0-1abf-08da1d2ef637
x-ms-traffictypediagnostic: 
	PA4PR08MB6158:EE_|AM5EUR03FT008:EE_|DU0PR08MB7762:EE_
X-Microsoft-Antispam-PRVS: 
	<DU0PR08MB7762DAFC138DB27AC16C44BAE0EC9@DU0PR08MB7762.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 iHti6XNM1DZPLKVljAy8vRa6WipqIoWeDf2FYHomHj223IpaxOISOpx/pmafnYTmmorLEa9fOZ6uT6kvg1YFbv0zyO2ily/K0g0b3SPmFFJG4o5aFLWXpIcoHuLUxrOYKWW/Nqj9U1/VZOQidWeqiOw4PipRzCoFozgN1m8ffxMmcF2EdzIfLtXw5l/Yl2QHrYMdXe4Q882EReHjCKUYWHpi2HS8ouhhm+1LqYFYWXi8Riv+f+irjntUwSfQ+bZolNzEZNIAOklFZMwFNfpRqbpTZeXe+KxP8DXwokjVGlChGBMsNrmmRkbaVcjTcfnIKZLhbXlIa09MJObx3Xu9YlGVOOV3Zn2HrW1AcVVxovYN+rr0w5MeYXnrIOwVH3ywEHdrWoYt4jpi8HKM62m0pK4yca8HLH1re+VnL9uZMjSQ45qYK2k5IZ78d4Wzit+5GAW6ztJLgBWPK2wpJUzFpi4GBQpowuWS5LgULj1C43LWQa0nLjwpJMk9c6trtjYaBTljlQeN9h7uFIk8ubdWdjoFNxDkBeNv2TFF6nQXn+AzTM6ZCYHAHslhpa8hQaYg60rkjTovik0cZ/aW9yiIfXIIFOcVbb9XkN3uP5GDBQaiaZVm+/CSoHsBWyxlOZQ5CCFnm2YOhO4AzRZHQCVICK7aBpvmFa1USdO51eBrwKxvHWsbnFkRobyWVEVf2wdqzizGReflm28WDJcWEoWdmw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3893.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(55016003)(6916009)(76116006)(7696005)(508600001)(71200400001)(86362001)(38070700005)(38100700002)(9686003)(26005)(122000001)(6506007)(186003)(83380400001)(52536014)(8936002)(64756008)(4326008)(8676002)(66446008)(5660300002)(66476007)(33656002)(66556008)(2906002)(91956017)(19627405001)(66946007);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3893FBF5E47F185E880995ACE0EC9AM6PR08MB3893eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6158
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d8f02b52-c4cf-4556-ea56-08da1d2eee5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d6OdS4+RArL++Vbq8+ZID8IJavfa9Y3Vic6mnPRdOvmtwLV6DojIQ27YOgVhipmXglkF+ceNf0Q6+0w3DHf/1Xy01MwRruLc7o9NJZWZsDjoEdV9snUpcxVl3tApnNI5LhYy0jKjWjJJz8pQbHz25rTnOZ445P+k/V7s1bcyMFFn2Z1SosatocGkiUy35Mmbk4xcTUchkDMDJlTeXYZHNLxvy3IyBbosSSg/hTK+hqhoh9gIWw9RTLFlTynK2yHN4lnMivHs2O3Y6LiN8DY1S2Q4XU2nrHv4ONClQgVW7SIPxKJzbW8KZ9arPNArwPK1eZoW/5e1qeTB+aoF3UvV3Cq+I/Dzr2lPtXj9msAm5q52ZtZzFEBsbBQfeLx/qLF8bdo5VM6fT8ajwyW4ecqKI5zYWh2T2uv/bEuJiQghaaWFOq/yTu7tn45F/eW/vrtmABAbhvPlNsfuX2dU/MVTyyjjTD5koMEzEp4hj/Y2YENlG8dYuChretNtR0cCtOeaW8YWYcDtCdozQfwR7hnbOq+RsaHCUDJw2lI/oaixFoRPl6+BoPFG0RdPb1+qYTUtEZmiigHuf2HVI+d6xwA0idSO7JrtXZixGXMdgGxlROBDp7B+LD964BpALNr1dEB4oNtyV2gcerEygrSrRp4Uj+/wCiNRC2EwiY2QXyT2r8Mc8qxjE+O9Alnt6uZ+a1Un
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6506007)(8936002)(47076005)(6916009)(336012)(4326008)(19627405001)(9686003)(33656002)(7696005)(5660300002)(55016003)(40460700003)(2906002)(81166007)(36860700001)(83380400001)(186003)(70206006)(82310400005)(356005)(508600001)(52536014)(70586007)(26005)(86362001)(8676002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 09:21:15.3066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78daedc6-e2d4-49a0-1abf-08da1d2ef637
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7762
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7166

--_000_AM6PR08MB3893FBF5E47F185E880995ACE0EC9AM6PR08MB3893eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Could you please also backport this patch to the honister branch? Thanks!

Richard
________________________________
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> on behalf of Richard Neill via lists.yoctoproject.org <r=
ichard.neill=3Darm.com@lists.yoctoproject.org>
Sent: Wednesday, April 13, 2022 10:16 AM
To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Cc: nd <nd@arm.com>
Subject: [meta-virtualization] [PATCH] k3s: Add missing IP Virtual Server (=
ip_vs) feature to the kernel config

K3s (and Kubernetes) supports load balancing via IPVS, and by default repor=
ts
errors when IPVS kernel modules cannot be loaded.

This patch adds the missing reported kernel modules to the k3s recipe, and
orders the kernel module list alphabetically:

    * ip-vs
    * ip-vs-rr
    * ip-vs-wrr
    * ip-vs-sh

The modules are configured by including the ip_vs kernel feature.

Signed-off-by: Richard Neill <richard.neill@arm.com>
---
 recipes-containers/k3s/k3s_git.bb             | 22 +++++++++++--------
 .../linux/linux-yocto/kubernetes.scc          |  1 +
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s=
_git.bb
index e2a3ffc..0b56e3c 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -2690,20 +2690,24 @@ RDEPENDS:${PN}-server =3D "${PN}"
 RDEPENDS:${PN}-agent =3D "${PN}"

 RRECOMMENDS:${PN} =3D "\
+                     kernel-module-ip-vs \
+                     kernel-module-ip-vs-rr \
+                     kernel-module-ip-vs-sh \
+                     kernel-module-ip-vs-wrr \
+                     kernel-module-nfnetlink-log \
+                     kernel-module-vxlan \
                      kernel-module-xt-addrtype \
-                     kernel-module-xt-nat \
-                     kernel-module-xt-multiport \
-                     kernel-module-xt-conntrack \
                      kernel-module-xt-comment \
-                     kernel-module-xt-mark \
                      kernel-module-xt-connmark \
-                     kernel-module-vxlan \
+                     kernel-module-xt-conntrack \
+                     kernel-module-xt-limit \
+                     kernel-module-xt-mark \
                      kernel-module-xt-masquerade \
-                     kernel-module-xt-statistic \
-                     kernel-module-xt-physdev \
+                     kernel-module-xt-multiport \
+                     kernel-module-xt-nat \
                      kernel-module-xt-nflog \
-                     kernel-module-xt-limit \
-                     kernel-module-nfnetlink-log \
+                     kernel-module-xt-physdev \
+                     kernel-module-xt-statistic \
                      "

 RCONFLICTS:${PN} =3D "kubectl"
diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.scc b/recipes-kern=
el/linux/linux-yocto/kubernetes.scc
index 1e93b70..a94ae84 100644
--- a/recipes-kernel/linux/linux-yocto/kubernetes.scc
+++ b/recipes-kernel/linux/linux-yocto/kubernetes.scc
@@ -1,2 +1,3 @@
 include docker.scc
+include cgl/cfg/net/ip_vs.scc
 kconf non-hardware kubernetes.cfg
--
2.25.1


--_000_AM6PR08MB3893FBF5E47F185E880995ACE0EC9AM6PR08MB3893eurp_
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
Could you please also backport this patch to the honister branch? Thanks!</=
div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-virtualization@l=
ists.yoctoproject.org &lt;meta-virtualization@lists.yoctoproject.org&gt; on=
 behalf of Richard Neill via lists.yoctoproject.org
 &lt;richard.neill=3Darm.com@lists.yoctoproject.org&gt;<br>
<b>Sent:</b> Wednesday, April 13, 2022 10:16 AM<br>
<b>To:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Cc:</b> nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> [meta-virtualization] [PATCH] k3s: Add missing IP Virtual S=
erver (ip_vs) feature to the kernel config</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">K3s (and Kubernetes) supports load balancing via I=
PVS, and by default reports<br>
errors when IPVS kernel modules cannot be loaded.<br>
<br>
This patch adds the missing reported kernel modules to the k3s recipe, and<=
br>
orders the kernel module list alphabetically:<br>
<br>
&nbsp;&nbsp;&nbsp; * ip-vs<br>
&nbsp;&nbsp;&nbsp; * ip-vs-rr<br>
&nbsp;&nbsp;&nbsp; * ip-vs-wrr<br>
&nbsp;&nbsp;&nbsp; * ip-vs-sh<br>
<br>
The modules are configured by including the ip_vs kernel feature.<br>
<br>
Signed-off-by: Richard Neill &lt;richard.neill@arm.com&gt;<br>
---<br>
&nbsp;recipes-containers/k3s/k3s_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 22 +++++++++++--------<br>
&nbsp;.../linux/linux-yocto/kubernetes.scc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 14 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s=
_git.bb<br>
index e2a3ffc..0b56e3c 100644<br>
--- a/recipes-containers/k3s/k3s_git.bb<br>
+++ b/recipes-containers/k3s/k3s_git.bb<br>
@@ -2690,20 +2690,24 @@ RDEPENDS:${PN}-server =3D &quot;${PN}&quot;<br>
&nbsp;RDEPENDS:${PN}-agent =3D &quot;${PN}&quot;<br>
<br>
&nbsp;RRECOMMENDS:${PN} =3D &quot;\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-ip-vs \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-ip-vs-rr \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-ip-vs-sh \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-ip-vs-wrr \<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-nfnetlink-log =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-vxlan \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-addrty=
pe \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-nat \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-multiport \=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-conntrack \=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-commen=
t \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-mark \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-connma=
rk \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-vxlan \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-conntrack \=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-limit \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-mark \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-masque=
rade \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-statistic \=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-physdev \<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-multiport \=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-nat \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-nflog =
\<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-limit \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-nfnetlink-log =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-physdev \<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-statistic \=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
<br>
&nbsp;RCONFLICTS:${PN} =3D &quot;kubectl&quot;<br>
diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.scc b/recipes-kern=
el/linux/linux-yocto/kubernetes.scc<br>
index 1e93b70..a94ae84 100644<br>
--- a/recipes-kernel/linux/linux-yocto/kubernetes.scc<br>
+++ b/recipes-kernel/linux/linux-yocto/kubernetes.scc<br>
@@ -1,2 +1,3 @@<br>
&nbsp;include docker.scc<br>
+include cgl/cfg/net/ip_vs.scc<br>
&nbsp;kconf non-hardware kubernetes.cfg<br>
--<br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR08MB3893FBF5E47F185E880995ACE0EC9AM6PR08MB3893eurp_--

