Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC636CD5BC8
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 09:37:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12583.1779701852948291714
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 May 2026 02:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=esG3coji;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9605e3e175=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6U17d1623218
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=hiy27KcovYON0oCSJH/ia8
	PPgK3/ID4sevjOoTvglwc=; b=esG3cojiueuM3DD+S4DBw4waZq3rAJVSjwtSdc
	0jrHQ6IZNy+BUWzSwwYs7ZkvZZWR1PaK97q+pEUkLiYbTUN/VaIaf5rf0fVDVOTk
	C6zWrOaV0loc+vQZJK4BrnCW1qSDBumi/Q7DB1wFHD5p/j9WLt2p4h7oZo1MJ5Bv
	6RcekImZMQKCjn90Ee6TSYerw/lEorMD5rYWnAShlcmmT8QiKma50iCcYBr+JgLX
	GKT8bo6veX+vQvGm9mpcTeIefz+/pVC1Cj2LzBwNyacywAJV6Z1LrSv7x/MGHQoi
	B/IyqYMLgc6IeTWZEfxYgNBiWXdmmJMmPgNRRRN4t0pdRcYA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011056.outbound.protection.outlook.com [52.101.62.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376ahkn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:37:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoUIRap0ndzslfvuAA9NY/WSGSAnBiVkZavk2bqlByPaTUFt6Yze4yVLApZvQYJqpTBsidva0w9FeY+UgwEiYSWJQpptDEoDUZu0XYMBMCNDjR/cHVvbv0qHpjBZr9VUXJ8K0KKHDqN8wCvtEptmmYsLbzo96e5mKEWr4xsR+1HTZv8HhFkA4T3fGbUZGY9F1Uf+iPX0RJ64YRuSFyrC37sSNSCCMYv6i8HFhqTNkfHkBUdkvG5ms1d9N/tzUj8OSBuyN66RZQWmZ1ueRUlQqaOfS3K/t/wflwjZi8sE9eFb8+4ipHYexwb+rYji8VLDPfjjMfgGTDHkKcg2MnM5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiy27KcovYON0oCSJH/ia8PPgK3/ID4sevjOoTvglwc=;
 b=RM3sz3gmkZAcmWEo2rd5kyj58STLr6x5j452iI5JHXgoKKmsXYGow+iuHaRJvrV7Z7UeiuQFEQNoA0RSdIdCHrmYFPx9Jpylc7224yQmhoVhkP3tWX9CdBj1pdQ+0JYCNfwbztBaWdDY8JvS0xpyKKSnxH9TwWG03BCghfbuN0P5VD+SALQkiOayScoyajzoAqioDgbK1hzzzHAXRVhUitmpbGcrmTKt8B0TaRpQDgrVn2p7+L+95+q0Bn73Cr1hPLJTAJ1vwJ6wQWkrFV9uKgzpIoYixviWkb6jJwXRec5OLVxjVcx5sUcXLH/Id3tAXBsYPxTdkPr6Fv1KqDDctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by SA2PR11MB4889.namprd11.prod.outlook.com
 (2603:10b6:806:110::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 09:37:28 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 09:37:28 +0000
Content-Type: multipart/alternative;
 boundary="------------1iX7DHgOC2IEtfxOnw8O11wS"
Message-ID: <dd5f4dd4-3a0c-48b9-b4ee-a50e99905bc4@windriver.com>
Date: Mon, 25 May 2026 17:37:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH 2/4] cri-o: upgrade to 1.36.0
Content-Language: en-US
To: meta-virtualization@lists.yoctoproject.org
References: <20260525092615.742129-1-zhixiong.chi@windriver.com>
 <18B2C4CF014CD9F5.3915615@lists.yoctoproject.org>
From: "Chi, Zhixiong" <zhixiong.chi@windriver.com>
In-Reply-To: <18B2C4CF014CD9F5.3915615@lists.yoctoproject.org>
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|SA2PR11MB4889:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9d12da-862c-4f47-a8a6-08deba413c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|13003099007|8096899003|18002099003|56012099003|22082099003|11063799006|3023799007|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	ZIg3JKiY2xTLVdaW39g+Lk3PrSz8Mtc/ZY5vDkYvA59Y3M1ColS4MA/ajnfe1WqNGa0H1CXwSevnzQA+AVwB4iWNOMH5saEVtYDbM2YjWUTmsaoNLZ+C9mhVSiMwxaLEavna8YSZ2yrpQ1E/RFJMZIvNCdeLGF5WyHCy0u+mSDKVCWsBG2oaoYEf+Z7MwWAOrm7IeGXxhH1My5fH++Shuv8gxK4UxCR0RvcqPaZgZbYUXMRJ9QKx8KU+tj8aR7YtKDNhLDUt33ima0F7E7YpfDL62HLueFbueX/ITCfdu5LugyHaulz/Ypy9bPyCbYR6BSPJQMy8uU4N6WoYC45PAySSSZLNrtsgmtFcID7R+x82g4A5a1RdDbJFdRwzHWDK1yNP2DdODymhljcUvodjnFC5MQPZLFtjZlWClOYL3oourSOwp5ibCtwQ1Z7773z4o1CykPbKmv9YfzysdfldytEMmgAxVUyLv1j/yUjeDsbek8u7G4SMeCGdpNjcyR1Etb2DnuICeymCBdf7u3dnjJ7T11WXAjdu9ZT7G0F2lH/ytAogsUzQTsU3glJhlC3j6Ss8fTpN+9IYba9bBXCbZup+Q7xIUhtWX+AfNVRf3ClEycGGWIALGrBPuron1MZ/DlgVydHoIDDsKUCgm8alWg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(13003099007)(8096899003)(18002099003)(56012099003)(22082099003)(11063799006)(3023799007)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0E5RGV0bEE5MUJTR3JQc2tmM0g0SENrSzk0eGFNTlFuWjJPQWVLTVRrTHpY?=
 =?utf-8?B?OUIzUFY2bW9aMG1hK2o3L2wyS29yWjB3ckVHZUVVdXgxR3Bkd2NKZlllUVdV?=
 =?utf-8?B?QVYvRGZmclYveEsrOFl0RWU2MENxZ1FhQ2xSY3I0NWhtUXBMVjRtNXA3dmlB?=
 =?utf-8?B?MjdkdS9Qc1dTdDNrRzY2bVAxSGUraGwrY0JGN3hldk9FMW1wbmVvaDZ3OGJU?=
 =?utf-8?B?Z3k2ZjFYMlRURndFN3p6dmpHTmYyTFJmVWpJTS9lTXdnTXllL1I1N1JkdDND?=
 =?utf-8?B?ZTc5VzhPaC9zWGRNaEZiVnpDUUVSYk9aSEJWQ0x5QThEZTFJUWhLcUs5c0d4?=
 =?utf-8?B?WnJHOUIrNk1FOVF4WXVSTlFPZmJwWkl3RXlXZUtoNHNDVFFYUUpDYzdRaXRJ?=
 =?utf-8?B?YzNGUFVuYW55aTBMYVczWHVkV2JiK2tockxYU3VkS1ZyZ29PT3c5RkEvTmw0?=
 =?utf-8?B?Y2Nta1VWNDVxNzVHbEVpUFFCNmsrVFg5dVhuVXVLYnNDOGtCZlFtYTd5dFJT?=
 =?utf-8?B?c3IyaXlEZmdScVBGUjMwb2dSZU8xakVqQmMwd0VrcWhlWjJlSUo5OC9aNFRn?=
 =?utf-8?B?UmhyeDlXd2I5d2NWbXNQckpXcW5vS3BCYmgzRUFYSDN3Y2twS3M3R1lPTzMw?=
 =?utf-8?B?TFFVTHpHT0VkSHpMTlVOalJpcVlRTnYweHJjZUdKZXRwRkF2OHhaQnVaQThT?=
 =?utf-8?B?aHJpWFVYZjErOUcvWDB5Q0tRZTlCbEVVTHYvaWFSQ0VoUVpycUJKbWcyR2hZ?=
 =?utf-8?B?NzRmR1U4aWxGNzdxSVA3Q2JOS0xybG1PMUViNUhWSFl3ell0STlBV3ZTVFQv?=
 =?utf-8?B?NGVwM3JNYnRYRGN1M2tKaHFaTzR3V3hvZTMyaXpHN1lrdzRqMTNaOGk0VWZ6?=
 =?utf-8?B?Rjg3SGZLV29qejVudXVZRmF2L29uT1crVkdmU3UxbXFaWGdpS3FOcVZwZ21Z?=
 =?utf-8?B?U3VWWVlXM3c2WlRpY2p4UFFLeEdrVmhDa3h1WEgyWVBWKzRnaE9HQUJpM0Zk?=
 =?utf-8?B?LzEyT3czWXJ0TWtXbVpWKzB4dGZsWkIzWjY4amFKclc0MkFLTDlxRGhBUWMy?=
 =?utf-8?B?NVRETTVQbzV0WUg1Mk9KNVpHZ29nYVRHTlNPR0UreWpoVkdUeHRvL2V1VzNX?=
 =?utf-8?B?ZzJpSEk2YUh5RkdoZEQ2bDI2Vk81bDFqMlZKTVNDanF3aWxQQkRnWDJMYVV4?=
 =?utf-8?B?MFp5L2J0U2xGZFZURm85c05PK3dmZ2pkOStRV0lHTHZsNmdzbU1hczhQejc4?=
 =?utf-8?B?emp3QmE3SDhjOVFGWG83YW1IbWJJS3JabWtoMEl4TWUvckNjY0VMNlk5ZFZK?=
 =?utf-8?B?T1BuNWlGbXFLQllCUDcxN3JkUitsU0pGT2xDcjZ5NGFlbTdHVjk4VExzbk5Z?=
 =?utf-8?B?TXI0Y0Z3ZjV5QU1oWWNSMTczWnpiTmNvN25vN01URmkwV0JMeldZTmZ5Z3JL?=
 =?utf-8?B?L2dsTkp4S25hdlBhN3FPa2dkaWtrK3RRRXdJYS80cXFzR2NFa2Y2djRmNHU4?=
 =?utf-8?B?VUhXZC9rZTFiWlkwK0tiYk43ZUJ6MFdiYmJVWjlkY1d4VW1aa2pKcXVpUnhs?=
 =?utf-8?B?VHEwS3RGaTJMd2t2LytmMytLYlVUVnM4ZkNYWE9lbVNkQ0lBWVlkaU0wUEtS?=
 =?utf-8?B?ekFpWjVqVk9UOWpwdzAzMUYzUy9XcDByWVc4S2kwWEJNT3dyVHlPK0tnTkV2?=
 =?utf-8?B?T3JWTTRwa2xCblpGUDgzZ2ZuOVFZclJRSmprMXJwdXg0L2p5NGtrMHVyb09i?=
 =?utf-8?B?N05kVk9COG5tTm1qenhod0ZXeTIrYTJtYkh1cnRRdzNtb3kyeDh0YThNaklR?=
 =?utf-8?B?c1Avc0hFcytoc0ora1IrS1p4eUhPVEx5c3hoK09Sd2Eza3Fkc1BZVGtza0ZH?=
 =?utf-8?B?YTZVYUxEa3N0dEZoalhzTWNTenpUM3FnNis4Z1kxOHNTQWhUazVBaXd1aHJW?=
 =?utf-8?B?K3k2WXVTQXNjUWwzdFovWkQ2bkF1U3poZ1NYZkVpNUplcW1TT3JLNVVQTnZF?=
 =?utf-8?B?MWdSSGpaSnF1RElOam5GalFMQWYrUVIyeFU0YjRtdC9nTXZjR2FUZ2YwWjBt?=
 =?utf-8?B?U0o4cWM4UnBPT2QyS0Z3c0JCSzd2ZDBmZGtLREpoVUR2bmtOYWRGdEFxY2sz?=
 =?utf-8?B?clhxTnBkaFNvWllsQlFkVUtSRFhSckxOdHFlcDlaY2I1WXlTZWh4L1FHRXJw?=
 =?utf-8?B?YlMvMXBmbFZlaEN6WEo5UkVXRXg2NjlXWW5HMGRLaHdDayt5bXphaitWbWlR?=
 =?utf-8?B?OTFtRmJkV0hvaWdPMU84Qmo0MWMxQ1UzSWpzZ3RoY056OUZpSUJvdk8wTjE3?=
 =?utf-8?B?NnFNbmVOSEZONGVDT2JpSDVWTXdLWGdhMjQ5UTZveDRwOFB0TGRnT1d2Rllk?=
 =?utf-8?Q?sfZJIMFpwos5hKTc=3D?=
X-Exchange-RoutingPolicyChecked: 
	NoXWSaYv7CcRUjAk9lLhAHCyS4vcXmbVP0CdcL1YWOiyE9hnKBRUs0nRi0Si5l5mWMOZDP5Ti3EMD+Emfinrqv+CRQKb6KSVqhenk07JtqekuQDwZRnfCygc3QROopK3egNADIJyFkcVXqPRAFTpgRA5sDJKJURTpn78+vJfLbiAeHsleeF1V/hzAyMG04B6HB1OfYkf/7z9OZwbnR3W+fGREr4oi6Jn3ZAx4K7YQFE5JrQW6sq+gNh7RfC75hbU7d+rIamDwK+W4cDHlTkUmJmvhf299gKbWoYcvc/qcFAt+6itUWpK1S/MsV4XFLNYwDOijgWrDavgCltIZyll2w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9d12da-862c-4f47-a8a6-08deba413c70
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 09:37:28.3497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWz1HIP0bD6gNJ5gLnGS7uvkDbuV/dFa9tIhsWFzXR59lYZpIigLCbGyt0UvU8fNyD2TO1HlOXg2gI+pGRIAwqUgZLJdmschK3LmFIaLexY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4889
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5OCBTYWx0ZWRfXzOdZjGnxMe2m
 ocHjU0zA86grxroiwx9gidCt1E2x4ZcCj2YMnr6Ppl1fhaBQPrWvFF+tqU8JBthGzek+T5p1tUu
 agiiM+F3SgkR8BMiV7oChTTS62MXGpFdudQUNYm1scosj6gqMIOT6ZNfR6u/6bSystIFvMhiFMs
 JwEwDHVmsRa2jWiMctHqwpcjHi3DpO4QxdsGIq5l1xE1nJbidzBspYgMZ4PiwnsjMB+DitUkOQ9
 KBmYf3SOBbSBxAHq+S/7yY3M76cVw5eA0pbS/XzZxaQ9eVyqS9n/6QjSM0V6thZhqRo8BzEsqJF
 LQwtIZ/xexkefqFXerUupZxTqqF0RdR8pBPCj01b4yGJPuEIyTy6hzbWXGp2CAOhYsRvD/+1HKk
 NtaulCqnoSw9butot38c/8d8iwmOiJ/QfJMr3l4xE+9vFQdHdPETCNdyCdmV+Rwl6XJnKgrgrnL
 5LMK6a8vjNEplOtDpRg==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a14185b cx=c_pps
 a=6I6wiI215fH6V9pCQ0JikQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=jtkcU8gov9LzLNf06fcA:9 a=QEXdDO2ut3YA:10
 a=1fX7CiQ7_JQljdx5sd0A:9 a=uuqrlqJjzJznr1WO:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 11-mtU1sZST_ZVhHK3i9SBub6JaJo1-_
X-Proofpoint-ORIG-GUID: 11-mtU1sZST_ZVhHK3i9SBub6JaJo1-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250098
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:37:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9808

--------------1iX7DHgOC2IEtfxOnw8O11wS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bruce,

Please ignore this patch series, I make a mistake to send this to master 
branch:
[meta-virtualization][PATCH 1/4] crun: upgrade to 1.27.1
[meta-virtualization][PATCH 2/4] cri-o: upgrade to 1.36.0
[meta-virtualization][PATCH 3/4] cri-tools: upgrade to 1.36.0
[meta-virtualization][PATCH 4/4] kubernetes: upgrade to 1.35.5

Thanks.

On 5/25/26 17:26, Zhixiong Chi via lists.yoctoproject.org wrote:
> Bumping crun to version 1.36.0, which comprises the following commits:
>
>      92b75982c Update nixpkgs
>      e5a6f664a Delete updateunified binary
>      698c22245 Bump k8s.io packages to v1.36
>      ff69f0eb7 oci: clone execPIDs map to avoid segfault
>      8ff525cf0 cnimgr: continuously poll CNI STATUS to detect runtime health changes
>      50bad6de7 metrics: add default_runtime
>      d73341fb4 deps: bump go to 1.26.2
>      f50fd5bd2 vendor: update github.com/moby/spdystream to v0.5.1
>      1b111f660 Add inject_gomaxprocs via runtime handler precreate hook
>      88e8f422b oci: wait for exit file before defaulting to exit code 255
>      8b9a4a37e Add SLSA provenance attestation to release notes template
>      ca4496cc7 Implement Stream* RPCs
>      e70f41a32 Embed git commit in static binaries via ldflags
>      6c9718d73 Disable zlib s390x vectorized CRC32 for cross-compilation
>      498e33a72 Update nixpkgs
>      ded8ab8c6 Modernize nix setup to use flakes
>      9c75852b3 Make artifact pinned status respect pinned_images configuration
>      a21c68572 fix: address review comments for additional artifact stores
>      c608ffc3a feat: add support for additional read-only artifact stores
>      5ca7b348a Switch to go 1.26
>      456e2e70f Add integration test for updating cgroup v2 unified resources
>      cd2b28f0d Add unified cgroup resource update support for cgroup v2
>
> Signed-off-by: Zhixiong Chi<zhixiong.chi@windriver.com>
> ---
>   recipes-containers/cri-o/cri-o_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 37a0b84e..f9176073 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -14,7 +14,7 @@ At a high level, we expect the scope of cri-o to be restricted to the following
>    - Resource isolation as required by the CRI \
>    "
>   
> -SRCREV_cri-o = "8273bca378a36dd225fcaf90b6b732cc4c6d4248"
> +SRCREV_cri-o = "d1e7bdc854ed4846a7f15c5e0c17e0140a1d817b"
>   SRC_URI = "\
>   	git://github.com/cri-o/cri-o.git;branch=release-1.36;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
>           file://crio.conf \
> @@ -27,7 +27,7 @@ LIC_FILES_CHKSUM ="file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c2 
> GO_IMPORT = "import"
>   
> -PV = "1.35.0+git"
> +PV = "1.36.0+git"
>   
>   inherit features_check ptest
>   REQUIRED_DISTRO_FEATURES ?= "seccomp"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9804):https://lists.yoctoproject.org/g/meta-virtualization/message/9804
> Mute This Topic:https://lists.yoctoproject.org/mt/119478155/3618679
> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub [zhixiong.chi@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------1iX7DHgOC2IEtfxOnw8O11wS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html data-lt-installed="true"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p>Hi Bruce,<br>
      <br>
      Please ignore this patch series, I make a mistake to send this to
      master branch:<br>
      [meta-virtualization][PATCH 1/4] crun: upgrade to 1.27.1<br>
      [meta-virtualization][PATCH 2/4] cri-o: upgrade to 1.36.0<br>
      [meta-virtualization][PATCH 3/4] cri-tools: upgrade to 1.36.0<br>
      [meta-virtualization][PATCH 4/4] kubernetes: upgrade to 1.35.5</p>
    <p>Thanks.</p>
    <p></p>
    <div class="moz-cite-prefix">On 5/25/26 17:26, Zhixiong Chi via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:18B2C4CF014CD9F5.3915615@lists.yoctoproject.org">
      <pre wrap="" class="moz-quote-pre">Bumping crun to version 1.36.0, which comprises the following commits:

    92b75982c Update nixpkgs
    e5a6f664a Delete updateunified binary
    698c22245 Bump k8s.io packages to v1.36
    ff69f0eb7 oci: clone execPIDs map to avoid segfault
    8ff525cf0 cnimgr: continuously poll CNI STATUS to detect runtime health changes
    50bad6de7 metrics: add default_runtime
    d73341fb4 deps: bump go to 1.26.2
    f50fd5bd2 vendor: update github.com/moby/spdystream to v0.5.1
    1b111f660 Add inject_gomaxprocs via runtime handler precreate hook
    88e8f422b oci: wait for exit file before defaulting to exit code 255
    8b9a4a37e Add SLSA provenance attestation to release notes template
    ca4496cc7 Implement Stream* RPCs
    e70f41a32 Embed git commit in static binaries via ldflags
    6c9718d73 Disable zlib s390x vectorized CRC32 for cross-compilation
    498e33a72 Update nixpkgs
    ded8ab8c6 Modernize nix setup to use flakes
    9c75852b3 Make artifact pinned status respect pinned_images configuration
    a21c68572 fix: address review comments for additional artifact stores
    c608ffc3a feat: add support for additional read-only artifact stores
    5ca7b348a Switch to go 1.26
    456e2e70f Add integration test for updating cgroup v2 unified resources
    cd2b28f0d Add unified cgroup resource update support for cgroup v2

Signed-off-by: Zhixiong Chi <a class="moz-txt-link-rfc2396E" href="mailto:zhixiong.chi@windriver.com">&lt;zhixiong.chi@windriver.com&gt;</a>
---
 recipes-containers/cri-o/cri-o_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 37a0b84e..f9176073 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -14,7 +14,7 @@ At a high level, we expect the scope of cri-o to be restricted to the following
  - Resource isolation as required by the CRI \
  &quot;
 
-SRCREV_cri-o = &quot;8273bca378a36dd225fcaf90b6b732cc4c6d4248&quot;
+SRCREV_cri-o = &quot;d1e7bdc854ed4846a7f15c5e0c17e0140a1d817b&quot;
 SRC_URI = &quot;\
 	git://github.com/cri-o/cri-o.git;branch=release-1.36;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
         <a class="moz-txt-link-freetext" href="file://crio.conf">file://crio.conf</a> \
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c2GO_IMPORT=">&quot;file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c2
 
 GO_IMPORT = &quot;</a>import&quot;
 
-PV = &quot;1.35.0+git&quot;
+PV = &quot;1.36.0+git&quot;
 
 inherit features_check ptest
 REQUIRED_DISTRO_FEATURES ?= &quot;seccomp&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#9804): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/9804">https://lists.yoctoproject.org/g/meta-virtualization/message/9804</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/119478155/3618679">https://lists.yoctoproject.org/mt/119478155/3618679</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:zhixiong.chi@windriver.com">zhixiong.chi@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------1iX7DHgOC2IEtfxOnw8O11wS--

