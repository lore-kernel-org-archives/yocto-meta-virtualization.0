Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5B4CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 09:57:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12571.1758275826607380471
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 02:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=I8zwPdzE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1357ce531b=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J6R8ug786894;
	Fri, 19 Sep 2025 09:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=2wSTv16xEUgDaKWbpexJra
	+erWFTcIcfxpHpVXSFz+w=; b=I8zwPdzE+uX+pL2aCrm+n2XMyZyIMqa5wjqOnx
	Bo9UKlaesAt8qkkaP+72tDnfL++po2uG2ynroVZ/BrjuqilwjM4ElPqGGvlVl9vZ
	hofomqZNqYLpEph0gMwhVCTF50vsFzeNHRRGjUbSpHogtz+ZoUg97x0Dfx40Fx57
	op1c0ROZo1T/Y0SLbECUsEQ6xb2a3yXRoh/5qVsJVk/r1PeLRBKRgiOabUVjHaMJ
	/vfmq60YM1DvZbJlBPBuEmynSA10ALaFkNOPdLf/qsRPz/KHbSFuk9WNlFtryKMv
	8618I1kXLmTHmsWGr0jtO+OTN6ujrHg4Yvsj5DCiv+FNy1xQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012055.outbound.protection.outlook.com [52.101.53.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vjw0ck3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Sep 2025 09:57:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRrWISTGmU47PIcSLLCOzAdaISRmYsBKPzqigz9UNswUieSfrcwapPmD5OmiuD5UV7JQObLdRify7UdO/dAlgLGS1pqabDPc0RCyYB6qKeZL3Iss29K7EBNrxHEmuYE/oJavaCPYr0PtKtGth+1VZ6KASdsaOzoHf3X8wsLCyuGgPkH/fYrUXyaNhR8xZ+6jJYdI/m0E8McsmFEjDaYI/Uq0yzUdiQ+oSVI363TRluGKmJmhnvj+TTp3l6pVcWtCWfb3csYGVq7nePwYMOIyd6d4pqRsisE8G0RvWSJk/RDCm2RDVrqbEVAmRFHfHJ8znrsUL/TYk53DjVL7BAyLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wSTv16xEUgDaKWbpexJra+erWFTcIcfxpHpVXSFz+w=;
 b=p3Pb+3NV9t4yqCUX1BL62OfxI7mhvUVM7iP0sbaCIHfeoJmOTH78ROLicW7uwetXdjwUSUl3vBsXy/FBz0LZT2148SHHJhhZLas6fies56XjLO9x3yObbD6ogjTj3zNTpacl33/RJ60grJ17eBHWKUJQe4q637YIZVuCb24RbB0hSuMHbxzzZk+uH9PT+NRGL5SZWJz+1redlQv9X2DTAboK02UgvQzMDYZLNHAIofWNMFO4fO4oVc6GCSyBp+jbaS0iJfPd/x0PRNTm07XjR5SVbDdQyZSkAfyq/KsPF9ll+mv8/e3X0KbbRknCFQ3oHPz3WpxunUjjVxGSbIRHxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by DM6PR11MB4579.namprd11.prod.outlook.com (2603:10b6:5:2ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 09:57:02 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171%5]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 09:57:01 +0000
Content-Type: multipart/alternative;
 boundary="------------kbqttXiYSuRH0umh0kbYVR1l"
Message-ID: <00b215b8-ce7d-4c82-af5e-0d120a291905@windriver.com>
Date: Fri, 19 Sep 2025 15:21:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/2] podman: fix
 CVE-2024-9407
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20250916052515.891345-1-yogita.urade@windriver.com>
 <aMzCwxyq0uVpLCz0@gmail.com>
