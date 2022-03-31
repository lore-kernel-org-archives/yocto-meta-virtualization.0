Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F992C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 16:22:36 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.54])
 by mx.groups.io with SMTP id smtpd.web11.9303.1648743744365403769
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 09:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=NrD+JCw3;
 spf=temperror,
 err=parse error for token &{10 18 _spf-b.arm.com}: parse error for token &{10
 18 _spf-ssg-a.microsoft.com}: temporary DNS error (domain: arm.com,
 ip: 40.107.0.54, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt98/WDsBrqAaKB9BDnmcMELgdTUeLGjrbChh/Zv6JY=;
 b=NrD+JCw3O92yPnK9iXpqrdwJAWPviCPSh8QD0VdaCfBWzhQhsHnitLETfzQPfQMA/SEKK3FNr0DH36dcccQizwAesmIGrx8IbsjCxPvKHpgPzzxPzJ+WthuZUCHAtJMV5DqB4+z4+PLZWF8xpGO+Y3fLG+/w0HW5cJP6Ro7TAGM=
Received: from AM6PR04CA0057.eurprd04.prod.outlook.com (2603:10a6:20b:f0::34)
 by DBBPR08MB5548.eurprd08.prod.outlook.com (2603:10a6:10:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 16:22:12 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::8c) by AM6PR04CA0057.outlook.office365.com
 (2603:10a6:20b:f0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.22 via Frontend
 Transport; Thu, 31 Mar 2022 16:22:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Thu, 31 Mar 2022 16:22:12 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Thu, 31 Mar 2022 16:22:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3d4511102460bd20
X-CR-MTA-TID: 64aa7808
Received: from bb37a3b4e884.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E2B00FB-AA15-4648-A434-19681A117538.1;
	Thu, 31 Mar 2022 16:22:05 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bb37a3b4e884.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 31 Mar 2022 16:22:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gw0XplID0fYJREUltixnRuOfI5hZOLP4rmgPebucuFQ+TkHnGAfFkSkwRJc+/ihTKd78A8o96g294d++Xr5qjZYGPN71hUcc+8/aLXN5RwsDZjRmBMBNxKBvjzVx9J9J36K55Cr+xZJzFFozzJMqlON7NnhZKGzPR4a+GkPb9MzvDEGKSd7iXPiVAdCu0O4JIMLZkR3qYE4yTJSOIhQVCLUWnR0BiMy8EomOO63iBt11BFQjkpRJkArxH5TjnWTO2zDStYVXPaQ8afTmQGS66SKdow3/ueWSa6N3iEAA/T3YFkFYvSWNP3od0z9s3ZiYPW8U9v5fF7CBBd1JRNVHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vt98/WDsBrqAaKB9BDnmcMELgdTUeLGjrbChh/Zv6JY=;
 b=GDB1l+wTi+wg4vqnhZk7zy7i6AQVkdCTtTMHk+I2oNUXmNVnp+v57hfgMezffM0mHN3Uid2Zlt46TLCwU8muWtolavCBnTiWbSs1QyQkb0G1v49LK1ut6kZRiIuBoRL7fKGsqnFFoL7nmntBSkqqNR5Kt4WoHpRM1E0ftZg2dojYIc6r1Hur14KUTKf9V2I6X6+a307CJY2QsAH6Kv8DBVK7pqrmKnDP3slBIdEBB1Dkaqv+zyw5mIdaSO3Ye/LjSj45geMHZtbgRsbQMIngercRynvMJ8ipHBvS/XK/Fvo45kkGX1gcQya0E3I66mWZeDmb/EDfbfLVsQGXljOvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt98/WDsBrqAaKB9BDnmcMELgdTUeLGjrbChh/Zv6JY=;
 b=NrD+JCw3O92yPnK9iXpqrdwJAWPviCPSh8QD0VdaCfBWzhQhsHnitLETfzQPfQMA/SEKK3FNr0DH36dcccQizwAesmIGrx8IbsjCxPvKHpgPzzxPzJ+WthuZUCHAtJMV5DqB4+z4+PLZWF8xpGO+Y3fLG+/w0HW5cJP6Ro7TAGM=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by VI1PR08MB3904.eurprd08.prod.outlook.com (2603:10a6:803:c0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 16:22:02 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::54f4:50e6:8d68:da31]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::54f4:50e6:8d68:da31%2]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 16:22:01 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>, nd <nd@arm.com>
Subject: k3s build issues on master
Thread-Topic: k3s build issues on master
Thread-Index: AQHYRReTMIE7ERoJt0+ZOCec/6CR4A==
Date: Thu, 31 Mar 2022 16:22:01 +0000
Message-ID: 
 <AM6PR08MB34610BFDE294473E6CFBAA7C92E19@AM6PR08MB3461.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 882b377b-94ac-40f5-c316-08da13329ca3
x-ms-traffictypediagnostic: 
	VI1PR08MB3904:EE_|AM5EUR03FT030:EE_|DBBPR08MB5548:EE_
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB55481F942A08A7E39FBE00B692E19@DBBPR08MB5548.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3GU/eXNCIYUOLDVBRA0oUusA8u1sjs9TW8wrRZQ+B3x5N85wOfK/NfO2ZV0U20mqz7L865WMHMEbq3xcsxHmcxp9pIVNw9ymzKYU6xk+NJjzciNcuVP/m7m7Yx/7cK9gOBQ65foh/xk6NfR4szj8Zn4R8pAXjOnYaJrh9KRWXl73GUCHFTDOmCOq+ybhYs6wl50pnPUWsDZM1Oj9B+51fi0V7qzwuJ8UC80Et4DkMKFcDQlIRC/5FaiyHTLyd/wcI1Fak0vUutfAd/VB9zk/Q52k5Xg8ZKfyIFJoPeM4Vt0mLUx+edMXmbzcspMwAZTNHcPts46M5LDNAgYq1x7IuYj7NrpkL0ZQ3Yw4/oobEWuqgRKWVrST8Vj6kcWU4wArLGZo7RNHDGk50LZiFGGvqEmg0p/QWbZnGvVsX3KwJHa2XhOCpt7rQ/1XRRcdAGR87klTxtc/W6IZ6lmToY6lNvP8mGPHbWTGKwytggBq3sFU/qViZDOxGwI6B022qTDmy40a09X5+IbkfEaoD05k4s894dmGA0vN0xQhNgil6WpYijpf2U6AZyIjyghVsr/DqQQEnGXcRwls43Ddu1T97PPlqC7m9gnv9qZiVK2u13Zvi1ZqEtkwB14ATTzDunQEjapeQsPRmpah2BLuLlkyk3YC9t55+qOIYde2bF9zz0yfKRhMVbG/uCAy8kfa/QF0v8dEz44OHX2Op8nTBh3BptLVd3z/ljfCnX1kWDbz4tkQaeVInGNPoPGvWtyFVv0yshnCfT2x97gc1/5/j/FJ1rsYCBwFlXbL8C96iHWXqhLwnM/jJdoM/Qrh8PWG9VK2
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(83380400001)(66556008)(66446008)(19627405001)(4326008)(76116006)(66476007)(64756008)(5660300002)(66946007)(52536014)(8676002)(316002)(508600001)(71200400001)(6916009)(91956017)(54906003)(8936002)(186003)(26005)(33656002)(9686003)(86362001)(38070700005)(2906002)(7696005)(6506007)(84970400001)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB34610BFDE294473E6CFBAA7C92E19AM6PR08MB3461eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3904
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1121637e-ee6e-4523-4c85-08da13329633
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SoMcH4SCdw1Lml+2ZW01Hr4WtQKS8cPuD/xuEzy8kXwRW+mZnRvAjOMvu8a0LVyF6vuweS8gDbzUlUdqFuGvsC4jP4ECLL/2OgfQl0pU3jFAFz6+hKYy+DteZRTWy90Unc/Zu9zMfpVu9+LcGNlQ7xTLkBF92h+OuCQKFBNg4b2t56Nl0mNNlyNkE6VQDPPDcpUds76LnmcytiqhfDlotDzcByksa0HXPfIXwXA0ZCXuzw9t27FOcACf4uyw56eP7KbMQk9bdY6OvRS7soK8p+UHBk5byRA//9OdWI9JNJzHmdmcUdoICu2szEHR03moZdCPlOjsvsUMJca4z5tvALaBPh21yPqN3q40pUKChdV6C2hKO4xm0Q9ED5E0C0gKgmaEVdsbo9Ma4j+UROgsM3AZi3FXdXCiBq2/jUOKTSx86tObXExViZAb/VFi6qWh6yjc6e1dnc/dWS61Wg1xzhzlh7Q2dm4dOJ87AuB8y1DEGOfuXnMvgo60kKrp6U8d4I3wxl2FcpZLJIw3dbIwCAPcWMcnI/F7b0Hs8oNn8U7QWH3e7t11WAV7h+sKENq7oeM2yUDYNrmucNntcKGc3/jWKzdNt2duyLvvxiM/eP4p3QjLd15tLTlsrJiPxhnRQfMhNz9w4oSxGaSOpWOdNUoube1KyK17JcffM521BRQPc/lxI+D5lgsvi/V1mTLPoiHbtmv4T2J5v12j7X+DaSXzJNlGh7jBt8KbTBxUIRjni4rVkKwkKBc4gsmPZi6f5nhSO8HySWnSwGKEc3feZdMaoIpbs2TmZoP737GQeFY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7696005)(186003)(8936002)(70586007)(70206006)(83380400001)(36860700001)(54906003)(26005)(336012)(6506007)(9686003)(47076005)(508600001)(8676002)(4326008)(55016003)(356005)(33656002)(86362001)(81166007)(40460700003)(316002)(5660300002)(52536014)(6916009)(82310400004)(84970400001)(19627405001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 16:22:12.2843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 882b377b-94ac-40f5-c316-08da13329ca3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5548
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Mar 2022 16:22:36 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7120

--_000_AM6PR08MB34610BFDE294473E6CFBAA7C92E19AM6PR08MB3461eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

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
    github.com/google/cadvisor@v0.43.0: is explicitly required in go.mod, b=
ut not marked as explicit in vendor/modules.txt
[...]
    k8s.io/sample-controller: is marked as replaced by github.com/k3s-io/ku=
bernetes/staging/src/k8s.io/sample-controller@v1.22.6-k3s1 in vendor/module=
s.txt, but replaced by github.com/k3s-io/kubernetes/staging/src/k8s.io/samp=
le-controller@v1.23.3-k3s1 in go.mod

    To ignore the vendor directory, use -mod=3Dreadonly or -mod=3Dmod.
    To sync the vendor directory, run:
        go mod vendor
```

Unfortunately, I have zero knowledge in go and I have no idea how I could f=
ix this.



Diego Sueiro
Staff Software Developer =96 ARM =96 Automotive and Industrial Solutions (C=
E-OSS)

--_000_AM6PR08MB34610BFDE294473E6CFBAA7C92E19AM6PR08MB3461eurp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Whilst investigating a build problem on our CI related to sstate mirror of =
the k3s recipe, I found that the commit &quot;<span style=3D"color: rgb(51,=
 51, 51); font-family: sans-serif; font-size: 16.6667px; background-color: =
rgb(255, 255, 255); display: inline !important;">k3s:
 update to 1.23.1&quot;</span><span style=3D"color:rgb(51, 51, 51);font-fam=
ily:sans-serif;font-size:16.6667px;font-weight:700;background-color:rgb(255=
, 255, 255);display:inline !important">&nbsp;</span>(8cba065209dd668afe939f=
878da340a017ecdd7d) didn't change the PV and&nbsp;SRCREV_k3s
 variables correctly.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I changed those values to&nbsp;v1.23.1+k3s1 and&nbsp;08d538fb3a04a0fe904b34=
cf04f7e21191b82449 respectively and now I'm getting the following do_compil=
e error:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
```</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
go: inconsistent vendoring in /kas_build_dir/tmp/work/neoversen1-poky-linux=
/k3s/v1.23.3+k3s1-r0/k3s-v1.23.3+k3s1/src/import:<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; github.com/google/cadvisor@v0.43.0: is explicitly required in=
 go.mod, but not marked as explicit in vendor/modules.txt<br>
<span><span style=3D"background-color:rgb(255, 255, 255);display:inline !im=
portant">[...]</span></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><span style=3D"background-color:rgb(255, 255, 255);display:inline !im=
portant">&nbsp; &nbsp; k8s.io/sample-controller: is marked as replaced by g=
ithub.com/k3s-io/kubernetes/staging/src/k8s.io/sample-controller@v1.22.6-k3=
s1 in vendor/modules.txt, but replaced by github.com/k3s-io/kubernetes/stag=
ing/src/k8s.io/sample-controller@v1.23.3-k3s1
 in go.mod
<div><br>
</div>
<div>&nbsp; &nbsp; To ignore the vendor directory, use -mod=3Dreadonly or -=
mod=3Dmod.</div>
<div>&nbsp; &nbsp; To sync the vendor directory, run:</div>
<span>&nbsp; &nbsp; &nbsp; &nbsp; go mod vendor</span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
```</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Unfortunately, I have zero knowledge in go and I have no idea how I could f=
ix this.<br>
<br>
</div>
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
Staff Software Developer =96 ARM <span style=3D"background-color:rgb(255,25=
5,255); display:inline!important">
=96&nbsp;</span>Automotive and Industrial Solutions (CE-OSS)</span><br>
</p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AM6PR08MB34610BFDE294473E6CFBAA7C92E19AM6PR08MB3461eurp_--

