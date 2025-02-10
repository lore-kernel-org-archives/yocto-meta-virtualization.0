Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFA2C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 06:40:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45228.1739169600404191811
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 22:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=413644b4c0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A5G2r1030051;
	Mon, 10 Feb 2025 06:39:59 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44nvg0sn9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 06:39:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrpvGyPL0E2g4lr63AbeZekFDCKJMFkpNnKl0bmJP/KWLtBlFHRJHF4Q3cru8eOggp6f33voRyO15BkNbbcwsZ1Ekmc8DJF9h35iOisYj6I830DHQTNcoWeWiORXMU9JohHUc31BTrQ6Y24okrb4eUEbqhX0uuok2zpAK0QDbjbD5eV1lMipq3m7fGXfSgmdozqYAlxURMBXZdbsMQR/OysxQp8hD+YLQ7KGwz5xxWMg0VpmZFclamg2oVElPiztfaAO5J0JRG35bMu9tOedn55ejOUqKR8m1F1woWYH4BQfLp8RxmG9kJSgvo0iMlGt9B9hFnSTIe4ebR/V/4z/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WM10Bld0Uc8jt8TWAUEtk22LmBeHOSjAnjKuLshK7C0=;
 b=mrJNiGCBLneMwfHEaW+quo4mDaW1xvf5HK1DHpdRq9iiY/924zgrjUOa/aK/gIfOgIchpQmZkG4+Ct8r3SIDtemmSn79+BieaCqE1eNSCouNOIssR9L/PiIwoewgx6ZZvpkt652E/lgX7h3PlvVF9taca66JNRP0WRxg2fGOvp9MpubqEkSGXMaJv5eeJ8LLHuM3mdPefY0K8ZWRXueIkrpw2+0QtnEuS2CvWCGA0QIAJ9Gz43D/qVCA3QhnPPldkU9nDgtj3Gstg322ugDI3P+Fgxbe9qXDT9dz4ry1kVn+F7UXu1sa5n1G22mPRjo2lgbFTpFj5ukcUp3VwTFAFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ2PR11MB8323.namprd11.prod.outlook.com (2603:10b6:a03:53f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 06:39:56 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 06:39:55 +0000
Content-Type: multipart/alternative;
 boundary="------------6l40hG9JI7pZaAwLYd8Wp2lK"
Message-ID: <15771c7f-bc7e-45cc-aeea-8293b25e4b35@windriver.com>
Date: Mon, 10 Feb 2025 14:39:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH 2/2] libvirt: add json-c for
 driver_qemu
