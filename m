Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD06D743FD
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 02:02:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1448.1732154544863451677
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 18:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10558afda8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKMQ8F1010300;
	Thu, 21 Nov 2024 02:02:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xjc8d0u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 02:02:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4alPr8bCeueQ/dTyNesddyR3Nz/likX1Bp34AV/uAv54RZMIiXZ1AZg55CuAWhgZYZm7vPn38BR9fkoi4bWCQ16Mx26tRrZ/etlphKpEViBThO1olroi8epsuTr5kor8W1u1cN4sHo2Cp6TS32NbcYnwlfzH3mMsQ5sEPq4p5RbE1xjnz7uDj264vOGzzBIoOvKoNvyTygB2WP/6oYceGUlEcIJduKiVgu7froHgRPpNjYhtiyuaS6jLU4Az+mEPuiNDqIHNeXJA1Nq3Yu9Hz6CF8wRIIsF5Dx5U0yCktypJvVCBD2DljvrUBvyibY8MiYYnOgn+Uhumk5uYiN6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2qcQD0vYN9hlp2KUXu1ryZsWjqn4SmQiNBt2jdNAKQ=;
 b=y6Vdikr38Z4Xa8pYZ4jVshEqYquF07vE13cbZ0tF3yM0aQzExoX2EohT5legx2jh9FUy8V0ZLUnvyPLkFGY44gAgqEA7Ec30TYP3MyD/OHR331I01vceSeBAqLA5dsDluGuAjGcph9krHehWS+qDQl1XT4mYOZedKjwYzv0wBvSZcQgXqQmVFzYODWeoSCN8DlM9IAXjkNPtz0f04vsVStoF0UHnuDxgb4tN02wKY4BVHsI31Ni5H9nbChuBz59tqDGHW7ti51jjCESLtab1Xofv5KTVPXKys/vS5jIkvHp0Z8uF6cIHWwao5V2uuwIyt7Sb3jRoHjcKV5wyW3JgwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 02:02:18 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 02:02:17 +0000
Content-Type: multipart/alternative;
 boundary="------------B0mUtsRzN8yRKPINZvpCefSs"
Message-ID: <b431a35c-63eb-41ed-907b-84db66432cc7@windriver.com>
Date: Wed, 20 Nov 2024 21:02:13 -0500
User-Agent: Mozilla Thunderbird
From: Randy MacLeod <randy.macleod@windriver.com>
Subject: Re: [meta-virtualization] Canonical LXD on Yocto
To: kev.ferber@gmail.com, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <CAERRtEuXxxZcjs0fGovUhF_dufQeco7dNM=zaU5aFJ9baoszog@mail.gmail.com>
 <CADkTA4N5eTYG8aTbjBfRspdR-25+0a3aFSGnjR_y63d8b+mtxA@mail.gmail.com>
 <CAERRtEukEAPrG87yduFEk=r1TzdakJqitdiR94Wsd+UUWxu5sQ@mail.gmail.com>
