Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F06ACFD31C
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 06:49:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10639.1763966989760463376
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Nov 2025 22:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=iDQwoQqv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3423f9c1af=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO4xhY51085374;
	Sun, 23 Nov 2025 22:49:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=lxNeH4H0BKiPEVoEGFctWm
	FGf0hWfG4xbF/Jc/wNCuA=; b=iDQwoQqv4rKXjfBiT6bKtF1jzJOD0f1gPpdxlA
	9kWecVBUELnJHaRDFU6k0E3k9CrAGq0JAweaXTvke/Y5p9w7itjoudPF9TvidA1k
	8EErbD8m3HYDpelW2CLThIWZiUPZV02SSYPMJGjmlOQcvWFgh2L47/dzZESAIvtN
	iJoVcToEUh6uh6NNOpCs+GjBRjD+PqYNYqE3T4Sy8Bzkmj979tYIFQVyOs9YruwH
	kIGl739DM4S66vqnqhCqO6DsPJ0So9BNSbAv9scFJ/AVBVPsC3PwBXSIuptzj4Y+
	1Pq5EmneIN3l/y0kbJcAifmbx28InghYfqcopd7pmPiDnCLQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak9b59dhw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 23 Nov 2025 22:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbGSoPlfPSHrl8MD+46zxPxPt3DCCax2lU1Y44IxFz/Xpxp/JEg9j+WPuGzYolTjHQGwsm+6mDm3iRKUiEdx2h216vNbLQBKnu8eKW+bI9sKn4jNjL90pp7fjRBjrjBMqXhVxoQkwbul0iEH0iGlePv5C5oX8DqL641cn4BBJ5LUXGMOI7dnm1ZVzJa2AT1lEgvcilZR4ZEKm+SKA/505v1YLbfPSctBdGZQv7uk/pnzAAMB41Qnbzzuyvz7scUkiYZSbk0ovbozjFyJ6y5/MKCo8jSTQp4sO7GLDOdrlfPKz5We+0ULQ3a7Zp5IF6Lpsy+c3Kzs54i422HgMbjBfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxNeH4H0BKiPEVoEGFctWmFGf0hWfG4xbF/Jc/wNCuA=;
 b=H4Bql47OtSeiUBZpPEzRFyZggtRwfEhJn9/igvAdN6dqpdARq+4dK3fxu673xMZMtnOaK37wC2wAurtoZ9MsnnYxfjUlcNDstUB0Vww+wI0M40xvuwBIUtoVZlcBnCYuowy3TZ8+WkvyEbUc8MluF0smvyudYZg+XABci2+5GX2P13EJ+XpOd/ewl9JDbL+XhFP5Dnc3Pmse4jtXuzs2ehIyJRZ2mZEqmMqaHBIbvIpIly1EpZS8k9Jl2fPUjHQdtRTQtmQcj4LW8K/IJukQ24lfW8q07kRDnfw8+YJ/PkdT9jGF8/Mw3ORzJVg04L7rB1zda9c68HqpAck7ahGHbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB4904.namprd11.prod.outlook.com (2603:10b6:510:40::10)
 by BL4PR11MB8872.namprd11.prod.outlook.com (2603:10b6:208:5a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 06:49:44 +0000
Received: from PH0PR11MB4904.namprd11.prod.outlook.com
 ([fe80::c7ea:ab4f:35f9:9b07]) by PH0PR11MB4904.namprd11.prod.outlook.com
 ([fe80::c7ea:ab4f:35f9:9b07%2]) with mapi id 15.20.9343.011; Mon, 24 Nov 2025
 06:49:43 +0000
Content-Type: multipart/alternative;
 boundary="------------EtckE0TwOC42jwNLdi7JoWR4"
Message-ID: <17556548-2fff-4744-851c-3103f24bf1c3@windriver.com>
Date: Mon, 24 Nov 2025 14:49:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization] [PATCH] libvirt: rdepends on iproute2-tc
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20251123164444.3343229-1-kai.kang@windriver.com>
 <CADkTA4Px0_OGgvGk+kmnHMxf57z=sHrrYjYs0vaQ07eOt7YFWg@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CADkTA4Px0_OGgvGk+kmnHMxf57z=sHrrYjYs0vaQ07eOt7YFWg@mail.gmail.com>
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 PH0PR11MB4904.namprd11.prod.outlook.com (2603:10b6:510:40::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4904:EE_|BL4PR11MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: d012e71a-e764-41f8-6892-08de2b25a649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|42112799006|376014|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bFBFdzRhaHhGdnlxRXplNkkwNkdNVndka0pkU0J0Q1FDd3VHZDFlZjVDbUtP?=
 =?utf-8?B?QjZQNzVheExhblBaaDgxcjg4OGErTlhzSXRCemhrUTVXV3RTNHV4c2U1N1dS?=
 =?utf-8?B?N2VZWUJLZVFUUzV5ZHlhWFFDY05iK09hY21tdW00RGcrVExKai9YQi9Qa0Zk?=
 =?utf-8?B?QVpmRkVkdHVXY1QrQzhudTRFL2tXRGFoRnhxb0FvemJoanFlT2t3MjNxMEZn?=
 =?utf-8?B?dzRxWXlGWU5VNGNuc1BHYVhvdzM5aUFmbndWbEUxN2JYTHZMSjJCRHNsaTNY?=
 =?utf-8?B?bFFodmdML1dQQkhoU25JUmNnQzdPSVpNU2E3aFFiZTNIcGtnQkw2ZklSb2d0?=
 =?utf-8?B?b0YyekQxQk1qMUxEZjY3WHdXVWRQTkp0OHBNTXRyNSs0MHVXWWxvKzZnMW9M?=
 =?utf-8?B?bW4rZUNKNm5pdUVoSzlHQkR2MDNBVzkzSVZIWlkrdGZpSVErRHNtY0hkU1VI?=
 =?utf-8?B?Snd5akxWcG9NZUFDdWdjR0tNOHlPNmpacGN6eWl5WHZwTXJ3dEtBY2NFYkNH?=
 =?utf-8?B?bUFHYmRrMXMyNHA0Ny9KVTlvL2ZNZkZlL1V2WitRMURHVWRhb3h0VlBVVlZk?=
 =?utf-8?B?VVdDeE1KRk53WkM3YWo4TWYrbkVQRDJhWk1QcWhXVGNEbHo4VXBpdXhhTlZP?=
 =?utf-8?B?dTFrYkJ5MXVVbkUrdk41aWh2akEweFQ4N205ejh1ZjhSVWFTSUNhcFRDSFhl?=
 =?utf-8?B?djZyQTJvamxNYUl5WVRoYXYveTQ0c01MUFJvOFNrclB1SDZHTG0zSjNxMjN3?=
 =?utf-8?B?Zm5FTEY3alQ5YnJBcGIvTmk3L0toMzNSQUtGZ0FYTTk1Wk1PQkV4dkJuN3ZB?=
 =?utf-8?B?emlJejBhZ3FRNUo5TGdOTExYOVA2QjZJUHplaFpVbGVUQ3lnUWN2ZExoWEQr?=
 =?utf-8?B?a0FybmNUcHFRNzJTVW92a1BYMEVFY2dma3FBblF2UTYxK3U2d2loMWhkYm1x?=
 =?utf-8?B?ck9CWVZBYXFjdGx0bm9qbDIzd0doSHp0Rmg4aXJJN2lWYld1RndXdE5GYjhG?=
 =?utf-8?B?ZnBPN2crNUthK3JHd2ZJaUlVQndKbUJKSmE2c1dlUHBkNnFXVzhBYWVTdXNu?=
 =?utf-8?B?aUk3MWxnMzdyODNOT2s3WUlWOHNzNTRCWW1aWGdNMXlPNnhZRXpWVHQ5SWN3?=
 =?utf-8?B?bGJjVzhPRXRHQi9KRisxbVVoeDJPOUhNUzU3UjZycXA0ZFlYU0ROc1Q1Wk1C?=
 =?utf-8?B?eTlldUQ2cGNuV3g0QUJwWHg1Z2xvL0JRa0hENzFURENDOVVPWms2K1RuUEho?=
 =?utf-8?B?YWFtaXEvLzJJb1VJTzdsRE9GUmNwcmpOeHBxZk0yTWdJMVI2YlpsWTNvMjJR?=
 =?utf-8?B?UVIrUXZFdU44WnNhY0FEUWVEODNqdkZrYXMwSHpjWW95UUdXUXBzeTJ3UFdk?=
 =?utf-8?B?d0xCQUttT3p6YXdMTUFFS0ZHaGxxTzJVUkUwTjgrbWM1T1ZxUngyT0dCY3hh?=
 =?utf-8?B?OEROUmdsMlJKaTVxTWplUlg3TW9lZ2lrakR3aFVrVTkrQUxQRjEyNDR5enY1?=
 =?utf-8?B?ZXRZcmh4MVlETXRCTDhUeFNNWmVURWRFdHVzUlNGMkxlbWkyVldiWWNmT2lz?=
 =?utf-8?B?Q3VtZzFOcE0xaGNJZmZuN1J6MnJ2eVQzYnJ5UDZ0b0lyck9jUnJVb2xnSkt3?=
 =?utf-8?B?Yi8xR09VWjlnZXRMbjBLQWo3SUpFSlBFLytlYkE5a1AwbTd3V1R0Uno0SVJ5?=
 =?utf-8?B?Q2l0ZXFZQjBnOGdzSlVtTkZ0UXB3OGFyMHJQN0xSZndiZ1Q5UHJVQ1dHT2Qv?=
 =?utf-8?B?dnpLYXoxU2RGTFQvbmorQ0xMeUlBWHZJRjhiVVNnOVJFTFJ3WnZaeXd1bWFp?=
 =?utf-8?B?Ynl4VXFubDZuUTAvampiT0xsNFJGenBvQURSaUZqSDV3WUZmMkdTbVlleTR3?=
 =?utf-8?B?TU81cjNLWllBNHhlOHhpT082NVc3V000U1ZQWFpJMjVqUXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4904.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(42112799006)(376014)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?akErQTZoK1dtdUlQdkFQaE5nVW9MSDk5WGJTL3ZsTmIrQkZjN2hsNjZuVHEy?=
 =?utf-8?B?cDZaRS85MnB1S1dRcWgzZ0p5VUozdkNwN2ZlK0ZGK0xaU1BzWVBCbSt6NEd6?=
 =?utf-8?B?YjZBY3BCM0xNNVJnODlXMVdGNEVzaDJ5ZElCcGR5d2JPbXRPYWJLYlpPdFFk?=
 =?utf-8?B?N1NTenVQbkZDYWNUTDBWOGlsWUZYV1RJcWZhT01LSUpiSjVDRkphcHhQb2tX?=
 =?utf-8?B?WXgvUXlWWTc1L3BaV091SFUxNC9rREo4cS9jbFBoTlg3S0tLemVjTGJkMGdn?=
 =?utf-8?B?QkI3M3NlQUd1R1JyWndOQ3VIdG5ZSCtmMWdXdWtqTEJka2hUM1VIeElEZjh0?=
 =?utf-8?B?czNBYjRBQ1RPaFY1K2FZNzJZclBGcHZVbUhjbVJDdm53eHBEZWIvbWtUQSs3?=
 =?utf-8?B?YmZObXYwZVZjcGJyWlBqSS9uYnJMK1J6TUJicUEzRFZzT3h3YU9YLzJZdUo3?=
 =?utf-8?B?MU1kSzBhWTBTSURzSkxvSitlNldTd0tRUDNwV2l6cDJaRVh4VHVZZ3d3TTBz?=
 =?utf-8?B?M0VYOXV1WlJ1NmtFK3BmREZtdGo1ZE9zYVZ3ZHd2dkpjNTZCY0xrQ011UVB5?=
 =?utf-8?B?UW81UG5wZ1gxQVZDVVdSY2FUejhvanJLT3BDWmhhdzNxTDB6RTRENGMxWGZR?=
 =?utf-8?B?aXdybjREak1ZaGp0QW96ZUI2MjZQN25HeWs1T0JNeGpEd05NcUxQQjQrdnU3?=
 =?utf-8?B?SVppNEJPaUgxWlptM1I0ekdRVGNVQXZFQ0lnb2VLWVZvN1pyTlFISDU5SU4r?=
 =?utf-8?B?RGlMTlBtbUtrRktNZUdTYm1tTEJLNU1QdWxaZDMwTWwwYXpjOVBxaVVZUHBJ?=
 =?utf-8?B?MmVHUWRXU0krOGJnbVQ5VjlGS0p0Qk1IblNYVWJCZ1JFMldMc0dnSU93NVFm?=
 =?utf-8?B?dWM0RS9NK0RjWHZnNktFUjN6V2hVWHcvMDhuV2IwZlJtWHo5dytNT2JWR20z?=
 =?utf-8?B?TjB1TTJiaXZZZEFpMlJqLzVPdENrRlJ5TlBhWVg2ZzBmcWI1azVrS3F3WXNG?=
 =?utf-8?B?K0Nsam9OZzVFQW9obUlvS1I2RWkzd3VFdzNGQTNuKy94dWZTUm1OdVVvL2Fr?=
 =?utf-8?B?RnVKeDBNSVlESUNmZGtBRUdleGo2NFBnOTZSb2hvdHpOSUMrUDlWbWhIazh5?=
 =?utf-8?B?VU50MzVhYUc5ZGFua2VrN0VGbm1TQlBxeFhaT3M0L3dzK1R0WCtITE9iMUZN?=
 =?utf-8?B?WE5mOEFkV3VzTDlIN3QvVjdyUUdubmQ2U2xqaVZxZk9PVjRWYU5mTUxkNUFv?=
 =?utf-8?B?VzVqa25Fc3laemxLRkhPcWROSUZyTldIMkhGMURuODM3eGhUNnJ4aTVsSTRk?=
 =?utf-8?B?cjFWekFib3A2ZGNNSDIwZDloMVhGYTVaK3ZRU2ZCWGx6Mk8rOU4zUzBxMUN4?=
 =?utf-8?B?ZkNYTzA3UkpFSVRkNVI5OUh1cUhQYm5NQWlieWlad3c2TGpQZUZHSjI4cWx2?=
 =?utf-8?B?akloeUUwcmxiRTF3U0ZjeFo0aEJzSG4xaUpJQWRTdkl2dmZYOEh4am5pOXMz?=
 =?utf-8?B?bmFXakJvVTNSMmhRaFB0a0tzNnlrOWtiRTVkaXZuT0FTNFpzZmVyUzYxVStY?=
 =?utf-8?B?UHgybVFzaVk2Zys3LzJOZGJWUlJZWnBhaC9wUG9rdFkxYlpyYUZJVWdVZzFB?=
 =?utf-8?B?clNJQWtMdDlEeXErY1F0S1hZM0pHb0cxWjJadGcwVWxPNjJPMG5TV0NSTnRU?=
 =?utf-8?B?WmVzYms1VjRab1pkYVpNTzlERCt5ZWhnSVpyQTBSTUVCaVBMY0owNXQ3ZzRa?=
 =?utf-8?B?bXVScEo2YzVrL2R0YUoyQUJmTm1pdkhmNTB6cytTU1Vod2czS3E0M25kNlBV?=
 =?utf-8?B?THQxS2dDbGRGVE5ib1BVRGxSUjRoSGViU002bEZMclBNTnlRWDNUSTJlb3A1?=
 =?utf-8?B?T2szU3Q2Q2VKM1RWZUM5dFpyaHdkMVA2TjlzKzcrcko3TXQyQm85SnhveXI1?=
 =?utf-8?B?RTcxb3VDY21Kc2JtUTVySTFwWmV5eExnRDdvNWM5cnFUYXlZbm5rbzFGc08x?=
 =?utf-8?B?SCtTVTI4UE05T0QrMHgxeXpSWkg0Uk5OTk84eVdZcUVtUnl4YXJ6a01GMmR2?=
 =?utf-8?B?TkI1OGdOa0Q0cjczYkY4YWFOUVBzbFlFZy9RUkVtcHh0ejV0QUdFMC9XMjRG?=
 =?utf-8?Q?d+z7KAGycekmB7sYSCW/nKITN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d012e71a-e764-41f8-6892-08de2b25a649
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 06:49:43.8162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqKKDkYa7tcGOpQ3zJ6uE33p3+p5ZWi9tdNVC96DhwdLNc/H/4t1C0ht1/+Ju6RdBOmDOtbZ6hrp/Uaiqectnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8872
X-Authority-Analysis: v=2.4 cv=fozRpV4f c=1 sm=1 tr=0 ts=6924000b cx=c_pps
 a=qH/fS2hzlQnCJHG7LpbWtA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=5zBmwohVAAAA:8 a=SqMvC5kiAAAA:8 a=y6gElkY9AAAA:8
 a=zsvJEiUzAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=3S3OKKhcO8uRp9j_LG0A:9
 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tfOdkUcqPFHI9vxvnD0A:9 a=fFTcjDdn_dEMScX5:21 a=_W_S_7VecoQA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=vWgD8zG0H4_5ii-OlP9Z:22 a=_o8VnCo6Hb5Oqlm6Mk7M:22
 a=vxsqSRK3Zg_sPkopv73A:22 a=fIPKabD2yXk_LQm3uK1F:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA1OSBTYWx0ZWRfX8+tSio29mblH
 XfoD6z3DEMWi2EFnTqVf68a2PlMy22TB/PhpPI6VmL85aNM353TO/XkhJK/kyqnBECogBDMEas1
 i1UH6etj4N1I2MlXPrVX1saHHJYcJXfZQ4Y5pScZ/y9y5GIQdM3a+QyZoBYnrekqD291oOtt9IZ
 VXwSh65BuJOGijYhOt2VNjxWkRhSJnLLlpZfBuIltgmgOL+AvZve5F/rzg2clz0iqw0qdCwZ+M7
 9FT/+y7JwOTCyIpKoYb/iUUb1/9UjSDf/NcYWREbtiZ6ngDxULmEYunJ99EZZ3+CDVBArC4QPtE
 qOD5RNG7pQwuWSsD2Nr3WhYHKYLIBdDg56czDpbp6lbCIwzXA2hp/u4ZlacaRmM0LO26ozdwfp+
 34H+QK12jGGhvRB1qGOpt4zOUxqvyw==
X-Proofpoint-GUID: b3MjOXMNPMt1Y4xXEQ-5Slu7smcY5r8g
X-Proofpoint-ORIG-GUID: b3MjOXMNPMt1Y4xXEQ-5Slu7smcY5r8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240059
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Nov 2025 06:49:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9456

--------------EtckE0TwOC42jwNLdi7JoWR4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AO4xhY51085374

On 11/24/25 08:03, Bruce Ashfield wrote:
>
>
> On Sun, Nov 23, 2025 at 11:44=E2=80=AFAM Kai Kang via lists.yoctoprojec=
t.org=20
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8=
EvQ!f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt=
85e_jnLsZig3zh0Z-2YtQ$>=20
> <kai.kang=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com>
>
>     When nftables exists, libvirt uses it as default firewall backend.
>     Then
>     it requires command `tc` to start default network interface:
>
>     libvirtd[653]: Cannot find 'tc' in path: No such file or directory
>
>
> Which implies that the dependency should be conditional.

OK. I'll add a package config to choose a firewall backend, either=20
iptables or nftables.


>
>
>     And tweak formats at same time, including replace tab with spaces f=
or
>     indent and remove trailing whitespaces.
>
>
> When you write a commit message like that, you can probably guess
> what I will say.
>
> Keep the whitespace patch separate, and chances are, that I'd rather
> just leave it as-is, since it makes git blame annoying to diagnose
> issues.

Got it.

Kai

>
> Bruce
>
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com>
>     ---
>     =C2=A0recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_=
jnLsZig3ziV9EnsEQ$>
>     | 12 ++++++------
>     =C2=A01 file changed, 6 insertions(+), 6 deletions(-)
>
>     diff --git a/recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_=
jnLsZig3ziV9EnsEQ$>
>     b/recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_=
jnLsZig3ziV9EnsEQ$>
>     index 681ceade..552c5ffe 100644
>     --- a/recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_=
jnLsZig3ziV9EnsEQ$>
>     +++ b/recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_=
jnLsZig3ziV9EnsEQ$>
>     @@ -1,4 +1,4 @@
>     -DESCRIPTION =3D "A toolkit to interact with the virtualization
>     capabilities of recent versions of Linux."
>     +DESCRIPTION =3D "A toolkit to interact with the virtualization
>     capabilities of recent versions of Linux."
>     =C2=A0HOMEPAGE =3D "http://libvirt.org
>     <https://urldefense.com/v3/__http://libvirt.org__;!!AjveYdw8EvQ!f3d=
48tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnL=
sZig3zjQ5gXpMw$>"
>     =C2=A0LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
>     =C2=A0LIC_FILES_CHKSUM =3D
>     "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>     @@ -6,16 +6,16 @@ LIC_FILES_CHKSUM =3D
>     "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>     =C2=A0SECTION =3D "console/tools"
>
>     =C2=A0DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 avahi parted cu=
rl
>     libpcap util-linux e2fsprogs pm-utils \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iptables dnsmasq readline libta=
sn1 libxslt-native acl
>     libdevmapper libtirpc \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iptables dnsmasq readline=
 libtasn1 libxslt-native acl
>     libdevmapper libtirpc \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-docutils-native \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains('PACKAGECO=
NFIG', 'polkit',
>     'shadow-native', '', d)} \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains('PACKAGECO=
NFIG', 'gnutls',
>     'gnutls-native', '', d)}"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains('PAC=
KAGECONFIG', 'polkit',
>     'shadow-native', '', d)} \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains('PAC=
KAGECONFIG', 'gnutls',
>     'gnutls-native', '', d)}"
>
>     =C2=A0# libvirt-guests.sh
>     <https://urldefense.com/v3/__http://libvirt-guests.sh__;!!AjveYdw8E=
vQ!f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt8=
5e_jnLsZig3zi9Bj8jjQ$>
>     needs gettext.sh
>     <https://urldefense.com/v3/__http://gettext.sh__;!!AjveYdw8EvQ!f3d4=
8tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnLs=
Zig3zjgzVXQfw$>
>     =C2=A0#
>     =C2=A0RDEPENDS:${PN} =3D "gettext-runtime"
>
>     -RDEPENDS:libvirt-libvirtd +=3D "bridge-utils iptables pm-utils
>     dnsmasq netcat-openbsd ebtables"
>     +RDEPENDS:libvirt-libvirtd +=3D "bridge-utils iptables pm-utils
>     dnsmasq netcat-openbsd ebtables iproute2-tc"
>     =C2=A0RDEPENDS:libvirt-libvirtd:append:x86-64 =3D " dmidecode"
>     =C2=A0RDEPENDS:libvirt-libvirtd:append:x86 =3D " dmidecode"
>     =C2=A0RDEPENDS:libvirt-libvirtd:append:arm =3D " dmidecode"
>     @@ -232,7 +232,7 @@ do_install:append() {
>     =C2=A0${D}/${systemd_system_unitdir}/libvirtd.service
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0# The /run/libvirt directories created =
by the Makefile are
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0# The /run/libvirt directories created =
by the Makefile are
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 # wiped out in volatile, we need to cre=
ate these at boot.
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}/run
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/default/vo=
latiles
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9454):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9454
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/9454__;!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_186jCRR7-tIH=
rVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnLsZig3zidb-dXaQ$>
>     Mute This Topic:
>     https://lists.yoctoproject.org/mt/116438591/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1164=
38591/1050810__;!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-=
7RnRL82gWps-Smai_Y-dQgyizt85e_jnLsZig3zgCpKyWSQ$>
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqWu=
ue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnLsZig3zghpinbUQ$>
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

