Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBC1C433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 14:47:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.71])
 by mx.groups.io with SMTP id smtpd.web09.11944.1651762020421319372
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 May 2022 07:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=96Jve0o9;
 spf=pass (domain: arm.com, ip: 40.107.21.71,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BFRTc8f3pO8Uj3/6lo0IFDEXn7lLB2+/lpoQl6+/BY7qNblmw837uuA3vqn4XYRjHCvrc0qwBX2X9uTCW69hUuusZ7wG0a2AnN35++orF/f1l573XPEiGYZb13yHCOv0jFnbqPAmwdDriHEVFsVx7jHOVUj+je4ebSMopr1aiQI0Z8S7QJv2NBzplDU4/vo4Kikm3pEcswMTqON2rL7FJxOsRDbpzf1ETseDD/usycHVWQg3A6VKRHkmJWilRSUduy3Vavflxmfq1VjaptZre7ryFYRlcBCRXdEeTXepEZPJOHGogF1/6elyzpHueSfNEn+uH27J1hCNcUEwBBH9PQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTA21L9u6KhfgtShHIp77xkXCTSSkEIlTPIQlQQTumE=;
 b=BhGVFvAsSTTbTnWk/CplqBKSgw+cXrWU60dJOM72cFzuiH/m3JMAT9vHGm2VFvE6og/eu8QddxhTRjR9izLnqVyfVlak0NIOevVaSMwSGXp4k7dCB5iGhr/EcGPeVHgqEjf40O+DKRaKj0JNu6TxZED8qAbkvcLlhMx5YWhNka9qzPDbXyYtouKrWhp+9gxVTod/BgRpUqTj2O58vlelt+nUjqG9fIHDMwFNhMmU4HBbB+EvAdtdMsfFbxSwwsLDzGyh3I8RAmRkpeIfROMZyowvmFJ/2SzJeRPikmhB8Zh8jRc5t7AOfOv7OIHoZZlTsmBsYrbGVk2hpmmz/p9BdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTA21L9u6KhfgtShHIp77xkXCTSSkEIlTPIQlQQTumE=;
 b=96Jve0o9B1YZfNZB520j9rnh1dUe6pukjq1VBDf2NPLrhtmDNQQFZHlJRNslOTN3plhSYl1/Mh5OPJ3Z+gt6Mvl+A2BIBWwckwEt+hpMpnZHzTUILs2sla1Mxz3BDAGmsEZR663lw2Oaw9eqCdJsPpBIJFkwnzpRLGTu1xqKPR4=
Received: from DB8PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:10:110::26)
 by AM7PR08MB5448.eurprd08.prod.outlook.com (2603:10a6:20b:106::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 14:46:56 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::c2) by DB8PR04CA0016.outlook.office365.com
 (2603:10a6:10:110::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27 via Frontend
 Transport; Thu, 5 May 2022 14:46:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 14:46:56 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Thu, 05 May 2022 14:46:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: de001a1c935ab47a
X-CR-MTA-TID: 64aa7808
Received: from d86478b0da7c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 277392FE-1AA1-4963-B796-4AFDA13A0D06.1;
	Thu, 05 May 2022 14:46:45 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 d86478b0da7c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 05 May 2022 14:46:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABSF/Y+mAFih71dWG+L+Cej/rta3BVt9Ab7VzcHJC00NtVV4Nn3IXyQxPZ1utdvpissiCNFgoUzz5rDCOuxJPLY/YbnuVvU+iqsSL1vOpyvEYoB6Ul/h8cNaKhOWfxl7fDjQKkf9PLutCKDxYZW3yMvnkPFTfcJfrZ3xK/HVTUmH1m+1t5YmI0AkORH4tFNjqtekcq1QWf+YrusPGUvZ6LutrEnn97fOsjiOD8+cAs3toetZlM4V6iRK7WWWVEIJavPeQF6IfsvNATGTQJFl7QYFvvNsBNzpVxexT1kjrZJkk+eUgG0fcMcnziLVfYFlrQSwu4tO3KCOXbFaZDe5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTA21L9u6KhfgtShHIp77xkXCTSSkEIlTPIQlQQTumE=;
 b=dkPxKPBbg79jQM/HTshcn1gT7jqzBlhsHwPiVOs+zfp+ClkQptNPt3bweJ7q4LwU7IK7N3KW7ppWo2fXwfDQaqxJIZghbLNfjXG4cpNsK/M0caKVprk3p5fzgJkLTCT9DyAj/mHIyCOiJEHdbv4LyczPLZW0r4xWVw56LKFBf2eIQfIocgiE/AOLSN61XXCK06WX1zvUaNvIBT8IfO6ujnBNBrG8ZwYlCFt/dsADHrDq6xURHihIMJPSkK5YS9pGYMyDZfYHnk+wkGSCncFRoRKpRHaLkXqAdO2F5emwWpSWSE2XXkTKePQDP1egE+sa7x3nhI5bXWJd3KtT5ofrhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTA21L9u6KhfgtShHIp77xkXCTSSkEIlTPIQlQQTumE=;
 b=96Jve0o9B1YZfNZB520j9rnh1dUe6pukjq1VBDf2NPLrhtmDNQQFZHlJRNslOTN3plhSYl1/Mh5OPJ3Z+gt6Mvl+A2BIBWwckwEt+hpMpnZHzTUILs2sla1Mxz3BDAGmsEZR663lw2Oaw9eqCdJsPpBIJFkwnzpRLGTu1xqKPR4=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM7PR08MB5317.eurprd08.prod.outlook.com (2603:10a6:20b:101::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 14:46:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 14:46:42 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@cardoe.com"
	<cardoe@cardoe.com>, "dpsmith@apertussolutions.com"
	<dpsmith@apertussolutions.com>, "scott.davis@starlab.io"
	<scott.davis@starlab.io>, Diego Sueiro <Diego.Sueiro@arm.com>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>
Subject: Re: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
Thread-Topic: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
Thread-Index: AQHYWpPid/oZQrV6gE+p6K0H2pRecq0G43AAgAAB4gCAAALWgIAJf9QAgAAAugA=
Date: Thu, 5 May 2022 14:46:42 +0000
Message-ID: <FE2C3AD0-B3A8-42BD-A618-7DA1470B53B6@arm.com>
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <20220428000609.26814-2-christopher.w.clark@gmail.com>
 <C3A15DC1-B8FA-41D5-9408-295188560535@arm.com>
 <CADkTA4MhC2yN4-At7MUy8JHPme5O8kzT-Cj4u6wPnfHuZ=n7nA@mail.gmail.com>
 <C28D13C0-958B-4AF1-950A-F25E15288072@arm.com>
 <CADkTA4MMzCMUM1-o-G5W=P7AXf5b4umHf=w3NEJEthLuHPMneA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MMzCMUM1-o-G5W=P7AXf5b4umHf=w3NEJEthLuHPMneA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 74968aba-c4bd-4899-8517-08da2ea619f0
x-ms-traffictypediagnostic: 
	AM7PR08MB5317:EE_|DB5EUR03FT013:EE_|AM7PR08MB5448:EE_
X-Microsoft-Antispam-PRVS: 
	<AM7PR08MB5448BBE3CDA8DC6D9DBE60439DC29@AM7PR08MB5448.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ABNhz1qp2CjALRrSNYj1F8TcDqkcmAoRLhA2CTrm/gLiarPDagWgX6lkp3x68JPASxqOfss1mfTk4e31JveJR1YibCRX/h5v7E45qAhxdX+FRSd2PI+5UvSlIDgsCgMF3Pah7cYR2cpx4Alt5jXX8Twc6OuxiUvF4us1TI6lCEXg1W/mur6XyC2OeL6pZgSF1HLLxBSSibal5trYi/LoO3ZXJ1IY7INIWQDxt7ltRpRozRMYKx2d82avZy7olHYu3ApuBGQpfQjO3TPewRqlAaBwsWlpqgnzcb7Kh8gKIau57KjqKdhSTVmDNcKx0VviaFlZbC/MGRgUyj2ZO9Jr1FgGoalKUSyq4gnzJu7mX+L/IIQ0PMi+vWaeY4neq02B5LQrGBNHI9EuvvcEr8LC4VLW4lIyXysnD13py/l3yI1iC9FIobmdtVssLhjH8c0XRglm03kAqq/VXeIxXagphKhQKonffgqORLge0Fi2DsvO8P4FCST2wvHvygBVnu5NXjSt8AUzCp+tcIYE2zAjZn3P0M/f0W130aV9/a4PHm0pVA/PaBX2FFIjrzgj6B9oovQIpVrwmplTg83KIwVfBdXREsdNxhMyJo2FBMj/iCzx8/2qhD/z9Z2FMtMiRSKP/Hx9wk5wYDo3XCiMGcSIJBbgrXDQ8iLcir8OGgDcb/lL1LE3psDd6H+kRMRZNVkrNNllfC8DX/7qRtFtpCZ6rV0SugD+2bgMhHLr/ewZxUhrh/iFASfd5NLoSG9bRDI8absS9Kt1wDVZpP5LX7jnNxjUjR+0OioyWszdBe8RBQJYdQEun4NNSLdQghN1Z/Is84VwP+8Nas5oOfaPj8N5ma0IxwCScnW26jMyvBbBtdA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(76116006)(8676002)(4326008)(38100700002)(5660300002)(38070700005)(86362001)(8936002)(66446008)(66946007)(64756008)(2906002)(66476007)(54906003)(6916009)(316002)(66556008)(91956017)(6486002)(966005)(83380400001)(71200400001)(2616005)(186003)(36756003)(6512007)(508600001)(6506007)(53546011)(26005)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <688D40394E546246992FD85F3F22F28C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5317
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	57ac02c6-ac31-46b6-fc3e-08da2ea6120f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q9Q+TCoT6Aa7FH9YnqnKuGwS+UBAtP//m73I/17a9WoJtItMMtDfdJ5PCE99l9Rx4m5fO6sQ9K82QpHC4q8IMhxtq9vez7m43NHjj1tboNg+h6D4d4crQwMD4t7s4pXke32Rap8nF3u4oeN1cwqKVwBMUAkBq5/5q+sjp9i9cZ5AUUqx6fljcVMJF+Pm00pspH4UhK5VLK0f+FHey3sLnwHScWJ407oFIo3gsLhUojKCecoXN6zZLviMcDBZTotR7jjkq42SUCzRu1vvIm2C/yeTSj3IaVl8Wtug+auwnVusUSHbZAdzvx06QjY/C0o5GGmq6Y1Z3w6bhbO/YRdOLwS9hn+T/sA8FDVqY7TCdBcdF27EVQQgoM+/RV2+knUvY4UC5TR/E4/PHNsSoH3tvE680MVtsPIjKqGbGUlbX3mBAP3Ro2Izg3zofqF4Wnb8rY2Zx0Ey2AvpAXeolEDIn9iVB/FP6oW2g7r2/8T7qkkqP4ZAg26Sar4yLKsofDGL1oJEpZN0+ekBCmYgkFDltCc+6rnguDHiXTptJWvQFq7PaJdBpAJfl0oJn2lRSQoSi4s7lgvZ7kEgFeR9tYXQMfDCc2yBrFPchCINjdXQEvPKKNUVRT0ASs9RygoKlLqACuW3ny28inWsM+FNnuZwDUUPc7uPaMUoy0QEaw9DMgCjnO+5oGqF+VT8mmOJZko0Z2tHUHDDhz+zR5ErSh95WeWJeNYQleAb+KdXbwRKkANR93bYa2ihfr/KKeEvDUmnCTEP/Hw31IMkJ960yfIeA7RUZbwim3mg1OPqzW7o6m0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6486002)(86362001)(82310400005)(508600001)(107886003)(81166007)(966005)(5660300002)(26005)(8936002)(83380400001)(6512007)(54906003)(40460700003)(2616005)(316002)(36756003)(336012)(6506007)(47076005)(4326008)(186003)(6862004)(8676002)(53546011)(70206006)(356005)(70586007)(33656002)(36860700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 14:46:56.0888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 74968aba-c4bd-4899-8517-08da2ea619f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5448
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 May 2022 14:47:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7248

Hi Bruce,

> On 5 May 2022, at 15:44, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, Apr 29, 2022 at 9:40 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Bruce,
>>
>>> On 29 Apr 2022, at 14:30, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>>>
>>> On Fri, Apr 29, 2022 at 9:23 AM Bertrand Marquis
>>> <Bertrand.Marquis@arm.com> wrote:
>>>>
>>>> Hi Christopher,
>>>>
>>>>> On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctoproject.or=
g <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>>
>>>>> The Spectre and Meltdown mitigations for Xen run PV guests within
>>>>> HVM virtual machines, so Qemu is no longer only needed for systems
>>>>> configured to run HVM guests.
>>>>>
>>>>> With the split xen hypervisor and tools recipes, the bios dependencie=
s
>>>>> belong in the tools recipe, so move them and replace the hvm
>>>>> PACKAGECONFIG option with the recommendation based on target arch.
>>>>>
>>>>> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>
>>>> I can build and run on x86 qemu and I get stuck during init in Dom0 (w=
hich is apparently already known).
>>>>
>>>
>>> It is likely the xencommond init.d still causing issues.
>>>
>>> I'm doing a revert of all those changes locally, and will start some te=
sts.
>>
>> Please let me know if you need some testing.
>> On my side, I have the issue on arm64, arm32 and x86 at the moment.
>
> I'm still able to build and boot here, so I haven't reproduced the
> issue .. so I'm still hesitating to revert all the xencommons changes,
> as I can't prove to myself they are the issue.
>
> I created a kirkstone branch today, and I'll be adding the latest Xen
> patches to it, but I need to get a handle on what everyone is seeing
> for failures.
>
> I assume you are still seeing problems with the boot on all the
> platforms you mentioned above ?

I was last time I tried but I will retry with the current status and confir=
m.

Cheers
Bertrand

>
> Bruce
>
>>
>> Chees
>> Bertrand
>>
>>>
>>> Bruce
>>>
>>>> Cheers
>>>> Bertrand
>>>>
>>>>
>>>>> ---
>>>>> Unchanged since v1
>>>>>
>>>>> recipes-extended/xen/xen-tools.inc | 9 ++-------
>>>>> recipes-extended/xen/xen.inc | 6 +++---
>>>>> 2 files changed, 5 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xe=
n/xen-tools.inc
>>>>> index 6bbc8cd..54bc477 100644
>>>>> --- a/recipes-extended/xen/xen-tools.inc
>>>>> +++ b/recipes-extended/xen/xen-tools.inc
>>>>> @@ -30,14 +30,9 @@ RDEPENDS:${PN} =3D "\
>>>>>
>>>>> RDEPENDS:${PN}-dev =3D ""
>>>>>
>>>>> -# Qemu is necessary on ARM platforms, and to support HVM guests on x=
86
>>>>> -QEMU =3D "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu', '', d=
)}"
>>>>> -QEMU:arm =3D "qemu"
>>>>> -QEMU:aarch64 =3D "qemu"
>>>>> -
>>>>> RRECOMMENDS:${PN} =3D " \
>>>>> - ${QEMU} \
>>>>> - ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
>>>>> + qemu \
>>>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'seabios ipxe vga=
bios', '', d)} \
>>>>> ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP=
_RRECOMMENDS}', d)} \
>>>>> ${PN}-flask \
>>>>> ${PN}-hvmloader \
>>>>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.=
inc
>>>>> index 8b86de5..4c38ccf 100644
>>>>> --- a/recipes-extended/xen/xen.inc
>>>>> +++ b/recipes-extended/xen/xen.inc
>>>>> @@ -9,13 +9,11 @@ require xen-arch.inc
>>>>> PACKAGECONFIG ??=3D " \
>>>>> sdl \
>>>>> ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}=
 \
