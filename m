Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FD7CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 16:01:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.318.1782144104769742497
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 09:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cpCQG0yJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFVjIH3842403;
	Mon, 22 Jun 2026 16:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjCbfss11Pd5WwpTUKYP9ppzfeWnbMiILrDh18rCFfw=; b=cpCQG0yJJKffHipP
	aPP0poDFiQ7ZwSl2rV5NxBP2lKHF2B5+lyHPFRvvXQvCSd9acIYmO3QzCNLSwmLh
	xlij1fkZWl/rRUFFHWkik1xtoLNTxPuMMflKwELImYgMvDTpuRoRmAl1mcqa0pPb
	iqy39VZbZ2pfXybZZg56ASJ4UOPaqioICv8C4g4t46/mOuh+ayJFSUrlCgAKHdgv
	4p7/vs7eB1fRPSUTkEqbpMLTT+/ZXDcnHQLpZZJeRsZprWeaIhwH+tRGjdA7W96Z
	BiJSFYmohehEyNoBlVXFfNIgHaMKHoLlvSvXQIFmViJzgxxZyJogahmdBkRCl6rt
	cfssMw==
Received: from byapr08cu003.outbound.protection.outlook.com (mail-byapr08cu00303.outbound.protection.outlook.com [40.93.1.107])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhs8d8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 16:01:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIEdDxrYi8xS/HBBEUM2i/ZjI7Moc413KjWz6LraVGRBOuNirRc6Z0jpF6dq+Q4zNM0oY2B2nITviTYTVn9pyOeBeeZ+DL97Lom3xYLeBSJjU0FkgZi3zqIWiaxKwzLuhjSgfhRvmObJQfTsXeGxfQ5EvY+/2tNJtQ1Imr+HUmxdIkxDvFbV+8V/C/J7F0U0tsqL8IzTUsTgCB2Gkbd12gyFVvED3bqKkeN/HjX69I/AC8FK/vHTqKEQTCYB5wjlp4vH5QW05Z/MWgxck9jj0s99S314YLybETq2LPYKNwtfpzbR+PS7AdY0TVB1njwnAmzvrsi5mniTYDeEXclVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjCbfss11Pd5WwpTUKYP9ppzfeWnbMiILrDh18rCFfw=;
 b=UOchIuG4aeKEdVRyjLl3Kx8reyCoBSL2qJxP0Q0QqaESE7qX7VHq7nw1s7BsccnBMbqfyq1ihdWr/ibjw3ivAtMeDYPRD3UuJsK1Inn1x8imJO1l9yfpzrlhpfQDt3dFEzaW2R49j+w/cKc+4S4qktWl4tlhA5EP4DNSd3ubFS99UjDcvOs2ekiWxqQZVKJUt7NC10upzPBawX1MxUA6uG/sqCryKbpVoqrcB8XvM6IHZ42ckyI4vH8v8RhnQxz+3tfYf1Nb73ydCTzgv1lhwsZHXFsDzrGnGGfUZdqJXCKudTIe+GifUsVSDMgfXj/YdD5oJybuTXHShHM5/MV23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 (2603:10b6:610:2bd::11) by CH3PR02MB9748.namprd02.prod.outlook.com
 (2603:10b6:610:17f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 16:01:39 +0000
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168]) by CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 16:01:39 +0000
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
Thread-Index: AQHc+vsFxbnwu93/BUe2rsEco5rHo7ZG17OAgAPvq7aAAAMQKw==
Date: Mon, 22 Jun 2026 16:01:39 +0000
Message-ID: 
 <CH8PR02MB109710A65D5FAB54699401CEBF3EF2@CH8PR02MB10971.namprd02.prod.outlook.com>
References: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
 <20260613060743.3120135-2-kraghava@qti.qualcomm.com>
 <6a360c2b.eef12218.262e9b.f8ea@mx.google.com>
 <18BB72009F835ED2.943537@lists.yoctoproject.org>
