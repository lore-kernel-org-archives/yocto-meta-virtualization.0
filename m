Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5B7C61CE7
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 07:19:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2001.1749626395786390428
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 00:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8257fd9919=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B4kN0x018688;
	Wed, 11 Jun 2025 07:19:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2m329-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 07:19:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8I+ClJgQZiZw0oKWR59ZbhCvqr3OaxgK8ZgcXTfyqZYIiOuSRBYb/OHZi0JCns1asep04HYXBw2d2Doj/jCSSsp6A3zr74pDS98ooY8qgEmhnpebi2hTMWETxcrodbdNEaBLBXKuGdXLCVqikA8aKSXd814GxoIXyFmh1bAzVAws83iQKUBz75+yx+YJujjVG2OCkefWV7nSGj03ztBaI6/0vGJMDqsFB8I2CmNRmRVo+Am4mpqvzh8EMn7xg4rjaOevl44ZpAiDdqxZqJqmHaHfzPpNoa01qXzmprG3J+ANPcT1yDQL/hsaYCHtHWlXSrXZLTf9YEy+iYE8bOv0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/bKr+1gn2yVh+cr4n9Lh0Rydn5vxQlWjngPqG4bU2c=;
 b=zPpdGfwM9uZDixPs2fjkpMO+EZ9Gov/2QDPMnYNe9+sjamliJx1VrwNTmOFyN9qbdKSrX8qwnvpGzfL041HfRqxVWNIDudTk9d6E7avePMGZOSvV8SR8z2qbZWtaiISFKOO6lMeaIsjLjE38kFtby3XdeP1m7E8M+QC3Pndx0rai6SaO9ywkTBWLWRZlRtTX4T84dd71TwSz9xhpCOS+YCmHPBWXw3uyz4i/BI4k1uTu4ws+icfdLytDm6Y83y5/BiPYjw1BIMbBbnayOgDOk+REbF80W5Il9R4ovd459S7DHs18dxz0E5vWFCpBrhsX7lm0barjHpvjVXpEnZWyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6452.namprd11.prod.outlook.com (2603:10b6:510:1f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Wed, 11 Jun
 2025 07:19:49 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.8813.021; Wed, 11 Jun 2025
 07:19:49 +0000
Content-Type: multipart/alternative;
 boundary="------------hNPOpgnP7mqjLJU0UPHirre7"
Message-ID: <65f0132d-1bba-4a61-b726-0b3dfd651af0@windriver.com>
Date: Wed, 11 Jun 2025 15:19:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][walnascar][master][PATCH] containerd: make
 cni_networking conditional
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20250528054841.2516534-1-changqing.li@windriver.com>
 <aEEBBxb7NxcvPnxo@gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <aEEBBxb7NxcvPnxo@gmail.com>
