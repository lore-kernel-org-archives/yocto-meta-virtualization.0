Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E81FCA0EDC
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 02:14:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.92048.1755051241583437161
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Aug 2025 19:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0320c6fca9=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57D1nCo02370706;
	Tue, 12 Aug 2025 19:13:59 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fvk219uk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 19:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeAVqXbR4sIZnm18/sqifC53QtABDPqwfTzJGOinWDlOuZTMBtNtajOIbTOe/FhDOszSkUPzm+PdCTCYJPW8fbUNBPm5VpFWHa9xDAOR44g4YaaTd4CxV5CKc2lk8/QwGYFZckMsg768fuE92GXkUgx6p1DDa3VOuwp8fnLXzN2jIn0mNrqOqq8yHg3aodkxnjgSevD2vCNGeI2O0hbXxVwQBP40x88EDiN8kt206FIks6OrSek5Xan7Gcz/5ZfCdp7f4dUzSJIZQbKfDMr8OQI0fJ2BEBErBjYAxgvn/vxUzZUiRP8VT5KKadYeWAJhm4UCgCxspM04l1KYcNsu0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRxunIhdta+wG6MEhK+rDEaqUMwSProO2aKghcWfwKA=;
 b=o9e80ETZuCCbwRqHOfAKZ4oafHMl0bK8iwQP6LVGc5oMXrkr1hbFOolBneee2vlAt0zJm09Ywlclz5dYyO/ae4kTKKVNdzRpGl5HPwscXcL6qSkZAkaOaz42ILs4HnqSnTouKLK051qoawLSXR3uUBMygdfFv5Vr5SfvluNYnVb2nE6tO/C4YcHBX3aFUC+0StvNCA6oy8giQGNF7VI7L6Oi980zuqERkx/D9mukzf4fio6WGalAFaJ+JntMFZf1cFz4xAB0r1iayGVlllBpLEFhBGIPxBBwJM+aDD3TfWYjPq0aNO6IaN/TjpW6Y4svMdMkjHht3FBJ+9MknVam2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 02:13:56 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 02:13:56 +0000
Message-ID: <d4a4a660-6093-4465-b8bb-0b13c4cf79db@windriver.com>
Date: Wed, 13 Aug 2025 10:13:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] skopeo: avoid overriding
 GOBUILDFLAGS set in go.bbclass