>>>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
>>>>> "
>>>>>
>>>>> PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl,"
>>>>> PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolicy,checkp=
olicy-native,"
>>>>> PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,system=
d,"
>>>>> -PACKAGECONFIG[hvm] =3D "--with-system-seabios=3D"/usr/share/firmware=
/bios.bin",--disable-seabios,seabios ipxe vgabios,"
>>>>> PACKAGECONFIG[externalblktap] =3D ",,,"
>>>>>
>>>>> DEPENDS =3D " \
>>>>> @@ -132,7 +130,9 @@ EXTRA_OECONF +=3D " \
>>>>> --disable-rombios \
>>>>> --disable-ocamltools \
>>>>> --disable-qemu-traditional \
>>>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim'=
, '--disable-pvshim', d)} \
>>>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', \
>>>>> + '--enable-pvshim --with-system-seabios=3D"/usr/share/firmware/bios.=
bin"', \
>>>>> + '--disable-pvshim --disable-seabios', d)} \
>>>>> "
>>>>>
>>>>> EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmwar=
e/vgabios-0.7a.bin"
>>>>> --
>>>>> 2.25.1
>>>>>
>>>>>
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#7226): https://lists.yoctoproject.org/g/meta-virt=
ualization/message/7226
>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/90743682/3619089
>>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/uns=
ub [bertrand.marquis@arm.com]
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>
>>>>
>>>> IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.
>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