Content-Language: en-GB
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <aMzCwxyq0uVpLCz0@gmail.com>
X-ClientProxiedBy: MA5P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::15) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|DM6PR11MB4579:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c4ee78-142d-4518-058d-08ddf762e14e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|4022899009|13003099007|8096899003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZUJPaVBLVmhEOWMxUEl3S1pVRE9KWEVZZmloTXFId1F3bkNZVm5UTXR0b2wy?=
 =?utf-8?B?R3JLZ1NHVkRSSDdTQVZSd1ltcmJUU3U5WlNJS2NJb3VPaU9Fa2xpcHNIODJh?=
 =?utf-8?B?WTBUcHJJWFlydnpCVkp2Q0diNmdRODFKSDZtV0V3Qm1KWFhoMGI3anFveDU0?=
 =?utf-8?B?ZG8zQ3RPN2lDN1RhKzlDWFNUSnpBWFZsQUhjNjJZN2dRdnVtajIrYmxzWjE2?=
 =?utf-8?B?d2YxRWdCUVpmeG5MdXo3aUY0Sll1M2NhZzJrR1JUcEZmNHV4MXFIWTM2MGQ1?=
 =?utf-8?B?RXhDNXZPREI2d3ZHRlhzZ0VETHBRVnR6SWkyRVg2Skt4b3hncDNEUXhXNVJI?=
 =?utf-8?B?eTRrc1FrZnVJNndlU3Y3bXFMRHVQdGplazltSEIvcFlHUG85dFlISTZJNzk5?=
 =?utf-8?B?Z3dkaFRJcXFIdXE3Sk9PeG5iMFBRNkc2a0kxV3hwOXFIdVVSRXpFRTNFTjlp?=
 =?utf-8?B?QlNhb3AwK2dFUVNEUnhnSlM1aFNMWXYzUm1zNzF4ak1jZG9MSjNDNFhFQVNa?=
 =?utf-8?B?cEthNUhPdXQ0SWV6NWxuZXpJSzN0d2UxWUN0VmV4eDl2YWRWTlV6RUdQb0JY?=
 =?utf-8?B?R2pKVEcrdWF4c2YzUmFJZ0liYUR0R3dSQjZiUWt4UzhJaU1kcUlJTE1YNWYy?=
 =?utf-8?B?Zi9JUDc0d2FxTFNpTWJjUXdhWEhQMy9lSkozcUhmZEEybXFVSTk0ZmsraHBS?=
 =?utf-8?B?RzhGcW5jVWFQVnFtWkt0RTFKMHY2Mkg0czN3UGNjMVZnU2k0SkZWVGdTdVpk?=
 =?utf-8?B?bXI4S2VzMTVJUEg4a0FZSmxIZWxmM0kxblZUcHlFaWZybFdvTGtGbmpTZVl3?=
 =?utf-8?B?SXBzMVc5OXVwbE5uaUdyc003T0wyVE9vNEUxL1EyL2dGWkpKeWNHY09HVkdw?=
 =?utf-8?B?N1kzL2wzSjhCM25KM2lWOC9wbUxjR1hUTktqNTZVQXppeWJ6dFo4MGFhWTJn?=
 =?utf-8?B?MFVJS1JhWWNSeVdJOFBwakhHSnRYSjYxYXhkQmE2eFFtZGg4aVJEaGR5TVQr?=
 =?utf-8?B?WEpWU3ZyYm1SODA0OWQzcy9rRXBRQ091RzVWdDIxS3pOQ29PWG9Sa1pubU5r?=
 =?utf-8?B?Y3B3S005cDVTWkhqdENqelptUTk4N0t3bm5BcG9BcUFQenJNNWtrbkpPM0Z4?=
 =?utf-8?B?ckNkOVoxWVEwR0Q5cHZ4cVpRSzdQSHY1ZmF3aWdScmRycnJ6aVV2emlTZ0pO?=
 =?utf-8?B?WTl3L2c0NHMwSXFyamZaK0NVam5ZdDlJR0xZYXVhUFNEamRZZnh0WnhoZzhV?=
 =?utf-8?B?ellIbVYvWXZIL2hCcEtWTTdlUmlXajk2WkdSd0tsT3NnWmxrOXFCMENLWjdi?=
 =?utf-8?B?OVdQL1JhczQ1cFk3SU5hN045MUc2L00rNEgwSzhkTStwQXJkSXhnUjdBL3Mr?=
 =?utf-8?B?NDNicmxGWjdnZ05DcFRJSkw1NVdmcXlhNklFNXhRdG1pWVZLbXViR3JUY1Qv?=
 =?utf-8?B?UDNlT0NQNTJBYXVteU5JQUhyL3dDMC9RTlh1NHEvOG5rQjdlME5Zdm94OHVJ?=
 =?utf-8?B?eGNpQ010cVVWWmVaQ1pvLzB4RzNuU3V5eWNuRUgyci9ZbWw1Y25HNHdWQ3dD?=
 =?utf-8?B?S1pxOHJ0RjZVMFU5M3ZIL0VyTlY4TmJZZmhaWjdoZm1DR1NXS3lUVWpWZnBT?=
 =?utf-8?B?TmtzT0luT2l6a0Z3L3BJRjgzYW9qZkUzUzNlVjJVS3cyTUEzYnBFNDk1Z1hK?=
 =?utf-8?B?QW5jSGpjZFJIVzdjeEVGUHJpK0l2aHZlU2Fic09GeG1NRmJyUm9lVHF0Sm5i?=
 =?utf-8?B?c1NwbHRTU0gyOGhBa0pMd0E0OEphT2RKQUlvS0gvdDFlMlRGaUd0TzZWbHI5?=
 =?utf-8?B?K0RyWXorZjZxeGpnVmxLc2F4YWZsUE1tRHYwNHdrejJjQlhxSzJCMmtxVlhj?=
 =?utf-8?B?cFVMY08zSjRJZ1RuaDVqaWsreTRIcHk2UlQ4WUU2Rm0rWXFHdEcya3JvMG1s?=
 =?utf-8?Q?zlj1Mi1AO8PXAg7yIObyrSqaRN8h8r4x?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(4022899009)(13003099007)(8096899003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bDVsMU1qYzNPVXViamZjcHlBSXh2allHSndNUEVKSFdUK3B3ckpwcnU5Vi8x?=
 =?utf-8?B?anZrL1RIcEY3SWdsQjZwQ01vWENrbEd0RjZ3Wi9tNU45WHBwZG5jOWxJcE1O?=
 =?utf-8?B?eUgvM2RWL0JhRHhXRlFycGRlWDF2aFBmRDNmTTNOTE5qd1JJckZtUmtNK2Fn?=
 =?utf-8?B?cHZ1dnVZbWQ4My9PUW4remNFSWFiR0kzbERqTU1uUEJON2hGblJ3OU03Vlgx?=
 =?utf-8?B?dVU0T0VWcmxFQ3hoRlpDZ0JwVG1maDhjNmVpWGUxVTF0MDlTWHZydGFxRUVS?=
 =?utf-8?B?U1RlZmJFVU1sdnNJUk5hWXM0UG1WOFFhUzBzY0Z1UVo3UEs2aFdqZkl6eFQx?=
 =?utf-8?B?OUxZZG00cnUvWG9SOUdmaW1tTjZXWnhEQ3NHUXliOHhYaWtwZm5haW1Mands?=
 =?utf-8?B?bnN3aFZQWk9UVk9YME5jWGFZVm5Nejgxc2M2TG8rV0hKRGZHWHRLNVdpM1R6?=
 =?utf-8?B?OWcrbUl0NW1CYjRpamlkVG12aFovK2MzT2tzeUx5VnAzZHRGdmxCY1hhZWVW?=
 =?utf-8?B?V21aM1BEZkFGbkZtdHpoVlRZSDRRNlh2WXJ4VU1NaHhFbVFmRU1XSk1acHJ3?=
 =?utf-8?B?MmpkRzB6TFZWSlE5ZGE5N1dpdk13SVNoMFpra2tVczlFR3c1bDRWNHM5bFBE?=
 =?utf-8?B?Tnd0RUlaU1B6QjRQRzVkKzdCT1VYcCtjR0hSVHBQcVpBeEhHZ0lQVXJXQjBG?=
 =?utf-8?B?azM1eGQxVmZSL3YzaThSTkRhSmh6clV4VUdnTUIxTzFSazRhTjAwSFZMQkJ1?=
 =?utf-8?B?c2h3WG9Ob1JWTEUvd2syMHZQbjdLNDFsR0pJSHZCS1Q0dW1CYng4bXVKTDFx?=
 =?utf-8?B?TE16WncxY05PNzQxTUdrK1N5UUE2L091MTdUeG9xOXZ6cjRvM1dMTldpSkJp?=
 =?utf-8?B?S0lZT2dsS1Uxa3hQWFRrVlA0cjNOUjBHWkF5Q1cwNW9LeTUzUWF3VzZWL3k4?=
 =?utf-8?B?cjV6em9aVG1oNGc1dXFSeEZaNksvaDlDcFl1VW5HRUJPTW5qYWp4NDVPS3NU?=
 =?utf-8?B?TytoeUplQzlVQUZZVHpjOUZsR0U0Tnp3VHROY1Z6dWh4aTJ1dXJCUWx3K1lv?=
 =?utf-8?B?aHdNNWN1RDF1Q0kvSDF5cC8yYVRkZzlsc2lBWnorWEhaSHVVMGdOeTdJTmJU?=
 =?utf-8?B?YWdyVG9KYjhSdmN0VVFNeUJmQWIxWUY2RGEwcWxuc0ZFcDcraFZIb1BCS0RC?=
 =?utf-8?B?ZDJLdFpkVEhZRUdlMFArNTZ2ZjN5K0s0OForaHNDaFMreTYra0FjM0dZU1JT?=
 =?utf-8?B?U2lUYTZ6U0wzUDdNTXp0MDlUaUtBREJldEx5VTBIbkFoVWhCeXpjQjczSXlD?=
 =?utf-8?B?UzV4Q2xuek5Cems4dDlBTG1YR0hpZHYxMk1kSll5b3lBcTZKME9FNno1YjBq?=
 =?utf-8?B?dDhvZUlIck9OTXFxYkJhbnNFK3BBWlZKeFlKTjZNOWx1am51V3pnbTBINW11?=
 =?utf-8?B?RmJxMlMwNnZ4RTJBanpJWFN5MFZTVjN5N05NUWlGaXFzaDZHNnZIQjQzc3Bp?=
 =?utf-8?B?UlNQUHdzSVRucEdqRzdjUDdOUGdQL1FZcCs3ZUdwK0I2d0hsVitJajhiMHhp?=
 =?utf-8?B?YnR5U1dBdUMvc2hGTldINkdVbW5DMHJySHgrWjVJTWg4dktkTkI4YldsekdI?=
 =?utf-8?B?WFdhQTBSZmRNTEJENXlGVUlWdEpHdVlTRnFYUjM1dzZQNWJ6L0RLUzBGRnVl?=
 =?utf-8?B?RnVqdWtLR3UyNWZHVE9FV1Q1ZGhDOGZnUk5nWmRnYzFqOUJmS2w3dnFvNkY0?=
 =?utf-8?B?YlJRb2p4WUxJczRVb2V1TmV5SlpINEgrMTVxM3pYQy9Bcyt1L1Y0d25UMFcx?=
 =?utf-8?B?b0JkSjRQbElESFpENW9TajU5SUxUcG5kMllZU1ZuWkFPMWt1Vm9WNXB3dHgr?=
 =?utf-8?B?T2J5dy94VFZZUm5VQVFFdGlEUHZ1TUhaV2phSW1lN282R29MUWVTSjl0OHJ3?=
 =?utf-8?B?ejhIUWpGMXRZcUJOWW83S0l3U0kzRE5NdDVJcVdoeXZud3A5MkVTY0VKZUll?=
 =?utf-8?B?b21sMG9zWlNVS3ZLaGxhWC9wRG5tL1J2NWNnWHZqWlRIRmdEQ0FvN09BMGd2?=
 =?utf-8?B?OWpBaTNkdVd5Q092d0dETk85NTlERjN0RmoyTjE5R2ZwOFdjVEZGRUk0UzQ3?=
 =?utf-8?B?Y2JWSDVTRE1aR05YaFpmYjBpOUdoWlEremRweEwxZU8yZXJBbk40VHpnVG5y?=
 =?utf-8?B?T0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c4ee78-142d-4518-058d-08ddf762e14e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 09:57:01.9213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WaKfmrT/kwIru7Ciwn9vbodaCUFhyJN1uEoP7ozctgYhgXdQz2/wI73DUN3B2VeDyb9Wr5WpuaqjUH3ueDJk+LiN4EtSYa+IuoCUSqweqKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4579
X-Authority-Analysis: v=2.4 cv=Hrt2G1TS c=1 sm=1 tr=0 ts=68cd28f0 cx=c_pps
 a=ffjDj9JMBHEDizK9ymob3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8
 a=iOLxHxm1XTvAhZRF3f0A:9 a=QEXdDO2ut3YA:10 a=hjFIUX7QysRftYhKoZEA:9
 a=4dVD0rp8TZ3iWe7u:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -DEINYCEYEh-DGdNbIaOe6PqydFUXVIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA5MCBTYWx0ZWRfX1ie0iWnxUgAh
 ef2p3WL/EE+MulTlYOKIa8w2dDz6uJqbZkOv3bLnVN2nGEjn2AiMRBIbEN1YXSqEPDFgnJHKswt
 B28GQllNNYsut4HnVTUAZNiFhr9FCcUpAMNuthUdLytfTdV5pDB+lzYenbXJ9ytTV34f8YiZA6z
 iKT15nYKg+AT9R32sOQ8MUbApro1MbZ6fdG/4ZsCs5qpdi+8f5r8GFe7O+vYcwboFrrP37dP+R7
 dMsRM1PJ0xe8DhdQOsn5rNSZCf00NgaYwC8v+5JPoHInmnKLLc3v5y27ioNLePCzGQZNcf7zb7X
 GYlpIdWVnLzYDzHZzo25TIoU7LBPShGiFXiXt5faLO4EM0KV5Y1MNxa1DU+aOU=
X-Proofpoint-GUID: -DEINYCEYEh-DGdNbIaOe6PqydFUXVIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Sep 2025 09:57:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9407

--------------kbqttXiYSuRH0umh0kbYVR1l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Current podman recipe version is 5.0.1.

The latest stable version of 5.0.x is 5.0.3 which did not contain the 
fix for this issue.

Earliest fixed version is 5.2.4.
So should I do upgrade from 5.0.1 to 5.2.4 (Changelog: 
https://github.com/containers/podman/compare/v5.0.1...v5.2.4)

../Yogita

On 19-09-2025 08:11, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> The same question needs to be answered for all of these CVE
> patches (send a v2).
>
> What release was the fix/commit introduced, and show that
> you've checked to see if there's a release branch equivalent
> for the version we are patching.
>
> Version bumps (within the -stable branch policy of 3rd digit
> or no major updates) are much preferred to patches.
>
> Bruce
>
> In message: [meta-virtualization][scarthgap][PATCH 1/2] podman: fix CVE-2024-9407
> on 16/09/2025 Urade, Yogita via lists.yoctoproject.org wrote:
>
>> From: Yogita Urade<yogita.urade@windriver.com>
>>
>> A vulnerability exists in the bind-propagation option of the
>> Dockerfile RUN --mount instruction. The system does not properly
>> validate the input passed to this option, allowing users to pass
>> arbitrary parameters to the mount instruction. This issue can be
>> exploited to mount sensitive directories from the host into a
>> container during the build process and, in some cases, modify the
>> contents of those mounted files. Even if SELinux is used, this
>> vulnerability can bypass its protection by allowing the source
>> directory to be relabeled to give the container access to host files.
>>
>> Reference:
>> https://nvd.nist.gov/vuln/detail/CVE-2024-9407
>>
>> Upstream patch:
>> https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e
>>
>> Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> ---
>>   .../podman/podman/CVE-2024-9407.patch         | 58 +++++++++++++++++++
>>   recipes-containers/podman/podman_git.bb       |  1 +
>>   2 files changed, 59 insertions(+)
>>   create mode 100644 recipes-containers/podman/podman/CVE-2024-9407.patch
>>
>> diff --git a/recipes-containers/podman/podman/CVE-2024-9407.patch b/recipes-containers/podman/podman/CVE-2024-9407.patch
>> new file mode 100644
>> index 00000000..397cd362
>> --- /dev/null
>> +++ b/recipes-containers/podman/podman/CVE-2024-9407.patch
>> @@ -0,0 +1,58 @@
>> +From 2b2c7a89586d0e495b6bc5cc5687bab79162118e Mon Sep 17 00:00:00 2001
>> +From: Matt Heon<mheon@redhat.com>
>> +Date: Tue, 1 Oct 2024 12:38:45 -0400
>> +Subject: [PATCH] Validate the bind-propagation option to `--mount`
>> +
>> +Similar to github.com/containers/buildah/pull/5761 but not
>> +security critical as Podman does not have an expectation that
>> +mounts are scoped (the ability to write a --mount option is
>> +already the ability to mount arbitrary content into the container
>> +so sneaking arbitrary options into the mount doesn't have
>> +security implications). Still, bad practice to let users inject
>> +anything into the mount command line so let's not do that.
>> +
>> +Signed-off-by: Matt Heon<mheon@redhat.com>
>> +
>> +CVE: CVE-2024-9407
>> +Upstream-Status: Backport [https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e]
>> +
>> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> +---
>> + pkg/specgenutil/volumes.go  | 6 ++++++
>> + test/e2e/run_volume_test.go | 4 ++++
>> + 2 files changed, 10 insertions(+)
>> +
>> +diff --git a/pkg/specgenutil/volumes.go b/pkg/specgenutil/volumes.go
>> +index c481867163..5618b2d342 100644
>> +--- a/pkg/specgenutil/volumes.go
>> ++++ b/pkg/specgenutil/volumes.go
>> +@@ -272,6 +272,12 @@ func parseMountOptions(mountType string, args []string) (*spec.Mount, error) {
>> +                     if !hasValue {
>> +                             return nil, fmt.Errorf("%v: %w", name, errOptionArg)
>> +                     }
>> ++                        switch value {
>> ++                    case "shared", "rshared", "private", "rprivate", "slave", "rslave", "unbindable", "runbindable":
>> ++                            // Do nothing, sane value
>> ++                    default:
>> ++                            return nil, fmt.Errorf("invalid value %q", arg)
>> ++                    }
>> +                     mnt.Options = append(mnt.Options, value)
>> +             case "consistency":
>> +                     // Often used on MACs and mistakenly on Linux platforms.
>> +diff --git a/test/e2e/run_volume_test.go b/test/e2e/run_volume_test.go
>> +index 4e777d62ef..5b256c9255 100644
>> +--- a/test/e2e/run_volume_test.go
>> ++++ b/test/e2e/run_volume_test.go
>> +@@ -112,6 +112,10 @@ var _ = Describe("Podman run with volumes", func() {
>> +             session.WaitWithDefaultTimeout()
>> +             Expect(session).To(ExitWithError())
>> +
>> ++            session = podmanTest.Podman([]string{"run", "--rm", "--mount", "type=bind,src=/tmp,target=/tmp,bind-propagation=fake", ALPINE, "true"})
>> ++            session.WaitWithDefaultTimeout()
>> ++            Expect(session).To(ExitWithError())
>> ++
>> +             session = podmanTest.Podman([]string{"run", "--rm", "--mount", "type=tmpfs,target=/etc/ssl,notmpcopyup", ALPINE, "ls", "/etc/ssl"})
>> +             session.WaitWithDefaultTimeout()
>> +             Expect(session).Should(ExitCleanly())
>> +--
>> +2.40.0
>> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
>> index ef9798f0..4086298f 100644
>> --- a/recipes-containers/podman/podman_git.bb
>> +++ b/recipes-containers/podman/podman_git.bb
>> @@ -24,6 +24,7 @@ SRC_URI = " \
>>       file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
>>       file://CVE-2025-6032.patch;patchdir=src/import \
>>       file://CVE-2024-9341.patch;patchdir=src/import \
>> +file://CVE-2024-9407.patch;patchdir=src/import \
>>   "
>>
>>   LICENSE = "Apache-2.0"
>> --
>> 2.40.0
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9394):https://lists.yoctoproject.org/g/meta-virtualization/message/9394
>> Mute This Topic:https://lists.yoctoproject.org/mt/115268579/1050810
>> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------kbqttXiYSuRH0umh0kbYVR1l
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html data-lt-installed="true"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p>Current podman recipe version is 5.0.1.</p>
    <p>The latest stable version of 5.0.x is 5.0.3 which did not contain
      the fix for this issue.<br>
    </p>
    <p>Earliest fixed version is 5.2.4.<br>
      So should I do upgrade from 5.0.1 to 5.2.4 (Changelog:
      <a class="moz-txt-link-freetext" href="https://github.com/containers/podman/compare/v5.0.1...v5.2.4">https://github.com/containers/podman/compare/v5.0.1...v5.2.4</a>)</p>
    <p>../Yogita</p>
    <div class="moz-cite-prefix">On 19-09-2025 08:11, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aMzCwxyq0uVpLCz0@gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

The same question needs to be answered for all of these CVE
patches (send a v2).

What release was the fix/commit introduced, and show that
you've checked to see if there's a release branch equivalent
for the version we are patching.

Version bumps (within the -stable branch policy of 3rd digit
or no major updates) are much preferred to patches.

Bruce

In message: [meta-virtualization][scarthgap][PATCH 1/2] podman: fix CVE-2024-9407
on 16/09/2025 Urade, Yogita via lists.yoctoproject.org wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>

A vulnerability exists in the bind-propagation option of the
Dockerfile RUN --mount instruction. The system does not properly
validate the input passed to this option, allowing users to pass
arbitrary parameters to the mount instruction. This issue can be
exploited to mount sensitive directories from the host into a
container during the build process and, in some cases, modify the
contents of those mounted files. Even if SELinux is used, this
vulnerability can bypass its protection by allowing the source
directory to be relabeled to give the container access to host files.

Reference:
<a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2024-9407">https://nvd.nist.gov/vuln/detail/CVE-2024-9407</a>

Upstream patch:
<a class="moz-txt-link-freetext" href="https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e">https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e</a>

Signed-off-by: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
---
 .../podman/podman/CVE-2024-9407.patch         | 58 +++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 recipes-containers/podman/podman/CVE-2024-9407.patch

diff --git a/recipes-containers/podman/podman/CVE-2024-9407.patch b/recipes-containers/podman/podman/CVE-2024-9407.patch
new file mode 100644
index 00000000..397cd362
--- /dev/null
+++ b/recipes-containers/podman/podman/CVE-2024-9407.patch
@@ -0,0 +1,58 @@
+From 2b2c7a89586d0e495b6bc5cc5687bab79162118e Mon Sep 17 00:00:00 2001
+From: Matt Heon <a class="moz-txt-link-rfc2396E" href="mailto:mheon@redhat.com">&lt;mheon@redhat.com&gt;</a>
+Date: Tue, 1 Oct 2024 12:38:45 -0400
+Subject: [PATCH] Validate the bind-propagation option to `--mount`
+
+Similar to github.com/containers/buildah/pull/5761 but not
+security critical as Podman does not have an expectation that
+mounts are scoped (the ability to write a --mount option is
+already the ability to mount arbitrary content into the container
+so sneaking arbitrary options into the mount doesn't have
+security implications). Still, bad practice to let users inject
+anything into the mount command line so let's not do that.
+
+Signed-off-by: Matt Heon <a class="moz-txt-link-rfc2396E" href="mailto:mheon@redhat.com">&lt;mheon@redhat.com&gt;</a>
+
+CVE: CVE-2024-9407
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e">https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e</a>]
+
+Signed-off-by: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ pkg/specgenutil/volumes.go  | 6 ++++++
+ test/e2e/run_volume_test.go | 4 ++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/pkg/specgenutil/volumes.go b/pkg/specgenutil/volumes.go
+index c481867163..5618b2d342 100644
+--- a/pkg/specgenutil/volumes.go
++++ b/pkg/specgenutil/volumes.go
+@@ -272,6 +272,12 @@ func parseMountOptions(mountType string, args []string) (*spec.Mount, error) {
+                     if !hasValue {
+                             return nil, fmt.Errorf(&quot;%v: %w&quot;, name, errOptionArg)
+                     }
++                        switch value {
++                    case &quot;shared&quot;, &quot;rshared&quot;, &quot;private&quot;, &quot;rprivate&quot;, &quot;slave&quot;, &quot;rslave&quot;, &quot;unbindable&quot;, &quot;runbindable&quot;:
++                            // Do nothing, sane value
++                    default:
++                            return nil, fmt.Errorf(&quot;invalid value %q&quot;, arg)
++                    }
+                     mnt.Options = append(mnt.Options, value)
+             case &quot;consistency&quot;:
+                     // Often used on MACs and mistakenly on Linux platforms.
+diff --git a/test/e2e/run_volume_test.go b/test/e2e/run_volume_test.go
+index 4e777d62ef..5b256c9255 100644
+--- a/test/e2e/run_volume_test.go
++++ b/test/e2e/run_volume_test.go
+@@ -112,6 +112,10 @@ var _ = Describe(&quot;Podman run with volumes&quot;, func() {
+             session.WaitWithDefaultTimeout()
+             Expect(session).To(ExitWithError())
+
++            session = podmanTest.Podman([]string{&quot;run&quot;, &quot;--rm&quot;, &quot;--mount&quot;, &quot;type=bind,src=/tmp,target=/tmp,bind-propagation=fake&quot;, ALPINE, &quot;true&quot;})
++            session.WaitWithDefaultTimeout()
++            Expect(session).To(ExitWithError())
++
+             session = podmanTest.Podman([]string{&quot;run&quot;, &quot;--rm&quot;, &quot;--mount&quot;, &quot;type=tmpfs,target=/etc/ssl,notmpcopyup&quot;, ALPINE, &quot;ls&quot;, &quot;/etc/ssl&quot;})
+             session.WaitWithDefaultTimeout()
+             Expect(session).Should(ExitCleanly())
+--
+2.40.0
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index ef9798f0..4086298f 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -24,6 +24,7 @@ SRC_URI = &quot; \
     <a class="moz-txt-link-freetext" href="file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage">file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage</a> \
     <a class="moz-txt-link-freetext" href="file://CVE-2025-6032.patch;patchdir=src/import">file://CVE-2025-6032.patch;patchdir=src/import</a> \
     <a class="moz-txt-link-freetext" href="file://CVE-2024-9341.patch;patchdir=src/import">file://CVE-2024-9341.patch;patchdir=src/import</a> \
+    <a class="moz-txt-link-freetext" href="file://CVE-2024-9407.patch;patchdir=src/import">file://CVE-2024-9407.patch;patchdir=src/import</a> \
 &quot;

 LICENSE = &quot;Apache-2.0&quot;
--
2.40.0

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#9394): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/9394">https://lists.yoctoproject.org/g/meta-virtualization/message/9394</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/115268579/1050810">https://lists.yoctoproject.org/mt/115268579/1050810</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------kbqttXiYSuRH0umh0kbYVR1l--

