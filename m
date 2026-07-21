Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFD4C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 11:08:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20186.1784632128050196450
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 04:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=egkxvBG/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAQtFM1611898;
	Tue, 21 Jul 2026 11:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExILFNrdP8GiRAjB73UJRfF3YRwY9M6Fqq2AD7VaQJ4=; b=egkxvBG/TwhgjU9M
	1+3s2nEmKglJ/W0WQ1zv7gbR6rEBMCRJMmvGMaMtoZbTS5icbjTrBrOPkasNJmn4
	lFm5zBGDBGfmxvf9xUEEUmzLtlFKCc+famyH4A2Izff/FAJNwzB/IvaEd45nAMkn
	xFCEZ8973mFjgQ/ye4xzRqnrFLKoBXLC555/OL4gzsgUcB+gGLG2Np2KP3Mh84eH
	P4TW5AE4A9EXeAlNc9W1c3GjsXCT6ndd4+Mw17O53URvgM5z66WFWm7H4hEu4jqr
	0BvBvu7StV4yW7HJ/W/6R22O8clFdcx5LFE1DvNFg2l//XaLeEEFpchex5dUhccg
	FG+XTg==
Received: from bl0pr07cu001.outbound.protection.outlook.com (mail-bl0pr07cu00107.outbound.protection.outlook.com [40.93.4.7])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3g7tt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 11:08:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJGjl6oKxmGz0lcbVOwJGghelf9Yvfpt+SIrFfhaHXVqI0MBYK6qiQbV8lx/jQN5tNkwlUQZBr9P3AXRus6bYliBpnljZYfVRF+ldWQtRWnKzxSOQT5jxIjkdhfKwSr6zMqjkCxQxD7QqN2XWfrYkUAfNIVi433fzjPoVIhpImuRiIjzBD053Ph97nhC4JxmSddNV6cKDIHSBBnxQ1/mC+H7faC9GVVsPLzwmO0zly3qzwN9d4IkQE85BiFwz/niwX0Q0IkWr0nmiiJ/HgZ6wlsIP76puErmo2IwP9FrQSZT0/lI1pHbViURQ09nR9sREYdcK+SvMyCDDJG+O6LHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExILFNrdP8GiRAjB73UJRfF3YRwY9M6Fqq2AD7VaQJ4=;
 b=fYfW8/X8oVkV/t5tGAFJOVZbG+jd0l41MplwaB4c84suV+SPkXd+qy52Lc4xG1xaj4vI7i1ppId2jtT+E29mPNacoxUG+ccwL4vnG34w8eevsMCIcRhCwoqpLE8M4jX7V1mT0UAkM0BVAIk+7HWT3SmVheqoliK93Euya3s4x3eZ0ZElJISjPSTilU3cr9+6OuVCqvMNy1QdUeULMkpOi8sF5Njawp5sqBRrl9mdJ/+QUgPHW5aM9jCNQWxGo9ScV3B6TfcDC7e5JJnGKr77aQmc9y3vaV8CTiJqbXjVMkX8USKJuq5vQObkVL/wwvMsFFjaXjPQddRnI/pZ1CmCeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 (2603:10b6:610:2bd::11) by BN0PR02MB7949.namprd02.prod.outlook.com
 (2603:10b6:408:166::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 11:08:42 +0000
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168]) by CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 11:08:42 +0000
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Viswanath Kraleti <vkraleti@qti.qualcomm.com>,
        Anuj Mittal
	<anujmitt@qti.qualcomm.com>,
        Sourabh Banerjee <sbanerje@qti.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Add crosvm recipe to meta-virtualization
Thread-Topic: [PATCH v3 0/2] Add crosvm recipe to meta-virtualization
Thread-Index: AQHdDhPFinHIOUQoBE+CxmCIU8ioP7Z2/JCAgADmkMs=
Date: Tue, 21 Jul 2026 11:08:42 +0000
Message-ID: 
 <CH8PR02MB109714BE2A9300C500EB192B9F3C22@CH8PR02MB10971.namprd02.prod.outlook.com>
References: <20260707132249.677711-1-kraghava@qti.qualcomm.com>
 <6a5e8f0d.4cee2a04.252f89.ec06@mx.google.com>
