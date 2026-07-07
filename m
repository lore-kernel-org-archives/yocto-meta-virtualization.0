Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630CFC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:20:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.173143.1783430434619414472
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jul 2026 06:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XLkTVGV+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8hWF3755535;
	Tue, 7 Jul 2026 13:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqqjEuUcSMKgCIxnD3nVP/+eUUUGZJCt5OW76kpt6GE=; b=XLkTVGV+CDlYTbI3
	k+cCX/XyWwDOgZZtBe7ZNz1Mi3IR7t03u5oYqDHWUVs3u7WCqpjemUdDuUIgRCo0
	xza0+CX9Y+QJKfALhcTrzsU7Hb/LTqemHjIjNREO9+TvvnKLqcU7Z18kfGLVeAUy
	ZsZUYqCsNsmxqLtcVMGNtCBglrAjIrSDm1pfjVN1Z2VKKnNn4nQtPr46SeFOPMkl
	Q9REevmqxnge6qcCIBMGf9hiCjG0NTHDR/FW/ruxDrA8N24bNo4zxIqPEhmZe0Zn
	Qx4rmXLcZzelF8bdwO82+TsUnOcPLjaAuWQbA/1OAsaZuMnv55hHAgr0P6lQQ8o6
	WR98/g==
Received: from ds2pr08cu001.outbound.protection.outlook.com (mail-ds2pr08cu00107.outbound.protection.outlook.com [40.93.13.55])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep19qg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 13:20:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoi5SaGvYD8KL1Vo0CrerYsNZepBePrThVmi450eQ21MwD7EBuAdO/qAS+qoquxO9v/WkRQR4kzqauRTL6Yr6I2PjhjfddMPEiJrE7Dpo4/ghrYseF4CxXjCSqHcsewKPH2eYSwipq7egveaA3diVdAzJoV10RrgGdHSySB2LJRsLmlKQ8GFl0JgTMZQtH6brauPlI9U6TRA4w+VERLi3REMMTqjQORyUqL9DETLSlz7MJKrqMqFXZIBX0VS9n8qBXuDo7hVZAFou2tuSMGwclkZcG+1VEKc6Gm879I5jXx5UOCupMO/gJaGZinOPhjvbRuycWKZzeBsEHeUavOfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqqjEuUcSMKgCIxnD3nVP/+eUUUGZJCt5OW76kpt6GE=;
 b=fsYPiv9V+o6fNB96utJ0lUyWTcJvEAUQBFnzvNojHBPzgkE68/4JqzOvkoVAAQDqa/SNLiLsNolhjTof7CQfYn7YN9tXAqYfxEzjGxY6Gh4X6Gf9Rb1g8TQ5kD4t8uf2SXkP9a8J21qtoMxod+lSV3PrShoLz7yg+xBhWLcPJ3+3ADifaT8uc42W0KOm/6kPvHtHzvUj2VAG5V6keDvWiO5DHbqnQZCzgtSR+U2qk8fTmbL6/6/otmFjVJx4lA0G3AjmF1J6jThgzEjDyoKMhjzRhsowx8npmXmsRhzxSmP80k88sR8b2AOK6PHDmWWpejpXrNAi9um5jXpiKQ4M5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 (2603:10b6:610:2bd::11) by SA2PR02MB7531.namprd02.prod.outlook.com
 (2603:10b6:806:14c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 13:20:30 +0000
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168]) by CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168%4]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 13:20:30 +0000
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>,
        Viswanath Kraleti
	<vkraleti@qti.qualcomm.com>,
        Anuj Mittal <anujmitt@qti.qualcomm.com>,
        Sourabh
 Banerjee <sbanerje@qti.qualcomm.com>
Subject: Re: [PATCH v2 1/2] crosvm: add recipe for ChromeOS Virtual Machine
 Monitor (VMM)
Thread-Topic: [PATCH v2 1/2] crosvm: add recipe for ChromeOS Virtual Machine
 Monitor (VMM)
Thread-Index: AQHc+vsFxbnwu93/BUe2rsEco5rHo7ZG17OAgARDlbiAAN57b4AAMCiAgBYF90o=
Date: Tue, 7 Jul 2026 13:20:30 +0000
Message-ID: 
 <CH8PR02MB10971E2FF7E737B8089C33503F3F02@CH8PR02MB10971.namprd02.prod.outlook.com>
