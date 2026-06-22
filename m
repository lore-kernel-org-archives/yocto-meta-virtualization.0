Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FACCD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 16:12:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.599.1782144773057661376
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 09:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cUaYDSOU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFXHSK1591963;
	Mon, 22 Jun 2026 16:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UTyfFZ92PH1G6TpgrLiG5y3Z4gGjRlRDAm3KHj4vGg=; b=cUaYDSOUqURhAx3x
	izvC1ho62SBfvQshc+W8Y4q/G0wtMRsGD1NayAva7bY1UlXlEHCYUyHxTsg+YCM3
	Q0uX71cnu44LoEy8Pmn/jLxSUw7fhoLnqgKFtnsftjVd16RDu4ety2TWXWp1jzmh
	k4YeEJ0Tl2Fw+DnUXLgTrVF6a7HerHouWeEK6n02JVOD3qCBnin6STt8Ngf7v03V
	O9sZyVDGgg1pL66TnPnecGAXNRteNIs+ttKf2uGBg5RtpPms9vlZcxS1RtuATB6R
	OWZuK5g+VY1zX9upybL6cfghHEtEnVZKX2LFE5rarJGsVQUGCecDTwpdDprQmXC2
	himPDQ==
Received: from bn1pr07cu003.outbound.protection.outlook.com (mail-bn1pr07cu00303.outbound.protection.outlook.com [40.93.12.3])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n40pyj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 16:12:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1HRFFlF2bAo9vjegGslzu9fQfb+A1mEVnesESjslUjbndxTHDuTUWJcl0Ti7zOGa0PmR65KEh/BwdRoDR07WNV74B11NDmxwxqs5C6Gbi5BH51k9KJPS72WREoLVyjdwz82djmFTF9hT9nSpLy8YKSmndGwsVpwMwJ0DegRlGmv6rh4YDYkTOMpOCN5qtCCMmR5d9UXgvYybnMpE8U4W4AFoT+S1P1I+94aLhZAWnqLJBNkXT8/uEj2f9I5HdcMHdp9rIitMLHquIojy+Ee7ctbw35woIp0C6up52G0xZuSmnv7pQB7zfcD/tl4kqgdXfwX5ZSrsaXt8ONkJKbxbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UTyfFZ92PH1G6TpgrLiG5y3Z4gGjRlRDAm3KHj4vGg=;
 b=NJPeVlTj+tAS2jk8R36MPfrFCBSnyyIFf6A32cRU+vYKKFxvc5n734VsSfX9tQ+bAxCVHb9WgFGRdVNKteQaN8ln5kAi8iYWfmhnNF9SA1+n4Xki+Dt12WBEiIFmsRDuWVzNo870BJSIzrT5hDt4npHdBNBaGvQl9RioE1chaLR6iuOW2mPx6N6x4TF2UpDQIsCQ5rYTCsKtEuWcy8ZhpGRhs1KQRlwsqudOZXnTnqerBJAVCYSg76bdg9MOtJAzCh1QQ3/HG68Wdz/4hIyPP0BRadnAS1dODzm2RHgDyjmk8CZM/2wSLPPvhgu7r0RPyub5DGbxIV6ctPr5ZeVRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 (2603:10b6:610:2bd::11) by SA6PR02MB10479.namprd02.prod.outlook.com
 (2603:10b6:806:40a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 22 Jun
 2026 16:12:48 +0000
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168]) by CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 16:12:48 +0000
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Viswanath Kraleti <vkraleti@qti.qualcomm.com>,
        Anuj Mittal
	<anujmitt@qti.qualcomm.com>,
        Sourabh Banerjee <sbanerje@qti.qualcomm.com>
Subject: Re: [PATCH v2 2/2] crosvm-image-minimal: add a reference image for
 crosvm demo
Thread-Topic: [PATCH v2 2/2] crosvm-image-minimal: add a reference image for
 crosvm demo
