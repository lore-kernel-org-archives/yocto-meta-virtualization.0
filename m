Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDAFC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 06:27:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45135.1739168839151027499
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 22:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=413644b4c0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A533KZ010810;
	Mon, 10 Feb 2025 06:27:17 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44nvg0sn2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 06:27:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWJkQ9uG8U4RTK/RXjS5ruLtBogAtWm5LnND3kMiSjlE9fH7S6TRSP6EwdJe9jNAkozBaoLoFQSV9xCNzd5wCkZviDe/TV3aE/eNNVcR3RLQtn0Pg7xtUIlN2+DlR4KRXt/HESy0dW6GccpgbDogJP6MFQO0p8JwcXwDJYkSiXT7VdT6dn4E0APLCu5Rmb7BJFMga2FL6zccZBM4KACthcQnI5WRWnOwcISBLejiWFEtIHViWLxvgoXRhF6qC/kqPBYqVjTJGpBVVzc6/gd2j3hHmWIlUz0rFLhD7VDmmt16xQEP8hDXKsMqT+0i4esQBbmUYCK4H9nznYoyledcWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1aHhUclmbovnpUqWlUrDkzo+SDs6sH3M5+BHTiW44I=;
 b=N8ospKs/sxVfnOshSrCXRA26PJuHkCDqWsXildjmtKpyE673VHAb2TThuZ+ROWk1sXS8rBdQjFpE+0h/Rnpi7LOMd1wJl1O02oWWOrSkUxi7SjpK2EBfY5zD8BmTxsEx4cw+X7bCrzyR5YUubJLxlvLKaM7Og2OlYOVPSN2dXoztvpFJ4fidk4RuQ/vR4cbbIb3ND0t0RkTdSqM5ISnQa70fOjVc3mz/HKYkSIez8qPW+uARQtcWhRJnnxwXLPnUSSPKOyEdgnVDz5881uZPoljo6yVaV0jnVVXWtxilKLKsjGi3Z36OgZrJIygevbcsSbqbClo45OgD1GF0rMFVew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by CH3PR11MB7251.namprd11.prod.outlook.com (2603:10b6:610:147::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 06:27:12 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 06:27:12 +0000
Content-Type: multipart/alternative;
 boundary="------------5TxrEYSOabywcUTcMwvJLxCn"
Message-ID: <0264c1f9-d275-45b0-9f0a-e84a5c7a39e6@windriver.com>
Date: Mon, 10 Feb 2025 14:27:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH 1/2] nerdctl: fix do_compile failed
To: Bruce Ashfield <bruce.ashfield@gmail.com>, hongxu.jia@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
References: <20250210024557.670568-1-hongxu.jia@windriver.com>
 <CADkTA4N7rntXtDP210HsQzQP9pUV3OWWGEzO3Z3tSxKhk2YoZw@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CADkTA4N7rntXtDP210HsQzQP9pUV3OWWGEzO3Z3tSxKhk2YoZw@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|CH3PR11MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e50de6-ea2d-4017-365c-08dd499bf40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RFpSOGYvRThOUkZFV1FoNVBFZ0pndXh2WXhzWEJMYUs4aGg2SEJsZDVaaFN1?=
 =?utf-8?B?UWplclhBRjJkc3BtVGlXSk9XZ3gyWlU4N1FqU3FqTFlreVJlZ1JERWdMZzBu?=
 =?utf-8?B?ekk2OUJrQStyakg0RHArVXB6MGdkZ1dIdllTdC9FRTBFS3NTdzZiaWV6QS9i?=
 =?utf-8?B?cHRuM2ErMUhTMko3WFI4VDN5a0tBL05jU2ptUERUTnpCMFA2UTh4c2FyT3A2?=
 =?utf-8?B?dVZHNzBvUWFseTdaVlo2NUp5SzJwV3d6ZHJ2MjEzZkNBNXdYY1pzeWdscEJs?=
 =?utf-8?B?SXRGSlJLcTFhZUkwMzJWY01WSHkrWnU0angxV25RdDZ6dUk4WFRvS3hiQTBM?=
 =?utf-8?B?MlFRQ3RpNzU4Q2lUNUJQQk5La3Q5UlRrVDJSREpXWmNEK3krbU5qQkxaL0U1?=
 =?utf-8?B?SUR2dmk1cXQ3Z0k0WDdIVmw2Q25OVmdma2RkdnVOVUJHdlBLZU9aYkRyYUpq?=
 =?utf-8?B?RUJGeDVBMjhQWmpHeDhIdEhkSC9RYkM2NGtZTjU2N0xHR0VtU0VuTlMyYWZ1?=
 =?utf-8?B?UUg1TStXYWM1aGJuVTVUTEZkbnh5b1VuVHlySFJZQVJvOFdLckxKRFg2amMw?=
 =?utf-8?B?bndtdjdwM3B0SGh0aGlYVm5HYjBjUUZ0RmNJbHNTNGhXeVZtZjRnYm5rdjRD?=
 =?utf-8?B?Q1lpZkplU2FWaWlzY1QxelVSQkd6NkhjdkZBNm9KRTdsMUMvNy9JMHNqMGQw?=
 =?utf-8?B?dktFdldxb2I1WjJSZkc3K1p4aHdxcXNUb1VmOTJJQTRIQXo4RzM2MkhFSU9P?=
 =?utf-8?B?V2tkNHg3TzRxNXdUMFJzN3o5amVjWkFWdDRzSGs2ZkxXeXNFNWxJTUt3Rmo4?=
 =?utf-8?B?eTZ2MGNJRjdpWWRJaGN4SXJYTm5uUDFKa1prdWRXT3dGS09PcFF6Vk1ua2NH?=
 =?utf-8?B?MHpabGsxdzRiYjV6RkxJc241MHp3ekN2bjFDZzJYb0hUdDhoeEJ3aUg1V09D?=
 =?utf-8?B?T0RYZk85U0JYazFERVFSN0NQUnFWSjJkYjdRRGhodCtCNWJ1Rzk4NzN4WVRY?=
 =?utf-8?B?VXRjeWxvVHRDWEhRM0RUZXE5VXpUclU5dFZVaHc5M09PRFFCTEJHWG5MaU5h?=
 =?utf-8?B?dlptaEo2ZllmUzdQTVZYZGt6d0FDZ0UzS3VwWmZYYUVDQlhUcDljL0RFby9S?=
 =?utf-8?B?TkNGVWh2cXh1bldIY01hTWUrZ3lZdDZoRjNDUy9HWS9HZ2FvVDlVSlMwQ01W?=
 =?utf-8?B?THNaM3FnUWNEQ0t4UmdET1NBNmhUZE1yTmVWNEtRTG9ycGI3RVRCYzhoZzRi?=
 =?utf-8?B?VUZLZ2RwdFdRQ2lieTZ0RUlPekxvOGF1SjZBWFZnaStlNW9mdlNra2dWKytj?=
 =?utf-8?B?R0g3ZmJuM25WSnRpT3lzRisyOFpxVU1aMDNFcWh5ZUt0VnJPbW5palczaUxE?=
 =?utf-8?B?TXVrYTh2eU5tTGl0NGE0NnRDQ1hCMEFKMFhSQXR4WGdFTXJYa3d3cGp6VHNF?=
 =?utf-8?B?ZnNpV3F5U2dONXVWSHhFa1BrM1JFMmkvQ05uRlRmN2wyR0ltbVo2ME5BQ25L?=
 =?utf-8?B?Z2RIdE5kRlNuRURnYlB1NXhCT2J0WFozUDdKNHAzN3ZlSE1lM1h5WkVBdHpv?=
 =?utf-8?B?ZVhFUW05dEozcHd3Q1dSM1BNY3JZUit0N2U0OElQMU00ZkhqZ1hMMlozNXZK?=
 =?utf-8?B?VWxKWS95U0ptemxhN0lZZ2Y3SXJXNStJSUpNT3N5Wk94WURoTG5EaFpRMXdV?=
 =?utf-8?B?VHR0M3lPOE9HZVhuT0lXUlphQldKV3RrcWVMQUNUaGVIbWhFdlVXWjZjNjBW?=
 =?utf-8?B?bk9oYzlPcVo1L0E4ejUxOVNmb3pNMmlIQ0tGOUtFR1kwS1h6UFZ3aXFwaGxF?=
 =?utf-8?B?d3ljTkkveVJOM2F3RU5Mdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHozYWtDWFVFQnJzL2YxcG9FdlkrZ2JENmY2eVIraEkzWjhLaFcxVUxaNSt6?=
 =?utf-8?B?MGRYL0k5czJDMkpyZDBGTWhqMmFncnltRDkrMzFGOXNTQzM3SGUwU3pUOVJr?=
 =?utf-8?B?TjJRNVprQWJMSDJ6L29SeWtZbE9LelFScUg3ODB6NnkzZkk0S1M1ZXJwYmhw?=
 =?utf-8?B?ZXVKS1cycTZlbHBheVQwV1BEVlhIdEdhVmgvamtPU2FwUUs0dmRVTzlFUzZG?=
 =?utf-8?B?eEhpdmpVKytLaENHWTlwaXc5TXFNelBEay92OWpBMnEzSUdGL3c2bjRtdWth?=
 =?utf-8?B?Rk1VODZIZ2toVTNpa3EydkdoNUZPWVVEaVNUVzFlM1dMenBkbnlVMlF6MUtI?=
 =?utf-8?B?amdhenBKTzdYUVZDUXllYVJPWDlIREo5VWFXa2JhUTNTVlRTRVRxMk9CWFVZ?=
 =?utf-8?B?cVZWTVoyWWNuSGZ1ZlQyTGovS2dScWp2U0p0WTJheU1VOWpkUFVLQmVENFpO?=
 =?utf-8?B?WHhOZERicE1SL0tqY1ZnSC9DNko1bDQzcGxnNmgwMC9rNW1lMXA1VUE5bXFW?=
 =?utf-8?B?ZUZpZUlQZUd6RExFTEZNSkNtT0lSa2EzVWNxRmNLSUdkNHpZeExHUGFMVlZV?=
 =?utf-8?B?eFVHNjBkYnl4OFBBdjZFcUxWMHRIdEp5M3U3WGJka0pUNTdTdEZNMFd1TG9n?=
 =?utf-8?B?VDRyYkZhd0dkeUJ3SlFXbENpNDdFemJtZlRHNmhwN2Fmblo0ZkpnN09RbnV5?=
 =?utf-8?B?YVBnc0xlWEZwcWpzT1BzZG9aRVN1eUVFeTQ4NnpzekFVRFZORXN0b29vRlpp?=
 =?utf-8?B?bTBkenY3WnFVT2JRT0hHODF6NG5oRVBEQ3ZFQk1uYmhZU0xwS3pYUFZvOVZL?=
 =?utf-8?B?MXFsVXk0NUJ6ZW1iRVg4VTdHZ0pmRlFNeFliZFp1VkZodnVhYlpFbG9scmFD?=
 =?utf-8?B?dEpJamdpeUtyWGovR21ZU2NGRVBTQzZ2YVlEVjQ2R3Y5MmdLd1QvZk4yTlFF?=
 =?utf-8?B?VTV2dlFtY1R6ZHVlRnp5Z3N4QVl4aVNPajdUVkhFOWQzM3FHSHRna0Q4SVBE?=
 =?utf-8?B?cG5ic1ArUlA5ZjVQcmpSaDgvNjc4QlE4OWtvUTVnaWREZHZhTEZwTWd5VFNi?=
 =?utf-8?B?RjhqMTh5VndJRVNTb3pBSU51ZVZDeDhqUHBRSEcyS2RDSnVtSDhQMm9oYmwx?=
 =?utf-8?B?OGljOEhUNkNXeitSMEQ4MG5CMTJobXZGNVFnNk51RWkyYVdMa1lwY1BESmI0?=
 =?utf-8?B?c1NaSkhRRVpmQW9DWHF1RUlXUnU0dlR0N3RmSWw2VEMrMk96TWVKZWxwOXVY?=
 =?utf-8?B?OXhPblB1eitPanNLQXBGaGxLQWoyL0IwZktrRzdiM1cyVTlreGRzcXV2TGU3?=
 =?utf-8?B?MCt5SEMrYlNoVU1Ucy9SN2xQR0pGUFpQai96ajlsVlFza1ZBVUYzZzJVenBl?=
 =?utf-8?B?aUF2bS93WndlZG54Z0MxcGVqQi9tUmxyb052VGZtNStJK1VzTGc1anArWlhH?=
 =?utf-8?B?SjBUT0kvSUY4c0Y4djdYd2xVcC9wd1JKOHpXU0xJMUo3ZmFCRmhLZ0hGVzI4?=
 =?utf-8?B?K1VoUko1bENDWXlzeG52d1k4algrMzN1bnU4c0xwNk9zMXphTTlvLzl3MmVF?=
 =?utf-8?B?TW81NzhEZXRkTUYwYmZ1V1VTWTdvdkJIQ0ZJRzZlcTFGMDZDeWd6eGxEQ1JJ?=
 =?utf-8?B?aHhWS2g0M1ZaUWFoSlMwbXVPNkFkcXVRWDlOWVVyWUV6azd0Y1BLM3ExSXZx?=
 =?utf-8?B?b3RCUkswalZkamFVeXU1R0ZxSzY1dU1Hd1JtSEpEWEU1RGo2VFJSRS9DQlJM?=
 =?utf-8?B?RWpzc2k2cytuMXc1OEZXaGY5QTJMWjRTbEVkaDZQOVJOZjJsOXoyQzJSVi9p?=
 =?utf-8?B?dEhjK1NhQ0Z2Ynd0K1JQb2F1b1hqbW9DL0VXR2svMnJGSUJSZ2FPTm9ibkRi?=
 =?utf-8?B?dHVpa3lkVzRMUzdFenVzZFdhS2VGV0JMQmQ2a0pBbExwdm9TbnJQTkxLZ1Vy?=
 =?utf-8?B?TDNtOS8rVEVIS01iM1RncnNSVG5teDN6dWY1MW5NREh5UlpaeWZxd0xkOVpB?=
 =?utf-8?B?NUp3RjBvbUFRZitOeXp1bUlWcWlKMW9TdnZTaEE5QUNUQlQvVVAvVjI5c1A1?=
 =?utf-8?B?c1RMRHJqNW1LM0ZoZXRjSCtKYUxPRHZVZzk3ZVU3Y3hmNjZMS05vVkwxOFBi?=
 =?utf-8?B?Sm13TU8zUC8wSXo2d3liSDQvb2ZrRnRJSWkrV1U4RzNmZTNYV0IrZ1pveGJO?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e50de6-ea2d-4017-365c-08dd499bf40b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 06:27:12.2884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5L+JjIscIw1aG0mkaBeZYb60S14aDQ+KORB0wWa/k0cFNIJOpvwOIyq4PpPh/D6smB6NgmpFZLuPTQUrHSZFZQ056zLTqPst1cPtCiTFn3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7251