References: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
 <20260613060743.3120135-2-kraghava@qti.qualcomm.com>
 <6a360c2b.eef12218.262e9b.f8ea@mx.google.com>
 <CH8PR02MB10971460B68EFD02FD19E40DDF3EF2@CH8PR02MB10971.namprd02.prod.outlook.com>
 <6a399fd2.40ff4c04.83ff5.dffb@mx.google.com>
 <CH8PR02MB109712F19227670A82BC626ECF3EE2@CH8PR02MB10971.namprd02.prod.outlook.com>
 <CADkTA4NykhXNe9xahCc76OBc5B4D9TfLCHSw847Y9JHJnx2=QQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NykhXNe9xahCc76OBc5B4D9TfLCHSw847Y9JHJnx2=QQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR02MB10971:EE_|SA2PR02MB7531:EE_
x-ms-office365-filtering-correlation-id: fa804cef-8a8c-49a6-9d74-08dedc2a8479
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|38070700021|6133799003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: 
 yKeY8FEjwehum5YZX8EGvseU4RmU3Fp/tacAhNalWHYEZbs9P0/2h2n8Gl2LGIM9YgveSvqzm7ZCKSiCCPcslCDfW5VKoxZU+UH6kvDICY3VcCrqpcy/B34yHsxDr0soAoVU/ep4VENufBqRBLSiQuezY0UMbjo3qjOyzxG2hk43G2/HXgQySb2+7mXGb9fFA+Jy9jw1J0MUuigdj58R2thm7LlY3d1anLQbihc4E5LMEU9tdbaxfMTgum/C0wP5OedLd0Kd7r9l/oHIh7tIoV18Ugn48dovMoi3oZQhTcp617Yz/nzBSbm9/Ddlc4FIIZyYEL/TFKemBae15aOCcK0gD2SnQxKyjGbmEPWWVXetjv1rNkCx9RJFvBZRLDyE/3Z9tNQLFB4o/DQgPP3bBEUMIWgZBK5dQxD8u04QcvTRZ8fk2pxRNwPOQr3hsB/mMIiVM6pmepO+4L8BGJTxJjzXtIpGw42H/NHWarVEMNcCStyZN6Got39qEw6qj7HLzWYyZv8g/PVjQZUZsHGfmmRFm9eSK6m8xCE4OxfJ6v09Q3i2hBaNMTqZTXG93PwDswgv5ScceKxL9Bf/N69QeCHi3pBgZCVBJuEL/ddP1+zJYM1EsHjhzQpJR1aJQLVtfNXSx87YeDNiK7mujqSyIk+N4qnTBznAfx/YNR6x5Df1/RzeusSewOzzOhQ3ribNU0F87bYmgCfCdqIyKi+WPMiJgUb7L8aqabMmjg+KErA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR02MB10971.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(38070700021)(6133799003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?rljHDfPEL5DET4YT96EAuGZ5WnD36H69eJUGJ9/qyajRRCVaP6xiWde8i0?=
 =?iso-8859-1?Q?j0naM/DYX1fhP6nvHhhCRnIEGMgrfpp/dTV28m8T4adaIoquX+qi1BFjwe?=
 =?iso-8859-1?Q?jxioXluQHirM7yxqWc3uQW+kDRwxWrEPM1Papo96PbAVlfJbn7CfPFVr8E?=
 =?iso-8859-1?Q?55u0ct8n6ol5KCM2NOD6rHnnTsHUxfwcxUmrvHRipoAx+J0S49hkchyBpK?=
 =?iso-8859-1?Q?q032tOoxks5Kg+rEXB5cN3ccrPXxXjEOC9CXlcIjlMiNl1MN2kDKh6GaE1?=
 =?iso-8859-1?Q?OF7PWHeiNVnZRuqQRleEK8veWfkHEqsG3jUAHnwqXmMjt1AVgjRZ2vCoVZ?=
 =?iso-8859-1?Q?lSvxK+iyTTq6ONzzz5ujNH0Xw4aLPvaXVkCXGlIQj28k8x6IflV2izxzr6?=
 =?iso-8859-1?Q?+QhbFM5rR1HTVm0ywPteZG70za9j0L9mlwvgV8orDTyT/I5t3o23Td0iA9?=
 =?iso-8859-1?Q?BFcFRKKuYXS3/aE9KckxWsxvlQPD17+fzekSkhVxNea2oTyqP0q/DAUiqC?=
 =?iso-8859-1?Q?o6/yuA4u1EXqCaiWEtiLqNIiD3XrMm+WV1fKdAzMjZx5nuXmpN6uyxwKpO?=
 =?iso-8859-1?Q?YOW9dsbUDtqV89YjjquWDU6TNc6dEpvyLU0eryhOh6am8H4E1ipUICcy2n?=
 =?iso-8859-1?Q?9DUNRBf2g5CC+sxRel37A+UxrIDZyjE0jxycp5qrWpmYvtry6ZwnpfA9h0?=
 =?iso-8859-1?Q?n8kKMCM7SMVqJ/ZPXpmUV//yLlo82UBnM0DL3kvGp/WCDkGNiojhV6evzC?=
 =?iso-8859-1?Q?x/OUBSGLDwQ/zTFW94AlSAF9Lx3s9QxbtJkU05mZkc8n7kPbVoiYSyrD0y?=
 =?iso-8859-1?Q?QgGWE1AyP/nwXOnYDBzbAa+/2ydGn7TMV7tXck2+opDiIC60dHM6ulDZq7?=
 =?iso-8859-1?Q?7PvYxnL4QSvw8NrBZ1WSby9wD0bic5+EE2cLD5gqTa0WGRV68dSU879nCC?=
 =?iso-8859-1?Q?6y8WokaUOhpUFiIiS7CbunxIo/zZFza1DC5VlaVK4O0tMw7axiDcI87+K5?=
 =?iso-8859-1?Q?CpKaIrk+6uwf8wW0LayZFyRI2/YI5P9Lq6RUfkmShPSln44kjwUVTwCVSb?=
 =?iso-8859-1?Q?p8/eHVPQ4z9rs9gP1HujHRsbNc5IqgBPvAsisO/jPeFhg3kFQrcVvxvB1W?=
 =?iso-8859-1?Q?XW7FCxw/aYXZFeXAkrtS1Lfg3pbJWJjhBj7PJtKKme9SmGPV10PJNewhvV?=
 =?iso-8859-1?Q?I9ufX6Ci9bxXJtYq4tU0ycfnzI0nYVQY2HstiPxxWgbZDqtsQj9SAcV3nT?=
 =?iso-8859-1?Q?pPm0SxGp3xBrJ/K+/EQwMOVgJnFaurO6+kbXcypn9QnNNTaSZ55JcbRdt9?=
 =?iso-8859-1?Q?0sgbrru83mMmGZ00RUdEkjciYu7ZY9kcs/kkyyS4rpQ+sYS5IHOxxHp5pW?=
 =?iso-8859-1?Q?MUAhPpjHznPH6dSP/SPiQapQkj9r6Cla5tl0tqe7QHM5xPGqngN53Gfv/Q?=
 =?iso-8859-1?Q?9YZnS/+YeH9sRMCt5VIwUowq3DW8yMv0hqqV7bva3XjIqJyK4ISvj7zX2V?=
 =?iso-8859-1?Q?rp86WVeLkHVL8i5JSdhqRvpQzrDWAv4RhfWelzNFdAE7QOqT4RCjLvIR6s?=
 =?iso-8859-1?Q?h6ai2B6aZJO957QVb+9bJawVHshHd/OafmF/fWKt7op8iGS+PbYak8v5OS?=
 =?iso-8859-1?Q?oL9ICjL+Trvx66JSYD+Md6HCA0IeizlSvhfToToLwnA6w3zx8APjlsubk/?=
 =?iso-8859-1?Q?O8iZ8MS2iFwkgl7XfPr+tBC1hX+ZqTTj/lu1E72kFtYw7bn+ruz2s67p/T?=
 =?iso-8859-1?Q?Bc2PfPq7wUbCxW5k+H2aXm0ABuiEGEz78ilzya3lvYJWucSdi3fwrAmVAy?=
 =?iso-8859-1?Q?dJ++RJxmsA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	sDrAklJ81/onYZLc65H0iVvKvlG9CKNcONUxFUPtsJaqbuYwxOa27HCLpG9h7aGEFbaWQ1XIFYPfdHWHMWiyqwkZks2uam1XnU84MfWbFxWVYrLfLQY25URU9ZDPANeiI7rpbkYQq8RG9DLnAqKSCiBmw79W4VQC2k7hxP7iN/hWyGb9UJyQ7At+S2VWh8r6otXuo098pqax+G+LPOd+tzoFtEf9XHa9xIf8rm6eBtZXCTHQ39Q4xCPO6TstT+xfVbDR0nmktpipfXJK6hJvu2u/nv5Tbpbt+1zWrwuIr+tIIw3Ptt8XWoi/sQcqngcYQZOiFOJvzc8I2FhioopbBw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	M8BTKFgomiEIRRj1eVrf0nC9FKfwsBzkbs/aW1eG3B23scQv+KGrzoq1BgoR9H7TDYPk6pfWLcC63uHA8PSTq0ZkCPxQesH7HPG3Fg85JzsXz976mcE59AIPrwjKsjAxhm367Th8XqKjmKft3JNu+3lGuk2KDf7o1UL1eLMeQdLHLcjTMosaa73SsAuIagNOq09TGD3X6XCXYLJkxgYqs/uS58Lp6e8asFqjaeS6rtIvO4inZwfSqSg6VTkXfBjHhf/beS0nI3SwJXhbFzCOuB/yr/1PNoiRX2jVX9o2eLb+IQsr3gpwM0Vy0W6SEDxnKblt2g+TvyUgsbtaXS22LpnVzS3eTNIkJ1dk+935j1ffGHRxzc/t2/aVLR4+xnzXw/gEwhlzSUyqE9v0SvDWl/VoV9CEHJj22zqIDMtuE5I0jLBRlTBSEmTOsadsYSm+KQZP4kpYnUkRSpv12EmMeQLqEudnRDl8Nn3DIc2sPPl9OzO9ha1/D/StHUegZYCVUXi9B7gr7IPkuxW4gQffbHz7EDOJ1ix99YBg8/WAxLJBZ/PA75F3P4JVz7Oj7Z5CGG9JdZ9e9uwMCgPg1o/zUk3lsnACCjtprRM7hLsgsDzSUxf3eSPx1bXjZ+Fe8H3i
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR02MB10971.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa804cef-8a8c-49a6-9d74-08dedc2a8479
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 13:20:30.2343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KvZ94twIHhX9K5bZM7j92cFSDfEMUznwAqs6RGLpgPMAnyRPgVUGcOgjPNFO7751qxeXwTmlQOSql69NmgRu8D+ioW76Cqtpm35l6/bjU/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7531
X-Proofpoint-GUID: DcTsKjGr7NwVCLgvReq0LXjYDmChmlTD
X-Proofpoint-ORIG-GUID: DcTsKjGr7NwVCLgvReq0LXjYDmChmlTD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMCBTYWx0ZWRfX0URygZ9KkRFD
 b6xoYCmqgGnFyALugVzegvwMCpZtS0w5UfFZroRhjbqOaUInDRrli9VWb8ivGXIwDyNnlfcSMZT
 5OMb84w4GN8Y7SkjqgxmujmclgpObOCdYblWZjyrWdFoToNutv2KyHN6Y03OQZJ6GSYzTNtJfqU
 nbaF+zefD3ZGVH03VNHeUJ6N7t6idzAjFuRuegt8gwhFlbUQcZ37qLB7EXW8zF/zutuCd82sR0j
 jLb8fiOgsN99wOw0tjjhMYLPMxFZ/zJYUOwatvOejyDw2t/NuNcB0/aGCJfDJ82/0PkyfR1aDoF
 xYUNZwfwADblSKQ6youK8zZamhbAg3VrXifhuppso0zCpkj+SSnG7lFLS5zefqEo2/0mFtiJg65
 i8ZC6vYcDhSgSDn5lEQQGv/fJOP4F3Z3cczHZgbcEv3QkGgHBNWqPR/W7s7YqOHatOwQf+mFMoh
 KPMg80bltlaTJEbWJ6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMCBTYWx0ZWRfX282OAc0EkuNf
 7BrmirDBOeJaocUEgj1+XbE0CaUs95z5aW5TcGlBCVJZSOQh4mh5OHB8Tt1X+sffSW/qsxLatAF
 WOl/Unw0a1YA4jYPs5Ldd4c5cFmeHfg=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4cfd21 cx=c_pps
 a=vkEPmp//vMHCVjW2JM8fXA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=o1JoR_qQpSJbh2oIwvQA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070130
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jul 2026 13:20:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9939

Hi Bruce,=0A=
=0A=
> I value simplicity. Passing the sysroot, which is a valid option to bindg=
en is a single argument and fixes the build. No extended researching of var=
iables and dumping the environment to know what you are passing.=0A=
>=0A=
> I'm curious as to how you hadn't hit this previously ?  my build broke wi=
thout something fixing it up.=0A=
=0A=
I gave up trying to reproduce it. Will stick to your recommended patch for =
the value of  BINDGEN_EXTRA_CLANG_ARGS. With your recommended changes the b=
uild works for me. Will post a v3 patch set that addresses all the comments=
 mentioned so far.=0A=
=0A=
Thank you,=0A=
Keerthivasan Raghavan=0A=
=0A=