--=20
Kai Kang
Wind River Linux

--------------EtckE0TwOC42jwNLdi7JoWR4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AO4xhY51085374

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 11/24/25 08:03, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4Px0_OGgvGk+kmnHMxf57z=3D=
sHrrYjYs0vaQ07eOt7YFWg@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div class=3D"gmail_default" style=3D"font-size:small"><br>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 23, 2025 at
            11:44=E2=80=AFAM Kai Kang via <a href=3D"https://urldefense.c=
om/v3/__http://lists.yoctoproject.org__;!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_18=
6jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnLsZig3zh0Z-2YtQ$"=
 moz-do-not-send=3D"true">lists.yoctoproject.org</a>
            &lt;kai.kang=3D<a href=3D"mailto:windriver.com@lists.yoctopro=
ject.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">windri=
ver.com@lists.yoctoproject.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
            Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=
=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">kai.=
kang@windriver.com</a>&gt;<br>
            <br>
            When nftables exists, libvirt uses it as default firewall
            backend. Then<br>
            it requires command `tc` to start default network interface:<=
br>
            <br>
            libvirtd[653]: Cannot find 'tc' in path: No such file or
            directory<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">Which
              implies that the dependency should be conditional.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>OK. I'll add a package config to choose a firewall backend,
      either iptables or nftables.</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4Px0_OGgvGk+kmnHMxf57z=3D=
