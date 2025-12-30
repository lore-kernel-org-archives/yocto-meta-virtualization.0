Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A087E92FD2
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 03:24:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58009.1767065038628895704
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Dec 2025 19:23:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ChYVz1tg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=545943993c=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU305uL2619742;
	Mon, 29 Dec 2025 19:23:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:message-id:mime-version:subject:to;
	 s=PPS06212021; bh=lsBA+1eC8PfQk+sExp8OIicBoguyjTtdMOYFNVvt8Zs=; b=
	ChYVz1tgiEiGFi3X9IuYSoMuH9DeAC8QdfWTKVYihcLNyzwfLA6oOV4RtttOoung
	2EUpotlVgI8jGsqTYjR4reV72AR/L6c69lHioXghGI3OqwX99K/DHy1YV821lTXk
	3pSg3LZwhcVrZ/OnM86vnVZcCsEC4MSN0J2rQWEr6JJ7NQipHexu2mPmNq+0LJrD
	yUQEGS4PQ6GA7AVpg4ugRsXRpGEVKtxBe6GX1rF53fAog2HWT9LN4mpOhBkjU2uC
	eOaNKtaDrI0HFYJqDNnLW7+9bs8AZhUGTKeqoQQ7X2Rt3Vz/cugip+wau4IUYwYE
	yI842nubwLeW/xXMdJO2ew==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011041.outbound.protection.outlook.com [40.93.194.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafuka6cb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 19:23:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuPYUT/kPPE8EnfICfOshIhL64t9703gRiD2JbaDW2qSMkBQxUBR32tRTmPC1CU+98DIkqsxAyNxm6A4GPRVsfLu/81f5yhJnO9DK4vqYPMXCN6xmSHYYlGgm4dTTdqtQ8Qf9tKdi26y/9SUkWMkDkZRQGEsT+WXkZIQ6XCJzKFkYx17lnS2RgEmxZfkq+p92Y6XLEvfOhspANiQT07srMi7LEmusa34XbW48IfmIhl0tVGuK4SokeJpvPvov37n/Ld/fjFV/a3u5VTacGdjIM0AAemgGgfrqT1YcUFj4nc23cpxl0O6jn/ZponckPuD7VKAn+P/WQYfUOsG03s0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsBA+1eC8PfQk+sExp8OIicBoguyjTtdMOYFNVvt8Zs=;
 b=DZ5NJKsSslmH5/BDcvdjbGtyYYkWtmPjz+Fv/QA0ezn94bt7LPTc89s7a6F+znLliFJ/xLokfx5dl3DPZ6MnsnQX5soRAYOIupkBKE8plxgss0JFZhCf3A99pDG0KprvfoPzzMoplXhERMEvlm/jSIyxWrJvz26aMKExY2rGcNTGuQQ9jj9kh63jg/JFS8649H/sG1XPsmdCfjufj0fCJg7kbB2MT4vmDjb7VxxvilQEEuvU3nR57PnIk6qe6gKnlDnAYT3G4VkQIQNy7aQ6uFiAmHEaVnUvGPz7OCFT7mFUKWQpjK6jg8+9WZkFEu60vmqqXwT4SDNZ5NnnO9itzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 03:23:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 03:23:52 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>,
        Bruce Ashfield
	<bruce.ashfield@gmail.com>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Issues with the new go-mod-vcs
Thread-Topic: Issues with the new go-mod-vcs
Thread-Index: Adx5O5dHtR1zkj7gTyK4328+N5bHlQ==
Date: Tue, 30 Dec 2025 03:23:52 +0000
Message-ID: 
 <CO6PR11MB5602B543BFFC3DF6C86DD99BEDBCA@CO6PR11MB5602.namprd11.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=4a603f90-929a-4cf3-b1de-fa1b2fd48581;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-30T02:56:31Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|BL1PR11MB5255:EE_
x-ms-office365-filtering-correlation-id: 1cd5afe4-c700-4b09-3b1f-08de4752db2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?sd/34sqHhrtNOCzu1nMXGTSPCNB6t7ANVX2vz+Kqv4MJbOfgVETQLxOC3Z1G?=
 =?us-ascii?Q?v3YWWG7aiendfYz2FK/YqhhI8e4ybL07Eae9p6uj0qfEMzItWwUg/HYk3uHP?=
 =?us-ascii?Q?Tsh1GxFp07h7nYtTDW2fZJtQnMHmyYfxxaYeC1a8zzTSrVXFQWzvlloGeR/w?=
 =?us-ascii?Q?YhlGWEXSt4Syh4IfmDcNTAvXutgVMzMOHnWEVtd15f94mt3336rx5x96Kecw?=
 =?us-ascii?Q?+zcUIS8hriZbYjhrc9Mi/ECZeoNugoMXnay2tfe/vMmEoGZrsqxgrwc5sRdT?=
 =?us-ascii?Q?FVIjrZpegxZj3f8QECW4p4nHkjxjSsL10hbnnAX63RGMzCkNjuWcxEpRp7Tr?=
 =?us-ascii?Q?V/NRh/gSV/l29zZmp4jOd2VbrvZvBlUdnFyebHgXU0Jni48vvp5OPkXEFmzF?=
 =?us-ascii?Q?1Z6WQqNpau05igEai2VYRwEpy9sn60vfVgIfB4Ae2pL+Xvr35d5qTNf4MAzS?=
 =?us-ascii?Q?srKe9GriLMWqplxtdlEOEl2zQhSf281iWL4TnroXp7xVMSSZU9bHhgWFCHgH?=
 =?us-ascii?Q?eG2a+CalKYqkkv8HDvfCv0c3iQiTyw3fqKQEiEb0D9wfDXtL/VXd+WFsKqB3?=
 =?us-ascii?Q?HJZE4ak3WPF+vIt4Mila7SEIfVU7LaTUr+dX9eRvNpFdhaZp5iurLixOWV+4?=
 =?us-ascii?Q?VAcxcPsPXhojUr6oK/xHirlWSJzdN3Vi0aYaGnp3cgr8QMY5shYQ3KZnQTRG?=
 =?us-ascii?Q?BNvE454N2PlSPawfAcdKT5hd48ikPWv31n8jdRvc4AxpRJsrqeXHZuNhJ0HV?=
 =?us-ascii?Q?/rDiNYPQ/n0EqJlOojaOhMYGI1iQHeAH5/KgNtAmUjVogogou2IhrinlzhWE?=
 =?us-ascii?Q?PcAQ4GicYcw7hMT5/WH/ioxabwNdjnDkbPdMuJIfV5X0qjV6niv4rbWi4Zvt?=
 =?us-ascii?Q?mqrVEilgP+s546qjj1qnPya9Ae+IsmVCjOSSYKm9NSHAHVtgG3lo28WWjZUD?=
 =?us-ascii?Q?MdPakWlLVyNEkstgaO6b9hwWj7xQsXERTufkY7H2lRGPq2zt3LPmQTlo1s+m?=
 =?us-ascii?Q?ctmx05SQmh6R3opT3z4acrwzD2SX5zCTX6WmKbQ92cqH6BOSyjIIxSHovgOw?=
 =?us-ascii?Q?afu+KqW3OB+E2xsNYApbRC0wo7EIID9hPgF8hETeM4LbEDXtt88IWFWwKqxf?=
 =?us-ascii?Q?55f9/2LJa37HEL+RVYDPm3FNoyrS2axtlWUp3hCI0vAZsvdqypQ84Auu0/Wl?=
 =?us-ascii?Q?jYA67mwkWejE+1b+JZIDqFlZglttdByVW+qgTJQAFLkoru9I/qZYwAd6lkDH?=
 =?us-ascii?Q?qEKoQKFPqrOQvYNYXc/Gf6Sdpna9TjoJXBiPQyAA3ZynuNzUCjNdt4Pn/uqY?=
 =?us-ascii?Q?Nbpn6o/feTPM2aOo3xv2zjGhTtnhGpfkBBCmHxGES6fjBVdwlIGylk0oNPem?=
 =?us-ascii?Q?Njaohr4YCO1j+h4RH+N6fF/ih2gpQxzsz0K5GnSCsXOtKsATV7Boeg/SetC1?=
 =?us-ascii?Q?FLPV1f1rKm25gKrxlVVe9xdvOeeaJvVCTLo2Fh1YLafcoAKlhLvzTV+Z0bJX?=
 =?us-ascii?Q?6KVituCsxgpS9yd+VmxtpQqqROzEPZxk0SW/?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?sdBlqhGVjlJf+LJsmVmcuSk6L2G8T2/E7wyO3evDFzJ6oV24Z6d0UxPsT3Cb?=
 =?us-ascii?Q?FPGWikL18lTd2dxr7OjtQ6ajesuPuJnVwm7p3SKOPP3duoeSs73UnxI9cWyG?=
 =?us-ascii?Q?oIkr8unZj4r1JRoPDEK+0mEHoZ8CNRk11ZL/qXXOkWngU6/qmQmq3RPyyxU8?=
 =?us-ascii?Q?udkNTgZc8pWX8C+aHaXs4/vCGzJ7u3TgEEJkdxdbSGySPiSqe1Awrxa81JrW?=
 =?us-ascii?Q?7/8voydTyl+rhlGX2SpLrMgxAQ21Y4Q0xg9yPHe+IZR4P9i1FCx1oSyHC41D?=
 =?us-ascii?Q?HGgFTcaTXwTAvYUhWOumzGdUnf8bH5JxEk1qVktDh1qEcEOVdkH7lfj0un5N?=
 =?us-ascii?Q?Wbvl+3p3G+yxFfnOBWdfH5kaz3TE6DIOeZtImXaAyrsc90NEgZ81nVUJFXyq?=
 =?us-ascii?Q?lNaZK2HVpujz8O8tx56vGqXajHnitNrk0i8NUyM0puK5gJfqSvKa3mGd3Dk8?=
 =?us-ascii?Q?KAr5R4Gi/pmXHMTBllmqA1svhrcDQoAH1STS1/etTgIrxvOdo+AHMfdDcRdv?=
 =?us-ascii?Q?DoExkOTcoIXwEig7M4/jCcUSCoqY5hgP6wXo82tYhLAeRaa/60GTRUwZHz3V?=
 =?us-ascii?Q?eB57IJex0muwwFk02UACRBbLiYezsBDAdhtVCbSqhqiDdczTNdsr3DawHg8l?=
 =?us-ascii?Q?jxo6/9d5vJE7szAXdoLevf+JNVWZniv0NjxN+zzzD1jKgw4SB5QohXlcLRaM?=
 =?us-ascii?Q?9r1i0pkH9gyAeIQqEY89+xmql88xLIEDbu8VEctBnL5zDWimbi+UzNE8glqh?=
 =?us-ascii?Q?LknGCnTh76q6wZuJTGyklYr0oMPiJYCdITuxZKz4HYFyYoJKCmmJceWa7nJm?=
 =?us-ascii?Q?AXsHyCM1cO3eUbrqsex9HRMIYc3x4Ae851jS0ntjF9NRbMlpyEGwQmokD/Zc?=
 =?us-ascii?Q?S1dkSTLZGoczZav5SRXa3KlPKok3NvFKpXDJCghaU4GSm7hvg2egx724oY07?=
 =?us-ascii?Q?WlpDbRgeeBy/n5quISAk5Lo/jcpoMB9cyZybOS4gj7H8bNt6dJVijp33Vd/R?=
 =?us-ascii?Q?sfVHHhzTrK8E6HpZnQK+oxLxgTQL8gqQQhYUGWoY1bpre2hibyW4xLTAm1RA?=
 =?us-ascii?Q?yfzfMqFD2hnrwpyjIOymiCv96aEbzgvWRyErwkjx/Dzp+yz4qVrB9NH12Y47?=
 =?us-ascii?Q?7IEhuYvUYLOf7Y6hbZhxOXEuRYD/wrcS9lOmrFuPWR9uFM46Y2vDUnu6GzLP?=
 =?us-ascii?Q?LU4jD/5XQ66aM2Y4uBQUaoyyteEK8nbr8Mp1I4fpdc2a79y2qjm+kbw/xvMu?=
 =?us-ascii?Q?bMOIiABGE4aNutyos+gDiwf7SAPtuKn+A0qPHI7B9RfvdmTv12u4DRtbdLZi?=
 =?us-ascii?Q?Uv0KSuw5EYRv1p43pRs4fS26lCoznbyFdPmuVJJMSHVta7ZxEr0nmfmwbNN8?=
 =?us-ascii?Q?a70jvoS8Ur5qUDZwE5TZzoVyRpg2epUB6jG2qe8bP1aLAQ5ukTe9eoNbwl/I?=
 =?us-ascii?Q?3dVTpLsYCFmSYHtDTGCI1K1NpxmXQtiC9xZ5IpbeAwOZDvPcKzyNeKrzuiwD?=
 =?us-ascii?Q?fIH9o8WrQAeWJO4UmPPFOVTpOevTQS1cBeDoiCAbT9odHXlMYXGXjf314VfW?=
 =?us-ascii?Q?d4nUJF+GH7FTQoPBQY8hJb3YtZYE+Ktj+I6KnnvUblCa+oK0h/U+Ra5kn5Ft?=
 =?us-ascii?Q?T/XTLiBy+jd2pJsawGEumUk85F4XplDkFyBrkw0X7tk7U5nsRaYaHAmGI+U6?=
 =?us-ascii?Q?yheElMthqVzqS62IQPIHEKJsTB4xND+HjUJLOyJoEKcm47qFNnIVnrzE3mFB?=
 =?us-ascii?Q?rYzZ6fJDlQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB5602B543BFFC3DF6C86DD99BEDBCACO6PR11MB5602namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd5afe4-c700-4b09-3b1f-08de4752db2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2025 03:23:52.2959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1OimnFwxlcGC3kw3+DwehEuxIAIb9ZMAUYDan83M0UaLWSyyyb4bycw4JaP2v/qnpk08FNChIdSQ22XrpNJRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=695345cc cx=c_pps
 a=Ie6vhHcvS3zZlrI9i1bNAw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=9kKzhGd6x6r4V_nLhhcA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=h7FxzTiAY1FPcSNN:21
 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: kTgRIHcqa_csvYukgk1SHaXNq3G_FuZo
X-Proofpoint-ORIG-GUID: kTgRIHcqa_csvYukgk1SHaXNq3G_FuZo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDAzMCBTYWx0ZWRfX/DGPkuWqlR9K
 nKeF+mW3rRpCnO/3T9QyvLUIgTyZz6HFznegbgdf4wOnf5K5X+FN/Y3ai1VwLiiDvBUZ2IbP/O4
 vpD6Qmz7K+JN6xetbov+3aSqwNzucSQ1fT4+jLndwXrL27s1HPSfOHT2LOVeLWd75ehkhiV/h9n
 geR+SQPYjp505/IsI+zQHV3Q9KoLtXJGjc9VPSciiPV7waFRTl+P9MfnaHhhfa+Uci4Un/sQVSR
 t2eQFgiLb5EPtQ3ryp0bOL9ct+1VWBJA1oQyYSCg9mt7Len+ld+YNp24sYhArFTXMk1u576w+QW
 fKyguK3TKcZcxDtQd5M7+Xoshuvv2BuqeERf2dg3BaOcs8J+GSQnskkCOvzxhogc3OVo5AntW2P
 2H70jsP55ccaU7sj+pQHGENIhQRfQ+6cFrjDqeBSJTXJY7QXd+bap/zXcwsjiAJ9ngkmV6N2BC8
 w2tRtX7bt7MXoxXZwzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300030
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Dec 2025 03:24:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9510

--_000_CO6PR11MB5602B543BFFC3DF6C86DD99BEDBCACO6PR11MB5602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

The new go-mod-vcs recently introduced in meta-virt  has some some problems=
.

The first and most significant one is the misuse of BB_GIT_SHALLOW_EXTRA_RE=
FS. It causes fetching failure when shallow tarball generation is enabled.
Use the following steps to reproduce the error:

  1.  Add in local.conf:

BB_GENERATE_SHALLOW_TARBALLS =3D "1"

BB_GIT_SHALLOW =3D "1"

  1.  bitbake cni -c fetch

Error message: fatal: couldn't find remote ref v0.0.4
Root cause: the repos specified in SRC_URI does not contain the required ex=
tra refs specified by BB_GIT_SHALLOW_EXTRA_REFS.

The second one is the duplicate entries in SRC_URI. Example: errdefs in doc=
ker-compose.

The third one is the 'shallow=3D1' parameter in SRC_URI. The problem is tha=
t git fetcher does not support such parameter.
In fetch2/git.py: ud.shallow =3D d.getVar("BB_GIT_SHALLOW") =3D=3D "1"
So I guess these could be removed? And switching to use BB_GIT_SHALLOW:pn-x=
xx =3D "1"?

P.S.
I sent a related patch to bitbake: https://lists.openembedded.org/g/bitbake=
-devel/message/18656
The problem in bitbake is revealed by the current SRC_URI settings in meta-=
virt.
If you get similar error, you can apply the above patch.

Regards,
Qi

--_000_CO6PR11MB5602B543BFFC3DF6C86DD99BEDBCACO6PR11MB5602namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:171381498;
	mso-list-type:hybrid;
	mso-list-template-ids:307232828 838218684 67698691 67698693 67698689 67698=
691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;
	mso-fareast-font-family:DengXian;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1
	{mso-list-id:323894530;
	mso-list-type:hybrid;
	mso-list-template-ids:625743648 67698703 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi Bruce,<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The new go-mod-vcs =
recently introduced in meta-virt &nbsp;has some some problems.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The first and most =
significant one is the misuse of BB_GIT_SHALLOW_EXTRA_REFS. It causes fetch=
ing failure when shallow tarball generation is enabled.<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Use the following s=
teps to reproduce the error:<o:p></o:p></span></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo2"><span style=3D"font-size:11.0pt">Add in local.conf:<o:p></o:p></span>=
</li></ol>
<p class=3D"MsoListParagraph"><span style=3D"font-size:11.0pt">BB_GENERATE_=
SHALLOW_TARBALLS =3D &quot;1&quot;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span style=3D"font-size:11.0pt">BB_GIT_SHALL=
OW =3D &quot;1&quot;<o:p></o:p></span></p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo2"><span style=3D"font-size:11.0pt">bitbake cni -c fetch<o:p></o:p></spa=
n></li></ol>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Error message: fata=
l: couldn't find remote ref v0.0.4<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Root cause: the rep=
os specified in SRC_URI does not contain the required extra refs specified =
by BB_GIT_SHALLOW_EXTRA_REFS.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The second one is t=
he duplicate entries in SRC_URI. Example: errdefs in docker-compose.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The third one is th=
e &#8216;shallow=3D1&#8217; parameter in SRC_URI. The problem is that git f=
etcher does not support such parameter.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">In fetch2/git.py: u=
d.shallow =3D d.getVar(&quot;BB_GIT_SHALLOW&quot;) =3D=3D &quot;1&quot;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">So I guess these co=
uld be removed? And switching to use BB_GIT_SHALLOW:pn-xxx =3D &#8220;1&#82=
21;?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">P.S.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I sent a related pa=
tch to bitbake:
<a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/18656">ht=
tps://lists.openembedded.org/g/bitbake-devel/message/18656</a><o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The problem in bitb=
ake is revealed by the current SRC_URI settings in meta-virt.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">If you get similar =
error, you can apply the above patch.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Regards,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Qi<o:p></o:p></span=
></p>
</div>
</body>
</html>

--_000_CO6PR11MB5602B543BFFC3DF6C86DD99BEDBCACO6PR11MB5602namp_--

