Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F4CC02198
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 18:53:49 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.88])
 by mx.groups.io with SMTP id smtpd.web11.20696.1738781625842496714
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 10:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=cPVCezW2;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.93.88, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7aUb5aW97XJRjApiqesRVXXbD2t1JHFHRP3wAbF+mL5KQXBop2OMdPpbSmLYeon2fz0g5FlG5RLk76AmTXMYOMKfhaNUMOmej1GIFyh2X7HfjdAphnPmI46zHBVLLaEpTgMyTX5EKklfZy/MuhHd9aiPpylbRaZ8UxVCrhprWqsNc7JqLoO7pIwDBCtn8lRg+keyeGpnjsBOSAXYwtiVCCSjKyCwO1cSC0tfQ5UoLE2ciTQNe23w13RPR1+/2YWpVbgJW7HzqAGMu/pa8KJUr6UFd0wnTV7X5w4cQf6ozRujYi7T6AsRxKZPKIJkVsNncmbp2LfOBT7uj3sMkNhzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubjjZeUtjTlVeiSI+IkgwvrT/7QlGcZCHDHRysUweVE=;
 b=vSSjrP5biHGyh/f7RVFvc5cY9qMeyuN58TAnMrmYuF2DEjA4EM+lcFdCbjJipiDvA4tnHYcLuugIHEfs28dBY8KgN+dXoHmAgJbOHF/4rBrjLs94A3mgY+swIrZGQnkRC4fSlDeMxsYU3QeKQgazzTI3dX+RMierRFCh74U8EOqQrk2vyQt+h6wcylOOWALtpC1grN+TZYD9iOFQiAxTWbKjIjTxFhR66pbNRjVulwk4ftFUAx15IEEcjSVJkGBnjmv64m8TjTg17X9o0RUssXU11EvYttQ0TOm76Jix5EP/R7FjLQe+IdIbdKJAHMLXK7805zHHXPhxo9cbBFLUwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubjjZeUtjTlVeiSI+IkgwvrT/7QlGcZCHDHRysUweVE=;
 b=cPVCezW29wCI4TAuKWC7n1Zw0dkpVUsBqR7wzep3Ef+7tG6fm5EX2iZSdjYWJiJg2yyjRd9PyDXiM8OEkHp4vCctImw/HTN+rHrNTgTd8JGtugIYZAHawaWROTx4qz/G4tb8KqkG63up0/HUbH8aV0kEuHfVYML0DnSGX9Ot9gY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by SA1PR12MB8985.namprd12.prod.outlook.com (2603:10b6:806:377::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 18:53:42 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%6]) with mapi id 15.20.8422.011; Wed, 5 Feb 2025
 18:53:41 +0000
Content-Type: multipart/alternative;
 boundary="------------eSqVmEk3k0hWlCwxJ6IsN3hw"
Message-ID: <8230c924-4873-4871-aaeb-11a9da4cba90@amd.com>
Date: Wed, 5 Feb 2025 11:53:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][styhead][PATCH v5 2/5]
 xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
To: bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
References: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
 <20241209145442.3291634-3-sandeep.gundlupet-raju@amd.com>
 <CACMJ4GZRusBUrxF-zRywgQhMfT+U_1-FR4yENn7bkZu27zfzgA@mail.gmail.com>
 <CADkTA4NyLmdUTMKFAF6sxKc0_RX83guy5k7Lmkf2ztwBOGxG3Q@mail.gmail.com>
 <181B927D4BEAD936.28939@lists.yoctoproject.org>
 <334a9170-082e-4d0c-8f78-6a640a2c2b2e@amd.com>
 <CADkTA4MWAQ8ux9FYHkfMoRXFheyrvjNrFxVL8Uqt_4uH=L0vPQ@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CADkTA4MWAQ8ux9FYHkfMoRXFheyrvjNrFxVL8Uqt_4uH=L0vPQ@mail.gmail.com>
X-ClientProxiedBy: BN9PR03CA0370.namprd03.prod.outlook.com
 (2603:10b6:408:f7::15) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|SA1PR12MB8985:EE_
