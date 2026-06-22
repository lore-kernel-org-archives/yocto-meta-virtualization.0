Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE074CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 16:35:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1135.1782146135369073566
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 09:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Nj452DwJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFXKJw1571249;
	Mon, 22 Jun 2026 16:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNgDrWTcJWvn7SRfZD++KlGgfwxOsKGadipDwwfPVno=; b=Nj452DwJbQG9l51v
	uqZEoNvXPT/u0IOHNpWdUQYlOPbofiFe6+13FzbjdabUmbzalT/6xAMGrmJWBrdl
	jk7oYGRUN7g/Puma2cPwl5Bp+I1/0Usl2kfNZmbk4YrkYe/rEzTYldvctO290yJ6
	oEXX1q9M5dFgUHokFbUDwW3qIdzHHBDncRRyXGP10eFAVJf4lXYA51K8uEzVC85S
	a+K57tenLnDFSpGOE6RLdLuNAw9hRsvpbbEjlK2cI8pPg+MllIcLmhKxuo7XJjnl
	hB5t+vkTnKU05qO1v16Rp5bCJJksZ5/SPIFPsHwLa/lGj9BT1jHex12FT1LAYMlh
	AA/0hg==
Received: from ds2pr08cu001.outbound.protection.outlook.com (mail-ds2pr08cu00102.outbound.protection.outlook.com [40.93.13.50])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb99ve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 16:35:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5HCjYBxKKDXNuhw18nbA6lfPxXQFWII0IW/PGh8vh4NQGYzpBhr697dPLo5ODlQKLiFdQOL7JXV1Kfi0etUdj4efex7Tsb2SwDJTCtIpCf0IEkD7nuiAqiJP06cpVEpKfuO0ScvOuudze+Xn6jjnP+VHadizK6mbJgvSx20Cq8rLhM+RhBLyeFylELGbhqH3Weg1PAV/8aOSeLGdvUN9/yVqKWxmUv9O9PjXl9IjpDm1yp06+xqtCUwuA6cbdgd1NOJ6nLEFHSG+kZoQh9vdGG/6GVwPTKnkFmjzNbQCVhBrptE/dQRUsTvwzDjRYqlqXsV9MvGA9JV3cSuz0RdfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNgDrWTcJWvn7SRfZD++KlGgfwxOsKGadipDwwfPVno=;
 b=HxBGG/sMeWMaCc7KsPFv61JjrFdoccK1TYbpxD5VwXZ4dNKOA3xgDqrjl/ZQb8znFCYLiXqVGlcmQ08jw1IJ0GRNQcLtNLdMThOk7qGZQVL8Y5nC9PROBWZrv4CR67Ivv+jDCZYq1Ox0glzCy3Jqez10iKPbduXvOXsiDxon/Rn7SjA+9bMohXaF4smEtWISSvvy1BG+P253NccIdR1CrDNqKBClPYJT9AaZPq7HaCNc3X7lnejn5Ngn4e9NrwLX9vBvh2tbsoO6zZgNrH92q+yh9blpg69WE+67cRSgCeQk5lh6KAo1Q5c7siJGjvz7cfd/KroIHOswqlEV9ZrpfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 (2603:10b6:610:2bd::11) by CHAPR02MB11381.namprd02.prod.outlook.com
 (2603:10b6:610:300::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 16:35:30 +0000
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168]) by CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 16:35:30 +0000
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>,
        Keerthivasan Raghavan
	<kraghava@qti.qualcomm.com>
CC: Viswanath Kraleti <vkraleti@qti.qualcomm.com>,
        Anuj Mittal
	<anujmitt@qti.qualcomm.com>,
        Sourabh Banerjee <sbanerje@qti.qualcomm.com>
Subject: Re: [meta-virtualization] [PATCH v2 1/2] crosvm: add recipe for
 ChromeOS Virtual Machine Monitor (VMM)
Thread-Topic: [meta-virtualization] [PATCH v2 1/2] crosvm: add recipe for
 ChromeOS Virtual Machine Monitor (VMM)
Thread-Index: AQHc+vsFxbnwu93/BUe2rsEco5rHo7ZG17OAgAPvq7aAAAMQK4AABQMw
Date: Mon, 22 Jun 2026 16:35:30 +0000
Message-ID: 
 <CH8PR02MB10971A2BD63B8AC81F97E8627F3EF2@CH8PR02MB10971.namprd02.prod.outlook.com>