X-Proofpoint-GUID: 3GEWHmrjmF9jySVBNllngEGKk1vOSYhG
X-Authority-Analysis: v=2.4 cv=UPwnHDfy c=1 sm=1 tr=0 ts=67a99c44 cx=c_pps a=oQ/SuO94mqEoePT5f2hFBg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=vCHQbyzJAAAA:8 a=tkTufW_8AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=zXRRNrs--_ybEsDx8YMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cCEoK8jFP94AMyPREWsA:9 a=VgKe_SyyNKZ2_tW9:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ImwWUX5h3JJ3gRE9moBe:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=mA5qry1rbyGvl90tSnBg:22 a=VxGx2c0l_Oi_Ap3SNpLP:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3GEWHmrjmF9jySVBNllngEGKk1vOSYhG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100052
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2025 06:27:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9129

--------------5TxrEYSOabywcUTcMwvJLxCn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51A533KZ010810

On 2/10/25 11:40, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> This builds just fine for me.
>
> The update=C2=A0never would have been pushed otherwise.
>
> You'll need to elaborate on your distro and other settings that are=20
> triggering this.
>
I use poky + meta-virtualization +meta-openembedded, build multlib=20
failed, but non-multilib succeed

...local.conf...

MACHINE =3D "qemux86-64"
require conf/multilib.conf
MULTILIBS =3D "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 =3D "x86"