Content-Language: en-CA
In-Reply-To: <CAERRtEukEAPrG87yduFEk=r1TzdakJqitdiR94Wsd+UUWxu5sQ@mail.gmail.com>
X-ClientProxiedBy: PH8PR22CA0009.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::25) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|BY1PR11MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 752b1de7-0e7e-490a-a66d-08dd09d086cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NUxNVnpDSDVlbzZTTWxyT3d2K01HTjM2OW5GTmxNcVp1QXM1MXl0L2lldE1F?=
 =?utf-8?B?OHd1SXR6N0t3NzJMb1dlZzNnQm5MbDJmejd3N3lZZzBuRTg2aU9LcDVLUGdu?=
 =?utf-8?B?NjdyUlNCd1lxKzRib0xhL2JUeGN3cDFEUkkrVEE5TjJ5cVBPa3E0WDlkNjVi?=
 =?utf-8?B?VUhTMDlocmlBamJJaFFOVjZOQnA1ZDJuY2pHb2RjN0FWM2Vad2hVWC90Qm1U?=
 =?utf-8?B?VjFaMEx0eXhleHF6aFVoVlVwWC9BbCtyRlR5djg0U1pXTURNaXoxckZpc1Rl?=
 =?utf-8?B?bGJ0MCtEUGZYcTdTR2FKdm9aSDJjSDJTU1NFNllXT08wbU5vaTN1QWRzRUcr?=
 =?utf-8?B?MERkUEJTejdKd2V6c0JvZFZuV3lZNDVWakZqcDBuSjh3VCtUM2VvV0dMRndJ?=
 =?utf-8?B?K29XQ09na3ZqV0NrRGZCeXZzbHExbklBNWdpZ1VxRFJ6Q2tRTmpEZ3pCL0g2?=
 =?utf-8?B?MktqYThWR2N5aDhlRVdINzRGa1JuSUhLRHArVEUrSkc5UVdGVHFGZzNMbWlp?=
 =?utf-8?B?KzdET2taYXBNdG9zemxuMmFoYXRlOS93bFRRcUROV09HQjFEWm8rQStsbVFW?=
 =?utf-8?B?LytHSC9aWW1pejB6cXc5N3RXdXJTVmdKQWpyWXlMMTQ0REdSejZPZzJLdzlW?=
 =?utf-8?B?SkF3OFk0eGlmYWlSYzJsNUx3TDFtMnAyRU5RcnZwNjNKSFJ6dVhIQ3lFWmxv?=
 =?utf-8?B?S0dyZUk3QVVHRTlzKzJCcS96b1NzV0xwZWpUYklBeVVCNVZHUDIzWXJDK2w5?=
 =?utf-8?B?OEhQNVg0UkdKM0lTSk5UYlhKWkVybmlDMWYvV1ZucWdxR2hYeEpaUThuQ3NB?=
 =?utf-8?B?dzNkdG1SK0N3NjJDK2s1QlhtTEtWRXowMUZPTzBad3RDc0ZOZE5JazVtOExF?=
 =?utf-8?B?MDJKanE5RXk3RzRoMlhNRkdDL0lYZXRqS0ZYVy9UWjFQYi81UXgyRFllOWlP?=
 =?utf-8?B?NXBCcXRGd2g3cHZOTDlncE1GQSsrS3k0Z3JPTGRmQ1pGZFpTcHBZUk5TZmlh?=
 =?utf-8?B?cXBpRloyd3d6dzFGQ20xRDJWRUtxcWdZbncrL3daOThGNXlTV1pJclhRZGpN?=
 =?utf-8?B?eDYzdkhwR0UvWUMzcXYzVTRSV1BJRUpYdldoUE1sZllXc2FLMENCMlpsOFo1?=
 =?utf-8?B?M09vRnY0Tm40QitvTjdPOXJNK2I2Q0doTHFOWlA0WVQvckp1Y2lSUmJNVlJT?=
 =?utf-8?B?QUxpbXRpWWIyTTFHY3VNSjdrMHNlQ29pUVBQMVZ3QzRyR0ZRZmpFTVk3bzY4?=
 =?utf-8?B?aEtmaWdEMFh5WEo5MEhLUDlFb0pydXpNaFl4TmQvWUc0WFloVHNXUzA3UG8x?=
 =?utf-8?B?cm56VURtbjV3Tm9KSGdvU1I2dUhLbFhXa08vYVZZcjVDUWN1cUFsa3QxK1FD?=
 =?utf-8?B?TnppcmVPY2ZxWXhlc2I2Mm1hL2JDb0dXcXh2MTk3aUd2ei9uWDhYaVQ0ZWJ5?=
 =?utf-8?B?eHBrbk95Y2xFWUtsMEUwWnk1RUg3cHBua1ZsbkhienB5Nk9XbkR6Uk5zV2VY?=
 =?utf-8?B?QzBKMUlaMEdFM3pMalJQdnRHMWlRVWZiTENYRy9BdWduUm9mcFZ6bkh3Y0M2?=
 =?utf-8?B?WHJSWXFhRWZaNmtTMHNSaDhYMmRxditNNzJPSmZJVnFhaE9uaWMyY0ZxTmgw?=
 =?utf-8?B?NFRuQ216SUl0VEpqOW9mOVhLclJoR1JoT21DNk1TQ0NXYnR4UTNWSlFJYnVw?=
 =?utf-8?B?QW55OEQyTkVsS0pkNGo4R3Zkd1hmeGhTRVoxenFsbUZLTjF0NTNKWHJnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bklDYUU0Y0pRQzdVbDhiNjZOOVpEbDJtQ1dYald0Vmd2dEhLazhLVUdJZ0Rw?=
 =?utf-8?B?SWJnOUtZOVJONjhncExUY29uS2FrTklxVFFydkZwbjlkMkhxNFpFTFVhVSs4?=
 =?utf-8?B?cTJHMi9jTW5CTHpNYWNMQVkwMTV0b2JLMXZ5WDZIVTJlN09WOUhhaXZEL3pR?=
 =?utf-8?B?am0zWC9LVndseHdiT0QyVFlDeW9NRElhTDU2V3FsbU5Ma2M2Q0F2dXF5bUxn?=
 =?utf-8?B?b0IwRnNaOURKamtmZk5RSW1od2trVWFxS1l4UDNPQllSeHZzeDlyeWswamVn?=
 =?utf-8?B?dnJ4RTlqb2lEVnZOZzlHMUhvR25YWk05Y2I3Y2pFeDljeHFnNWpvazRVczRV?=
 =?utf-8?B?QkIxd2d5cE5GS1Y5SlZjL3BIWVBObDQ0WjZyMDdDWCtxcjlWVFVEWmZhdUlL?=
 =?utf-8?B?YjhEL1JpbjVOMnk3VG5UNXJZdXpDVmFDRmZVTFV1cTYxb0tRdC90WmlqN3A1?=
 =?utf-8?B?NlBqNmtlRG91M0w4aVoxZk9uT29YZFpQRkpBS3dzRUczSGxLVkRycld2Ryth?=
 =?utf-8?B?b1Z6STVoK2FyOWZDRWYvYkhjNE9YZkhHMDRBcU5uY1I5dmtjUXg0RjBlQlhr?=
 =?utf-8?B?SUlsT1ovQkMrYmxYNW9OY1BqaEVaWVFGejJISk9ma3E1ZUYvOFVzTWRhWmcz?=
 =?utf-8?B?WWNQUWxndGVOQ2hMaStDS01oeXEvcGFYaUVUOWdxQnZYeGpNWUFlUUxid2Vx?=
 =?utf-8?B?THU5NEV5VGpYNDFiQVp4SXpvSHJlUCtwUVpBTGY1citUdVc3L1RtVXdHUGRx?=
 =?utf-8?B?L0Q2bkI5eVpxWlpNMEVZWnhCL29Gb01XTmtHSXkxVG9jQlpFTE13eVFnWXlv?=
 =?utf-8?B?dUM1Mldud1JIZnMzQ0dFQkpRYWRPWXpkZTRqcEFFVTRLd0hidFBDSDdoSmRv?=
 =?utf-8?B?VTN5TWdoRFcrMGFZSTdSY09OVjhXbVZTbEFqczVtTmlMQlU2Ymt4TmRQQldB?=
 =?utf-8?B?UDU0UmZpeDVsS0p4d1UzNVcvTnFuL2RtWURzcW0zaUUrTWdNYmljaEZpVGV6?=
 =?utf-8?B?ODQyTTR5U3lNQkxSQ01BRzI4bStydnhFTVFTZWxneHFiVjg5akFtRWFzTjU1?=
 =?utf-8?B?bVBCZWlFdS9uWGYrU1ZaNHRWVTBEMzlsb1Q3bFZmMy96SFRZWUZ1UWRtOEhm?=
 =?utf-8?B?TGJoZ3h2OWk2UjdjUEsyQi9lZ0dzSHl2elV0Y0tuYzl4ZUpWUjVYdnlVWHU3?=
 =?utf-8?B?YzZjaFVDbXptSlZsTUFyQjBjZi82eC94akkrZlV5M1VBWkZ1S3JTUk8yNjFI?=
 =?utf-8?B?UjJWczl5emRQOUdxaVJUYi9rbHpuOENPOXd5cE9KekxFampOdStLcGpwUmZj?=
 =?utf-8?B?UVZrYkowLzNLclBhT0R3TXVwcmVXaU0vZ2JTMHFDd29QNHJZNk1KbW5pMGUw?=
 =?utf-8?B?YktuY0dKTW00Z2xhblE4bFh2eHFXVk0zVG5FdjR4ajB5czVlbnFaTnJrTVYr?=
 =?utf-8?B?eUhKRUdmMFJVNG9rNFVsaVMwLy9zbXY2NWxoaTJReFptblZlTFVReGJFWTNI?=
 =?utf-8?B?Y1hMRnlINXVvRnBSazY2NktyVkpkcXU4UWdLQkF4bHR4bllrRWw3S0grbHV6?=
 =?utf-8?B?VWFJT042Mi9McnFGYkJCYVNGa1dxYUdoc2t4STlvL3lWdEM0bHIrc1BZL3BN?=
 =?utf-8?B?b3QxbFRFbFlHbkdWWFZHRWdMZVlieXhqZytxSDlteFQzUy9vaDBiS0J6aDhE?=
 =?utf-8?B?Y1ZXT2s2eHNxSHRyR1ZiOUI1TlByS3c4NmEvcFhXeDlib1lSdE9OMUw2VnQr?=
 =?utf-8?B?bm10TWcwdHI5ZWtUK1hmSVdrbjA5TWpFTjJ3MzdobTB2UDFhSytTQXpmWlBY?=
 =?utf-8?B?TU5YYSsyNW8ySEdMOHV0VzVydWxkakJGNlYybk5Ca3ZlZmZrZTVkRkM5RmFN?=
 =?utf-8?B?aWtvSzJaakRiMmR5Qno4WklvbVFDR08yeGVmM2w3Tm0zRE5ITlpvSnlnN1o5?=
 =?utf-8?B?NXF5U2NGK2l6N0VCby9MeHduRE94REZPQy9KZHR2Z3RKazVlc3FDWThicHZG?=
 =?utf-8?B?ZzVVMU9TMDhNRmRESm5ydEpiUWR4UHdrK2ZUcUJIdy9kSU5oR3lsMFZnMzhh?=
 =?utf-8?B?K1ExQVJvcVFWaTk1OUh4MnJ1Z1pXQ0xiamVCdGtac25lMFN0dkJVQ1ZHWFND?=
 =?utf-8?B?WXFRWkZWMmR3eW5KY1RqT284VVdqeXFTR2gzVzcyQzErOXBrZ0JyQ1FHLzdV?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752b1de7-0e7e-490a-a66d-08dd09d086cc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 02:02:17.8286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEOlC2ze4Xb9v/gGyIVMFquZrb+SOoeK9PglG94Gm/trlbH/K9LVgVZAdyj0sZHLMBvHBvFJWKvUZ7q2Zty04E0q5jRN5dGu74IHyED0EXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8031