References: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
 <20260613060743.3120135-2-kraghava@qti.qualcomm.com>
 <6a360c2b.eef12218.262e9b.f8ea@mx.google.com>
 <18BB72009F835ED2.943537@lists.yoctoproject.org>
 <18BB729F07DE7EAA.1048178@lists.yoctoproject.org>
In-Reply-To: <18BB729F07DE7EAA.1048178@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR02MB10971:EE_|CHAPR02MB11381:EE_
x-ms-office365-filtering-correlation-id: 3d976458-b2ee-4bea-8f07-08ded07c4668
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|22082099003|18002099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info: 
 SHpcvIwArgnXlCTv8bXOyNHMeOD1BgRTcnNeojSenY+rEWIiSEZ5g/hnCpd1QXs/RwVC0HATSTgJzXRguzRGAnajcQj4anaD4P2FPx3SrO1stVNkzmaWcb7pkVwJBhGyRuKWmmgB5ueinxbrjPiG8SKvbcXAgZVGcn6gFEvhxDda3SW6u3Q32fvbY1rqm/w8WOKdc5kkQyZCVx4vxzm0AXsyIcyQXbX7zqCuKB8unYDWUmftMm4sb6fn1qjW+U7xE2GSHYf5QKtG96fchtT/e+UvG/JdzkEFrAZWW1FZUs7m9WkKXiFWcvoZ+8yuBDMUdq++CMpCTeFU51CMTsvWb7iUX35pOVmpqE80gvFUnf/N7yObWUktHVHcTv+sH5bSkoUTOHe7Wn0ZGFGsGHmFYs0yqUJIhA0ZUnzHiVTa3M2uQwDadPacL7/WOm3DlYeNFjOjrJOwhHPf9yVCZDowBRvdBBXt05ogUS9pRYYH/+EwtVFM1MkOxLcPSUAzIRZLBMOp5bq/OUlaO/0Tv+4OZOyF2Ok7oQiVG4FrxcoMI8Re6AuRtVsQU/qTprrADL7cBm9IyGJwjLjhBdQXcB5aAOVfewnrD4H9vzYZyq7OdxFvwtPePhGnYnMDZCHeKr0DM50CZ1PZ9vCCqE4LI7ee0GnuMBp1JUfh+pYZEkcICj5tfMnJkF9q/WjcvGu9V3m3+igj7gVbOc0ZCp/IjqZsU0FQ9VIsmXk9gwemijsrlSQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR02MB10971.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?asb8qd3e1ZmLn5DE9VHz11X7mPVb412VEWjqSVXLP9HVpe8+z2/csX6Zbs?=
 =?iso-8859-1?Q?0EaCV7wOuZk8zffzGL6zi+yd+JbcZXRoNfMYvJnPnT8vl2KHeHIonNmFED?=
 =?iso-8859-1?Q?Jg0oai14sDJbl/9gz9sj7kz4RDUFedEZZMe+H4L/UiJqZLlbtPmfcyDCww?=
 =?iso-8859-1?Q?tmhNp78I7e4arF3Ua9rol2s07yljnAfHKd9StilsLpCluyGFJ/J4sRTT/M?=
 =?iso-8859-1?Q?bkdL8qped1cnJ2yxUNMBQr4jIahhsGjNaQkIhXnYkac1FFH+H+anmPcwMB?=
 =?iso-8859-1?Q?dIhvp+kPM+4bT5rQOBA3YanIwbxqKgtKSjbGEw161gxU0Tx9w1kxQfjNeE?=
 =?iso-8859-1?Q?QkLlPhGYhVrMIfIq6kHfX2rbiBl3MUfD5di/Co+Y5GXC5422rrdtSIYnyj?=
 =?iso-8859-1?Q?NKcw1SPiksFVWv4EUGvtKdBXHywRztut1vNcqs3qsgrspX6IY9n1PMqGjH?=
 =?iso-8859-1?Q?qF9qhfOhjTBXDCTwwvpgJ2HbPS0Syza3xnahH+zB13FYZj0Hn5+0f5zlLO?=
 =?iso-8859-1?Q?f2iPnfXfsSwuRkqOE/hwjs55k1Xc5Npfokei/hvZi3r3+s/xvPpLwbKHis?=
 =?iso-8859-1?Q?DLkR5eJCYpg2AnPo5yNtjkcjGi3vbGoqcjyiW0gVrcpancBjZLmwGczS6k?=
 =?iso-8859-1?Q?A0m+Ko8CmJYzd5TXILyyvWr/+hgeqoVdazHRURd15snnld79BsUQT448Lw?=
 =?iso-8859-1?Q?U8ucrL9PtD0FxWVMpMApgxrdkElxlSeDBJLgsy2VmcqMu63whRyEgMSeZc?=
 =?iso-8859-1?Q?MOr3lFNO/DFxPmKWLCXlQ04OT1F2SZn9joPE+9RA2cX9ywCFPChPztMcOv?=
 =?iso-8859-1?Q?mVC5wS0pDtmMAAXLx/RXd1uqx/7XUh8fl7PeGAjNaC5/LSsBrjqRL9Q4T3?=
 =?iso-8859-1?Q?wWcDTS3FVYloCuQ547xfuhzQg1ifYgMGzPfCAbkAXjMKk/8tcj/bV7THAg?=
 =?iso-8859-1?Q?DkJlPOME9P2UGkZphEN6z8q8Y17afZ+Ldb0nSAKvSQaq1w+oQe+J1ABfOc?=
 =?iso-8859-1?Q?QyKxG3iEpPJMfXH/AvrOHgck8gQtZ/LwORB01VGkBaYf6chX9y8koJD0w5?=
 =?iso-8859-1?Q?/SfL0rqfw/T1qP04zGGX1QhQXDBwxZEGC8wx7oSQpZQkXDVULm1wJ6TjCs?=
 =?iso-8859-1?Q?RsZkRR5G4PaF2PXMDQkenEoRy1fofRIQxWyn4aRcqkkE3Yu9XTftEoW27r?=
 =?iso-8859-1?Q?Nb5VECZBVNWm9I0esOf49oJ82RrmPurI9doig/JsoKYNJkd9LMtIiaiaBq?=
 =?iso-8859-1?Q?rA6IgHp1eMrtMeofbtxCc9DNtNtuXmDmG4MgpbO2Ac2eRsOaHKczq8dHRK?=
 =?iso-8859-1?Q?oNQsuMIoz5fehwjekx9wUY721mtpx9vW9WDOb7PXlEpBqJSnRWejhhT6qa?=
 =?iso-8859-1?Q?KVaOlj4vOxIPT241zbKr04v4Ei1QA2ht0CXkE9y0ooZFXWn5m8v9rT9NpK?=
 =?iso-8859-1?Q?fmPyIuqg0cUr8UTji2scQG2tsCyVsl+uLkN4+zgxeJ9qlRBJX4eI5n7iPw?=
 =?iso-8859-1?Q?JzkWfWbO0TVjTZlY6R+OtvDYtaZap9jAMbl4yubz10bxbUukP1XP8oL7Ls?=
 =?iso-8859-1?Q?xJ6nKM5ZsQhHNcV/1AxPhG8iwWNBhOh32W/uOrwLSzwqwisfn8qwsXoYqS?=
 =?iso-8859-1?Q?xOwAzu+fj5hZHYwDDY57J+iK7d1vpPAF//wsi8IzkA3P1HY5iJlU11vNxZ?=
 =?iso-8859-1?Q?7rTNctE9I3HTldiCXaEwluy8hqtxQerfS9CJSD20dgoY3CrGoizPDfBm86?=
 =?iso-8859-1?Q?ybfpJfY9Za0LUHBfRde1fOh1JTVQbDEsSASAcWttgxvtDIfl54WmUt3MVN?=
 =?iso-8859-1?Q?nLYEu4NwGA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	BCIO5qbMRLneyNLqFL2cgcHLun1Ken17j62gOWcTzxdr+ue/k6HXGUKwbIMVhJ7xBk4ShghSyTmQ3gF3ThkxhUcESfewxwibReHo6wcx3jI5H0NO7ChbKqNbxU6+SLdcxSS00HzlycGLSiyeScFZ5tGkcSmmxIYN/TyeXmpybY7xJOV6UsZokyF5aVdg93nTwBY5a9qUrX1MAapl+shbnUOeESZYCMMTfPkIyyk+NqRcL3o3Pn9p+GD4t79MJZImqbFRye4nd0GImPCTFdMgp5Wr+qejtasNe9CfLZQzSw41AVxLJVVcCx/tL7Zo1NfPFF7+xAn7Oii8cP85T1+qQQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	5m4P1gvW2o25PFGNOI23jL5BJ4xaE1Yyupe0op3jhVPu8jWwVwyIlCWBECAPi7K5Kb5XoEawOjZKHt2RZoPOGhm2sYEt+2fKBMe72o7ZTOmLq8bbIHczrjALOowVDmxmk01wS08x+l6s3OhEYaK/VUkmYz8cjuOf8RvEccW+AWdnjEW572zJEglyVd1ImFFBBGmYh4d37GNmsadyiG8pxjPKdbCchUW4vTRAhcqL30cuDsjaLS/L12rbptvNvJGxtgTIWAz//MLBxAsGdEeuENTHfgmGaIrpXZ0SKaYb8jyVbgPy5BKbrlQdF1BEudRYFM+vEIIg5mpeGdTFUMK78MYNrydSoQo2OrGYYxB+nMoJaAY2rjjPdk1266upRPiiwakvu3+3Uk5jRUNUEYb8PI/zJ3yUW6w/T1IG/cMFcXnRNYbxf8bS2lnSTV46i2gtDwMBkZ9SDkMXPFE7T9lRJUo4swGpOthf2ui1W+PYfRyuS5zo12KpOPjxmKutxMReoT6/f4x8IYA9YlEuL+E6etfmroId04jrtnl2y2VVZ88V0gf98N/KkRVClAKwB5aTLr/7fQu3cIeGqmGGukUT5z1iRojK/WCI6N/Wtv5ANuxTCkxqmKi5kF2hrkAiWRpj
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR02MB10971.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d976458-b2ee-4bea-8f07-08ded07c4668
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 16:35:30.8762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cqGbtQq1K63Res0Fv5Puels1M3ce3+lKYR8JdpqihV7lkGb41VTabzpul32SLsS7VazYs27fu5hKnNDI4GfEPjWrMR5aEZyQEcHEaPpHzW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR02MB11381
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE2MiBTYWx0ZWRfX36/tEmuJ5Fb8
 OTl6+YldPT2Z8bwHiKp5m+imZnImEmcEDqZY3LVCb0FtCRQ3VXCkQzCivsJoXrBoEni7SQ0tVvp
 yj1hOASzYfKB9HYjbz37o5uItvjib2Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE2MiBTYWx0ZWRfXwhcXCV64aRrC
 dQY0msS+TyI4qdYD75JLEWsla3jL2hx9id6rnx2ezBK9f/kLH6aJhS+Ihl3FmRqKzYewBLkGQ4+
 BRu4gohyPxX7UBTIxsbOuCcwi26FuBgCRmH3xohg3isM4f6PfJay95q5RSid50kEzeSceXAms8n
 g1SAOiC+6eXc51jKUctQAM8j+itkutOyL8CXkgbK5BCs0ZatMqaTz88UQA2oMpX/yRVUsxeuoXq
 Ejt4emzti2JvlNACXm9Sz6y9h5WJL6DSEheU3QUdVRcBl9g347n6deZ/NOuYXvfLVAzDSF6cLZT
 /mj9I67ls/avtrzb6q6n0U96GZkiH0FYphlG5JMz33h8tCM4QSZuylfTXYmATsBVrlKyhPoyaD3
 +M4T5FtZngj4ub+uxmP+prPgVK+IkxL0gBOAnPeesqnAEkTK6EnedKWSG3zE8pL7ZvZmIL8TVl1
 q81oG9rORJOyCr5KSgw==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a396455 cx=c_pps
 a=ITiX5wGoaVWtfJBAqtKqhw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=B1vgFeSDugmVZuj5ZKoA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: i7LA273zwD01q0kczqoHHKDY9suE--FJ