To: Bruce Ashfield <bruce.ashfield@gmail.com>, hongxu.jia@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
References: <20250210024557.670568-1-hongxu.jia@windriver.com>
 <20250210024557.670568-2-hongxu.jia@windriver.com>
 <CADkTA4PAu0w_xMZv6_jwhHBX9Wm-Gp3bsgCtPaiVutiUOsk61Q@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CADkTA4PAu0w_xMZv6_jwhHBX9Wm-Gp3bsgCtPaiVutiUOsk61Q@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0162.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::17) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SJ2PR11MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 715ac38b-1a31-45f4-ccac-08dd499dbb35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cnhNTlUvVUNlSldMZjFRNVp5R2VYN2FGZkZBaUhWYjRKNWgyTEdRNkFXa2R4?=
 =?utf-8?B?V2Z4bnFqR3E3T2VRWnhBdE9xS3A2dWdUVUtiTnV2VTZoZVVPbExySUowZkNS?=
 =?utf-8?B?eFBLeVBaVHNWZWxCU3Q2cnFLOFdPeVZic2tlNlR0WHZsTkNKN1g2Y3F1cVhD?=
 =?utf-8?B?UmFXN3dvTW8yNDg5MHFna1BpMXFkbm95ZDNrdFowdm0rb1dnWk80dm9QTEV4?=
 =?utf-8?B?L2F4YWZmZzR2eU9hK1M2bjIzOWxYSklzMlByWmtuMmhPMXZFRncrR1lKMGNQ?=
 =?utf-8?B?SUVnNWdsTFZOazY5MCtDQ2JlMEV6djkvanJiNy9EL1Vkandkcmo2R21yaHJo?=
 =?utf-8?B?MU5kb2RpalF0QmFoOC9sMFdqSS9sRmlpeGhoU2hmeEl4bnFGOG1lNXQrNTVF?=
 =?utf-8?B?UmFZcVhFMXdrQU9Jc0ovNUl0VjhBOWdFYlNXWDBTWVcyOUhRWC9CN3BQNENN?=
 =?utf-8?B?Vk9KQ0IxWHVCVHdXWithaVF3WWtkSmM2UVRYYnFUUzE4ZWdhY1lXWmxqb0tK?=
 =?utf-8?B?ZlhqN0ZEN2xvRlIxMkJMdjEwbnQ1U1VNZXRITmZ5VEpMSzNjTmJ0WVpuOW1w?=
 =?utf-8?B?eWYyUS9zbkY1UkxOQ09XY2s1QXM1cEpRR05qNm51Ni9sam8veFFuTGw1UC9i?=
 =?utf-8?B?NXRwTlVIcG5xS0ZwakxSd1p4V2hLeEVaMVEzVjhVTjV3UDZmNFlpYkx5cEdq?=
 =?utf-8?B?NG92ZVE4OXM5eXloc0t5OGMyNXBFS2UzbHFRNVJOWkhlNWh6ZDlldEJqQm0v?=
 =?utf-8?B?aE5NOHV0cDZFV1ZzbHN2eW1NVmlsRzJEa3JSQ2hFWXIyaHV4Uktwa01abFla?=
 =?utf-8?B?dlpHb1IzbmFjc3grRzQ5WlFUNTg4NDJzRTRRa2hxWTdWbW5JcjVhUk1NYmRD?=
 =?utf-8?B?aTZwUGUycjNDdGsveUVrQ2wrR003eExWMjhKSFBEMVZ4WGNNdGhVdlcrUFho?=
 =?utf-8?B?OU5CNzdQaFI1YnZaR2JvMmUwZVdSN1hoOVVXYmM1MSt2b2xhMTZ4YW5SNHJZ?=
 =?utf-8?B?R2JFa0M5a3Bjd21EaEtaeHUrT3M5QUg5ZDM3TG4xMmdUL25ZWmJLOXdBUzVk?=
 =?utf-8?B?a2ZuWURxN2lnUWd4YmwzVTVlS3d4Mjc1TVBmUUhoMTlHcmZJT2hGWVlBT05N?=
 =?utf-8?B?Vzk4YjhjcDk3K3c2Wkpab2ZSQlh6ZS90UDd6M0thaWhFQldOeE1sbkdZVDIw?=
 =?utf-8?B?M1k3Yk92Vnh0TllyUk01aUFuNm5vNENrZW5KdTd6NENOek5HWDVYVXQ4Qysw?=
 =?utf-8?B?OHBUcVRYZWZsRnpsaXlZckFGRHBHakJDcEFWcDlNNTJadGY0WmQ3eDVGb2x4?=
 =?utf-8?B?Y1FIZzBYZDczZnRFNjJ3cXBYOGowZ2VhRzNvR0JpaEQyZ1FLQW14TlRld21E?=
 =?utf-8?B?NVFSNXJ6WktxM1k5VnRmc0hMcE5QWGFoYStpREdRdXNOUmJMSlhYSnFYeTU0?=
 =?utf-8?B?MEcrQXErSTJFSGtIYzdWMFU0SkhwQ0FjWVNhS2NEb0FObDR2RWk3SjVvOG5y?=
 =?utf-8?B?UGpUaHNWb0hFeDdMblh0ZVltbkNlbVdvck1WU3pDcTQ1MWhoVTZ2RGJ2SERj?=
 =?utf-8?B?RHhFb3JEZ2x4U1NsU2FHa3ZXd09TNG5zQ1Q3VHVWemk0ZXZkVUN3UTV0RHU3?=
 =?utf-8?B?NTdQekNINk9ENjB2RVQ5Zk9JWStPZUxKcDJFd29oUmF6bUhocTcvdms5cTBp?=
 =?utf-8?B?ZkhNRW5RaEluU05FVGFEOW92ZE9JZUF6NDRDcVE0VjJWZlBuWkEvdlZ0VmNR?=
 =?utf-8?B?akJJQTdMSjE3VEExclNpNm0zNkk4SGROM042VTlsSGM1THptam5xSnl1OWUv?=
 =?utf-8?B?Z211dDUwa0ltdG1ka2ZYdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFEwWTh0RjNtVXdZVEE2YkdEK3l0K1Q5MlpTMk9NaUFkOW5JalhWeWk5YVpZ?=
 =?utf-8?B?aWs3ckdldnpBTS9VbXN2SzFoUEIvTEQvQlZ5NGZ1QmpKODBJZVkvSk5oY1Qy?=
 =?utf-8?B?YXpKNW52M2dBbXJqLzJoWlM2QVZwaGZSNUh6TDhvNEZwMWxia0ZIZWFqekJM?=
 =?utf-8?B?YVhpZ1Y0SVVPVEdyNEo4T1JKdTU1UUhEbWhyUkFUK3pDclpMZlpmZTBBMUtk?=
 =?utf-8?B?Y0FwQ0sxeElQR1hkY0xBUGcwRFZnNnRWRzBqOEwzUkp5OVNLQ0N2SkhwUDUv?=
 =?utf-8?B?TGpWKzgwN09ndEN0TzljcVhCVjhCbUs5VnpSakFyeWQzVkNydjU4ZkNYZFpF?=
 =?utf-8?B?eGljcDZJa00yVXJwbGRvVXpTcHdFeUlIdS9UM1FkZkxCOHpqQm02Z1RXNEJT?=
 =?utf-8?B?YzRWTXp5R1ZVaHE5VUdZZ1lnZTdnTVhoZ0l3dWpHbUFLcWhOd2s2ckMvb25D?=
 =?utf-8?B?bmRZZ2QxNWprc2Z6LzRPTFJJSVc3WlBxV3p3czM2UmltbDN4V1EzWm5HM2Rp?=
 =?utf-8?B?ckZoMmduNlJuTDlNSlR0RXVYN2Q1a0ZiMG94a0hhbnluaEVvQm0xT2c0elFl?=
 =?utf-8?B?SEoySW5kRVV4RG5qOHR4QmxGeUY5VktxMDNlRjlwVTdlcUsyOUorWDVuWnZD?=
 =?utf-8?B?T2lvdzJ6THNqTERSbEVoU3B2RWNZNktZM0R5MmpxZU4vZW02V3VVeDZOWWZQ?=
 =?utf-8?B?VmdWK2ZKR3IxSkgxM3BhYW1yQlNiU3NSUEcyYVlRK25qOVBtTm0remtLcVg0?=
 =?utf-8?B?YlJwZ1JZLzlCZ2RFL3hoaURVRkVFbUlNWU5va0pIYk9Cd1BPSVpYOWIvOHUx?=
 =?utf-8?B?dkZtQU5yUy9KTGJaWmpuK3FITDZSQ1BsWmlhMXEyTWw1QWY1TWRGN0FyWWkx?=
 =?utf-8?B?RCtEamh2V1VqVStzY21KaEc1MTVQOVpVSk1WeCtqTWd6cWgrQ1NraVVzMW9R?=
 =?utf-8?B?anoyK2RyK25qS3piQ3FOemRiUTFBN21RcTV2UHY4NGJ5a2dwR0FSMUtQRXJr?=
 =?utf-8?B?eFpDWUpaYlhnSnVIa0VKWG1YbEtyanJydEFGWnI0K0VJMndGT0cwZGFGNUxv?=
 =?utf-8?B?WjJ3R2kvb2JGdVloNERvVWJnYnJlNUl1MFF4bUc3aFE5Wm1XWTVOTjdPbW1u?=
 =?utf-8?B?QnpLY0ZPQldJc3Y0V0hIMGhPRDl2dDd3T2tKRjJmb3VLRE90a0cwUTVHajdy?=
 =?utf-8?B?TlZoaFBCTkQrTFFVNDZNZFRuNnhFaEJ2TE5nNmpod3cwNE1rVm9EVjB1cUZI?=
 =?utf-8?B?U1F1WWpUYTArUzFXdGF6ZnlFVGM3dDlRY2hLL3pUMjVGd2J4VURLRXhSN1hk?=
 =?utf-8?B?R3lWczluRGVRUmovcW5kRGVYdTQ3NWUyMkl2aFVVcnlBZ0lUS3dwczJsN0JW?=
 =?utf-8?B?UHArQVZXZjN4SCtNejdjVS9LamJxLzJxU0x1QW8raUlCL2xTdDBBWXdJVyt5?=
 =?utf-8?B?K1RCMC9NNWJ2MXJjVkhMQUxNQW9qSGVYVk9RTUFvazB6WWpGcTdnRXorUitJ?=
 =?utf-8?B?UVgrYUcwR3MvY0lvaE1ubyttdVE3TDhtbjA3aTJZYnFiSlVIeUt0YlFtbnhn?=
 =?utf-8?B?c3hiTmQ5bjlmUXBYSHZoSWhHQ2gxaFJSbll4ZE45U3R2MXBFODJ1STNYd212?=
 =?utf-8?B?eXRFSmUzU0xQQ3E4RzQ3NEIraklzM2gvcWtvMWFVVzRMbVQ1c3hTUks4ZVph?=
 =?utf-8?B?M01qa1JZVUMvcE1LMWgxOFFLMkpKYkR2RWdyVDFobnZSL2x5c3dBTjFEUnkv?=
 =?utf-8?B?UmRLeU5OQzNaWDREM0F6djJDY01idWRRbDROdlA4MzJydE9tMlRxcHR6RFV2?=
 =?utf-8?B?Szh2dk9xVnJwNHE3d1E5WkNlb3RMSm9SSjJMZzNqd2xJdko1RnBqNnhZdjVs?=
 =?utf-8?B?LzlHZ3JGUis5YmZSQ2tZTHY5MDEySnN0MXcvM3V3VXBaTkdtc3J0WHp3MXg3?=
 =?utf-8?B?cnhuN0l3Q0htTVh3TUpYZU9abWJNSjFqRWVRem5id21IYnVlRUVmcUxXbFZa?=
 =?utf-8?B?YUhsNTFjNUZQMEdOODJKaDhsSnk4VTViclZhbStqRFFmN3BzckN2dXpyazVN?=
 =?utf-8?B?VW9UbG52VGdqVUl0TldxeE40VS9vZ2tmcUNDdGVBbk1ZSkh1aXhFU2lPa1I0?=
 =?utf-8?B?TTRYNUxDNG5SaHJsT09qV1luem9IZFZZQTR5VFJpOHp5K2lmR29MNUFmRVVj?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715ac38b-1a31-45f4-ccac-08dd499dbb35
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 06:39:55.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 969sef3YGfCQzPNfpEvqXmIZy6YJQeLto0CV0xbaYUnd/lfUR+jSbj3/pInWoHLu9c5Nk+zFJX2OhIGQkSMnn3Wo+K2KrSyWqEM+02PsuA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8323
X-Proofpoint-GUID: 82h4CAGwiY-9SblLhEFC2bJ9Nd_vd3Mi
X-Authority-Analysis: v=2.4 cv=UPwnHDfy c=1 sm=1 tr=0 ts=67a99f3e cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=AziMl8wuAAAA:8 a=NEAV23lmAAAA:8 a=5zBmwohVAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=1fTMbyE-6YB2nWN-jTIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nO5ytPE2k2-9cZNESagA:9 a=rfHle9It2zZ_a24Y:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=QKHmAbfgFgo_a26yQnRY:22 a=vWgD8zG0H4_5ii-OlP9Z:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 82h4CAGwiY-9SblLhEFC2bJ9Nd_vd3Mi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100054
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2025 06:40:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9130