X-Proofpoint-GUID: xLxgfQNcD6W7VGOVvzGdW0oAnalIztdh
X-Authority-Analysis: v=2.4 cv=R6hRGsRX c=1 sm=1 tr=0 ts=673e94af cx=c_pps a=bqH6H/OQt14Rv/FmpY1ebg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=8pif782wAAAA:8 a=7QyriEpAAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=HQAB4KzgvTF9zDVaDqMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UmjbJbPkT_s3987aaBwA:9 a=NcSnoFq7o2fwxrOh:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=pwq3ROT0nMnQUTg0Q3_8:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xLxgfQNcD6W7VGOVvzGdW0oAnalIztdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_01,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411210015
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 02:02:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8985

--------------B0mUtsRzN8yRKPINZvpCefSs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AKMQ8F1010300

On 2024-10-10 10:43 a.m., Kevin Ferber via lists.yoctoproject.org wrote:
> Hi Bruce,
>
> it would be really great if you could share the recipe with me, even=20
> if it is only partially finished.
>
> I've only just started working with Yocto, so it would be good to have=20
> a starting point.
>
> Kevin

Getting caught up on old email...


Would "incus" would be a better idea than lxd, at least for master:

https://github.com/lxc/incus

Incus, which is named after the Cumulonimbus incus=20
<https://en.wikipedia.org/wiki/Cumulonimbus_incus> or anvil cloud=20
started as community
fork of Canonical's LXD following Canonical's takeover=20
<https://linuxcontainers.org/lxd/> of the LXD project from the Linux=20
Containers community.