Thread-Index: AQHc+vsFD1oSf0xCYU6ZezxG126SLLZG17aAgAP1q34=
Date: Mon, 22 Jun 2026 16:12:48 +0000
Message-ID: 
 <CH8PR02MB109716388904C9B844FDC68D7F3EF2@CH8PR02MB10971.namprd02.prod.outlook.com>
References: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
 <20260613060743.3120135-3-kraghava@qti.qualcomm.com>
 <6a360c2d.dfaa6ae2.184890.bc53@mx.google.com>
In-Reply-To: <6a360c2d.dfaa6ae2.184890.bc53@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR02MB10971:EE_|SA6PR02MB10479:EE_
x-ms-office365-filtering-correlation-id: ec082a3a-3d05-4623-83fd-08ded0791a57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: 
 VninRr4O1W4OcadOv8BBLCab87/SkM/UTVLjQm3KAteias/cvzeYPYx71MxWK8fqkmZydmBIlRhYdkEpGewFLlLSpN24EauF2BkpEXU0i76smZSrtBNCTYlYd1riRey9lLnTv3OMMMwQZeJZ1v7YQTa8IKQUWuBaUnUklkoXlN9nH906yWVoKpMHONz7VFHEPeIQXAnppZg8l2UN1QCvEphmtpfP4q9VeyyO7A9P8y2ojkbAFOBthgnZXrMhZUycHusZTh8uvNR43hfSw0Bjt0RT5q/xmxMB36shRmV6PSeszBeRKlpuM/Wt9p4koB/qCMR8qtQjhG81E5XVZFhexysHkL/f8XkkUJKbjjz5r3pinpXvIUwd/+uUcrUQr+tbiFMBUnp5i0kQDua8bURJOuFGcW+lTICxTOnMHONGRdlkglemvzvApaaYYimyEgieJ2F6racsHMLgSudOj7RzaBy54cmDsv1tbTJp0ZXo4OzOhId+EkxbTKvrYMHQlyqRL2kRNM5r7mBAaUscpuGIdW74lpyO7pvMdrFnFQjD/X95bbPxqAu2cB9BilFN2cXK3Dmfg+mTKKvbUMAhQ1PccBas3xyZulpS9swj269UUWm6rANEqakiQWH73ykPO6QqodDtXfjKbWV0ByiYarQOqIx1H2rM83ySJgcaxbkoRADsM4BylWO2Nc4/OsNUrtbHZl3O2JtyVuIYkYwnjcMr0wYJJVJ0hJcT5qXIuL6bNlA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR02MB10971.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?MjI3NUIvMEpCTnpMaFE3eVFsOTFQdnllcktTS05xZmhVcXFvRmg0SDhQ?=
 =?iso-2022-jp?B?azA3ekZNTjQ3alVCZ1FvZVZnYUpRS2t5T21tTkQxM1hENDNzT1BkdE16?=
 =?iso-2022-jp?B?enRIRHRWa3VJTUFoYzlOTUdNbmExc0FMandNQzBJM0JQRDgwVWY2VHY3?=
 =?iso-2022-jp?B?Uk4zbzNCMzhoYzVJSUNBdlBDSU4yQTQ1WTBTOUdFTmVUMmxRcWxoUXo2?=
 =?iso-2022-jp?B?OEZYdHB0R1RQdG9mUjBrTUFKQUlpTkRPRkQ4WXYxMVc0b3ZpNDZuWXZV?=
 =?iso-2022-jp?B?dnZQak1KVktWdHRNWml3aHg1b3o2YXU2WTdkNWxFTVBQenVyWnlKdytt?=
 =?iso-2022-jp?B?Qm5ZUklSZEcvUVVBVlpPMmtnK21taVVaWldOQzdjVngxMzE4c0Y0ZmRk?=
 =?iso-2022-jp?B?aDNCMkU3WGdzbUpVVXNTaU5MOUxwaGNjSDgwR2tmY3ZTQTlYdkFpV3Vx?=
 =?iso-2022-jp?B?V2RBVXZKdVBLanE5b3p2emRwRFRIblRJRzNqVkhtSXBxS1BWTWg0aTFP?=
 =?iso-2022-jp?B?dHgzOWpoMmVZZjRRVWY4cjdDU3A4V1ErL1hvTUlFeXNhVTZPa1piMzVh?=
 =?iso-2022-jp?B?T0EzaE15RzBESzRVV25TbmJtYnRnelFqOGlzMXNDOXlFRit0WncvUGFY?=
 =?iso-2022-jp?B?VnBTVXp1eVo2R0NUdUxoOTRpdEVIOEwrNDMzZlJQR3p3OHlyUVlzOStk?=
 =?iso-2022-jp?B?aGVlK1JTaU1VUXB1TFJYV2t6Z1o2cmp6bEM0NE9ESVlldTNnck8zVWJM?=
 =?iso-2022-jp?B?d3kxWWdjK3VQbjBER2JpT1puU1NHN2tBUGFQNnVpdDFwelpvZU8rZEpo?=
 =?iso-2022-jp?B?b2U1NE9HMFBldm1oeTFONWJKSFgzZ3l3OE5SK2V3SEdDSmVzazNwZUhH?=
 =?iso-2022-jp?B?cWh0Wkl3TlpKSzB6MlFFR0M2T2l1TXE1S1FwbGd3aXpMcU5ZSjVKUWFH?=
 =?iso-2022-jp?B?Sm8rZnRWNjhCaVpZWmp6SWtONE9sTCtiYmkrTFRuZEcydnR4empZb3Bi?=
 =?iso-2022-jp?B?SkVvTXlUckt2UDFjaU5FUjFuMnR2NE0yb3F1WXZYZWJGOXA0bjVyS0V0?=
 =?iso-2022-jp?B?Yk9XZllsVUNVNCtFZnU2R0h0ODl0MzJRYndVbjF3azY4Z216dU40T2ln?=
 =?iso-2022-jp?B?WnBCS0RXNXgzM3NrZlc4K0hwNlNMZVg3MFZXZkFyc1RaSG5FaitTNWxk?=
 =?iso-2022-jp?B?aEFqKzN3azM3WnVpeEQ5OVlnSmZpK0VPTFo2ZEttckkyZnNKVi9manNH?=
 =?iso-2022-jp?B?RjUvbU9LbTM4ZGx5d3lIYTdNQ3VwTVlTenNTNDVlOTlPSldra1FZS0lT?=
 =?iso-2022-jp?B?UVBtbkJ4alJsMUh5N3pza1hCcE5aWkFuVGFzcWFHWUl5VlI4b1V4Q2tn?=
 =?iso-2022-jp?B?TVBlUVlLelg1ZmRKUDE2WmtleEJwVTRsVm16Y2t5MWxtVUVBb0tSSU0v?=
 =?iso-2022-jp?B?REFxZW5ROWFiKzlYRnFZbHRwcStNbXVTUEpLcVdqakp4STB1eUtGOXBY?=
 =?iso-2022-jp?B?ZDkxeDh3dGJpTWhjVlpzZmJrc0phaUQ1ZmUvMHorc0MxOUFkYTkrdGw2?=
 =?iso-2022-jp?B?YXlnMEdBS01IWnBSKy93WG82cXVwamN4MXlNRUN5RFNyMExXUnkzOU5S?=
 =?iso-2022-jp?B?TjlYbU9GU2Q0eThyRStVRi9IblVyVGZRbVFMYlNFUEJ2QWgwMUE3cHJY?=
 =?iso-2022-jp?B?N2hpMThPR0JIc1E4NGhVR1BvOHMwK05jaC9JTlVuNWZ1TUk4SnAvcFlY?=
 =?iso-2022-jp?B?WDJ1OExhbklER3dLckdrbm1JUlpBTDBMQmZDYzl2N0t1eC9Id0I2SkRj?=
 =?iso-2022-jp?B?eWVNQmhmQWliZXNyaW5CL1VJRGNTeE9MWE1PaEVBM1FRWE0wdWp1U1hi?=
 =?iso-2022-jp?B?Q2w0Wi9UYjlvbE5DRzVoVUZ5NlBaR0laRVJpemlRSnkzdFpaeWVuS291?=
 =?iso-2022-jp?B?RXhFbjNGTi9jRXlGMDlkZnpqV29tWDBnL3FtaVg2ZDIwL2VvMFUwaFcv?=
 =?iso-2022-jp?B?UDRmeXY5aVdhK1ZOZFJreVNuRnRlTXRTbjYxakx1V09GTnVHWUZzZHpK?=
 =?iso-2022-jp?B?NGFCOU9mWkNJNG1DYlB4WERUYnZFZ3dlTEd4b1dhTVg0cHVWSEJwcmwv?=
 =?iso-2022-jp?B?TE1hSTU2dmVDT0FiVUFLN09WNGhDQ3dEbitxdlNFak5IdzEwTWcyR0JE?=
 =?iso-2022-jp?B?VHBpUmphTDFGRFozZVFNdGc0SjhCeDFZUVdVczAyMGNpL3BTSkdGMTJv?=
 =?iso-2022-jp?B?RjNzck9oOE1PV1BSb0x0U28zS3c4enhRck1WdHVpdE9CTXlMM2JzQncw?=
 =?iso-2022-jp?B?eFYwNUpMaVFiYUY2ZmhUYnJ0SXM2VHVyTDg1NXJ4cUIrcERXd3ppbVZR?=
 =?iso-2022-jp?B?alZxUE1BempiSWUwT3RVRXdhUjgrTCtyMDRtNHlOVjFGek9ad2xpbUdi?=
 =?iso-2022-jp?B?UVlFcEhCN0wrZHFuSHBycDJteDhKVHFaNVp0L3djR3QyNFptRGFKVVhN?=
 =?iso-2022-jp?B?T2QvMnQ2a3BsT2pIOGtOcEg1aVVnNGlnS0ZlQT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	UPEfJlvK0JgE/r//jxY94N3OauAWosHsh5I3UqFaOSdq9h1m4dZIOIyibKyDCfR4TFfG48AyjI0C18tlOkgbPdG/Hjyiii8ogqDbhBda8UtvXSfLWQ0eMIH+q3WS1foOmIC/5oV8LpWYNZGC1p9g3natNIZJWK0B8LoE9nYD6UQG3t82bbX/W8vuA8dlrFayqyJ/8oZoqpF6C9kAfsAxPusHWYY7jyjSSGkLK10qx3DppGg4Pc6QOBEBR7K/khqwXh1g4rBQTQlIRy/Ai7S/xcaTatK55+Ap3tNiv4RUFccxsIhePdMEYyrA6NWFwOtpaqS0WneyP8XLjhGlwinvnQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2ElTT0ekSirUm0c3Kqw0EZfRDds7jQdGXcU/z9fjKYoboHSPNDJE7T81XVs7RevpWBeHvaHlW0lkJhT47fyeKx8HTbEORczC8d1Sden3+nQPmZqL2QllxA8BsKyxRmpJw8O+1towFKSYuN5rx/ypKqY1gcivYUWuvWh9nNIOjLIr934ixx2QPbpi02YxoXF06FCoEQNcxxbGKAj0Xs/rPdEyWvGmB0CqAr0jz2eNh4fk4y+LSpdSNmhVVn1AVTRufGiCiCkKxS2y69dTnKz6rEW0oGhZqEqKl6e0kFNYQ6HKZkS/+xns+3nqalCsJtkdHWZJnhLsqZtUw9uSB0iRAqnR/5qA6Bkq1MPcNwpFleeiVspYC/F13rwoB/H/TxA+FbngyvuSO2nv8vQ8eatoCei92bJ4N0xtApFh4/1HKTJiTZm5cYO7cpFJ4ZnCvMYMWY9fmHN9xW5pfTb2PmElMwUZoIrBevlUxVafAD4cVnY1ZKQdzMUcAmyEX02rEOjh2mECSFMQtn95TTrQ9fVy38uR48RbRPIXbW436FFh2QrgiPstb19VuULHbQ/GJ/iD2fJor3Yiw6A8OTYJIVlI/WCRaW6vMCJyaUbW2IGEC/xMwsoxFzi7XcP+VRZbRR2I
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR02MB10971.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec082a3a-3d05-4623-83fd-08ded0791a57
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 16:12:48.4491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AeECwZ3isfRpE4z7u1OJtMToO1UXqsTXK2/+Zk2dll4I0W5YkxNfpee+1cNXmjXfNdX7VaRy5vkkVtXyiZ13hfCAs0yXXdIBjqulV1HHXkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR02MB10479
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE2MCBTYWx0ZWRfX/fjtVXNCiJ59
 KI90WW5UBVEgxwmwm5M3UsO8u62gjCPsWniaH9hJXfdl8HJsCi05pg/q+fzBRHZjq4WfocmOGcU
 tt/C3WTULVWIvcpavLRovuxN/HezwBY=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a395f03 cx=c_pps
 a=5MKeFDulKFQ3QTmxSa/C8w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=ZPSk82zQDygA:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=MeMWuYB9CeJTkwKiwZMA:9 a=UAVRJdkkkM0A:10