To: meta-virtualization@lists.yoctoproject.org
References: <18543A11B753F956.534@lists.yoctoproject.org>
Content-Language: en-US
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <18543A11B753F956.534@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 918df619-817c-4402-3925-08ddda0f0e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eGgvcUlQNWlZblVnczVJQ1FwSU9LT1U0dWRzdW9QZmEyVHg3QXVzR1ZuOWdF?=
 =?utf-8?B?a0lnTVpOYzFibFlHN1dwR05YR3hoWFUvU2F6RTE1eldLY2IxbDVENkZUZjQ3?=
 =?utf-8?B?d0doNnVOUUM5ME1vMmhLL0V5Tno0ZjRld1dPSzRuQzYvWVc1SUxUMmk1Y1FB?=
 =?utf-8?B?Z0U2SVFGbW93TkZJWWdFNjBLUXZpM2VyMUZHaWNGWUJ0b1NOWFFUbDhoTjlj?=
 =?utf-8?B?YmJiV0R0VjA5SkdzV2pGdHpEMUdFalpRSGNJYmVPWWY5YUR6cmZrQUJlSGZt?=
 =?utf-8?B?dUJ3ZlFsb2hldEFSL2d3K3g1M041Qk05eG9Tc2ZGWWZpcUxBMWx0dXEwYW90?=
 =?utf-8?B?MVdreWpGb2NmWUtxM2llSDF0R0gwT1hSaVU5ODBRNUR6QmxUd0h3MVlITjV1?=
 =?utf-8?B?bExxMGQ4dERJQm9nVVRDY2o5VXgyY3BtaEZWSSs3SHI4VDh0K2pCdWZNWjZa?=
 =?utf-8?B?R3VMV0d3NjZhb3FBd292Z080QlpwKzc1eG4xYWh2bkEveWtsMjVPLzJOS3BV?=
 =?utf-8?B?Tm44M3lOSTZ6UWM0dkNHb0lJYVJYQ3IwR2QvSTVCYWJwY2REMU5OcTRDdGtU?=
 =?utf-8?B?VHVCRXRvZk9KdDNPdXNyRHAxRnd2TDFCUkI2SVo0bS9HRngvL0EzVktuNDl5?=
 =?utf-8?B?NzZQM1N3Ymx1cDQ1MEFJQUdER0JtSmFCeW1tY09yQUVJY3pQM2tpWTBOUHhV?=
 =?utf-8?B?VUdQS2hTSERpL1ZzMnl6TEQycmk4cnR1SHF5RTBKNVhxSmZpK3AvOVN2Tk92?=
 =?utf-8?B?MUpNYU9tNHlrYkwrUUNOWFNIaldDRGZVYmcxdWtTSTRoZTc1RFI5cTA4M3Yv?=
 =?utf-8?B?SExWY2E1U2ZJNHdqV2c5czEyYnhlR1Z2eVZYYnpxUkNWZ0toVi9EZngxQnR0?=
 =?utf-8?B?bkZRUGFONHYzUzMwT1F5M21Vb0lUL0doVVVyc0x0dHN3dEVOQ3NaeU1uR1BT?=
 =?utf-8?B?bDM0cVFYdzB6c1ZnUTJVNGJkMFdqaDZjMEJEMVlyTHA1VTVPMUpOVHdwRDZw?=
 =?utf-8?B?Y25RU1hvY0JXalBqOEI4aGg2TSsrU1pqTlFjekt3a0VOWFlyeWRWa1Fxd1Bm?=
 =?utf-8?B?VmRBRkdSU3dlVFAyeDB2YWVIM1ZLMWlIMG1WVnMxeFJ0WVBINXdoS0VpNFBa?=
 =?utf-8?B?Wmd5UTBiWktiWmpRSVZPbnk5dVByL0ZqTWRPNFVxT2gwTGgyYlh3a3BzMVFl?=
 =?utf-8?B?VDRxTXBKdFlCeEQ4Si9hY0t3RzJ3cHkvc0piSno4VmE2bUNUeCszMnRtcUly?=
 =?utf-8?B?OUxaZ0xpbWVhazByZ2RjeTB3OGRsWnJOd3B2YndQWlVZL1hGdm4yTzVVMFVs?=
 =?utf-8?B?RndIaEduTFFlUzhicTYvdlNXTzQxK08vYi9JSE81ZURsRGQ4cHVHckhXcVp5?=
 =?utf-8?B?VmV2b25sNml2bmdrYzY2V2NVRmdoL0ZWRVJycWFCODJ0dmNiNG9jWExJdkFF?=
 =?utf-8?B?QVo3T3JFOWZhdkxNRTVFQ1J6Nk5EejlBYmR4NjZCVUNJekFoMHZBM01TYWtH?=
 =?utf-8?B?SzJ5SElya05odzdOWk9KNW1sV25zSzZtMkZ3VE4zd0xlS0gyVStVMC80ZFVu?=
 =?utf-8?B?WjhKQW5WSzdCeUZLNk0vYVoybVNDeVNRV1FNWmRmL1ZNN3ZpSFdkc3dQNFN0?=
 =?utf-8?B?cnBZRHR0TzBRMXRaUm5mQkwwNkZKYmo4Wng5ajBNNnlEbGlGT0VuOTdCUTRE?=
 =?utf-8?B?ZnhaTjRGS0F3UWxuNWV0MHN4RkkvS2ZBOUxGTFdrNzhUZzRicWt1ampkWkFG?=
 =?utf-8?B?K3FYYmQvOU9wSS9VZzdRLytoSkt6OUN1S3pYeEljQ2dLYnovVW53VkxxVkhq?=
 =?utf-8?B?bTBIZExTdFYxQ0xZTmh3aWQvSGQ0WWJiVHZyV0FHbWxNYURHTXNlTHNOakJi?=
 =?utf-8?Q?8fwPeF+IBn9XQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ek9sdjFhMDhXTEJTZm8yd0lncEpxY1F4WGpLTjh3K0JiN3o0NlFmekhsVUpZ?=
 =?utf-8?B?RHdzNzhVUWM4cWNMcHBXSE5zbGZNRnQwWmYycjFFc1FUdHUwUlR3dVE0T2E0?=
 =?utf-8?B?V0IvRzlvY0FqWFp4bWhaMjhIbUhISzMxWGVCNldIZENBcElrTUJIS0xncWJt?=
 =?utf-8?B?TUZRVEZHKzdlTGNyd0NHckFPaS9ZTXVzMHZpOGgvbnlnMVRqZEdMc3I2Z1ov?=
 =?utf-8?B?QVY5VzgzL1RmWFVjeHAxYjNEbnZBYytEZmMvY2ROVlZzbEdaaU5sdzFZNDMv?=
 =?utf-8?B?dVo0OWJKVnFLUjRvNkR0bVFhelZCZzhJNTNrbWZQd3B5c0gxS0I0bjc0bi9k?=
 =?utf-8?B?RUZpdmNWN2Q0dEJYbmVrbzBxbTZueHZISmdzVnMwRkZJS0Ivam13VDVHcm92?=
 =?utf-8?B?WnR4cHZGck9oendnNEhZQUhGOENEdGJlMjIwbFRwK2txUVF1Q0pXQjVsR2s1?=
 =?utf-8?B?YVR5NE5yVmdWUW5jNVdST09QeldBaDdFUHdVVHJCZUJhOXVhazZmN3JKRzN6?=
 =?utf-8?B?YWhpcG1mOWhFV3diK25CbUZCMEZCdVk0TG9GZ3AzbXVhVmZ4MVhsb0F5ZE5y?=
 =?utf-8?B?ZG1EM2NpVnZIWTZkbmptQVJpeWVZdlNIejhTUzRlellYYk1xVklqN0RFRzJs?=
 =?utf-8?B?eTdnRGRxMlJEMmgvYUpyelpWZVVSbWRHbUpPaVVsN0VpekRRcXp4ajhyT0VL?=
 =?utf-8?B?VkJqMFhHWVM1dDIwUW9iclZ2RlZ0T1JuYi9odXZXV3lpVDlWWDR1WHVha0xi?=
 =?utf-8?B?eGxDRUZXaWNKRUthZnlJNmFud1A0eDZsU0w1M1g2L3dRN3JDb0RsUVJhQzA0?=
 =?utf-8?B?cmZYSzNOZ0xxL2pNY28reFQveThHUUxxZkVlYmR4ZHJYME9vajI4NGRIeXdT?=
 =?utf-8?B?b2xHMkZTQ2dCN0VCbFNFM3lVMHVuV1ZsUmp4OVVwUnhuNlNUZlJzQjZNcFpW?=
 =?utf-8?B?NDNWSHBSeXljV1Fqd0xMMmpGRndBazZuaC9JbmlzVGt5S3NxSFNDSFNoek1p?=
 =?utf-8?B?c3hKTW1PMGxWYTZSWkVSVUs5MlpZZjNpQy94RlJTZ1MwajNaS0M1MU5FTjZS?=
 =?utf-8?B?TkNEUytscXNwNnpiNjhnVitJaFNNMGR5aWdnUHJueFFueCt1aFJ5R0V5Rk5S?=
 =?utf-8?B?bndxckZyb0syQjlPc1phaUhDbnQxeElpMlZlVjFLWHdFMWk5elVFTW05dXBF?=
 =?utf-8?B?V2VrOEQ2U3NTRkg1ZkcvQ3RRdktFNlBteTdEQm5qMVpMTjBkV3lQYmM0cFRH?=
 =?utf-8?B?SjdxTHBzeTRWU0pZcDRLcGlTcjA1bFJFdWZZcGxXZit3YmY4MzJUdTJuM2tC?=
 =?utf-8?B?UWF0ejBLQk45LzZGYVdoMVhKZUtRMnZZcUdKNHhXajU0cld1ZjBYazFCOVZN?=
 =?utf-8?B?bndKOEpCRVhLNWd3VEFBdG9yUFFMUzc2WEtLSWFiUGxVaFJYeFFNNVpPM2k3?=
 =?utf-8?B?T215cW1YUm9vZGFJTW9yQmRRTGhaMTQzZmh0MDJJdHorbjdSUGw5ZCt4VmxI?=
 =?utf-8?B?ZEJnckREZXR6VHIxV1VPeElyYmtBUjZMY3VqVTc5SFVEN0hPK0poVGNrSUhw?=
 =?utf-8?B?VnlzVUFSc054S2FFeVhHcHFBZFdXM1dUNmJNcGN1KzBSZlRsVjN2aHd2a245?=
 =?utf-8?B?a2hzWDdxOHFCYkJ5WllkWmplT3EydXcxeDVRZFdaT0IvOHVyV2FjS3pSZHl3?=
 =?utf-8?B?YzY5RHQ4bUJCQlVPMmdrc0lOQTBOc1BrUFp3eENpbWpKOW01NFJ2T2d0Wnoz?=
 =?utf-8?B?VmVoNzZlQ1dHdkRkeDc0WHExcXp6K0JmOWNoTEp3d0RWRDZvZmlQdkpMYlNo?=
 =?utf-8?B?eSszM3E0cnU5Q0ljdXIwSkVjYjM2eHQweXRsQWVQLzY4OUpuQnZZMDRCQjkv?=
 =?utf-8?B?cjlZS3BHTmdMZXp4QjRYTTVkUXp1clQ2QmRhZk1lcFR0bi9kRVZLcEtncjQ5?=
 =?utf-8?B?L0NvNlNVSVhFekF3TW1lN2J1aEdxOUxNcSswWDM0V25sTnRBNmp1Nk9yaHNU?=
 =?utf-8?B?eHZFT1YvUmtLR0U4YXl1cExSMFhCK2tYNlByOXU5eXkvSW9qYjY2TjY3eEFa?=
 =?utf-8?B?SUY4SVdEelJzaE5SZEJFSnorR0d4Sm82ZklzQWprWG83VlExT1RJR3BadWo2?=
 =?utf-8?Q?GSCSQHZBhltXnYxv/Cf6P0yWB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 918df619-817c-4402-3925-08ddda0f0e88
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 02:13:56.8616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaWBUlCOrChK5qqtLoePxMUvTLNhlKkQqAJnoIW1RGG/UI3h4/O+QlvrNg32wNvKxiatVhC+3tHNrxi86KQx6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDAxOSBTYWx0ZWRfX2rbn1SU4Xlns
 lu8BfD4q2wDCPqGr/eutBKOT5dbYMDxtwJuXLfrnUqeUsVWMmxenZ72zWLN4UBLcxNTTD83drPm
 JAKzqKghgcrTZH30L3OUWyL/yBGWKJ+zSDefQxo8zexWO7T9JKYTJ/V14pKzGWVlV/Mvr034rdI
 YjEvMbPpoSaj1llMQc7EoobUujEDJryFoE7GEBoaRVI9b9crDFmz7wHvAY7DtbSqvcHuv5t0cir
 8ADe3wGRW++HpT8TW7+qrEOb0+9DeBZiJ5MnMZJutFVdmNuB5VC7rXfNMRK2hauKeJZI184I+6Y
 WUPEM3EgYZGGvzNk3q/VceUSRyYO8VcAlhNx/Ou47TBALjeKDkCan82EsP1QjU=
