Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A268CCD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 06:01:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86342.1781330468222545052
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 23:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Vfl1eA/W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D3pRHm1384291;
	Sat, 13 Jun 2026 06:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIGa1kOAUi+IbGYk0/12G3HAneUIQEhKKPJgYwTQhig=; b=Vfl1eA/WL+iSUk7N
	p199RuZbP0RGyJiFKMJogGQciSGT6ubcwu4fRf5omMdV1K1ytizCM8cmZoOLkeaz
	OLvDYWnHAFC9ukM2yQRmZa52YDvjjtOCznj84iLWVa4NFUYBFBmhc7VVzsa2kenZ
	V/45aENRFECR71SNJRWO43NlbFa4oX9i6eSY5zXw6GKc5nvbvhTf20v5g1yhGuNz
	3olTamtJTEKSf0JVupo9uItMoynv9j7abTH0IOZ/X/b6dDcb5SIE3vSC5zttNsci
	504KPcNI6/Iarl2OgZpubFfJM8+w+a64wBlRAf+zdCFwIXb/c/+tMe7VCNzgTFsq
	+WYnnw==
Received: from ch4pr07cu001.outbound.protection.outlook.com (mail-ch4pr07cu00106.outbound.protection.outlook.com [40.93.20.102])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9f899n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 06:01:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqYfdQU7OE1fxU6PM28IHUrMd4vexnsvUb/5aeIOaIi27vF8vV9RGGfI1sQqoEp6mBhFWupE3dyFW6Pt4pxG8r9En3oMJ+AvghofIiNhkHBgexkDLzX34JoiwH+fH3STKp6z7Z6Fxgqt5CNak2YA3N4ojkk9+t4Fm8M9VqySjJiL/Ae2vTMnXECmcNM+UF0z1nJN4KDINUJCg7hM111wrVEoiyrQ0TlF2BYqIqusGipWY445LTueCqsaM7O8jOCokHAOUhek+T1fndir2w6K9nb4XQW1hU5S1TkvbbAVKucMgOEFqanuYgXoYSamvl3JJE+e7i/p2xFczb66FF2GSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIGa1kOAUi+IbGYk0/12G3HAneUIQEhKKPJgYwTQhig=;
 b=jdaqm/I/fZeTtKbhqL9uwPYK17MdyS/fDCUwmXTR5ahMH4b153yd4p/bDr/1Bqsif5o3JKdALw/yAo2tMSq5iEAXsAExVKHRK3nBOwJBYjWQUf01H+4ZCjVgrQZ8HN0ZURYXZ8GbWrVABcqOTWmcgnMQ70YekMSfpD8u1+qdceO5zZZrvV9/ksS6xHij+iSoi5Fs9MDhbyHph3yJtNPuYKcsF7wAlcqJEp0LCOTvdOv+hteePJG7WiQ7DOfD/Fbd5ty9xNfUxPWjtFTs1YRM5Vvn29TuChovq+SHsIunW2s4onjBaGVGLzVAQnf7TOEu7iKqSRmSVf9LUK3PeyDABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 (2603:10b6:610:2bd::11) by BY5PR02MB6580.namprd02.prod.outlook.com
 (2603:10b6:a03:210::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Sat, 13 Jun
 2026 06:01:03 +0000
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168]) by CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168%4]) with mapi id 15.21.0113.013; Sat, 13 Jun 2026
 06:01:03 +0000
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>,
        Viswanath Kraleti
	<vkraleti@qti.qualcomm.com>,
        Anuj Mittal <anujmitt@qti.qualcomm.com>,
        Sourabh
 Banerjee <sbanerje@qti.qualcomm.com>
Subject: Re: [PATCH v5 1/2] crosvm: add recipe for ChromeOS Virtual Machine
 Monitor (VMM)
Thread-Topic: [PATCH v5 1/2] crosvm: add recipe for ChromeOS Virtual Machine
 Monitor (VMM)
