Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E81FC021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 02:15:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5933.1739326504693545228
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 18:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4138e2ca97=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C0Ws8R026408;
	Wed, 12 Feb 2025 02:15:03 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwvdh89w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 02:15:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdSi7zVsQJOWTpV3aBDAmEPb2uHbBBcoHqs/xg4MsGVVhgAuedhpJJbOpO57oPkDYap9hfatujtZ4Y4DkMzKDXWMCGAwBSaFjbNQpsHMbF8WGS8xGqU5o1ZPMElZSffAXq8Tz8v95JTzMgi12VoG9ACr1/Jy8yHCfk1T2T8eEW6aaaOitPzZHIpzA20jzJlhQqy8KHVpJQAHyX3ub1MsRNkLCRjIYd6EXGLVRGbOMwxt0txUNa0eqV1R4xd5mQaEX1UPx057CflYZCNyIZl0jQzYjnWnX344rNWfxBQ0HaDXZaq2ZPIlJUm8D9RvEW8nbcv4/thB+38yh3wmO7OPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bgtptd7huz1M4/ddhoK4CsIhiX1wbQ0gWgpiZUFVZOQ=;
 b=K1hamJV2/9fquNvWLcKOSE/dbHz6q824FBFFPbxvm8zt5FM0/PggLgTAZiGL3Rx9Udf1JuURXwLlBGpgUS3o+M03NV4C8DPIu1IeAHZutVaVIL51T1mqOPIOKNHuGm6csIPbJDdEoPuH0lRXiX2zzaDtlcIQU3I6ug0sORshfp9uzNTu/cLKqDso3qYNBCSn38EXjXVfEidnl6Y2UgjUZgUcPr4EXsv88v8J+DYEvxZT/+Y7hX3KDkPY47WK56lVUqqqG4qhQoKcBulVmE6zf+HjiNR1I2wFfPzv9FHS6TuMmMPwoceeZnIZVS2wmN8A+oaIjoRjruWvGu9dK+MQDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SN7PR11MB7467.namprd11.prod.outlook.com (2603:10b6:806:34f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Wed, 12 Feb
 2025 02:15:00 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 02:15:00 +0000
Content-Type: multipart/alternative;
 boundary="------------cN2K0b1UIo1w0lFW3hsglo5e"
Message-ID: <2b46c92d-98c0-434c-b451-b4939e2c400d@windriver.com>
Date: Wed, 12 Feb 2025 10:14:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH V2 1/3] nerdctl: fix do_compile
 failed
To: Bruce Ashfield <bruce.ashfield@gmail.com>, hongxu.jia@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
References: <20250210074700.1751058-1-hongxu.jia@windriver.com>
 <CADkTA4NQ20HzxWm7ubXqd4wFXsTBQHGYkr_t1vAKHaDukyZSkw@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CADkTA4NQ20HzxWm7ubXqd4wFXsTBQHGYkr_t1vAKHaDukyZSkw@mail.gmail.com>