$ bitbake lib32-nerdctl

> Bruce
>
> On Sun, Feb 9, 2025 at 9:46=E2=80=AFPM hongxu via lists.yoctoproject.or=
g=20
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8=
EvQ!YeB-5-Zsybg9mQQDca9gvnk4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQ=
fpdHXrafGc6tOCGbYTL62vuyEdJ$>=20
> <hongxu.jia=3Deng.windriver.com@lists.yoctoproject.org> wrote:
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
>     =C2=A0...xternal-specification-of-build-setti.patch | 34
>     +++++++++++--------
>     =C2=A0recipes-containers/nerdctl/nerdctl_git.bb
>     <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!=
YeB-5-Zsybg9mQQDca9gvnk4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdH=
XrafGc6tOCGbYTL6zD5WlZz$>
>     =C2=A0 =C2=A0|=C2=A0 1 +
>     =C2=A02 files changed, 21 insertions(+), 14 deletions(-)
>
>     diff --git
>     a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-s=
pecification-of-build-setti.patch
>     b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-s=
pecification-of-build-setti.patch
>     index ca7b3042..a384b9e6 100644
>     ---
>     a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-s=
pecification-of-build-setti.patch
>     +++
>     b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-s=
pecification-of-build-setti.patch
>     @@ -1,25 +1,31 @@
>     -From 0e6809ea075acd3edf7de197cd4e190ccdad6361 Mon Sep 17 00:00:00
>     2001
>     -From: Bruce Ashfield <bruce.ashfield@gmail.com>
>     -Date: Mon, 29 Mar 2021 20:50:47 -0400
>     +From d254c922f14ca20d09d5258aa908a1105c6acd73 Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com>
>
>
> You can't change the "from:" in a patch.
>
Copy, v2 incoming

