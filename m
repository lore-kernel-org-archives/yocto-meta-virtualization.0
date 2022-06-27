Return-Path: <kamil.dziezyk@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83802CCA473
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 10:00:37 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.53])
 by mx.groups.io with SMTP id smtpd.web12.39878.1656324034558139416
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 03:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail,
 err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: arm.com, ip: 40.107.14.53, mailfrom: kamil.dziezyk@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OTrcbNAaBiJvvCb4mZragZjr1VOzCEiGEQ+PIOy3gbGSjlVrzjIY21FzZewwq7WgTYYL2PVAYN81Enq0M9G1x2jlHAy5k4wxOlQn8IYDDT5XBTME5SqyYja1hEkCFsAWigSW16zZeEMh70NrzR7qK9uOV81bKdczWhse4auSkW+FOUwWixla1JFckGG1GTj5RJI7MsfGKx/E82c372hkR9Ae9YqzPmXTEcoWbMqCaRIP/BJLSINGIMCDm11A61RdebSnFZrz0JwI4tgFmrbDW4ybDRa7cgALi3ogTT+6xxxaNA8GXxlOiPBTva4M032bgCyHEEIfDMbH+at5C5Sejg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFZh5oV7JTkIV96iE9G9EDv5oCga3hhHrIN/rqXzZ1w=;
 b=Qy/hmPicG3RSpCAAPWIIMhcul3eueWsSL1o6DOAKMKzWtiOA21jZL8WW81UNwyK/lHSOE9d4UW2CIHVojXQ6tqfIoX5Nr9HWqLBz6O1djEAQPxwhlzOAMhv0bmt9kg3w4HT616ia8vpVCyobeKwwOAK3J84ECzf7mIpUURZeSqD67hxk8o62hECoYZr57pLh/B4M2LltI+yy28n4GNEylJZPczQmLqRiVL4I8i5tPhqsd+sThZOuULqHktXvSiKFRFS1xFrzl7yK5s/dZCi8qPEKkrWq5ra7XRZm3Lkpw/yHu3aKfczpPBG0iaqfbFj10BLjCq9iSqHScuEbY/T6cA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFZh5oV7JTkIV96iE9G9EDv5oCga3hhHrIN/rqXzZ1w=;
 b=YqHYIEMy0b62qxluE0qGmAKpGyFMl9KlccQ2fArB+jX9Up7zCMubhtKwCZkeZ3bUt2BYf6BF4JO9w4mX9Cn1GuKi8xXcdpm/QD6tjbbyNEP7dSUX43tzJWkYMCpyKS9rmzjzwMz/HhR1ySkKc0c1lf/m/8xJ8K6hkYUcQKaXg6U=