X-ClientProxiedBy: SG2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::18)
 To PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SN7PR11MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: b518660a-9e58-4aa5-9e4c-08dd4b0b0cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eW1Fc3VoVDFwM0JWd3lXUC9zekMraWlBYkU3S3ZHbXNuU21mcDd6VHdXNWcx?=
 =?utf-8?B?dzE4Yy9JRnZNcmhwV1RGUkxTV0JuVXZZTXhlVHVxT21sK1lXL29jWk90ZTVx?=
 =?utf-8?B?REtwU0cyOEg2L1VCd2pqeG5ZcVJucTZ2ZktnUlpUL1VuTm5HNmJaVXBRWXNX?=
 =?utf-8?B?S0N2Sk1SQkdvTGFCYVd1bU5IY0FhRTFTc2F2VkRjOGJZTTFuSnZRanRsaGJR?=
 =?utf-8?B?NUhQK3VibjhHbk5HOHd2d2VvZFhjbkREZ0pNT1dQcE5oVXpCWlhhZXNOYmN6?=
 =?utf-8?B?Y2hNR1Fpd1MwNVd3QlA1TWE3VFBNZkQ0Qkp2WkF4TlFMMjFSZEcrcm9CUXdG?=
 =?utf-8?B?ZXpLdDVvMmxVOHk5VDZKVDQ5bXUzODJUT1VzQnMxcnBVNk82RXIyMkFWa0xS?=
 =?utf-8?B?aE5kSGhSYVhsWkN4RStZVWduTmJ5dHpSc3J2dVdyZHJKUjVSSE5ZWkJSUmVo?=
 =?utf-8?B?MTRHY1VtcmgxdTZ4ZTRBMmVnYlRiazNKSUYza1dva2FYY01zOFUvdW94dHFy?=
 =?utf-8?B?VTBGdlg1OWNoQ2phZHR3T2RmQmJkanFXNnppOWtTUWxqS3I1Y2Exb2xHbjRq?=
 =?utf-8?B?MlNsQVJjcFR5K0dmc2Q3d21OeHYyRkhrYVFJdzFMZ3Q4TUd2dWxpRzBjVTl5?=
 =?utf-8?B?V3BkcTU2RE9FTTZvRlFVMzZUUXgzTzdvdVJzMmVFQnV0MlZYRDhPUXVUVE9V?=
 =?utf-8?B?Y0dta04wcnFqQi8zTUV3MXNuYWliVmxLTThFQ3VnZ3MvSzRxODdkayt3VnBm?=
 =?utf-8?B?dU05TGo3NjV4RExvR3U0cjhtWGlJcm0ybyt5WXVwbnQ1aUlYZkgzSnpTSzdi?=
 =?utf-8?B?dnk1MDIwcHRKRGkyek5TNGd4ZXZSV0wvVzJRWTJuaFVWR3Job1JPamltY0Fw?=
 =?utf-8?B?K1Z2RmNPVGJtdnA5N0ZCdzkzWVp5RVRjazNzNEtYdmJ1YXhjYmNsNzdsSlJM?=
 =?utf-8?B?Vis2aC9kTVludDBzWUJVR1JITEJtWk1zbEdnV05QdXplWnBseHhxcGtibExV?=
 =?utf-8?B?blg1U2t0T01qaWYyaWR5enB2QXBYT1ZUTkViS1pIMXJMUXhvU2Rsc3hkMktx?=
 =?utf-8?B?ZStETFBLc0tUcXFjSUhSZnVLSm9sYUNOaXQ1YkM5QkI3TndTMFhmYTVsU0Vo?=
 =?utf-8?B?akxrcWRxbzBiZnQ0NGZWWmhCcm55V1UrajUvQzRnSUhxMERrR0ZzV1FGMEY5?=
 =?utf-8?B?emg3M1BMS09QbTJ0emNsbTBhS21WRFpSQmQyMkFTZ2Q5b1MzdENsZXp2V2pt?=
 =?utf-8?B?UDM4T3hneXNRQ3gwZ0M3SS9ZMzVxL3liWlVuWVR1clB5NkRtZ3ZtVThmTk40?=
 =?utf-8?B?S2JaM0tvU1QyQ3FFNkZSd1dlVm1pMGdNbDAvQm4yMXpERDc1Mjc3cloxdVpI?=
 =?utf-8?B?bHZ3STF2RGRuZnNHblhmVU5sM1E1VFF3NkdRd2NYajk4L3l0cG1WTlJYRnpz?=
 =?utf-8?B?M3JIUVE5RXo0Z0ZOYUh6K09vNEd5RWtWaTdNRGJRV2p3WWc2dmxFcllFZ20x?=
 =?utf-8?B?TnJLK1VzZmx6d0FYYTlMM1MwQjY5aVlBdkQ3cVZydmRuZHRSNXNoYmFSTW1p?=
 =?utf-8?B?anZlbk1sRVF3NGRtNEpDck5aWUUwMXAyUzdWZWFDL2hyYWpmdnlEb0ZESjQw?=
 =?utf-8?B?OVRQY2R5R2hPaGRTeENDS2ZlMFMzK09vNitYSjgvcGI2c1A0eGcvMGl2ZG8r?=
 =?utf-8?B?N0JURTBxL2tsYy94aHVDNFpaa0NFeS85a3JtaERhTFhtYWhNQ0V2SUQwYmx5?=
 =?utf-8?B?SzBVeURjYVZqbi9nV2dZWFRlNGNYeld3aVZkM2twNVZTZ1kvbTA2M1FzQTNK?=
 =?utf-8?B?N3l5RkEwVCtLaFRyTkZVUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VXpuWGlub3FjNHhZdHFkbzdpb2FFWlhiRDNMNVpQY0w4N2R6cVZBMkw0MFVq?=
 =?utf-8?B?NjRYeVlmODlQbnExS1N4bDhNTUh0V2l1UlFydU1XZENTbnZsek5SQlk3TTht?=
 =?utf-8?B?ZGZBOWRlWmNyVWxUcWFuYnBJMXFOL3dSeWdZVll0WjBzcXB3aWd6T210R3RH?=
 =?utf-8?B?VlVyWXJoVllWekNkS0xOZXJRaGQxUmxWbmRCTEZxVXZIUW5IcnBwVU01MXZR?=
 =?utf-8?B?T1crWTljWjdtcDRtaXFWUkIrcnlRbzlpQVVsc3hHd3VRUGUrcjZqanI4RXBm?=
 =?utf-8?B?YmhZeWV2d1IydmZHOHlHSHJFOURram5INGxKVFlCY1dmWHlwdG1OVGNXQTh2?=
 =?utf-8?B?cUtKTFBaVlJoRjRWNXFNTGNkQVltN1pDL0RtaW9GYTliNTNTbXNNL3F3NzR6?=
 =?utf-8?B?V1hTcXd5aHVCOEJDOG83KzQ4dTcrT3g2eWFEaG9wY2lyK2lxQ3JXRHRkTlRM?=
 =?utf-8?B?aFZtcmo4MkJwV1d6eTEvUXRybEErUzNJa2F3WldLU09UUElLOUd3a09xTjF4?=
 =?utf-8?B?NTJtOWN5bUIzOGdYZEI1QU5RY084WjdTWVNKb3VjcHpqd0hEMnhwbmxPOWUx?=
 =?utf-8?B?WGNFNVdLQy9OUXRHeXZlbmVhdk9CN3FUUXd4SkhmdnVzaWNBM3ZMSnpnOUJw?=
 =?utf-8?B?NDN5U3IyWGdjR2xFN0lpeTZaOVNMZmR0emZxUUFKdnhaLzVibG1BQVgrNW9m?=
 =?utf-8?B?MjNrNVZYdmxsdlFxMVZ3S3NXbXJxYUdVdDQwYTkyODhYZGI4SXdoU3BEdzhD?=
 =?utf-8?B?NlRaU3E4MDY5UUFhQ2orYXkrNFl5WFZBQkp4L1NCSmV3UmdCQktKN0N2eStl?=
 =?utf-8?B?TmhJSXllQ1lQaVVzWUsvaUwzM3FIZTZSMDdldHRKayt0YTJ2aXVGbjVXL3lI?=
 =?utf-8?B?TFJ5c1QxaE5yTWFnK0JsWkc0ZFZ6Y3g0TlA5MjBJVkp1UHZOMWpOc0JtV2lh?=
 =?utf-8?B?bTBUd3hPMmt3MTMyWGpNYnhwSGs0SnE3c1JGeEJudFFiZjE2UUtNNENSTkcz?=
 =?utf-8?B?WXpldWZHb0Mvd1NHVDlNQUFpL3Y4cDhlZ0tKeWNsbWRxNnI1WjNSTFBKaCtG?=
 =?utf-8?B?bk9yU1d4TWY1ZU1YWjlLcVJJZUxyeUJpaitwbUVWcDd4MEhySGhpenFPZElp?=
 =?utf-8?B?Rm4rM29qWllqRHU0OW9tK2l3QVpFTm9Eb0VPOHVEWUg3STI4SUlXSUtQcWlq?=
 =?utf-8?B?T3BhYjA1ZUo0RXJjcUlSVlcyVDRzWElCR3BaYTQ3aSt5RkcvS0tIcWlyUnpX?=
 =?utf-8?B?Q1VqNEo3VFhZQ2NKSDlleGFnc0lXc2k1YzJ5cll6VDZOWXNZTWJDNXJnNmc2?=
 =?utf-8?B?T0VGSVVueFJJM2s2ekZjRXJUbUhldzhyWmZrMzJHNWQ1OWY1RUVqOUJtYzBr?=
 =?utf-8?B?TEFsNW96ZDBSc3BnSFQyRTJWUng4c2hYZFlWYWxDcFEzblNlZzFFNmRjb29J?=
 =?utf-8?B?UlBoQnJiclZERzVrVWxsQlVHb2Mzako1UXRYd041R2ExSnpPVlZtRW1NL2o0?=
 =?utf-8?B?cVpVbHBzUEN5SHpjZGpyRExLSnRSbFZ2UlhnSzNySVhtV3JaR3FQbk15WDBL?=
 =?utf-8?B?Z2lHQjdPb0JiYWZWZVFNamJMR2M5NWlWUThYYTkrL3I0a1RjYXY2OFRISk5E?=
 =?utf-8?B?UGVCYnhZdHpCTTNQY283Ty9Sa2JKTWczVGs1Y3h1SmU4S044SGR0RlVUWUlE?=
 =?utf-8?B?RDJWWEc2YVBjV041V0kza0xKd3FpVWlQdXBRNzd6RERyTFlDY2dXaWdHSnZE?=
 =?utf-8?B?R3kwbkRwdHpkeEg5cEY0NE15QmRvdFZnMWY2VTJtU1ZHckRsME50U1Rmb3NO?=
 =?utf-8?B?QmpReFVBVWRpYmlMMXI4RDJ1aHZPb21uWWdhdFNEK3RFLzBKa2NBYUhXNkh0?=
 =?utf-8?B?UEE3Q3JValBUNUtQS2Z3ZGVSQTVEUkZqcDZaa0RnSkJEUmt5N0d5VS93NndS?=
 =?utf-8?B?bXlxSUU4WFE0WXB0aXBuZSszRVI3b0lkOUQ0eFpoS2lOTU5ReGtQRzVVK1dP?=
 =?utf-8?B?MER0Mis0MXRzMXNhSEVBK1lGVTljalRPOEdlcFdIdUVWbmdyZHk0aGhpY1ox?=
 =?utf-8?B?THFMWWRlbVlxS2pVbjJPaTFLWGtDTk50QUFDQmhoZnZwV0txaEZRd3ZCRkdq?=
 =?utf-8?B?VnMwMmNTSFZadzluOEpOVDU5ejh3ZGtoZEZGZzk5em80dWdNWVYrQ2NXdHFL?=
 =?utf-8?B?bmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b518660a-9e58-4aa5-9e4c-08dd4b0b0cf0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:14:59.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9OG+j3HODv7dIEknJvvZgOc+2AHwQd6asuMIIfiEpFwmL8oKhJT0T7tY7hrT2HXkArMQVMQhUe+NRPsjNcyHJTLKlJV6eUCPT3GyxUh4P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7467