sHrrYjYs0vaQ07eOt7YFWg@mail.gmail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote gmail_quote_container">
          <div><br>
          </div>
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            And tweak formats at same time, including replace tab with
            spaces for<br>
            indent and remove trailing whitespaces.<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">When y=
ou
              write a commit message like that, you can probably guess</d=
iv>
            <div class=3D"gmail_default" style=3D"font-size:small">what I
              will say.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">Keep t=
he
              whitespace patch separate, and chances are, that I'd
              rather</div>
            <div class=3D"gmail_default" style=3D"font-size:small">just
              leave it as-is, since it makes git blame annoying to
              diagnose</div>
            <div class=3D"gmail_default" style=3D"font-size:small">issues=
.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Got it.</p>
    <p>Kai</p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4Px0_OGgvGk+kmnHMxf57z=3D=
sHrrYjYs0vaQ07eOt7YFWg@mail.gmail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote gmail_quote_container">
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div>
            <br>
          </div>
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windri=
ver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">kai.kang@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;recipes-extended/libvirt/<a href=3D"https://urldefense.=
com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_186jCRR7-=
tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnLsZig3ziV9EnsEQ$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt_git.bb</a=
>
            | 12 ++++++------<br>
            &nbsp;1 file changed, 6 insertions(+), 6 deletions(-)<br>
            <br>
            diff --git a/recipes-extended/libvirt/<a href=3D"https://urld=
