Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55019CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 15:50:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40.1782143424411299410
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 08:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ALCGslEG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFVk8p1082163;
	Mon, 22 Jun 2026 15:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QpChTAWobhL88VVGsXivWQqgIRlpz9FPYLFYp9WFTeU=; b=ALCGslEG4mqTsTfD
	DHcXo9791Dtx+j3D0vjmNarvt+NpJhIM8uaWUyMHFihRPoYXDieJbmTFeT7IEa3x
	oYhfWLvBvd8pIifpXGEdTqj1PQErCAu9rROCaTc15znfgCtIu3oVQOR4afi1bG0V
	xBPl5CR292yPIIFjjaND/uIrlJOHV/6WPFAp+6z0TUVCArMwW9aRjKyX/JZ4CP+c
	61Ebq1Gk+URs5QuQSpJ/u4bTWdbBLgRo6ebm41YwuBLuzYOt6bK1j70434XMseqn
	mn+3e0l3R6bM6TvDhN3yxRhkZsyw3y0shikayRhCCgI4iuhrPtJNlBgkIAN2yltu
	+peJMw==
Received: from sn1pr07cu001.outbound.protection.outlook.com (mail-sn1pr07cu00102.outbound.protection.outlook.com [40.93.14.98])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yj97pw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 15:50:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7Y2yYiEgtnX91GdekFAOVlQVFkOwUYN91oW/OMOWSgkaOwvY+rMJ818RZ+BSQLumeyxIMZM/gKRUxkRpYchsFsG5QoU7hxhFTX77aeUuJ7asFN0v10f3E4/siZJebF5ETRXtjvB6NWXQLauYCixkjq83JxjSndkwwG5W6EA5OQH4sRGT5knya8cmTzflIt39iWrpeHVnM6eGJcwesJQs2diyyDRRQrChCG0twNzIzAFnKxwl4AsLKXujtFiF0QQnvV4AUZg5s3R20biUNFg3RO6Y0LNZD50LV5aB5x0BHGre2enpNxNvfs6BLsvHKnWn7I1ec4RNqrJ6VFyVY8ODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpChTAWobhL88VVGsXivWQqgIRlpz9FPYLFYp9WFTeU=;
 b=YVzDsqMjl+3CuVJvOiy1SlDXadmttergc+5IqBDTneiDg3vOuXXJhxXrPd2SMkpV/hwnoFL4lYcA2lTpJbVZbLju4IxSPwTcWeKG+RFDcVZKc9u/hbRd6Gxl5+n7yUH+0IeOLufa05omQvE68UImdUEU4luCCOIQ63V+RyeJ1DGfV1Xc397v6hFHDmMOMG7ry8l6TJfPZ9EK0IXNPhQH2ODze5d5ojsKzmpl5zVLCJwhnKQnTZHyrDwqKU3I5rY2Rk5JNXcst/Tj9wsIzK4YEVPf9yuXMVoUkfym3xnHoUHCk2Mef1mDytoYgZa7Edqj8KHco/SFppC+cIojObIBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 (2603:10b6:610:2bd::11) by SJ2PR02MB10076.namprd02.prod.outlook.com
 (2603:10b6:a03:566::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 15:50:18 +0000
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168]) by CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 15:50:18 +0000
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
Thread-Index: AQHc+vsFxbnwu93/BUe2rsEco5rHo7ZG17OAgAPvq7Y=
Date: Mon, 22 Jun 2026 15:50:18 +0000
Message-ID: 
 <CH8PR02MB10971460B68EFD02FD19E40DDF3EF2@CH8PR02MB10971.namprd02.prod.outlook.com>
References: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
 <20260613060743.3120135-2-kraghava@qti.qualcomm.com>
 <6a360c2b.eef12218.262e9b.f8ea@mx.google.com>