https://discuss.linuxcontainers.org/t/incus-6-7-has-been-released/22099


I only just heard about incus on LWN today but the interactive demo was=20
cool and worked well:
https://linuxcontainers.org/incus/try-it/


Thoughts?


../Randy


>
> Am Do., 10. Okt. 2024 um 15:03=C2=A0Uhr schrieb Bruce Ashfield=20
> <bruce.ashfield@gmail.com>:
>
>     I have some partial work on it that I did about a year ago.
>
>     I never did finish the recipe, since there were runtime issues and =
no
>     one was asking for it :)
>
>     It is something I'd like to have in meta-virt (the fact that someon=
e
>     made an entire separate layer for it .. just makes no sense).
>
>     If you do work on it, please contribute it to the layer. Or it is
>     something I can pick up in a few weeks and perhaps get some assista=
nce
>     in validation.
>
>     Bruce
>
>
>     On Thu, Oct 10, 2024 at 8:52=E2=80=AFAM Kevin Ferber via
>     lists.yoctoproject.org <http://lists.yoctoproject.org>
>     <kev.ferber=3Dgmail.com@lists.yoctoproject.org>
>     wrote:
>     >
>     > Hi all,
>     >
>     > does anyone worked on a recipe for LXD.
>     >
>     > We are in the process of moving from Ubuntu to Yocto Scarthgap
>     because we wanted to use the OTA functionality of RAUC.
>     >
>     > Now we are faced with the challenge of successfully compiling
>     LXD, I have looked at an old unofficial layer
>     (https://github.com/fcuringa/meta-lxd) for reference, which of
>     course no longer works with more recent LXD builds.
>     >
>     > Best regards
>     >
>     > Kevin
>     >
>     >
>     >
>     >
>     >
>     >
>
>
>     --=20
>     - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>     thee at its end
>     - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8927):https://lists.yoctoproject.org/g/meta-virtual=
ization/message/8927
> Mute This Topic:https://lists.yoctoproject.org/mt/108927978/3616765
> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------B0mUtsRzN8yRKPINZvpCefSs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AKMQ8F1010300

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-10-10 10:43 a.m., Kevin Ferber
      via lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAERRtEukEAPrG87yduFEk=3Dr1Tzda=
