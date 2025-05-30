Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C61BC54FB3
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 02:49:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2448.1748573375278697310
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 May 2025 19:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82456d971c=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TMNcrm027291;
	Thu, 29 May 2025 19:49:34 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm5t7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 19:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqAwrfEScvdnlkKYh85vJMe1eOBsUWPo5TmR/EI6O8OEm1PZiQZ/2xvWxK9Yt9+c8xJP6ZBaezYa115vdjyxzyD/4qauCPv1+tAQDWq+++T91GFeIKnOeT/sqmA/OoLTnCMet0kSWWXAjl1N30x8MFs/8IQ/0/vH+MCHoyrFVXi5mUxzaFsLUg/piUyNHt4dVXVFLs3b4+5kSqkOC75NQk2kjp1RsTM/XnYpKfM6sxbaZ3MdD0P8SFKBBxKYauxO9U1UpTk55ktbA4LOcBGVHlNSuq6rMYMkarirTYx5rYzBob0VsjddnXBMI3Tvvj7AgOLp4Iw0W+9Zz8vjdmsLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8WBmu8B1Zvnj3vZavFe9a5I/urePBfXH2XRZOZMzM4=;
 b=KXvlDEaHgAq+I65n5PWlPdpaPspfmJSRNIP1EEWUt9l+SAAy2XWT29kcsM245eZU4JlsIHyBKHnJVRzbPr88ChCQ9x4j5CCKIjAYkS4798gcfbqm53/FEFmpPYuDJHhnO0tOucRaUIgoCZ2IEAE5501DaWaQYJlxqYJ7p7nnuuWZKbRPl/NXzoC5zf1H1Wf5WcXVymOHtiE9Jx5+kQkmxV5S92lnTM7ogtgxIwRf7SGXyj9FGhr+fChB6fiGJMENEynTtlPGtwOrEMt+2CBzjaQXQQn6V1qQxN/FoC3OXGaDc3QoOSHJI8ot4YNnAY8g/C2pNhhy8boEecCO4aB4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4808.namprd11.prod.outlook.com (2603:10b6:510:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 02:49:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8769.031; Fri, 30 May 2025
 02:49:28 +0000
Content-Type: multipart/alternative;
 boundary="------------kEplA77WwzfbjIayB3GD5OmN"
Message-ID: <eb0c3c8e-5aee-4ce6-856a-a52c69e5e7c9@windriver.com>
Date: Fri, 30 May 2025 10:49:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][walnascar][PATCH 1/3]
 docker-distribution: bump to v3.0.0 stable version
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20250529035110.1881797-1-Qi.Chen@windriver.com>
 <18440159446548C9.8712@lists.yoctoproject.org>
 <CADkTA4NsMJ58FALS55QOOhwcgBDXRBaxs_dqBnoh8oCq_wt3mg@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4NsMJ58FALS55QOOhwcgBDXRBaxs_dqBnoh8oCq_wt3mg@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::20) To SJ0PR11MB5613.namprd11.prod.outlook.com
 (2603:10b6:a03:3ab::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB4808:EE_
X-MS-Office365-Filtering-Correlation-Id: b32be657-fe16-4ef6-fb9d-08dd9f24985e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cGJkUDVXQm1qaHpPSXZpekcrOU5sTDRha3J0NDMwT21EWFEybTZhUlFyUlVV?=
 =?utf-8?B?eStqRlRzVm9vYmphcmg5TVVWL0t2Qk11a2k1cTdPbkVQMDZlY1gxWkN5T2ww?=
 =?utf-8?B?bFUxendZNGFUcmpKREZ3cENYdExNK3RKNUF2eHJFWTBLSnQ4OUVvTlNLN3NP?=
 =?utf-8?B?WS9aRHJzdlcyZ2NFWjMwQ2c5WlBoSWhzT0pvU2ZUWXZKcTFNQUdMSmZEMFpT?=
 =?utf-8?B?K0tQS0Q3TlREUVlGSnZLNjMxNmJac0gzd1ZsUm1NQnVPRncrOW1UTTJEVUFR?=
 =?utf-8?B?U3FsNTVYRFlNS1RUNWJjV0wzaTlFOUlVa3BWeFNWUjk5YUYrQ2tNdmQyOUlp?=
 =?utf-8?B?b3JTbXBHbDRSWnJ2UEpVU0FVMGVYbkRjbFZsb01MWkVKcC92am50WkwvOVpl?=
 =?utf-8?B?TGZieWROUzdNMU1uay9nMXgrK2Y4R1JEWmtpTXFxdndnWmRTSkE0a2RLY1Fm?=
 =?utf-8?B?UElzZ05PalVBK1ZCRkluTTE2Zlc4WUg5anJvVjVCWlpjbzNVN04ranhlUFJv?=
 =?utf-8?B?RmQ5YVFMblRrRE14dFR2ZTlkTUNpU05NRHdxdnZCeFZ3TTFDNjZwbmFXeG1n?=
 =?utf-8?B?UWNma2I4aXFIY3JpUktlSzhlZ21DNFVhanBDYWpJcW8wUlZJOWgzMGJoNlZU?=
 =?utf-8?B?cmlDY0V3MlVQMkdrWk0zMVpPSTVod1Z1UTdDQXdCaWRFR2oyT3htaFRLNFlm?=
 =?utf-8?B?aFVEb0doeit1M1dCUUFLTFQ3Nmt1bndjU05XUWo5cnZUTTZvLy9ib0xRQ3pv?=
 =?utf-8?B?bUc1OEJ4N3dVRCtOeXdDWWI1RWtNUlA1SkE1cll4M1pIRWZTUDhBKzFlbnAv?=
 =?utf-8?B?R0JqL3l1RnZmOXNhUFRVRzFrQ0FOcEtaNVZ4VGIzZnRSMy9iLzRTb0d2bXVz?=
 =?utf-8?B?NEJzenR6SWgrVTdsa1V1VWN6SEM5dmZuSkhqa0ZYWFM3RExRNERvclFyMjBY?=
 =?utf-8?B?dHNnaTFqNzVBZ3hKaVM5VWVQcGZXNU1FWnN2aGRFUzlEbW9mTDIyd2hZS1B6?=
 =?utf-8?B?STg4TUYwQ3hldUY1aS9LNXJSZjNYbkljLzhDU0YwdlE3UzVVS3JVenlFVGhT?=
 =?utf-8?B?cDRiQWF6MUt4WjFuNSthNi8yaUlpaG1aVWhHNUlmQ3NubHRLMVV3dnJSVHNR?=
 =?utf-8?B?NmQ2Qmhoak5xMDFiU1hoRStidUhpZUlpT1VEVEJPbXE5NzFETHhaQm43ZUx1?=
 =?utf-8?B?SjlKQ0I3U204VGUyWnpZZzhrNlB5V1lISGc1TWxWNGZYckdTWVgwbkFETWJY?=
 =?utf-8?B?RjhXRmNaQndZeko0cEFoMVA2M01BMXVUWXhWYmkrTENpV0wzNEJoblFoZTVx?=
 =?utf-8?B?UGx0YUQrVTJ0RHRvVFpyOEtaa25keXpRQWNYZVJwcWZ6YkRYeVVMUVhPeGo0?=
 =?utf-8?B?ZWpxeUs4V2RYRWc4YllqaEM3c3dqUm1obndZYmRSQ2lIdEIwYytHblJ5OHBC?=
 =?utf-8?B?N3NVTGN5VWc4cExhWDRtb3FyQ01PRlFyR0YwOVRhejhaME9VV25rKzlyczQv?=
 =?utf-8?B?RVpLS3BXQmllZ0lYZDFRa3NsRVN1NU9YU1JPWkZkalFzanpacE1qbGVmclpW?=
 =?utf-8?B?empaRE92RlJJK3JJcFBwMm9zSG1kaVQrQnFEVzQ5WXJZVHhMY3pMSkU4bDBM?=
 =?utf-8?B?VU9Mb1dGSG9WNGpxc3J2ZDhFcUh1VXlzZ0g0UCtYM1NXUzlaQXpCSWhXdUNG?=
 =?utf-8?B?R0RjbWZyY24wTCtBMytZeWpaNXM5UWUwaUViV2VTQVROR2tWSHZiOE9hUkRD?=
 =?utf-8?B?MFl0Q0FobHpqa0RtajR5M21VS2lNWmprT25lRGN3clUraitBcEhtMTBnbDRX?=
 =?utf-8?B?cUEvYVRFSTdsRVZJbm92Y3dzL3JzT0paU0R6Z0duc3h6T29NdkI1aEd3QWNL?=
 =?utf-8?Q?UluBANgTWJigc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S25hcGJUYWpHa3BPYVk0ZzhpSFdPcDE1R1pNMTFHdTVrN2RRK0YzZkgyVXNl?=
 =?utf-8?B?NkNqNEQ0c05ZaGdIYmd0eUtCV1NaZTNUU0NSMG9laWVlbXYzWk11QU5zdzRV?=
 =?utf-8?B?RlVITERTOHl5RGNxN0NLWC9DanhDbDkrOXlyZnNZWWpzTDNiTzVEdUI4cVc1?=
 =?utf-8?B?S3ZySjlNdXpiUC9FZ3p4cGdtZkpZMktCdXptRHlGVXJRZU10YWtYblBtUTNY?=
 =?utf-8?B?bjhYWFk5N2ZWWXR1TVVTNGRMRG40UTdqZVdRaC9ULzh1a2Z6S0hnd3ZsY0JQ?=
 =?utf-8?B?Y29NMmMrdlhkdlRsajdNT2hIazlEOVgrRk03Njg3NVFiSkR5QnBwamFhMEoz?=
 =?utf-8?B?bzFDY2NXd2tHS3JOMm55cU9nQm1zTmlydkhJZm5jYkczLzJyTlQyQm5LM1Vk?=
 =?utf-8?B?NVZIVDZVcnVBbXFOVkNCZG0zRk5YTDd5cE9ZVU9qNDFBcE1qaElQVnN0d1Z6?=
 =?utf-8?B?RkpQWFlKbHNkVmYxaUFNdlhrcjZuQk1JV1VKNUxEdzFnL3RrQkc3K0ZMTjFr?=
 =?utf-8?B?dExWQzdiU1BSUW96aHoxL1l0VzgwWGY2TUtweXlKby96c0czNjJBejdtbjl6?=
 =?utf-8?B?ekc4QjNuNDNkRFZ2UnM2dFNxWjV3T0NNTVllZjcwWkpURzRLaXkvVG1sR1B5?=
 =?utf-8?B?czRMbkUwaXBEeWxyRU9tOHc5OUxkZGxvMEcxeUV1Y1JBNVVieU1JL2x4cEIz?=
 =?utf-8?B?VXc1clB3RDk0M2pTUGVNbVRMSVNMRlVFSzFrUmwwZjBqOCs1dXJyMUlEK3ZY?=
 =?utf-8?B?dzhnSjk1YWNtVGt2dFFCN2Vpa0toem1ySzNRM29PcGR3YS9TOHZYTklhTnBj?=
 =?utf-8?B?ZE0wTVRkUE1LUVZRNHh4MXRZa1p3d3NmejY0UDg2djRlblFST1pOa3hkYm4x?=
 =?utf-8?B?dFFxOEJlMzEzcHdjZEZDSkpmcUlGRTZ4N3YrWHJLODhEVnRlbWFBOFVUZDZD?=
 =?utf-8?B?c1NsZGlPWUJSY1RuQzJqcVlnWDZPNXdyaHpya2Y0L0FJSHVyN0JibEJnU0tD?=
 =?utf-8?B?dkN4Vyt2bThWeG85aTBzU1JRL0hqdzdhU0ZuUkt2SE0rR2RTdHNqZ0tRRHVH?=
 =?utf-8?B?SkF3SnlyZVN5aklsT3hqUjNUZDlsdXJMZjhDQkZ1R2JNTXJOcTMxb0IrOUlM?=
 =?utf-8?B?alRsTnowWGZTTVhmTThON1VjLzZna0FUNU9MM09GWEh2dkJpK0ZKaVkzVVQx?=
 =?utf-8?B?TEtsa2g5OXlFOGErQzdEdkRZZXUvTXcxcUNWRTdJNy9IODRPVzEzYTdJZ2Np?=
 =?utf-8?B?Vy9QT1IxUm9UZ25naUUxcFM3MEhRSnI4RlVQbE94ODAzR1BIS3g0cEJoblJ4?=
 =?utf-8?B?d3RJUW0xcS9Vdmo1NGZKZ2NhQjZMNWRuc0N2OU9UOFlJR1VVWnVkeEU3cVN1?=
 =?utf-8?B?U0VlbVU2eFRJdm9EaEN2Ym11MXp4SlU0YnhOS3hOaHJGUEw5NTFDR3hrbDdF?=
 =?utf-8?B?TzZSSE9SM2dyTXhVSkxQU3FhS1dqVkVVUE9xTDVBa3BpQzhjc2oyZXJsMzlw?=
 =?utf-8?B?bUhCZUZ6S1lxbS9nWTVBMTJROFdTV2pSd2lUZUtabGRKWUkwUGRvcGZ6bmdh?=
 =?utf-8?B?dHgxSHVEdlc3d09DbHpMZndSNjQ4OUYwUTZWVDRoc1dWQVVQcUNRL2tGdUdT?=
 =?utf-8?B?Y0cxbHlrL1F3dnhsVlZCRStDWHpyZUlRMUJLN2pnR05jaW54OURXejYzUkFi?=
 =?utf-8?B?dkJ5MDVJekg1MlBrMmpxNmVMTUw3dXFIVVpQa3RIaXpmTmF2WWQyYzZKOUM4?=
 =?utf-8?B?RzdJb1RadktlOGxQTm1zcnBTdXVrUmNVZkVUZ0xJVFNvYmo2TU5pVGJtUnVq?=
 =?utf-8?B?bXZ0V0RyWG9xT2RpVzQ5Q0lwWnpyd05CTGVGdlhpcGxDVkFIa081WlV3LzZn?=
 =?utf-8?B?VG9pM1hOYkFrK3EreHFZN2k4WC9XWC9BMkxzL3ZaV0s2UjJ4Qk9URFd5WUxi?=
 =?utf-8?B?QjgzRkpQMVE2Mjc1NFJvTmdiSHNkUFZ0L2tRTlMvb0pXZjRvc1Z3OEx0WXhx?=
 =?utf-8?B?YlRrMEt0S0tyS0xRY09Gd1BXUjkrRGdvUjJ0WGdQd0Q0TkpEZFJNZnh1MGh2?=
 =?utf-8?B?S0ZpVlpINzNFQUhvUWUzaFF1OXNKL3FaTFdBV2FVNk5QVnpqRWdHdkd4ZFlH?=
 =?utf-8?Q?4PGQN+QyZJ75JvGRZDrhZi7DP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32be657-fe16-4ef6-fb9d-08dd9f24985e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 02:49:28.6208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uo1E/N98tic/xc+10aM62eQ1prV7LNXHTJFbxHwhmWySHM6Uiew29bPwOL/6MB15zMJRsCMGI7KYsPf0gUmnpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4808
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=68391cbd cx=c_pps a=6WGvpOQPchLzK5RJBAehJQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=iGHA9ds3AAAA:8 a=XkuJC2LXAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=AKk1WHhL0oq62G7ODRAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iJFPRIeXw4BN5RB7hSUA:9 a=itA2gmKRCQjQeDTA:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=xlXauZMLQ9LHMUg6t57S:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAyMyBTYWx0ZWRfX/laUsuxWlp9X 45qebjGvJ4rfIyS43MqjVv0nxswgBp0yeGfSyPuMG2BWBwFlQr53bwdu8zCgyF6l81X7JEQhiM7 z0kiB/jBZH2rEElNCzncPYCpxb02Ht0wLYvemmkIhlX6qIqXrS7+enNedE/XSDHS02ZYk9YNPZa
 A5/3zwss7NGwPYngg8Eh3S9qfyU1pJep264Tbj/SwDvQOPTCQOYqjX+EVzid8fz6S8QE0Bo705a 4gQt/CdDTUkGAP/fs9ItYaSu9sjAm8bUeV+ZYaLlgDJVN7hGYwY8ggHuxNE522PtG2gsTiRvuHM sfrlOBX/2DR7rmTACvAHj17+sdDEzQ3UDkaruquP1XEfl5nas+/Ts6kbLA2VWDUf+CF7U/V6i9R
 p1N9wm4aaXDg45mc0iz3kD5w1dYPffTZOlnFFf/5IBjRlNJA6w96dYTDaENsgHJ7z2ZeAsxf
X-Proofpoint-ORIG-GUID: dIhA2G5FXmzHO45GM_2hze49Q9SQq7Wr
X-Proofpoint-GUID: dIhA2G5FXmzHO45GM_2hze49Q9SQq7Wr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300023
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 30 May 2025 02:49:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9267

--------------kEplA77WwzfbjIayB3GD5OmN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54TMNcrm027291

Got it. Thanks for the information.

Regards,
Qi

On 5/29/25 21:24, Bruce Ashfield wrote:
> I should clarify that my statement doesn't mean I won't take the=20
> change, just that some of the commits will be slightly different and=20
> that it won't be in the tree for a few weeks yet.
>
> Bruce
>
> On Thu, May 29, 2025 at 9:07=E2=80=AFAM Bruce Ashfield via=20
> lists.yoctoproject.org=20
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8=
EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1=
Zkw2Q4GppmNTeP6s1CcuQ$>=20
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>     As I've mentioned before, I'm not doing package upgrades at the
>     moment.
>
>     A full pass of the recipes will happen at the m2 timeframe of the
>     current release.
>
>     Cheers,
>
>     Bruce
>
>     On Wed, May 28, 2025 at 11:51=E2=80=AFPM Chen Qi via
>     lists.yoctoproject.org
>     <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!Ajve=
Ydw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc=
_pC1Zkw2Q4GppmNTeP6s1CcuQ$>
>     <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
>         From: Chen Qi <Qi.Chen@windriver.com>
>
>         Bump docker-distribution from v3.0.0-beta.1 to v3.0.0 stable
>         version.
>
>         Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>         ---
>         =C2=A0.../docker-distribution/docker-distribution_git.bb
>         <https://urldefense.com/v3/__http://docker-distribution_git.bb_=
_;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0=
dVus8hEc_pC1Zkw2Q4GppmNTeNnIxX_zw$>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--
>         =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>
>         diff --git
>         a/recipes-containers/docker-distribution/docker-distribution_gi=
t.bb
>         <https://urldefense.com/v3/__http://docker-distribution_git.bb_=
_;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0=
dVus8hEc_pC1Zkw2Q4GppmNTeNnIxX_zw$>
>         b/recipes-containers/docker-distribution/docker-distribution_gi=
t.bb
>         <https://urldefense.com/v3/__http://docker-distribution_git.bb_=
_;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0=
dVus8hEc_pC1Zkw2Q4GppmNTeNnIxX_zw$>
>         index 495b0d17..41c4e227 100644
>         ---
>         a/recipes-containers/docker-distribution/docker-distribution_gi=
t.bb
>         <https://urldefense.com/v3/__http://docker-distribution_git.bb_=
_;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0=
dVus8hEc_pC1Zkw2Q4GppmNTeNnIxX_zw$>
>         +++
>         b/recipes-containers/docker-distribution/docker-distribution_gi=
t.bb
>         <https://urldefense.com/v3/__http://docker-distribution_git.bb_=
_;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0=
dVus8hEc_pC1Zkw2Q4GppmNTeNnIxX_zw$>
>         @@ -3,7 +3,7 @@ SUMMARY =3D "The Docker toolset to pack, ship,
>         store, and deliver content"
>         =C2=A0LICENSE =3D "Apache-2.0"
>         =C2=A0LIC_FILES_CHKSUM =3D
>         "file://LICENSE;md5=3Dd2794c0df5b907fdace235a619d80314"
>
>         -SRCREV_distribution =3D "f22dd6186008ff9d35f92acc5bc5fd16ba7ef=
95a"
>         +SRCREV_distribution =3D "9ed95e7365224025ee89365e12cf128e1f1bf=
965"
>         =C2=A0SRC_URI =3D
>         "git://github.com/docker/distribution.git;branch=3Dmain;name=3D=
distribution;destsuffix=3Dgit/src/github.com/distribution/distribution/v3=
;protocol=3Dhttps
>         <https://urldefense.com/v3/__http://github.com/docker/distribut=
ion.git;branch=3Dmain;name=3Ddistribution;destsuffix=3Dgit/src/github.com=
/distribution/distribution/v3;protocol=3Dhttps__;!!AjveYdw8EvQ!fQ8kvvvqSb=
AgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTeP=
G79BEsg$>
>         \
>         file://docker-registry.service \
>         file://0001-build-use-to-use-cross-go-compiler.patch \
>         @@ -11,7 +11,7 @@ SRC_URI =3D
>         "git://github.com/docker/distribution.git;branch=3Dmain;name=3D=
distributio
>         <https://urldefense.com/v3/__http://github.com/docker/distribut=
ion.git;branch=3Dmain;name=3Ddistributio__;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-7=
5085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTeNZhIK9B=
A$>
>
>         =C2=A0PACKAGES =3D+ "docker-registry"
>
>         -PV =3D "v3.0.0-beta.1"
>         +PV =3D "v3.0.0"
>         =C2=A0S =3D
>         "${WORKDIR}/git/src/github.com/distribution/distribution/v3
>         <https://urldefense.com/v3/__http://github.com/distribution/dis=
tribution/v3__;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPr=
WJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTeP7xKkdog$>"
>
>         =C2=A0GO_IMPORT =3D "import"
>         --=20
>         2.34.1
>
>
>
>
>
>
>     --=20
>     - Thou shalt not follow the NULL pointer, for chaos and madness
>     await thee at its end
>     - "Use the force Harry" - Gandalf, Star Trek II
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9265):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9265
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/9265__;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnB=
nPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTeO33WvCZw$>
>     Mute This Topic:
>     https://lists.yoctoproject.org/mt/113356930/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1133=
56930/1050810__;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRP=
rWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTeN3Dm0PBg$>
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI=
4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTeMILSpBbQ$>
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