--------------6l40hG9JI7pZaAwLYd8Wp2lK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51A5G2r1030051

On 2/10/25 12:20, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Sun, Feb 9, 2025 at 9:46=E2=80=AFPM hongxu via lists.yoctoproject.or=
g=20
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8=
EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NL=
iFKyNjs6Orjo_-g-6d8PMDAuGVu$>=20
> <hongxu.jia=3Deng.windriver.com@lists.yoctoproject.org> wrote:
>
>     After upstreamm applied commit [meson: switch checks to depend on
>     json-c as well
>     as yajl][1], json-c is required to build QEMU driver. Otherwise
>     build libvirt
>     failed at do_configure
>
>     $ bitbake libvirt
>
>
> Again, you have something different in your environment.
>
> I can build the qemu driver just fine in my configuration.
>
> %=C2=A0bitbake-getvar -r libvirt PACKAGECONFIG
> PACKAGECONFIG=3D"gnutls qemu openvz vmware vbox esx lxc test remote =C2=
=A0 =C2=A0=20
> =C2=A0 =C2=A0 =C2=A0libvirtd netcf udev python fuse firewalld libpcap =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0libxl =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
> % bitbake libvirt
>
> .. works. Since qemu is in the default PACAKGECONFIG, you can be=20
> assured that it was built before the updates were pushed. So we need=20
> to understand what is different.
>
I could reproduce the issue via latest poky + meta-virtualization +=20
meta-openembedded on master branch

