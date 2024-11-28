Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6DED690EB
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 08:20:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.90260.1732782047635354236
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2024 00:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1062260cf2=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS61AmH014476;
	Thu, 28 Nov 2024 08:20:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671b0seb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:20:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbyOzj5uguJpAfg0u7Y4PHlIr72dg7hxlI/CxpcJfbiTTMPPs8K10boCS2+HXcLqdCNzJg8jl3BaVq2Izc4NMz8x9CmYRKVkjonROqBjKu6u15P822L8U7dtpKEsSUHe21Lo4wo52JkpNn3HWpxqNJOL2xq/rKrB8kzQFUOw/x0RJ5Gzw6p+DmWmcOzV2W86KAeRzvHH1vGDD+zG1fWRGHWBYDYGcyjo/vXUG+DwA+6Ppa6gGCQBidPSaOyEsvLpYzqAqk7s7ZW31GhFUXgpiM1K1Q96dF3EXgPS/8Iv9s0t272zr1e4RBUoQsotTuGIjYxkFf5xSenv4Eet9Egb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUSosLms6ilnxV1yEhuqg15o6Vajj3ZZD0murL2dft0=;
 b=BLCiQNVVl31XEOTB7g6XXfO1iW/ma3uyGj7xgC9um08fSuTfKbwAd8atk2We7JItE/APdgwidboyJtCddUw0XQfi7Pa0fmIR9ymLnSjo/5eLhpcVy8bsl867JOsW1smBxCkbP5BgJuNNRxFnPbsTlQt9Eaw3nODE5kHj3iNgWv0k6qvXJ3rGytc+xOHxRONsPxS/lNMsN5DcKnFdDojEyLM7rQ9CzFGf8fdQ1FU6F8oY2h7yLY2ex0uuUidooqDIXYWh1lnBjU1elsoZSVB+cRGmwUf5PdFWqK50qLyMjvZYAly+9JV1QuWXLYT1rwOWyvwnIQoidGR5fXJa7KB4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 08:20:31 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%6]) with mapi id 15.20.8182.019; Thu, 28 Nov 2024
 08:20:30 +0000
Content-Type: multipart/alternative;
 boundary="------------39omK7sVTEyRF4Osw5ce5JeP"
Message-ID: <6287fbe9-7051-49eb-88c3-682edbe32389@windriver.com>
Date: Thu, 28 Nov 2024 16:20:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] cri-o: enable ptest
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20241115141231.1778125-1-peng.zhang1.cn@windriver.com>
 <Zz64Vljz9C29rI2H@gmail.com>
 <b86724f6-f3c9-47fb-878c-549a3c3d0b0c@windriver.com>
 <CADkTA4P2ZW15HfY2_Q47_5DjTpTpwQEMmGKJDikxK6T+XH_N=w@mail.gmail.com>
Content-Language: en-US
From: "Zhang, Peng (Paul) (CN)" <peng.zhang1.cn@windriver.com>
In-Reply-To: <CADkTA4P2ZW15HfY2_Q47_5DjTpTpwQEMmGKJDikxK6T+XH_N=w@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:3:18::35) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW3PR11MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d33fed-8028-4b1c-431d-08dd0f8585a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bWpJUCtqak43Z3hOM0V0ZlVkYWtpYUpWdUY1UnVIRWdiNXpCaVMyQVFpeFEz?=
 =?utf-8?B?MytHd1NWU2l1RXpIWFFrK1lUOUJqYWVaQXFoeHcrM25DNWVrcVIyRnJ4RWFN?=
 =?utf-8?B?cXRUR21tT3NSb0VjNnpzNjNYelJpQk16SG16ZEhYeEhjcnA1Y3JlTmxMVmRK?=
 =?utf-8?B?ZFV6cXhFb0RHaVEzS1IzRUUrd1NNblI5RTFBYXJRSGFzYldlbkV4RVN1KzJm?=
 =?utf-8?B?TzBxUXpFTzVBa0lMc0xjVnFtUkkrZHJUMEcyLzhkbjBhNzR0UlFVQzE5Zy9k?=
 =?utf-8?B?WlZXckNIdGw0N25rWVd0bEx3UUM0VXdxekFMa1g5UkRNbmx0ZVJ2L2l3eXU2?=
 =?utf-8?B?eFNkdlF0Y0h1RXgvY2VWbGFENWdndkJKSlM3dmVTbEZ5cWltcExRSzBhN1c5?=
 =?utf-8?B?b0ZUemVZR1BrTnNPMDJ4dHpxNE1maGx5eFV1VUM2cTdSOTFLbG5Kc095MG5O?=
 =?utf-8?B?TFZWNVFiUHNzbXRMOXNWUm9GKzkxcG1kNzNjMmljSFRVYXpDdHA2Ly9qdXE0?=
 =?utf-8?B?b1Buc2dUNVF2MU52NVVuMGh2aFRCWVorVjFtbklvc0Mvc2xGdHlJOG8ydnAy?=
 =?utf-8?B?VllFSlhwVjdRc05FbThpaEJNTmdIbXA5bWpIV3ltMXRUUUlvMkN6QzQ4c0ZT?=
 =?utf-8?B?N1kvNm1EbW03ZnN6bEViYktzRERXZndqRVVhV0pZWXJJNDR3NG1YU0RXbGQr?=
 =?utf-8?B?ZXRnQStXdWNrNVNMUld1VHBhS3dGQnFqbnE1WEttUWZlM1Vxci9DNnRJZk9h?=
 =?utf-8?B?bGs2dGZkRUtCdklsanh4eDR1NEp0UHJoblFxS0svcW1pVzY5N2NiWHFvTmU0?=
 =?utf-8?B?YS9Ed01idkVmeWYzT0MxQ2lrWE5vZVpLZ21XSExPT2VkbkdqVGxEUFJ0b1ky?=
 =?utf-8?B?VlJVd1prWDZOcXRFVjNHeVZDU1hjYnM3OTFqS1lNankvcXBNUGZFNTd2clY3?=
 =?utf-8?B?R3dKRkpSZ1o5RzJGYkhIMXdLdG1IenZZbXUxWVFvVEZKQmdVQ01YMS9GL0lB?=
 =?utf-8?B?enNWN25XaVdKWm5SaStlMThyQUZYZ3R1OHJRaEFlWitTYzRPOXNDOWhjOXBm?=
 =?utf-8?B?cGtJSWo4QjZxRWNWWWxxVFFuVG5BWmtwY09jUlVsSDRPeDhwMlpNa3hqaUJj?=
 =?utf-8?B?eS95dkVBSUNjT2tDNWZyMmlVVGNiMkdqNUk4OHFsM1EwVTNlVmt4d0NZQmNh?=
 =?utf-8?B?VDYrZjJMMlFyVmVtT0Y0QW0yS3VUM09TMU40Y0poV3ZkVnk5UkVHZUlUblAy?=
 =?utf-8?B?OE1nTlZiVjNUK0tjdUpzR2hPODJ3Y3dMTThkYkpZbGQvWVN4S1E4dVVUdEhW?=
 =?utf-8?B?eE1OMGtxemdZNXNqNFFmeDYxRWU0WDlhenNpVklnRFE3dEwzcmpySmJ6Ym5C?=
 =?utf-8?B?akpKWTRLWW4zOGxPVTVDK3pZNDBCU1lVZFdOWmVGekpmYjVhRzAvKzN3SklK?=
 =?utf-8?B?UXBPdUdnMCt3OThja0ZLNHBlZW9tMHBrNWZ3WFk1MWhMNmFraU56QTlBc3Nv?=
 =?utf-8?B?T0NnVXNSLzByMCtUSFJka1Y0dW0wM2RFMWt2alhHajh2SVNuYW9pNXpCVkVM?=
 =?utf-8?B?NmY2NklPT0ZpTCs0Qndac0ZHckk1SXBFVlFRSTF4NTlKNkNBRGRRYmVGYWM1?=
 =?utf-8?B?aVlKeldXTmtselVvb1pWSEQvazI3U0dDeGdpU1pzVjZYbi9hNHZIL3NFUFcv?=
 =?utf-8?B?aHRXWG1lV2VINHE1azdZUGI2K0NjYkFKMVgxWjM1cTROaGQrVXlScUo0Q2NI?=
 =?utf-8?Q?Ikaa4DNBq+xf8W8GyY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U3o2bGk4Q1Vmb3VDZlZER0ZycitReFowcW9KRi9YaWNKMng2ZXVGNWRaeVNz?=
 =?utf-8?B?Ump6RXE1aHlSWDZDUlRGVEdyTHE3dlZlMjhDdmRiSU5vRFRUb1I0SW53NDkx?=
 =?utf-8?B?UngvQ045WjlKOU02bVJSK2JpQ0pHakFGTlBQdFRIOGFsL0kyUUx2bzU1UUg2?=
 =?utf-8?B?L0JvWThZWGFoVk5MTmV4RmRMZGpZMFBLR3RnN1NlUFk2Y1c1cU9BbndVUUVP?=
 =?utf-8?B?ZUdacC82NUhtanlncm5ydUZCTUd6dGhBdmJ2RVNzS2tTYWJXY1ZGVENEMjhQ?=
 =?utf-8?B?VE1DT3VGNUhOUVU4ZUdGYnZCNUJHWnBodzdOZUFGc2F2dkdvVVFTSVluSld3?=
 =?utf-8?B?N2VEdlgrK1JpNXN4Wm16NEJiWUpHMzZxQTliZTgvR1JITURrN3hPYUR2eC8y?=
 =?utf-8?B?RERJNzFFNUFDZDZ1Y05CRkhmTlBqWC9EVDVpY3hQMGN6R0xFMUtCMWNucVZ3?=
 =?utf-8?B?WmJ5RlRJdVdrSXAvY0E3WWpEdHFCaGEwS1F1Nm5tR1Y2cmVuK1lIMFhvSlNl?=
 =?utf-8?B?WlNSbGhDTmw4aU45cklYMnpQVFRPVy9DaU40UnFQMzVudEp5YmsvNkxYbHNu?=
 =?utf-8?B?MXdTdWRKRi9kTFNOWVFJOXZRTHJjUW93YlgwMW9MUk1VakVncW1YU2R5Ni93?=
 =?utf-8?B?ZU12aXd4R0Zpc1RKWlpiL3k0WGlKSnZqeDNGTkVwVkswU1NBc2hnUzdzWllR?=
 =?utf-8?B?UUd3ZlVxbmJ2ZnladWpBczA4dno1RHRkV1ROQ3cvLzRER3kxdHlsaHorYnVT?=
 =?utf-8?B?bXA2aTNOK0U4MVBOcURlS0IyNUNhd1U4N0ltOEpjdkUvb2F5Tm1WZ3o3SWJK?=
 =?utf-8?B?UkN6ZGo3QzFDY3JzY1d0K1JOLzBiRkUxMEdFZ2IyUFNja2MxRVBSa2dlVUhF?=
 =?utf-8?B?TjhDSnZlWFdDMXl3K0VuS3FQL0JTYlI1NnlVY1VmbjlteVFmeTlZRnZrSFJV?=
 =?utf-8?B?eFQ3ekRCZEZseHJMN1prT0U1RFlCQ2FDakNFWTFhMzVsYWo2dEx1VEJ1N2VU?=
 =?utf-8?B?cnhDQlFsZHlLbkxuKzdObThtTGVrUWdTeEpnRkxUN1c3andaL29DQmRqK3ht?=
 =?utf-8?B?cCtKelZLdEROUlZjcUw2Y05CWWhzOUdOS2x5UmVNSFZRMmNxZ3lKdnlJamRW?=
 =?utf-8?B?YzQyNU1GZEJza1pJZWJIVUdjdXNwL1k4bEYxSTRDaE5NdVovWi9uR0xSYUk1?=
 =?utf-8?B?WFlkVUtxU1Vva3hjamhRVkl0ZXN1czREYlM5K2FBaUtNMENCSmt0M01vdzJl?=
 =?utf-8?B?bXBWbllyam95RnhXRjcyczljR2U4YXRtL2RJRE5ieWV0dlp3emhNR0h3N295?=
 =?utf-8?B?NlRTSlNmMDJqNllqcVAreGhPOFZlc1dZd0gvaWNEU2JOcUlMTCsxZHVud0NO?=
 =?utf-8?B?bUY2NHNqM0VBaC9lWXltWkRRdWJIQ1hSaWtJYy9mWUFYUDhqdnl3Q0V0ZG5U?=
 =?utf-8?B?dndva1dQK1dJMTNUM3cydWEvVlZ6OExucE5YVm5GUkk2VFZwaWZMQjdzRkY3?=
 =?utf-8?B?TlBvRHo2ekp4ek1uei8xUkQxVlZ1TGYwVitZR3FoQktxY1N4S2NmYTBnbTBo?=
 =?utf-8?B?eGNKRWhSVkhFY3IzWU9YNytXR0pDZDd3Nkx3S1M4UTZPVVpIb0ticTFnL0Nn?=
 =?utf-8?B?d1VPYTdsdXU4Um1Lbk5TNllFTEhKUWoxUCtRZ3E4OU1VaVczYzgrRWFrM1Vv?=
 =?utf-8?B?aUhnZTdrSVBSdmxKVjhjK3d1cEhsanZjc3BadXZBZUoyNEwzcjlpeGZRUHpW?=
 =?utf-8?B?cWtTaEVBcW8rTk5mbDRBRTBIclFtQnN3Szk1cDZqNFlQRW80Z2VoZGc1Zk1k?=
 =?utf-8?B?WGQxNmZmWEZEbURtQXY0czU0VVBDZFlDTjc3RDluUUdDMEVzMkhYWDNQeWo5?=
 =?utf-8?B?RDhaSTREaFNKUlF5b2czdEJ6SUZmVWZKenlkZkdWdnFsVUFDbDljZk9idjB0?=
 =?utf-8?B?UWpjcHlFSmliMDBXcXlaVS9MSS84TFF3ODByQmF0dm53TFppRUpmMmhKd2Ev?=
 =?utf-8?B?MDZjY1I1RUUzMWEzOXluQzBqNWxXdUFOcm5NZENlczljdE54ckdUd1JRdHpk?=
 =?utf-8?B?NnczSHVPVmRDZVhnVXd6eXdoQzVxc1dNMDY5M3d2UHlJWXMrRHlmRmM4RWt4?=
 =?utf-8?B?R3FMNlptVHY5WnpvVHQvdkU0bndRb0RpbHhCRTNiT21VNXdGZmJlQWtzMmNO?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d33fed-8028-4b1c-431d-08dd0f8585a7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 08:20:30.8263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+pRVea8oiiv2VRtbv2CJUDS3f9t6yTXqqGGeiiVszRwLioKiykA1wAA8ozfttTIHS5qlmRz72TQGO69lfBzOSqZTHAhJXzJrPD98Wu4oPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