X-MS-Office365-Filtering-Correlation-Id: 61decc21-de83-431a-9605-08dd461668b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dGRXSWM3SmRGUjRRWGIvRTl2QWl3U3RUQXpWZDZycjdRZWwraHVZc0RTc043?=
 =?utf-8?B?MVJKY2xjY2x1VXgraCswc1F6RHd2UHZWSXR2U0p2dSt5eGFCayt3RkJCK1g1?=
 =?utf-8?B?RUhLL21XQ1J1WHBpNE9RMWNaMytObE1QVm82NEJEanhIVG9zc0VaQlk4Tkdm?=
 =?utf-8?B?R2ZSY3JNd215TDlpQTI0YkQ5RFBmTjM3MTMxZitxVzcreEE3SnJUeWpSRDYx?=
 =?utf-8?B?TDRQSHpNaSs5TWFHVVZPQ3ZnUHNCUGRBSTByNDhwWXUwM0lIYUsrSmNWL2tK?=
 =?utf-8?B?c1hmUXpCclVtQ1FjR2JVRmpzcXc2VjlKOHNKUXpoaGdCejlZSEs3RGNURks0?=
 =?utf-8?B?SUZOMVg0dm5rVnBPdWQvcHVDdmpPZkJyYlZGc0RoWW80Y0lNNndaU0dZOXdR?=
 =?utf-8?B?aU85SGk5d2p5eTAxS1pyV05uN1dZeEtQRUVqMCs4WlJ3VGpkUVcxcHEwdTlD?=
 =?utf-8?B?MmJGWkFkSTBVU2xCWWtwRFo5aDdUK3Rvdk5kUkdNL0FEWGU2T3pFUEdJZUFr?=
 =?utf-8?B?MitsOXZTRzd2M0hrRHNQV3dWcW9VaVdnRytrcnVsRmlpOUNCaWE0UTd6RGlu?=
 =?utf-8?B?QmlKbHBKLzQraVVrekJ2b2hyZFBHbU41QUorcmhKMHN2UWRKdHhNRXdEd2dy?=
 =?utf-8?B?eDlHd0xRdGkwUkJPZ2MwKzdudWJwaUNGL29lNGRqZis2TGUwM1hnaTZEMzhl?=
 =?utf-8?B?TjRGWVF5dUdsRDNXYUYzdW1BU2xWcmgyNnNzS1pIeXJ5clFBdktkSFQzL0NM?=
 =?utf-8?B?UERqR2V5KzdjL0VOYW91Z011cUZ6QjBTdkxHVlJDZTZJQXcwWjhIdE11ekJE?=
 =?utf-8?B?TzU2czFaVUt2RTdTUG0vUzBxRzc1TkVqT0Z5M01jSUNJUDBTWWtNQXhvUkFV?=
 =?utf-8?B?YTlRWFN2RVdiWW1PQ2s1MU9pM1VOUVFlYktpR0VIZWViRjlMcGhmcCtFdm1y?=
 =?utf-8?B?eTZYMEFOSVhGS1dGRlhuUjVKY2lJT1diU3MvQ21JWjBCWVlKajF6UFlRS1dm?=
 =?utf-8?B?YlRFMEpyZWZXZFlzMFpYZTZYTVY0M0lkMUdYM012NkJYT1NtQmFrMXlXa0RW?=
 =?utf-8?B?UHlONk5HdjB0WHQzQmR4U1NOaDRjcm9McTc5Z3k4NjUyTW9CVVl5WFRLSnBC?=
 =?utf-8?B?aFFlb3ZwY3g3Z1ljUVFudUs0eTFBZjVBL2xCMkNPcmw3RkptcmwxMnZuTUV0?=
 =?utf-8?B?TWVMZVhUbVNBV1hFNU1ldFJFNDdaUVc0dlZUUTU4aFZrdk1TU1NUVWRhUjYx?=
 =?utf-8?B?bzR1OC9yMWovRkJXejd6eE8vdjhJRjRoY2JvOWtNcGxBS0xzZENGZllIMVh0?=
 =?utf-8?B?RzRweGplcTNTYlpxRzAyeWttRWJuSlJ1QUx3WlJKK2x4dC9VdmlVN0poOTVE?=
 =?utf-8?B?NXJzVmdEV0FEZFE4dHJwUWZXMVMybWg1clNYUGRKN1JaOUVEUUdCY3JGOEI2?=
 =?utf-8?B?cFdNMG96SkREYWNlLytkcW5veGZqZ1UweW0yV290Y01DZjhiZ0E5MUhvaXd6?=
 =?utf-8?B?MUdiOElsY3ZieWQ0Y2hMSVpPNFZNeFhzNmpiWVV5cXE5c2xWK1FuV2tuMk12?=
 =?utf-8?B?VmswNFNndDR1OXgyMVdQUUtIVTViMHo3QlNSdXJ4ajU2TmdRdkNLZHEzQi9M?=
 =?utf-8?B?U1B1RWg5R2VLMGlEbG1Ib3VsOUc2NzFUQ0UzQXhQSEppWVFKR0s5Y2M1ZFRm?=
 =?utf-8?B?alVvckgvT1l3OUhIMXAxK2lYWndWWmtVdi9CWUFmRkF5bzBWUDFuZW0rekti?=
 =?utf-8?Q?LAaa99LfWwo4LKSacG9Dm4hEu0zA1IFwIWMYSpE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?czZtS2tIT01LRWNZNUQ5YnU2SDdvNEoveEJKREFJSm04K1FDNE1oaldEQWt1?=
 =?utf-8?B?c1Yzai82MHU2VSttNmh6TUVESnZ1R2k0VTBrSHZWekQ3WG5ERy9acnRaSE1x?=
 =?utf-8?B?bThRUUorTDkzYW5rTVozLzdXVFpRbmlxanFKdmdzemNxaUJTaWh4N280M3JD?=
 =?utf-8?B?Q1ZTTGpLc3JFSVZXNG5uZ250UlZtajNLUDNzUFNVWmZ5VFpsaE1JNHZ4K0h6?=
 =?utf-8?B?dVdZVUc3WEwvamhVR0NlQ1h5T2dkSW9zVlZKampmb0l1aDlsQnZxVTlRZDM3?=
 =?utf-8?B?VXpyTUxXUk96c2xnQVpFSUVEbCtWeDhSNDRTempYcVNuWHQrZVNkV2JKK0lt?=
 =?utf-8?B?Y2txUVRCVTFQVytaU1M1djlVYk9LRTFVL095T3pnSkwvVU5PSEtyUWZVRm9R?=
 =?utf-8?B?anpOdVdsQXprdFB4dXo0TU80aWNrU3VseUcwWVFhM3J1Q1p3Mll5d3RWWmFP?=
 =?utf-8?B?cDh3dmN4N2Nvd1ZsUEIzaXdsWHE4dGRGOWpwdmNIaUFzaCtVUTEwMnJOSE0y?=
 =?utf-8?B?MzhKUDdCQ0E1V1gvSWZNK1ZpV0tXUjNxWFNwcU5QMlNwN09lZXJjc3J1SWI0?=
 =?utf-8?B?Z29lYlZ1VXdjUHFDQkVmNE1qT1Jzend0LzhjdUJEeEU0VFJNWTcyS3AxUnRX?=
 =?utf-8?B?d2FUeUdHcmVXamZuVFU3QUQrNEhJMGI4Q2xjay9mS2MwVWp1ekZoSkxNMnFi?=
 =?utf-8?B?TXNWUVRSelBGOGcvY2FXOHVPekFuV2xFOWdDb1E1dGRXbmZxdUc0djFNSFI3?=
 =?utf-8?B?dHFpNjV6blJXTm13MG11YWpJU3FJMTdsSWlFV3FWMHkyWTNUdmkyamc0TGlp?=
 =?utf-8?B?ZWJQa3J1S0F0V1huNEJMZjJjTWJYK05QZXpFenMvYUZJRlZWL3IxU2E2cnFX?=
 =?utf-8?B?THkvdGpMdCt1aFhweWYyazZkdHEzYm1tL3pDYjA5U1ZvTE1MVCtkTzZyVU9T?=
 =?utf-8?B?WXl2c0RINEdnWk9hNXNHK3hrK3lrSWtJclBVT2ZnVE1yVURaSXdkcDlUdDYy?=
 =?utf-8?B?T01HOGpKaHgrbTQyeFpHWFBidUNyTmYxSW1WMWpPMm5WNTZzYTBJa2t5M3lo?=
 =?utf-8?B?bjMvVU9SckZidUd3dVp4YjVYdXJQbU5xakFMRmIyZklJdXd6d201azJuQ2VW?=
 =?utf-8?B?dEoxSnByTXBMZDhJZVhFSS85YkJ0NDNLczd6WklpeVBTYkRGNzhLczBCUm9Z?=
 =?utf-8?B?Y1BXZWJXMkg3VHpuNm1tMGpnWkRKQ0pxRkZSdWZIZTYyQm1qd09oOFVHSzR6?=
 =?utf-8?B?Z0VtWGNGOTcxTVEySUR6dnQyL0FjZkN5MmpmSU55Y0FocXBCNVRqRkliU1VQ?=
 =?utf-8?B?eTh1UzNZU0k5MWJoVXA0VGh4dEJQS2toT0pOckhUbnEzcEh5TStZTFlzem53?=
 =?utf-8?B?emxyWEV2U2RoUnhVYjFjTSswNmx0TDA3cWJzM2UyaVI4azF6aVhDaEt3aDZS?=
 =?utf-8?B?QjZzd2MyU0Vwc3dZaThnSEhyTnFKdGYveFB0NHc1UUwxd3BQZy9RR3J3cXpP?=
 =?utf-8?B?WU50WUJpdTNlRnpHcTRKUmxBTXYxN1h6VEdHcHVmRVRiWmxPQ21iZTNSUWww?=
 =?utf-8?B?ajJSOTRudURTTXBESkJTNlkxWGJRNmhDYzE0dWsrMHdjVnJQZ0VKNzduS0o2?=
 =?utf-8?B?UFB1aFhNUVBjRmx1S0NHVlIraCs1ZUF2enRBQUQvd2RIdTlKbXJkTXUzdDJZ?=
 =?utf-8?B?OCt2VlI3Vno1ZlVNT1pRenkrbFdBT3VpTGFDalVzVXFJcGtpUGxYWitoVG1u?=
 =?utf-8?B?SUZGNjEwSUFZb2lmWVplbVE2bGFpZnkxMXZyOXlvNC9ZQUczQnI3UTVhNC94?=
 =?utf-8?B?bks3TlZPeGU5UGdSSHJQODM1dVFyaXJlQ3BmU0ZPQWl0aU8xVmY1Z25DM1ps?=
 =?utf-8?B?RkNwUG1MV0hDcWVyUHZ6cU1ja1hnM1FqQ1d4SUZEZ2VuQWZzaUVyZWRUNk5m?=
 =?utf-8?B?SWMyQzdSUmEzZmhBQWNaa25mOTdPWFBHMkNvK2ptcGwrNmgzMUczL0liNjFJ?=
 =?utf-8?B?Y2xON1BnU2FoS3luNjRmUHJZekwwaDFGMkI1WFlTOGhiWnNQUXRldGJObTFo?=
 =?utf-8?B?QndrNTd0ckxmYWxCMDhKazgvaENtVktXYzM3Q1BzcnZ2NytSOXZFREFVdVVi?=
 =?utf-8?Q?vfSfeIsimx0z7lO6wpYPjfqm3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61decc21-de83-431a-9605-08dd461668b5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 18:53:41.9126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DB6WlP+ROpgpMwrxN7dVH6/TfoqslMhvES+9q56P2ocY0cYEkTA0Mxvj67Ai6hlfIFauXkqzoyThEGDKESFetg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8985
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Feb 2025 18:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9123