--------------kEplA77WwzfbjIayB3GD5OmN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54TMNcrm027291

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Got it. Thanks for the information.</d=
iv>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Regards,</div>
    <div class=3D"moz-cite-prefix">Qi<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 5/29/25 21:24, Bruce Ashfield wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4NsMJ58FALS55QOOhwcgBDXRB=
axs_dqBnoh8oCq_wt3mg@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div class=3D"gmail_default" style=3D"font-size:small">I should
          clarify that my statement doesn't mean I won't take the
          change, just that some of the commits will be slightly
          different and that it won't be in the tree for a few weeks
          yet.</div>
        <div class=3D"gmail_default" style=3D"font-size:small"><br>
        </div>
        <div class=3D"gmail_default" style=3D"font-size:small">Bruce</div=
>
      </div>
      <br>
      <div class=3D"gmail_quote gmail_quote_container">
        <div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 29, 2025 at
          9:07=E2=80=AFAM Bruce Ashfield via <a href=3D"https://urldefens=
e.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-7=
5085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTeP6s1Ccu=
Q$" moz-do-not-send=3D"true">lists.yoctoproject.org</a>
          &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctopro=
ject.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">gmail.=
com@lists.yoctoproject.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div dir=3D"ltr">
            <div class=3D"gmail_default" style=3D"font-size:small">As I'v=