X-Proofpoint-ORIG-GUID: i7LA273zwD01q0kczqoHHKDY9suE--FJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220162
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jun 2026 16:35:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9900

> The src path terminates at "${UNPACKDIR}/git/third_party/minijail" withou=
t nesting into=0A=
> "rust/minijail" which contains the Cargo.toml for the minijail. This case=
s cargo error.=0A=
=0A=
Sorry typo. I meant "This causes cargo error." . I have attached the error =
logs for reference:=0A=
=0A=
> ERROR: crosvm-0.1.0+git-r0 do_compile: Execution of '/local/mnt/workspace=
/kraghava/upstream-crossvm/build-qemuarm64/tmp/wor[235/1994]=0A=
> 7-oe-linux/crosvm/0.1.0+git/temp/run.do_compile.3018651' failed with exit=
 code 101=0A=
> ERROR: Logfile of failure stored in: /local/mnt/workspace/kraghava/upstre=
am-crossvm/build-qemuarm64/tmp/work/cortexa57-oe-linux/crosv=0A=
> m/0.1.0+git/temp/log.do_compile.3018651=0A=
> Log data follows:=0A=
> | DEBUG: Executing shell function do_compile=0A=
> | NOTE: Using rust targets from /local/mnt/workspace/kraghava/upstream-cr=
ossvm/build-qemuarm64/tmp/work/cortexa57-oe-linux/crosvm/0.1=0A=
> .0+git/rust-targets/=0A=
> | NOTE: cargo =3D /local/mnt/workspace/kraghava/upstream-crossvm/build-qe=
muarm64/tmp/work/cortexa57-oe-linux/crosvm/0.1.0+git/recipe-sy=0A=
> sroot-native/usr/bin/cargo=0A=
> | NOTE: cargo build -v --frozen --target aarch64-oe-linux-gnu --release -=
-manifest-path=3D/local/mnt/workspace/kraghava/upstream-crossv=0A=
> m/build-qemuarm64/tmp/work/cortexa57-oe-linux/crosvm/0.1.0+git/sources/cr=
osvm-0.1.0+git//Cargo.toml=0A=
> | error: failed to load source for dependency `minijail_src`=0A=
> |=0A=
> | Caused by:=0A=
> |   unable to update /local/mnt/workspace/kraghava/upstream-crossvm/build=
-qemuarm64/tmp/work/cortexa57-oe-linux/crosvm/0.1.0+git/sour=0A=
> ces/crosvm-0.1.0+git/third_party/minijail=0A=
> |=0A=
> | Caused by:=0A=
> |   failed to read `/local/mnt/workspace/kraghava/upstream-crossvm/build-=
qemuarm64/tmp/work/cortexa57-oe-linux/crosvm/0.1.0+git/sourc=0A=
> es/crosvm-0.1.0+git/third_party/minijail/Cargo.toml`=0A=
> |=0A=
> | Caused by:=0A=
> |   No such file or directory (os error 2)=0A=
> | WARNING: /local/mnt/workspace/kraghava/upstream-crossvm/build-qemuarm64=
/tmp/work/cortexa57-oe-linux/crosvm/0.1.0+git/temp/run.do_co=0A=
> mpile.3018651:184 exit 101 from '"cargo" build -v --frozen --target aarch=
64-oe-linux-gnu --release --manifest-path=3D/local/mnt/workspa=0A=
> ce/kraghava/upstream-crossvm/build-qemuarm64/tmp/work/cortexa57-oe-linux/=
crosvm/0.1.0+git/sources/crosvm-0.1.0+git//Cargo.toml "$@"'=0A=
> | WARNING: Backtrace (BB generated script):=0A=
> |       #1: oe_cargo_build, /local/mnt/workspace/kraghava/upstream-crossv=
m/build-qemuarm64/tmp/work/cortexa57-oe-linux/crosvm/0.1.0+g=0A=
> it/temp/run.do_compile.3018651, line 184=0A=
> |       #2: cargo_do_compile, /local/mnt/workspace/kraghava/upstream-cros=
svm/build-qemuarm64/tmp/work/cortexa57-oe-linux/crosvm/0.1.0=0A=
> +git/temp/run.do_compile.3018651, line 156=0A=
> |       #3: do_compile, /local/mnt/workspace/kraghava/upstream-crossvm/bu=
ild-qemuarm64/tmp/work/cortexa57-oe-linux/crosvm/0.1.0+git/t=0A=
> emp/run.do_compile.3018651, line 151=0A=
> |       #4: main, /local/mnt/workspace/kraghava/upstream-crossvm/build-qe=
muarm64/tmp/work/cortexa57-oe-linux/crosvm/0.1.0+git/temp/ru=0A=
> n.do_compile.3018651, line 197=0A=
=0A=
Thank you,=0A=
Keerthivasan Raghavan=0A=
=0A=
=0A=

