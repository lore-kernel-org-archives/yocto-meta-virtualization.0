Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75971C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 03:26:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12257.1718767563506797007
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 20:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6900ab20e8=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J1e27p023145;
	Wed, 19 Jun 2024 03:26:02 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yujb7062q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 03:26:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPjm85HgfLBwkq9HyrTbl+EEjAiRXiU+/LHvaAlUeA0emO/JR4P7XWrHXhuBF7DUIE9Vc4LcFTacZKlgpw9dzfv3AoPRAmUG3+G4zuOhTZvEghO5e8ZEQoTOdG8i1LTJLLPzWYX+vz7Go693rd9KXZ5yx6AgWYRODYjHXOSsTIz2t6qWfUP2XEoUC2NoOPKWSX2J2C6sUJtd9vD/PzPELXwhUmP3tEpfiq+YapLBCvbnwLkEPGaSphoAS2wAt+v/RLMl7q2ACL5O4wUGJvht6YTFeIw8auhxyo67DvucUX8pr4RXO3gp82BZLKbVrTUjPg7PmHok2+fmml08Zv3S9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LGh6WdMrd4QKOFbx1GH720qVLuIP/xRHUouDcZ2NgI=;
 b=FEMO6Gxdh2AO5KPiNXulfGYqNatnICuWqtqmrvUfXPBkZu+rzPJd4Ay/N92dUSsAn6ltDCHV3SxC/S+tfzWWvGgvUEIMMWh71DLjLMNIWmhwD5JuCl7D4SqS4KDGDQ3vfzVDCyALMFyaWxnbXD0ruDGY4qgrpjZm31YMUoD4IZ1mp2D1vKl1Zu5xKu1RNSOJvJg7NW0BJ5VUg6qJ41yTkbm/JRy3esBuw6+VzGPlCPvFhN1ThzeKaKLK461DE3R3Fd3BTHvehhWAjGgZzznR/jM4INUmESMa1P2YucqG9jLrNLd91gHWiZUiiH0qlaabtcbOnRag2ITToijMw4Lc+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 03:25:58 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3%5]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 03:25:58 +0000