e
              mentioned before, I'm not doing package upgrades at the
              moment.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">A full
              pass of the recipes will happen at the m2 timeframe of the
              current release.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">Cheers=
,</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div>
          </div>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 28, 2025 at
              11:51=E2=80=AFPM Chen Qi via <a href=3D"https://urldefense.=
com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-750=
85HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTeP6s1CcuQ$=
" target=3D"_blank" moz-do-not-send=3D"true">lists.yoctoproject.org</a>
              &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.yoctopr=
oject.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">windriver.com@lists.yoctoproject.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
              Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Qi.C=
hen@windriver.com</a>&gt;<br>
              <br>
              Bump docker-distribution from v3.0.0-beta.1 to v3.0.0
              stable<br>
              version.<br>
              <br>
              Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windri=
ver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">Qi.Chen@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;.../docker-distribution/<a href=3D"https://urldefense=
.com/v3/__http://docker-distribution_git.bb__;!!AjveYdw8EvQ!fQ8kvvvqSbAgO=
R-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTeNnIx=
X_zw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">dock=
er-distribution_git.bb</a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 4 ++--<br>
              &nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/recipes-containers/docker-distribution/<a href=
=3D"https://urldefense.com/v3/__http://docker-distribution_git.bb__;!!Ajv=
eYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hE=
c_pC1Zkw2Q4GppmNTeNnIxX_zw$" rel=3D"noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true">docker-distribution_git.bb</a>
              b/recipes-containers/docker-distribution/<a href=3D"https:/=
