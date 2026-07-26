Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C9FC531C9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 20:24:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17311.1785097458936101768
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 13:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TuH937Lx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QJvSKu1436657;
	Sun, 26 Jul 2026 20:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F2a8Yc5jYZM7UlL2jZbwSn+85t1hZhgLvlhogsnGkdQ=; b=TuH937LxtPqH4N1r
	pMfK20hmJuLv2u9QUlFvYmMipr3TsLqJoCATMU57k7ZCaf1xIY2K0XOOMUGtzgZV
	lZJPZ1H3dGjjAr36XKLEXTWWKkj8ORqtnP2p+ufDTyhjzJGM/cMjcMHONpQW1ctJ
	dc5yY1GJtYaT4CnrE5d2Kw4pNrIEl2F4h7+OrXWbbNz3aNNDG9rgRPjknfCb8V8q
	Oh0eVXFm69y6qiGlXZF836O8tqkzrbjPOAMc+0rtXwE8EYrQ5EZIrkIvifHlsfuP
	tV0PRAwNj84e4DOU8baWjqhw8tCR+ut0XXtsawpChsr9v7I3JoruOim1QAuFpKGB
	LQsszA==
Received: from byapr08cu003.outbound.protection.outlook.com (mail-byapr08cu00302.outbound.protection.outlook.com [40.93.1.106])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7ukqv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 26 Jul 2026 20:24:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtSuSnyaDC7s9a5HPIXszxQgPpH3uOR1NKkMpcd3C1oos7RQ8jA5e5ANx95itx3q8k4pDssNVdY+v1fmnaYrsWkPcF872W9Y4IMtiBjm49O/0CbJiXFCI6nrKOM3TJllSPHsjeWRbQGhezvfxc5MWSApVIJ1AsYFdE/aYPGiNsdub2JhM328Wc+OHbHSBXpXKanG0ITuZXy8/zMdoIoynO5wL9i38MEa+RZOyz3+87KFqm0ZZ3h9fcm1lLWil8686b8YeoHXt9xeuLeprrabAIU6ZbEYTymLRM4qDvZaoiqC7b0hg6q+/Sr/xH/cHUlqkaZQiK0VQ512FtWnDjcGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2a8Yc5jYZM7UlL2jZbwSn+85t1hZhgLvlhogsnGkdQ=;
 b=sO8gRUB0A+xtmHGbxcrWCU/re/mmyCjClmTpVEL6V0B/zZ9FSBQldqtKJXDN6/ne8VtN1rFfsOvhC/CcLiCxkbTW9J4iGw48Aqoz3Dq0UQMi1zTxJY89sT8M2RaD81MfJdKmLIWcDkByV7ItyB/Y4ImObruUhLX5Szn0b+aYIRU9dKcWnBN9TRUzE8h98MUzKKLzmyMNIWGNRK2BiUOFNo83eJSPg0XYdcj4zzAxlBk8x45b0ykaF3TLgpKTOUQK8js3YgzyRMNprGuRUKFC1gi46rl9Cai3s5gew9eHUuXGv9EJRJVPwRZvdcKNTG8nD2zbNfBJApU/9ASGI5CN7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 (2603:10b6:610:2bd::11) by LV0PR02MB11565.namprd02.prod.outlook.com
 (2603:10b6:408:385::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Sun, 26 Jul
 2026 20:24:14 +0000
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168]) by CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 20:24:14 +0000
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
Subject: Re: [meta-virtualization] [PATCH v3 0/2] Add crosvm recipe to
 meta-virtualization
Thread-Topic: [meta-virtualization] [PATCH v3 0/2] Add crosvm recipe to
 meta-virtualization
Thread-Index: AQHdDhPFinHIOUQoBE+CxmCIU8ioP7Z2/JCAgADmkMuACHmmcg==
Date: Sun, 26 Jul 2026 20:24:14 +0000
Message-ID: 
 <CH8PR02MB109716B7DAAAE451F5B139487F3CD2@CH8PR02MB10971.namprd02.prod.outlook.com>
References: <20260707132249.677711-1-kraghava@qti.qualcomm.com>
 <6a5e8f0d.4cee2a04.252f89.ec06@mx.google.com>
 <18C449771A90B4B9.2594417@lists.yoctoproject.org>