Received: from AS9PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::28) by GV1PR08MB8179.eurprd08.prod.outlook.com
 (2603:10a6:150:91::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 10:00:30 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::c2) by AS9PR01CA0015.outlook.office365.com
 (2603:10a6:20b:540::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Mon, 27 Jun 2022 10:00:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 10:00:30 +0000
Received: ("Tessian outbound 4ab5a053767b:v120");
 Mon, 27 Jun 2022 10:00:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 04f2246424a16a9c
X-CR-MTA-TID: 64aa7808
Received: from cc26bf8121dd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B946CDB1-EBBB-4F76-8DB7-B249D7F033A6.1;
	Mon, 27 Jun 2022 10:00:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 cc26bf8121dd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 27 Jun 2022 10:00:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cu2r6OWCCWnsZUn8n8es0AcmyTv92LLJlLobLfYSo00x2UXILQjbqeX9ljSslit7Vd2AATcHAvp/2tDtqcnBrh09Nk+2340qMcVQlJQl6k/6MOiEQhd/2CyHEAg5Z/vlzC6igsFuNYSt7wLmU1LiQmhnoUAKZktQrpBoAng4vU2yvOeZhIfoC0qmQqTLGBmv4U/xD/bWGiDnjY3EG2v6ChMkA3rAWssJ/xQqsIqrZEgz6fIPp6S/7aINpFi1Coyls+xLvqeSmju9HoqJIuwFdO04HMKxKPMni7lB2HooGOCm3XEKl4TRT/4MCx9AqXVSvY0ly0f4sWUQP/Fn2vb6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFZh5oV7JTkIV96iE9G9EDv5oCga3hhHrIN/rqXzZ1w=;
 b=Kf21P2Cevx8GciPsyI9g7Oj6WMgInJ1+Ubva1JyBsjuJnR1axB/cQpmbPO/NfIBVcQAaWnBxrvdp7kjnW5YwpvwiE6vohCWGiqPPJujHUfhTHbtn2U7PVczD0LUBCgY6ci6cv4QOPLosQDQufE02goL/56ZATDEB2MeyYpR9bKQvV7O4IyWYzgiHOhOk8j4Z16KjrdaO3bo+K8zN7pvbAb3K9pzRak2fAKKM9lIkPsQzwFboEuCOz0eF7p6/7MijhHwCgjpJhNby/lj9zQWuEDphDm+IqMUM5rtU0ndmghnGz1b075pyHNXuQx2HPTXAsUEwbSLtl+X8pxT144/p3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFZh5oV7JTkIV96iE9G9EDv5oCga3hhHrIN/rqXzZ1w=;
 b=YqHYIEMy0b62qxluE0qGmAKpGyFMl9KlccQ2fArB+jX9Up7zCMubhtKwCZkeZ3bUt2BYf6BF4JO9w4mX9Cn1GuKi8xXcdpm/QD6tjbbyNEP7dSUX43tzJWkYMCpyKS9rmzjzwMz/HhR1ySkKc0c1lf/m/8xJ8K6hkYUcQKaXg6U=
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by PAXPR08MB7204.eurprd08.prod.outlook.com (2603:10a6:102:208::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 10:00:18 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::c861:c2dc:5440:6ec2]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::c861:c2dc:5440:6ec2%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 10:00:17 +0000
From: =?iso-8859-2?Q?Kamil_Dzie=BFyk?= <Kamil.Dziezyk@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, nd <nd@arm.com>
Subject: K3s service not starting after go-lang version update in poky
Thread-Topic: K3s service not starting after go-lang version update in poky
Thread-Index: AQHYh8GgvVtGTeuAVEep9vbHBTsGsa1jB323
Date: Mon, 27 Jun 2022 10:00:17 +0000
Message-ID: 
 <DBBPR08MB46968C1581734B64AAB82D32FDB99@DBBPR08MB4696.eurprd08.prod.outlook.com>
References: 
 <DBBPR08MB469695119DAF4FC29F66BAC1FDB49@DBBPR08MB4696.eurprd08.prod.outlook.com>
In-Reply-To: 
 <DBBPR08MB469695119DAF4FC29F66BAC1FDB49@DBBPR08MB4696.eurprd08.prod.outlook.com>
Accept-Language: en-GB, pl-PL, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a56bdeae-65f8-4f0b-7c95-08da5823de5c
x-ms-traffictypediagnostic: 
	PAXPR08MB7204:EE_|AM5EUR03FT058:EE_|GV1PR08MB8179:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HNp5AKFVSBJL/M5Bxxo6duDxCCC5kNTncx3EjcQ/woPR+OZmrcIL9zluTcs937jHavACpPDHl0I3SkvsqDaRNnfXSrU81pkHauPOBa3sJzMNQo3PZuRFtRn5g0orcaA6aLMdr4F5lhHMUl2Hlm2iwqyjyXbgfwhZLPH2mHb8IJqTaAtCn7o/GVdEtz64Ni/55XKG/RcajxWu+BmWjxybTnPcza9VllMgfoZvphohJUnQH/pgwj2T/g+Q+e7nUA99K0LpDfy+Br/TtSRy21TQX1X3krfQ2FPbVR6ENT7gGFakvH1AduT5pzzIgCS+iH/bG9+q8vlAU3IH8m4sn5QHF1LXZ/0baywHpOIGzPwx4H7jvQg+bH669Zk7oi2IAJOFmOoBGAbL7K8DbB8rSjZRm7mAPclWnf7tvrh0M6JLgcbfCOyAchyCnhev9wwn75FgB17wXdcOQhhvtdjCe0xAD5plsM4MB7YrG0W8cwq9AOfV5qYSJ+ku9VW61Sz/5pRaWYrmIhjJzRRPBuLAWYFFZ3tJ1MtCmUkGQ0aTEhhbCM0Md/4WbB3lr+gAbMIgpZDbXj5N+D8HXpcoVvj0jyptU7eU3Jx+20i85H6RTNlc8gkWARJyBSQSLhcdGJ6c00bacvuvKAMIKrbO2O5PCZt2ZuTDaF+UNSvLSMSTg+bwWZntbtJzkWwE3lgckYTAKN3K+mvtGNmwxw78FMKqxunCyEWsXC0xNgANUqweCORTVqjk3sf1vkJv3CtX8FAKwPdvg+MoS/rmqH5yg4PxrVGcJZXI9BxsU2caL0mKhReMHUjyPoYC4LuXDa4tzs2lY9IjfLkGU7Sy5O6biEi3s2twAlvMzC6SSbIPrCCMlTkOkBKz0iZxjmJnoMGUgxfuUsE7VKDH/bwO1kMHMtmKEw6c7g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(15650500001)(19627405001)(2906002)(6506007)(186003)(6916009)(8936002)(478600001)(33656002)(7696005)(122000001)(41300700001)(38070700005)(86362001)(316002)(54906003)(38100700002)(5660300002)(66476007)(9686003)(8676002)(4326008)(91956017)(966005)(55016003)(26005)(66574015)(71200400001)(76116006)(66556008)(66446008)(64756008)(66946007)(52536014)(166002)(83380400001)(10126625003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_DBBPR08MB46968C1581734B64AAB82D32FDB99DBBPR08MB4696eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7204
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b65ece7f-dbd1-403f-070b-08da5823d68a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lfNuOTwccHe8sIlmmlrIuXCg0EF5IAreAO63UXsxMhQoimMVSsU/6HGpw8u/Ria1MOYBReknem1pHop8GCJj8u/TIBOHZVxfrIISRtHavERCpG0QWrpxgr+c5hpicdU8KL4Z6YH3nGilNiPG5q7R9SjXqnGDNajN/RHVUt/1/6e2VciWVfsuAkVI5WADzX2/Hu3UUKg0hJNrWQWwko0plQwG/XATspoVJoGiAP6ShOh2ARkWG11NxCwYEKcDXtyO+q2MnrxlprC/PbI9NyKqzQCbbfV/4xVUY8XbzMfZq0DEablkmmyVH5UwZ5wmEkPOsSa9lx/oAA/PqysC95+Ofxj6JFLNwmag2YiZhoy30nCGgMziYoti/gD5+yzt4gyo/pR2uNcbPsN1Fwmb3yc1ODYESuKCwWcBJtMZa696iRmANc3Yi+NjrUuo06JVkZaP5QfcR23A59AoYTq0Esy23TM3qh2cnrOmruVC2kQGOB5JzOkwB4Xl6CyfZdjCZPvh+TXHZxxAuVOhnnsuHgZQRyXrzbzxORLy9sw5zrClmcHy+9EERg9nri30ovNZ0LcKzxQr8IZkGRDv2O7oEaQI5hDLgrmHxtb6AS27endyTOgAm0EWqBdcKUqmbvW8Xmpzu4ovW3E6/IUgiHJKzI7lhg0zZIYAG5QzviKSCcog1ye1uomcilQOhCt04DjmeOXbpCah9ccf9oJWVIgYmQnoqa6nt89FhgdkxPU4iBQuKicLg8SETyaqKo1iI2MDoG954cf1pLR5YtZspBLTP/xUTOGtErulDtzOTCnUkNATTpHXVxv2nDuOKQAJ/xlCz5lyUdBQDVHL/zZtgSX3SMPT+8zbFCGamoxbJQLWWATUPSJNe8M0wU2aHKQ7EQT/BYr88GwcL2ARdpwir5QqePrkTw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(36840700001)(46966006)(40470700004)(316002)(33656002)(336012)(9686003)(70206006)(356005)(52536014)(4326008)(54906003)(15650500001)(6916009)(19627405001)(81166007)(8936002)(5660300002)(2906002)(166002)(70586007)(55016003)(40480700001)(47076005)(966005)(8676002)(6506007)(41300700001)(7696005)(82310400005)(40460700003)(36860700001)(478600001)(86362001)(186003)(66574015)(82740400003)(26005)(83380400001)(10126625003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 10:00:30.3580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a56bdeae-65f8-4f0b-7c95-08da5823de5c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8179
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jun 2022 10:00:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7395

--_000_DBBPR08MB46968C1581734B64AAB82D32FDB99DBBPR08MB4696eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hello Bruce,

There is a problem with the k3s service starting when the Yocto image is bu=
ilt with the meta-virtualization master branch.

This issue might be related to the go-lang version(1.18) used to build the =
k3s.
After this patch was merged: https://git.yoctoproject.org/poky/commit/?id=
=3D8dc1f28aa10c775e64b5275679b1f8142e8cd038
a warning pops up during the k3s build:
```
WARNING: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-r0 do=
_package_qa: QA Issue: k3s: ELF binary /usr/local/bin/k3s has relocations i=
n .text [textrel]
```
See k3s service start logs here: https://pastebin.com/uXvsjPFu
I have tried a more recent version of k3s 1.22.8 with a small change and th=
is version of the k3s starts successfully.
However, I did not manage to update all k3s build dependency sources from t=
he recipes-container/k3s/src_uri.inc.
I have built the k3s with this change: https://pastebin.com/3QGvcqta

Could you update the k3s recipe on the master branch, to build a more recen=
t version 1.23 or 1.24?

Thanks,

Kamil Dzie=BFyk


--_000_DBBPR08MB46968C1581734B64AAB82D32FDB99DBBPR08MB4696eurp_
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
<div dir=3D"ltr">
<div class=3D"x_elementToProof elementToProof" style=3D"font-family:Calibri=
,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Hello Bruce,<br>
<br>
There is a problem with the k3s service starting when the Yocto image is bu=
ilt with the meta-virtualization master branch.<br>
<br>
This issue might be related to the go-lang version(1.18) used to build the =
k3s.<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
After this patch was merged: <a href=3D"https://git.yoctoproject.org/poky/c=
ommit/?id=3D8dc1f28aa10c775e64b5275679b1f8142e8cd038" data-auth=3D"NotAppli=
cable" id=3D"LPlnk570847">
https://git.yoctoproject.org/poky/commit/?id=3D8dc1f28aa10c775e64b5275679b1=
f8142e8cd038</a>
<br>
</div>
<div class=3D"x_elementToProof elementToProof" style=3D"font-family:Calibri=
,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
a warning pops up during the k3s build:<br>
```<br>
WARNING: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-r0 do=
_package_qa: QA Issue: k3s: ELF binary /usr/local/bin/k3s has relocations i=
n .text [textrel]<br>
```<br>
</div>
<div class=3D"x_elementToProof elementToProof" style=3D"font-family:Calibri=
,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
See k3s service start logs here: <span style=3D"color:rgb(255,8,0)"><a href=
=3D"https://pastebin.com/uXvsjPFu" id=3D"LPlnk475149">https://pastebin.com/=
uXvsjPFu</a></span><br>
</div>
<div class=3D"x_elementToProof elementToProof" style=3D"font-family:Calibri=
,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
I have tried a more recent version of k3s 1.22.8 with a small change and th=
is version of the k3s starts successfully.
<br>
However, I did not manage to update all k3s build dependency sources from t=
he recipes-container/k3s/src_uri.inc.<br>
I have built the k3s with this change: <a href=3D"https://pastebin.com/3QGv=
cqta" id=3D"LPlnk421339">
https://pastebin.com/3QGvcqta</a><br>
<br>
Could you update the k3s recipe on the master branch, to build a more recen=
t version 1.23 or 1.24?
<br>
<br>
Thanks,<br>
<br>
Kamil Dzie=BFyk<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
</div>
</body>
</html>

--_000_DBBPR08MB46968C1581734B64AAB82D32FDB99DBBPR08MB4696eurp_--