X-ClientProxiedBy: SG2PR01CA0157.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::13) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f821f6c-2890-4be5-820b-08dda8b859f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SDJBcFdHbzQwbXpORVBnQUdvRHQwN3REYmRLUDJIYXVtaHNPVlpHQ1Ywcms5?=
 =?utf-8?B?UGxHUlFlV3NXc1QyWlhVM3RpeHh2eVl0K1R0L0kzc2FKKzg4VVkvNWlybHVx?=
 =?utf-8?B?WGJqTmN3aU5XbXJzWkpzVXYvdnQxZ3BldWlMQjU4Z2lFWStGMWhlWG5kZDJl?=
 =?utf-8?B?UjBIamdFTmhZdmFkdnVQODVFRUhtZzZ4S21Qdmx2Q2ZmUUI2NVhJTzhpQnN5?=
 =?utf-8?B?THFzTGhKNnR5M0ZaTlh3bGlIaG5KeVg2aDJ1OUdoR2VJd1ZVZGJ5bFFlbHY3?=
 =?utf-8?B?UFNNU0FPcUtYY1FMY2VQREZDbEFDT3U4ZTdBOTFnRmFtOTBRNmtIb2hIazNl?=
 =?utf-8?B?b3ZJWVR5WWRjdk5jaWFPY2VFQlVyTEZSMFdrNmlIQyttdWNuT1VkS3pnRit2?=
 =?utf-8?B?dVRXdWUrTzlEYUwwaFA1clI0ZjlYNmtXa0hSQXBGbVJ6cUN1cUplTG9aT1RF?=
 =?utf-8?B?TFQyWU5PTnlhK3NpdExyMnBhN1dWaDBiNnUvcUtObTgwK2hCbW5xcWFNT1JC?=
 =?utf-8?B?MXpwUEZkMkRpQ3psbTBtNmhkWW0xdjVKZW9BdElZK3RjSWxBWk15c2Y2NlBn?=
 =?utf-8?B?cVRuNEg2OVFQVHVSdzY4ZE84cDVCZFFEUlNOZ3Z2ZTZZaXdkcXVEQ1lIZUtR?=
 =?utf-8?B?WERJZDVpUitJbzFlcUZ1OW03VHZaL1E3SXUvZ3llaHJMUmZPVkFFT0xFWUZx?=
 =?utf-8?B?RS9OOGk5bWNnSi93MUNINVN3NTcrdEE3SXBWZCtLaFFLcUFuU3NlTFAycHh0?=
 =?utf-8?B?VlJVQWZJdUZJb0phY1BYWE9mQ1ZGTHJhUThxWjVPWlh3U09WOS9raENsMEZE?=
 =?utf-8?B?Z3ZsUXpCaVhMS0NCZXUwZ0dhNVFncmpUVmxlSHVadm5OOHFFRWZpK1NFOTlM?=
 =?utf-8?B?TUtidzFRdHE3S3Qyek1wNmZkSmtXQk5nbVpMcVpnajRBV001bmV2NW1UVDZI?=
 =?utf-8?B?M1FKMTBHa1NrZ0NhN0tnakc4UlJ4dnNiQ29tWmZ0cUdFSGEwN09vMTVNcVhq?=
 =?utf-8?B?MjltZmt0MjQwTmNNdEJJbVg2WEJiNEVoWTRkcmhobnZubGFITHRHdDFBY09y?=
 =?utf-8?B?M1dualVEV0x0WUNjbzZ0UWtUTDE5SG9jUUpXeU9vYUlULzBRaWlVRE55VTBh?=
 =?utf-8?B?dGM4OWRZa3ZXY201QUsrOTVzV1g0MlB1dDhkRnIrQkl4Z1lOUG1Nc0w2a0Zr?=
 =?utf-8?B?ajMycUtDMU5oWkJCN3N2RmZxQXphbnVxZkE0L3dISmRxL05CcmtxUDI4SS90?=
 =?utf-8?B?eTRtcGpwcnZNcUxWL2ZxSTU4OUp3RFZDQ3JQOTRURS9OTWlqdi92UG1XK2oz?=
 =?utf-8?B?L1ZCbi9hdFR1ZnFMMlMySVluUmNPc2Z0cTl5bzExOCtvbFc5eUMxdGhuQ2V4?=
 =?utf-8?B?NUQ0TExJMXI4TnQvQzhidWNWeW52SmNvdnJ5QzRUZURmcTRvV3M1bUxJelVs?=
 =?utf-8?B?S3dWL1ZCSytVYkVuM2VrMkxIbzAvYXQvaE13ejJPTURYNUIyQ3lhWHBYdFBE?=
 =?utf-8?B?d1BqV3QzQ1lUM0ZaOTVJRGNQUGlMRmxVdFhvdERSNkl0NnFVNG8yQ2UvdjQ3?=
 =?utf-8?B?aDRDOThVVFZiaTFtZjhUbzRlaUZjUk40L2dleVFUVkF5TlRIUGtyUVExK2k0?=
 =?utf-8?B?THE4ZDR3cUp2cDVPWURjbzRFQmQwRWFwb3FjOXJkS0pmZWxVekV0bDQ3Umov?=
 =?utf-8?B?aXRkVC8vSTA5emUwRkpBNC9SZnhkWGRhQ2xrOSt2S3lCbFNkQjYvem1VNWpo?=
 =?utf-8?B?Mkg5WTlQWjBUSmdXeWx0ZDlrUmphenhDalcvQmZvclFoU01JMjh4K0QreVJB?=
 =?utf-8?Q?6EOxNr1KBU0oAZxPo9yREch8DBNm2zFEJBmFY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YnVjcmRVb2JGaEd0dGp3VDVrL295SGhZTjN4SDV5djRpTlpkclVCZFdLSTNj?=
 =?utf-8?B?bUtYLzFBT04rUS9YWFJuWW1OaTVCdWJUaGJCNjZNWnVML3BIeW5NL2UwTkZX?=
 =?utf-8?B?aXVrd2o4a1Jic0VBcDBRbHFqNUVEUG5KTVUyMXNzci9PM2oyRnIrMHNmKzBV?=
 =?utf-8?B?VWNmYWxkQkJOejQ0ckhxejQzM0o1dU10cmpXVGZlS2QwZlJLRHZmWlhXRVRo?=
 =?utf-8?B?WjJHTkZObDVIY0tweHhBdGt3T1d3YzhCQklPRVpwelZ2UDJvOWUwR3pMSHhB?=
 =?utf-8?B?SUk2VFFsT3BkdDJldU8yaURENml0UjhOZ1JldnJLZXVOVXJrQzBQdlFSWnBU?=
 =?utf-8?B?SnVkQzBaWVRrY1prYVR3YnFtYU9UZHFWMWJXUU1BMVZMQy9uVnlsT3M3M0ZR?=
 =?utf-8?B?d3VoR2VYU1NJc3pwQ3EzRG02RWk3VDBnMFpJVzgyNUxtVDFYdk1TTjN0a2VL?=
 =?utf-8?B?U0U1UEtybGEvemk3ZUZOUmJNZUt5SG82akxYd3dZMmx6SFVhdzdhTk44SGFY?=
 =?utf-8?B?UmNzanRtSGlkaDh3U1R5ekpUOU4zTDVwWGRnUHNya2s2RGxHdS9mNkJ6UVNt?=
 =?utf-8?B?VnBBOG4wc0JCWVRMcDN4UlF1YnhBcVM5cVNjOG5TM1ppWXdYK2JKNEtYcGJj?=
 =?utf-8?B?TW1CT1JBa1RHUW94N0RLcWU0clJBUTBXMnY3N2x5RzlsZkI4MERLSFNSZ3Ru?=
 =?utf-8?B?ait3S0tjV0JEOVBmeFcwNnVWUlZtU0xhRDc3d1JHa1c3bW9IakRYK0ZSdVZM?=
 =?utf-8?B?RWpaSlYrUmNLNUJQd2Q0a3BTakdnYnJxVW1SaXZ5dVVldHdlWkk1M3EwZ2Yy?=
 =?utf-8?B?bDhpMU1wMEROMWl3dVlLc1UvRVFGYU9rRmZPUi82OE40b2EzMlJUQSt5cUt5?=
 =?utf-8?B?ekd5U0w1VXdqekQyOXhPaXZFZ2NlU21BWHlMTnZUWE8vKzNpeUtXUmFCYUVu?=
 =?utf-8?B?QU5VMEtjMlBnRjdVWHZaUjBKQ2ZMb1dkTlh4NTJKSnVCL2ltK0RYYVZzVlh1?=
 =?utf-8?B?QUhQWDQwQjlkdFRNRmZYY1FTbkNHZlZlVjk1V2g5ZzJHUnlnemlPeWYyaDFS?=
 =?utf-8?B?MWRoUi8xL0dIdmZxbHlpOXp1clF5UkNvQlVLUnJRRDNWby90R0xVNk5OMlpa?=
 =?utf-8?B?Z3IycDV5Nm5VTXNUcHhxVTl6clB6Z0hVdkw5elhUYjlXS0lncnY3T0dUb3ZR?=
 =?utf-8?B?RjBQNnFHWENhdzM4K25kcHJmRlpYQURrK2xLOS94cCtGbWt5bVFBVEVxZTVl?=
 =?utf-8?B?cC9CUmt5NXplQ0JxSDRnbDQrRzVnZE4rMEhpNlE1RFV4VDFsL3dRN2RsNGlr?=
 =?utf-8?B?RG5qaHk1UkliQlpRV1hBSU00T2pkMHpPZklKREFsZnY3S2t2Q3hFNnNvaG1R?=
 =?utf-8?B?MHZ4REpBV3JVTXhRODJvTlp1Uy9SUTNVQTFwbEJIay9hYzlUS1FTaTBpdkls?=
 =?utf-8?B?T1BVUlI4NXJCeU02bmxoZXZtRk16cFNEV1pTUWRRQStUcFVxbW82YndRYmVa?=
 =?utf-8?B?SDVDWXpHRmd3QktzVVpEOGE2QnZ4elV0cFYzMDdsekFRUXdRWlNvN1ErNlR2?=
 =?utf-8?B?MWQydTBreXNvNE5EeklCNEZmMnZ6V0l4U1dUM3JVczBjVFUxRW45Y2lXUVZY?=
 =?utf-8?B?eWYwa0lxcU5LTkd2cTN0b1EyNzJCYWZuL0o0clhZYXVwbnFKQUEvRCtQM25m?=
 =?utf-8?B?MXc5bFM1aDNDTml0c2FnMUlxYlJBS21xc0lUU3JJUm9GaFcvL0Z4cWpoRkt0?=
 =?utf-8?B?enJ1ejloN1A0a2hVRHpaK01XaWY4bW9DMFdXRXlNOWtFeUNPR2VaM0IrTzhp?=
 =?utf-8?B?Tmo0cHcreG13cWp1R3craUhXcW1VUlc4VUpzMUdCSGlNN2ZEZFFXakpCbUFr?=
 =?utf-8?B?QjJYaVJYS3E1bm9FTVA4Rm9qZmNTMTU2a3RtUER2RCtGazRhNHBTeW0yTFFw?=
 =?utf-8?B?cFkyL2t6R3hNSEdHcmwvR252U2dvRlpNcW9CVXp0YlNaRkdidS9aUTYzcGpW?=
 =?utf-8?B?ZDFuSENWdDNseGQwZ29IeWkvZytLMFRMRmltNlQyYkoyVE1DMDU3NUpsQVRZ?=
 =?utf-8?B?MWRmUkxidStLOWVnSlNwTm9Jbldnd0RjWmFOY0xVcUpZa0x1MzlyVE4weWZT?=
 =?utf-8?B?cVgzdE5UeXhUcXlGV0tFZnJDZnNvTGlubHh4V21xTlRpR1ZUK2FBM2NTKzRF?=
 =?utf-8?B?WFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f821f6c-2890-4be5-820b-08dda8b859f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:19:49.6647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/N30V3T55/nbysBJ7+PQqMaagFaEhyVD1/Grnm02nXWHFFxri6AKZrs2X6eFlzGThJkOYCUWHZVljIECbhqWw6R1tVGPGGA4L9hl6Dvrcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6452
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA2MyBTYWx0ZWRfXxldcKhg+1R6w 9JTrNRp1BeaMDlpmt+LHFxtTDJfppWHaHhSVmkRJIfDR+YcBEMbIvXGsnIBSJvv0yoZKUGp/e9x qMjQuDP/42Ht9S7lZoqoXPc1qpbt2CRavCrrnytYPEgywXH22VuxseDHGs51uGL3weMP4VwPqlq
 WCIm8k2PcCyueX872KxBu5dK2s3AdAwCYYLzz6iheeARef6A9JrJECqi5MUvGrTPgQTzZgzwwR7 OlUSQmTIyo4B11KdlgRRqsGCeGoD9Cf3Eje/dmxvQR5zW603E8Jg32fTjUXXqRhtzCgO1+W3Lo7 OLZiOH/rHWLwFYnarWFpDcf6od2zzhqJIqbsYcJ/z65B/+dsbe/xomL+v1hMF13pl8+dohWwDhR
 90HTwA9p1xIQbrLoGORPDArl79EuyKZSNuCN0CC9syA8/54ANo9fvz66AV9YY00AFhBaRYS2