Thread-Index: AQHc7gyNc7DFjp8gaE+C2yQWHrWc77Y7aCeAgACvk4o=
Date: Sat, 13 Jun 2026 06:01:03 +0000
Message-ID: 
 <CH8PR02MB10971E099D92AC22476523872F3192@CH8PR02MB10971.namprd02.prod.outlook.com>
References: <20260527191012.1125228-1-kraghava@qti.qualcomm.com>
 <20260527191012.1125228-2-kraghava@qti.qualcomm.com>
 <6a2c5eab.f14b93a6.79425.b27f@mx.google.com>
In-Reply-To: <6a2c5eab.f14b93a6.79425.b27f@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR02MB10971:EE_|BY5PR02MB6580:EE_
x-ms-office365-filtering-correlation-id: 6b578f78-e5e9-4b31-b084-08dec91126b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|18002099003|22082099003|4143699003|6133799003|56012099006|11063799006|3023799007;
x-microsoft-antispam-message-info: 
 y7vutNcql7xRw+Rb47kI8e1o4zi8IcGwX9u3a/Ecxb+LI+bttur0U4tQWa2imvx+9QT0syQrG+uDvFBWvLJvCr17O7uGwkrQ0Hj9Kn33cCgwSPOr1ybTrLV4cNe1yshQmA/DWnAKWCToqhA3vj6GEP1ZKOuElGPV2FrFFQlBvFpdGIJ++kCtmCMAzh+lIhjUKHr602QkwSUbk34ulrn5h5InikLXbQ/+fIBemb4CsyQzcPcEn3JsjvfaQSXO8bZEuXztBKddz0GyxWs8lhmwGL9OnAbirVgFfltLX9k7txUhfQhbTIMdM4yfExXVSeJ2PSfqBFqOTzQJEZmoHqM6JhpUSurK6+BvaBdsKivSrAB9SxFVJh381fsNmscg92d/RA6j5TS7edM1v+CPQKUZgkjqJST4DyfQiPp9k+6ev2cMnVFjbidDIvDDYsDt2wd10nzpUWRta9yvrzM7qB2zQlA2hLz3x3KQLx8QQG6XGV6yoXN0ah0FnCL8258NJyk2uopiAWys8djAnZAcymCvurzhO51Lg2+lcIm52vnw72SPKMTzxD+HtKNMwVu59UiwmqTn0EADMHoeFirbuUtu+8cZ/2O+yStzFtKwn3lS/TGU0PxMV7inVedx52ghW6UZzxe6PwuK6+5jrJVJqqYyIc2YNx8lZ1rI7oJVnpwP6sIrI4W9W1iUskN1RS7TQmFZL/JfWW+71EaaI0XpD818Uf/V/EqOc447HKMmha0oxPdsNZjTk2IZQtFUFUQgihCK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR02MB10971.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(18002099003)(22082099003)(4143699003)(6133799003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?xeQtPu5SdpuhHXAATdYnMgOfxPFN18qzfZjDkmYxYdlei41vedzizlbY?=
 =?Windows-1252?Q?prqt2i8M7lKkxlXgxryh3GQQ0v6j972ffXm58++3e6ASYSJR0AGDZ7pj?=
 =?Windows-1252?Q?cQPQLLbJEhXjSyHvX+bpoHAIdsJUxsMMPVyN3u5lKK6k+BfhezgNratQ?=
 =?Windows-1252?Q?hSzlXiOwv/OvCKLw8TPb7HXT0RoalnwbFJgloxHm5QiZQHndmEX760bC?=
 =?Windows-1252?Q?klqxIs3cmnUlfkKPpIdsWznRNCI9Y/TNZv4D63LnJ1tbib1EeNYZozGa?=
 =?Windows-1252?Q?kuHckuBfPH3M+raJ9y7AkFSFri9RVWOfimeKWptOFIKhOS/3FLsrfB4R?=
 =?Windows-1252?Q?y2IV1hJpNZGMgw6S17GoS9rCURFm3j6y+VwME9VBdAJlh1jn3tmfMzDD?=
 =?Windows-1252?Q?q36EWjy6wzG2BmlXPOf9WYkOi//5S2pXLxjW1wFR0FGT147dFoBAFIMK?=
 =?Windows-1252?Q?mnhZ/xCxnaiARdRa7yZilmahRetqBGKS1X6x+StmI2C9EvKveaOOXRiw?=
 =?Windows-1252?Q?e28mPfpgz/NUz4DzmETg2LwH+JuzwJ2pQLF1imk4B0O6uWn866AfIJTK?=
 =?Windows-1252?Q?Z0UTUoMx5f6jKkFulslg6oPQLeOl6pAwr0JldGKpF2+yATIzqlh33tjX?=
 =?Windows-1252?Q?XXRf91tNr3UV0fYQauSG32Pab48sIFLPiwNWu7r6T7tTfTR/vorIpncW?=
 =?Windows-1252?Q?rmNcUjlsH9+aSNIBlL3HohLsgL4mnJ8L2bf8W2njfOIQTz5j0Y5T4SSP?=
 =?Windows-1252?Q?n2bvzdIzdsoG6PWTXlikbB3PqhB5toaCIojSrZ0awet+fN1yUFrx+l7k?=
 =?Windows-1252?Q?fI6bVp6M7AkEacb3eGhFHRyH9s5qqIFAAeZ6jBqcGcwoGFx/UHh1KmJX?=
 =?Windows-1252?Q?HBnTr6vbmj1GpE6YmUk+p0tRcfm8epOecDZrMYDQt+GMRNGsXQxt32Om?=
 =?Windows-1252?Q?ZhybwMvGaHZGbiuJQ+LEaHSorXkluHBc6rulDlGA7YLyeg22rRdSXE56?=
 =?Windows-1252?Q?ZL+imxT7w9j/s67OGR1IC0Rn3paTLfgJGB3JouTCwAOu4PEo5Ejv110k?=
 =?Windows-1252?Q?tsHonGGZOgUnom2k8qsl+ABWP3BPr4dp2l3Ohi7xGpTGUfnGvKatAzQ2?=
 =?Windows-1252?Q?Rj55zZ+LGpRMl3QsSCr+CbEtWN4ysAmyVOCAum8qIW+T7nwnJYEGOrpk?=
 =?Windows-1252?Q?RwX7IMoMkncVEca5Z2diKNwmYaoG41AiNPJ+50LNS0iscO/SnmrPNlz2?=
 =?Windows-1252?Q?5EJvEZzvBxgfrrdEHzsi0GWox8F3ea7NusdTZvfaME0X3ivfeAH15Jc3?=
 =?Windows-1252?Q?WAxFHNvgG/D+WeMxUyzBvmEhgnAKP8we9eWZZhJ8wJhD3RRfcMtUvhfF?=
 =?Windows-1252?Q?LWX5TIhGNXPYMneh+5uKaL3exo+mCjhlIq7W8Bf23XvU+7Tam6EokKcK?=
 =?Windows-1252?Q?ZyJUID6lGEuyMseacwHa4aL8MSk9gDI4qPdaKLimkw2bGweNSyAFdr8I?=
 =?Windows-1252?Q?gVNbjBZ0ba1BvxlSl00FNzpCxTkMPl7sharlD751QnLa/WbDHZO+7T8T?=
 =?Windows-1252?Q?PEapfN/M5Vwl0UcmCD9FRXUcEMNBHwkZ75hKMv9nlRUbaeVaN6xg1xED?=
 =?Windows-1252?Q?OL/nN/jNKu1aoNnbEd7HmtapjreXQVTdeHomeiPNAtrCKhTa/TB/A2HG?=
 =?Windows-1252?Q?3QKmFWBsfzViWewKMmeuJP6Y0Tz7fR28/dq1xQar+YEXMcIxeJU2MJJf?=
 =?Windows-1252?Q?7j4EjoezT3NefEP+Uw9NC+kYfmo8D28r0pmH+gIaBlkkTp1d2kTp2A50?=
 =?Windows-1252?Q?5uR3FcPwB3wnYcxHaBIi+BV0flAipsN5x/6KvsqksuPKVGwMSaAPpGA3?=
 =?Windows-1252?Q?huIh2LLgH1potw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	THns1XLhf9WvmLLeVE/xLvDD2jIbZ7W2c1+6n5goZEMqv05WyduZx6gOty4lzIRQKAHCK3TMk79H6TT0Db2hqHJo+t0awJDgHAV4Ew9p1dFhAUuFJhYT55d9Tj9W+SJc68mzAgrQ9PKjp90130LZk1zlO3O1r9G8Mbp3XyCnO8tOmA1IeUZo3AlSly09xT6XRlOfDgvA75EQI3uqTcbEYXuHisUrrR1gjU2k+4G8uzeHHtvf+ua6MF9N+1cqprljiyuZLcocAKwhA4Vl1UDQSf0R9yT0Yh8bji+C+Shdj727zqyLm87Ox+dbL0Z18MCQdvOhw37wkonhb6J2jgSUWA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	28BWlmAzQUv1LayclsZzv6sKrpa8f5nQy9yC95viLOgR0JoozB0ymmlYGXGyGwvYmZ4Um2WKdFKOyycqInakGRSeF0R9L8SUuIxUsJFJZ3ITp2IH9T2Zc9b5MoZRS2aQ/ereBoMy3odQ/GnCuZuAOt/a0uyJO4OT+zqZYTa/Vk6tUtsRl+cqhuVrdI5uojLICSvfqrSw1vhNOO+ZmN3htTM7wR/cVQnKnwpDu7L2cSnm4nA6v6dgwmIuvi2cRyquNK+Dw2lDBh7ueYwEiFRxu9+3/dQ5hfzZJQofvoAjxoDEIP4j6eR/9AK6UW8yujk832788GA/YkYwm9Bvd7qWRg3puNUw0aE76V6+SB6iFfM45gck8zwm8XEgosYJS0kb0gizykj1d2HB5hBNTeCXHfbgQJC6vPOn4IU6mZC5nIJQAFUpuSp2LkoFQcd+elr2Or8qIgy7vEZyQ44ItmjMZCDq6DUgY+FbVijMLkd9pqMzj5o1kIT9E+VEmXeD+w94enCJsNUBd7u5zEgYmO4kC39ax7X+wQbnD5jYM18Quk+iA6/Am/UB83EAQu1ZFEPuFP6yAxWWaRZ5ViYh+qeyu1Y4wQCEq2YpUvcFELULNyR2du5gEipCHOzlrn/lpLGH
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR02MB10971.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b578f78-e5e9-4b31-b084-08dec91126b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2026 06:01:03.4510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K0POxDwekNJ3rnDDAj5TLo1Wppju+PUHR7/ARmSYrwbEJ/S0+qgvlqy2GCv6Bz43d+HLlDg71cTd8vm+gAp5EJsmf3oQRwOwC9UvYf1wR2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6580
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA1OCBTYWx0ZWRfX4F4O6eVprAaR
 b/799EFRIaiNuTmCYz0sFDBlwcDHmGlUzz+SrCMnZRWPsytWJszMAjd9l9LGoCMauxYGD6cufE6
 wMSMDqnkhPjNimntjnDcigkaTKGMhR1NE3CDgpqnCtWigF14c57N58JpOzCCtKCoFmjikfy+oxq
 lrK4aXwN215K2ecxP2kIkMCV4E69PqeH/eAp67qoIUkuBdMzQN0y7kZ+2Pl74wkfbkx1uF1vPzX
 OO1sXozpXS07dphyEUqlCw2xLXr3sH7Nn+xzAZmimakeRUjsTOL4Yb3j9aM9PWMRzxLOjZmwfgD
 Ns9WU9nyPI4anpjckLmNjR6DzPEz92FXM75TmOHHS6QK68WwU1yQTCg8qnkibEXKyqjqXtgWSGv
 o2v0mBbZPCjQCuqpbxbGhvAO2i+tCRuYyLTkibMV4hvTYxE9G3MohzahLL+tEutZdisYPb1Fu/H
 Oi5rfMrCHfu72HuXoeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA1OCBTYWx0ZWRfXzNtlbYHDziP1
 4gfn82KnLkE7EzYy9z7twTnfTccPrk+I24H3XDhKyFmYwh85SX5KZ/N0fjAp7bpo7XFu/g1Pz6N
 a4LVgIWggsZL+TCGNbmAE0II++xGplQ=
X-Proofpoint-GUID: J3aoeq7egMKNh5dzPWRZHfZERj2j7Plb
X-Proofpoint-ORIG-GUID: J3aoeq7egMKNh5dzPWRZHfZERj2j7Plb
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2cf222 cx=c_pps
 a=NmAR2pCDCROe7PQXUXaH1Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=N659UExz7-8A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=Oh2cFVv5AAAA:8 a=NEAV23lmAAAA:8 a=cm27Pg_UAAAA:8
 a=hM7oAIGKtgDHbkgT7BcA:9 a=pILNOxqGKmIA:10 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130058
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 13 Jun 2026 06:01:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9886

Hi Bruce,=0A=
=0A=
> The other VMMs in this layer (libvirt, xen, xen-tools) all live under=0A=
> recipes-extended/. recipes-devtools/ in meta-virt is mostly go-mod=0A=
> tooling (go, go-distribution, etc.). crosvm fits the VMM category, so=0A=
> recipes-extended/crosvm/ would match convention better.=0A=
=0A=
> Not strictly blocking, but worth moving in v2 (or whatever the next=0A=
> spin is called).=0A=
=0A=
Ack. Will move it to recipes-extended.=0A=
=0A=
> The comment says cargo.bbclass writes a [patches.crates-io] entry to=0A=
> ${CARGO_HOME}/config.toml using the SRC_URI path as-is, without=0A=
> honouring the "subdir=3D" in your minijail SRC_URI entry. So cargo tries=
=0A=
> to build a path that has no Cargo.toml and fails.=0A=
>=0A=
> This concerns me because meta-virt has a number of other cargo=0A=
> recipes =97 netavark, aardvark-dns, podlet, fuse-overlayfs =97 and none=
=0A=
> of them carry an equivalent workaround. So either:=0A=
>=0A=
>   a) they all benefit from the same problem somehow (e.g. their=0A=
>      SRC_URI entries don't use subdir=3D), or=0A=
>=0A=
>   b) they do trigger the same cargo.bbclass behaviour but happen to=0A=
>      not break because their secondary repos do contain a Cargo.toml=0A=
>      at the SRC_URI root, or=0A=
>=0A=
>   c) cargo.bbclass has been fixed in oe-core master since this recipe=0A=
>      was written, and the workaround is now stale.=0A=
>=0A=
> Could you dig into the root cause and confirm which of (a/b/c) applies?=
=0A=
> If (c), we can just drop the workaround. If (a) or (b), the fix=0A=
> probably belongs in cargo.bbclass upstream =97 and we'd carry a=0A=
> documented local workaround until that lands, rather than a sed-script=0A=
> postfunc with no commentary on why it's needed only for crosvm.=0A=
=0A=
I re-checked this in current trees and the result is: (a)+(b), not (c).=0A=
=0A=
  - cargo_common_do_patch_paths() is still active in oe-core and is run fro=
