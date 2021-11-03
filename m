Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.50])
 by mx.groups.io with SMTP id smtpd.web12.7125.1635944678160336629
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 06:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZBhN7nJo;
 spf=pass (domain: arm.com, ip: 40.107.7.50, mailfrom: richard.neill@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPJCG+pKIGjTwZX9r9Ut5avPFSVdHu06s3P0fKLusa0=;
 b=ZBhN7nJo0e3dO3QMHpIIvaG5VogWYu5RYaiBMB2IeeNdbyWDhUOFjVR9xNW61BOZejei3H3PXW8cNNlGhJVMleSv96pjL+lAZGe3fGx1GA4hRydSfdN6REKAfvbQ9q05XhRAm1QY42S8XYQJx4MIPzCjei8wzEoz7iihiXQ4g54=
Received: from AM5PR1001CA0034.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::47)
 by AM4PR08MB2914.eurprd08.prod.outlook.com (2603:10a6:205:b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 13:04:27 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::5d) by AM5PR1001CA0034.outlook.office365.com
 (2603:10a6:206:2::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 13:04:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 3 Nov 2021 13:04:26 +0000
Received: ("Tessian outbound 4ce13939bd4a:v108"); Wed, 03 Nov 2021 13:04:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6cb810190b26ddeb
X-CR-MTA-TID: 64aa7808
Received: from cb4d9f53fe6f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B606B944-5450-4DA8-9D65-F53ED0C7A3A1.1;
	Wed, 03 Nov 2021 13:04:19 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb4d9f53fe6f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 03 Nov 2021 13:04:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmY9lJfR9wEnQGfQAs7TurNEWypuDwTkwndGCMZjgsBpoVWtvrwMsdAx6iIpZMU3d8qtjVjuYrS24ml4xfuH8rWRJijWrnmtqNJxK8tJsrsGXhTgXDc3hWj4CGiBvqUpyKjcg1c84ZNKyQdzFqNTHsMeFpRfuoafUL8+33ERRJvKtlcFATzefq3QGRsHuwkTLuFhvR70rb4FDaqY93FYS97y8MBDpzpzo9jlAtKJ+HMASzOyuqaBRbH518A08SP3p/khCS+an2dC5Kj5GPi794vkY2TK+F62l2co9PgxrskJxgf/MHLLFA38zvs6U1h0275TCAy4a6ucMvKnYff4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPJCG+pKIGjTwZX9r9Ut5avPFSVdHu06s3P0fKLusa0=;
 b=AH12V78poTckLVDdOFO49Iqn9x/y1whvuumGb+/QKGRK62OvaMrda2Eai+hiq8HRZ/Wk3WCik2qCy5DNJFnAsJxo+QYLndMgCagwShLNeGElwktf+0lQbZhm63LviUP3GnYaySt7sVeDCfISRJKohbl0V66UOZMhMO1YOrN7eNpsODL8Lgj/nWyMju+ymSnb18Ul1hU9ruhM1PzkKQmeJcNJAWX1JP+iNO6MH0ixwBt9K5He89dAq67GWqtXALKMXFlZOXoRZ9fBe9W3kyAsG8Y6rofjxPKHqcgzP+az15Rnpd0EbJHCIKpQJxzO3x3r3IVh3qnwAJYKH+fpVlqeEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPJCG+pKIGjTwZX9r9Ut5avPFSVdHu06s3P0fKLusa0=;
 b=ZBhN7nJo0e3dO3QMHpIIvaG5VogWYu5RYaiBMB2IeeNdbyWDhUOFjVR9xNW61BOZejei3H3PXW8cNNlGhJVMleSv96pjL+lAZGe3fGx1GA4hRydSfdN6REKAfvbQ9q05XhRAm1QY42S8XYQJx4MIPzCjei8wzEoz7iihiXQ4g54=
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com (2603:10a6:20b:8d::18)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Wed, 3 Nov
 2021 13:04:17 +0000
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::c4aa:5583:3117:1967]) by AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::c4aa:5583:3117:1967%5]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 13:04:16 +0000
From: "Richard Neill" <richard.neill@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH] k3s: Add additional required kernel modules
Thread-Topic: [meta-virtualization] [PATCH] k3s: Add additional required
 kernel modules