//Hongxu

> Bruce
>
>     +Date: Sun, 9 Feb 2025 21:06:29 +0800
>     =C2=A0Subject: [PATCH] Makefile: allow external specification of bu=
ild
>     settings
>
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
YeB-5-Zsybg9mQQDca9gvnk4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdH=
XrafGc6tOCGbYTL6zD5WlZz$>
>     b/recipes-containers/nerdctl/nerdctl_git.bb
>     <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!=
YeB-5-Zsybg9mQQDca9gvnk4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdH=
XrafGc6tOCGbYTL6zD5WlZz$>
>     index 63b96846..84734c9f 100644
>     --- a/recipes-containers/nerdctl/nerdctl_git.bb
>     <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!=
YeB-5-Zsybg9mQQDca9gvnk4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdH=
XrafGc6tOCGbYTL6zD5WlZz$>
>     +++ b/recipes-containers/nerdctl/nerdctl_git.bb
>     <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!=
YeB-5-Zsybg9mQQDca9gvnk4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdH=
XrafGc6tOCGbYTL6zD5WlZz$>
>     @@ -19,6 +19,7 @@ include src_uri.inc
>     <https://urldefense.com/v3/__http://src_uri.inc__;!!AjveYdw8EvQ!YeB=
-5-Zsybg9mQQDca9gvnk4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXra=
fGc6tOCGbYTL6zCEEpd3$>
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
>     View/Reply Online (#9125):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9125
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/9125__;!!AjveYdw8EvQ!YeB-5-Zsybg9mQQDca9gvnk4qeo5m=
UWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXrafGc6tOCGbYTL6xnxedM3$>
>     Mute This Topic:
>     https://lists.yoctoproject.org/mt/111096110/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1110=
96110/1050810__;!!AjveYdw8EvQ!YeB-5-Zsybg9mQQDca9gvnk4qeo5mUWMZOfyYk1RVL4=
T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXrafGc6tOCGbYTL6wjI_d1H$>
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!YeB-5-Zsybg9mQQDca9gvnk4qeo5mUWMZOfy=
Yk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXrafGc6tOCGbYTL62-V9m-L$>
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

--------------5TxrEYSOabywcUTcMwvJLxCn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51A533KZ010810

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2/10/25 11:40, Bruce Ashfield wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4N7rntXtDP210HsQzQP9pUV3O=
WWGEzO3Z3tSxKhk2YoZw@mail.gmail.com">
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
            <div class=3D"gmail_default" style=3D"font-size:small">This
              builds just fine for me.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">The
              update&nbsp;never would have been pushed otherwise.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">You'll
              need to elaborate on your distro and other settings that
              are triggering this.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I use poky + meta-virtualization +meta-openembedded, build
      multlib failed, but non-multilib succeed<br>
    </p>
    <p>...local.conf...<br>
    </p>
    <p>MACHINE =3D &quot;qemux86-64&quot;<br>
      require conf/multilib.conf<br>
      MULTILIBS =3D &quot;multilib:lib32&quot;<br>
      DEFAULTTUNE:virtclass-multilib-lib32 =3D &quot;x86&quot;<br>
    </p>
    <p>$ bitbake lib32-nerdctl<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4N7rntXtDP210HsQzQP9pUV3O=
WWGEzO3Z3tSxKhk2YoZw@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div class=3D"gmail_default" style=3D"font-size:small">
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 9, 2025 at
              9:46=E2=80=AFPM hongxu via <a href=3D"https://urldefense.co=
m/v3/__http://lists.yoctoproject.org__;!!AjveYdw8EvQ!YeB-5-Zsybg9mQQDca9g=
vnk4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXrafGc6tOCGbYTL62vuy=
EdJ$" moz-do-not-send=3D"true">
                lists.yoctoproject.org</a> &lt;hongxu.jia=3D<a href=3D"ma=
ilto:eng.windriver.com@lists.yoctoproject.org" moz-do-not-send=3D"true" c=
lass=3D"moz-txt-link-freetext">eng.windriver.com@lists.yoctoproject.org</=
a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
              &nbsp;...xternal-specification-of-build-setti.patch | 34
              +++++++++++--------<br>
              &nbsp;recipes-containers/nerdctl/<a href=3D"https://urldefe=
nse.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!YeB-5-Zsybg9mQQDca9gvn=
k4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXrafGc6tOCGbYTL6zD5WlZ=
z$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nerdctl=
_git.bb</a>&nbsp;
              &nbsp; &nbsp;|&nbsp; 1 +<br>
              &nbsp;2 files changed, 21 insertions(+), 14 deletions(-)<br=
>
              <br>
              diff --git
a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch
b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch<br>
              index ca7b3042..a384b9e6 100644<br>
              ---
a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch<br>
              +++
b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specifi=
cation-of-build-setti.patch<br>
              @@ -1,25 +1,31 @@<br>
              -From 0e6809ea075acd3edf7de197cd4e190ccdad6361 Mon Sep 17
              00:00:00 2001<br>
              -From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@=
gmail.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">bruce.ashfield@gmail.com</a>&gt;<br>
              -Date: Mon, 29 Mar 2021 20:50:47 -0400<br>
              +From d254c922f14ca20d09d5258aa908a1105c6acd73 Mon Sep 17
              00:00:00 2001<br>
              +From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windrive=
r.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">hongxu.jia@windriver.com</a>&gt;<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">You
                can't change the &quot;from:&quot; in a patch.</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Copy, v2 incoming<br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4N7rntXtDP210HsQzQP9pUV3O=
WWGEzO3Z3tSxKhk2YoZw@mail.gmail.com">
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
              +Date: Sun, 9 Feb 2025 21:06:29 +0800<br>
              &nbsp;Subject: [PATCH] Makefile: allow external specificati=
on
              of build settings<br>
              <br>
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
urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!YeB-5-Zsybg9mQQ=
Dca9gvnk4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXrafGc6tOCGbYTL=
6zD5WlZz$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
nerdctl_git.bb</a>
              b/recipes-containers/nerdctl/<a href=3D"https://urldefense.=
com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!YeB-5-Zsybg9mQQDca9gvnk4qe=
o5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXrafGc6tOCGbYTL6zD5WlZz$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nerdctl_git=
.bb</a><br>
              index 63b96846..84734c9f 100644<br>
              --- a/recipes-containers/nerdctl/<a href=3D"https://urldefe=
nse.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!YeB-5-Zsybg9mQQDca9gvn=
k4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXrafGc6tOCGbYTL6zD5WlZ=
z$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nerdctl=
_git.bb</a><br>
              +++ b/recipes-containers/nerdctl/<a href=3D"https://urldefe=
nse.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!YeB-5-Zsybg9mQQDca9gvn=
k4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXrafGc6tOCGbYTL6zD5WlZ=
z$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nerdctl=
_git.bb</a><br>
              @@ -19,6 +19,7 @@ include <a href=3D"https://urldefense.com=
/v3/__http://src_uri.inc__;!!AjveYdw8EvQ!YeB-5-Zsybg9mQQDca9gvnk4qeo5mUWM=
ZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXrafGc6tOCGbYTL6zCEEpd3$" moz-do=
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
              View/Reply Online (#9125): <a href=3D"https://urldefense.co=
m/v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/9125_=
_;!!AjveYdw8EvQ!YeB-5-Zsybg9mQQDca9gvnk4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbO=
qMzgLrqz8-fQfpdHXrafGc6tOCGbYTL6xnxedM3$" rel=3D"noreferrer" target=3D"_b=
lank" moz-do-not-send=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/message/9125</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.yoctoproject.org/mt/111096110/1050810__;!!AjveYdw8EvQ!YeB-5-Zs=
ybg9mQQDca9gvnk4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXrafGc6t=
OCGbYTL6wjI_d1H$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">
                https://lists.yoctoproject.org/mt/111096110/1050810</a><b=
r>
              Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@=
lists.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">
                meta-virtualization+owner@lists.yoctoproject.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!YeB-5=
-Zsybg9mQQDca9gvnk4qeo5mUWMZOfyYk1RVL4T4eP7Ys5J0NVbOqMzgLrqz8-fQfpdHXrafG=
c6tOCGbYTL62-V9m-L$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
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

--------------5TxrEYSOabywcUTcMwvJLxCn--