kJqitdiR94Wsd+UUWxu5sQ@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">Hi Bruce,
          <div><br>
          </div>
          <div>
            <div>it would be really great if you could share the recipe
              with me, even if it is only partially finished.</div>
            <div><br>
            </div>
            <div>I've only just started working with Yocto, so it would
              be good to have a starting point.&nbsp;</div>
          </div>
          <div><br>
          </div>
          <div>Kevin</div>
        </div>
      </div>
    </blockquote>
    <p>Getting caught up on old email...</p>
    <p><br>
    </p>
    <p>Would &quot;incus&quot; would be a better idea than lxd, at least =
for
      master:<br>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/lxc/i=
ncus">https://github.com/lxc/incus</a></p>
    <p>Incus, which is named after the <a href=3D"https://en.wikipedia.or=
g/wiki/Cumulonimbus_incus" rel=3D"nofollow">Cumulonimbus incus</a> or anv=
il cloud started as
      community <br>
      fork of Canonical's LXD following <a href=3D"https://linuxcontainer=
s.org/lxd/" rel=3D"nofollow">Canonical's
        takeover</a> of the LXD project from the Linux Containers
      community.</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://discuss.linuxco=
ntainers.org/t/incus-6-7-has-been-released/22099">https://discuss.linuxco=
ntainers.org/t/incus-6-7-has-been-released/22099</a><br>
    </p>
    <p><br>
    </p>
    <p>I only just heard about incus on LWN today but the interactive
      demo was cool and worked well:<br>
      &nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://linuxcont=
