Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C2BCDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 10:24:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17974.1782210230415704355
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 03:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hteibmuI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8V3Wj3245123;
	Tue, 23 Jun 2026 10:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fbfKrK2gT4pgRxGVwjNqG1oapEqBHCG5Z3lW4Gx2O0I=; b=hteibmuIZOdM1aNh
	jhehWHXPbHyPKNOIsd7Gap0HR5FhdVrLEE9pl/JL0URtcMThDX6/dmWxppyY35xO
	XsHs9/2HQ0xtxKHbxFw9Uyml/b3FifTSsEZAEmFjGn6OUH1w6gCVWQfxsNeJ9iSp
	Q9HJoT8X4lIzkL74/aiJL1zrUoiFfAYBdLO0VEAH9pgK+JyPoL8k+3xaCU2bjAKw
	V92Dn/z3rS2C4mmhS6OPgnmk542EadN5cXnYGjGKwF5tk6n10TQwqicl1nk5hJhj
	gGTm9D/a2kAKkmVpa+TAmB2BSJk6BOQCIEg015e4NJhLh6/kmAQoYwK4ZDbYkDrP
	lUuwcw==
Received: from co1pr08cu001.outbound.protection.outlook.com (mail-co1pr08cu00100.outbound.protection.outlook.com [40.93.10.96])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyggma-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 10:23:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFAd7I8wREFutpSHVP5z6gKFxJ+WsTJcjuWz8NBDUMpJm+7uyZZ/FnvqP3V1+yvhpiqVqNjcSyT1OJ1co5ZAgbYIj9j+7y3yarpB9tUd0RHeIZw068GgfXxkOyYXcT9woC2An+zlEW2rvpN+Jj7fKfyi46HpekEwoVSD0MIQ37TcHvcp7J1rT1Nz72FCmGriEib5oy0FZ6ooH++bnGb3ZBqqK0/fxnwA1c9PyHtY8H+mrGOpE6cAf1dVgRSq7dWNsmadYJfx2tc34wp4G9SHa3U08K2xb+bllc19GmLHFp4cL6T3nACOhDH1870u2//8qhfKluaLy1HEI0w/XFShSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbfKrK2gT4pgRxGVwjNqG1oapEqBHCG5Z3lW4Gx2O0I=;
 b=t5o2ok1adQ2nH3kPQDN4bYKHvnnXhv/c1+mD/5kSuxcm5tuD6/8U5iVq04q9FzLfa6j9U9Bx3c8i5p6DCxpnNO0ucEC+StpZxK32AbzTJDpjE+fOJJCuTo/9qSM7jXL6Mv1vigVOMQMIrxKmbnjFDubVpOZMC9VR3FIuHSvwT6N4Dm0lhLxqLJopoSilSaD/lQL0gdqVrP/+hVw9c9C2sDeI1yvmfrbuTfoPEB7CvEZMLlnDWB50COVRipUTPt8APtbE/3EQJORa3W6uxcGOZ09wUoIJ23SxPJhc2Gl9uXNzb607dZJAp/np3RRPMd9TEtEHZ54xPOpW3BZBi5hU6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 (2603:10b6:610:2bd::11) by CYYPR02MB9788.namprd02.prod.outlook.com
 (2603:10b6:930:b9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 10:23:45 +0000
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168]) by CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168%4]) with mapi id 15.21.0159.007; Tue, 23 Jun 2026
 10:23:45 +0000
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Viswanath Kraleti <vkraleti@qti.qualcomm.com>,
        Anuj Mittal
	<anujmitt@qti.qualcomm.com>,
        Sourabh Banerjee <sbanerje@qti.qualcomm.com>
Subject: Re: [PATCH v2 1/2] crosvm: add recipe for ChromeOS Virtual Machine
 Monitor (VMM)
Thread-Topic: [PATCH v2 1/2] crosvm: add recipe for ChromeOS Virtual Machine
 Monitor (VMM)
Thread-Index: AQHc+vsFxbnwu93/BUe2rsEco5rHo7ZG17OAgARDlbiAAN57bw==
Date: Tue, 23 Jun 2026 10:23:45 +0000
Message-ID: 
 <CH8PR02MB109712F19227670A82BC626ECF3EE2@CH8PR02MB10971.namprd02.prod.outlook.com>
References: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
 <20260613060743.3120135-2-kraghava@qti.qualcomm.com>
 <6a360c2b.eef12218.262e9b.f8ea@mx.google.com> =?utf-8?q?=3CCH8PR02MB1097146?=
 =?utf-8?q?0B68EFD02FD19E40DDF3EF2=40CH8PR02MB10971=2Enamprd02=2Eprod=2Eoutl?=
 =?utf-8?q?ook=2Ecom=3E?= <6a399fd2.40ff4c04.83ff5.dffb@mx.google.com>