Message-ID: <def5a2e2-4a3e-4a9b-8727-7ba841555add@eng.windriver.com>
Date: Wed, 19 Jun 2024 11:25:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] lxc: update to 6.0.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20240418083047.628481-1-xiangyu.chen@eng.windriver.com>
 <17C75EBD44309AA6.15491@lists.yoctoproject.org>
 <CADkTA4Mg_MJSNEzfJTNd8PjHGMxGDO1Tqku9wmsCyTHffdK5FA@mail.gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CADkTA4Mg_MJSNEzfJTNd8PjHGMxGDO1Tqku9wmsCyTHffdK5FA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0348.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::11) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SN7PR11MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8cb99d-93ab-432a-2b54-08dc900f8974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021|4022899006;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NE5QK2ptbFJoWjRhQ0N2M09VSjR1TUJLaUtLS1V6Ym9teHJVS25IVWJ6dkFB?=
 =?utf-8?B?c1htMlEzZTNPejl2cFpGb1Nsb1dMd0tOdEVGWkhrUkFQM1ZGbmVLWW9NMWcy?=
 =?utf-8?B?VzVFR1psWTdrL3o3aTFERTZTSjJHOUQ1Um1XQ2FzNVlQQ2cvMktnRFlhSEFm?=
 =?utf-8?B?dVFOT1Vacm5yL3AwNExRb09qdTZXdEJtR0oybXFDUnc4QjFsUzNGQ2RrZTRx?=
 =?utf-8?B?RFAra3AydHhieWEwY1JNZ3oxbTlnc29MRkQ3WkhjZndJZmdBYzhZajNWazh5?=
 =?utf-8?B?WCt0emNkbGxtbDFmdzlnTURlenN6WlpzNVVpYnp1VEJ4R0c2UU1MQnl2VTNz?=
 =?utf-8?B?N3plYk9pV0cvU2pQeDlMUE5sZXlOREVVR2c5Q1RTZHhEMWNoTndKQWduU1Bq?=
 =?utf-8?B?aElac29ZNmgvWkpXQWNkMFZ5VkE0eklabWFoMzBLUWRsTHhPSldQNXhZZzNU?=
 =?utf-8?B?NHBLZ2dkb290RUdONjRFeCsvUGtxTmEzOWRTZTljUGNtYmtUYjM4UmZLMy9U?=
 =?utf-8?B?eG8yZWN0TytqWnBNU1g0dnFtY3VINHRRRVNUTXFaSWdheHJpcnRZUDhEbjFT?=
 =?utf-8?B?Mm1mWHBtajVTTDVyZDdQRkJBbzA3dkl0UEJRUUNsakNxYWx2ZnFLY2NsZ053?=
 =?utf-8?B?czFqRUVVWkRaK3o4VkhLVW0rZzRsbmZDeDdWSjkzQVVGZ0ltcithTk5mUzBp?=
 =?utf-8?B?WUJIbzJxQzRmc1Z6QWpNVm1Xa0QvaG44MitkVXlyUUEveURjU3pMWEJnYytr?=
 =?utf-8?B?bEgzbTRFWjJGMFVIS3NyZmlCc2FGUGh6R0JjdHBHVnNHdUVMdFlnK2RDaUt2?=
 =?utf-8?B?YUNBUDh2aDI2ODZraW5WVUNJbjRrT3JwRWhuMXB2WFpLSUNlUktnVmJOTE45?=
 =?utf-8?B?TXJ4dGdwZk5SdlBJb0xtNzlEdHNuQ3Vnci9UNVRib09kUitPMjdJeHlNQThI?=
 =?utf-8?B?Yms3WlA2YkQyU28yNHhZYWpqOGdzekEzaHEyMkJWNVFNSVN4bnFEOUpFcGE3?=
 =?utf-8?B?a2dVNElqMmkzeVB4dEdkbFNUZC9Tdll4OVhEUlRBc3JuZG0zS3JiQkszM1hw?=
 =?utf-8?B?SGVZN2JoMHpoM0JyWk5rZzNxb3kxT1JvZ3RybjdnWmloRU96U2xKSzV1aUli?=
 =?utf-8?B?b1pqclVBcXhBQTFsYjZUTUtWQmNTZlJmNGdLNjl0cm9IRUkyYmZTVXI3dDEw?=
 =?utf-8?B?Q0MyZWlIRUNGSlZyRWQ2TElaMlVLZFkyR2V6VDlVQlo2eHBpaTNTNi8vaU9G?=
 =?utf-8?B?ZU4wVGd3Z0tkdUZkc1A0cVdwRFVoMEVTb1ZPam4wZUt2eFYrcXpQbEJ2ZkNN?=
 =?utf-8?B?K1RJNHNKRjdlc2swbmgzOUM5T0ZSdlV2TGl5UUJkL1VlQ0xuNkJ0b0xnL3Y3?=
 =?utf-8?B?a3NXQUJBd2NlRFoxYmlRM1VBM1RVcVpGVDhOOGVoaDhUaDhEUzFUYzJXYWRz?=
 =?utf-8?B?ZVRnMlcyZUFTWkU3RXZ6aGNiMWRtNlNpSGw3VThJRFEvdmtjbzlKZVFQY2l0?=
 =?utf-8?B?cXZIWVhHTzBHMlo3eFZLaC8yK2N5MnFQbEVWSkRLMVRNZ0hEMGp3NS9mbFRz?=
 =?utf-8?B?dWR0ckNSdHQ5K2ZZT2w3MjVDaEx4SENRc2xSNWZrRGtvUFlGWDBHZ083bEFn?=
 =?utf-8?B?dzNyWjVjZkVOd25SZzJWcGlSbHN5ZVZtWi9uMDR6eHpnMjdoRVl4aHRVTVd3?=
 =?utf-8?B?ejBDWWx1Yks4bmJHL0lvaTdkNkFwVUJGSFpnWWp2bjZMTU93MnpPNjdBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021)(4022899006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OFJ4L1pjd3p3QnBRYTdJaFZUTzA5ZENiQzlpSWdZUHdreWJPQ1BLVmg4RkpG?=
 =?utf-8?B?cUNCUnZoV2FqRmV3Y2cyOWNiU1ZCQmpTdzNBcU1rTytGakhrNlFsNGx0L2tB?=
 =?utf-8?B?S0JhYmxDYi9JeVd2aUdVWFZaOE9Qdnhwb2hpQ0xnZFRTaDdVbTYvb0w0K0Z2?=
 =?utf-8?B?SFF4WVJLejJMZHdheWxsQ1FseGZKOEtKVndTOVVRNUNJQUN6eHNhalNCc3Z3?=
 =?utf-8?B?M3RqTGErUlpwL2RsaVlGQ3pHSDBxSkpSc2ZrYWxqK0RYZUtiQjRWWkpaWDFu?=
 =?utf-8?B?dmhaR1NPeFFiL05GRnd0MlR6YmdJOGwzTEtLL3doRk9TSm15alNDZ3dQU1Vp?=
 =?utf-8?B?aU9sQzZ6QnRxTE9ObmpyczNseUlwaTI1UnlubUxlSzJGNE96dVlmMjNBQ2xs?=
 =?utf-8?B?dlViYU5KRjhVUG9zVkdXS3kyOHFaY3MrZXFTRjJ2WGJ4NlRhWkppSWRBWWQx?=
 =?utf-8?B?ekNJZjVLcDZxZm14SlBZcWozYjFHWlR2cHREZkpEREhwZk9HQ3MyTVVPYVgv?=
 =?utf-8?B?aHZraTRNd0FBNmt1bXFTSnBISHlXVUtKMlEyZXk1T3FIZEZCdWJFSkhQK2hr?=
 =?utf-8?B?bVZlM3lZTC9EOEtiYldFNzEybEJ5c0VtMXFVWkJuSlhzQmNnTTY1K1RuVk9D?=
 =?utf-8?B?UG5oaUF2TExoNGE1OGxmTW8wOS85NWpCeWtTdDl2RGcxaFpOb1JFcEtUYjU0?=
 =?utf-8?B?TzQyRC9sRnV4bFVxSWN0c3ZMbXZjWFJ5UUd0QkI5aXpZSmxsL2tSZmpKSWI2?=
 =?utf-8?B?c0ZFRldQQUtyTFZUZDJlT2kyYnJNVDJ0WXBOdEpXay9ldEZ3OFluaWRPSjJn?=
 =?utf-8?B?VDJMaHVtMkRIL0RDc3dWTVBzaTVQaURkSmNSMW9KMHdPN2QwWHlrQ1NjSW03?=
 =?utf-8?B?ZkVpV0pFamRwWFdCL1BRclpnVEN2OGphQmQzQnNFd3FENGhqT3pBYUtuMVJk?=
 =?utf-8?B?bzNHT0ZHZlhlVS9EaEVDWEI2SjFiZHBZYjhpQXpuRytlTitGSUtUR2dnYm5V?=
 =?utf-8?B?UTk2ZmpUSGJDMmlIUWlVUitYb1J2RzQrTzN5cm52b2V4cmgvZmkvRGFBKzNJ?=
 =?utf-8?B?QXNMMVhQcUlTSjJsOEROTFlwcHdwc0ZEa1NWL1FKTW1OSTJ6TnZWTFgzTnQ5?=
 =?utf-8?B?cjdobzdwdWhJL3BkQkhtTElPcFl6bnBhajVTK0JyS3NNOGE0U0xJelVKbExM?=
 =?utf-8?B?NjAxMWdMMHZZbHJLUXMzSUVqYU5EaG5HdHBNNnpvbUxKeWk0UGdQV0pIaS9L?=
 =?utf-8?B?TmEwNGF4ZWppZWNlNlRMSTlHcHJNRVZySDRCcEJ1YVR4MXE4anYvaHBLQlNP?=
 =?utf-8?B?RkZPQ2ROLytPelcrZXVVUFpWWkVDZlVQTjVPTzE1ZXdrUm52U0ZTZHF1enhp?=
 =?utf-8?B?TFVDeEU5RkV3eGxBa0lrSlkvakthdlhob3FIbEZrbDJ4SFMvaVVNMzRGRzFv?=
 =?utf-8?B?RXAvenF0aUpVOVdRK1lqaW40SjlKTXpWa2w2WlIxcFRzUGYrVHFuYjRkay9K?=
 =?utf-8?B?M1dhN3RhSG5rZHovRGsvcE00QW9ib3ZwR0laMXZrL3FZZll2S0RaNUlweDRv?=
 =?utf-8?B?WlhkeUFibDNqMVhFTnpVZ09NczNhNzdhd05hWHdLTTBMeHRnOVR4Mi9wNEVN?=
 =?utf-8?B?SWRET1hKaXVaU3N6TFRxeElVeXVjeFNmTDc2cTd2Y3RJSnA5RTdwU1FNMFhv?=
 =?utf-8?B?TDBGU1NHb2VtN1hKMEpDTXNjQmtwcFdlNStuN3FkNFZ3bTlPd3ZNdCtTUjdr?=
 =?utf-8?B?eVAzWm1kQWM1RTZuR05OYXBMcngxZ3hYeFFLWkJVSXV4YlphZEpIUEw2UGRQ?=
 =?utf-8?B?YmRwVjl3YWJBRlZyZDNZUjVaM3VkaXVCS3Nobkw5L3g0dWVaOVpXQ3B3bXlP?=
 =?utf-8?B?YURCVVE1MW9ZQXdGRjArOU9hVXl5UFg2ZG9IYXNsZnU1MFk0ZXJGL3NNTTM4?=
 =?utf-8?B?R204NTJhMHg1WVhqbTkrQldJQjJWd0NzL0pneVFvR0J6T3dkcUhyK1BvTFAx?=
 =?utf-8?B?NDRyRXZpVE1VRzZNZGFITDZJRDk0bTh6Zjg3OFd4NG1tTnJEM0FJUGRnT3Ew?=
 =?utf-8?B?UmdsL0Z4T1NETWtMSk9qbDV2cmRBUXgxSEwya054TzE0RDg4d3dwRmwyb1hv?=
 =?utf-8?B?UGxFSExBcHBrbDVMTmNCNWRkaUlvNU5hb0JXUVdUa21vZXdwL3dGY29EbVJG?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8cb99d-93ab-432a-2b54-08dc900f8974
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 03:25:58.6534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Jm7uz39WZD1yU074yZd6BeWtxBX0J3tr7pt92Ekc5LJEXKNy8AOu1KmMdQJHCgFOGwmTJhG5CLD4D8BWreLd+N2uhVms4X2nGRc0+t1iRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7601
X-Proofpoint-GUID: ty_iCFH8Z3aGnH44MtoXZ-Lubt4R3IHC
X-Proofpoint-ORIG-GUID: ty_iCFH8Z3aGnH44MtoXZ-Lubt4R3IHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_08,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406190024
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45J1e27p023145
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jun 2024 03:26:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8803

Hi Bruce,


On 5/29/24 21:37, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> As part of my fixing of the UNPACKDIR and other recent breakages due to=
 oe-core
> changes, I did a couple of early package updates. I included lxc, and
> just let my scripts
> do the uprev work.
>
> Could you break the ptest parts out of this and re-submit them on top
> of master-next ?

Sorry for being late, i don't know which keywords triggered my=20
mailfilter to move this message to

another folder. I have submitted a new patch to meta-virt list today.


Br,

Xiangyu

>
> Bruce
>
> On Thu, Apr 18, 2024 at 8:12=E2=80=AFAM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>> I'm not taking any package updates at this time, but I'll look at this=
 when I do go through the next update cycle.
>>
>> Bruce
>>
>> On Thu, Apr 18, 2024 at 4:31=E2=80=AFAM Xiangyu Chen via lists.yoctopr=
oject.org <xiangyu.chen=3Deng.windriver.com@lists.yoctoproject.org> wrote=
:
>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>
>>> Changes:
>>> 17ac6f691 lxc.spec: Align SPDX license id
>>> 5fe2de84c Makefile: Align SPDX license id
>>> 97f93be72 meson: Align SPDX license id
>>> d4cd3741d COPYING: Clarify licensing of files without SPDX
>>> 8e67eb07c doc: Add SPDX headers and remove Author field
>>> cb94edf53 src/include: Add SPDX headers
>>> 7bc33ef6e src/tests: Add SPDX headers
>>> 007642c89 hooks: Add SPDX headers
>>> 1e9e66be3 lxc.spec: Clear default changelog
>>> 202d649d1 lxc.spec: Use SPDX
>>> 85abd4026 template: Use SPDX
>>> a074b3d27 config/yum: Use SPDX header
>>> 7ed43e5e9 COPYING: Remove whitespace
>>> 522721216 MAINTAINERS: Remove Dwight from the maintainer list
>>> 08bf8b9e2 lxc-checkconfig: Fix shellcheck
>>> 0f18db543 lxc-checkconfig: Show namespace limits
>>> f71b8e3f8 lxc-ls: list names with whitespaces in `--active`.
>>> 816b8973d lxc/tools: set default log_priority to ERROR
>>> 989ea3969 tools/lxc_autostart: don't fail when there are no container=
s
>>> dc4df2335 lxc/lxccontainer: specify file mode in open() call inside m=
od_rdep
>>> 630b46ed2 lxc/confile: do not print excess space before scale suffix =
for time.offset.boot
>>> 796f2ccb7 lxc/confile: do not print newline symbol in getter for lxc.=
time.offset.*
>>> dcc4fb929 tests/parse_config_file: fix some typos
>>> 6fea67429 tests/parse_config_file: add tests for lxc.time.offset.*
>>> ad8f55445 tree-wide: replace multiply_overflow with check_mul_overflo=
w
>>> 4464cee19 lxccontainer: rework copy_file()
>>> 9d1aa932d lxccontainer: improve mod_rdep()
>>> 81c1bbf45 Revert "lxccontainer: fixes"
>>> 82fe01821 src/lxc/syscall_numbers.h: drop define -1
>>> 590a95d83 rexec: Avoid invalid free in rexec failure path
>>> f9978b179 README: Correct 'armvl7' to 'armv7l'
>>> 046b63cd2 unshare: simplify lookup_name
>>> 7452ee8ab lxc-unshare: fix an buffer overflow issue in lxc_unshare
>>> e88883445 lxc-net: Enable IPv6 by default
>>> d78ca00bc tests/meson: attempt to fix ossfuzz builds
>>> d18f993b3 github: master -> main
>>> 86799f554 meson: link with liblxc dynamically everywhere if possible
>>> b90fecfda network: use IN_LIBLXC
>>> 9eee450d2 storage_utils: move get_fssize to utils
>>> 6eb0a73e2 storage_utils: unhide and rename is_valid_storage_type to l=
xc_is_valid_storage_type
>>> 42eeffcb0 confile: unhide lxc_config_parse_arch() helper
>>> 9bb318881 conf: reorganize/split code to utils.c
>>> 863c59dc3 conf: reorganize/split code to idmap_utils.c
>>> b7591ad49 confile: unhide lxc_config_define*() helpers
>>> f14656ebf meson: introduce IN_LIBLXC preprocessor macro
>>> 672b2172d confile: move lxc_fill_elevated_privileges() to tools/lxc_a=
ttach
>>> 8f9733d75 tests: remove old and broken cgroup handling code from test=
s
>>> d51ea224e config: apparmor: add AppArmor profile for lxc-copy
>>> 627bb9460 tests: lxc-test-usernic: use iproute tool instead of brctl
>>> df0665b6d oci: resolve cross-filesystem blob caching failure
>>> ec85e5ca4 lxc-test-usernic: drop cgroup handling
>>> 27ec0b0f6 test-usernic: don't use ifconfig
>>> 44e845b3c Add x32 to the list of recognized architectures
>>> 07e3a516e lxc-download, lxc-local: preserve xattrs on unpack
>>> 9ac7c4895 tree-wide: use container_uses_namespace() in less trivial c=
ases
>>> 64341ce7b tree-wide: use container_uses_namespace() helper
>>> 6b40e66c1 Fix error message.
>>> c8189ee2a Add verbose output in download template.
>>> 84cc3155a Align columns in lxc-download.in template
>>> 872db5424 build: add more options for customizing install
>>> df17ac417 Add loongarch64 support
>>> 112d5615e build(deps): bump actions/upload-artifact from 3 to 4
>>> 789457f1a config: try to create workdir if not exist
>>> 86f5c1226 lxc-local: Add --no-dev option to exclude /dev from the fst=
ree
>>> f885a3c56 lxc-local: Re-organize code to use more functions
>>> 7c025072e lxc-local: Improve usage info
>>> faa38a197 lxc-local: Change LXC_CONFIG to LXC_METADATA to match args =
and be more clear
>>> d65fe1b27 Disable IPv6 link-local addresses for bridged veth
>>> 8cff8fa1a don't try to delete vlan 0 from veth
>>> 0e932812a conf: fix ephemeral copies
>>> abffab441 config/init: Drop upstart files
>>> 79a4a3cf8 doc: remove the warning mentionning upstart
>>> 7bf1695d0 hooks/ubuntu-cloud-prep: remove upstart handling
>>> fb73c18d2 meson: Remove support for upstart
>>> cc6819c69 reset root_nsuid_map and root_nsgid_map when idmaps is clea=
red
>>> a87d6fcc9 lxc/checkconfig: use multiline `echo`
>>> f3e01fa80 lxc/checkconfig: replace `echo -n` by printf
>>> ba4f810bc lxc/checkconfig: minor cosmetic change
>>> d52c345c8 lxc/checkconfig: avoid subshell (SC2235)
>>> f84f03d1d lxc/checkconfig: remove superfluous (..) around test comman=
d (SC2234)
>>> 74b9faa64 lxc/checkconfig: check exit code directly (SC2181)
>>> 5cc69e440 lxc/checkconfig: replace `! -z` by `-n` (SC2236)
>>> a4684eb11 lxc/checkconfig: add missing quotes to please shellcheck
>>> 8a611c0b2 lxc/checkconfig: remove some unneeded `echo -n`
>>> cb2574319 lxc/checkconfig: replace `type` by `command`
>>> 003efe6db lxc/checkconfig: replace `cat | grep` with `grep`
>>> adadfa372 lxc/lxccontainer: fix do_lxcapi_set_timeout retval
>>> c02367e59 containers in the FREEZING state also need to be unfreeze
>>> aca53bcf7 build(deps): bump actions/checkout from 3 to 4
>>> 84169158f lxccontainer.h: Move new fields to the end
>>> e2696df93 Remove references to LXD
>>> 7cec54455 Update console perms to 0600
>>> 3f45443fd Fix start api call to split quoted strings in execute or in=
it command.
>>>
>>> Local patches modification:
>>> Removed two patches due to they are available in the code:
>>> 0001-lxc-test-usernic-drop-cgroup-handling.patch
>>> 0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch
>>>
>>> Refreshed templates-use-curl-instead-of-wget.patch
>>>
>>> Ptest modification:
>>> Released lxc-test-shutdowntest and lxc-test-state-server due to
>>> those back to normal
>>> lxc-test-no-new-privs and lxc-test-checkpoint-restore are
>>> broken test, already reported to upstream[1][2], move them to blackli=
st
>>> until upstream fixed them.
>>> lxc-test-usernic always fails when use ptest-runner, but normal with
>>> run-ptest by manual.
>>>
>>> Ref:
>>> [1] https://github.com/lxc/lxc/issues/4296
>>> [2] https://github.com/lxc/lxc/issues/4435
>>>
>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>> ---
>>>   ...xc-test-usernic-drop-cgroup-handling.patch |  61 -----------
>>>   ...-and-broken-cgroup-handling-code-fro.patch | 103 ---------------=
---
>>>   recipes-containers/lxc/files/run-ptest        |  12 +-
>>>   .../templates-use-curl-instead-of-wget.patch  |  13 ++-
>>>   recipes-containers/lxc/lxc_git.bb             |  10 +-
>>>   5 files changed, 20 insertions(+), 179 deletions(-)
>>>   delete mode 100644 recipes-containers/lxc/files/0001-lxc-test-usern=
ic-drop-cgroup-handling.patch
>>>   delete mode 100644 recipes-containers/lxc/files/0001-tests-remove-o=
ld-and-broken-cgroup-handling-code-fro.patch
>>>
>>> diff --git a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-=
cgroup-handling.patch b/recipes-containers/lxc/files/0001-lxc-test-userni=
c-drop-cgroup-handling.patch
>>> deleted file mode 100644
>>> index 162e8f9d..00000000
>>> --- a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-=
handling.patch
>>> +++ /dev/null
>>> @@ -1,61 +0,0 @@
>>> -From ec85e5ca4953292c4341497704ce738669a79b64 Mon Sep 17 00:00:00 20=
01
>>> -From: Serge Hallyn <serge@hallyn.com>
>>> -Date: Fri, 2 Feb 2024 10:41:11 -0600
>>> -Subject: [PATCH] lxc-test-usernic: drop cgroup handling
>>> -
>>> -This stuff is not needed in a modern systemd based system, and in fa=
ct
>>> -breaks.  It would probably be better to detect such a system so that=
 a
>>> -non-systemd box can still run this test.  But I'm not sure what woul=
d be
>>> -reliable.
>>> -
>>> -Upstream-Status: Backport from
>>> -[https://github.com/lxc/lxc/commit/ec85e5ca4953292c4341497704ce73866=
9a79b64]
>>> -
>>> -Signed-off-by: Serge Hallyn <serge@hallyn.com>
>>> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>> ----
>>> - src/tests/lxc-test-usernic.in | 28 ----------------------------
>>> - 1 file changed, 28 deletions(-)
>>> -
>>> -diff --git a/src/tests/lxc-test-usernic.in b/src/tests/lxc-test-user=
nic.in
>>> -index 9af8678f3..49fd5e3f7 100755
>>> ---- a/src/tests/lxc-test-usernic.in
>>> -+++ b/src/tests/lxc-test-usernic.in
>>> -@@ -80,34 +80,6 @@ lxc.idmap =3D u 0 910000 10000
>>> - lxc.idmap =3D g 0 910000 10000
>>> - EOF
>>> -
>>> --if command -v cgm >/dev/null 2>&1; then
>>> --      cgm create all usernic-user
>>> --      cgm chown all usernic-user $(id -u usernic-user) $(id -g user=
nic-user)
>>> --      cgm movepid all usernic-user $$
>>> --elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
>>> --      for d in $(cut -d : -f 2 /proc/self/cgroup); do
>>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/=
fs/cgroup/cgmanager/sock \
>>> --                      --type=3Dmethod_call /org/linuxcontainers/cgm=
anager org.linuxcontainers.cgmanager0_0.Create \
>>> --                      string:$d string:usernic-user >/dev/null
>>> --
>>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/=
fs/cgroup/cgmanager/sock \
>>> --                      --type=3Dmethod_call /org/linuxcontainers/cgm=
anager org.linuxcontainers.cgmanager0_0.Chown \
>>> --                      string:$d string:usernic-user int32:$(id -u u=
sernic-user) int32:$(id -g usernic-user) >/dev/null
>>> --
>>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/=
fs/cgroup/cgmanager/sock \
>>> --                      --type=3Dmethod_call /org/linuxcontainers/cgm=
anager org.linuxcontainers.cgmanager0_0.MovePid \
>>> --                      string:$d string:usernic-user int32:$$ >/dev/=
null
>>> --      done
>>> --else
>>> --      for d in /sys/fs/cgroup/*; do
>>> --              [ "$d" =3D "/sys/fs/cgroup/unified" ] && continue
>>> --              [ -f $d/cgroup.clone_children ] && echo 1 > $d/cgroup=
.clone_children
>>> --              [ ! -d $d/lxctest ] && mkdir $d/lxctest
>>> --              chown -R usernic-user: $d/lxctest
>>> --              echo $$ > $d/lxctest/tasks
>>> --      done
>>> --fi
>>> --
>>> - mkdir -p /run/user/$(id -u usernic-user)
>>> - chown -R usernic-user: /run/user/$(id -u usernic-user) /home/userni=
c-user
>>> -
>>> ---
>>> -2.35.5
>>> -
>>> diff --git a/recipes-containers/lxc/files/0001-tests-remove-old-and-b=
roken-cgroup-handling-code-fro.patch b/recipes-containers/lxc/files/0001-=
tests-remove-old-and-broken-cgroup-handling-code-fro.patch
>>> deleted file mode 100644
>>> index bf8df795..00000000
>>> --- a/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-c=
group-handling-code-fro.patch
>>> +++ /dev/null
>>> @@ -1,103 +0,0 @@
>>> -From 8f9733d756361ff8f8d8d589f286c0e064b1195d Mon Sep 17 00:00:00 20=
01
>>> -From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
>>> -Date: Thu, 15 Feb 2024 18:13:05 +0100
>>> -Subject: [PATCH] tests: remove old and broken cgroup handling code f=
rom tests
>>> -
>>> -We have removed the same piece of code in
>>> -ec85e5ca495 ("lxc-test-usernic: drop cgroup handling")
>>> -let's do the same for two other tests.
>>> -
>>> -This fixes autopkgtests.
>>> -
>>> -Upstream-Status: Backport from
>>> -[https://github.com/lxc/lxc/commit/8f9733d756361ff8f8d8d589f286c0e06=
4b1195d]
>>> -
>>> -Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonica=
l.com>
>>> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>> ----
>>> - src/tests/lxc-test-apparmor-mount | 29 ----------------------------=
-
>>> - src/tests/lxc-test-unpriv         | 28 ----------------------------
>>> - 2 files changed, 57 deletions(-)
>>> -
>>> -diff --git a/src/tests/lxc-test-apparmor-mount b/src/tests/lxc-test-=
apparmor-mount
>>> -index 7c9d9ad50..ddf783d4b 100755
>>> ---- a/src/tests/lxc-test-apparmor-mount
>>> -+++ b/src/tests/lxc-test-apparmor-mount
>>> -@@ -119,35 +119,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)
>>> -
>>> - cd $HDIR
>>> -
>>> --if command -v cgm >/dev/null 2>&1; then
>>> --      cgm create all $TUSER
>>> --      cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)
>>> --      cgm movepid all $TUSER $$
>>> --elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
>>> --      for d in $(cut -d : -f 2 /proc/self/cgroup); do
>>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/=
fs/cgroup/cgmanager/sock \
>>> --                      --type=3Dmethod_call /org/linuxcontainers/cgm=
anager org.linuxcontainers.cgmanager0_0.Create \
>>> --                      string:$d string:$TUSER >/dev/null
>>> --
>>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/=
fs/cgroup/cgmanager/sock \
>>> --                      --type=3Dmethod_call /org/linuxcontainers/cgm=
anager org.linuxcontainers.cgmanager0_0.Chown \
>>> --                      string:$d string:$TUSER int32:$(id -u $TUSER)=
 int32:$(id -g $TUSER) >/dev/null
>>> --
>>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/=
fs/cgroup/cgmanager/sock \
>>> --                      --type=3Dmethod_call /org/linuxcontainers/cgm=
anager org.linuxcontainers.cgmanager0_0.MovePid \
>>> --                      string:$d string:$TUSER int32:$$ >/dev/null
>>> --      done
>>> --else
>>> --      for d in /sys/fs/cgroup/*; do
>>> --              [ "$d" =3D "/sys/fs/cgroup/unified" ] && continue
>>> --              [ -f $d/cgroup.clone_children ] && echo 1 > $d/cgroup=
.clone_children
>>> --              [ ! -d $d/lxctest ] && mkdir $d/lxctest
>>> --              chown -R $TUSER: $d/lxctest
>>> --              echo $$ > $d/lxctest/tasks
>>> --      done
>>> --fi
>>> --
>>> --
>>> - run_cmd lxc-create -t busybox -n $cname
>>> -
>>> - echo "test default confined container"
>>> -diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv
>>> -index 8fb9106d6..426add9da 100755
>>> ---- a/src/tests/lxc-test-unpriv
>>> -+++ b/src/tests/lxc-test-unpriv
>>> -@@ -130,34 +130,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)
>>> -
>>> - cd $HDIR
>>> -
>>> --if command -v cgm >/dev/null 2>&1; then
>>> --      cgm create all $TUSER
>>> --      cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)
>>> --      cgm movepid all $TUSER $$
>>> --elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
>>> --      for d in $(cut -d : -f 2 /proc/self/cgroup); do
>>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/=
fs/cgroup/cgmanager/sock \
>>> --                      --type=3Dmethod_call /org/linuxcontainers/cgm=
anager org.linuxcontainers.cgmanager0_0.Create \
>>> --                      string:$d string:$TUSER >/dev/null
>>> --
>>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/=
fs/cgroup/cgmanager/sock \
>>> --                      --type=3Dmethod_call /org/linuxcontainers/cgm=
anager org.linuxcontainers.cgmanager0_0.Chown \
>>> --                      string:$d string:$TUSER int32:$(id -u $TUSER)=
 int32:$(id -g $TUSER) >/dev/null
>>> --
>>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/=
fs/cgroup/cgmanager/sock \
>>> --                      --type=3Dmethod_call /org/linuxcontainers/cgm=
anager org.linuxcontainers.cgmanager0_0.MovePid \
>>> --                      string:$d string:$TUSER int32:$$ >/dev/null
>>> --      done
>>> --else
>>> --      for d in /sys/fs/cgroup/*; do
>>> --              [ "$d" =3D "/sys/fs/cgroup/unified" ] && continue
>>> --              [ -f $d/cgroup.clone_children ] && echo 1 > $d/cgroup=
.clone_children
>>> --              [ ! -d $d/lxctest ] && mkdir $d/lxctest
>>> --              chown -R $TUSER: $d/lxctest
>>> --              echo $$ > $d/lxctest/tasks
>>> --      done
>>> --fi
>>> --
>>> - run_cmd lxc-create -t busybox -n c1 -l trace -o "${UNPRIV_LOG}"
>>> -
>>> - # Make sure we can start it - twice
>>> ---
>>> -2.35.5
>>> -
>>> diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-contain=
ers/lxc/files/run-ptest
>>> index 196adb04..278107d9 100644
>>> --- a/recipes-containers/lxc/files/run-ptest
>>> +++ b/recipes-containers/lxc/files/run-ptest
>>> @@ -12,9 +12,15 @@ blacklist=3D"$blacklist lxc-test-apparmor"
>>>   blacklist=3D"$blacklist lxc-test-apparmor-mount"
>>>   #lxc-test-get_item would report Built without AppArmor support erro=
r
>>>   blacklist=3D"$blacklist lxc-test-get_item"
>>> -# These currently hang so skip them until someone fixes them up
>>> -blacklist=3D"$blacklist lxc-test-shutdowntest"
>>> -blacklist=3D"$blacklist lxc-test-state-server"
>>> +# This is a broken case, also fails on opensuse, already reported to
>>> +# upstream https://github.com/lxc/lxc/issues/4296
>>> +blacklist=3D"$blacklist lxc-test-no-new-privs"
>>> +# lxc doesn't adapt the criu's new mount flag, that cause restore fa=
ils
>>> +# already reported to upstream https://github.com/lxc/lxc/issues/443=
5
>>> +blacklist=3D"$blacklist lxc-test-checkpoint-restore"
>>> +# if we run "run-ptest" under /usr/lib64/lxc/ptest, the result is no=
rmal
>>> +# but it would be failed when using "ptest-runner lxc"
>>> +blacklist=3D"$blacklist lxc-test-usernic"
>>>
>>>   # Tests in firstrunlist will be run first
>>>   firstrunlist=3D""
>>> diff --git a/recipes-containers/lxc/files/templates-use-curl-instead-=
of-wget.patch b/recipes-containers/lxc/files/templates-use-curl-instead-o=
f-wget.patch
>>> index e9af8335..3ef66138 100644
>>> --- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget=
.patch
>>> +++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget=
.patch
>>> @@ -10,6 +10,7 @@ Upstream-Status: Inappropriate [embedded specific]
>>>   Signed-off-by: Joakim Roubert <joakimr@axis.com>
>>>   Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>>>   Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>   ---
>>>    templates/lxc-download.in | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>> @@ -18,7 +19,7 @@ diff --git a/templates/lxc-download.in b/templates/=
lxc-download.in
>>>   index a62ddf482..690307338 100755
>>>   --- a/templates/lxc-download.in
>>>   +++ b/templates/lxc-download.in
>>> -@@ -59,9 +59,9 @@ cleanup() {
>>> +@@ -45,9 +45,9 @@ cleanup() {
>>>      fi
>>>    }
>>>
>>> @@ -30,16 +31,16 @@ index a62ddf482..690307338 100755
>>>          return 0
>>>        fi
>>>      done
>>> -@@ -70,7 +70,7 @@ wget_wrapper() {
>>> - }
>>> -
>>> - download_file() {
>>> +@@ -59,7 +59,7 @@ download_file() {
>>> +   if [ "${DOWNLOAD_VERBOSE}" =3D "true" ]; then
>>> +     echo "Download file: https://${DOWNLOAD_SERVER}$1"
>>> +   fi
>>>   -  if ! wget_wrapper --user-agent=3D"lxc/@PACKAGE_VERSION@ compat:$=
{DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "https://${DOWNLOAD_SERVER}/$1" -O "$2"=
 >/dev/null 2>&1; then
>>>   +  if ! curl_wrapper -L --user-agent "lxc/@PACKAGE_VERSION@ compat:=
${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2=
" >/dev/null 2>&1; then
>>>        if [ "$3" =3D "noexit" ]; then
>>>          return 1
>>>        else
>>> -@@ -176,7 +176,7 @@ while :; do
>>> +@@ -167,7 +167,7 @@ while :; do
>>>    done
>>>
>>>    # Check for required binaries
>>> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/l=
xc/lxc_git.bb
>>> index ee0e442f..379b4ecd 100644
>>> --- a/recipes-containers/lxc/lxc_git.bb
>>> +++ b/recipes-containers/lxc/lxc_git.bb
>>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL2.1;md5=3D4f=
bd65380cdd255951079008b364516c
>>>                       file://LICENSE.GPL2;md5=3D751419260aa954499f7ab=
aabaa882bbe \
>>>   "
>>>
>>> -DEPENDS =3D "libxml2 libcap"
>>> +DEPENDS =3D "libxml2 libcap dbus"
>>>   RDEPENDS:${PN} =3D " \
>>>                  rsync \
>>>                  curl \
>>> @@ -36,7 +36,7 @@ RDEPENDS:${PN}-ptest +=3D "file make gmp nettle gnu=
tls bash libgcc"
>>>
>>>   RDEPENDS:${PN}-networking +=3D "iptables"
>>>
>>> -SRC_URI =3D "git://github.com/lxc/lxc.git;branch=3Dstable-5.0;protoc=
ol=3Dhttps \
>>> +SRC_URI =3D "git://github.com/lxc/lxc.git;branch=3Dstable-6.0;protoc=
ol=3Dhttps \
>>>          file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
>>>          file://run-ptest \
>>>          file://templates-actually-create-DOWNLOAD_TEMP-directory.pat=
ch \
>>> @@ -47,12 +47,10 @@ SRC_URI =3D "git://github.com/lxc/lxc.git;branch=3D=
stable-5.0;protocol=3Dhttps \
>>>          file://0001-template-if-busybox-contains-init-use-it-in-cont=
aine.patch \
>>>          file://dnsmasq.conf \
>>>          file://lxc-net \
>>> -       file://0001-lxc-test-usernic-drop-cgroup-handling.patch \
>>> -       file://0001-tests-remove-old-and-broken-cgroup-handling-code-=
fro.patch \
>>>          "
>>>
>>> -SRCREV =3D "cb8e38aca27a23964941f0f011a8919aab8bebab"
>>> -PV =3D "5.0.3+git"
>>> +SRCREV =3D "3dee5fb88c6f77496dbcab46f31bcd891c9ee4e0"
>>> +PV =3D "6.0.0+git"
>>>
>>>   S =3D "${WORKDIR}/git"
>>>
>>> --
>>> 2.25.1
>>>
>>>
>>>
>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8685): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8685
>> Mute This Topic: https://lists.yoctoproject.org/mt/105594307/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