Thread-Index: AQHX0LL1ya64wvrM+EinCoirskuULKvxxPMT
Date: Wed, 3 Nov 2021 13:04:15 +0000
Message-ID: 
 <AM6PR08MB3893969F8DFD435A138516FDE08C9@AM6PR08MB3893.eurprd08.prod.outlook.com>
References: <16B40ADAB1425D6F.25986@lists.yoctoproject.org>
In-Reply-To: <16B40ADAB1425D6F.25986@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: d1914071-ee1f-fc73-b6c5-1a093d8ff0b1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a47d1b3e-a941-45a6-9541-08d99eca7736
x-ms-traffictypediagnostic: AM6PR08MB4690:|AM4PR08MB2914:
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB2914595F41E189D51D4AE5CEE08C9@AM4PR08MB2914.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vA9tXAc+nJK6210aQroa/yD62o/YF0lDPMQypW7nkRpcLOZSfbavWFm+CwIk4CsisRJc1jnVwXlXIcvkOhh4F+SXoWcdHHtXo5LGa4BFxLksg/HFTaUNpUZYvg/V06mW69DyAt8HMsewuhcLiWoAZN5nsM/3MqomOUSI4CWvhXCQD6B8DuAkVXCPzbt3leH+3Bit+OV0S0gl5JXt+pcCETx1B0kRmktKJQTPEiWjEA0DqwJJOflD8fYP6dQr0gVVFeGiCyfiMknJaXUdf5p4ThDBdLXnVdGbcPwHt1WxgRPlBse5DA1aCQk2ZGb3n+lG7sMJadu1YSBhBsAKvnRcKVu7dNF1ZzGDzfq/YsJEN4ORqHa1X3d+dA9ncwlanzdk1qkqO2YnuhAhtuKn556lxA5UkWJuoyimfbVYWnyW3hObMZcXstQWKuKbbrebcWXgM4gYJz2GFYJlI7pNZoC4T9xbr7JScINS2I17Hmfj1xlTxq29mHS1eTKklug8tsK/NCV6R/TmgILucszVdELnjzKuPRuqPSbYbC7j3g3aY2+VM9udZZNjsfuEzdfzuvnPjIdHxP0pWt7+yus3IIeOhlZ0ko1eOaquQ8JnnU7Bd/pOOI3l2Dq4wya3B6cul+ai9cambMpi9SzONb2aujYQLyo0zgYDQBZO+YMYgmNDJ07zZzhy4cg0aAGqekJwixJg5QmtG/hojTzCx7bE5K0drw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3893.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(33656002)(8936002)(122000001)(19627405001)(316002)(6916009)(71200400001)(4326008)(9686003)(38100700002)(91956017)(186003)(7696005)(6506007)(8676002)(86362001)(64756008)(66476007)(66556008)(83380400001)(2906002)(52536014)(55016002)(66446008)(5660300002)(38070700005)(76116006)(508600001)(66946007);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Richard.Neill@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	443ce962-e55f-48f3-6272-08d99eca70ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gmy1af6VwOqqtDlShdeVibBny9dAocEjBYTdHu1xvDtSXjgpII8+8YUf2wpPyZCq4bLTEfCJQN43ZFP63ajMVJHlnHLc80Mjl+cKBYSXoR7rU+KK/X2ZqwtSKmxnFli2Wp/kw+y36HUmRJQfo2/XSECutx5egbNjKNhfDPad7NAvIYm6IFQfUStOKgqPwaxWrjdBlK8gzT7j4F+b3DC53/68AyCTAdNJPcA3hFi4dvoZzQMWCIKTqlHTzIuZ5QH6a/Dwz5v5PgtN2jtUcSOHqQAF5emVCR0sPcIP8jPVFx8CHD9LOLg39UyrfoZUehSXwvrhwY2BoKgw66j3Z8ugTvHBfQ2C/ioQCFBkV8+wWjk6CwEIT9h5NFxLn31sH/vhwyvqQGDw2xjvKR/MQaASPA46T4MxyLK0Pk+aJZsOTbYOnsIBs8tbd1e6gv7x4d0+o/dVDeMQtu/jM9H6WxQwRd2V2qETvVS7xYnHoVQqtYJiQGYgVTpt7dEvavD5DnfKanMpcxcDSEKx62stHOwqoVyZys9t7rOx3qWINwWxd96R2WfgfgMTmV1KiWtm6yX7pZEhw/aloE009UMXrhdObpaluJe/FkWp0EMSl2TnibCdG24BPOyBv3NIxpBPaLeFoEypx4wZj2yOFUuxcVl+KPxmwHjqrPIgnVhJ0+0nQG09t97N1uNmDrApOoYWHQ9n6eXeXeqBiHjArtQ56mAOfQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(4326008)(86362001)(2906002)(26005)(336012)(6916009)(9686003)(186003)(82310400003)(5660300002)(316002)(83380400001)(6506007)(55016002)(70586007)(36860700001)(70206006)(7696005)(33656002)(52536014)(8676002)(81166007)(19627405001)(47076005)(356005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:04:26.9560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a47d1b3e-a941-45a6-9541-08d99eca7736
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2914
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3893969F8DFD435A138516FDE08C9AM6PR08MB3893eurp_"

--_000_AM6PR08MB3893969F8DFD435A138516FDE08C9AM6PR08MB3893eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

If possible, could this patch also be added to the honister branch?

Thanks,
Richard
________________________________
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> on behalf of Richard Neill via lists.yoctoproject.org <r=
ichard.neill=3Darm.com@lists.yoctoproject.org>
Sent: Wednesday, November 3, 2021 1:01 PM
To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Cc: nd <nd@arm.com>
Subject: [meta-virtualization] [PATCH] k3s: Add additional required kernel =
modules

Adds the following kernel modules for k3s:

* xt-physdev
* xt-nflog
* xt-limit
* nfnetlink-log

Without them, the k3s network-policy-controller reports failures in the log
related to iptables-restore.

Signed-off-by: Richard Neill <richard.neill@arm.com>
---
 recipes-containers/k3s/k3s_git.bb               | 4 ++++
 recipes-kernel/linux/linux-yocto/kubernetes.cfg | 8 ++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s=
_git.bb
index e341ad7..4e1cf64 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -96,6 +96,10 @@ RRECOMMENDS:${PN} =3D "\
                      kernel-module-vxlan \
                      kernel-module-xt-masquerade \
                      kernel-module-xt-statistic \
+                     kernel-module-xt-physdev \
+                     kernel-module-xt-nflog \
+                     kernel-module-xt-limit \
+                     kernel-module-nfnetlink-log \
                      "

 RCONFLICTS:${PN} =3D "kubectl"
diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.cfg b/recipes-kern=
el/linux/linux-yocto/kubernetes.cfg
index 2d4e1f5..84fa8c5 100644
--- a/recipes-kernel/linux/linux-yocto/kubernetes.cfg
+++ b/recipes-kernel/linux/linux-yocto/kubernetes.cfg
@@ -13,9 +13,14 @@ CONFIG_IP_VS_NFCT=3Dy
 CONFIG_IP_VS_PROTO_TCP=3Dy
 CONFIG_IP_VS_PROTO_UDP=3Dy
 CONFIG_IP_VS_RR=3Dm
+CONFIG_NETFILTER_NETLINK_LOG=3Dm
+CONFIG_NETFILTER_XT_CONNMARK=3Dm
 CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
+CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm
 CONFIG_NETFILTER_XT_MATCH_MARK=3Dm
-CONFIG_NETFILTER_XT_CONNMARK=3Dm
+CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
+CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
+CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
 CONFIG_NAMESPACES=3Dy
 CONFIG_NET_NS=3Dy
 CONFIG_PID_NS=3Dy
@@ -32,4 +37,3 @@ CONFIG_MEMCG=3Dy
 CONFIG_INET=3Dy
 CONFIG_EXT4_FS=3Dy
 CONFIG_PROC_FS=3Dy
-CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
--
2.25.1


--_000_AM6PR08MB3893969F8DFD435A138516FDE08C9AM6PR08MB3893eurp_
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
Hi, <br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
If possible, could this patch also be added to the honister branch?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
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
<b>Sent:</b> Wednesday, November 3, 2021 1:01 PM<br>
<b>To:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Cc:</b> nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> [meta-virtualization] [PATCH] k3s: Add additional required =
kernel modules</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Adds the following kernel modules for k3s:<br>
<br>
* xt-physdev<br>
* xt-nflog<br>
* xt-limit<br>
* nfnetlink-log<br>
<br>
Without them, the k3s network-policy-controller reports failures in the log=
<br>
related to iptables-restore.<br>
<br>
Signed-off-by: Richard Neill &lt;richard.neill@arm.com&gt;<br>
---<br>
&nbsp;recipes-containers/k3s/k3s_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 ++++<br>
&nbsp;recipes-kernel/linux/linux-yocto/kubernetes.cfg | 8 ++++++--<br>
&nbsp;2 files changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s=
_git.bb<br>
index e341ad7..4e1cf64 100644<br>
--- a/recipes-containers/k3s/k3s_git.bb<br>
+++ b/recipes-containers/k3s/k3s_git.bb<br>
@@ -96,6 +96,10 @@ RRECOMMENDS:${PN} =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-vxlan \<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-masque=
rade \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-statis=
tic \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-physdev \<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-nflog \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-xt-limit \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel-module-nfnetlink-log =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
<br>
&nbsp;RCONFLICTS:${PN} =3D &quot;kubectl&quot;<br>
diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.cfg b/recipes-kern=
el/linux/linux-yocto/kubernetes.cfg<br>
index 2d4e1f5..84fa8c5 100644<br>
--- a/recipes-kernel/linux/linux-yocto/kubernetes.cfg<br>
+++ b/recipes-kernel/linux/linux-yocto/kubernetes.cfg<br>
@@ -13,9 +13,14 @@ CONFIG_IP_VS_NFCT=3Dy<br>
&nbsp;CONFIG_IP_VS_PROTO_TCP=3Dy<br>
&nbsp;CONFIG_IP_VS_PROTO_UDP=3Dy<br>
&nbsp;CONFIG_IP_VS_RR=3Dm<br>
+CONFIG_NETFILTER_NETLINK_LOG=3Dm<br>
+CONFIG_NETFILTER_XT_CONNMARK=3Dm<br>
&nbsp;CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm<br>
+CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm<br>
&nbsp;CONFIG_NETFILTER_XT_MATCH_MARK=3Dm<br>
-CONFIG_NETFILTER_XT_CONNMARK=3Dm<br>
+CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm<br>
+CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm<br>
+CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm<br>
&nbsp;CONFIG_NAMESPACES=3Dy<br>
&nbsp;CONFIG_NET_NS=3Dy<br>
&nbsp;CONFIG_PID_NS=3Dy<br>
@@ -32,4 +37,3 @@ CONFIG_MEMCG=3Dy<br>
&nbsp;CONFIG_INET=3Dy<br>
&nbsp;CONFIG_EXT4_FS=3Dy<br>
&nbsp;CONFIG_PROC_FS=3Dy<br>
-CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm<br>
--<br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR08MB3893969F8DFD435A138516FDE08C9AM6PR08MB3893eurp_--