/urldefense.com/v3/__http://docker-distribution_git.bb__;!!AjveYdw8EvQ!fQ=
8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4=
GppmNTeNnIxX_zw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">docker-distribution_git.bb</a><br>
              index 495b0d17..41c4e227 100644<br>
              --- a/recipes-containers/docker-distribution/<a href=3D"htt=
ps://urldefense.com/v3/__http://docker-distribution_git.bb__;!!AjveYdw8Ev=
Q!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zk=
w2Q4GppmNTeNnIxX_zw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">docker-distribution_git.bb</a><br>
              +++ b/recipes-containers/docker-distribution/<a href=3D"htt=
ps://urldefense.com/v3/__http://docker-distribution_git.bb__;!!AjveYdw8Ev=
Q!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zk=
w2Q4GppmNTeNnIxX_zw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">docker-distribution_git.bb</a><br>
              @@ -3,7 +3,7 @@ SUMMARY =3D &quot;The Docker toolset to pac=
k,
              ship, store, and deliver content&quot;<br>
              &nbsp;LICENSE =3D &quot;Apache-2.0&quot;<br>
              &nbsp;LIC_FILES_CHKSUM =3D
              <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE;m=
d5=3Dd2794c0df5b907fdace235a619d80314">&quot;file://LICENSE;md5=3Dd2794c0=
df5b907fdace235a619d80314&quot;</a><br>
              <br>
              -SRCREV_distribution =3D
              &quot;f22dd6186008ff9d35f92acc5bc5fd16ba7ef95a&quot;<br>
              +SRCREV_distribution =3D
              &quot;9ed95e7365224025ee89365e12cf128e1f1bf965&quot;<br>
              &nbsp;SRC_URI =3D &quot;git://<a href=3D"https://urldefense=