In-Reply-To: <6a399fd2.40ff4c04.83ff5.dffb@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR02MB10971:EE_|CYYPR02MB9788:EE_
x-ms-office365-filtering-correlation-id: 3fa22cd9-bae0-4566-c791-08ded11181e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003|6133799003|38070700021;
x-microsoft-antispam-message-info: 
 UvjCmFERxlKJhKuUxnuer6etTVirwmPFfXyJWb0i+UYcKaAAkfVDwyeD72wLpIl49bFMIfoWQfjydy2GiLIhklp7wCjYaa2+Wyk+WaeDwRHkltj/Fp4sNnPvC+h4uSGyR18m/c8KAtzXIiT5FETOVJx3i5gNZkSa0EJnex290bryn3vBYQOPvAs/s0iynov3rfchZZPKb9rQsCji+p5AsdIjfmXHRU2sfWfyRwUW8ppJp1qJWPWRHgLuqKS2JZceIMXZODrz1983Vk1Xz6PqXoxSv49iuQGSTRzNIh8xyPLYbLxC4PxFMLaTn7TqIOloPRPJloSWqtxQBc65lqj8gB1OSqWX71LpVJk6c6MEv5bSZISOJK4NHDid68XwWF8JBGGbtP9+iRVjf/OxN2qcTFn9lah2mJVk+m2Xor9eKZULB6bBa2VwGKpFWeobYP4pj3lXpNXkFXAxNFrMLtDgUmUq5S0UM9Ds/6Iql+TDuvGzHR++oe3ZYv6Q3xldarwMqbYKaUj7kMPgMOd0bwMGX3+kjosxun39kujLfvMdf57IbG6yM9OB2ieho1BOCjIqO/1dMS4VM6ZVY3T9IyF8ztQ6UtgrLC2yCh3BddQ5Si5Tm/T7dFixJJ8a71k9FhX2zDA4+pkJzhYFvAAvtkKPk5BzQlgSSnM0m+l4EhqasLA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR02MB10971.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?MkYy/8/9xpjH/w+Fr7tSUOfztoPCjC5XBiq40OoxXjPSPK0UmqG9pgGT72?=
 =?iso-8859-1?Q?Jnzx/ABcx5og7Em7vjsZm/uciM2vZiLvK8TDJeYyUOffmmJz470XWAtm1o?=
 =?iso-8859-1?Q?7ld4DDdrtsfL5Vipo2Czqp8CATWFe9JzuGaOj8izC0stSijzkd0Y9LVfeu?=
 =?iso-8859-1?Q?kMW5A+zTxBlWMOWVfuq7yNSIraDtx/jYIuT/2wmj35gtFOs9VNcHD75ROH?=
 =?iso-8859-1?Q?RDxhWNaDxb1yHiS8MTBnc8MSc4AjwGJjYgly17xxzzsJU+eXm/UX9edlan?=
 =?iso-8859-1?Q?Y/8HeoYMGVOmomC5U5VtexcH/8bUT5pyI/0mShi0j07nteVLrLeKQT3kgL?=
 =?iso-8859-1?Q?YJ3JExELZruW56KiEXDKGTiJUM3Pdqq9h6oaPIVtu4st5Mfe8Shp5++Eij?=
 =?iso-8859-1?Q?aQ6T/VoYoJFlTxCCFwGLCTlHkn8PW0roqjPkWEtAxqCAcalSVnNGpCmdcj?=
 =?iso-8859-1?Q?Xp7QVXY7h5LBMOhnTh8Ff0Mm/vZOR75DuQB/+zATpQf6TPMSmTXT9McZvi?=
 =?iso-8859-1?Q?6LgqCDtHVzB7boiotF4uHK0XaCxcEIdlQJMG40omGdYDl/gWbJQET9mkdt?=
 =?iso-8859-1?Q?l+/bkkxPQXgbn2CRUW3YYF+Q6W3HfkKmH1XV5qtxMGa7BmpVZcTiVUd9BI?=
 =?iso-8859-1?Q?y4XAR0EplREAaS++V2HCjuIjoXuX2tiBqamHxpGjrRnZMfG5AX5hyL6pql?=
 =?iso-8859-1?Q?k9ucRqjx3I5KNHCzXnigxLQMIA0Mj/VHzap8coHDr+VVl9XUx+rhKnzgdE?=
 =?iso-8859-1?Q?i3qNDP2xrzRg4tBRo+z7oDMDSJRqXhWRzy55jnHt0qXkEvj/Y7ZAXoDOaS?=
 =?iso-8859-1?Q?d3rXQhNZFb0ExFCGVaIPPxPgK5ydlFvqeLM2XXtcrV75gEarYSFbktRWVN?=
 =?iso-8859-1?Q?iRcs5rqc1zAtsEMWlSeX0xe5nl73mD/9c0lxGFucI1YplpHDBJOYvWYf82?=
 =?iso-8859-1?Q?AFXSANOdwBOr9I+VxQlWRGNe/Ye2GMh/pIAaMreeb0zVMgaHL4LMG2DsM+?=
 =?iso-8859-1?Q?t6f85hWZP5bGoCFgTjt23skUgq3DgfqdmDgZCveHxLdMJ3YL2TCCMIffqd?=
 =?iso-8859-1?Q?d1u8VoAbJP/Savli5n+LUZ99fpa+XMsSK1TOgvrTwKM0wAw5ju8vUA1ULp?=
 =?iso-8859-1?Q?pSmHDLT5Y/1zZeHrHDd9HAG0P+Amnv4zOZtWLredOf1TZcIOXInI/2mfeN?=
 =?iso-8859-1?Q?GQQPEcZ9f+3Q6NctMQ1AmKEpZLVoVFhq9AjT6m8H9/voPH1xaPZf0jeo6u?=
 =?iso-8859-1?Q?21Ka3cbyi+BELa0liuzV+Tp5G0p1EnTq+wiNSXTUDRlG4dvrcFKEHTlzAc?=
 =?iso-8859-1?Q?lb7X5MURswHTjEB0SdzR65QhXhLnjMYl9xu6v+hfH3BDJtFG+LKTEhryys?=
 =?iso-8859-1?Q?Mq3uOJ+DcxDG+Gh1510GYNxNlmWWTlfJYJCYGU9lS4wy7cEYTvqOd6f2iY?=
 =?iso-8859-1?Q?OlSmpXTsn2X0oLjpjIl0qJFon8IUXyOC8A2bEBQfwH6HDk2VjvFHcZfFDL?=
 =?iso-8859-1?Q?f6r3yzVYfkNdsAjFuy1tmhZkWrGlvymvDqc2kpHhr3XUxh3uw+0INFKEeG?=
 =?iso-8859-1?Q?x1UfsOZ+uDuxj175Bz/PRlzqQ0HcSRUxPq0dqHDmWu7ngRdRtMzADYy/go?=
 =?iso-8859-1?Q?WqBFEJlYeLF9+h7yqetov2U+o9Cf9QeBrwBRUiXEgVDylYp6t/LG307zzc?=
 =?iso-8859-1?Q?wevDWyLvPinw7laSr91HnC31zXSBgNshQoJiPGO7AK+Zy0OMeT9L1CWH8h?=
 =?iso-8859-1?Q?2uGSRGhjXnO7olwSR+9bE+jQDjgLBH49fb7uIDp1mF3IIaxdF6WmrxrvPZ?=
 =?iso-8859-1?Q?TvDWTmzu2g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	R+hsX6cQIcWhKoTBgGQ31vzdtd62RtEN3d59T6c5IPW6DKDr1ITjSDRYJKnSwUPNQya/kZb+sSmEvvqDlZQg9EwGO5qyL0j6fL07SOvG3NS9zMGKW6yPN29w3+/GQ4SzqPOC/IS9Lbb7ymmmbFeNrSfSxZcmPYQYAlZeUYkFljTOaQs4ogDwD5dzG2C+wkmkSwBkuRnQgX+pO+Iz5M2CRQLdVq5dm/S65mi17NBqxu8hK0fW7pgn2LS/WfciHzfuY9BtrJ8B64n5ZUJY314r//1FlZ1kn4cPZJ3E3BBpTwWhHDx86Y2WIZ+mZVz96lakfOCWCCEt6S/f6QAU+DzCGA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	bw0ENxWCQq33kosL5Qm09VpqwLAOffG/UG7jnkUDisRkbOH4nBnk2COFFwlYM/tGhU4jdsO31Gvczxgum+s8J4xxH+BhmorumTK7Ai0WGstY3x008SdFF8oEngND+UwH7YFqTF6uFZSLHf/AcDWrs1gevzwvC1T3wGXDDUdeVLY+Io8IYr7U3ZoVOKMPQzjRVwKV8/yiRhzlfV00bl5B3eI83PxeIwNtjfsgqOHvy4TnJvBWCT1+WnmT72N0H5Pe/tds2jmqrHuUqIE7fty9SjQoKR9MGyTXdQpxFEyf8hW4EaZLUbv8dtd0MTHfLh2l04x30FW1EX4+al1nUFWJeD/h+odLrxFacrC8kotFMoRyzjBAZN+eNfR72EDATqhl5GluZ80Xje0fFnzd2AsbgwXMEbnjvVoHlY1qSIJpE15f+d9e4WFI/COMAKDygnUU06QfQs6+e7pCNngf0ZviOJSy80zei6M+qb5RfV72Oc/8XhCGmSos0qt/NsnVJLg/tbqNBTqSL0v4QuSTp8LAYxP57KdEQJG53lgQmwykA8SHiiZqyo5cBvUoVwf0rFegHTDWElBFdPiduCCSKmWfh2RPAuLyIFPb2Xft0qPKDvo3vhXay1IZ3pDw4RLgAXdY
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR02MB10971.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa22cd9-bae0-4566-c791-08ded11181e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2026 10:23:45.7118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p4H2/vcvx1SYKxnwchsQoy2iLP8Pzw4dRzGZqMDELFaKLLZm701b/gAsxQ0LlR37x7C+YFtx2dKIk59KHN8KAj+BEnkdF9gG/8lOOGUqFo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR02MB9788
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4NCBTYWx0ZWRfXwGjwjQpb9UPg
 lTl07Fcy8oUkeSHwUk9XAbOoz16syvIxwbI1KmZzg9eoTTyqK3+IOklGzD7HsWWhXQIRbIsvDnE
 UDxUcEGH5C08SjnmicoWtf82v9SveKiAdITXjuP4AKmB0ghwOg/YyLCQalG9cqdDWLwzWqfkr1R
 6oj7NORr2t9G6Vh1/ASfKFTa5Hpiqza7ESHFG35Als3+54uOmOBQDKd1q+eL2gwRh0hWizyzrWH
 8RhFclAJRj547mS2b1IKz2aGAOKOem4jVYtaXeNFeUVyUQw8RxETqIDAAyGa3lF2aAcljfE5ApF
 ZZ0O1c3rK0iHIC567lbwN3p+NbfE70/nBIt7fLO0ko0pv1wzkcvfUVYJrAxR+AZTlKi0cER1IPk
 Z41oJDJSp0NLt9mBZRA4kAaO1QpUajnOP7p0ZIUj2sk5ifpcDWnweWyV29M6WBTdthmVR+vkxcy
 GXP3DTmbymUa6qgSxBg==