--------------eSqVmEk3k0hWlCwxJ6IsN3hw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/5/2025 5:38 AM, Bruce Ashfield via lists.yoctoproject.org wrote:
>
>
> On Thu, Jan 30, 2025 at 6:33 PM Sandeep Gundlupet Raju via 
> lists.yoctoproject.org <http://lists.yoctoproject.org> 
> <sandeep.gundlupet-raju=amd.com@lists.yoctoproject.org> wrote:
>
>     Hi Bruce,
>
>     Any updates on my questioned. Are you ok to take this as
>     enhancements or we need to get this one now.
>
>     Thanks,
>     Sandeep
>
>     On 1/17/2025 12:45 PM, Sandeep Gundlupet Raju via
>     lists.yoctoproject.org <http://lists.yoctoproject.org> wrote:
>>
>>     Hi Bruce,
>>
>>     Sorry I apologize, I missed this email not sure how.
>>
>>     On 1/17/2025 12:14 PM, Bruce Ashfield wrote:
>>>     FYI: I was waiting on answers to these questions, and a possible
>>>     v3 before merging.
>>>
>>>     Bruce
>>>
>>>     On Tue, Jan 7, 2025 at 10:33 AM Christopher Clark
>>>     <christopher.w.clark@gmail.com> wrote:
>>>
>>>         On Mon, Dec 9, 2024 at 2:54 PM Sandeep Gundlupet Raju via
>>>         lists.yoctoproject.org <http://lists.yoctoproject.org>
>>>         <sandeep.gundlupet-raju=amd.com@lists.yoctoproject.org> wrote:
>>>
>>>             Inherit xen-launch-config bbclass to use common xen
>>>             launch config
>>>             variables for xen-rpi-u-boot-scr recipe.
>>>
>>>
>>>         There is a functional change in this commit that would be
>>>         appropriate to mention in the commit message:
>>>         it introduces the use of KERNEL_IMAGETYPE to identify the
>>>         dom0 linux kernel file whereas it was previously assumed to
>>>         be 'Image'.
>>>
>>>         I think this is an improvement, though I'm not able to test
>>>         it at the moment.
>>>
>>     [Sandeep]: Yes we can take this as enhancement.
>>>
>>>
>>>
>>>             Signed-off-by: Sandeep Gundlupet Raju
>>>             <sandeep.gundlupet-raju@amd.com>
>>>             ---
>>>              .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>>>             <http://boot.cmd.xen.in>       | 10 +++++-----
>>>              .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
>>>             <http://xen-rpi-u-boot-scr.bb>       | 13 ++++++++-----
>>>              2 files changed, 13 insertions(+), 10 deletions(-)
>>>
>>>             diff --git
>>>             a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>>>             <http://boot.cmd.xen.in>
>>>             b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>>>             <http://boot.cmd.xen.in>
>>>             index 98742200..b0ed0dc8 100644
>>>             ---
>>>             a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>>>             <http://boot.cmd.xen.in>
>>>             +++
>>>             b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>>>             <http://boot.cmd.xen.in>
>>>             @@ -5,13 +5,13 @@ fdt addr ${fdt_addr}
>>>              fdt get value bootargs /chosen bootargs
>>>
>>>              # Set module load addresses
>>>             -setenv xen_loadaddr     "0x00200000"
>>>             -setenv kernel_loadaddr  "0x00400000"
>>>             +setenv xen_loadaddr  "@@XEN_LOAD_ADDRESS@@"
>>>             +setenv kernel_loadaddr "@@KERNEL_LOAD_ADDRESS@@"
>>>
>>>              # Add some space to the fdt so we can edit it
>>>              fdt resize 0x1000
>>>              echo Add boot arguments for Xen
>>>             -fdt set /chosen xen,xen-bootargs "console=dtuart
>>>             dtuart=/soc/serial@7e215040 dom0_mem='@@RPI_DOM0_MEM@@'
>>>             @@RPI_DEBUG_XEN_ARGS@@"
>>>             +fdt set /chosen xen,xen-bootargs "console=dtuart
>>>             dtuart=@@XEN_SERIAL_CONSOLES@@ dom0_mem=@@DOM0_MEM@@
>>>             @@XEN_CMDLINE_APPEND@@"
>>>
>>>
>>>         Is there a way to ensure that if XEN_SERIAL_CONSOLES is
>>>         unset that the dtuart= argument is not passed, and likewise
>>>         for DOM0_MEM and the dom0_mem= argument?
>>>
>>     [Sandeep]: May be we can implement this in two ways. Do we need
>>     this right away or we can take this as enhancement.
>>
>>     1. Set dtuart in bbclass similar to XEN_CMDLINE_APPEND
>>     or
>>     2. We may need to use u-boot hush shell if condition method.
>>
>
> I'd prefer to make the above changes now, versus merging them and then 
> doing enhancements in the future. I'm not convinced that we'll get 
> around to making those updates in a timely manner .. given how long it 
> has even taken to get through the reviews of the series.
[Sandeep]: Ok sounds good I will get the changes in next patch series. 
If you have any other concerns or changes required let me know asap so 
that I can incorporate those in next series.
>
> Bruce
>
>>
>>>         Christopher
>>>
>>>
>>>
>>>     -- 
>>>     - Thou shalt not follow the NULL pointer, for chaos and madness
>>>     await thee at its end
>>>     - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>
>
>
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9122):https://lists.yoctoproject.org/g/meta-virtualization/message/9122
> Mute This Topic:https://lists.yoctoproject.org/mt/110006801/8188369
> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub [santraju@amd.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------eSqVmEk3k0hWlCwxJ6IsN3hw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/5/2025 5:38 AM, Bruce Ashfield via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CADkTA4MWAQ8ux9FYHkfMoRXFheyrvjNrFxVL8Uqt_4uH=L0vPQ@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Thu, Jan 30, 2025 at
            6:33 PM Sandeep Gundlupet Raju via <a href="http://lists.yoctoproject.org" moz-do-not-send="true">lists.yoctoproject.org</a>
            &lt;sandeep.gundlupet-raju=<a href="mailto:amd.com@lists.yoctoproject.org" moz-do-not-send="true" class="moz-txt-link-freetext">amd.com@lists.yoctoproject.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p>Hi Bruce,</p>
              <p>Any updates on my questioned. Are you ok to take this
                as enhancements or we need to get this one now.</p>
              <p>Thanks,<br>
                Sandeep<br>
              </p>
              <div>On 1/17/2025 12:45 PM, Sandeep Gundlupet Raju via <a href="http://lists.yoctoproject.org" target="_blank" moz-do-not-send="true">lists.yoctoproject.org</a>
                wrote:<br>
              </div>
              <blockquote type="cite">
                <p>Hi Bruce,<br>
                  <br>
                  Sorry I apologize, I missed this email not sure how.<br>
                </p>
                <div>On 1/17/2025 12:14 PM, Bruce Ashfield wrote:<br>
                </div>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div style="font-size:small">FYI: I was waiting on
                      answers to these questions, and a possible v3
                      before merging.</div>
                    <div style="font-size:small"><br>
                    </div>
                    <div style="font-size:small">Bruce</div>
                  </div>
                  <br>
                  <div class="gmail_quote">
                    <div dir="ltr" class="gmail_attr">On Tue, Jan 7,
                      2025 at 10:33 AM Christopher Clark &lt;<a href="mailto:christopher.w.clark@gmail.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">christopher.w.clark@gmail.com</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div dir="ltr">
                        <div dir="ltr">On Mon, Dec 9, 2024 at 2:54 PM
                          Sandeep Gundlupet Raju via <a href="http://lists.yoctoproject.org" target="_blank" moz-do-not-send="true">lists.yoctoproject.org</a>
                          &lt;sandeep.gundlupet-raju=<a href="mailto:amd.com@lists.yoctoproject.org" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">amd.com@lists.yoctoproject.org</a>&gt;
                          wrote:<br>
                        </div>
                        <div class="gmail_quote">
                          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Inherit
                            xen-launch-config bbclass to use common xen
                            launch config<br>
                            variables for xen-rpi-u-boot-scr recipe.<br>
                          </blockquote>
                          <div><br>
                          </div>
                          <div>There is a functional change in this
                            commit that would be appropriate to mention
                            in the commit message:</div>
                          <div>it introduces the use of KERNEL_IMAGETYPE
                            to identify the dom0 linux kernel file
                            whereas it was previously assumed to be
                            'Image'.</div>
                          <div><br>
                          </div>
                          <div>I think this is an improvement, though
                            I'm not able to test it at the moment.</div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </blockquote>
                [Sandeep]: Yes we can take this as enhancement.<br>
                <blockquote type="cite">
                  <div class="gmail_quote">
                    <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div dir="ltr">
                        <div class="gmail_quote">
                          <div>&nbsp;<br>
                          </div>
                          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                            <br>
                            Signed-off-by: Sandeep Gundlupet Raju &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;<br>
                            ---<br>
                            &nbsp;.../xen-rpi-u-boot-scr/files/<a href="http://boot.cmd.xen.in" rel="noreferrer" target="_blank" moz-do-not-send="true">boot.cmd.xen.in</a>&nbsp;
                            &nbsp; &nbsp; &nbsp; | 10 +++++-----<br>
                            &nbsp;.../xen-rpi-u-boot-scr/<a href="http://xen-rpi-u-boot-scr.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">xen-rpi-u-boot-scr.bb</a>&nbsp;
                            &nbsp; &nbsp; &nbsp; | 13 ++++++++-----<br>
                            &nbsp;2 files changed, 13 insertions(+), 10
                            deletions(-)<br>
                            <br>
                            diff --git
                            a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/<a href="http://boot.cmd.xen.in" rel="noreferrer" target="_blank" moz-do-not-send="true">boot.cmd.xen.in</a>
b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/<a href="http://boot.cmd.xen.in" rel="noreferrer" target="_blank" moz-do-not-send="true">boot.cmd.xen.in</a><br>
                            index 98742200..b0ed0dc8 100644<br>
                            ---
                            a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/<a href="http://boot.cmd.xen.in" rel="noreferrer" target="_blank" moz-do-not-send="true">boot.cmd.xen.in</a><br>
                            +++
                            b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/<a href="http://boot.cmd.xen.in" rel="noreferrer" target="_blank" moz-do-not-send="true">boot.cmd.xen.in</a><br>
                            @@ -5,13 +5,13 @@ fdt addr ${fdt_addr}<br>
                            &nbsp;fdt get value bootargs /chosen bootargs<br>
                            <br>
                            &nbsp;# Set module load addresses<br>
                            -setenv xen_loadaddr&nbsp; &nbsp; &nbsp;&quot;0x00200000&quot;<br>
                            -setenv kernel_loadaddr&nbsp; &quot;0x00400000&quot;<br>
                            +setenv xen_loadaddr&nbsp; &nbsp;
                            &nbsp;&quot;@@XEN_LOAD_ADDRESS@@&quot;<br>
                            +setenv kernel_loadaddr&nbsp;
                            &quot;@@KERNEL_LOAD_ADDRESS@@&quot;<br>
                            <br>
                            &nbsp;# Add some space to the fdt so we can edit
                            it<br>
                            &nbsp;fdt resize 0x1000<br>
                            &nbsp;echo Add boot arguments for Xen<br>
                            -fdt set /chosen xen,xen-bootargs
                            &quot;console=dtuart dtuart=/soc/serial@7e215040
                            dom0_mem='@@RPI_DOM0_MEM@@'
                            @@RPI_DEBUG_XEN_ARGS@@&quot;<br>
                            +fdt set /chosen xen,xen-bootargs
                            &quot;console=dtuart
                            dtuart=@@XEN_SERIAL_CONSOLES@@
                            dom0_mem=@@DOM0_MEM@@
                            @@XEN_CMDLINE_APPEND@@&quot;<br>
                          </blockquote>
                          <div><br>
                          </div>
                          <div>Is there a way to ensure that if
                            XEN_SERIAL_CONSOLES is unset that the
                            dtuart= argument is not passed, and likewise
                            for DOM0_MEM and the dom0_mem= argument?</div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </blockquote>
                <p>[Sandeep]: May be we can implement this in two ways.
                  Do we need this right away or we can take this as
                  enhancement.<br>
                </p>
                <p>1. Set dtuart in bbclass similar to
                  XEN_CMDLINE_APPEND<br>
                  or<br>
                  2. We may need to use u-boot hush shell if condition
                  method.</p>
              </blockquote>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">I'd
              prefer to make the above changes now, versus merging them
              and then doing enhancements in the future. I'm not
              convinced that we'll get around to making those updates in
              a timely manner .. given how long it has even taken to get
              through the reviews of the series.</div>
          </div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: Ok sounds good I will get the changes in next patch
    series. If you have any other concerns or changes required let me
    know asap so that I can incorporate those in next series.<br>
    <blockquote type="cite" cite="mid:CADkTA4MWAQ8ux9FYHkfMoRXFheyrvjNrFxVL8Uqt_4uH=L0vPQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Bruce</div>
            <br>
          </div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <blockquote type="cite">
                <p> <br>
                </p>
                <blockquote type="cite">
                  <div class="gmail_quote">
                    <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div dir="ltr">
                        <div class="gmail_quote">
                          <div>&nbsp;</div>
                          <div>Christopher</div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                  <div><br clear="all">
                  </div>
                  <div><br>
                  </div>
                  <span class="gmail_signature_prefix">-- </span><br>
                  <div dir="ltr" class="gmail_signature">- Thou shalt
                    not follow the NULL pointer, for chaos and madness
                    await thee at its end<br>
                    - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
                    <br>
                  </div>
                </blockquote>
                <br>
                <fieldset></fieldset>
              </blockquote>
            </div>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
        <div><br clear="all">
        </div>
        <div><br>
        </div>
        <span class="gmail_signature_prefix">-- </span><br>
        <div dir="ltr" class="gmail_signature">- Thou shalt not follow
          the NULL pointer, for chaos and madness await thee at its end<br>
          - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#9122): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/9122">https://lists.yoctoproject.org/g/meta-virtualization/message/9122</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/110006801/8188369">https://lists.yoctoproject.org/mt/110006801/8188369</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:santraju@amd.com">santraju@amd.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------eSqVmEk3k0hWlCwxJ6IsN3hw--