.com/v3/__http://github.com/docker/distribution.git;branch=3Dmain;name=3D=
distribution;destsuffix=3Dgit/src/github.com/distribution/distribution/v3=
;protocol=3Dhttps__;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQ=
txRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTePG79BEsg$" rel=3D"noreferrer" =
target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/distribution=
.git;branch=3Dmain;name=3Ddistribution;destsuffix=3Dgit/src/github.com/di=
stribution/distribution/v3;protocol=3Dhttps</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-t=
xt-link-freetext" href=3D"file://docker-registry.service">file://docker-r=
egistry.service</a> \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"file://0001-buil=
d-use-to-use-cross-go-compiler.patch">file://0001-build-use-to-use-cross-=
go-compiler.patch</a> \<br>
              @@ -11,7 +11,7 @@ SRC_URI =3D &quot;git://<a href=3D"https:=
//urldefense.com/v3/__http://github.com/docker/distribution.git;branch=3D=
main;name=3Ddistributio__;!!AjveYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmN=
wmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTeNZhIK9BA$" rel=3D"norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/distri=
bution.git;branch=3Dmain;name=3Ddistributio</a><br>
              <br>
              &nbsp;PACKAGES =3D+ &quot;docker-registry&quot;<br>
              <br>
              -PV =3D &quot;v3.0.0-beta.1&quot;<br>
              +PV =3D &quot;v3.0.0&quot;<br>
              &nbsp;S =3D &quot;${WORKDIR}/git/src/<a href=3D"https://url=