X-Proofpoint-ORIG-GUID: kqaIJ9Y3EusYzEf-MizrBr_tBOao9T36
X-Proofpoint-GUID: kqaIJ9Y3EusYzEf-MizrBr_tBOao9T36
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE2MCBTYWx0ZWRfX8UtZY4mKPkaP
 i+C6lPNCM+nodAxApYVFUZ+F3Bf2oxt1odFQqZmQYk+l2EIblt8QVpGnDsaY9QWBtGJouOfeAxB
 xspuwAUhyO7ZoQNuPdxPDcPpo9JLUdktPnOvkQQ8CaLM7BUyP/VOU0WAdhhReBcKEXktt3JnXkn
 KYK5Ogzbqwo80evlScWjrPeLq7f1xfy93pXVWzykX9up702kk08yseJSxoYcHOQT2ky5ZtgQX/l
 UCI1/llMVkt1Fy72cHyVz3RvGGxkgWLkDlu8aW6E3lH8a8Ewe9drykpC33uSY+sqP+KzgfRXRfd
 wNxqOeb/K5pORv0stY6tdY4aPTwk89JbeSnIHlLp/TNCPQs04qc+o4tzwgA6E/66ImTavcHGSRX
 amaeNvxsHMBgg0oCXol2LVK24z/zNQU/Xvh3eUk9rrXhC0zaFGZybIfTuXggjJmYrNcCHVl6VES
 SUobiMUQ8xT4nXznMWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220160
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jun 2026 16:12:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9899

Hi Bruce,=0A=
=0A=
> - SUMMARY typo: "demo its uage." =1B$B"*=1B(B "demo its usage."=0A=
=0A=
Ack. It will be addressed.=0A=
=0A=
>  - KVM_MODULES:aarch64 =3D "" is identical to the unconditional=0A=
>     KVM_MODULES =3D "" default. Either drop the override, or keep it=0A=
>     only if you want the explicit per-arch line as documentation=0A=
>     of the "kvm is built-in on arm64" fact.=0A=
=0A=
Prefer to keep it with the suggested comment with explicit per-arch=0A=
documentation. 3 arch are supported by crosvm: x86-64, arm64 and=0A=
riskV. The set is minimal.=0A=
=0A=
Thank you,=0A=
Keerthivasan Raghavan=