X-Proofpoint-ORIG-GUID: 1-HbK4ozw5IK9zpL16hWFxA0taiRBCtJ
X-Proofpoint-GUID: 1-HbK4ozw5IK9zpL16hWFxA0taiRBCtJ
X-Authority-Analysis: v=2.4 cv=PsOTbxM3 c=1 sm=1 tr=0 ts=689bf4e7 cx=c_pps
 a=nm3qkiEdQefvnzZsVJXsYw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=C_9lfxxwnd_0Fprc72MA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Aug 2025 02:14:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9348

ping

On 7/21/25 17:26, Chen Qi via lists.yoctoproject.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> When MACHINE is riscv64, skopeo fails to build with the following
> error message:
>
>    ERROR: QA Issue: skopeo: ELF binary /usr/sbin/skopeo has relocations in .text [textrel]
>
> To reproduce the issue, run the following command:
> MACHINE=qemuriscv64 bitbake skopeo
>
> In go.bbclass, we have:
> """
> export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
> ...
> python() {
>      if 'mips' in d.getVar('TARGET_ARCH') or 'riscv32' in d.getVar('TARGET_ARCH'):
>          d.appendVar('INSANE_SKIP:%s' % d.getVar('PN'), " textrel")
>      else:
>          d.appendVar('GOBUILDFLAGS', ' -buildmode=pie')
> }
> """
>
> The '-v -trimpath' and arch depedent '-buildmode=pie' is generally reasonable.
> And we can see we'll need to use anonymous python function to handle PIE. So we
> should avoid overriding it unless necessary.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   recipes-containers/skopeo/skopeo_git.bb | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> index c5518cdc..32938108 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -60,7 +60,6 @@ do_compile() {
>   	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
>   
>   	export GO111MODULE=off
> -	export GOBUILDFLAGS="-trimpath"
>   	export EXTRA_LDFLAGS="-s -w"
>   
>   	oe_runmake bin/skopeo
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9326): https://lists.yoctoproject.org/g/meta-virtualization/message/9326
> Mute This Topic: https://lists.yoctoproject.org/mt/114265288/3618072
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