defense.com/v3/__http://github.com/distribution/distribution/v3__;!!AjveY=
dw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_=
pC1Zkw2Q4GppmNTeP7xKkdog$" rel=3D"noreferrer" target=3D"_blank" moz-do-no=
t-send=3D"true">github.com/distribution/distribution/v3</a>&quot;<br>
              <br>
              &nbsp;GO_IMPORT =3D &quot;import&quot;<br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              <br>
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
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#9265): <a href=3D"https://urldefense.com/v3=
/__https://lists.yoctoproject.org/g/meta-virtualization/message/9265__;!!=
AjveYdw8EvQ!fQ8kvvvqSbAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus=
8hEc_pC1Zkw2Q4GppmNTeO33WvCZw$" rel=3D"noreferrer" target=3D"_blank" moz-=
do-not-send=3D"true">https://lists.yoctoproject.org/g/meta-virtualization=
/message/9265</a><br>
          Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.yoctoproject.org/mt/113356930/1050810__;!!AjveYdw8EvQ!fQ8kvvvqSbAg=
OR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTeN3D=
m0PBg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">htt=
ps://lists.yoctoproject.org/mt/113356930/1050810</a><br>
          Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@list=
s.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">meta-virtu=
alization+owner@lists.yoctoproject.org</a><br>
          Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lis=
ts.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!fQ8kvvvqS=
bAgOR-75085HlgS_XCnBnPmNwmI4HQtxRPrWJrZ9_6HN8Re0dVus8hEc_pC1Zkw2Q4GppmNTe=
MILSpBbQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>
          [<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank" =
moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">bruce.ashfield@g=
mail.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
      <div><br clear=3D"all">
      </div>
      <div><br>
      </div>
      <span class=3D"gmail_signature_prefix">-- </span><br>
      <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follow =
the
        NULL pointer, for chaos and madness await thee at its end<br>
        - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------kEplA77WwzfbjIayB3GD5OmN--