In-Reply-To: <6a360c2b.eef12218.262e9b.f8ea@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR02MB10971:EE_|SJ2PR02MB10076:EE_
x-ms-office365-filtering-correlation-id: d1b447a6-17ae-4293-3349-08ded075f58a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|3023799007|18002099003|22082099003|6133799003|4143699003|56012099006|5023799004|11063799006;
x-microsoft-antispam-message-info: 
 9GeApb2tlZQcYVDkx62e7wZ0F4WaQZwsAiMkyYxkKjcPj2maPQswsLxKWwvw7MBLQ5mp0LWfxMkeBkjQrco1mh49zrAMFyMJeLOkN7mRaRZBNsbioTO0qKcWNKgmY9gikZWZYCt/tzV3Hqxb4/aRg6XYQgMeIwBhKlW04bUPulJb0gZ58AVg2e2eBhvSltRLolZRxZ/j2AphnphcyBATGpSG8/CPUnk5W8f1kIvS2NH5WS4wH+dOsyvqw1J0o72RDAV09otAzpI3fdf20G3xQbz16kmAFx6M7ZNkWKx0/7Yw9dQcNRS1fuKfbGUQPHrq+YY2VpveF9X7u6gkM98818ZRe+AnDBbs+SAqrEG70qDVcTsMSD+S4GpwpBnftgFy8ZrujhctwvN7qiAIQy7cXAbKqOhYUQV3oNaBFre6f+PnDl0X3fd1MhsNeKVXa8cqRsaDRQFnfVrdNfIc69Tu/A0CyzeQe21tOfDIVb14uR5jU78ttyV1JF4J9qh7CzU8VApGChwYV2Sfxrq2JG6oKeoEkijldaKpM2J44l8guQUk9uihG66mlPOoba8NOlUk3yKIyRleJB7dF6/oq/vEOsQoLIfW2jX/dxoSfT5Zut0Y50vnO8//RU6HNbGsNbnC/7f+/Fz1rRMDESih3rY09+zM2XJTxhAb+SIV3YoUjYc07fQsxmKC2TuFCw3PudtdN0bHr1F8YlQpDPYD+LjXEXeGB93UxU5R1K3DQ4NOC8E=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR02MB10971.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(3023799007)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?QXBw7pHaJEmIwJSybunIXZchhTKawyoc6IHIkMqGmai7yjBSWCJ64+O0?=
 =?Windows-1252?Q?8ko8q9n39PzteayKDnxBBbn5Zs/f/N8qpHr/ApuXzaGf+iPxO2a3ibhq?=
 =?Windows-1252?Q?988lKPFbLkGLRko4QCiEGhbx82xgO9YDsjt3LagaZe3/9AHuGWhzoENk?=
 =?Windows-1252?Q?VqHvp05ux0vbl2NklsMOueOBPPXVhLwn5cUJhwgrdIoV3noMIaOcvYoD?=
 =?Windows-1252?Q?P4k0NMtabH13Zf34u2yL8Xi/nZcfaox6X/wG7xi0ol7Gx/mMiwMsOUKc?=
 =?Windows-1252?Q?mxOvt0F9gbUnCJGWwG62L+iVEkw+BmrngGxwuBB0fGjKT2D2yKkFVitJ?=
 =?Windows-1252?Q?dYmNFOmo2NllYqTs0L758s2KHzhByw8f1gVM4bZKyjVTq4NQ2ruPWNVT?=
 =?Windows-1252?Q?6VTQsTH0HpnsQig/we7qgdFBiFbmD9MitonFnFRVLKL1IEblIWo5sHIc?=
 =?Windows-1252?Q?bP9v1kf66ORSHHNkBIltpzfx0WMKfai5vSeIj0cimOyx7fXtaYQFJabi?=
 =?Windows-1252?Q?Y0+uE8RWOAD1+6J0269KkmJgeJ0Mtofmf2tGAj+IF69u+ONKJg7ngYMF?=
 =?Windows-1252?Q?l3F7NIZtxCAPRBS1j2cm0To3tks+qSISifJyVL0GbEdRzCbdtqhkReI1?=
 =?Windows-1252?Q?ApdFZhkL2inGI2sYe0hhL5kBKnCSJVR4AUYfr1CMfUA4qqXo13hY8GxI?=
 =?Windows-1252?Q?CMaPWAD7uvxRy0dE65EpdRy2OlJhrFMwNEhTaQQc8TzIaSXafywuZWHK?=
 =?Windows-1252?Q?AKZRQ0p+bPkYLwE8RuTEePETYhWRTuTXXolLNEZtuQ0uIIujPtML0E5n?=
 =?Windows-1252?Q?2IchrgQvLM9UxD30y0QRuVpUGa9p5QIsQQ0oGMyljLUlyzJXqWzerlrx?=
 =?Windows-1252?Q?bwoXr8XHytNypnKPZDDQ+s9M7abA51GsQUanQgVRfRFMqorsU7J1P4KO?=
 =?Windows-1252?Q?yHlIOWU5Km/J4sSTRFFZ2Wn3jYenT3xyKvZnkJi+smIY08HRAFzSTmaA?=
 =?Windows-1252?Q?SBnpK+PE5yxj48L+HW2ybYbXzHyWI/5bi2NI5jlRxf8AwgMQOllh1/Fz?=
 =?Windows-1252?Q?H5+8QrWrKKhtpourYpqYj+f7cBvUweD1RXvrSsXANXATnowagmD7yYHD?=
 =?Windows-1252?Q?VR4z1jOdz4yWiENJ/PQFfO8k3QFwiYaymycY9qSaLm+WwlrNDE95IXeS?=
 =?Windows-1252?Q?wFOdYlJMJxHPsBptUzy0pUmpcdmc4ZF5AkyKwEDyd6E1LmWV9I0IhwYq?=
 =?Windows-1252?Q?CjBlCrPet56AaU7hFYic3mxEJxIUF6fzvEp+zzRny2rP9xbYKLfDpJY/?=
 =?Windows-1252?Q?9ehm1jlV0FUU3hPOqkqxH3mL2QsvYXhUJi0CRpU8U7xJvanv0P9tw9MI?=
 =?Windows-1252?Q?Hk5VXs2CLB+YLWJNRYWkyWrggjqYsN4BvfBBue4J26ZRqONSdFHL9Vwc?=
 =?Windows-1252?Q?te8Xo93jJdQvZYTL63LrCO2a7Q6fOv3YJB36UxpW3ja9u9mYiOF32sXz?=
 =?Windows-1252?Q?PPfj0lvSbEkU6TbtIijZMJW2XtYmjFIDIGkOyN11N1ZgYBlha/BTO6fJ?=
 =?Windows-1252?Q?TL1fPjdW5myy/wUXqFoOQTlOCNyzB1N8tIPJRiKeVkT1A9nUCckkPdVp?=
 =?Windows-1252?Q?55sUm5eh3ajtShKIcS/KkzymvzqPV4izY3DJdDiV4SsL3ELeGih18Vhh?=
 =?Windows-1252?Q?UEfA1CL1pFZrlP5V/ylibQg/vrPqZ7hv0FSg+4dWvIaNUAG2ul17imaz?=
 =?Windows-1252?Q?o9nUoF3/tV/th1fcNDXaMdsgyiHfMWhDqpNkzFj0p2VHz4yP9VcwWLEh?=
 =?Windows-1252?Q?JByvVotsasi6ofMGSBCO/oO+5faF8LpENV15oEPBP7u2b/CXAQdsSyZV?=
 =?Windows-1252?Q?hj6sMS6nTomZXQ=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	nHT1g3eFMIb5gze3Jan+t2UKkINPqZ67Gj5lOr7JKyTHYpyRyb9KjoDADumiPULXFWBP3bjrJRJ3OtFkAQqB+XnTWhBnNa5R2IHnWPlVbJuAhESRN2YVPdW63D/QTVMCRoFX9SD42HnJa0LjeGUxsDe/xhmsJYBb8ArOYhuN8knJ6Lcz8WSHa8/8IMvPQeYSdDYLDJWo4iBV4ws3Y7ljFVROOI4rNWUfddC2IslECBeFpHsxT29a4qYVqdrl1Pua/CYeJZd/Jq4Y3lKd0fabgytSfA69BlcY4dP58JW6CmB2ImYL4l1iHvmJGBEoOk4rI0Nr2ZA/X42r/n7EunHIbA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	edgGfISkNEa5Me6dZpozpCzpSzZl7t2BWTuQwGP32fi5twFCPUNDWz72M6yE43C3IVfqnAzLuHToMFf9xuLEJfqGP24CUWSRLc7372nvI3JASl7UnXySBV39xLU9RUds5YCMdm1eJordJQLdlCfyOIj9xbVT0rGetUswpFAKqITnAWnln5KAHuEAlCvnmdkBsW4J4Yb/tqJ/ahcW0AxSzuXgKPYogKWyDCK4CJ1xG3/7mBbKyHlLOk+QnlhDdYgt5JlwGrX7Q9tgi3OQlxhGy1cwF3KSCG+/78ObXichauVIn3pYQgK+99r7FOlJtgCXy08B7TSVwwNnZrt5ZWkD403Y9iHuicduwnNpq5MReESlfeVZBdDpH99xkG8GcUC0Zw48GLFwTQxbuQkHDzrF1NIcYyH410dsL1AlEWZkgoiacUq0Qm0xkcFqellerBlm8xDo9U6tnS/bRQu88HJY/iefPIHiQUfQFCtrL1G4WKNeIjkK/KojCZufWaVixrCM3Z/KbISfMIPJdw/Fol9klMmuS1D1ZIrqwACX+qdKuGdnbz7H6BC8RHwFAzLiZ+iOkwhHeZFNvsrnsqmDd0S9cqvJnYBY/0kdI5NWbv8lK1Xc8z+vmKcBRf99w3/6PTI2
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR02MB10971.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b447a6-17ae-4293-3349-08ded075f58a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 15:50:18.2132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Hp/zHHsgmzzigOC099ZMUt0gvNYlkKm7F6eiupgCztmWfKSveOJ1q4r9BXH+Fx88XEGJ3PPIB/H9lbBHYjA7GGwO7/d5Tn4ubcg/jARmqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB10076
X-Proofpoint-ORIG-GUID: FAz0sjZjX1qEZSdUpytiRh91bogW6oYF
X-Proofpoint-GUID: FAz0sjZjX1qEZSdUpytiRh91bogW6oYF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1NyBTYWx0ZWRfX7TW8DIcK5qCL
 rP5LEIGMQzftBeihtzkgcqHTuiDjm29JFJP2tk8zYkaX6JUO+L8hUwSFZdYL3QuHO9CuS1pMP4G
 CpgnKraUgqEdVtG/4wl5BEXFrWN8sqs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1NyBTYWx0ZWRfXyobzltyAU4Ji
 W1lle/DHfUjTljzPSh7njYfDZOcMpW0HWXAd8EtJ90QHcNMTe5fa3XepcM8Elk83WqqqPWXiQo0
 DnyLh0/x5489w5/EXrvLAkxW6C7G41OnTiAQO7S4K85Ui4UXbnUUfJrGqTCm1aaLQaYn11SHW3E
 pvIiIU8H4lKXv1e2AQhpFbqONQSmnzOq2DCFGGbcH1/3e2YYuEGHn9MJi1JQtDsBueYA+cIHgnb
 282zVpBe9TL7zfupZm5+jwXdaM5PBr05MYYrtoCQNXRi8FBN7YcdB7EdDv9YmvXIcEzDD2l+92f
 IOv1TsvZrZNMkWu8Ggzdrn9eZbvS1FSU+kJb9ccCfZ1qtgwWgCQZ6BNcG1USzY+YeFV26lh9IEU
 wW6PxbWw8gMZc+Ic0zI1hzaxNYTXMlOckS35OmqB2RDp1dW80qLN+OCXC5ZdtT27istluHhf8il
 axShg6egC5zhhUwGBvg==