X-Proofpoint-GUID: kpAvju-ztTbEQBrr4oxu0twhtbs0ZFr7
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a5eb4 cx=c_pps
 a=BJZjicBOft7ocT6cnC9tug==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=VbGd_Kp-lv3ZhsQcfWgA:9 a=wPNLvfGTeEIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4NCBTYWx0ZWRfX8ZoFYMawD19X
 70ZmtCCPM93UNXGNOlPz0YXCY68tNkFOR5jw74aFGp2FQeh/JK5d6v3ur+IWBhAy2Bdb85vwgaU
 McdI5quUT2EQBR7cfbO6EvtNEgbvsKo=
X-Proofpoint-ORIG-GUID: kpAvju-ztTbEQBrr4oxu0twhtbs0ZFr7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230084
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Jun 2026 10:24:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9903

=0A=
Hi Bruce,=0A=
=0A=
Thank you for the guidance and suggestions.=0A=
=0A=
I reviewed another recipe that uses bindgen for creating sys crates:=0A=
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support=
/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb=0A=
=0A=
I would like to propose using:=0A=
=0A=
export BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --=
target=3D${TARGET_SYS}"=0A=
=0A=
instead of:=0A=
=0A=
export BINDGEN_EXTRA_CLANG_ARGS =3D "--sysroot=3D${STAGING_DIR_HOST}"=0A=
=0A=
Rationale:=0A=
=0A=
- HOST_CC_ARCH: Specifies architecture-specific compiler flags passed to th=
e C compiler.=0A=
  Reference: https://docs.yoctoproject.org/ref-manual/variables.html#term-H=