X-Proofpoint-GUID: rdHWBOc8eYYUfTEzBtfKMIKXxHYbXTVg
X-Proofpoint-ORIG-GUID: rdHWBOc8eYYUfTEzBtfKMIKXxHYbXTVg
X-Authority-Analysis: v=2.4 cv=K5bYHzWI c=1 sm=1 tr=0 ts=67ac0427 cx=c_pps a=6L7f6dt9FWfToKUQdDsCmg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=vCHQbyzJAAAA:8 a=tkTufW_8AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=3S3OKKhcO8uRp9j_LG0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cCEoK8jFP94AMyPREWsA:9 a=HmJW9jesl4wUZ4D-:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ImwWUX5h3JJ3gRE9moBe:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=mA5qry1rbyGvl90tSnBg:22 a=VxGx2c0l_Oi_Ap3SNpLP:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_10,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502120016
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Feb 2025 02:15:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9141

--------------cN2K0b1UIo1w0lFW3hsglo5e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51C0Ws8R026408

On 2/11/25 02:30, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Mon, Feb 10, 2025 at 2:47=E2=80=AFAM hongxu via lists.yoctoproject.o=
rg=20
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8=
EvQ!Z_MA5tmBr1b3nH-d4fMpgXg69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4Q=
CxEKoFJ2BixUSGPsW8jgQw-HzB_$>=20
> <hongxu.jia=3Deng.windriver.com@lists.yoctoproject.org> wrote:
>
>     Using latest poky + meta-virtualization + meta-openembedded, build
>     multlib failed
>
>     ...local.conf...
>     MACHINE =3D "qemux86-64"
>     require conf/multilib.conf
>     MULTILIBS =3D "multilib:lib32"
>     DEFAULTTUNE:virtclass-multilib-lib32 =3D "x86"
>
>
> Aha. In my experience, the entire stack doesn't function all that well=20
> on 32 bit.
>
> Have you confirmed the runtime management of containers on 32bit ?=20
> (I'd prefer to depreciate it and just support 64 bit arches).
>
No, but it also failed on beaglebone-yocto build which is 32bit arm

//Hongxu

> Bruce
>
>
>     $ bitbake lib32-nerdctl
>     ...
>     -buildmode=3Dpie requires external (cgo) linking, but cgo is not en=
abled
>     make: *** [Makefile:63: nerdctl] Error 1
>     ...
>
>     Get back the patch to allow external specification of build
>     settings and rebase to v2.0.2
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>     ---
>     =C2=A0...xternal-specification-of-build-setti.patch | 28
>     +++++++++++--------
>     =C2=A0recipes-containers/nerdctl/nerdctl_git.bb
>     <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!=
Z_MA5tmBr1b3nH-d4fMpgXg69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEK=
oFJ2BixUSGPsW8jgZbIXqdf$>
>     =C2=A0 =C2=A0|=C2=A0 1 +
>     =C2=A02 files changed, 18 insertions(+), 11 deletions(-)
>
>     diff --git
>     a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-s=
pecification-of-build-setti.patch
>     b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-s=
pecification-of-build-setti.patch
>     index ca7b3042..cf7037f3 100644
>     ---
>     a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-s=
pecification-of-build-setti.patch
>     +++
>     b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-s=
pecification-of-build-setti.patch
>     @@ -6,20 +6,26 @@ Subject: [PATCH] Makefile: allow external
>     specification of build settings
>     =C2=A0Upstream-Status: Inappropriate [embedded specific]
>
>     =C2=A0Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>     +
>     +Rebase to v2.0.2
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>     =C2=A0---
>     - Makefile | 3 ++-
>     - 1 file changed, 2 insertions(+), 1 deletion(-)
>     + src/import/Makefile | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>
>     -Index: nerdctl-v2.0.0-beta.1/src/import/Makefile
>     -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     ---- nerdctl-v2.0.0-beta.1.orig/src/import/Makefile
>     -+++ nerdctl-v2.0.0-beta.1/src/import/Makefile
>     -@@ -38,7 +38,7 @@
>     +diff --git a/src/import/Makefile b/src/import/Makefile
>     +index ae4e18c..eb22f9f 100644
>     +--- a/src/import/Makefile
>     ++++ b/src/import/Makefile
>     +@@ -45,7 +45,7 @@ endif
>
>     =C2=A0 GO_BUILD_LDFLAGS ?=3D -s -w
>     =C2=A0 GO_BUILD_FLAGS ?=3D
>     --export GO_BUILD=3DGO111MODULE=3Don CGO_ENABLED=3D0 GOOS=3D$(GOOS)=
 $(GO)
>     build -ldflags "$(GO_BUILD_LDFLAGS) -X
>     $(PACKAGE)/pkg/version.Version=3D$(VERSION) -X
>     $(PACKAGE)/pkg/version.Revision=3D$(REVISION)"
>     -+export GO_BUILD=3D$(GO) build -ldflags "$(GO_BUILD_LDFLAGS) -X
>     $(PACKAGE)/pkg/version.Version=3D$(VERSION) -X
>     $(PACKAGE)/pkg/version.Revision=3D$(REVISION)"
>     +-export GO_BUILD=3DCGO_ENABLED=3D0 GOOS=3D$(GOOS) $(GO) -C
>     $(MAKEFILE_DIR) build -ldflags "$(GO_BUILD_LDFLAGS)
>     $(VERBOSE_FLAG) -X $(PACKAGE)/pkg/version.Version=3D$(VERSION) -X
>     $(PACKAGE)/pkg/version.Revision=3D$(REVISION)"
>     ++export GO_BUILD=3DGOOS=3D$(GOOS) $(GO) -C $(MAKEFILE_DIR) build
>     -ldflags "$(GO_BUILD_LDFLAGS) $(VERBOSE_FLAG) -X
>     $(PACKAGE)/pkg/version.Version=3D$(VERSION) -X
>     $(PACKAGE)/pkg/version.Revision=3D$(REVISION)"
>     +
>     + recursive_wildcard=3D$(wildcard $1$2) $(foreach e,$(wildcard
>     $1*),$(call recursive_wildcard,$e/,$2))
>
>     - ifdef VERBOSE
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0VERBOSE_FLAG :=3D -v
>     +--
>     +2.34.1
>     +
>     diff --git a/recipes-containers/nerdctl/nerdctl_git.bb
>     <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!=
Z_MA5tmBr1b3nH-d4fMpgXg69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEK=
oFJ2BixUSGPsW8jgZbIXqdf$>
>     b/recipes-containers/nerdctl/nerdctl_git.bb
>     <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!=
Z_MA5tmBr1b3nH-d4fMpgXg69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEK=
oFJ2BixUSGPsW8jgZbIXqdf$>
>     index 63b96846..84734c9f 100644
>     --- a/recipes-containers/nerdctl/nerdctl_git.bb
>     <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!=
Z_MA5tmBr1b3nH-d4fMpgXg69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEK=
oFJ2BixUSGPsW8jgZbIXqdf$>
>     +++ b/recipes-containers/nerdctl/nerdctl_git.bb
>     <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!=
Z_MA5tmBr1b3nH-d4fMpgXg69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEK=
oFJ2BixUSGPsW8jgZbIXqdf$>
>     @@ -19,6 +19,7 @@ include src_uri.inc
>     <https://urldefense.com/v3/__http://src_uri.inc__;!!AjveYdw8EvQ!Z_M=
A5tmBr1b3nH-d4fMpgXg69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ=
2BixUSGPsW8jgUTSe_z1$>
>
>     =C2=A0# patches and config
>     =C2=A0SRC_URI +=3D " \
>     +
>     file://0001-Makefile-allow-external-specification-of-build-setti.pa=
tch
>     \
>     file://modules.txt \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9131):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9131
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/9131__;!!AjveYdw8EvQ!Z_MA5tmBr1b3nH-d4fMpgXg69kLMD=
Y2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ2BixUSGPsW8jgRASzqh2$>
>     Mute This Topic:
>     https://lists.yoctoproject.org/mt/111098600/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1110=
98600/1050810__;!!AjveYdw8EvQ!Z_MA5tmBr1b3nH-d4fMpgXg69kLMDY2Dxb2OLMyVI-z=
bZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ2BixUSGPsW8jgQMaaRQI$>
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!Z_MA5tmBr1b3nH-d4fMpgXg69kLMDY2Dxb2O=
LMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ2BixUSGPsW8jgZGeqNJW$>
>     [bruce.ashfield@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--------------cN2K0b1UIo1w0lFW3hsglo5e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51C0Ws8R026408

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2/11/25 02:30, Bruce Ashfield wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4NQ20HzxWm7ubXqd4wFXsTBQH=
GYkr_t1vAKHaDukyZSkw@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
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
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 10, 2025 at
              2:47=E2=80=AFAM hongxu via <a href=3D"https://urldefense.co=
m/v3/__http://lists.yoctoproject.org__;!!AjveYdw8EvQ!Z_MA5tmBr1b3nH-d4fMp=
gXg69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ2BixUSGPsW8jgQw-H=
zB_$" moz-do-not-send=3D"true">
                lists.yoctoproject.org</a> &lt;hongxu.jia=3D<a href=3D"ma=
ilto:eng.windriver.com@lists.yoctoproject.org" moz-do-not-send=3D"true" c=
lass=3D"moz-txt-link-freetext">eng.windriver.com@lists.yoctoproject.org</=
a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              Using latest poky + meta-virtualization +
              meta-openembedded, build multlib failed<br>
              <br>
              ...local.conf...<br>
              MACHINE =3D &quot;qemux86-64&quot;<br>
              require conf/multilib.conf<br>
              MULTILIBS =3D &quot;multilib:lib32&quot;<br>
              DEFAULTTUNE:virtclass-multilib-lib32 =3D &quot;x86&quot;<br=
>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">Aha.=
 In
                my experience, the entire stack doesn't function all
                that well on 32 bit.</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">Have
                you confirmed the runtime management of containers on
                32bit ? (I'd prefer to depreciate it and just support 64
                bit arches).</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>No, but it also failed on beaglebone-yocto build which is 32bit
      arm</p>
    <p>//Hongxu</p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4NQ20HzxWm7ubXqd4wFXsTBQH=
GYkr_t1vAKHaDukyZSkw@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div>
              <br>
            </div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              $ bitbake lib32-nerdctl<br>
              ...<br>
              -buildmode=3Dpie requires external (cgo) linking, but cgo i=
s
              not enabled<br>
              make: *** [Makefile:63: nerdctl] Error 1<br>
              ...<br>
              <br>
              Get back the patch to allow external specification of
              build settings and rebase to v2.0.2<br>
              <br>
              Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@=
windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-tx=
t-link-freetext">hongxu.jia@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;...xternal-specification-of-build-setti.patch | 28
              +++++++++++--------<br>
              &nbsp;recipes-containers/nerdctl/<a href=3D"https://urldefe=
nse.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!Z_MA5tmBr1b3nH-d4fMpgX=
g69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ2BixUSGPsW8jgZbIXqd=
f$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nerdctl=
_git.bb</a>&nbsp;
              &nbsp; &nbsp;|&nbsp; 1 +<br>
              &nbsp;2 files changed, 18 insertions(+), 11 deletions(-)<br=
>
              <br>
              diff --git
a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch
b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch<br>
              index ca7b3042..cf7037f3 100644<br>
              ---
a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch<br>
              +++
b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch<br>
              @@ -6,20 +6,26 @@ Subject: [PATCH] Makefile: allow
              external specification of build settings<br>
              &nbsp;Upstream-Status: Inappropriate [embedded specific]<br=
>
              <br>
              &nbsp;Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com" target=3D"_blank" moz-do-not-send=3D"true" class=
=3D"moz-txt-link-freetext">bruce.ashfield@gmail.com</a>&gt;<br>
              +<br>
              +Rebase to v2.0.2<br>
              +Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia=
@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-t=
xt-link-freetext">hongxu.jia@windriver.com</a>&gt;<br>
              &nbsp;---<br>
              - Makefile | 3 ++-<br>
              - 1 file changed, 2 insertions(+), 1 deletion(-)<br>
              + src/import/Makefile | 2 +-<br>
              + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
              <br>
              -Index: nerdctl-v2.0.0-beta.1/src/import/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
              ---- nerdctl-v2.0.0-beta.1.orig/src/import/Makefile<br>
              -+++ nerdctl-v2.0.0-beta.1/src/import/Makefile<br>
              -@@ -38,7 +38,7 @@<br>
              +diff --git a/src/import/Makefile b/src/import/Makefile<br>
              +index ae4e18c..eb22f9f 100644<br>
              +--- a/src/import/Makefile<br>
              ++++ b/src/import/Makefile<br>
              +@@ -45,7 +45,7 @@ endif<br>
              <br>
              &nbsp; GO_BUILD_LDFLAGS ?=3D -s -w<br>
              &nbsp; GO_BUILD_FLAGS ?=3D<br>
              --export GO_BUILD=3DGO111MODULE=3Don CGO_ENABLED=3D0
              GOOS=3D$(GOOS) $(GO) build -ldflags &quot;$(GO_BUILD_LDFLAG=
S) -X
              $(PACKAGE)/pkg/version.Version=3D$(VERSION) -X
              $(PACKAGE)/pkg/version.Revision=3D$(REVISION)&quot;<br>
              -+export GO_BUILD=3D$(GO) build -ldflags
              &quot;$(GO_BUILD_LDFLAGS) -X
              $(PACKAGE)/pkg/version.Version=3D$(VERSION) -X
              $(PACKAGE)/pkg/version.Revision=3D$(REVISION)&quot;<br>
              +-export GO_BUILD=3DCGO_ENABLED=3D0 GOOS=3D$(GOOS) $(GO) -C
              $(MAKEFILE_DIR) build -ldflags &quot;$(GO_BUILD_LDFLAGS)
              $(VERBOSE_FLAG) -X
              $(PACKAGE)/pkg/version.Version=3D$(VERSION) -X
              $(PACKAGE)/pkg/version.Revision=3D$(REVISION)&quot;<br>
              ++export GO_BUILD=3DGOOS=3D$(GOOS) $(GO) -C $(MAKEFILE_DIR)
              build -ldflags &quot;$(GO_BUILD_LDFLAGS) $(VERBOSE_FLAG) -X
              $(PACKAGE)/pkg/version.Version=3D$(VERSION) -X
              $(PACKAGE)/pkg/version.Revision=3D$(REVISION)&quot;<br>
              + <br>
              + recursive_wildcard=3D$(wildcard $1$2) $(foreach
              e,$(wildcard $1*),$(call recursive_wildcard,$e/,$2))<br>
              <br>
              - ifdef VERBOSE<br>
              -&nbsp; &nbsp; &nbsp; &nbsp;VERBOSE_FLAG :=3D -v<br>
              +-- <br>
              +2.34.1<br>
              +<br>
              diff --git a/recipes-containers/nerdctl/<a href=3D"https://=
urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!Z_MA5tmBr1b3nH-=
d4fMpgXg69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ2BixUSGPsW8j=
gZbIXqdf$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
nerdctl_git.bb</a>
              b/recipes-containers/nerdctl/<a href=3D"https://urldefense.=
com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!Z_MA5tmBr1b3nH-d4fMpgXg69k=
LMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ2BixUSGPsW8jgZbIXqdf$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nerdctl_git=
.bb</a><br>
              index 63b96846..84734c9f 100644<br>
              --- a/recipes-containers/nerdctl/<a href=3D"https://urldefe=
nse.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!Z_MA5tmBr1b3nH-d4fMpgX=
g69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ2BixUSGPsW8jgZbIXqd=
f$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nerdctl=
_git.bb</a><br>
              +++ b/recipes-containers/nerdctl/<a href=3D"https://urldefe=
nse.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!Z_MA5tmBr1b3nH-d4fMpgX=
g69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ2BixUSGPsW8jgZbIXqd=
f$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nerdctl=
_git.bb</a><br>
              @@ -19,6 +19,7 @@ include <a href=3D"https://urldefense.com=
/v3/__http://src_uri.inc__;!!AjveYdw8EvQ!Z_MA5tmBr1b3nH-d4fMpgXg69kLMDY2D=
xb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ2BixUSGPsW8jgUTSe_z1$" moz-do=
-not-send=3D"true">
                src_uri.inc</a><br>
              <br>
              &nbsp;# patches and config<br>
              &nbsp;SRC_URI +=3D &quot; \<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Make=
file-allow-external-specification-of-build-setti.patch">file://0001-Makef=
ile-allow-external-specification-of-build-setti.patch</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D=
"moz-txt-link-freetext" href=3D"file://modules.txt">file://modules.txt</a=
> \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
              <br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#9131): <a href=3D"https://urldefense.co=
m/v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/9131_=
_;!!AjveYdw8EvQ!Z_MA5tmBr1b3nH-d4fMpgXg69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3c=
BUnZxPYNjW4QCxEKoFJ2BixUSGPsW8jgRASzqh2$" rel=3D"noreferrer" target=3D"_b=
lank" moz-do-not-send=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/message/9131</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.yoctoproject.org/mt/111098600/1050810__;!!AjveYdw8EvQ!Z_MA5tmB=
r1b3nH-d4fMpgXg69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ2BixU=
SGPsW8jgQMaaRQI$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">
                https://lists.yoctoproject.org/mt/111098600/1050810</a><b=
r>
              Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@=
lists.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">
                meta-virtualization+owner@lists.yoctoproject.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!Z_MA5=
tmBr1b3nH-d4fMpgXg69kLMDY2Dxb2OLMyVI-zbZqb8CFnbjwY3cBUnZxPYNjW4QCxEKoFJ2B=
ixUSGPsW8jgZGeqNJW$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D=
"mailto:bruce.ashfield@gmail.com" target=3D"_blank" moz-do-not-send=3D"tr=
ue" class=3D"moz-txt-link-freetext">bruce.ashfield@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not fol=
low
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------cN2K0b1UIo1w0lFW3hsglo5e--