efense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_18=
6jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnLsZig3ziV9EnsEQ$"=
 rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt_gi=
t.bb</a>
            b/recipes-extended/libvirt/<a href=3D"https://urldefense.com/=
v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_186jCRR7-tIHr=
VCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnLsZig3ziV9EnsEQ$" rel=3D"nor=
eferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt_git.bb</a><br=
>
            index 681ceade..552c5ffe 100644<br>
            --- a/recipes-extended/libvirt/<a href=3D"https://urldefense.=
com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_186jCRR7-=
tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnLsZig3ziV9EnsEQ$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt_git.bb</a=
><br>
            +++ b/recipes-extended/libvirt/<a href=3D"https://urldefense.=
com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_186jCRR7-=
tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnLsZig3ziV9EnsEQ$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt_git.bb</a=
><br>
            @@ -1,4 +1,4 @@<br>
            -DESCRIPTION =3D &quot;A toolkit to interact with the
            virtualization capabilities of recent versions of Linux.&quot=
; <br>
            +DESCRIPTION =3D &quot;A toolkit to interact with the
            virtualization capabilities of recent versions of Linux.&quot=
;<br>
            &nbsp;HOMEPAGE =3D &quot;<a href=3D"https://urldefense.com/v3=
/__http://libvirt.org__;!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqW=
uue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnLsZig3zjQ5gXpMw$" rel=3D"noreferr=
er" target=3D"_blank" moz-do-not-send=3D"true">http://libvirt.org</a>&quo=
t;<br>
            &nbsp;LICENSE =3D &quot;LGPL-2.1-or-later &amp; GPL-2.0-or-la=