m do_configure (cargo_common.bbclass:207, commit=0A=
    684a8af41c5).=0A=
  - It only creates Cargo [patch."..."] entries for git/gitsm URLs that hav=
e both name and destsuffix (cargo_common.bbclass:149-152,=0A=
    commits f871d9d6094 + 684a8af41c5), and writes those entries to config.=
toml (cargo_common.bbclass:165-167, commit 684a8af41c5).=0A=
  - crosvm is exactly in that path: it has an extra git dependency for mini=
jail with name=3Dminijail and destsuffix=3D...=0A=
    (crosvm_0.1.0.bb:18, commit 52c76179d), and therefore gets an auto-gene=
rated Cargo patch entry. The local sed filter is removing=0A=
    that generated entry (crosvm_0.1.0.bb:36-55, commit 52c76179d).=0A=
  - netavark, aardvark-dns, and podlet do not use this problematic secondar=
y-git pattern; they use one top-level git source and crat=0A=
    es from crate://... includes:=0A=
      - netavark_1.17.2.bb:11-13:11, commits 8e45045c8/8c599baea/498a53037=
=0A=
      - netavark-crates.inc:4-6:4, commits 498a53037/8e45045c8=0A=
      - aardvark-dns_1.17.0.bb:11-13:11, commit 508517af3/cd6d4550a=0A=
      - aardvark-dns-crates.inc:4-6:4, commits cd6d4550a/c08591fd7=0A=
      - podlet_git.bb:9-12:9, commit 7ab697991=0A=
      - podlet-crates.inc:4-6:4, commit 7ab697991=0A=
  - fuse-overlayfs is not a cargo recipe (inherit autotools pkgconfig) (fus=
e-overlayfs_1.16.bb:13, commit 19a66be0d).=0A=
=0A=
  Additional conflicting observation (important):=0A=