ainers.org/incus/try-it/">https://linuxcontainers.org/incus/try-it/</a><b=
r>
    </p>
    <p><br>
    </p>
    <p>Thoughts?</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAERRtEukEAPrG87yduFEk=3Dr1Tzda=
kJqitdiR94Wsd+UUWxu5sQ@mail.gmail.com"><br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">Am Do., 10. Okt. 2024 um
          15:03&nbsp;Uhr schrieb Bruce Ashfield &lt;<a href=3D"mailto:bru=
ce.ashfield@gmail.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-fre=
etext">bruce.ashfield@gmail.com</a>&gt;:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I
          have some partial work on it that I did about a year ago.<br>
          <br>
          I never did finish the recipe, since there were runtime issues
          and no<br>
          one was asking for it :)<br>
          <br>
          It is something I'd like to have in meta-virt (the fact that
          someone<br>
          made an entire separate layer for it .. just makes no sense).<b=
r>
          <br>
          If you do work on it, please contribute it to the layer. Or it
          is<br>
          something I can pick up in a few weeks and perhaps get some
          assistance<br>
          in validation.<br>
          <br>
          Bruce<br>
          <br>
          <br>
          On Thu, Oct 10, 2024 at 8:52=E2=80=AFAM Kevin Ferber via<br>
          <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" ta=
rget=3D"_blank" moz-do-not-send=3D"true">lists.yoctoproject.org</a>
          &lt;kev.ferber=3D<a href=3D"mailto:gmail.com@lists.yoctoproject=
.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fr=
eetext">gmail.com@lists.yoctoproject.org</a>&gt;<br>
          wrote:<br>
          &gt;<br>
          &gt; Hi all,<br>
          &gt;<br>
          &gt; does anyone worked on a recipe for LXD.<br>
          &gt;<br>
          &gt; We are in the process of moving from Ubuntu to Yocto
          Scarthgap because we wanted to use the OTA functionality of
          RAUC.<br>
          &gt;<br>
          &gt; Now we are faced with the challenge of successfully
          compiling LXD, I have looked at an old unofficial layer (<a hre=
f=3D"https://github.com/fcuringa/meta-lxd" rel=3D"noreferrer" target=3D"_=
blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://g=
ithub.com/fcuringa/meta-lxd</a>)
          for reference, which of course no longer works with more
          recent LXD builds.<br>
          &gt;<br>
          &gt; Best regards<br>
          &gt;<br>
          &gt; Kevin<br>
          &gt;<br>
          &gt;<br>
          &gt;<br>
          &gt;<br>
          &gt; <br>
          &gt;<br>
          <br>
          <br>
          -- <br>
          - Thou shalt not follow the NULL pointer, for chaos and
          madness await<br>
          thee at its end<br>
          - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
        </blockquote>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#8927): <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8927">https://l=
ists.yoctoproject.org/g/meta-virtualization/message/8927</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.yoctoproject.org/mt/108927978/3616765">https://lists.yoctoproject.org/mt=
/108927978/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-vi=
rtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@list=
s.yoctoproject.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.yoc=
toproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org=
/g/meta-virtualization/unsub</a> [<a class=3D"moz-txt-link-abbreviated" h=
ref=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a=
>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------B0mUtsRzN8yRKPINZvpCefSs--