ter&quot;<br>
            &nbsp;LIC_FILES_CHKSUM =3D
            &quot;<a class=3D"moz-txt-link-freetext" href=3D"file://COPYI=
NG;md5=3Db234ee4d69f5fce4486a80fdaf4a4263">file://COPYING;md5=3Db234ee4d6=
9f5fce4486a80fdaf4a4263</a> \<br>
            @@ -6,16 +6,16 @@ LIC_FILES_CHKSUM =3D
            &quot;<a class=3D"moz-txt-link-freetext" href=3D"file://COPYI=
NG;md5=3Db234ee4d69f5fce4486a80fdaf4a4263">file://COPYING;md5=3Db234ee4d6=
9f5fce4486a80fdaf4a4263</a> \<br>
            &nbsp;SECTION =3D &quot;console/tools&quot;<br>
            <br>
            &nbsp;DEPENDS =3D &quot;bridge-utils gnutls libxml2 lvm2 avah=
i parted
            curl libpcap util-linux e2fsprogs pm-utils \<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iptables dnsmasq readline=
 libtasn1 libxslt-native
            acl libdevmapper libtirpc \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iptables dnsmasq re=
adline libtasn1
            libxslt-native acl libdevmapper libtirpc \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; python3-docutils-na=
tive \<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${@bb.utils.contains('PAC=
KAGECONFIG', 'polkit',
            'shadow-native', '', d)} \<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${@bb.utils.contains('PAC=
KAGECONFIG', 'gnutls',
            'gnutls-native', '', d)}&quot;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${@bb.utils.contain=
s('PACKAGECONFIG', 'polkit',
            'shadow-native', '', d)} \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${@bb.utils.contain=
s('PACKAGECONFIG', 'gnutls',
            'gnutls-native', '', d)}&quot;<br>
            <br>
            &nbsp;# <a href=3D"https://urldefense.com/v3/__http://libvirt=