I guess the indirect dependence on json-c was introduced by libvirt in=20
your build, you could use the following way:
...
$ bitbake libvirt -g
$ grep 'json-c.do_populate_sysroot' task-depends.dot
"libvirt.do_prepare_recipe_sysroot" -> "json-c.do_populate_sysroot"

...

//Hongxu


> Bruce
>
>     ...
>     ../git/meson.build
>     <https://urldefense.com/v3/__http://meson.build__;!!AjveYdw8EvQ!cPp=
r-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs=
6Orjo_-g-6d8PNpRPhQx$>:1672:6:
>     ERROR: Problem encountered: json-c is required to build QEMU driver
>     ...
>
>     [1]
>     https://github.com/libvirt/libvirt/commit/28c987263980afc5b606a36a8=
d264b68cb01e9b9
>     <https://urldefense.com/v3/__https://github.com/libvirt/libvirt/com=
mit/28c987263980afc5b606a36a8d264b68cb01e9b9__;!!AjveYdw8EvQ!cPpr-DjHYfzJ=
qX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-=
6d8PM9XJ8xI$>
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>     ---
>     =C2=A0recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKy=
Njs6Orjo_-g-6d8PAQ2L6XF$>
>     | 2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKy=
Njs6Orjo_-g-6d8PAQ2L6XF$>
>     b/recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKy=
Njs6Orjo_-g-6d8PAQ2L6XF$>
>     index 432b5da8..6a524977 100644
>     --- a/recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKy=
Njs6Orjo_-g-6d8PAQ2L6XF$>
>     +++ b/recipes-extended/libvirt/libvirt_git.bb
>     <https://urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!=
cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKy=
Njs6Orjo_-g-6d8PAQ2L6XF$>
>     @@ -149,7 +149,7 @@ PACKAGECONFIG:remove:armeb =3D "numactl"
>     =C2=A0# enable,disable,depends,rdepends
>     =C2=A0#
>     =C2=A0PACKAGECONFIG[gnutls] =3D ",,,gnutls-bin"
>     -PACKAGECONFIG[qemu] =3D "-Ddriver_qemu=3Denabled -Dqemu_user=3Dqem=
u
>     -Dqemu_group=3Dqemu,-Ddriver_qemu=3Ddisabled,qemu,"
>     +PACKAGECONFIG[qemu] =3D "-Ddriver_qemu=3Denabled -Dqemu_user=3Dqem=
u
>     -Dqemu_group=3Dqemu,-Ddriver_qemu=3Ddisabled,qemu json-c,"
>     =C2=A0PACKAGECONFIG[libxl] =3D
>     "-Ddriver_libxl=3Denabled,-Ddriver_libxl=3Ddisabled,xen,"
>     =C2=A0PACKAGECONFIG[openvz] =3D
>     "-Ddriver_openvz=3Denabled,-Ddriver_openvz=3Ddisabled,,"
>     =C2=A0PACKAGECONFIG[vmware] =3D
>     "-Ddriver_vmware=3Denabled,-Ddriver_vmware=3Ddisabled,,"
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9126):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9126
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/9126__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G=
1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PA0WULUO$>
>     Mute This Topic:
>     https://lists.yoctoproject.org/mt/111096111/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1110=
96111/1050810__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX=
7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8POZMZ3Ee$>
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2h=
VRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PMOFfCu6$>
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