X-Authority-Analysis: v=2.4 cv=YLSvDxGx c=1 sm=1 tr=0 ts=6a3959be cx=c_pps
 a=BlfeVxPAsy0N+at7r0i6FA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=N659UExz7-8A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=nZOtpAppAAAA:20 a=NEAV23lmAAAA:8
 a=28ZgTb3pEsk7fivFY4MA:9 a=pILNOxqGKmIA:10 a=bn7x_FpfJtc3yKQXRW3z:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220157
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jun 2026 15:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9897

Hi Bruce,=0A=
=0A=
Thank you for the comments.  Here follows responses:=0A=
=0A=
> The big one is do_filter_minijail_cargo_config. The problem is real but=
=0A=
> the workaround feels heavier than it needs to be =97 and I think we can=
=0A=
> delete the task entirely with a one-character change to SRC_URI.=0A=
>=0A=
> What's happening today: cargo_common_do_patch_paths() walks SRC_URI for=
=0A=
> git entries with name=3D set, and for each one appends a [patch.crates-io=
]=0A=
> entry to ${CARGO_HOME}/config.toml keyed on the name=3D value. So name=3D=
=0A=
> minijail produces=0A=
>=0A=
>     [patch.crates-io]=0A=
>     minijail =3D { path =3D "${UNPACKDIR}/git/third_party/minijail" }=0A=
>=0A=
> But crosvm's own upstream Cargo.toml already has=0A=
>=0A=
>     [patch.crates-io]=0A=
>     minijail =3D { path =3D "./third_party/minijail" }=0A=
>=0A=
> Two entries, same key. Cargo doesn't allow duplicate [patch.crates-io]=0A=
> keys regardless of whether the paths resolve to the same directory =97=0A=
> so the build breaks and the sed task exists to delete the auto-injected=
=0A=
> line.=0A=
>=0A=
> If we rename the SRC_URI name=3D to anything that isn't "minijail", the=
=0A=
> collision disappears:=0A=
>=0A=
>     SRC_URI =3D " \=0A=
>         git://github.com/google/crosvm.git;branch=3Dmain;protocol=3Dhttps=
;name=3Dcrosvm \=0A=
>         git://github.com/google/minijail.git;branch=3Dmain;protocol=3Dhtt=
ps;name=3Dminijail_src;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/third_part=
y/minijail \=0A=
>     "=0A=
>=0A=
>     SRCREV_crosvm       =3D "..."=0A=
>     SRCREV_minijail_src =3D "..."=0A=
>     SRCREV_FORMAT       =3D "crosvm_minijail_src"=0A=
>=0A=
> The unpacked source still lands at the same place on disk (destsuffix=0A=
> is what controls that), so crosvm's own Cargo.toml relative-path=0A=
> patch still finds it and the build consumes the source as before.=0A=
> The only change is that cargo_common now writes=0A=
>=0A=
>     minijail_src =3D { path =3D "..." }=0A=
>=0A=
> into config.toml =97 an entry keyed on a crate name nothing in the=0A=
> dep graph references. Cargo will emit a non-fatal warning along the=0A=
> lines of=0A=
>=0A=
>     warning: Patch `minijail_src v...` was not used in the crate graph=0A=
>=0A=
> That warning is expected and fine =97 please don't try to suppress it.=0A=
> It's the price of having two patch tables (upstream's and OE-core's)=0A=
> both pointing at the same on-disk source from different angles, and=0A=
> making them silently co-exist is better than fighting either one.=0A=
>=0A=
> With that, the entire do_filter_minijail_cargo_config task and its=0A=
> addtask line can go away. A one-line comment above the SRC_URI noting=0A=
> "name=3D is deliberately not 'minijail' so cargo_common's auto-injected=
=0A=
> [patch.crates-io] entry doesn't collide with crosvm's own Cargo.toml,=0A=
> which already patches minijail at ./third_party/minijail" would help=0A=
> the next person who looks at this.=0A=
=0A=
How did you get it to compile ? Is some information/steps/code missing ?=0A=
I tried the change and it errored out: The lack of config.toml causes cargo=
 to error out.=0A=
