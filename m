Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A26DCD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 05:59:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86329.1781330361582649342
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 22:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oUcXhdXD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D3O7OG1263443;
	Sat, 13 Jun 2026 05:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66SLCLh9Znzjhl66OGwv5cEiBO3Xf4GRx5/aKz5RhKg=; b=oUcXhdXDSVb7j24q
	sXg9sXjRf02sNFaTT6sTizLqyDChs37byT5azG9EWPcGDOiHdHarwXFrzeks6qup
	TN7e2mRyZRLSv7nmBPZKmtVrk9Ftt1HJUMaBEFCxNkY6A4gnxQKGzciN+CB0+gDr
	AOhHzqurXcy3LnXZMO/watSEnoJrCQRDtXmn5WTQvYqefCXJQdti+QxiX+JILTFA
	b/feJuWE94vhEhrxIXqsTpLMIHsPGxePz0nT7zB7g2uKNcYsau2a8r+XSNt1kwQz
	eJm2zBA3lHHLz0kB1/duqs4p2Saz1eW45Z81KzdDil09wRC6eRNyno9LlSqgWIBx
	a3LUxg==
Received: from dm2pr04cu003.outbound.protection.outlook.com (mail-dm2pr04cu00305.outbound.protection.outlook.com [40.93.13.61])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9508yy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 05:59:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oF4dkIpzOSbncIY7bkpG9v8/VfyZLzREE35Qd5P9ZBo4fNkWThyfBillqcQbVY1WE666ViDlLmX/T8iVtxL1gBRGjHb3bUeOZcgmCQGIql3Ezwje7eCUpQbGKqupyoOo3zjkWqJPToIydeDq2mOVh/Ru3wAzIAW3ti0/d6ECQoe4eF62GD6VlB2sQVBZLeKtbXDCy203e+RPkeR1BJGlOc58GgsPbTfSY74DHX3UEAWczGsMnlspvoRXV5yAZGP7M0kYPOfnWm0g8rEXpByDm/D4kwJRzB/NT9KAHAuVV7IwLkrWacpPuGiH9I1o0BfMNLJdtqs2EhcHCcWejA6ICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66SLCLh9Znzjhl66OGwv5cEiBO3Xf4GRx5/aKz5RhKg=;
 b=R38vrLJMJFU9EPeqv3530Ty0hpTNppOO0z1Ybc1tbD3FwCEfprK1aAdhTniDHP9HARzB2ZeGbEnXJqqPw7EJDgI05CqF58MFnciEXLtQHHkM+UFD22Qfw3OHb0Jpu7sNuVPEf8DBafFTgA394DPLJC3OqESMmpyvhHLfHkvIsJqa/Z/whmuoDpZx3Mw90PMMLf4t7kOTpUql4WwI4PNxBebfZDVHXfq6kbvxomaNOpeNGBM0QGkYEqlW5HxwRFqe0AzvfMcWCw+fU5VP2yxuDgeUqpHKcOQeVXgIZM551FL6HSjILBQMj+rvYb7lQddru21LEzTtE6SmPdavtBXSlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 (2603:10b6:610:2bd::11) by BY5PR02MB6580.namprd02.prod.outlook.com
 (2603:10b6:a03:210::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Sat, 13 Jun
 2026 05:59:16 +0000
Received: from CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168]) by CH8PR02MB10971.namprd02.prod.outlook.com
 ([fe80::ca3d:581a:3e40:7168%4]) with mapi id 15.21.0113.013; Sat, 13 Jun 2026
 05:59:16 +0000
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>,
        Viswanath Kraleti
	<vkraleti@qti.qualcomm.com>,
        Anuj Mittal <anujmitt@qti.qualcomm.com>,
        Sourabh
 Banerjee <sbanerje@qti.qualcomm.com>
Subject: Re: [meta-virtualization] [PATCH v5 2/2] crosvm-image-minimal: add a
 reference image for crosvm demo
Thread-Topic: [meta-virtualization] [PATCH v5 2/2] crosvm-image-minimal: add a
 reference image for crosvm demo
Thread-Index: AQHc7gyRn07kYW0wrkSxwb/ia5p/arY7aCqAgACvIeM=
Date: Sat, 13 Jun 2026 05:59:16 +0000
Message-ID: 
 <CH8PR02MB10971D7F0EF7823FDC6F21B8CF3192@CH8PR02MB10971.namprd02.prod.outlook.com>
References: <20260527191012.1125228-1-kraghava@qti.qualcomm.com>
 <20260527191012.1125228-3-kraghava@qti.qualcomm.com>
 <6a2c5ead.a342f677.387e91.9022@mx.google.com>