-guests.sh__;!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7Rn=
RL82gWps-Smai_Y-dQgyizt85e_jnLsZig3zi9Bj8jjQ$" moz-do-not-send=3D"true">l=
ibvirt-guests.sh</a> needs <a href=3D"https://urldefense.com/v3/__http://=
gettext.sh__;!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7Rn=
RL82gWps-Smai_Y-dQgyizt85e_jnLsZig3zjgzVXQfw$" moz-do-not-send=3D"true">g=
ettext.sh</a><br>
            &nbsp;#<br>
            &nbsp;RDEPENDS:${PN} =3D &quot;gettext-runtime&quot;<br>
            <br>
            -RDEPENDS:libvirt-libvirtd +=3D &quot;bridge-utils iptables
            pm-utils dnsmasq netcat-openbsd ebtables&quot;<br>
            +RDEPENDS:libvirt-libvirtd +=3D &quot;bridge-utils iptables
            pm-utils dnsmasq netcat-openbsd ebtables iproute2-tc&quot;<br=
>
            &nbsp;RDEPENDS:libvirt-libvirtd:append:x86-64 =3D &quot; dmid=
ecode&quot;<br>
            &nbsp;RDEPENDS:libvirt-libvirtd:append:x86 =3D &quot; dmideco=
de&quot;<br>
            &nbsp;RDEPENDS:libvirt-libvirtd:append:arm =3D &quot; dmideco=