The destination has been specified so that the relative path entry for the =
patch=0A=
mentioned inside crosvm cargo.toml can take effect. The one inside is as fo=
llows:=0A=
=0A=
>> [patch.crates-io]=0A=
>> audio_streams =3D { path =3D "common/audio_streams" }=0A=
>> libcras =3D { path =3D "libcras_stub" } # ignored by ebuild=0A=
>> minijail =3D { path =3D "third_party/minijail/rust/minijail" } # ignored=
 by ebuild=0A=
=0A=
Reference: https://github.com/google/crosvm/blob/b04c13a65b93034010b20612e3=
566d4f9d83c4f0/Cargo.toml#L647-L650=0A=
=0A=
However the entry produced by my build is:=0A=
=0A=
[patch."https://github.com/google/minijail.git"]=0A=
minijail_src =3D { path =3D "/local/mnt/workspace/kraghava/upstream-crossvm=
/build-qemuarm64/tmp/work/cortexa57-oe-linux/crosvm/0.1.0+git/sources/crosv=
m-0.1.0+git/third_party/minijail" }=0A=
=0A=
The src path terminates at "${UNPACKDIR}/git/third_party/minijail" without =
nesting into=0A=
"rust/minijail" which contains the Cargo.toml for the minijail. This cases =
cargo error.=0A=
=0A=
Did you use a combination of "destsuffix" (and),(or) "subdir" ?=0A=
"subdir" causes bitbake to put the repo in a different dir that does not sa=
tisy the=0A=
relative need of the crosvm Cargo.toml.=0A=
=0A=
>  - LIC_FILES_CHKSUM points at ${COMMON_LICENSE_DIR}/BSD-3-Clause-Clear=0A=
>     rather than the LICENSE file in the cloned source. The Yocto-shipped=
=0A=
>     template is a generic copy; an edit to upstream's LICENSE (year=0A=
>     bump, contributor line) won't trip do_populate_lic the way it=0A=
>     should. Better as file://LICENSE;md5=3D<sum-from-actual-source>.=0A=
=0A=
Ack. It will be addresed.=0A=
=0A=
>  * BBCLASSEXTEND =3D "native" =97 I'd prefer we not have it in this=0A=
>       first version. Do a runqemu alternative as a separate series=0A=
>       and do it then.=0A=
>=0A=
=0A=
Ack. It will be addresed.=0A=
=0A=
> * DEPENDS includes wayland/wayland-native/wayland-protocols=0A=
>       unconditionally. Is crosvm always built with the GPU/display=0A=
>       feature on here? If those feature-bits can be disabled, please=0A=
>       consider a PACKAGECONFIG so wayland is only pulled in when the=0A=
>       display path is actually wanted. Acceptable to defer for now,=0A=
>       but please call it out as a follow-up.=0A=
=0A=
It will be done as a follow up. I will add an explicit TODO=0A=
comment to map cargo feature flags to pkgconfig flags.=0A=
It is defered for now in this patch series.=0A=
=0A=
>  * 966 pinned crates and a single BSD-3-Clause-Clear LICENSE=0A=
>       declaration =97 there is almost certainly licence variation in=0A=
>       that set. This isn't unique to crosvm (other recipes in the=0A=
>       layer are guilty too and I'm working through them), so it=0A=
>       isn't blocking, but please file/track it as a follow-up.=0A=
=0A=
I will add an explicit TODO comment for this.=0A=
=0A=
Thank you,=0A=
Keerthivasan Raghavan=0A=
=0A=