X-Proofpoint-GUID: p_Gxi6qutatRz-rD6nZ0OuWXcQrILtQ6
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=68492e1a cx=c_pps a=pz8Qo8/3TH+4vYshqIBPvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=5j4AJg3F7FM5ou1e5GQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UBFVfQAFWYhimOpKR3UA:9 a=m4KBFrrY9iYaBTan:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: p_Gxi6qutatRz-rD6nZ0OuWXcQrILtQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506110063
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Jun 2025 07:19:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9277

--------------hNPOpgnP7mqjLJU0UPHirre7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55B4kN0x018688


On 6/5/25 10:29, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> In message: [meta-virtualization][walnascar][master][PATCH] containerd:=
 make cni_networking conditional
> on 28/05/2025 Changqing Li via lists.yoctoproject.org wrote:
>
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> make cni_networking conditional, when k3s, k8s is enabled, the
>> networking configuration will be provided by the orchestration package=
,
>> containerd-cni is not needed. This is for fix the following error:
>> PACKAGE_CLASSES =3D "package_deb"
>> do_rootfs failed with error:
>> dpkg: error processing archive /path/to/oe-rootfs-repo/corei7-64/./kub=
ernetes-cni_v1.32.0+git0+5fe148234f_release-r0.deb (--unpack):
>> trying to overwrite '/etc/cni/net.d/cni-containerd-net.conflist', whic=
h is also in package containerd-cni v2.0.5-r0
> We shouldn't need to do this to fix the package install. Whether we nee=
d
> to do it to make sure networking configurations don't conflict is a sep=
arate
> question (and one that we need more information to decide on).
>
> The design of the cni_networking is to allow co-existence of packages
> that need to configure cni networking. So we don't have to do what
> you've tried to do in this patch.
>
> Let's rename the files referenced in CNI_NETWORKING_FILES to something
> more specific to the kubernetes packages and then they can both be
> installed at the same time.
>
> That's one patch.
>
> If you can show me that the two networking configurations being install=
ed
> at the same time cause issues, we can then do the coordination betwen
> the packages similarly to what you are doing here in a second, separate
> patch.
>
> Bruce