In-Reply-To: <18BB72009F835ED2.943537@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR02MB10971:EE_|CH3PR02MB9748:EE_
x-ms-office365-filtering-correlation-id: cedf9835-6024-46e6-6616-08ded0778b6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|38070700021|22082099003|18002099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: 
 a/wQuJ9jDyLLaAx5RMQiyubniqThiA7s6QfFjP0XMMy/YjYoUkd0sfdG2dwBFsNvaBL8/XXyjLiOXxubcOP8mVw2zF0mLe+sTqhMMeTa32EWWMIHyhIHq3dDoxc4hH2q0VdFBEoeB91UqkGUGw1JET9WLYcxz3FX97juN6YcVb8DX3SvfDsVwJfw9pAp8oJ15dS/Jx4oaY/+N7STzP7jz0rvXj/dt1/TVa6C1nSXaxF+8rN8pAWCSP2dtgtZUvkxi1HYKxP0iOBxRUQukqfDBC5cczLCKDnmyEOd/uBPP3bCVIRan8z8AASxAW0YRUdz8dI9kMNKaco79KVxkBOCR3qtIugt7oKS1g4q2zPW6cl9Om5QMFmYadpVhXh48zsts5QZeZU7KxXVZxdV26jFPkyCtzDGFJ63PjM6SlkHjOE5QW7kIvBPBmX3Si8SVfBSaePQKSTU3vopMvHrwTxW6mQxJAiVXf/qgXVXrueJf84BfL2u7SPPf4Hq40GbNJbKZU7yGoJtlCtLUN5jAOFuBaoBOdTdXNQNj+oUS0M1h+VbFT7/Dt18taGynxVRYddu63yR7vUcu/ys0H1fdmgCJ9K/eDjPH0rCyorLs1oLlp4eHxE/V4NR7Bq4aovI57d1ShS78+tAHt84WTFfvPwSEEwULr/AWdtg00jeLXqpm30Bk4/5bk6yNGLFep5seCnAVZ4N1xEnXD3miSjLHJ5NdCd2gO0T17dsUDzXigm67+Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR02MB10971.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?7IzASTNbq+2WNxytr9F93OfvfSLokTlyYMxed83eqvcI37IZGAwJoJ7orZ?=
 =?iso-8859-1?Q?Z56yzMQMZ/jU7J3/zAtOw2KbFUR/Wh6l7Wwqa6Pb/mZL4ebH0JJua8NrfU?=
 =?iso-8859-1?Q?NIpZyDBSZ+T61ZNUt/ipzUBFQj7w39U/tZWOh+9tnKCVdFHGUazlqxi8rZ?=
 =?iso-8859-1?Q?CI0RDx+MI5vfJ+OAoKTkfk2lbbP6d5IQ5b62+GfhlHnIXbJfkRrmndkmVR?=
 =?iso-8859-1?Q?QZYTE2PvBXwXbXphaJv4gVcfhuiFxp9824EQJo2m8flf00B1ERgOSsRftR?=
 =?iso-8859-1?Q?p6sictkjAv2JUngHza3CodBbkvhY55QO52bZTFk8kf9J0mYqDvBePleF5i?=
 =?iso-8859-1?Q?px0kddKnzRdchVXCjuQG0/LQVL+cUzi1sMtlQo8Wl4K3HqQWbx7ek1PcMq?=
 =?iso-8859-1?Q?N4tiELqVktVKc5QzdavkeZ6iZyKFedQ/WesJ8E4MOppurT6/fsU+zWOTys?=
 =?iso-8859-1?Q?CbZ2FDWdNpE+99bukV9k6uR7Gb/pYhdlo3LEyBjahLI+ihwi/AG2pU1HgP?=
 =?iso-8859-1?Q?oO6dxk1Pav5aB8pNU6P5nEhgRPRF3PHZ86pItSLC6JO3dzLvKQHhh1Po4e?=
 =?iso-8859-1?Q?IC5v0iYRmz1yQI72AOziZC0urRGidT21W6nHSejKUIETpTsPhLLnCTrm13?=
 =?iso-8859-1?Q?3nmz8esqCYlt8eUp6CD9mPj9q/PTgLRkHvh7juNFJIneibQZJJSIoD3WZf?=
 =?iso-8859-1?Q?mp0wWQSZwBHeRlzlpgsSoTk+P1mBSxH8w7VoJ1GJ0LoqFp1OcV3oRUii/b?=
 =?iso-8859-1?Q?STcL40jTTDGpr03Pt1RjXEu6Vo44JZKvjybdEUJwpXDAK3x8KNXQLG3TF2?=
 =?iso-8859-1?Q?dbjqhIJp9rlTH/xo6oj0dRDuP5MMX0+mOy8xPnsohIVWujfqUP4nDl5gat?=
 =?iso-8859-1?Q?hF5viJQHMDvQPDTm/1v4juQtL8qCb7Xu5NPUSGi2bHh0dWlPG8Azb3pJIS?=
 =?iso-8859-1?Q?XBE7KKM9ySe7Pv9D87DwdlkYTLcbkoeCOhHifLDKJiFAnyxUBG18tukVcH?=
 =?iso-8859-1?Q?CtEiwT31LnmkY0ITvHxWxOIQWimTtkUpaSzLiDmC4S2liVoASCg3goerM8?=
 =?iso-8859-1?Q?qNZ9Br2OVmyHePLtwyNSRF3tLDbmIQbuXmfS8gZLR+vKUVDllQNbsFMqQo?=
 =?iso-8859-1?Q?RbrEH3mU0oiQj0YpE64sYhgvu0GJxUuOw2ptCuWSiWjkEDfg0FercBp9ef?=
 =?iso-8859-1?Q?tosKFy2N/Xsnh7HV2XrAlgyhdA70ecOyVueQeWIVUPB9mNBHPnicUQmq3e?=
 =?iso-8859-1?Q?Z1zKvLfJXhM5WZTILfZ8a9VOoUAfXRfGfTW9WwvoWGCtNGCaAsDv+ljSmP?=
 =?iso-8859-1?Q?JEL0EKCisgPvrJH+ZQMYmrsULPNwBYbrHqbQxXeCWU1dMGpgBMACsoRadS?=
 =?iso-8859-1?Q?p2U0F97LiwIJFkSNMAv6huWYeZkBet7iytti4R2PLIbdqNrXn/5V97pzwQ?=
 =?iso-8859-1?Q?Kv5ijmLADyCnl48YxFuZC6gMim0s1TqyAfJpJn+JI35ENCAIAuIY9IZHwp?=
 =?iso-8859-1?Q?2VS9S20aaXdypv/YUAxNyn6C/8Beb8Gsz7/pilJG3n7CUAPDQGd+n/DtCz?=
 =?iso-8859-1?Q?9PSyev9MPFYawIg2yksFq3wsawceg7fMIl47aNA2Ng+a9xCoLAAKnooSjz?=
 =?iso-8859-1?Q?bjxZGxhPnk9XjSfbzJWkIGForvu4zGho/p7D1aka2iD9vjICDASXpjL/g1?=
 =?iso-8859-1?Q?zP+brTXJpJKTnqGwwl3U31BzZqEYso9XGtoaEP2nV4MSZ4FVtLJnn+kC7F?=
 =?iso-8859-1?Q?ja5uVh05ylZuCp0cEcyICayOwYk5zAOCjEuNKouHX0op2ytffSuw8B/V2w?=
 =?iso-8859-1?Q?/QYCgbFFng=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Lze7Y+h+Ol4XdcVbrP3JXhFZeAu763rjsqKOnEhw77w3WT8MlPArRZHPcoPCTYHL83ws6ZwmrqYF2+67cPhaLmVfOLW8tndaul+w3rnvXV8VDCxR6KWXKzoqQWm/20ozh0Tfn5Gd0DCc7mDqKmYKLWxQaY56lgTtVC1Sm4yk6lHqFXtts+reuexnz8RPnFfFydCwIOvQBwpDkVZMugMFk2jfqQ27G2+1EdB9sCydSjNu3dDBWFjslflTMVGNRoL02eaJ8XdSYR4qPE+AGpajGpRPJA+8lFrZWjBPH7OVkm1YfK8fIhAeM0Axtdv3sYkw30GnbZGt6oQnAKb577uTDQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	HLtVBBvCYr1YehYyT0XpSEIpkyUB5aCJQXwSPMOeF91tFzHgSAWtdj8YTUz7J9codsqDhqKhh9mmwoK+AqS+1xBcHeWyFAMl1mhbsLjyjkx2Vk/Gpcu4CH6p21HPcaZsQufTv2Sp41SymTLvKDBYAco7zT48E4+BdUPoPTLIvWQrwlgpRp8s9AfaWncubudbQWrYydXKZ+Az7XRbtp3hwvaNqdn38FWLXuJqR/wc/6reOrf+QVO4skj3VOtL0+oh67z4MISmmVWlmZ57C4f41qKzmqObZd8fhsx0N4wYcGjQY/rkglCYTve6cUxbQWQU+0DqyrSQkBg95DOMj2nF3tx1ey59YYRAIV7QUV4XV4z6HoOfEWuOJnv3EOFCd/gYDBexkfpueSkttH5zRPF021DoPR37/Upe/MBAACruyCvY3OITOIcAZNWsIdmSOE8TekBGVA+LfpZD9G6c2j5b1hQjXkA4myPb1CWdM+o5ySef6ZeFW4DGM0nDnoYFVouVaSlDimzNvIy60qUNh3Dgc34apggC4E4g+LPj2LSndfxJu51Tf4LhPVE5wynDZCdBrUzrOtVCYHC5m9s8NKJWJOTHiu3gZeWLLo8A8oe7y3EWHN1gg9i1pAyfBRZPp1io
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR02MB10971.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cedf9835-6024-46e6-6616-08ded0778b6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 16:01:39.1594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6hDoiSrf9idqwdlEYa2rEMdEcnXTuS8FkqFKFZiKqATbk2uPHbJ9qZdFSIeWg+Bn5xgWBYh7mZmXu64SylflQ8rZJBHd6Yrjmpk2rffik1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB9748
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1OSBTYWx0ZWRfX0kEfk1mgvlLs
 3XVb25jzAhXQ286+NFVIBpBSfxSRVfhYvnA0LTYZlhTdIo+6Gimm4/BdPG8Gb8vaqeL8HCx9Qz3
 En6QQsyYWGkShgNa/9e6fxmJ9eji0h4=