In-Reply-To: <6a5e8f0d.4cee2a04.252f89.ec06@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR02MB10971:EE_|BN0PR02MB7949:EE_
x-ms-office365-filtering-correlation-id: 84e256bb-c467-48f7-98f4-08dee7186ce5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 loXbnF2F4PeihrihSwA+VhXlvMZcMdiKMlCojKMdg/N7ajCu4g3S6ZMvBO3EXXBOXjPP9+4NCnc9lHstZW0bgFIcc9NjpGcXnOY7V+2CwBkAyfGR+kt+Cm8bRf9uIoqhzu4G1NCbtgjnOdP4SNSf7aQ5U+rdtAtW41zqpPJizCmBJRxqG5JEBHVfxhY315SERclxXL++6ky4bjEtlSlrSSuOHp0z9n0FQaBFdp+Mn6VDuaAemnATFGbVgw9FPfLNcviUBWWH8pkX/vPFns3qqj2U6hqoC6CG8WKjRDkRPLVnuCAVsKlZ1+kvBZZvXPDGRCfTEB4VvgLY8/ody4IwMliq0p/7thDjqgoCZD5WuF3pY9ZudwvPu4M+faRrfX6pvJu0CKIANSb774fovZnlByDEfMjeblI8B8fEd4ez4n6xTtYukQPjdQ/hIL/Xg/cLBhWyGTqqlGJrrclj32PPpVv6ZAimAbbiXfbIKI+7XYYdrY8zkPLucG6HCOEJgeH+ej8t/JOwdWFwaelnXyLSwznG8+w3cUxArEAd/8UyQZLYhWGrpZamPkBULMG1EkdGJPE4xxpfvqM7ZRKNP14tgx0pxXJfKG+dvh+Nh0BcQog7t4/u3HRm2gHlZxYG1IS4AaIouIPm0PSt2mRDCxExHB+2Sm0Xr+7vrQHaVB3vZAQ0UAc8ysAtYleVLySqkl1lmgCI0G6D80d0jz4E0O0W6bLgmHQmtDO9l8DmMQ3yIOE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR02MB10971.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?X6zp5sXPvNKLEIhKorlzxjT4lXd5W388Of+0yidID0ScZQQC8ejoHXSjVy?=
 =?iso-8859-1?Q?NBhXiMrlUSHoURqDV8tDjJTcI1g75t9gVW9qP5BtmZbjFl/88RjGJbA9Pe?=
 =?iso-8859-1?Q?zRS5aNm20G2LTlzFEsyHYNBu3nZYLTVuV3b5wWrYF8hV2kvB5A8pi4oqJ0?=
 =?iso-8859-1?Q?/Xv2nNXFMxrVmfV3u4CUqr11/klExJaxInHOWYTRHCJ6Sc0g0M5g5lu6HL?=
 =?iso-8859-1?Q?Kf6nDeCFd9KtJ7MxhD8bThlJCCdg2VPL9qzr0MZjR9MMmhJ7opCaU56NU8?=
 =?iso-8859-1?Q?I5fo5h0LDHHJm70AXr0JgNQ0UKYnHFOIoVBpnMJStMAbyOJpgvGu6uUL6P?=
 =?iso-8859-1?Q?lg3G2fv0smfUeCelIIbLcoesibTqzVLHi8OFAjcnJ1D9E6qmPmgjvdoKUx?=
 =?iso-8859-1?Q?lB2xe3rLOj8ccfqhcYl0cNQRE1mPdzS8AiVuAxj38tG4sYPfu0Vi0biwOh?=
 =?iso-8859-1?Q?ljrs02/5pthkmJlLF4NjJ2uPaZKBCm0ycUriY87GyZPXJ/j84/2s6Xx2mh?=
 =?iso-8859-1?Q?weqt98Lp0r44G6QyzpOeCPlaChmwoJWKYbz/V11k9gr5BKJPm63jhZEPvW?=
 =?iso-8859-1?Q?MVh73bIbZNeHD9egCTVJbwaLM2LErK7QLQQMwbUam2/RQWlPfHLMsc7No7?=
 =?iso-8859-1?Q?Q5RJeRn1yscS8K4cY4mDZMGPuXPDkX1oUzSydhrxJ+IO5PtjqZ4TQv4Tok?=
 =?iso-8859-1?Q?LKkEdaJ9RJCKwVY+ozDA1U6qU72uQYP2t5EftDWZT+wd8G3NQ4AGHMzHFo?=
 =?iso-8859-1?Q?Hwy5usuTOSGM697RPWohT3M3FKp+FPS2lOR5U7Qhf17wL4m8titGLFUqb3?=
 =?iso-8859-1?Q?XMi/PKBTgbrQowTYsKj5RrFAtgF/UfthQt+UOp77Kmh9zi09zxuOnlLied?=
 =?iso-8859-1?Q?EEGEjSN7uXOPatGqqbOtzt8oauGUkbcFvAyQygrwPfGKV7DwgvO9xV80jQ?=
 =?iso-8859-1?Q?QVn+deHeWoYlRHokMdh3LK7SknHH/p36nk0FPs6OshIVGeVPh2rpXn3VH+?=
 =?iso-8859-1?Q?F6TbvDL4gNdJEJh1ugYLlqn823AKou83EBlzwp511y/wl7jZsF8lz3ByTs?=
 =?iso-8859-1?Q?eTy7rG01EcbPBg9c+hBuDuWtcaSemPWbkH3rltOZc0BSvV0SRmt4NWxo8U?=
 =?iso-8859-1?Q?nnkPq7getL/EtL9Uus+MD6LZq/zNE9VbL3OfIx2jtsntoFBYLBpvkbbhUq?=
 =?iso-8859-1?Q?9/HBT4tkRWhDJPg/0tWE1CALrY1kK+g3qXF2vAkygxqKyrvDPZnUvTevvk?=
 =?iso-8859-1?Q?lUWAQV7MfQ4+up0NmnXTF8RmExsSMvEzzN8+/kAV55gbnZhdp4Aq/c8GTO?=
 =?iso-8859-1?Q?e+K3zSOwPxbCVrt/u2cBDSLfIxkic73D87L7fMvRevp9SuxlE4hQ4bRWcs?=
 =?iso-8859-1?Q?U0itJrfy/9c9RnnJvOe2VPPAAbJE19EfQDuCDpgbz10sWQzngugSQTPNfa?=
 =?iso-8859-1?Q?tiFgokl27kVJ7TuNTExb41CTGtxs9PoH9Pci9qat1IwMCOOKptkXLs2QfR?=
 =?iso-8859-1?Q?FkpeHXpu40pxVwf7fGJCKvB0GZaaxxTU1WiZB35Gf2QcjddgStegSucjnq?=
 =?iso-8859-1?Q?tEaj1w/UysmJDJtATTsW0uMCSmFyW5Dp6ApE6VJLM7hz33Ffoqb0NxidrP?=
 =?iso-8859-1?Q?I5AXzJx5Krc//BC4UKOiK+TCovkaJTUFvT2AKQtY3WIdVZXm/KvKsQEDTF?=
 =?iso-8859-1?Q?PjSoAH6V372jnZVjAPIXPdknxHhgtYIQZ6XVTJeUlcVl0oJT/VOrFN9JUE?=
 =?iso-8859-1?Q?amqosrXuX1fuvZC++RJXN8sEaompu/TFi28UlMvoUnJy2kucKG7dtucVzi?=
 =?iso-8859-1?Q?/b54ZDyp8w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	otJl249kUO/kgtxfu2us+nNOnzoPWechRNarPaT2SQK3qb9hQpBwcnvBa8TIoIbjxV7eBK3ukuJVD72/HHAmxHywB/OX9KCv1qzN3woWBNyQDBRNNNpWBqLseagkhOe2vz6Z3iZxHDpwK1Ds9/jtO9IyLC1sRRy9rXbRyyTr3k51eHTu8YT0ckQNAMYTILGDg4k14mLRhMJ2EkZEfH0wQZY4wvJW9k8ENvh+JsgplnPqh/BDoVgI+r0Om6DiVmhPF5kNRGl18/8jfWmI3hGWqLOIXcU1PlLjxtKCuJxWSbYT7sJuuTGyP4RhpbMRwyWkRQrcz4byzFXVbaGyyEo1SA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	v8UyI6f+Ci3u1+vjFLI76jAXf0sAe/5nx1v5bX1/nOFHo9+AasA45nZNRRg25BYh4bRyMFEaehwkKHc0StLgivjBEHj5WHmzjgxHDTTj7FPgkFOfVZgpUdLNiVkF9jadipKkc90uhKNwj/y3EhjpFRsAM+ivSGRV4Z6OXy9sGD/cTprjB5vcyTwZ4qZTJNQEUJQEuwOguIvRqqihnCzShYuPnvEDrX1XfcZAwiwJUFR0dWvIIIQZ0v9VoMbISGc2EXR1KjWy+jsPsnh4K4gkXV7zsn+pa2UcYjMQ5vH+PLhnveWlCvV1NRTQIcnshuQ9lnGapFeOjChSvZS+gKQd4f/ymn1hGUAr6irJj5qoSk0wfYyqt/LsJu8bmd2NIJ9e+cDg5iO/AKIDf/9bN+rOFQ2nESV2mGZx2DFnwG4JuYsPBxc6Vg5Z4NpbVKAZjVnY7bC7Oj19iHlSx4qvmiTOoWe8vznPNTw63tHAfR1j0+FfwlD3NmksJuLiCOLGR2sXnorLta13n9X0/UxJyBOOScegIIMz5aeVF2PcizEoscNwSA35hJTsLpL4WIftHAjdXQyU4uNsYCI05beCL3VAfn2PaMDBpmekm3JkMSe3AW+OqUCg5X+RTy00r+m0j7Aq
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR02MB10971.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e256bb-c467-48f7-98f4-08dee7186ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 11:08:42.5060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hr0p8oHyHas1e92adu2q4+oTr87Hyx9xzlM53gYy6r5z2UuCM/EAH+wjgQEmUxDDjSJHannZL6DUrcXYWR3Lt8brWHdqRmU/CdZ6ebXMVqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7949
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExNyBTYWx0ZWRfX68LCO/RAhWKw
 DXDUn7uRFcBPr4LWG5Gkf+Q8ms+P7ZkJefhO/l9kpYM8s7vqIc9emZtK/sM0rpi/pjLBnKoqAU5
 TQI13OUjnNs/dr22O7FfdU9D/q0fOdEy2NL7nl6OKX3dzwrodyAbWwBC+IeWt8fQmvZSENTNcaW
 2Tg8TIbvXJxuTo4+TEzZDcnvUrSL1yfU//tKQMTW/XSmMtQvo2Ii2Do7M0wnMtTB6dQTR8J/92B
 ofALUUAfxRq1EZ4fITWWz8CTReVgipuKMHTwGhxtFO2792hZdIGyyKrGl3wphJn9ZTn4JyNQju+
 46b9dvTCM5+TbPaqJpWeIePYymyVxcoSft8F6SilTaOM9lwR3g0glJov4A75T2YOzRQAF7fNP/w
 EiTxbZ/tmVwRbYwPlAnUQZhuBzBtP58soY73hmvTde6kb4OfWmau3P9+V0BGnHwWow7cWFfjAAQ
 LWyWT63PZTGMds0NxtQ==