--------------6l40hG9JI7pZaAwLYd8Wp2lK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51A5G2r1030051

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2/10/25 12:20, Bruce Ashfield wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4PAu0w_xMZv6_jwhHBX9Wm-Gp=
3bsgCtPaiVutiUOsk61Q@mail.gmail.com">
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
            <div dir=3D"ltr">
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
            </div>
            <br>
            <div class=3D"gmail_quote">
              <div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 9, 2025 a=
t
                9:46=E2=80=AFPM hongxu via <a href=3D"https://urldefense.=
com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYW=
zEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PMD=
AuGVu$" target=3D"_blank" moz-do-not-send=3D"true">
                  lists.yoctoproject.org</a> &lt;hongxu.jia=3D<a href=3D"=
mailto:eng.windriver.com@lists.yoctoproject.org" target=3D"_blank" moz-do=
-not-send=3D"true" class=3D"moz-txt-link-freetext">eng.windriver.com@list=
s.yoctoproject.org</a>&gt;
                wrote:<br>
              </div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                After upstreamm applied commit [meson: switch checks to
                depend on json-c as well<br>
                as yajl][1], json-c is required to build QEMU driver.
                Otherwise build libvirt<br>
                failed at do_configure<br>
                <br>
                $ bitbake libvirt<br>
              </blockquote>
              <div><br>
              </div>
              <div>
                <div class=3D"gmail_default" style=3D"font-size:small">Ag=