In-Reply-To: <6a2c5ead.a342f677.387e91.9022@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR02MB10971:EE_|BY5PR02MB6580:EE_
x-ms-office365-filtering-correlation-id: 18d269af-d562-4c7c-44f5-08dec910e6bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|18002099003|22082099003|4143699003|6133799003|56012099006|11063799006|3023799007;
x-microsoft-antispam-message-info: 
 8uZjKnnx/hkTxvHFL1OqF1JeKCJbeecB9lqVMJnZQYTdbjowiBGQQwaQy1TWWUjOJkqHgSaKuhLidMacXKLRtrQUcy0o6dUgZPEdz8wB3Iy7QJ7F3rCHzifZY9YtZudr6TeZPZDynP2ELIu/kRrnjUi0SbUQxiwicT34RMrMkjbuh/zUJPSeH/v2Y944U/LEfBvlmDceR974l6RWkQhDHXv5EoVea0vUpniKI5mjQHkLp9c6gFYL8cZLdvie6UICmiV6/6LTHVPnig/3OlRASRIrTpyUv98bZLKtdtgNit58C/HyawQd4MxLmkTaaoiMjdcRTHZHNbTlGrSLLoRc2n16dk7h7cde01cUW5CEsJnla4nvAMPcQMVUuQoGWoS3t5ANWQTB77poEoZhOREX/0L/gx0ByVnatxxNJVifUdWPsD8dMmHHBTEw2thf5+GMdv1WuL+s9ltLpziYn75ukJGDTo3k1rQ60UGPugkooLHGFH+OpIWK85pILxWRwWAlKuNa1vmHfhdqFg5f+LiP0fw1ZRkMOpn1p/S8sdLetg8mbsc8dgfn7DbVoyE/QSLlcpnVcdUeBgWHZgfQru6pF5G8VRXceHlrtxPgg7bCI4SmRmW519azPnhmRRRsNQjeZYEI9SR69k6VlKzaYs4M9ZRxlSY1oi9KCn62Qc/N1nHBhXNf2awTdJHMLXd5G4vVTCuo2FKR1ATgKNPBeB9V4g1DpHc26hbqZ2nr35KSmB7nSZy/TTuKER9iLiNyGgxs
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR02MB10971.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(18002099003)(22082099003)(4143699003)(6133799003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?Q0iv3GqwzAj1XYCOKPRkAm0yCiug0gfsxRhaiPof0I8QYgld8N6Tb7lD?=
 =?Windows-1252?Q?WNlrRBnEPE0AfTxs671n2EsXiaoQBH68JFd0yg6cf1gQ/5fJpqIJHUFq?=
 =?Windows-1252?Q?pjaWPF0NbUKQCX+PUexL/QJZ66ZHxYSsxc14UBVhqEBgW2uOOCbKYgDG?=
 =?Windows-1252?Q?Y3uMCxbibp55YqlR7/BekRcbKiWaFwCTixvMe5IP8pMy484gYvZria0w?=
 =?Windows-1252?Q?DY5INrmipESo9GeCxT/uvS+QDzNfDnpiVwyrWzRV/cqBccnVHrkcDn8T?=
 =?Windows-1252?Q?/8aQozoRLrGZi2mKZvDaxzV1bKDBHtO1hvGDMO3hxzgR8Lqwk0Y8J6O+?=
 =?Windows-1252?Q?wRVzOzYBa2K4+8bAxoaHGE7bOjLqmJECCKPTcE7TVKyIvNfXqJxxpEt3?=
 =?Windows-1252?Q?yGLV+tLZkVv9aFOY9EQYaBpI5e+JLc2KH8uUmlF/rjAEBr+toZD7cZXH?=
 =?Windows-1252?Q?doy12jozgj3prmr+zwvchRvPbQEqrPURr50ezBl7ATVZOUcPaYhw6cQJ?=
 =?Windows-1252?Q?9Sn+S40zFAUIFshMiDto+wd9PrJSJ2mrN2RP1EDQJy9yEVcqpSoOO4Y8?=
 =?Windows-1252?Q?qo6K2ppW6qcqxTkK7ppLWShWzh5mSvUOT2YJ2kyR5XjyXu5JQ9jrO2AH?=
 =?Windows-1252?Q?yU/qaxS2OyMQxLxU2JvubmCBgTZJJbtXtyY8XpM6mdcbtpxdMemHcvKX?=
 =?Windows-1252?Q?NxfnXwMHALGX1yNrMIQ3HGpIUsLOvivh+WR2uom3wW7IYrLBgHEwWDGl?=
 =?Windows-1252?Q?LbPTdxqu1nNPU9X+amKyzmaaWSfGG0R9RCLiRZXiSSRK5AEl24jVTXMZ?=
 =?Windows-1252?Q?W1BjZZOPbyW7ITQsK8T8AYKfjz1kaIjIloGKCd0JIFFL+ylUUPTbQLeh?=
 =?Windows-1252?Q?d0zLWtBEQvv7Qw+vowt/RXM9VE2FV7oPfVih5fpANbF4B/A05xhOPBtI?=
 =?Windows-1252?Q?K2vV1KwK6sDKGRg0avDwGb0UF+3e/ni5Y/SKSoU8eP7DkwVvH1w/H1xf?=
 =?Windows-1252?Q?lFoO33hbl2jzHRlzib6qSAbYp/xfwehbshIYq6UJfwe/OUxtmtZGA8ov?=
 =?Windows-1252?Q?mBubo3Yo/LQ22al5jmRESmtYb6R8PRt7/ye2WlblAHmK4NSGTt9iDVJo?=
 =?Windows-1252?Q?6pztbBWTodZ+iZJIonFKY488Sw6h5xeeFVzCjI/Occ4+CCqXwv8zKTK2?=
 =?Windows-1252?Q?yER6Gcmoplyxv5qO8fYrGNh2cH4tcfbrV175+cgdsE6mg7pGYP5QRWlo?=
 =?Windows-1252?Q?EfbkbTRz50Fge7RC9Vm762QCE+4jxbtM6ILb2iOj8sq6WsuiJKZ45uwU?=
 =?Windows-1252?Q?zP+bJNFUtuA4LLlTLUKVJlmM5r6JtoYxnZVr28WvMPfIOJn5HyIXkXXC?=
 =?Windows-1252?Q?1aJYfx1FhGyPQM25HtFIgTRyf/xuvGpO8MyeXiHHfQNog02r4ajmhHpA?=
 =?Windows-1252?Q?s+mefEonMy/acYZiBeKyfU3IAwAnzUorNY1/9SJLth6BUfyMQlGtXIWf?=
 =?Windows-1252?Q?oqXE4zCorNesUKh93R/GeK5E9j9wqZeLq/prHVqcSoiFBQ9tbzOc0AW4?=
 =?Windows-1252?Q?KPxmX4StzWtUV7dMfQltpFRmMVfpmxPIQ9aiFy/Zc6uvnjnnqTg3p5Xn?=
 =?Windows-1252?Q?dbNTwgqNO2Ahc64aLPq/KmCo1egI5ru9v96H3lznJcPMW+93QMGQxfIm?=
 =?Windows-1252?Q?Wai+l5IBPd1MJJNzeYGzEalz8DhNBFMpdh3DeLeFvxIDabTWpsjMRD9m?=
 =?Windows-1252?Q?a7JeVyO8kRYmwGUSoH2IX6E8MfZOuBT6fDN7fp7ZM0p6aPJokS2qikMz?=
 =?Windows-1252?Q?SyevbpaCBcjPkAFQl9aeywdsEesMKlS0crgZDb7JiMYnRrXeWBFm8QAL?=
 =?Windows-1252?Q?de2cEwEK0hWpEQ=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Sp5WYTg3uZi9H3poEwLDKWZHUpeaxNeTn6Zg+2SgHPS4q3GoJwUGcgRb2EgdigmLLmbhvUhzlddBvSGKWulLWX9CT3KU6HBNTKpVlbP4gz4oda342ZcLWF0u397qZMs5Sc/TwPHLq393JndabZbxr4GxHmt8bgujZePqSM9Syi9qtQDRCMEmEcxRtxpCy2sxsj/hPIWvH3yQA/rJ/AXmmjhD3ZosZuqiux3qzt14GTG5a7x6fHiErYxIpQSUuXNAJYkrfghBvdekYLbBX6yN+NZr+clM0LTrPF8B0t/sglbUrLjeZk0FGOgxuY3iByUK61fLZ2fkgSTfwcGUQOA7yg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	kzrDX5KHkXwhS73AYHBA7d8bpCLHfBeY+jMvNFPnE3K2LpL5AlzpocflzX45HI2A8gFRKlJgPs4VzgmrQ7TkYhj92IqBhvxXWCTaGRfCp3BGIsgRg+oJof0/fUt/G8stmxwbyIsdltu2T12hKVsQzihIo4Sdk/IrKex+hF13JPR9RuTOuViiKPZdsp3LqihKqEDM8rPyMul4DTAwQsFxV77YHiVMf4O36MsNGDsEf8iRrxo55hrRqFqH+KRyq9urYQcLsqcI/EtBIqkky/g6tYUHCLO2l2D8gvMhv5fIMThY9+/dFNHj1LewTdA27m+tDf48ORNI4zm+57INFV+B3AaEHOey79Vd9AnH0qGtbk4S3VPDPGI7+eBQLDvJ+ggysWjXP1Fxi2lJFSMpq+dWAZRgshkqCic3pYKXncmlYLw9/tNvZWvfPMY8tVFMRYH3cK657kdBcH7MN5qYkFCqVxQpFnDKWI5rspwBtDIvZnPVIGNZyyYZ4ngD0XDMY3MUj+qhQH7kN771I09DeFuU2TPy9JdGrKZoSQKNICTWy7uqqrxFj9KUE4PIlMZ77+czFi6XPR49GBTLeQvlJSTKk5LR2UAABvFKV8dcS0iBALevlFfM1ZXovDo5IiXQ+uYe
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR02MB10971.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d269af-d562-4c7c-44f5-08dec910e6bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2026 05:59:16.0637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jbNM+89xixODozA+l+0fSaq1hQt+UgKpaVdWUSRHijtYAEqwn3KOZeNpL2LuUg5phV7+F6XjNJiAQq0qCOTRFdKMnlRhoALhik+deArxdvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6580
X-Proofpoint-ORIG-GUID: hNsZnbdT7nHvgfPGBay1qHlsZ3faiW_9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA1OCBTYWx0ZWRfX+YwtWQE/vtAi
 CLdarapZpQq2RRhGamTCksPdCu04Z1XbKwF9DEig7OHxgXPMGpn90exnvtMq94Ps801SUJF4F7C
 IsDXBysOLIhTj3JQ65kz0ZYYoIor8/Q=
X-Proofpoint-GUID: hNsZnbdT7nHvgfPGBay1qHlsZ3faiW_9
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2cf1b7 cx=c_pps
 a=uAsC0n6o+FZr0mf75tp5mA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=N659UExz7-8A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=g3FVEwhFo5ebGgsLGXgA:9 a=pILNOxqGKmIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA1OCBTYWx0ZWRfX0XoI7maZ3ZYa
 7q6GV5W0iRC3k5XC1zBuByb4tbU8PBg2oNeK5nwQtrklFHT62I8Pb0UHV7dHB6GBJLM5faHTVmu
 gV5SatKpeqIUAC1MoQF93opcRgZtbzJEP5rk+VGFwmmuLc9ITQg9bwM1Zlvc+HA9MrJXGEIOe6m
 /Vx/ThvDJFeCDTtBRWtd58+xAHTjKCvyt0uINYHpRii1AesGtWuVR1E2Cgowavd30qkzMA2uoj/
 lgILKmTIQgt6UIinWDl3gsq8zXvdTawxyiV3LP4SRIsCK0wvOc0F+vlBcFr0Hfl1Wt4apPqfSW3
 8G/Zk7gf4L30RTs4auki02ug3mV2l1cXfC4vtcs73BttqKQLHJSLAIreSk5FKA7MdfFTOH3a0SN
 H5FiUG5UsfKByTkvG5tjVmKOE/5dbFpx7SPdD8UvnHtZ30ZIZG9Q8+O/0It0iV02Ve48g9Gng/S
 mmwmwalL01g8MoBpuYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130058
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 13 Jun 2026 05:59:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9885

Hi Bruce,=0A=
=0A=
> The remaining gap is qemuarm64. I can't reproduce qcs9100-ride-sx=0A=
> without the hardware, so the arm64 path is effectively un-testable=0A=
> from my side right now. Did you try qemuarm64 with nested=0A=
> virtualization (the way you did qemux86-64), and if so what=0A=
> happened? Even a "I tried, it didn't boot because X" would tell me=0A=
> whether we need to ask upstream for qemuarm64 support or whether it=0A=
> just needs some Yocto config wiring.=0A=
=0A=
Nested virtualization via qemu64 was not supported on the native arm64 serv=
er I had access to nor on the qcs9100-rise-sx device. With x86-64 host runn=
ing an arm64 guest which again runs a vm inside it, the setup is extremely =
slow, it did not boot after 8+ hrs wait time. The only sane solution given =
these constraints was to test on physical hw if the guestvm would boot. You=
 are right in stating upstream qemu64 needs to do something about providing=
 nested virtualization support that is moderately fast for arm64. Both the =
physical arm64 device and the arm64 server I had access to did not support =
native kvm accl(there was cpu support but qemu backed out) forcing me to us=
e tcg on x86-64 which did not boot the 2nd guest(using tcg on arm64 yields =
the same result), its too slow or rather just stuck when trying to boot the=
 2nd guest from within the 1st guest. It may benefit to discuss this in que=
mu forums ?=0A=
=0A=
The qemu cmdline I used on an x86-64 host:=0A=
=0A=
qemu-system-aarch64 -cpu cortex-a57 -machine virt,virtualization=3Don -smp =
8 -m 16376 -kernel Image -drive file=3Dcrosvm-image-minimal-qemuarm64.rootf=
s.ext4,format=3Draw,if=3Dnone,id=3Drootfs -device virtio-blk-pci,drive=3Dro=
otfs -append "root=3D/dev/vda rw rootwait console=3DttyAMA0 earlycon" -nogr=
aphic=0A=
=0A=
Last few logs(if it helps) when booting the 2nd vm using crosvm from the 1s=
t vm:=0A=
=0A=
[2026-05-26T10:04:34.465695943+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 1!=0A=
[2026-05-26T10:04:34.467123732+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 2!=0A=
[2026-05-26T10:04:34.468690776+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 3!=0A=
[2026-05-26T10:04:34.469804614+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 4!=0A=
[2026-05-26T10:04:34.471032068+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 5!=0A=
[2026-05-26T10:04:34.472381430+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 6!=0A=
[2026-05-26T10:04:34.473522822+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 7!=0A=
[2026-05-26T10:04:34.474818881+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 8!=0A=
[2026-05-26T10:04:34.476900802+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 9!=0A=
[2026-05-26T10:04:34.478251681+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 10!=0A=
[2026-05-26T10:04:34.479289071+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 11!=0A=
[2026-05-26T10:04:34.480722260+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 12!=0A=
[2026-05-26T10:04:34.482246479+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 13!=0A=
[2026-05-26T10:04:34.483322573+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 14!=0A=
[2026-05-26T10:04:34.484896724+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 15!=0A=
[2026-05-26T10:04:34.486036774+00:00 DEBUG devices::usb::xhci::device_slot]=
 resetting device slot 16!=0A=
[2026-05-26T10:04:34.532898423+00:00 DEBUG devices::usb::xhci] xhci_control=
ler: halt device=0A=
[2026-05-26T10:04:34.534384706+00:00 DEBUG devices::usb::xhci] xhci_control=
ler: interrupter enable?: false=0A=
[2026-05-26T10:04:34.538624229+00:00 DEBUG devices::usb::xhci] xhci_control=
ler: clear halt bits=0A=
[2026-05-26T10:04:34.540089300+00:00 DEBUG devices::usb::xhci] xhci_control=
ler: interrupter enable?: true=0A=
[28761.296705] hrtimer: interrupt took 9440429 ns=0A=
[635866.980323] sched: DL replenish lagged too much=0A=
Killed=0A=
=0A=
Note: I killed the process after giving up on wait time.=0A=
=0A=
qemu cmd line I used on arm64 server/device:=0A=
=0A=
qemu-system-aarch64   -machine virt,accel=3Dkvm,gic-version=3Dhost,virtual=
=0A=
ization=3Don   -cpu host   -smp 4   -m 4096   -kernel Image   -drive file=
=3Dcrosvm-image-minimal-qemuarm64.rootfs.ext4,format=3Draw,if=3Dnone=0A=
,id=3Drootfs   -device virtio-blk-pci,drive=3Drootfs   -append "root=3D/dev=
/vda rw rootwait console=3DttyAMA0 earlycon"   -nographic=0A=
=0A=
Logs if it helps:=0A=
=0A=
qemu-system-aarch64: mach-virt: KVM does not support providing Virtualizati=
on extensions to the guest CPU=0A=
=0A=
> x86_64 is handled. arm64 is empty (KVM_MODULES =3D "" with no=0A=
> :aarch64 override). On arm64, KVM is built into the kernel and=0A=
> not a loadable module on most boards =97 so an empty list is right.=0A=
> But should we add explicit a :aarch64 =3D "" comment or some=0A=
> documentation so the reader doesn't wonder if it's a bug?=0A=
=0A=
Ack. Will add the explicit override for arm64/aarch64.=0A=
=0A=
> Sensible default. The PARSE-TIME do_rootfs[depends] +=3D that uses=0A=
> this variable means changing it in local.conf actually works=0A=
> correctly (because +=3D happens at parse time, before the dep is=0A=
> read). Worth a comment in the recipe to that effect so users know=0A=
> they can override without surprises.=0A=
=0A=
Ack. Will add the comment in the bb recipe.=0A=
=0A=
Thank you,=0A=
Keerthivasan Raghavan=