X-Proofpoint-ORIG-GUID: LYhInPFVBc_yZbf4hL0-5NVxXXunEVzM
X-Proofpoint-GUID: LYhInPFVBc_yZbf4hL0-5NVxXXunEVzM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExNyBTYWx0ZWRfX/2QGSE67aiB8
 QZ8pK6Y4M708gO9F+51Do/XOZjddPdIvy/PVC7qYjwp73Qmi5bkTq5cpnRSyoilgM9E6TYcFGTh
 SsI9VITzboYBDTug4+kwyJA2WNGB2w0=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5f533e cx=c_pps
 a=nntnZkkNbJfG8TWk4U3ZLQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=TiL107D6qVfbulf8sD8A:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210117
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2026 11:08:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9973

Hi Bruce,=0A=
=0A=
> Thanks for the v3, the series has been applied to master and is=0A=
> staged on master-next.=0A=
=0A=
Great! Thank you for your review time and feedback.=0A=
=0A=
> One process point for the next round (and for any future series):=0A=
> please include a "Changes in vN" section in the cover letter. This v3=0A=
> cover is byte-identical to the v2 cover, so the only way to see what=0A=
> changed was to diff the actual patches. That works for a 2-patch=0A=
> series, but it defeats archiving: when we (or anyone else) need to=0A=
> track a still-open TODO across versions later, the cover-letter=0A=
> changelog is the canonical place to find it.=0A=
=0A=
Ack. Will keep the changelog between versions of a patch series in the cove=
r letter going forward.=0A=
=0A=
> The wayland unconditional DEPENDS. You've noted the intent=0A=
> inline; a real PACKAGECONFIG follow-up is still open.=0A=
=0A=
Ack. I will start a new patch series to address this in about ~7 days time,=
 eta 29-July-2026.=0A=
=0A=
Yours sincerely,=0A=
Keerthivasan Raghavan=0A=
=0A=
=0A=