In-Reply-To: <18C449771A90B4B9.2594417@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR02MB10971:EE_|LV0PR02MB11565:EE_
x-ms-office365-filtering-correlation-id: 8eb6c4d1-630b-4784-3a2a-08deeb53dc5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 AvQlxXfPCmDGzypFUhfk45j7X5ajWp4IpbtmpYxU+P8WQldX3zXgXdaMuXNNO14QinGwpJe6/5BawZwdbNonub1TeI22fck0V4IIw91n+01KUCg5Fmof+1D2+6zLNLm8AVQPfghaoKcT0CV9VREM4xRCarVPAjV+Ol7JyldR6jhNuFiftd/8EHI5ECoAPeP0xN70TWo6AcnG9H7I/ffU/AjIjcnoRnVaV7s4Dgj8AffdrpetTVmAezWW/eiaTmG+xZf+kB0UN0xFuBd87/QmcVm5fIZTZwGhbq8dEGNlOn6NqmZpXiz2FImP040BWun0fhELWzziByQHX5AmcX9Lz64MZhldYoiS2aTNR0huxtenIlVCXG9+wZFMizVFWJMsWmQPjq//gUN5F5K4xLcqx6qtsd09udK9sUPpz2iQGPhzFwBJeW0loRq/ZBBRxj02hl71c0SeRtnzxTsrLniGWMr7NDQQfmEparXuSEFr+WN3jNCT+Wi9OHhjHWwsdz6y1Ya1AbVYdYlpTOB2h+Vsx8vNIhTaHd7+mfTj+kLrCMdilX/OUX4CVZmGBWdsgwBOlFH8wv+wxqRjJJBOa3JihylqJGekmf67sXehgtzY4qODYw+eLQJdWOUwBAWyRs3zDBE1Y590FUjv47Fj3kGQ61pibBv9SIpkFF9puMXULU5NaX7LYXIFv7nSyW2MrnEnuw39rryV/8KNzHGqb6bLL5HsNhiu8rINsdIVeHcRlrM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR02MB10971.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?jL7/1Q9v4HMRNpmaIIfpg9QdbSSSSh5mIWPfDvzoFiwTcU0Tz4xBlEh5fy?=
 =?iso-8859-1?Q?bReQFA9Cb403qxQBE75ixY45YfylaDcceMRqdJgzL0Pm1TOeRG2Ku1+1MI?=
 =?iso-8859-1?Q?6l+pxmd8m+zxjR2n2xrN/3o7N/gbttQds/PDdf1SpMgvpfRuk+PvrcS/IE?=
 =?iso-8859-1?Q?Za3S5vHYNNaqlMPv9IRTAJXer9FtR1+fkLjWzLwgiU4XYAl99zGAk+DVDL?=
 =?iso-8859-1?Q?0uALGybOpXGKurBKnFWPnj9mWnvIb/6RGye1/el+mzLklguDlAW46p1lnj?=
 =?iso-8859-1?Q?Xx6Ly4XOCXUMjeBlcA4GlP5RgfSDiU2qHZNv+gX5AL/5/UXWxD1KrcyUzU?=
 =?iso-8859-1?Q?ShLEI46jY4q+Z/svEVcGvDY00kQWvyje7VqSttCgxDetkqif2LIHNcxUrH?=
 =?iso-8859-1?Q?TKVfvnhM7uy5GFc35RPfVgfLBCbkP0mXYshdR43Ha6445wF1sfeSmJHIMi?=
 =?iso-8859-1?Q?kiG8xIIGiTYNYg2P47D4fG1fUWHB+hyjx075OjiorKw+y5vGV9Z+SrJfav?=
 =?iso-8859-1?Q?6dIdpB6iKD1EJOuHkSy2x48G7oWDN/rf3ESZ4+GYOV2KkVYdV80KO8Ooaz?=
 =?iso-8859-1?Q?L/yHeWX3c/NKj+hCycYRNsBV59sdSGStpEWAMT3Q/p7bm3NWQkQBtkHD0M?=
 =?iso-8859-1?Q?+EEeunF44dR2ah2WfHtVUsNZSEXmBpYX97S4ij8T03uKuK/qeIzpSz88Sp?=
 =?iso-8859-1?Q?dZd453leXjcjNvamD2iqo2b5B7H9mc13SIyBavf3if6DbAfFFTDiuHQ4Cz?=
 =?iso-8859-1?Q?xetVAPr/7FFRcMmfmsGaLoQRS8E07KmqQaDqb67khNhR0OjBK1hdzZmoF3?=
 =?iso-8859-1?Q?qybM+cWve4/r21gC1ZXRYtxv4bKVAo+KPbiVW2P6PKTOVR7MqIhfOyBkKm?=
 =?iso-8859-1?Q?porx42UFAmPlU13EXQj/yvBl1crIQqbwDxHqICN/K/TANtobNRSiSCY/TM?=
 =?iso-8859-1?Q?cvbp38sXF2Aveu5XBOFOtj4mrEG6RkBWldh65IW6KxSH38qd0IBWF9NtXf?=
 =?iso-8859-1?Q?FupiczyfNEHE1y8hfLZ+BV+n3dqDs4CZp671AANhQhS2NnajeysMCuhJR8?=
 =?iso-8859-1?Q?LmupkYK5Cj2pE93+jsSbg8L2W0d7n4m83BNj2pCh5eyFSPb2OsUnDDBept?=
 =?iso-8859-1?Q?trQdmSupzvxmTyBQwrOQMBrm3fnrgHbr7TblLGSqh5QncGeVCafkW1gzQr?=
 =?iso-8859-1?Q?gmHbyQMh8gUfeEgWs6XEmjcPQi0FOBCJ4Bo/nsaoiTo3mSopLDctZIujdv?=
 =?iso-8859-1?Q?5DrjrnZqbPrz8WgDfACLW6mwM2YD/+ztmedum7N8qYV/1EVytbwrP8M9I9?=
 =?iso-8859-1?Q?Uh7qnFBmIaq535/YMt81Ljgcchgp8mQqwq+4GOvS8bsyKGAaXWVF2ZlRJM?=
 =?iso-8859-1?Q?zQ0tMsXETdL0OaH3CMnKIvSt1GgOs17QqKXPF2cRVmSJRU1SLKLF579XC7?=
 =?iso-8859-1?Q?2hNFRangywWKfjH2sjlvMzN+xy1H2A6KRjzsPC0gwDN8YQOwx8xHdIgSFM?=
 =?iso-8859-1?Q?fDszdvuVYWozYQhCs10bLefSUur18OJy+dzwiAODg+aKoJBgWFWshCIuv8?=
 =?iso-8859-1?Q?Athbr0JUoRR87lxZZ1efgKEy20uD8F2g3lOoUW65RhEx2ETYJWpb4Wflwr?=
 =?iso-8859-1?Q?maKJjatOm0seLnI5cDbEvx4T8ySYLB9kl4wnU4MViz2rWHmsiUZ1wYRN8u?=
 =?iso-8859-1?Q?I77rSzh1ogWXENSY4TqIOAp/6C3+IBRjMjwlM5QcwR9MwGpFr3S1r5aZhN?=
 =?iso-8859-1?Q?8RlTWfkjv/2GytdCBvWvs47R1QYxwoLKn8BD5n1WkZFg5Gw+uUaLJWTtZC?=
 =?iso-8859-1?Q?Vs4TCU5gLQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	W1ShBuuqKH3S7b5dJdB8yPUQvy+mfC/9W4dsozt1/pLJlee68neLnPruLC81Uibhaa1ij9CCDBHmW6EgkR6SR36S4NWlay/J58ufHcaIC7GbvR58Xel6c/2X1+Deh13s6tlHMfVTM0YsJZpw+MTE33TwLkjV0ykzQ40sWBLjyv0qfl+LMm19LWdWMxfCij6nzkfLOe4Ug9kllIli3XZaJwiJcPLlM5OIybD1p8BnZ2GRbY0+SJvBPWJqD5iI+KTedTc565TXu7C9/uTgAs1qIA6yA408IemIaV4teamcUIjWV0pGCj25iEcUm6obNJdTPncLm5eGOtC5NT+3KLlW0w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	GRDXSmxW8uRermwTlYnovi9/CwCcp8qeVZYGTowjUwwOwtP2TvNFyYSQQo0tn6mqZ0JQXqfWokOKhqBqsZ/uHfD6zPMON66kMcmnqtH/eWOBYO+XzgYf8ncP6G8E5M8pJ1sNS/u+2FokcbhDGa7sCWYKvwb74Fq91UA67zvKerJ/2W1BYY4j7UOPf1T6N5f94wEszn6iclq35va3AAa1JAA7eAIg4nei2baHmUgqYzjYn/G5mw9dCdjbmDUSoGGnIy2HStOZ/STYtlrQKZU6vb3L5Khf3TNfhbo9Ad78/0c/yfEzATHUNa1zQdHxHXvjUFsH428ByYHxhmZ0VEdse1u8SGGxSxwTEVb+oeIqvEk895SG9VQ2VQrQdkZCuwQZPbIIftN+UtaE5165bQHPdNKp4sTlldknQQ0/CybzLlVKGKcKwH9NCaIW9kNd3L3mE7EXYIuElhZvHWtS0wfPaOxVOhS7qscOOB0ymiBg4ZuB9R92RUVqQHNiFo0wzPyfwZmjjScfX8b0rVo93+XpCCYv5j8mIUrQ2sYGHxLZhAGD3tVXiMRFV/Pu6N+bZhj6qFhjGvIpSPCUcHNCCs7qWg4qtgMbZreYJNES1MGC0Yf7y8LCwqQ7NPryVuOE3oJP
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR02MB10971.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb6c4d1-630b-4784-3a2a-08deeb53dc5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2026 20:24:14.4779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f4ddFFJj4MSCN1+idnmShEhzrtDS+jO/s/CNgrQW0JLzx3IsMi55wpO7pkg3X6uMiqPjZ+LRQNP4MTNXzPKXr4u+CBc9UrrrT56C8aPUfSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR02MB11565
X-Proofpoint-ORIG-GUID: 1cy_-qvWsQSfXMxt0FL1Z5YvMmgqEBFh
X-Proofpoint-GUID: 1cy_-qvWsQSfXMxt0FL1Z5YvMmgqEBFh
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a666cf1 cx=c_pps
 a=3CRHu18DflYqj82tS/m+pw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=fyqO2FW1bv7U2ubNB2gA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwNyBTYWx0ZWRfX8wGjqnHCZG7U
 aLPH5PhT4GZkZY0k1aXMf7PV7LHOxAnVhnVvrpM5iiSEdrBo/OCe4NMeeRiDMSXwvame0fzvDIW
 nqlhEj1Biqi9XdZKqeM8xB5363qKTMwAnPLBgUhNAeMPrxzgfx55lPP7mnNl6pNPyet8B/jMg6m
 wMLoXyt9Sm1fbtDivLaRayOKIvIOC1ncTr0DxwCOPMzLyz+YWQbS1lcMAM7Ihh+WR5ES/ti5oxv
 cxyE2ZVkNsD1y8+ZP+XNHabxnsPBMu/j3CrU68qS+9ZlYfK28YZfHjXz02UUhu38TQkQ5R15gLV
 Ql2m8bl0rVEe3PoaYBWc5XmOhvAr1rtwsLSIYCNI0IBeag06Bqkp8HgYHGg7pF7C/xLgi5YOyGX
 zlrs8EOzWxiS6WiRn56HXvQlALsl2dNoMskqGtGIfv+dLzAeBgGFi2jRqJe2wdhiSVbMe541H2Z
 vxS5ZcyCER75KW1Dzvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwNyBTYWx0ZWRfX9QC0YOpREmMr
 6e8lBbtTtTObNGc9lfDwPi6eonsXFRNgmhZsrhC7QgZjrcMNUizUlgYYs1RHZBQYslThbp+W7pl
 QkoeNNVPHK+R8RDnYHEla0RF0dcKk8E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260207
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jul 2026 20:24:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9980

Hi Bruce,=0A=
=0A=
The patch series for breaking down the DEPENDS=0A=
into PACKAGECONFIG has been posted.=0A=
=0A=
The patch is titled:=0A=
=0A=
> [PATCH v1] crosvm: replace monolithic DEPENDS with PACKAGECONFIG flags=0A=
=0A=
Thank you,=0A=
Keerthivasan Raghavan=

