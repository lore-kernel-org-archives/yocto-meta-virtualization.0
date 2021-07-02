Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.72])
 by mx.groups.io with SMTP id smtpd.web08.8594.1625227392758576190
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Jul 2021 05:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eYAAmGP/;
 spf=pass (domain: arm.com, ip: 40.107.6.72, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj2qrd4fv5+VicYAMau7tn2lzl4pfgbBEUODdEdeF0k=;
 b=eYAAmGP/qJlQqp2lPuR1HV3bvitpF+M35YvgQZi40OX8g8mZYh+7kHLALffN8Rr3vxop8ufzWnzIpbYGixynQfoq/dfI3EdeqI6HERmugXmf83MrbiEA6bn4ULREDqZxJlwfj9bl9f340JGrDDpzdcyFmYRvgSDOxzAJW/pynNA=
Received: from AS8PR04CA0171.eurprd04.prod.outlook.com (2603:10a6:20b:331::26)
 by DB6PR0801MB1621.eurprd08.prod.outlook.com (2603:10a6:4:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Fri, 2 Jul
 2021 12:03:09 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::b2) by AS8PR04CA0171.outlook.office365.com
 (2603:10a6:20b:331::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Fri, 2 Jul 2021 12:03:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 12:03:09 +0000
Received: ("Tessian outbound 3362253f4878:v97"); Fri, 02 Jul 2021 12:03:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b804d17bc258631
X-CR-MTA-TID: 64aa7808
Received: from 7af0bcb50059.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9759BFC7-0E65-4267-B848-AB44CFA3A670.1;
	Fri, 02 Jul 2021 12:02:57 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7af0bcb50059.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Jul 2021 12:02:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLJQS0lpgYNQl+6WjiJPD3mxQxdmBwF4Ice3A9gtxf8KWAw+bBbf757vp3E0i5fpP+4Z+B6QZ8dq48fNQpIXbRt1URVF+P7fUz1/Xs1eaw392JlM1uc++i2/ipgVUtNSpkZGx/wxokr5a2QEtIVuQVMbmjW7qdAWYJOdO4LTT/zv6Kra51Om6aFt7MYspqqNqm0zY2P7FbFe+BSoJVEArylFx1W8fMgW0UjtDok93fF00zAmR79VsUuPIaz9BF+/8BVSmt6CoF9L0aOxhYBuwLce/FE/gQNgy8nesOUr7wXufGb5KX8QjmaMIh1TlaXnAULdlzSzNVEI//o4+KtsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj2qrd4fv5+VicYAMau7tn2lzl4pfgbBEUODdEdeF0k=;
 b=AGsIs+IlByYZhQP0N8CnWF3cXLkQH3F9J5c8Uywn/6oa/HRTuYLRS9yEwFn7F4hfSQlrfIvPPKXI8CqcoS3DMX/oyLGOL83TKD9EGd1bUhcMsZHnazFDMpDJltHpZF5dC9UQs+i9s/UxYLRy1qx1ArQmH658+tcZjf5aszpR+6k9YEE9hACX3X27sGKBBE6Sr/2IlM4b142XviGP6SWZj/qVRuwhBzYjDp+dddy6jEo2kp92tv9invcKm5hJ1LTYaEmz0vcl0JZrINp/RUuzN+/A6is6sZxAyeGIB7f5CSkD1ocPecsqzpfP98eUHMVxmVrpYgzGOTyNc9a9dIvluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj2qrd4fv5+VicYAMau7tn2lzl4pfgbBEUODdEdeF0k=;
 b=eYAAmGP/qJlQqp2lPuR1HV3bvitpF+M35YvgQZi40OX8g8mZYh+7kHLALffN8Rr3vxop8ufzWnzIpbYGixynQfoq/dfI3EdeqI6HERmugXmf83MrbiEA6bn4ULREDqZxJlwfj9bl9f340JGrDDpzdcyFmYRvgSDOxzAJW/pynNA=
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6752.eurprd08.prod.outlook.com (2603:10a6:102:131::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Fri, 2 Jul
 2021 12:02:55 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 12:02:55 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>, "cardoe@gentoo.org" <cardoe@gentoo.org>, Diego
 Sueiro <Diego.Sueiro@arm.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "dpsmith@apertussolutions.com"
	<dpsmith@apertussolutions.com>, "persaur@gmail.com" <persaur@gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/3] xen, xen-tools: fix build and passing of CFLAGS via Xen vars
Thread-Topic: [meta-virtualization][PATCH 2/3] xen, xen-tools: fix build and
 passing of CFLAGS via Xen vars
Thread-Index: AQHXbtnI401zqDI+P0iloPnnT9A0lqsvlq6A
Date: Fri, 2 Jul 2021 12:02:55 +0000
Message-ID: <73B8DAF1-1545-428D-9F79-2F4DB685BECA@arm.com>
References: <20210702003206.79756-1-christopher.w.clark@gmail.com>
 <20210702003206.79756-3-christopher.w.clark@gmail.com>
In-Reply-To: <20210702003206.79756-3-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [81.2.158.121]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: da52abf2-3ab8-488a-38f4-08d93d515bdd
x-ms-traffictypediagnostic: PAXPR08MB6752:|DB6PR0801MB1621:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB16216466F8F1EB59F65A42989D1F9@DB6PR0801MB1621.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2887;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VsX+YJeZ+b8iiICsQL/uE5fjdN897J6CxVvMEQOcBydNwUN0grpG/fpWgVVuonKWnTiplBEgv1bf3cZSA4IMLCXwzk2mL5O17jMGo7aZsJ2prhUQ0Vgax82SZrXNo9hKqXUY1OGZxZzDMR6ODoqG/uWksot7ymKyy5vv760jhNtuoOlTuE+qr9INuZ6gXYXnbx0mrovsuZ+e2fVFai2YYdwQGNYdcYkvfeBIJ75IacWtM/c8PedT5a5SKcLk/0VIGTCtV1bu/TpWOCkkRoqDAI1q/bk4BXHIXt344DRNfMkU8VttE6QhV4oStwauTG2a1AMZfbNIM2p2BkAtAPZ+CaRtlPQ5ehZyP5C61O02pisreoilCyF5kJM6AODFLnRiNI4iLWiqxOXYBglWu97RWAtoALbxhfcq5ENGPbIpt8ifGwhxKDkapn7SjDAz87zIUQ1sZC7gaTCF769tvYNtyVbe7pOrOvun0EPYj5W4DP8FSePBnPFTjoN2xQeNwRjBr+YX64OgTc4kBecPnSaBa+pX6DsiA57t2AclvfpqAF6sDwUdzLDXcCqEjrsd4jjopjng+By2sgc2MuIwnTc9mStMX0sx4Kfw9drEKVU9JTN37prpCDASLT+qgZGelM9uwjwGyc8Ik3FJO14atW1usyDQim1iPUPOE1eg/+YnHi7CR4VBPhkjlYZBWcqgtaqx4JTQaGSCyWf6RS/fVSOZ7w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(66946007)(66446008)(91956017)(76116006)(66476007)(71200400001)(66556008)(64756008)(33656002)(2616005)(36756003)(54906003)(83380400001)(2906002)(5660300002)(6512007)(6506007)(38100700002)(6486002)(86362001)(26005)(316002)(8676002)(186003)(8936002)(53546011)(122000001)(4326008)(6916009)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MW0CJcWwX1ib2Gl9ablfRvcORQxcBiHWf/AUF3wP0pMIKbCs227CVBI7zrXG?=
 =?us-ascii?Q?EVPEx5eV3kYqkjEiQIzgnXWMwSZga3i/5bD3R+om0qNAOnCSaG7MVeL8M6kz?=
 =?us-ascii?Q?u5INgYO834posx1NCS8mEAzpRXqqKkrOPctnwUyFh2CNbbsx71Hc4YqEFRpN?=
 =?us-ascii?Q?PWAhVbbVwFO+npKjPbfUo+t4MSf6dlLR1Seli+OHve7kBMtjCHZvMDbC7yYa?=
 =?us-ascii?Q?Zgprh2rQw6FX48wtXtgceGgjz7Rk2/uNQBUk/O65NqGq9EYJlmMC65DYcrSx?=
 =?us-ascii?Q?9RkVOzPjaTWCmFNLYtJ668CGF4b1hocL6ffA6hIwEZlenq0KpFrWQilomWhE?=
 =?us-ascii?Q?+lrF26AhP52lNb0RgDu2bqYZ/RtyrPlrtIwAuvuThNhVhnZc0It0sJq76FuQ?=
 =?us-ascii?Q?DDhHJIQZev6JvZx8OjQvARR18MVifWz1CDBPmPvjuyA8kNRjyIvy3L/BZ5S9?=
 =?us-ascii?Q?bQdX+a5vNN7KPDbkVC0vj8HkHPZux84vhq8nwNac/9x2GJFZIzb9nvQZM9+K?=
 =?us-ascii?Q?gIzyngGNHACUg62EbhE8jLekdlSCHk01etpAUNhNofTGME5nH+x3u3ysNj1k?=
 =?us-ascii?Q?Sd5mzZ3DISuf8/7wGfRhoHykdRGXHjuZ6+7kjPYX9vqbdtiewtuVdSTam9Rh?=
 =?us-ascii?Q?wHZvPWj6od+8faZLef25MVwtawSMagdvqu7cwPMq3Kxn7bNT4iuoMcY5P4d2?=
 =?us-ascii?Q?orJIMcECrDx6EKy0RIPP+HkfDtdzCXvV0g4AeXIF7CE30KzYBeuBeDcueg+E?=
 =?us-ascii?Q?BWWI4lqIYYFD7TIcN+2SM4fxmerOASTgl3YS4fSOOILuUvQywZRlfUfzPbPs?=
 =?us-ascii?Q?GSHYfGxqMzKnet7g6GDqXEPhI7yrK8SqZCZo9kfbQ2qzwTJsU8qkCIs03J7h?=
 =?us-ascii?Q?Kht2SiXbra7gvaha8/fcPMQMXuftl0hYWFeX53NFt8ajEQRhmsKBpDFiGvQx?=
 =?us-ascii?Q?yUU0g4cx2gO86dHCuZKwnwze4DXfHZfqlcckyBi+jgJLtKSxxaU9QO939m+X?=
 =?us-ascii?Q?UgcpsvrelrEpGPb4L6qXML1nytO2t8+Y98uq5YgBCDROQ567KdgCPIBBVQoO?=
 =?us-ascii?Q?99A0MfEcdDcUYcxUoK2DVgJPIvqBKiRYt6VfHdowJmXM5FK2B+xbDx3B8j+N?=
 =?us-ascii?Q?9vd3LEFw/P/r+3JMwQ+SI8hUHI5E2x7oMYNiGROAAJlii6V2rGLckdAjOGH/?=
 =?us-ascii?Q?JIsGxuudkBLOFTdVFeMV9kJXJv/a1Vccaq2tX6HrEYKyFbLQMZTyLLrHrdCb?=
 =?us-ascii?Q?Yv2XOgNPk8MrfV/To2N4xwwdgBiSoPAh9JtyKZ+jQRpGLKiy0xw/aNA3Qj8E?=
 =?us-ascii?Q?tBkLY6ScpltAlYFDiJwSevzk?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6752
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e1fbfa91-debf-457a-c0d3-08d93d5153de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MEwtp8e9qDdfyWPyWWhXu5mds11iZtlgFLI/yT/bHjja0Ez4PqvGTOUmmYSnwke9TXqLC38Oiwxek4EDoHHLuCNCJv8hfGRFUGBKbTCmkqkrbQDODfcOxG9IEUN6avUYs0gNMDkCR/hrxPlaCrYRthttCpYIIyh00slEvzA1cR0fOS1I0jc73fiBgnjCaUQj3Kkvxszq7Gtc6J+JHjQnSYjzYM0C2bc6UGis1oZhcDNTkyofkc8JdA98ru0Gg9mlZBTFofpNNNP79ZoLZVBjIoOCqk/5TyS6hfoiH1ZPJNi8TDVfDCh4XX31qPRI6UrOs4jDKdsRlronOjpCa4s6ZtUGCLujC21hooVvR9DAV+xCAaeWT6/YPMt5WpNNsN0bEWq1PU0pUoY6mBg+kJxIcjowshJ+615G/LOjDFLRPSLiV1C6LPWNG6v1ORBnr82Ul8ADsCgh041MycGn7shmw8A1Bi/PCnKBgwkPzygrHiYBEzw3zi3aDo3ayJRaOQaT/fsco7MyN9g5PeTaiiKhTOxfmPBvDD38NbBqq4f4eY0aqY3qju37cQ+v1cXwzbp84IPUESMomsdx27OnH0tbBwoO5gy0bU4/2jNojJOWu8DakfAl4xpYOwpzpogtt4JW3PwOwwa55/p7XXVEh8KPyQ2watjzna06xpGlI6I3AbMRhM+ZF8Iwpd/Lv2sT9+TtJ5dtgVgrW/OYss58fX0Hcw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(36840700001)(46966006)(186003)(82310400003)(6862004)(2616005)(70586007)(356005)(86362001)(81166007)(4326008)(8676002)(54906003)(83380400001)(26005)(53546011)(6486002)(36860700001)(5660300002)(33656002)(8936002)(6512007)(45080400002)(82740400003)(336012)(36756003)(6506007)(478600001)(70206006)(2906002)(107886003)(47076005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 12:03:09.1707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da52abf2-3ab8-488a-38f4-08d93d515bdd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1621
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_73B8DAF11545428D9F792F4DB685BECAarmcom_"

--_000_73B8DAF11545428D9F792F4DB685BECAarmcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

On 2 Jul 2021, at 01:32, Christopher Clark <christopher.w.clark@gmail.com<m=
ailto:christopher.w.clark@gmail.com>> wrote:

Ensure that the Xen build system variables EXTRA_CFLAGS_XEN_CORE and
EXTRA_CFLAGS_XEN_TOOLS are passed into the compile steps.

Update the hypervisor compilation to avoid passing in most compile flags
from the build environment via EXTRA_CFLAGS_XEN_CORE -- prefer the
compiler defaults and the flags set by the Xen build system, so only the
debug prefix flags are provided.

Observeration derived from the prior commit e99974aa, so:
Reported-by: Diego Sueiro <diego.sueiro@arm.com<mailto:diego.sueiro@arm.com=
>>
Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com<mailto:chri=
stopher.w.clark@gmail.com>>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.mar=
quis@arm.com>>

Cheers
Bertrand


---
recipes-extended/xen/xen-hypervisor.inc |  3 ++-
recipes-extended/xen/xen-tools.inc      |  3 ++-
recipes-extended/xen/xen.inc            | 12 ++++++++++--
3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen=
/xen-hypervisor.inc
index 916bd3c..9b96d91 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -49,7 +49,8 @@ do_configure() {
}

do_compile() {
-    oe_runmake xen PYTHON=3D"${PYTHON}"
+    oe_runmake xen PYTHON=3D"${PYTHON}" \
+                   EXTRA_CFLAGS_XEN_CORE=3D"${EXTRA_CFLAGS_XEN_CORE}"
}

do_install() {
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc
index 3560e79..2930097 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -727,7 +727,8 @@ do_configure() {

do_compile() {
    cd ${S}
-    oe_runmake tools PYTHON=3D"${PYTHON}"
+    oe_runmake tools PYTHON=3D"${PYTHON}" \
+                     EXTRA_CFLAGS_XEN_TOOLS=3D"${EXTRA_CFLAGS_XEN_TOOLS}"
}

do_install() {
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 2fbdb3a..5aa2d5a 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -92,6 +92,16 @@ export LDFLAGS=3D""

# Pass through the Yocto distro compiler flags via the Xen-provided variabl=
es.
# Special handling:
+# - The Yocto distro compiler flags are typically set to be appropriate fo=
r
+#   user-space software rather than for generation of a hypervisor binary,=
 so
+#   only pass the debug prefix map to the hypervisor build:
+EXTRA_CFLAGS_XEN_CORE=3D"${DEBUG_PREFIX_MAP}"
+
+# - The Xen tools build for x86 systems with HVM-mode enabled includes hvm=
loader
+#   which fails to build when "-m64" is included in flags set via the
+#   EXTRA_CFLAGS_XEN_TOOLS: so clear TUNE_CCARGS on x86 to prevent that.
+TUNE_CCARGS_x86-64=3D""
+
# - Yocto supplies the _FORTIFY_SOURCE flag via CC/CPP/CXX but then passes =
the
#   optimization -O via C*FLAGS which is problematic when the CFLAGS are cl=
eared
#   within the build because compilation fails with the compiler stating
@@ -102,12 +112,10 @@ export LDFLAGS=3D""
#   explicitly clears CFLAGS to ensure that, so such options must not be pa=
ssed
#   in via the tool variable. hvmloader is required to run HVM-mode guest V=
Ms.
CC=3D"${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPT=
IONS}"
-EXTRA_CFLAGS_XEN_CORE=3D"${HOST_CC_ARCH} ${CFLAGS}"
EXTRA_CFLAGS_XEN_TOOLS=3D"${HOST_CC_ARCH} ${CFLAGS}"
# 32-bit ARM needs the TUNE_CCARGS component of HOST_CC_ARCH to be passed
# in CC to ensure that configure can compile binaries for the right arch.
CC_arm=3D"${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS} ${=
CC_REPRODUCIBLE_OPTIONS}"
-EXTRA_CFLAGS_XEN_CORE_arm=3D"${SECURITY_CFLAGS} ${CFLAGS}"
EXTRA_CFLAGS_XEN_TOOLS_arm=3D"${SECURITY_CFLAGS} ${CFLAGS}"

# There are no Xen-provided variables for C++, so append to the tool variab=
les:
--
2.25.1


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_73B8DAF11545428D9F792F4DB685BECAarmcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <B81A0D1090FD144B912F4E687CAA6C24@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
Hi Christopher,<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 2 Jul 2021, at 01:32, Christopher Clark &lt;<a href=3D"m=
ailto:christopher.w.clark@gmail.com" class=3D"">christopher.w.clark@gmail.c=
om</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">Ensure that the Xen build system variables EXTRA_CFLAGS_XEN=
_CORE and<br class=3D"">
EXTRA_CFLAGS_XEN_TOOLS are passed into the compile steps.<br class=3D"">
<br class=3D"">
Update the hypervisor compilation to avoid passing in most compile flags<br=
 class=3D"">
from the build environment via EXTRA_CFLAGS_XEN_CORE -- prefer the<br class=
=3D"">
compiler defaults and the flags set by the Xen build system, so only the<br=
 class=3D"">
debug prefix flags are provided.<br class=3D"">
<br class=3D"">
Observeration derived from the prior commit e99974aa, so:<br class=3D"">
Reported-by: Diego Sueiro &lt;<a href=3D"mailto:diego.sueiro@arm.com" class=
=3D"">diego.sueiro@arm.com</a>&gt;<br class=3D"">
Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@=
gmail.com" class=3D"">christopher.w.clark@gmail.com</a>&gt;<br class=3D"">
</div>
</div>
</blockquote>
<div>Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@a=
rm.com" class=3D"">bertrand.marquis@arm.com</a>&gt;</div>
<div><br class=3D"">
</div>
<div>Cheers</div>
<div>Bertrand</div>
<div><br class=3D"">
</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">---<br class=3D"">
recipes-extended/xen/xen-hypervisor.inc | &nbsp;3 ++-<br class=3D"">
recipes-extended/xen/xen-tools.inc &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;3 =
++-<br class=3D"">
recipes-extended/xen/xen.inc &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;| 12 ++++++++++--<br class=3D"">
3 files changed, 14 insertions(+), 4 deletions(-)<br class=3D"">
<br class=3D"">
diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen=
/xen-hypervisor.inc<br class=3D"">
index 916bd3c..9b96d91 100644<br class=3D"">
--- a/recipes-extended/xen/xen-hypervisor.inc<br class=3D"">
+++ b/recipes-extended/xen/xen-hypervisor.inc<br class=3D"">
@@ -49,7 +49,8 @@ do_configure() {<br class=3D"">
}<br class=3D"">
<br class=3D"">
do_compile() {<br class=3D"">
- &nbsp;&nbsp;&nbsp;oe_runmake xen PYTHON=3D&quot;${PYTHON}&quot;<br class=
=3D"">
+ &nbsp;&nbsp;&nbsp;oe_runmake xen PYTHON=3D&quot;${PYTHON}&quot; \<br clas=
s=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EXTRA_CFLAGS_XEN_CORE=3D&quot;${EXTRA_CF=
LAGS_XEN_CORE}&quot;<br class=3D"">
}<br class=3D"">
<br class=3D"">
do_install() {<br class=3D"">
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc<br class=3D"">
index 3560e79..2930097 100644<br class=3D"">
--- a/recipes-extended/xen/xen-tools.inc<br class=3D"">
+++ b/recipes-extended/xen/xen-tools.inc<br class=3D"">
@@ -727,7 +727,8 @@ do_configure() {<br class=3D"">
<br class=3D"">
do_compile() {<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;cd ${S}<br class=3D"">
- &nbsp;&nbsp;&nbsp;oe_runmake tools PYTHON=3D&quot;${PYTHON}&quot;<br clas=
s=3D"">
+ &nbsp;&nbsp;&nbsp;oe_runmake tools PYTHON=3D&quot;${PYTHON}&quot; \<br cl=
ass=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EXTRA_CFLAGS_XEN_TOOLS=3D&qu=
ot;${EXTRA_CFLAGS_XEN_TOOLS}&quot;<br class=3D"">
}<br class=3D"">
<br class=3D"">
do_install() {<br class=3D"">
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
 class=3D"">
index 2fbdb3a..5aa2d5a 100644<br class=3D"">
--- a/recipes-extended/xen/xen.inc<br class=3D"">
+++ b/recipes-extended/xen/xen.inc<br class=3D"">
@@ -92,6 +92,16 @@ export LDFLAGS=3D&quot;&quot;<br class=3D"">
<br class=3D"">
# Pass through the Yocto distro compiler flags via the Xen-provided variabl=
es.<br class=3D"">
# Special handling:<br class=3D"">
+# - The Yocto distro compiler flags are typically set to be appropriate fo=
r<br class=3D"">
+# &nbsp;&nbsp;user-space software rather than for generation of a hypervis=
or binary, so<br class=3D"">
+# &nbsp;&nbsp;only pass the debug prefix map to the hypervisor build:<br c=
lass=3D"">
+EXTRA_CFLAGS_XEN_CORE=3D&quot;${DEBUG_PREFIX_MAP}&quot;<br class=3D"">
+<br class=3D"">
+# - The Xen tools build for x86 systems with HVM-mode enabled includes hvm=
loader<br class=3D"">
+# &nbsp;&nbsp;which fails to build when &quot;-m64&quot; is included in fl=
ags set via the<br class=3D"">
+# &nbsp;&nbsp;EXTRA_CFLAGS_XEN_TOOLS: so clear TUNE_CCARGS on x86 to preve=
nt that.<br class=3D"">
+TUNE_CCARGS_x86-64=3D&quot;&quot;<br class=3D"">
+<br class=3D"">
# - Yocto supplies the _FORTIFY_SOURCE flag via CC/CPP/CXX but then passes =
the<br class=3D"">
# &nbsp;&nbsp;optimization -O via C*FLAGS which is problematic when the CFL=
AGS are cleared<br class=3D"">
# &nbsp;&nbsp;within the build because compilation fails with the compiler =
stating<br class=3D"">
@@ -102,12 +112,10 @@ export LDFLAGS=3D&quot;&quot;<br class=3D"">
# &nbsp;&nbsp;explicitly clears CFLAGS to ensure that, so such options must=
 not be passed<br class=3D"">
# &nbsp;&nbsp;in via the tool variable. hvmloader is required to run HVM-mo=
de guest VMs.<br class=3D"">
CC=3D&quot;${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBL=
E_OPTIONS}&quot;<br class=3D"">
-EXTRA_CFLAGS_XEN_CORE=3D&quot;${HOST_CC_ARCH} ${CFLAGS}&quot;<br class=3D"=
">
EXTRA_CFLAGS_XEN_TOOLS=3D&quot;${HOST_CC_ARCH} ${CFLAGS}&quot;<br class=3D"=
">
# 32-bit ARM needs the TUNE_CCARGS component of HOST_CC_ARCH to be passed<b=
r class=3D"">
# in CC to ensure that configure can compile binaries for the right arch.<b=
r class=3D"">
CC_arm=3D&quot;${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTION=
S} ${CC_REPRODUCIBLE_OPTIONS}&quot;<br class=3D"">
-EXTRA_CFLAGS_XEN_CORE_arm=3D&quot;${SECURITY_CFLAGS} ${CFLAGS}&quot;<br cl=
ass=3D"">
EXTRA_CFLAGS_XEN_TOOLS_arm=3D&quot;${SECURITY_CFLAGS} ${CFLAGS}&quot;<br cl=
ass=3D"">
<br class=3D"">
# There are no Xen-provided variables for C++, so append to the tool variab=
les:<br class=3D"">
-- <br class=3D"">
2.25.1<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_73B8DAF11545428D9F792F4DB685BECAarmcom_--