X-Proofpoint-GUID: wCfi8HnJDBJeNdwnVLRsne05PB6YZF8F
X-Proofpoint-ORIG-GUID: wCfi8HnJDBJeNdwnVLRsne05PB6YZF8F
X-Authority-Analysis: v=2.4 cv=TIe/S0la c=1 sm=1 tr=0 ts=674827dd cx=c_pps a=OnljjeCONrlUuPUItWmgXA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=zfDz3bfgAAAA:8 a=NEAV23lmAAAA:8 a=FlthF8r_AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=AmVBzizw25rRqgOQL-QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FhIod923Cu35Age6kz0A:9 a=16JWHNGZuQRlns6f:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10
 a=ImwWUX5h3JJ3gRE9moBe:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=N25aw_RMdTD0XpBlQSev:22 a=zmzZ-Wb6iNJltdUPe3kN:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-28_07,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2411280066
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Nov 2024 08:20:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9016

--------------39omK7sVTEyRF4Osw5ce5JeP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AS61AmH014476


On 11/21/2024 10:04 PM, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Thu, Nov 21, 2024 at 4:13=E2=80=AFAM Zhang, Peng (Paul) (CN)=20
> <peng.zhang1.cn@windriver.com> wrote:
>
>
>     On 11/21/2024 12:34 PM, Bruce Ashfield wrote:
>     > CAUTION: This email comes from a non Wind River email account!
>     > Do not click links or open attachments unless you recognize the
>     sender and know the content is safe.
>     >
>     > In message: [meta-virtualization][PATCH] cri-o: enable ptest
>     > on 15/11/2024 Zhang, Peng (Paul) (CN) via lists.yoctoproject.org
>     <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!Ajve=
Ydw8EvQ!dcMJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr=
4uIRv3_a6xuE9I2eX1AUfzkOaoUePcw$>
>     wrote:
>     >
>     >> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>     >>
>     >> The ptest build for cri-o was previously disabled due to issues
>     >> introduced with Go 1.11, which borken the build process. With th=
e
>     >> current Go version, these issues no longer occur, and the ptest
>     build is
>     >> now functional.
>     >> This commit enables ptest support and resolves the "TMPDIR
>     >> [buildpaths]" issue encountered during the ptest build process.
>     > Can you include a log of the ptest running in the commit log ?
>     > That way the baseline pass/fail is understood and captured.
>     The CRI-O ptest suite consists of a total of 382 tests. Including t=
he
>     entire test results in the commit message would make it overly
>     cumbersome and difficult to navigate. Instead, I propose including
>     only
>     the list of failed and skipped tests in the commit message, as thes=
e
>     provide the most critical information.
>
>
> That's acceptable for me. If we just put the total number of tests,
> a general overview of the types of testing and then anything
> notable (notable here being the skipped or failed tests), then we
> have a good reference for the initial state.
>
>     =EF=BB=BFAlternatively, the full test results could be stored in a =
README or
>     another documentation file. This approach ensures the
>     comprehensive test
>     results are preserved as a baseline without bloating the commit
>     message.
>     =EF=BB=BFWould you prefer the abbreviated results in the commit mes=
sage, or a
>     detailed log stored in a separate file?
>
>
> See above. Just the summary in the commit, and a README with
> the initial status of the tests stored in a log file.
>
>     >
>     >> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>     >> ---
>     >>=C2=A0 =C2=A0recipes-containers/cri-o/cri-o_git.bb
>     <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!dc=
MJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6x=
uE9I2eX1AUfzkOQ5BxFg1$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0| 37 ++++++++++++++++++-
>     >>=C2=A0 =C2=A0.../0001-Add-trimpath-to-build-nri.test.patch | 31
>     ++++++++++++++++
>     >>=C2=A0 =C2=A0recipes-containers/cri-o/files/run-ptest=C2=A0 =C2=A0=
 =C2=A0 | 11 ++++++