=0A=
  - oe-core commit e955099a2e added subdir handling by appending it to dest=
suffix in cargo_common (cargo_common.bbclass:157-159,=0A=
    commit e955099a2ee).=0A=
  - But BitBake git unpack semantics are destdir =3D join(destdir, subdir) =
first, then join(destdir, destsuffix) (git.py:670-681,=0A=
    commits 66953f06fe, 3e7f8afeac, 25e0b0bc50).=0A=
  - So when both are used, cargo path construction and actual unpack layout=
 still disagree.=0A=
=0A=
  Conclusion: until oe-core lands a proper fix in cargo_common.bbclass, kee=
ping the crosvm sed workaround is justified and should=0A=
  stay with explicit rationale in the recipe.=0A=
=0A=
subdir is interpreted differently between the two code paths. In BitBake=92=
s git fetcher, unpack destination is built as <UNPACKDIR>/=0A=
<subdir>/<destsuffix> (apply subdir first, then append destsuffix) in git.p=
y:670-681. In cargo_common_do_patch_paths(), the=0A=
generated Cargo patch path is built as <UNPACKDIR>/<destsuffix>/<subdir> (d=
estsuffix =3D os.path.join(destsuffix, subdir)) in=0A=
cargo_common.bbclass:157-160.=0A=
So the same SRC_URI parameters resolve to different filesystem paths, and C=
argo [patch] can point to a location different from=0A=
where BitBake actually unpacked the repo.=0A=
=0A=
> chromium.googlesource.com is the canonical source. The=0A=
> github.com/google/crosvm mirror is typically more reliable from a=0A=
> yocto build infrastructure standpoint (the chromium.org hosts have=0A=
> periodically been touchy with cgit-style fetches for me in the past).=0A=
> Did you consider the github mirror? If there's a reason chromium is=0A=
> preferred (e.g. it gets fixes first, or has signed tags), worth a=0A=
> one-line comment in the recipe.=0A=
=0A=
Ack. Will be changed to github url.=0A=
=0A=
> crosvm doesn't tag releases, so "0.1.0" is arbitrary. That's fine =97=0A=
> we have precedent in the layer (kvmtool's PV is similarly cosmetic).=0A=
> Just calling it out so we don't get bug reports asking why we're=0A=
> shipping a "0.1.0" of a project that has never had a 1.0.=0A=
=0A=
Ack. Comment will be added.=0A=
=0A=
Thank you,=0A=
Keerthivasan Raghavan=