OST_CC_ARCH=0A=
=0A=
- TOOLCHAIN_OPTIONS: Holds additional options passed to the compiler and li=
nker. For non-native recipes, these point to the custom sysroot via RECIPE_=
SYSROOT.=0A=
  Reference: https://docs.yoctoproject.org/ref-manual/variables.html#term-T=
OOLCHAIN_OPTIONS=0A=
=0A=
- TARGET_SYS: Specifies the target system (architecture and operating syste=
m) for which the build is being performed.=0A=
  Reference: https://docs.yoctoproject.org/ref-manual/variables.html#term-T=
ARGET_SYS=0A=
=0A=
Given their intended purposes, using these variables makes the toolchain an=
d target configuration more explicit. This helps prevent accidental "noise"=
 or "crosstalk" with build host directories.=0A=
=0A=
With this approach, bindgen (via libclang/clang frontend) will resolve syst=
em headers using the correct toolchain configuration, including all relevan=
t compiler and target options. This should ensure consistent and correct he=
ader resolution, especially when extending the recipe class for native buil=
ds.=0A=
=0A=
Overall, this feels more robust than specifying only the sysroot location.=
=0A=
=0A=
Thank you,=0A=
Keerthivasan Raghavan=0A=
=0A=
=0A=
=0A=
 =