ain,
                  you have something different in your environment.</div>
                <br>
              </div>
              <div>
                <div class=3D"gmail_default" style=3D"font-size:small">I =
can
                  build the qemu driver just fine in my configuration.</d=
iv>
                <div class=3D"gmail_default" style=3D"font-size:small"><b=
r>
                </div>
                <span class=3D"gmail_default" style=3D"font-size:small">%=
</span>&nbsp;bitbake-getvar
                -r libvirt PACKAGECONFIG<br>
                <div class=3D"gmail_default" style=3D"font-size:small">PA=
CKAGECONFIG=3D&quot;gnutls
                  qemu openvz vmware vbox esx lxc test remote &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;libvirtd netcf udev p=
ython fuse firewalld
                  libpcap &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;libxl &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &q=
uot;</div>
              </div>
              <div><br>
              </div>
              <div>
                <div class=3D"gmail_default" style=3D"font-size:small">%
                  bitbake libvirt</div>
                <div class=3D"gmail_default" style=3D"font-size:small"><b=
r>
                </div>
                <div class=3D"gmail_default" style=3D"font-size:small">..
                  works. Since qemu is in the default PACAKGECONFIG, you
                  can be assured that it was built before the updates
                  were pushed. So we need to understand what is
                  different.</div>
                <div class=3D"gmail_default" style=3D"font-size:small"><b=
r>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    I could reproduce the issue via latest poky + meta-virtualization +
    meta-openembedded on master branch<br>
    <br>
    I guess the indirect dependence on json-c was introduced by libvirt
    in your build, you could use the following way:<br>
    ...<br>
    $ bitbake libvirt -g<br>
    $ grep 'json-c.do_populate_sysroot' task-depends.dot<br>
    &quot;libvirt.do_prepare_recipe_sysroot&quot; -&gt;
    &quot;json-c.do_populate_sysroot&quot;<br>
    <p>...</p>
    <p>//Hongxu<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4PAu0w_xMZv6_jwhHBX9Wm-Gp=
3bsgCtPaiVutiUOsk61Q@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div class=3D"gmail_quote">
              <div>
                <div class=3D"gmail_default" style=3D"font-size:small">
                </div>
                <div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div>
                <br>
              </div>
              <div>&nbsp;</div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                ...<br>
                ../git/<a href=3D"https://urldefense.com/v3/__http://meso=
n.build__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALds=
tjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PNpRPhQx$" moz-do-not-send=3D"true=
">meson.build</a>:1672:6: ERROR:
                Problem encountered: json-c is required to build QEMU
                driver<br>
                ...<br>
                <br>
                [1] <a href=3D"https://urldefense.com/v3/__https://github=
.com/libvirt/libvirt/commit/28c987263980afc5b606a36a8d264b68cb01e9b9__;!!=
AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_=
IAIMO6NLiFKyNjs6Orjo_-g-6d8PM9XJ8xI$" rel=3D"noreferrer" target=3D"_blank=
" moz-do-not-send=3D"true">
https://github.com/libvirt/libvirt/commit/28c987263980afc5b606a36a8d264b6=
8cb01e9b9</a><br>
                <br>
                Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.ji=