>     >>=C2=A0 =C2=A03 files changed, 77 insertions(+), 2 deletions(-)
>     >>=C2=A0 =C2=A0create mode 100644
>     recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.=
patch
>     >>=C2=A0 =C2=A0create mode 100644 recipes-containers/cri-o/files/ru=
n-ptest
>     >>
>     >> diff --git a/recipes-containers/cri-o/cri-o_git.bb
>     <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!dc=
MJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6x=
uE9I2eX1AUfzkOQ5BxFg1$>
>     b/recipes-containers/cri-o/cri-o_git.bb
>     <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!dc=
MJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6x=
uE9I2eX1AUfzkOQ5BxFg1$>
>     >> index efc86fbe..596a43e2 100644
>     >> --- a/recipes-containers/cri-o/cri-o_git.bb
>     <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!dc=
MJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6x=
uE9I2eX1AUfzkOQ5BxFg1$>
>     >> +++ b/recipes-containers/cri-o/cri-o_git.bb
>     <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!dc=
MJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6x=
uE9I2eX1AUfzkOQ5BxFg1$>
>     >> @@ -17,7 +17,9 @@ At a high level, we expect the scope of cri-o
>     to be restricted to the following
>     >>=C2=A0 =C2=A0SRCREV_cri-o =3D "20c06a19cb395445620c31730c0f1a0a19=
22eaae"
>     >>=C2=A0 =C2=A0SRC_URI =3D "\
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0
>     git://github.com/kubernetes-sigs/cri-o.git;branch=3Drelease-1.31;na=
me=3Dcri-o;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}
>     <https://urldefense.com/v3/__http://github.com/kubernetes-sigs/cri-=
o.git;branch=3Drelease-1.31;name=3Dcri-o;protocol=3Dhttps;destsuffix=3D$*=
7BGO_SRCURI_DESTSUFFIX*7D__;JSU!!AjveYdw8EvQ!dcMJ_RyaY86e9xQF11g_sARozs9X=
t8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkOfiTZ4sE$>
>     \
>     >> + file://0001-Add-trimpath-to-build-nri.test.patch \
>     >> file://crio.conf \
>     >> + file://run-ptest \
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     >>
>     >>=C2=A0 =C2=A0# Apache-2.0 for docker
>     >> @@ -28,7 +30,7 @@ GO_IMPORT =3D "import"
>     >>
>     >>=C2=A0 =C2=A0PV =3D "1.31.0+git${SRCREV_cri-o}"
>     >>
>     >> -inherit features_check
>     >> +inherit features_check ptest
>     >>=C2=A0 =C2=A0REQUIRED_DISTRO_FEATURES ?=3D "seccomp"
>     >>
>     >>=C2=A0 =C2=A0DEPENDS =3D " \
>     >> @@ -69,6 +71,13 @@ do_compile() {
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake binaries
>     >>=C2=A0 =C2=A0}
>     >>
>     >> +do_compile_ptest() {
>     >> +=C2=A0 =C2=A0 set +e
>     >> +
>     >> +=C2=A0 =C2=A0 cd ${S}/src/import
>     >> +
>     >> +=C2=A0 =C2=A0 oe_runmake test-binaries
>     >> +}
>     >>=C2=A0 =C2=A0SYSTEMD_PACKAGES =3D
>     "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
>     >>=C2=A0 =C2=A0SYSTEMD_SERVICE:${PN} =3D
>     "${@bb.utils.contains('DISTRO_FEATURES','systemd','crio.service',''=
,d)}"
>     >>=C2=A0 =C2=A0SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
>     >> @@ -100,6 +109,14 @@ do_install() {
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/cr=
io
>     >>=C2=A0 =C2=A0}
>     >>
>     >> +do_install_ptest() {
>     >> +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/test
>     >> +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/bin
>     >> +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/vendor
>     >> +=C2=A0 =C2=A0 cp -rf ${S}/src/import/test ${D}${PTEST_PATH}
>     >> +=C2=A0 =C2=A0 cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}
>     >> +=C2=A0 =C2=A0 cp -rf ${S}/src/import/vendor ${D}${PTEST_PATH}
>     >> +}
>     > I'm curious. Why does the vendor directory need to be
>     > copied / installed for the ptest ?
>     The ctr_seccomp.bats test requires a JSON file located at
>     vendor/github.com/containers/common/pkg/seccomp/seccomp.json
>     <https://urldefense.com/v3/__http://github.com/containers/common/pk=
g/seccomp/seccomp.json__;!!AjveYdw8EvQ!dcMJ_RyaY86e9xQF11g_sARozs9Xt8SSpH=
kb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkOf5GEmOu$>.
>     This file
>     is accessed via the CONTAINER_SECCOMP_PROFILE environment variable,
>     which defaults to the path within the vendor directory. Although th=
is
>     variable can be overridden with a custom-defined path, the default
>     configuration relies on the vendor directory.
>     =EF=BB=BFThis dependency contributes to only two sub-tests passing =
within the
>     suite. I share your concern about whether this folder should be
>     included. Another option is to allow ctr_seccomp.bats to fail by
>     default
>     if the vendor directory is not installed.
>     =EF=BB=BFWould you recommend keeping the directory or accept the te=
sts
>     failed to
>     avoid requiring the vendor directory?
>
>
> What else is in the vendor/ subdirectory (I haven't gone to check) ?
> I'm ok with files being installed into a default location that the test
> will check, but I want to be sure that it is only those files.
>
> So I'd want just the files we need from vendor/ installed, and a commen=
t
> above the install line indicating that "test < ... > requires these fil=
es.
After reviewing the contents of the vendor/ directory and examining the=20
code, it turns out that the only file required for the test is=20
seccomp.json. This file is needed specifically for the ctr_seccomp.bats=20
test, and its presence allows two sub-test cases to pass.
The rest of the files in the vendor/ directory (amounting to=20
approximately 110MB of code) are not relevant to the ptest suite.=20
Therefore, I have decided not to install the entire vendor/ directory.=20
Instead, I have documented this requirement in the README file.
For users who wish to run the tests involving seccomp.json, they can=20
manually add the file to the appropriate location and set the=20
CONTAINER_SECCOMP_PROFILE environment variable to point to it.
the coming v2 will update the code
>
>     >
>     >>=C2=A0 =C2=A0FILES:${PN}-config =3D "${sysconfdir}/crio/config/*"
>     >>=C2=A0 =C2=A0FILES:${PN} +=3D "${systemd_unitdir}/system/*"
>     >>=C2=A0 =C2=A0FILES:${PN} +=3D "/usr/local/bin/*"
>     >> @@ -109,7 +126,23 @@ FILES:${PN} +=3D
>     "/usr/share/containers/oci/hooks.d"
>     >>=C2=A0 =C2=A0ALLOW_EMPTY:${PN} =3D "1"
>     >>
>     >>=C2=A0 =C2=A0INSANE_SKIP:${PN} +=3D "ldflags already-stripped tex=
trel"
>     >> +INSANE_SKIP:${PN}-ptest +=3D "textrel"
>     >>
>     >> -deltask compile_ptest_base
>     >> +RDEPENDS:${PN}-ptest +=3D " \
>     >> +=C2=A0 =C2=A0 bash \
>     >> +=C2=A0 =C2=A0 bats \
>     >> +=C2=A0 =C2=A0 cni \
>     >> +=C2=A0 =C2=A0 crictl \
>     >> +=C2=A0 =C2=A0 bind-utils \
>     >> +=C2=A0 =C2=A0 coreutils \
>     >> +=C2=A0 =C2=A0 dbus-daemon-proxy \
>     >> +=C2=A0 =C2=A0 iproute2 \
>     >> +=C2=A0 =C2=A0 util-linux-unshare \
>     >> +=C2=A0 =C2=A0 jq \
>     >> +=C2=A0 =C2=A0 ipcalc \
>     >> +=C2=A0 =C2=A0 slirp4netns \
>     >> +=C2=A0 =C2=A0 parallel \
>     >> +=C2=A0 =C2=A0 podman \
>     >> +"
>     > This is an extensive list of rdepends for a ptest.
>     > What exactly is it testing ? I think we need to document
>     > in a README what exactly is being tested, since this
>     > dependency list tells me that it is not trivial and it
>     > will be prone to breakage.
>     Given the suite's complexity, documenting the detailed purpose of
>     each
>     dependency would be challenging and potentially incomplete, as many
>     dependencies are used across multiple tests.=C2=A0 However, I agree=
 that a
>     README summarizing the primary focus areas of the tests (e.g.,
>     networking, security, etc.) could provide clarity and help
>     maintainability.
>
>     =EF=BB=BFLet me know if you=E2=80=99d prefer a high-level summary o=
f the tests or
>     additional details in the README.
>
>
> Just a summary of the high level goals and focus of the tests will
> be enough for me. I agree that anything overly detailed will just get
> out of date, and be a maintenance burden.
>
> That list of dependencies basically says "This needs an complete
> distribution to tests" .. and that is fine since it is contained to the
> ptests. I just want to document what we know about those
> dependencies. (since I will forget).
>
> Bruce
>
>
>     //Peng
>
>     > Bruce
>     >
>     >>=C2=A0 =C2=A0COMPATIBLE_HOST =3D "^(?!(qemu)?mips).*"
>     >> diff --git
>     a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.tes=
t.patch
>     b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.tes=
t.patch
>     >> new file mode 100644
>     >> index 00000000..c6be41f0
>     >> --- /dev/null
>     >> +++
>     b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.tes=
t.patch
>     >> @@ -0,0 +1,31 @@
>     >> +From 0bf230f59d211044e7993543e010b0d7f9dcead3 Mon Sep 17
>     00:00:00 2001
>     >> +From: Peng Zhang <peng.zhang1.cn@windriver.com>
>     >> +Date: Fri, 25 Oct 2024 10:42:02 +0800
>     >> +Subject: [PATCH] Add --trimpath to build nri.test
>     >> +
>     >> +when build test-binary, TMPDIR[buildpaths] error found in nri.t=
est
>     >> +to fix this error, add "--trimpath" option to build nri.test.
>     >> +
>     >> +Upstream-Status: Inappropriate [oe specific]
>     >> +
>     >> +Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
>     >> +---
>     >> + Makefile | 2 +-
>     >> + 1 file changed, 1 insertion(+), 1 deletion(-)
>     >> +
>     >> +Index:
>     cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import=
/Makefile
>     >>
>     +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     >> +---
>     cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae.orig/src/i=
mport/Makefile
>     >> ++++
>     cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import=
/Makefile
>     >> +@@ -169,7 +169,7 @@ test/checkcriu/checkcriu: $(GO_FILES)
>     >> +=C2=A0 =C2=A0 =C2=A0$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags =
"$(BUILDTAGS)"
>     -o $@ ./test/checkcriu
>     >> +
>     >> + test/nri/nri.test: $(wildcard test/nri/*.go)
>     >> +-=C2=A0 =C2=A0 $(GO) test --tags "test $(BUILDTAGS)" -c ./test/=
nri -o $@
>     >> ++=C2=A0 =C2=A0 $(GO) test --tags "test $(BUILDTAGS)" -c ./test/=
nri -o $@
>     ${TRIMPATH}
>     >> +
>     >> + bin/crio: $(GO_FILES)
>     >> +=C2=A0 =C2=A0 =C2=A0$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags =
"$(BUILDTAGS)"
>     -o $@ ./cmd/crio
>     >> +--
>     >> +2.34.1
>     >> +
>     >> diff --git a/recipes-containers/cri-o/files/run-ptest
>     b/recipes-containers/cri-o/files/run-ptest
>     >> new file mode 100644
>     >> index 00000000..62abe959
>     >> --- /dev/null
>     >> +++ b/recipes-containers/cri-o/files/run-ptest
>     >> @@ -0,0 +1,11 @@
>     >> +#!/bin/sh
>     >> +
>     >> +./test/test_runner.sh
>     <https://urldefense.com/v3/__http://test_runner.sh__;!!AjveYdw8EvQ!=
dcMJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a=
6xuE9I2eX1AUfzkOR_JEp0q$>
>     | while IFS=3D read -r line; do
>     >> +=C2=A0 =C2=A0 =C2=A0if [[ $line =3D~ ^not\ ok ]]; then
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "FAIL: ${l=
ine#not ok }"
>     >> +=C2=A0 =C2=A0 =C2=A0elif [[ $line =3D~ ^ok && ! $line =3D~ \#\ =
skip ]]; then
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "PASS: ${l=
ine#ok }"
>     >> +=C2=A0 =C2=A0 =C2=A0elif [[ $line =3D~ ^ok.*#\ skip ]]; then
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "SKIP: ${l=
ine#ok }"
>     >> +=C2=A0 =C2=A0 =C2=A0fi
>     >> +done
>     >> --
>     >> 2.35.5
>     >>
>     >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     >> Links: You receive all messages sent to this group.
>     >> View/Reply Online (#8971):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/8971
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/8971__;!!AjveYdw8EvQ!dcMJ_RyaY86e9xQF11g_sARozs9Xt=
8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkOUq_0mwb$>
>     >> Mute This Topic:
>     https://lists.yoctoproject.org/mt/109593003/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1095=
93003/1050810__;!!AjveYdw8EvQ!dcMJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRR=
Tx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkOckjaQYc$>
>     >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     >> Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!dcMJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb=
4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkOZmBm5R-$>
>     [bruce.ashfield@gmail.com]
>     >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     >>
>
>
>
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
--------------39omK7sVTEyRF4Osw5ce5JeP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 11/21/2024 10:04 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4P2ZW15HfY2_Q47_5DjTpTpwQEM=
mGKJDikxK6T+XH_N=3Dw@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc03=
"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D"fo=
nt-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D"m=
sonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"fon=
t-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
          </div>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 21, 2024 at
              4:13=E2=80=AFAM Zhang, Peng (Paul) (CN) &lt;<a href=3D"mailto=
:peng.zhang1.cn@windriver.com" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">peng.zhang1.cn@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              On 11/21/2024 12:34 PM, Bruce Ashfield wrote:<br>
              &gt; CAUTION: This email comes from a non Wind River email
              account!<br>
              &gt; Do not click links or open attachments unless you
              recognize the sender and know the content is safe.<br>
              &gt;<br>
              &gt; In message: [meta-virtualization][PATCH] cri-o:
              enable ptest<br>
              &gt; on 15/11/2024 Zhang, Peng (Paul) (CN) via <a href=3D"htt=
ps://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8EvQ!dcMJ=
_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I=
2eX1AUfzkOaoUePcw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">
                lists.yoctoproject.org</a> wrote:<br>
              &gt;<br>
              &gt;&gt; From: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.c=
n@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-tx=
t-link-freetext">peng.zhang1.cn@windriver.com</a>&gt;<br>
              &gt;&gt;<br>
              &gt;&gt; The ptest build for cri-o was previously disabled
              due to issues<br>
              &gt;&gt; introduced with Go 1.11, which borken the build
              process. With the<br>
              &gt;&gt; current Go version, these issues no longer occur,
              and the ptest build is<br>
              &gt;&gt; now functional.<br>
              &gt;&gt; This commit enables ptest support and resolves
              the &quot;TMPDIR<br>
              &gt;&gt; [buildpaths]&quot; issue encountered during the ptes=
t
              build process.<br>
              &gt; Can you include a log of the ptest running in the
              commit log ?<br>
              &gt; That way the baseline pass/fail is understood and
              captured.<br>
              The CRI-O ptest suite consists of a total of 382 tests.
              Including the <br>
              entire test results in the commit message would make it
              overly <br>
              cumbersome and difficult to navigate. Instead, I propose
              including only <br>
              the list of failed and skipped tests in the commit
              message, as these <br>
              provide the most critical information.<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">That's
                acceptable for me. If we just put the total number of
                tests,</div>
              <div class=3D"gmail_default" style=3D"font-size:small">a
                general overview of the types of testing and then
                anything</div>
              <div class=3D"gmail_default" style=3D"font-size:small">notabl=
e
                (notable here being the skipped or failed tests), then
                we</div>
              <div class=3D"gmail_default" style=3D"font-size:small">have a
                good reference for the initial state.</div>
            </div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              =EF=BB=BFAlternatively, the full test results could be stored=
 in a
              README or <br>
              another documentation file. This approach ensures the
              comprehensive test <br>
              results are preserved as a baseline without bloating the
              commit message.<br>
              =EF=BB=BFWould you prefer the abbreviated results in the comm=
it
              message, or a <br>
              detailed log stored in a separate file?<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">See
                above. Just the summary in the commit, and a README with</d=
iv>
              <div class=3D"gmail_default" style=3D"font-size:small">the
                initial status of the tests stored in a log file.</div>
            </div>
            <div><br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              &gt;<br>
              &gt;&gt; Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng=
.zhang1.cn@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=
=3D"moz-txt-link-freetext">peng.zhang1.cn@windriver.com</a>&gt;<br>
              &gt;&gt; ---<br>
              &gt;&gt;&nbsp; &nbsp;recipes-containers/cri-o/<a href=3D"http=
s://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!dcMJ_RyaY86e9xQ=
F11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkOQ=
5BxFg1$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cri-=
o_git.bb</a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp;| 37 ++++++++++++++++++-<br>
              &gt;&gt;&nbsp; &nbsp;.../0001-Add-trimpath-to-build-nri.test.=
patch |
              31 ++++++++++++++++<br>
              &gt;&gt;&nbsp; &nbsp;recipes-containers/cri-o/files/run-ptest=
&nbsp; &nbsp; &nbsp; |
              11 ++++++<br>
              &gt;&gt;&nbsp; &nbsp;3 files changed, 77 insertions(+), 2
              deletions(-)<br>
              &gt;&gt;&nbsp; &nbsp;create mode 100644
              recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri=
.test.patch<br>
              &gt;&gt;&nbsp; &nbsp;create mode 100644
              recipes-containers/cri-o/files/run-ptest<br>
              &gt;&gt;<br>
              &gt;&gt; diff --git a/recipes-containers/cri-o/<a href=3D"htt=
ps://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!dcMJ_RyaY86e9x=
QF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkO=
Q5BxFg1$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cri=
-o_git.bb</a>
              b/recipes-containers/cri-o/<a href=3D"https://urldefense.com/=
v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!dcMJ_RyaY86e9xQF11g_sARozs9Xt8SSpH=
kb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkOQ5BxFg1$" rel=3D"nor=
eferrer" target=3D"_blank" moz-do-not-send=3D"true">cri-o_git.bb</a><br>
              &gt;&gt; index efc86fbe..596a43e2 100644<br>
              &gt;&gt; --- a/recipes-containers/cri-o/<a href=3D"https://ur=
ldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!dcMJ_RyaY86e9xQF11g_s=
ARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkOQ5BxFg1=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cri-o_git.=
bb</a><br>
              &gt;&gt; +++ b/recipes-containers/cri-o/<a href=3D"https://ur=
ldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!dcMJ_RyaY86e9xQF11g_s=
ARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkOQ5BxFg1=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cri-o_git.=
bb</a><br>
              &gt;&gt; @@ -17,7 +17,9 @@ At a high level, we expect the
              scope of cri-o to be restricted to the following<br>
              &gt;&gt;&nbsp; &nbsp;SRCREV_cri-o =3D
              &quot;20c06a19cb395445620c31730c0f1a0a1922eaae&quot;<br>
              &gt;&gt;&nbsp; &nbsp;SRC_URI =3D &quot;\<br>
              &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; git://<a href=3D"https://=
urldefense.com/v3/__http://github.com/kubernetes-sigs/cri-o.git;branch=3Dre=
lease-1.31;name=3Dcri-o;protocol=3Dhttps;destsuffix=3D$*7BGO_SRCURI_DESTSUF=
FIX*7D__;JSU!!AjveYdw8EvQ!dcMJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-K=
oAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkOfiTZ4sE$" rel=3D"noreferrer" target=
=3D"_blank" moz-do-not-send=3D"true">github.com/kubernetes-sigs/cri-o.git;b=
ranch=3Drelease-1.31;name=3Dcri-o;protocol=3Dhttps;destsuffix=3D${GO_SRCURI=
_DESTSUFFIX}</a>
              \<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Add-tr=
impath-to-build-nri.test.patch">file://0001-Add-trimpath-to-build-nri.test.=
patch</a> \<br>
              &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"=
moz-txt-link-freetext" href=3D"file://crio.conf">file://crio.conf</a> \<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-txt-lin=
k-freetext" href=3D"file://run-ptest">file://run-ptest</a> \<br>
              &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
              &gt;&gt;<br>
              &gt;&gt;&nbsp; &nbsp;# Apache-2.0 for docker<br>
              &gt;&gt; @@ -28,7 +30,7 @@ GO_IMPORT =3D &quot;import&quot;<b=
r>
              &gt;&gt;<br>
              &gt;&gt;&nbsp; &nbsp;PV =3D &quot;1.31.0+git${SRCREV_cri-o}&q=
uot;<br>
              &gt;&gt;<br>
              &gt;&gt; -inherit features_check<br>
              &gt;&gt; +inherit features_check ptest<br>
              &gt;&gt;&nbsp; &nbsp;REQUIRED_DISTRO_FEATURES ?=3D &quot;secc=
omp&quot;<br>
              &gt;&gt;<br>
              &gt;&gt;&nbsp; &nbsp;DEPENDS =3D &quot; \<br>
              &gt;&gt; @@ -69,6 +71,13 @@ do_compile() {<br>
              &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; oe_runmake binaries<br>
              &gt;&gt;&nbsp; &nbsp;}<br>
              &gt;&gt;<br>
              &gt;&gt; +do_compile_ptest() {<br>
              &gt;&gt; +&nbsp; &nbsp; set +e<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; cd ${S}/src/import<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; oe_runmake test-binaries<br>
              &gt;&gt; +}<br>
              &gt;&gt;&nbsp; &nbsp;SYSTEMD_PACKAGES =3D
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.utils=
.contains('DISTRO_FEATURES','systemd','${PN}','',d)}">&quot;${@bb.utils.con=
tains('DISTRO_FEATURES','systemd','${PN}','',d)}&quot;</a><br>
              &gt;&gt;&nbsp; &nbsp;SYSTEMD_SERVICE:${PN} =3D
              <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.utils=
.contains('DISTRO_FEATURES','systemd','crio.service','',d)}">&quot;${@bb.ut=
ils.contains('DISTRO_FEATURES','systemd','crio.service','',d)}&quot;</a><br=
>
              &gt;&gt;&nbsp; &nbsp;SYSTEMD_AUTO_ENABLE:${PN} =3D &quot;enab=
le&quot;<br>
              &gt;&gt; @@ -100,6 +109,14 @@ do_install() {<br>
              &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}${localstat=
edir}/lib/crio<br>
              &gt;&gt;&nbsp; &nbsp;}<br>
              &gt;&gt;<br>
              &gt;&gt; +do_install_ptest() {<br>
              &gt;&gt; +&nbsp; &nbsp; install -d ${D}${PTEST_PATH}/test<br>
              &gt;&gt; +&nbsp; &nbsp; install -d ${D}${PTEST_PATH}/bin<br>
              &gt;&gt; +&nbsp; &nbsp; install -d ${D}${PTEST_PATH}/vendor<b=
r>
              &gt;&gt; +&nbsp; &nbsp; cp -rf ${S}/src/import/test
              ${D}${PTEST_PATH}<br>
              &gt;&gt; +&nbsp; &nbsp; cp -rf ${S}/src/import/bin ${D}${PTES=
T_PATH}<br>
              &gt;&gt; +&nbsp; &nbsp; cp -rf ${S}/src/import/vendor
              ${D}${PTEST_PATH}<br>
              &gt;&gt; +}<br>
              &gt; I'm curious. Why does the vendor directory need to be<br=
>
              &gt; copied / installed for the ptest ?<br>
              The ctr_seccomp.bats test requires a JSON file located at
              <br>
              vendor/<a href=3D"https://urldefense.com/v3/__http://github.c=
om/containers/common/pkg/seccomp/seccomp.json__;!!AjveYdw8EvQ!dcMJ_RyaY86e9=
xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzk=
Of5GEmOu$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">gi=
thub.com/containers/common/pkg/seccomp/seccomp.json</a>.
              This file <br>
              is accessed via the CONTAINER_SECCOMP_PROFILE environment
              variable, <br>
              which defaults to the path within the vendor directory.
              Although this <br>
              variable can be overridden with a custom-defined path, the
              default <br>
              configuration relies on the vendor directory.<br>
              =EF=BB=BFThis dependency contributes to only two sub-tests pa=
ssing
              within the <br>
              suite. I share your concern about whether this folder
              should be <br>
              included. Another option is to allow ctr_seccomp.bats to
              fail by default <br>
              if the vendor directory is not installed.<br>
              =EF=BB=BFWould you recommend keeping the directory or accept =
the
              tests failed to <br>
              avoid requiring the vendor directory?<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">What
                else is in the vendor/ subdirectory (I haven't gone to
                check) ?</div>
              <div class=3D"gmail_default" style=3D"font-size:small">I'm ok
                with files being installed into a default location that
                the test</div>
              <div class=3D"gmail_default" style=3D"font-size:small">will
                check, but I want to be sure that it is only those
                files.</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">So I'd
                want just the files we need from vendor/ installed, and
                a comment</div>
              <div class=3D"gmail_default" style=3D"font-size:small">above
                the install line indicating that &quot;test &lt; ... &gt;
                requires these files.</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"e3gaX=
7QJxe" class=3D"null"><span data-slate-string=3D"true">After reviewing the =
contents of the
            vendor/ directory and examining the code, it turns out that
            the only file required for the test is seccomp.json. </span></s=
pan></span><span data-slate-node=3D"text"><span data-slate-leaf=3D"true" da=
ta-sent-id=3D"VOL6MaRbQz" class=3D"null"><span data-slate-string=3D"true">T=
his file is needed specifically
            for the ctr_seccomp.bats test, and its presence allows two
            sub-test cases to pass.</span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"eqvMK=
AEbOV" class=3D"null"><span data-slate-string=3D"true">The rest of the file=
s in the
            vendor/ directory (amounting to approximately 110MB of code)
            are not relevant to the ptest suite. </span></span></span><span=
 data-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"Bw=
v6Aaq1oz" class=3D"null"><span data-slate-string=3D"true">Therefore, I have=
 decided not to
            install the entire vendor/ directory. </span></span></span><spa=
n data-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"z=
93LNw5mKe" class=3D"null"><span data-slate-string=3D"true">Instead, I have =
documented this
            requirement in the README file.</span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"BaYL4=
npE1B" class=3D"null"><span data-slate-string=3D"true">For users who wish t=
o run the tests
            involving seccomp.json, they can manually add the file to
            the appropriate location and set the
            CONTAINER_SECCOMP_PROFILE environment variable to point to
            it.</span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;" data-sla=
te-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxk=
cmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlM2dhWDdRSnhlJTIyJTJDJTIycGFyYUlkeCU=
yMiUzQTAlMkMlMjJzcmMlMjIlM0ElMjJBZnRlciUyMHJldmlld2luZyUyMHRoZSUyMGNvbnRlbn=
RzJTIwb2YlMjB0aGUlMjB2ZW5kb3IlMkYlMjBkaXJlY3RvcnklMjBhbmQlMjBleGFtaW5pbmclM=
jB0aGUlMjBjb2RlJTJDJTIwaXQlMjB0dXJucyUyMG91dCUyMHRoYXQlMjB0aGUlMjBvbmx5JTIw=
ZmlsZSUyMHJlcXVpcmVkJTIwZm9yJTIwdGhlJTIwdGVzdCUyMGlzJTIwc2VjY29tcC5qc29uLiU=
yMCUyMiUyQyUyMmRzdCUyMiUzQSUyMiVFNSU5QyVBOCVFNiU5RiVBNSVFNyU5QyU4QnZlbmRvci=
UyRiVFNyU5QiVBRSVFNSVCRCU5NSVFNyU5QSU4NCVFNSU4NiU4NSVFNSVBRSVCOSVFNSVCOSVCN=
iVFNiVBMyU4MCVFNiU5RiVBNSVFNCVCQiVBMyVFNyVBMCU4MSVFNSU5MCU4RSVFRiVCQyU4QyVF=
NSU4RiU5MSVFNyU4RSVCMCVFNiVCNSU4QiVFOCVBRiU5NSVFNiU4OSU4MCVFOSU5QyU4MCVFNyU=
5QSU4NCVFNSU5NCVBRiVFNCVCOCU4MCVFNiU5NiU4NyVFNCVCQiVCNiVFNiU5OCVBRnNlY2NvbX=
AuanNvbiVFMyU4MCU4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhd=
GElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyQWZ0ZXIlMjByZXZpZXdpbmclMjB0aGUl=
MjBjb250ZW50cyUyMG9mJTIwdGhlJTIwdmVuZG9yJTJGJTIwZGlyZWN0b3J5JTIwYW5kJTIwZXh=
hbWluaW5nJTIwdGhlJTIwY29kZSUyQyUyMGl0JTIwdHVybnMlMjBvdXQlMjB0aGF0JTIwdGhlJT=
Iwb25seSUyMGZpbGUlMjByZXF1aXJlZCUyMGZvciUyMHRoZSUyMHRlc3QlMjBpcyUyMHNlY2Nvb=
XAuanNvbi4lMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMlZPTDZNYVJiUXolMjIlMkMlMjJw=
YXJhSWR4JTIyJTNBMCUyQyUyMnNyYyUyMiUzQSUyMlRoaXMlMjBmaWxlJTIwaXMlMjBuZWVkZWQ=
lMjBzcGVjaWZpY2FsbHklMjBmb3IlMjB0aGUlMjBjdHJfc2VjY29tcC5iYXRzJTIwdGVzdCUyQy=
UyMGFuZCUyMGl0cyUyMHByZXNlbmNlJTIwYWxsb3dzJTIwdHdvJTIwc3ViLXRlc3QlMjBjYXNlc=
yUyMHRvJTIwcGFzcy4lMjIlMkMlMjJkc3QlMjIlM0ElMjJjdHJfc2NvbXAuYmF0cyVFNiVCNSU4=
QiVFOCVBRiU5NSVFNyU4OSVCOSVFNSU4OCVBQiVFOSU5QyU4MCVFOCVBNiU4MSVFNiVBRCVBNCV=
FNiU5NiU4NyVFNCVCQiVCNiVFRiVCQyU4QyVFNSVBRSU4MyVFNyU5QSU4NCVFNSVBRCU5OCVFNS=
U5QyVBOCVFNSU4NSU4MSVFOCVBRSVCOCVFNCVCOCVBNCVFNCVCOCVBQSVFNSVBRCU5MCVFNiVCN=
SU4QiVFOCVBRiU5NSVFNyU5NCVBOCVFNCVCRSU4QiVFOSU4MCU5QSVFOCVCRiU4NyVFMyU4MCU4=
MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQ=
lMkMlMjJ0ZXh0JTIyJTNBJTIyVGhpcyUyMGZpbGUlMjBpcyUyMG5lZWRlZCUyMHNwZWNpZmljYW=
xseSUyMGZvciUyMHRoZSUyMGN0cl9zZWNjb21wLmJhdHMlMjB0ZXN0JTJDJTIwYW5kJTIwaXRzJ=
TIwcHJlc2VuY2UlMjBhbGxvd3MlMjB0d28lMjBzdWItdGVzdCUyMGNhc2VzJTIwdG8lMjBwYXNz=
LiUyMiU3RCU1RCU3RCUyQyU3QiUyMnR5cGUlMjIlM0ElMjJwYXJhZ3JhcGglMjIlMkMlMjJjaGl=
sZHJlbiUyMiUzQSU1QiU3QiUyMmlkJTIyJTNBJTIyZXF2TUtBRWJPViUyMiUyQyUyMnBhcmFJZH=
glMjIlM0ExJTJDJTIyc3JjJTIyJTNBJTIyVGhlJTIwcmVzdCUyMG9mJTIwdGhlJTIwZmlsZXMlM=
jBpbiUyMHRoZSUyMHZlbmRvciUyRiUyMGRpcmVjdG9yeSUyMChhbW91bnRpbmclMjB0byUyMGFw=
cHJveGltYXRlbHklMjAxMTBNQiUyMG9mJTIwY29kZSklMjBhcmUlMjBub3QlMjByZWxldmFudCU=
yMHRvJTIwdGhlJTIwcHRlc3QlMjBzdWl0ZS4lMjAlMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTQlQk=
UlOUIlRTUlQkElOTQlRTUlOTUlODYlMkYlRTclOUIlQUUlRTUlQkQlOTUlRTQlQjglQUQlRTclO=
UElODQlRTUlODUlQjYlRTQlQkQlOTklRTYlOTYlODclRTQlQkIlQjYlRUYlQkMlODglRTclQkEl=
QTYxMTBNQiVFNCVCQiVBMyVFNyVBMCU4MSVFRiVCQyU4OSVFNCVCOCU4RXB0ZXN0JUU1JUE1JTk=
3JUU0JUJCJUI2JUU2JTk3JUEwJUU1JTg1JUIzJUUzJTgwJTgyJTIyJTJDJTIybWV0YWRhdGElMj=
IlM0ElMjIlMjIlMkMlMjJtZXRhRGF0YSUyMiUzQSU1QiU1RCUyQyUyMnRleHQlMjIlM0ElMjJUa=
GUlMjByZXN0JTIwb2YlMjB0aGUlMjBmaWxlcyUyMGluJTIwdGhlJTIwdmVuZG9yJTJGJTIwZGly=
ZWN0b3J5JTIwKGFtb3VudGluZyUyMHRvJTIwYXBwcm94aW1hdGVseSUyMDExME1CJTIwb2YlMjB=
jb2RlKSUyMGFyZSUyMG5vdCUyMHJlbGV2YW50JTIwdG8lMjB0aGUlMjBwdGVzdCUyMHN1aXRlLi=
UyMCUyMiU3RCUyQyU3QiUyMmlkJTIyJTNBJTIyQnd2NkFhcTFveiUyMiUyQyUyMnBhcmFJZHglM=
jIlM0ExJTJDJTIyc3JjJTIyJTNBJTIyVGhlcmVmb3JlJTJDJTIwSSUyMGhhdmUlMjBkZWNpZGVk=
JTIwbm90JTIwdG8lMjBpbnN0YWxsJTIwdGhlJTIwZW50aXJlJTIwdmVuZG9yJTJGJTIwZGlyZWN=
0b3J5LiUyMCUyMiUyQyUyMmRzdCUyMiUzQSUyMiVFNSU5QiVBMCVFNiVBRCVBNCVFRiVCQyU4Qy=
VFNiU4OCU5MSVFNSU4NiVCMyVFNSVBRSU5QSVFNCVCOCU4RCVFNSVBRSU4OSVFOCVBMyU4NSVFN=
iU5NSVCNCVFNCVCOCVBQXZlbmRvciUyRiVFNyU5QiVBRSVFNSVCRCU5NSVFMyU4MCU4MiUyMiUy=
QyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ=
0ZXh0JTIyJTNBJTIyVGhlcmVmb3JlJTJDJTIwSSUyMGhhdmUlMjBkZWNpZGVkJTIwbm90JTIwdG=
8lMjBpbnN0YWxsJTIwdGhlJTIwZW50aXJlJTIwdmVuZG9yJTJGJTIwZGlyZWN0b3J5LiUyMCUyM=
iU3RCUyQyU3QiUyMmlkJTIyJTNBJTIyejkzTE53NW1LZSUyMiUyQyUyMnBhcmFJZHglMjIlM0Ex=
JTJDJTIyc3JjJTIyJTNBJTIySW5zdGVhZCUyQyUyMEklMjBoYXZlJTIwZG9jdW1lbnRlZCUyMHR=
oaXMlMjByZXF1aXJlbWVudCUyMGluJTIwdGhlJTIwUkVBRE1FJTIwZmlsZS4lMjIlMkMlMjJkc3=
QlMjIlM0ElMjIlRTclOUIlQjglRTUlOEYlOEQlRUYlQkMlOEMlRTYlODglOTElRTUlOUMlQThSR=
UFETUUlRTYlOTYlODclRTQlQkIlQjYlRTQlQjglQUQlRTglQUUlQjAlRTUlQkQlOTUlRTQlQkEl=
ODYlRTglQkYlOTklRTQlQjglODAlRTglQTYlODElRTYlQjElODIlRTMlODAlODIlMjIlMkMlMjJ=
tZXRhZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dC=
UyMiUzQSUyMkluc3RlYWQlMkMlMjBJJTIwaGF2ZSUyMGRvY3VtZW50ZWQlMjB0aGlzJTIwcmVxd=
WlyZW1lbnQlMjBpbiUyMHRoZSUyMFJFQURNRSUyMGZpbGUuJTIyJTdEJTVEJTdEJTJDJTdCJTIy=
dHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQ=
lMjIlM0ElMjJCYVlMNG5wRTFCJTIyJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0=
ElMjJGb3IlMjB1c2VycyUyMHdobyUyMHdpc2glMjB0byUyMHJ1biUyMHRoZSUyMHRlc3RzJTIwa=
W52b2x2aW5nJTIwc2VjY29tcC5qc29uJTJDJTIwdGhleSUyMGNhbiUyMG1hbnVhbGx5JTIwYWRk=
JTIwdGhlJTIwZmlsZSUyMHRvJTIwdGhlJTIwYXBwcm9wcmlhdGUlMjBsb2NhdGlvbiUyMGFuZCU=
yMHNldCUyMHRoZSUyMENPTlRBSU5FUl9TRUNDT01QX1BST0ZJTEUlMjBlbnZpcm9ubWVudCUyMH=
ZhcmlhYmxlJTIwdG8lMjBwb2ludCUyMHRvJTIwaXQuJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU1J=
UFGJUI5JUU0JUJBJThFJUU1JUI4JThDJUU2JTlDJTlCJUU4JUJGJTkwJUU4JUExJThDJUU2JUI2=
JTg5JUU1JThGJThBc2VjY29tcC5qc29uJUU3JTlBJTg0JUU2JUI1JThCJUU4JUFGJTk1JUU3JTl=
BJTg0JUU3JTk0JUE4JUU2JTg4JUI3JUVGJUJDJThDJUU0JUJCJTk2JUU0JUJCJUFDJUU1JThGJU=
FGJUU0JUJCJUE1JUU2JTg5JThCJUU1JThBJUE4JUU1JUIwJTg2JUU2JTk2JTg3JUU0JUJCJUI2J=
UU2JUI3JUJCJUU1JThBJUEwJUU1JTg4JUIwJUU5JTgwJTgyJUU1JUJEJTkzJUU3JTlBJTg0JUU0=
JUJEJThEJUU3JUJEJUFFJUVGJUJDJThDJUU1JUI5JUI2JUU4JUFFJUJFJUU3JUJEJUFFQ09OVEF=
JTkVSX3NlY2NvbXBfUFJPRklMRSVFNyU4RSVBRiVFNSVBMiU4MyVFNSU4RiU5OCVFOSU4NyU4Ri=
VFNiU4QyU4NyVFNSU5MCU5MSVFNSVBRSU4MyVFMyU4MCU4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJ=
TNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyRm9y=
JTIwdXNlcnMlMjB3aG8lMjB3aXNoJTIwdG8lMjBydW4lMjB0aGUlMjB0ZXN0cyUyMGludm9sdml=
uZyUyMHNlY2NvbXAuanNvbiUyQyUyMHRoZXklMjBjYW4lMjBtYW51YWxseSUyMGFkZCUyMHRoZS=
UyMGZpbGUlMjB0byUyMHRoZSUyMGFwcHJvcHJpYXRlJTIwbG9jYXRpb24lMjBhbmQlMjBzZXQlM=
jB0aGUlMjBDT05UQUlORVJfU0VDQ09NUF9QUk9GSUxFJTIwZW52aXJvbm1lbnQlMjB2YXJpYWJs=
ZSUyMHRvJTIwcG9pbnQlMjB0byUyMGl0LiUyMiU3RCU1RCU3RCUyQyU3QiUyMnR5cGUlMjIlM0E=
lMjJwYXJhZ3JhcGglMjIlMkMlMjJjaGlsZHJlbiUyMiUzQSU1QiU3QiUyMmlkJTIyJTNBJTIyem=
dMVzQ3RXdKQiUyMiUyQyUyMnBhcmFJZHglMjIlM0EzJTJDJTIyc3JjJTIyJTNBJTIydGhlJTIwY=
29taW5nJTIwdjIlMjB3aWxsJTIwdXBkYXRlJTIwdGhlJTIwY29kZSUyMiUyQyUyMmRzdCUyMiUz=
QSUyMiVFNSU4RCVCMyVFNSVCMCU4NiVFNSU4OCVCMCVFNiU5RCVBNSVFNyU5QSU4NHYyJUU1JUI=
wJTg2JUU2JTlCJUI0JUU2JTk2JUIwJUU0JUJCJUEzJUU3JUEwJTgxJTIyJTJDJTIybWV0YWRhdG=
ElMjIlM0ElMjIlMjIlMkMlMjJtZXRhRGF0YSUyMiUzQSU1QiU1RCUyQyUyMnRleHQlMjIlM0ElM=
jJ0aGUlMjBjb21pbmclMjB2MiUyMHdpbGwlMjB1cGRhdGUlMjB0aGUlMjBjb2RlJTIyJTdEJTVE=
JTdEJTVE"><span data-slate-node=3D"text"><span data-slate-leaf=3D"true" dat=
a-sent-id=3D"zgLW47EwJB" class=3D"null hover-sent"><span data-slate-string=
=3D"true">the coming v2 will update the code</span></span></span></div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4P2ZW15HfY2_Q47_5DjTpTpwQEM=
mGKJDikxK6T+XH_N=3Dw@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote">
            <div>
            </div>
            <div><br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              &gt;<br>
              &gt;&gt;&nbsp; &nbsp;FILES:${PN}-config =3D
              &quot;${sysconfdir}/crio/config/*&quot;<br>
              &gt;&gt;&nbsp; &nbsp;FILES:${PN} +=3D &quot;${systemd_unitdir=
}/system/*&quot;<br>
              &gt;&gt;&nbsp; &nbsp;FILES:${PN} +=3D &quot;/usr/local/bin/*&=
quot;<br>
              &gt;&gt; @@ -109,7 +126,23 @@ FILES:${PN} +=3D
              &quot;/usr/share/containers/oci/hooks.d&quot;<br>
              &gt;&gt;&nbsp; &nbsp;ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
              &gt;&gt;<br>
              &gt;&gt;&nbsp; &nbsp;INSANE_SKIP:${PN} +=3D &quot;ldflags alr=
eady-stripped
              textrel&quot;<br>
              &gt;&gt; +INSANE_SKIP:${PN}-ptest +=3D &quot;textrel&quot;<br=
>
              &gt;&gt;<br>
              &gt;&gt; -deltask compile_ptest_base<br>
              &gt;&gt; +RDEPENDS:${PN}-ptest +=3D &quot; \<br>
              &gt;&gt; +&nbsp; &nbsp; bash \<br>
              &gt;&gt; +&nbsp; &nbsp; bats \<br>
              &gt;&gt; +&nbsp; &nbsp; cni \<br>
              &gt;&gt; +&nbsp; &nbsp; crictl \<br>
              &gt;&gt; +&nbsp; &nbsp; bind-utils \<br>
              &gt;&gt; +&nbsp; &nbsp; coreutils \<br>
              &gt;&gt; +&nbsp; &nbsp; dbus-daemon-proxy \<br>
              &gt;&gt; +&nbsp; &nbsp; iproute2 \<br>
              &gt;&gt; +&nbsp; &nbsp; util-linux-unshare \<br>
              &gt;&gt; +&nbsp; &nbsp; jq \<br>
              &gt;&gt; +&nbsp; &nbsp; ipcalc \<br>
              &gt;&gt; +&nbsp; &nbsp; slirp4netns \<br>
              &gt;&gt; +&nbsp; &nbsp; parallel \<br>
              &gt;&gt; +&nbsp; &nbsp; podman \<br>
              &gt;&gt; +&quot;<br>
              &gt; This is an extensive list of rdepends for a ptest.<br>
              &gt; What exactly is it testing ? I think we need to
              document<br>
              &gt; in a README what exactly is being tested, since this<br>
              &gt; dependency list tells me that it is not trivial and
              it<br>
              &gt; will be prone to breakage.<br>
              Given the suite's complexity, documenting the detailed
              purpose of each <br>
              dependency would be challenging and potentially
              incomplete, as many <br>
              dependencies are used across multiple tests.&nbsp; However, I
              agree that a <br>
              README summarizing the primary focus areas of the tests
              (e.g., <br>
              networking, security, etc.) could provide clarity and help
              maintainability.<br>
              <br>
              =EF=BB=BFLet me know if you=E2=80=99d prefer a high-level sum=
mary of the
              tests or <br>
              additional details in the README.<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">Just a
                summary of the high level goals and focus of the tests
                will</div>
              <div class=3D"gmail_default" style=3D"font-size:small">be
                enough for me. I agree that anything overly detailed
                will just get</div>
              <div class=3D"gmail_default" style=3D"font-size:small">out of
                date, and be a maintenance burden.</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">That
                list of dependencies basically says &quot;This needs an
                complete</div>
              <div class=3D"gmail_default" style=3D"font-size:small">distri=
bution
                to tests&quot; .. and that is fine since it is contained to
                the</div>
              <div class=3D"gmail_default" style=3D"font-size:small">ptests=
.
                I just want to document what we know about those</div>
              <div class=3D"gmail_default" style=3D"font-size:small">depend=
encies.
                (since I will forget).</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div>
            </div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              //Peng<br>
              <br>
              &gt; Bruce<br>
              &gt;<br>
              &gt;&gt;&nbsp; &nbsp;COMPATIBLE_HOST =3D &quot;^(?!(qemu)?mip=
s).*&quot;<br>
              &gt;&gt; diff --git
a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch<=
br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 00000000..c6be41f0<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch<=
br>
              &gt;&gt; @@ -0,0 +1,31 @@<br>
              &gt;&gt; +From 0bf230f59d211044e7993543e010b0d7f9dcead3
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: Peng Zhang &lt;<a href=3D"mailto:peng.zhang1.=
cn@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-t=
xt-link-freetext">peng.zhang1.cn@windriver.com</a>&gt;<br>
              &gt;&gt; +Date: Fri, 25 Oct 2024 10:42:02 +0800<br>
              &gt;&gt; +Subject: [PATCH] Add --trimpath to build
              nri.test<br>
              &gt;&gt; +<br>
              &gt;&gt; +when build test-binary, TMPDIR[buildpaths] error
              found in nri.test<br>
              &gt;&gt; +to fix this error, add &quot;--trimpath&quot; optio=
n to
              build nri.test.<br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Inappropriate [oe specific]<br>
              &gt;&gt; +<br>
              &gt;&gt; +Signed-off-by: Peng Zhang &lt;<a href=3D"mailto:pen=
g.zhang1.cn@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=
=3D"moz-txt-link-freetext">peng.zhang1.cn@windriver.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + Makefile | 2 +-<br>
              &gt;&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
              &gt;&gt; +<br>
              &gt;&gt; +Index:
cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makefil=
e<br>
              &gt;&gt;
              +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
              &gt;&gt; +---
cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae.orig/src/import/Ma=
kefile<br>
              &gt;&gt; ++++
cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makefil=
e<br>
              &gt;&gt; +@@ -169,7 +169,7 @@ test/checkcriu/checkcriu:
              $(GO_FILES)<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;$(GO_BUILD) $(GCFLAGS) $(GO_LDF=
LAGS) -tags
              &quot;$(BUILDTAGS)&quot; -o $@ ./test/checkcriu<br>
              &gt;&gt; +<br>
              &gt;&gt; + test/nri/nri.test: $(wildcard test/nri/*.go)<br>
              &gt;&gt; +-&nbsp; &nbsp; $(GO) test --tags &quot;test $(BUILD=
TAGS)&quot; -c
              ./test/nri -o $@<br>
              &gt;&gt; ++&nbsp; &nbsp; $(GO) test --tags &quot;test $(BUILD=
TAGS)&quot; -c
              ./test/nri -o $@ ${TRIMPATH}<br>
              &gt;&gt; +<br>
              &gt;&gt; + bin/crio: $(GO_FILES)<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;$(GO_BUILD) $(GCFLAGS) $(GO_LDF=
LAGS) -tags
              &quot;$(BUILDTAGS)&quot; -o $@ ./cmd/crio<br>
              &gt;&gt; +--<br>
              &gt;&gt; +2.34.1<br>
              &gt;&gt; +<br>
              &gt;&gt; diff --git
              a/recipes-containers/cri-o/files/run-ptest
              b/recipes-containers/cri-o/files/run-ptest<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 00000000..62abe959<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++ b/recipes-containers/cri-o/files/run-ptest<br>
              &gt;&gt; @@ -0,0 +1,11 @@<br>
              &gt;&gt; +#!/bin/sh<br>
              &gt;&gt; +<br>
              &gt;&gt; +./test/<a href=3D"https://urldefense.com/v3/__http:=
//test_runner.sh__;!!AjveYdw8EvQ!dcMJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTR=
RTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkOR_JEp0q$" moz-do-not-send=3D=
"true">test_runner.sh</a> | while IFS=3D
              read -r line; do<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;if [[ $line =3D~ ^not\ ok ]]; t=
hen<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ech=
o &quot;FAIL: ${line#not ok }&quot;<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;elif [[ $line =3D~ ^ok &amp;&am=
p; ! $line =3D~
              \#\ skip ]]; then<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ech=
o &quot;PASS: ${line#ok }&quot;<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;elif [[ $line =3D~ ^ok.*#\ skip=
 ]]; then<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ech=
o &quot;SKIP: ${line#ok }&quot;<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;fi<br>
              &gt;&gt; +done<br>
              &gt;&gt; --<br>
              &gt;&gt; 2.35.5<br>
              &gt;&gt;<br>
              &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              &gt;&gt; Links: You receive all messages sent to this
              group.<br>
              &gt;&gt; View/Reply Online (#8971): <a href=3D"https://urldef=
ense.com/v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/=
8971__;!!AjveYdw8EvQ!dcMJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6O=
gkM7W2dNBjr4uIRv3_a6xuE9I2eX1AUfzkOUq_0mwb$" rel=3D"noreferrer" target=3D"_=
blank" moz-do-not-send=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/message/8971</a><br>
              &gt;&gt; Mute This Topic: <a href=3D"https://urldefense.com/v=
3/__https://lists.yoctoproject.org/mt/109593003/1050810__;!!AjveYdw8EvQ!dcM=
J_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6xuE9=
I2eX1AUfzkOckjaQYc$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">
                https://lists.yoctoproject.org/mt/109593003/1050810</a><br>
              &gt;&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2=
Bowner@lists.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">
                meta-virtualization+owner@lists.yoctoproject.org</a><br>
              &gt;&gt; Unsubscribe: <a href=3D"https://urldefense.com/v3/__=
https://lists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!=
dcMJ_RyaY86e9xQF11g_sARozs9Xt8SSpHkb4w4wTRRTx3r-KoAo6OgkM7W2dNBjr4uIRv3_a6x=
uE9I2eX1AUfzkOZmBm5R-$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank" moz-do-not-send=3D"true"=
 class=3D"moz-txt-link-freetext">bruce.ashfield@gmail.com</a>]<br>
              &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              &gt;&gt;<br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follo=
w
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------39omK7sVTEyRF4Osw5ce5JeP--