X-Proofpoint-ORIG-GUID: S9H_PHL9uLlDrolMJgQ83RxcnjTbQaVn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1OSBTYWx0ZWRfX6vZo/kBAded+
 iwdos/So02tQLKvqkbBCa4X2k6R3sELYNJoNq94Txwh9VCI3QFDeOvLCffCMentpR1jWY4rJhPH
 S76lBg5VBO93PkGGbhEJltTyFgGiwdG+elSajhUHAn5deeLE6Ts5BNiyNrNzLo7a0onEoPvvSKo
 eKrWH3BlNQqqTWPWFX73VyPlQ23qL0YS2mpaPO8g3Tt4OGSCSs/GSvLSaeH4hvHIeBaowKIKxHz
 4wa6/TZDp3djjCBgs/87HTjE5a1fAzNdtV8JoBqtHMyLdRHvXIE65Fh/YAztKucXj5iaqPSKTKG
 YBRXlVEHVka4YJVfbyrIlxKO4HLBH7ArIdZ/FcZxL2+xteIm5LJ+Dh9LqOD7Dee8+u6otKtr615
 uyn/CNsMlf/wawjXqe4hMPPWfzv8wagtameY415CfQkkDToK26hixutsDAa3gLskaPRZEWsZIqD
 CO4X6SQCqI4ZyyNId8Q==
X-Proofpoint-GUID: S9H_PHL9uLlDrolMJgQ83RxcnjTbQaVn
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a395c66 cx=c_pps
 a=fk5ohD6XvwGBfAEJs6aP/A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=OJfckK6lw62G1AcLQy8A:9 a=wPNLvfGTeEIA:10
 a=QYH75iMubAgA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220159
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jun 2026 16:01:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9898

> How did you get it to compile ? Is some information/steps/code missing ?=
=0A=
> I tried the change and it errored out: The lack of config.toml causes car=
go to error out.=0A=
=0A=
Sorry, I meant "Cargo.toml" not "config.toml".=