a@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-=
txt-link-freetext">hongxu.jia@windriver.com</a>&gt;<br>
                ---<br>
                &nbsp;recipes-extended/libvirt/<a href=3D"https://urldefe=
nse.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY=
1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PAQ2L6X=
F$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt=
_git.bb</a> | 2 +-<br>
                &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
                <br>
                diff --git a/recipes-extended/libvirt/<a href=3D"https://=
urldefense.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_=
LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8=
PAQ2L6XF$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
libvirt_git.bb</a>
                b/recipes-extended/libvirt/<a href=3D"https://urldefense.=
com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQ=
J-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PAQ2L6XF$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt_git=
.bb</a><br>
                index 432b5da8..6a524977 100644<br>
                --- a/recipes-extended/libvirt/<a href=3D"https://urldefe=
nse.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY=
1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PAQ2L6X=
F$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt=
_git.bb</a><br>
                +++ b/recipes-extended/libvirt/<a href=3D"https://urldefe=
nse.com/v3/__http://libvirt_git.bb__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY=
1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PAQ2L6X=
F$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libvirt=
_git.bb</a><br>
                @@ -149,7 +149,7 @@ PACKAGECONFIG:remove:armeb =3D
                &quot;numactl&quot;<br>
                &nbsp;# enable,disable,depends,rdepends<br>
                &nbsp;#<br>
                &nbsp;PACKAGECONFIG[gnutls] =3D &quot;,,,gnutls-bin&quot;=
<br>
                -PACKAGECONFIG[qemu] =3D &quot;-Ddriver_qemu=3Denabled
                -Dqemu_user=3Dqemu
                -Dqemu_group=3Dqemu,-Ddriver_qemu=3Ddisabled,qemu,&quot;<=
br>
                +PACKAGECONFIG[qemu] =3D &quot;-Ddriver_qemu=3Denabled
                -Dqemu_user=3Dqemu
                -Dqemu_group=3Dqemu,-Ddriver_qemu=3Ddisabled,qemu json-c,=
&quot;<br>
                &nbsp;PACKAGECONFIG[libxl] =3D
                &quot;-Ddriver_libxl=3Denabled,-Ddriver_libxl=3Ddisabled,=
xen,&quot;<br>
                &nbsp;PACKAGECONFIG[openvz] =3D
                &quot;-Ddriver_openvz=3Denabled,-Ddriver_openvz=3Ddisable=
d,,&quot;<br>
                &nbsp;PACKAGECONFIG[vmware] =3D
                &quot;-Ddriver_vmware=3Denabled,-Ddriver_vmware=3Ddisable=
d,,&quot;<br>
                -- <br>
                2.34.1<br>
                <br>
                <br>
                -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                Links: You receive all messages sent to this group.<br>
                View/Reply Online (#9126): <a href=3D"https://urldefense.=
com/v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/912=
6__;!!AjveYdw8EvQ!cPpr-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfo=
YnGDw_IAIMO6NLiFKyNjs6Orjo_-g-6d8PA0WULUO$" rel=3D"noreferrer" target=3D"=
_blank" moz-do-not-send=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/message/9126</a><br>
                Mute This Topic: <a href=3D"https://urldefense.com/v3/__h=
ttps://lists.yoctoproject.org/mt/111096111/1050810__;!!AjveYdw8EvQ!cPpr-D=
jHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs6Or=
jo_-g-6d8POZMZ3Ee$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">
                  https://lists.yoctoproject.org/mt/111096111/1050810</a>=
<br>
                Group Owner: <a href=3D"mailto:meta-virtualization%2Bowne=
r@lists.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">
                  meta-virtualization+owner@lists.yoctoproject.org</a><br=
>
                Unsubscribe: <a href=3D"https://urldefense.com/v3/__https=
://lists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!cPp=
r-DjHYfzJqX_LYWzEvY1mwQJ-G1IXdk2hVRfMDxX7pALdstjYYfoYnGDw_IAIMO6NLiFKyNjs=
6Orjo_-g-6d8PMOFfCu6$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-se=
nd=3D"true">
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
            <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not
              follow the NULL pointer, for chaos and madness await thee
              at its end<br>
              - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<b=
r>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------6l40hG9JI7pZaAwLYd8Wp2lK--