de&quot;<br>
            @@ -232,7 +232,7 @@ do_install:append() {<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;
            &nbsp;${D}/${systemd_system_unitdir}/libvirtd.service<br>
            &nbsp; &nbsp; &nbsp; &nbsp; fi<br>
            <br>
            -&nbsp; &nbsp; &nbsp; &nbsp;# The /run/libvirt directories cr=
eated by the
            Makefile are <br>
            +&nbsp; &nbsp; &nbsp; &nbsp;# The /run/libvirt directories cr=
eated by the
            Makefile are<br>
            &nbsp; &nbsp; &nbsp; &nbsp; # wiped out in volatile, we need =
to create these at
            boot.<br>
            &nbsp; &nbsp; &nbsp; &nbsp; rm -rf ${D}/run<br>
            &nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}${sysconfdir}/defa=
ult/volatiles<br>
            -- <br>
            2.34.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#9454): <a href=3D"https://urldefense.com/=
v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/9454__;=
!!AjveYdw8EvQ!f3d48tzdQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai=
_Y-dQgyizt85e_jnLsZig3zidb-dXaQ$" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">https://lists.yoctoproject.org/g/meta-virtualizati=
on/message/9454</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.yoctoproject.org/mt/116438591/1050810__;!!AjveYdw8EvQ!f3d48tzdQk=
pUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnLsZig3zg=
CpKyWSQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">h=
ttps://lists.yoctoproject.org/mt/116438591/1050810</a><br>
            Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@li=
sts.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">meta-vir=
tualization+owner@lists.yoctoproject.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!f3d48tz=
dQkpUyrZM_186jCRR7-tIHrVCkqWuue1VUv-7RnRL82gWps-Smai_Y-dQgyizt85e_jnLsZig=
3zghpinbUQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>
            [<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">bruce.ashfield=
@gmail.com</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
        <div><br clear=3D"all">
        </div>
        <div><br>
        </div>
        <span class=3D"gmail_signature_prefix">-- </span><br>
        <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follo=
w
          the NULL pointer, for chaos and madness await thee at its end<b=
r>
          - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------EtckE0TwOC42jwNLdi7JoWR4--