Hi, Bruce

Sorry,=C2=A0 I did not notice this mail before.

According to kubernetes doc:

"If there are multiple CNI configuration files in the directory, the=20
kubelet uses the configuration file that comes first by name in=20
lexicographic order."

Now,=C2=A0 both containerd-cni and kubernetes-cni use name=20
cni-containerd-net.conflist.

How about keep containerd-cni use name cni-containerd-net.conflist, and=20
let kubernetes-cni use 00_cni-containerd-net.conflist, so that=20
configuration in kubernetes-cni

will be used if both package installed?

Regards

//Changqing


>
>> Refer [1], "--no-force-overwrite" is set for dpkg, so above error
>> occurred.
>>
>> [1]https://git.openembedded.org/openembedded-core/commit/?id=3Dcb95ba0=
79960411775c57ab864d266e15a6292d1
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   recipes-containers/containerd/containerd_git.bb      | 2 +-
>>   recipes-core/packagegroups/packagegroup-container.bb | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes=
-containers/containerd/containerd_git.bb
>> index c683fbeb..def7591a 100644
>> --- a/recipes-containers/containerd/containerd_git.bb
>> +++ b/recipes-containers/containerd/containerd_git.bb
>> @@ -102,4 +102,4 @@ RDEPENDS:${PN} +=3D " ${VIRTUAL-RUNTIME_container_=
runtime}"
>>   ## This may need to be made conditional on K3S or similar being
>>   ## configured in the distro, since we may have collisions.
>>   CNI_NETWORKING_FILES ?=3D "${UNPACKDIR}/cni-containerd-net.conflist"
>> -inherit cni_networking
>> +inherit_defer ${@bb.utils.contains_any('DISTRO_FEATURES', 'k3s k8s', =
'', 'cni_networking', d)}
>> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/re=
cipes-core/packagegroups/packagegroup-container.bb
>> index f5e20344..8cbcf28e 100644
>> --- a/recipes-core/packagegroups/packagegroup-container.bb
>> +++ b/recipes-core/packagegroups/packagegroup-container.bb
>> @@ -69,7 +69,7 @@ RDEPENDS:packagegroup-oci =3D " \
>>   RDEPENDS:packagegroup-containerd =3D " \
>>       virtual-containerd \
>>       packagegroup-cni \
>> -    containerd-cni \
>> +    ${@bb.utils.contains_any('DISTRO_FEATURES','k3s k8s','','containe=
rd-cni',d)} \
>>       nerdctl \
>>       tini \
>>   "
>> --
>> 2.34.1
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9261):https://lists.yoctoproject.org/g/meta-virtua=
lization/message/9261
>> Mute This Topic:https://lists.yoctoproject.org/mt/113339575/1050810
>> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub=
  [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------hNPOpgnP7mqjLJU0UPHirre7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/5/25 10:29, Bruce Ashfield wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aEEBBxb7NxcvPnxo@gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

In message: [meta-virtualization][walnascar][master][PATCH] containerd: make cni_networking conditional
on 28/05/2025 Changqing Li via lists.yoctoproject.org wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

make cni_networking conditional, when k3s, k8s is enabled, the
networking configuration will be provided by the orchestration package,
containerd-cni is not needed. This is for fix the following error:
PACKAGE_CLASSES = &quot;package_deb&quot;
do_rootfs failed with error:
dpkg: error processing archive /path/to/oe-rootfs-repo/corei7-64/./kubernetes-cni_v1.32.0+git0+5fe148234f_release-r0.deb (--unpack):
trying to overwrite '/etc/cni/net.d/cni-containerd-net.conflist', which is also in package containerd-cni v2.0.5-r0
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We shouldn't need to do this to fix the package install. Whether we need
to do it to make sure networking configurations don't conflict is a separate
question (and one that we need more information to decide on).

The design of the cni_networking is to allow co-existence of packages
that need to configure cni networking. So we don't have to do what
you've tried to do in this patch.

Let's rename the files referenced in CNI_NETWORKING_FILES to something
more specific to the kubernetes packages and then they can both be
installed at the same time.

That's one patch.

If you can show me that the two networking configurations being installed
at the same time cause issues, we can then do the coordination betwen
the packages similarly to what you are doing here in a second, separate
patch.

Bruce</pre>
    </blockquote>
    <p>Hi, Bruce</p>
    <p>Sorry,&nbsp; I did not notice this mail before.&nbsp;</p>
    <p>According to kubernetes doc:</p>
    <p>&quot;If there are multiple CNI configuration files in the directory,
      the kubelet uses the configuration file that comes first by name
      in lexicographic order.&quot;</p>
    <p>Now,&nbsp; both <span style="white-space: pre-wrap">containerd-cni and </span><span style="white-space: pre-wrap">kubernetes-cni  use name cni-containerd-net.conflist.</span></p>
    <p><span style="white-space: pre-wrap">How about keep </span><span style="white-space: pre-wrap">containerd-cni use </span><span style="white-space: pre-wrap">name cni-containerd-net.conflist, and let </span><span style="white-space: pre-wrap">kubernetes-cni use 00_</span><span style="white-space: pre-wrap"></span><span style="white-space: pre-wrap">cni-containerd-net.conflist,  so that configuration in </span><span style="white-space: pre-wrap">kubernetes-cni</span></p>
    <p><span style="white-space: pre-wrap">will be used if both package installed? </span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Regards</span></p>
    <p><span style="white-space: pre-wrap">//Changqing
</span></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:aEEBBxb7NxcvPnxo@gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Refer [1], &quot;--no-force-overwrite&quot; is set for dpkg, so above error
occurred.

[1] <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=cb95ba079960411775c57ab864d266e15a6292d1">https://git.openembedded.org/openembedded-core/commit/?id=cb95ba079960411775c57ab864d266e15a6292d1</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 recipes-containers/containerd/containerd_git.bb      | 2 +-
 recipes-core/packagegroups/packagegroup-container.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index c683fbeb..def7591a 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -102,4 +102,4 @@ RDEPENDS:${PN} += &quot; ${VIRTUAL-RUNTIME_container_runtime}&quot;
 ## This may need to be made conditional on K3S or similar being
 ## configured in the distro, since we may have collisions.
 CNI_NETWORKING_FILES ?= &quot;${UNPACKDIR}/cni-containerd-net.conflist&quot;
-inherit cni_networking
+inherit_defer ${@bb.utils.contains_any('DISTRO_FEATURES', 'k3s k8s', '', 'cni_networking', d)}
diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index f5e20344..8cbcf28e 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -69,7 +69,7 @@ RDEPENDS:packagegroup-oci = &quot; \
 RDEPENDS:packagegroup-containerd = &quot; \
     virtual-containerd \
     packagegroup-cni \
-    containerd-cni \
+    ${@bb.utils.contains_any('DISTRO_FEATURES','k3s k8s','','containerd-cni',d)} \
     nerdctl \
     tini \
 &quot;
--
2.34.1

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#9261): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/9261">https://lists.yoctoproject.org/g/meta-virtualization/message/9261</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/113339575/1050810">https://lists.yoctoproject.org/mt/113339575/1050810</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------hNPOpgnP7mqjLJU0UPHirre7--

