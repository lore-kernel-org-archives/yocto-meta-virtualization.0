Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691A8C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 23:33:37 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.54])
 by mx.groups.io with SMTP id smtpd.web10.8252.1738280014019733862
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 15:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=v+azvbWi;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.54, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pf43MXPMSjW8cVeBYQy1Sgd5+1y4KIx3fd+ZYIldjSYFFUYszOYWQEDDy/NWdpsZb7MKtI9GZw3uP8dHHbssOADdupUB2GqBOZsNFJxM0pMpBm7V+B6FbplhtJztn9TRmPPmmi13mNBDQnqoRkuPZkwV1v3e0gd+Qa15Pt3jl7JwDQvyOFnd2MJBf2DV1QCxAzV47ZwPcyrNNQI6EM4MDMkownFGKSRDI6CttULJ1fkhHIJMsL7LMLphGWa+PrkdMDRrF4gA80VPtwXTgFml0SkMvD1PbfLCvX5SJLO/QxB62uCAZhDQfBQFWWZCBvaZf/7C5Et/VM/2P+2EfqZKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8VK48qrYydUUHzZU7Sb1YXzvhJNLKnEXwz8BDNifTA=;
 b=yGpNEquIqk9nALAgcJsGFe7tll9MbqEu2xpmLGBEwwK0txmi04xV1EqTD3HE+jHcd7VqqrxD1St4qimwVHcHTFnlRYtOIlWQseLCPPFSUM9gJPhpvTmqyXxw495P7vtx86HSFL8tYcWjqspPhUZpgL0LVYc/n6a/yMBjoOAadjnH34Ro/n8khePXEkRdZl2nOxzdxgDU9Z7+2DHgb79B62LnjvZXWK4sG5B+IH7zhYChpSHfj8PusFWXnqLxHRaghHlNAr1EaY3CtyoVHDKUGszBqtNgrZ62cTSgffx0+69nTubxqFwbnZjmRGmzYpKe1IHhwRQfbDRPfMI0ml8T4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8VK48qrYydUUHzZU7Sb1YXzvhJNLKnEXwz8BDNifTA=;
 b=v+azvbWi0J474Yu53VOxvwhDzg8CbVOXPV8HO7cQByCFxR+FHQhA1i1qNAfnwdsGBJtcCr1IM8m0+IyF7SRf7341G59iy+gMpMH09AC2z8USvrmJji21ffoLc/QXInml1AOCP2wv8EUPyqcyuZCOaipfh8s2j3bWI/vUstyrzc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by DS0PR12MB7780.namprd12.prod.outlook.com (2603:10b6:8:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 23:33:31 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 23:33:31 +0000
Content-Type: multipart/alternative;
 boundary="------------tW3gpMXihCTEcWsea00O4FCR"
Message-ID: <334a9170-082e-4d0c-8f78-6a640a2c2b2e@amd.com>
Date: Thu, 30 Jan 2025 16:33:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][styhead][PATCH v5 2/5]
 xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
To: meta-virtualization@lists.yoctoproject.org
References: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
 <20241209145442.3291634-3-sandeep.gundlupet-raju@amd.com>
 <CACMJ4GZRusBUrxF-zRywgQhMfT+U_1-FR4yENn7bkZu27zfzgA@mail.gmail.com>
 <CADkTA4NyLmdUTMKFAF6sxKc0_RX83guy5k7Lmkf2ztwBOGxG3Q@mail.gmail.com>
 <181B927D4BEAD936.28939@lists.yoctoproject.org>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <181B927D4BEAD936.28939@lists.yoctoproject.org>
X-ClientProxiedBy: CH0PR03CA0308.namprd03.prod.outlook.com
 (2603:10b6:610:118::10) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|DS0PR12MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 03556a49-1055-4783-f658-08dd41868161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NE5hRjVWVnc2TWRqSXJqUzVMWldOdWpDTHBuVmNicmorY3FxQ1ZXQjBRUGlT?=
 =?utf-8?B?bjF3YkFsM3JkMHVhaGxBYURjU1hVRzN1ekJKbGFnSnVCS1M2Y1dKZ1pJRnpi?=
 =?utf-8?B?SkdFZEJPVGVqWlNoK1o4WVB2ZTZiMFB3NlVJWkw1aW1QSEJaWE5hMEM1Zjkw?=
 =?utf-8?B?ZXZyTS93N2czaWR5V3pLazg1WGpCdC80NzB6MnJqdklYT3dIUWRiMVNDZkl3?=
 =?utf-8?B?Q21vazFrNm1VZEw5SWIxMnkvbXpqZm1jWU1wczVnY2V5c2VadExhcm5vY3Fi?=
 =?utf-8?B?RkRjR1VJK0ZXZGJDaGNsOEhCd1RvR1lNMTQzZFgvYjlEMGlzai9lQUNkejl6?=
 =?utf-8?B?amN2VnRxamhiNEZndlA3N2xQem5RdUQ1WjY1U3ZzcWx3eFBsSXJBK1FrTGU0?=
 =?utf-8?B?aVA0bE5vbjRTS0hrQk1TNklzZHptMFZtbThjRllHQXVoZ3Bpbkc3TGtPb1Ns?=
 =?utf-8?B?T0pxNG5MVUNuZkFaZ0Z2K1BHUzMxZVg0MS91TzlNM2dRcGt5Z1hnc2tTaVU4?=
 =?utf-8?B?MHJxWDAwYTRjM2Y4bUtRNGM3V0t4WGpTUzNyaGNTUTlDVExkdFRjQ29PT01n?=
 =?utf-8?B?WWJqS0lyblBaUnB6aXB6d0xnaXF2QUxXQ2drTXAyOGZMTWFBdTFSK1JQTmM5?=
 =?utf-8?B?ZStJbXJNYS92Sisxa1RHa2VGL3RuQ05hRCtmaWdVbnAvREFJU0Q3Z283U3pQ?=
 =?utf-8?B?Z0xYKzg3aHdIaG5KeGtaSFdObWdJczB3SndrTTJFQ1pMVkdwWHRwYlJON2Rx?=
 =?utf-8?B?VERGSmljYkpUc2RKK2R5MkVNU0ZTWWw0TzhmQzJpcWpEZGVISURwYWZaM0pm?=
 =?utf-8?B?azZZOVRqazRsNzdSZUF2QVBHbHJmWWJvdGZISlJUK0g2Y0p3TVZTWVZiN1Iv?=
 =?utf-8?B?Um4wOFVoQUlKTzVCbm9WRjNockRUQVU1dlliZnJJb0w5eVBRNGN5K1Jxa2Zn?=
 =?utf-8?B?M0RnSDdKdWttR2V2RnFuY0ZSMEliSXk2TEZwMkZaV3VrMGxlM2Q4eDIxZGJL?=
 =?utf-8?B?YXZvVmJpZHpqeHhjY2lQNmIrZjUvcENKSHhsYmZxbDJEaTdCMEF0V1BOelhL?=
 =?utf-8?B?aWw2eHM5UjZvT3hWd1RqZ2Ria3NPNXJ6OFN6NHEwdXNoVVN5T3dXYndqRHRW?=
 =?utf-8?B?NDJsZFUxRUZGbzVwcm83NStFbFRiRG1lK1dGVVhpaTg2YlBIMUlzaUs2SmpM?=
 =?utf-8?B?Q1lCZ3kvcC8zUnJUTTVLZCs3TWpwcnNjSGlFV0NwTDNEZEhBSkdZWkpybnlQ?=
 =?utf-8?B?dHBjSHE4L3ZzRERQZG0zZ05sV3pUejFtSXZhT0t6YWdxeUpVL3VCZGVuUlVG?=
 =?utf-8?B?cFNzK0NZMGhRZ1ZCUVVHL0pmOGZ3YVBkQnF4ckZtblhLWHh4SHJ1T0wwaGRJ?=
 =?utf-8?B?QVU5UmtYekI5Ulp3R3Q1aUlLNWVwRjM5eWF4U21zdDY2Q1Zpa0M5dlFGMEhv?=
 =?utf-8?B?K3VEa0tLSWh4Z1d0U0E4UVU1V3g1NWlwVlIzcWpBYUxFUHN1Uzc0Z1VqOWZp?=
 =?utf-8?B?ZWtLdUc2T1p3cnhtSVFxUE5KVEorbTZUNUttckxSWXB6MEc0SkZyaSt2MXNU?=
 =?utf-8?B?QXczNzI3cDZRemFESWpYZ0dZek9jTXppcHlBcVY2amVXWnY2SjNQM0RIVTBN?=
 =?utf-8?B?bEJNT2RPYTZHNDl2aHEyRVV5NUN5Qm5KYStjY1NsQnJsS20rcjFHZnNRdUxp?=
 =?utf-8?B?bk1wcnB4VjBxMnJpanNhKzF5UTVFWGFKS25XREFnZGU3N09vWlB4ZHRBMzRa?=
 =?utf-8?Q?UHK6TvhPM9e2mdEmli4S3Bb0HHSImht+DDXYTfh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MlFueU01Y1VQTnlMOFZHY09Nd29hWEl4aDhiVVNvaFFOMzFtQ1RSc1NWeVMy?=
 =?utf-8?B?eDNodnVJa3RsSFJNRUswR2FRcERYWGVpektoV2FuTE5tY2w1NGVraitXOHB4?=
 =?utf-8?B?M3ExdlUwRWV6MllzRGVwZzBabWxHYnZkbHpEakd6UCtXc0tVQ21laDJvZnIx?=
 =?utf-8?B?bE5WY3BPeWVvdFZHcmlEZEdyelpRQUFzR1dPQ2hqcDRvcEp3Tk1DSFhSYklj?=
 =?utf-8?B?SElSMlIzTStVTGptZHkrWENYWWgwRWhTSURKWU5PNWlDdWpSU1paMzBEMFUz?=
 =?utf-8?B?VitSck45cjExaWtLYkNCUkhmWmVpVEFyYUhXMjZ3dndYbHhzOGdENDlpWERH?=
 =?utf-8?B?UXZYNTVKNmd5bFAzaWI4U2JLMjdlejlUME45RmFQRU8rZ2NNUFVIWTVlK0xj?=
 =?utf-8?B?dkMwazJKRDRobnNuaURCcWFwV2s3Z0l6bmx0U2t5TGd0Z1VEN2l5NkRaek1j?=
 =?utf-8?B?ck1OK1hoR3ZkRk1YWnZkMHhreFNmaTNML015MEtjTTUwWkFsTDAzTGhLbEgv?=
 =?utf-8?B?LzZVQko5K1VGWGo4N0ZHYTJjbXYxVlRvUHBJNGwwUzNLTExsUk1TdnRSTVFl?=
 =?utf-8?B?R3VvZmdqSkZIRW1ENysvNVR4WFE5M1g5bVRHQU1UdkRmdzBLWTJHcCtNaXgv?=
 =?utf-8?B?SzZvQzdYa2tmeWRUOHNOTlBHUjd3dTFiQWs2am1Va0Fmcy9QZ0lyMURPTmY5?=
 =?utf-8?B?YVg3K1V0dngwK1hSOHFJcnRVUzlSRzRycFkrelViMHF3MlBWaGl5UkJvVTBG?=
 =?utf-8?B?M1NscVdFWHVKVnZDNjZWV2Y2a1JHamZkOFdRbktXN2lTM1BRQlo4a2V2aTRS?=
 =?utf-8?B?ZnkxbjU0bHNkQzVTRGEwajY1QXZkODhlZTg4aWxRdVJSdldVTEVqb0hCWWZz?=
 =?utf-8?B?clVGaktDSUMvRll6djhoM005em85RXJycjdPTW1UNmY3cFB2aXNBM2lnZGw4?=
 =?utf-8?B?TEJvcVV5bGJWQjNnVUlGT3NIZG9FMG4zZVdyWUJUUXFQMlI2WVMzUkh5QkdN?=
 =?utf-8?B?eTZLTlRBQ1BrdkdBdWh2SVJvSEpHc1BzVGlBaWc5WFJWaCs2SUNPck1PYWFh?=
 =?utf-8?B?UWIrN2pHQmJmWUc4QXdPaHk1b1ViZDN6OThGTXZ3d29yaWxwWjJIM2V6d2RZ?=
 =?utf-8?B?ZGZmU2dLK0c0c3BhbG1IUjRxK3VKbWNQQ0dvaXV6VkJDY3c0MUM3TnNDK0ox?=
 =?utf-8?B?aDFkMEpSbWovQnFXZEJ4S1NaeVRkNm5hQSswTnYyVEZDVXZqdkw2VmdFK2o3?=
 =?utf-8?B?SUdkSkcwUFRacm5qSlNrZ1JRVDVPUGIrVUIwUVRNMXpQN3k2NVJKODNhcTgx?=
 =?utf-8?B?M25kcWgreXR4VjFTT3Q4RG1pQTdRTVNYYTZOZmx0bXNURHFIbCtKZmIyMDFO?=
 =?utf-8?B?ZERTc21FditYVy9xY2FsSjhjTUk5MEpBMHBIa1RTRFhzK0lZdHlRS2NtWEMx?=
 =?utf-8?B?Ty9SbEw1aC9NMGxJZ2h6TkNqbS83UFQvbHArVVMwZEVZR3BMRVpMZE5acEVy?=
 =?utf-8?B?TW56TzFqaGVzNndjaVFaVDlkV0NhQ2ozTDhTMy9ZaUtkam1wSTRTdTNjSTlT?=
 =?utf-8?B?UktObk1MRWY0ZmFNVERnc3pzYkFCb3BtUTE0WDBoRHdRNkpkVnRPQW9Ybjhp?=
 =?utf-8?B?Zk4xU1UyL1FVMGkyQ3FhcklCWlRvTjZKcWNoaVM1Z29VeTFFSDRTSk4rMitT?=
 =?utf-8?B?Zms0aHhBaE9wVGx0M1ZFa0pQNEV3cE1jdFdzYjB2TjdCSGt1eDZtT3lHb09W?=
 =?utf-8?B?RzY1bllLWjIvaFlpdXNNYmdFVnlqSWlRRzkzbDgxbnBtRWQ0NXpsQ1JVbWdn?=
 =?utf-8?B?MkZZRm55d1VvV1lNN0dYNkJYaHQ3bGdYdkg3NVIva2x4cVRjR3JreTNBR1Yr?=
 =?utf-8?B?V3l0SmloSHNLUVp5clZrTkZ5SDFTL0theTRZMDdPODVsNVliMDBXOEVkeG5P?=
 =?utf-8?B?dGhHYm90UVVzaGJTaVQvK0VrR01teDE1NWVUZHZRTnNVdk00dWsrbndtbmNN?=
 =?utf-8?B?ZlJOQnNvZmFrSVhURzdHUEIrbFZCZ3NITHgzQTd0TWlWMnlITk1sRmhxMFRh?=
 =?utf-8?B?NUhnMUt2WlhWSmNGTkdGSk15dXM1bzhvM05XWmRXR0g2a2lIQWs0aCtVc1Ez?=
 =?utf-8?Q?gfCYL1frdjwoJGhYOiLZPE2j0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03556a49-1055-4783-f658-08dd41868161
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 23:33:31.0723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjBc5YqptoSioAZfRxyWY+hZLjkyscCOXL0xEX6T2OylWZ+HHJtMHcCZuG4GgRRfgSs74YPKk9Rzo2nif7M96Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7780
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jan 2025 23:33:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9116

--------------tW3gpMXihCTEcWsea00O4FCR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bruce,

Any updates on my questioned. Are you ok to take this as enhancements or 
we need to get this one now.

Thanks,
Sandeep

On 1/17/2025 12:45 PM, Sandeep Gundlupet Raju via lists.yoctoproject.org 
wrote:
>
> Hi Bruce,
>
> Sorry I apologize, I missed this email not sure how.
>
> On 1/17/2025 12:14 PM, Bruce Ashfield wrote:
>> FYI: I was waiting on answers to these questions, and a possible v3 
>> before merging.
>>
>> Bruce
>>
>> On Tue, Jan 7, 2025 at 10:33 AM Christopher Clark 
>> <christopher.w.clark@gmail.com> wrote:
>>
>>     On Mon, Dec 9, 2024 at 2:54 PM Sandeep Gundlupet Raju via
>>     lists.yoctoproject.org <http://lists.yoctoproject.org>
>>     <sandeep.gundlupet-raju=amd.com@lists.yoctoproject.org> wrote:
>>
>>         Inherit xen-launch-config bbclass to use common xen launch config
>>         variables for xen-rpi-u-boot-scr recipe.
>>
>>
>>     There is a functional change in this commit that would be
>>     appropriate to mention in the commit message:
>>     it introduces the use of KERNEL_IMAGETYPE to identify the dom0
>>     linux kernel file whereas it was previously assumed to be 'Image'.
>>
>>     I think this is an improvement, though I'm not able to test it at
>>     the moment.
>>
> [Sandeep]: Yes we can take this as enhancement.
>>
>>
>>
>>         Signed-off-by: Sandeep Gundlupet Raju
>>         <sandeep.gundlupet-raju@amd.com>
>>         ---
>>          .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>>         <http://boot.cmd.xen.in>       | 10 +++++-----
>>          .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
>>         <http://xen-rpi-u-boot-scr.bb>       | 13 ++++++++-----
>>          2 files changed, 13 insertions(+), 10 deletions(-)
>>
>>         diff --git
>>         a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>>         <http://boot.cmd.xen.in>
>>         b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>>         <http://boot.cmd.xen.in>
>>         index 98742200..b0ed0dc8 100644
>>         ---
>>         a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>>         <http://boot.cmd.xen.in>
>>         +++
>>         b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>>         <http://boot.cmd.xen.in>
>>         @@ -5,13 +5,13 @@ fdt addr ${fdt_addr}
>>          fdt get value bootargs /chosen bootargs
>>
>>          # Set module load addresses
>>         -setenv xen_loadaddr     "0x00200000"
>>         -setenv kernel_loadaddr  "0x00400000"
>>         +setenv xen_loadaddr     "@@XEN_LOAD_ADDRESS@@"
>>         +setenv kernel_loadaddr  "@@KERNEL_LOAD_ADDRESS@@"
>>
>>          # Add some space to the fdt so we can edit it
>>          fdt resize 0x1000
>>          echo Add boot arguments for Xen
>>         -fdt set /chosen xen,xen-bootargs "console=dtuart
>>         dtuart=/soc/serial@7e215040 dom0_mem='@@RPI_DOM0_MEM@@'
>>         @@RPI_DEBUG_XEN_ARGS@@"
>>         +fdt set /chosen xen,xen-bootargs "console=dtuart
>>         dtuart=@@XEN_SERIAL_CONSOLES@@ dom0_mem=@@DOM0_MEM@@
>>         @@XEN_CMDLINE_APPEND@@"
>>
>>
>>     Is there a way to ensure that if XEN_SERIAL_CONSOLES is unset
>>     that the dtuart= argument is not passed, and likewise for
>>     DOM0_MEM and the dom0_mem= argument?
>>
> [Sandeep]: May be we can implement this in two ways. Do we need this 
> right away or we can take this as enhancement.
>
> 1. Set dtuart in bbclass similar to XEN_CMDLINE_APPEND
> or
> 2. We may need to use u-boot hush shell if condition method.
>
>>     Christopher
>>
>>
>>
>> -- 
>> - Thou shalt not follow the NULL pointer, for chaos and madness await 
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9099):https://lists.yoctoproject.org/g/meta-virtualization/message/9099
> Mute This Topic:https://lists.yoctoproject.org/mt/110006801/3619217
> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub [sandeep.gundlupet-raju@amd.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------tW3gpMXihCTEcWsea00O4FCR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Bruce,</p>
    <p>Any updates on my questioned. Are you ok to take this as
      enhancements or we need to get this one now.</p>
    <p>Thanks,<br>
      Sandeep<br>
    </p>
    <div class="moz-cite-prefix">On 1/17/2025 12:45 PM, Sandeep
      Gundlupet Raju via lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:181B927D4BEAD936.28939@lists.yoctoproject.org">
      
      <p>Hi Bruce,<br>
        <br>
        Sorry I apologize, I missed this email not sure how.<br>
      </p>
      <div class="moz-cite-prefix">On 1/17/2025 12:14 PM, Bruce Ashfield
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:CADkTA4NyLmdUTMKFAF6sxKc0_RX83guy5k7Lmkf2ztwBOGxG3Q@mail.gmail.com">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small">FYI: I was
            waiting on answers to these questions, and a possible v3
            before merging.</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">Bruce</div>
        </div>
        <br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Tue, Jan 7, 2025 at
            10:33 AM Christopher Clark &lt;<a href="mailto:christopher.w.clark@gmail.com" moz-do-not-send="true" class="moz-txt-link-freetext">christopher.w.clark@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir="ltr">
              <div dir="ltr">On Mon, Dec 9, 2024 at 2:54 PM Sandeep
                Gundlupet Raju via <a href="http://lists.yoctoproject.org" target="_blank" moz-do-not-send="true">lists.yoctoproject.org</a>
                &lt;sandeep.gundlupet-raju=<a href="mailto:amd.com@lists.yoctoproject.org" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">amd.com@lists.yoctoproject.org</a>&gt;
                wrote:<br>
              </div>
              <div class="gmail_quote">
                <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Inherit
                  xen-launch-config bbclass to use common xen launch
                  config<br>
                  variables for xen-rpi-u-boot-scr recipe.<br>
                </blockquote>
                <div><br>
                </div>
                <div>There is a functional change in this commit that
                  would be appropriate to mention in the commit message:</div>
                <div>it introduces the use of KERNEL_IMAGETYPE to
                  identify the dom0 linux kernel file whereas it was
                  previously assumed to be 'Image'.</div>
                <div><br>
                </div>
                <div>I think this is an improvement, though I'm not able
                  to test it at the moment.</div>
              </div>
            </div>
          </blockquote>
        </div>
      </blockquote>
      [Sandeep]: Yes we can take this as enhancement.<br>
      <blockquote type="cite" cite="mid:CADkTA4NyLmdUTMKFAF6sxKc0_RX83guy5k7Lmkf2ztwBOGxG3Q@mail.gmail.com">
        <div class="gmail_quote gmail_quote_container">
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
                  &nbsp;2 files changed, 13 insertions(+), 10 deletions(-)<br>
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
                  +setenv xen_loadaddr&nbsp; &nbsp; &nbsp;&quot;@@XEN_LOAD_ADDRESS@@&quot;<br>
                  +setenv kernel_loadaddr&nbsp; &quot;@@KERNEL_LOAD_ADDRESS@@&quot;<br>
                  <br>
                  &nbsp;# Add some space to the fdt so we can edit it<br>
                  &nbsp;fdt resize 0x1000<br>
                  &nbsp;echo Add boot arguments for Xen<br>
                  -fdt set /chosen xen,xen-bootargs &quot;console=dtuart
                  dtuart=/soc/serial@7e215040
                  dom0_mem='@@RPI_DOM0_MEM@@' @@RPI_DEBUG_XEN_ARGS@@&quot;<br>
                  +fdt set /chosen xen,xen-bootargs &quot;console=dtuart
                  dtuart=@@XEN_SERIAL_CONSOLES@@ dom0_mem=@@DOM0_MEM@@
                  @@XEN_CMDLINE_APPEND@@&quot;<br>
                </blockquote>
                <div><br>
                </div>
                <div>Is there a way to ensure that if
                  XEN_SERIAL_CONSOLES is unset that the dtuart= argument
                  is not passed, and likewise for DOM0_MEM and the
                  dom0_mem= argument?</div>
              </div>
            </div>
          </blockquote>
        </div>
      </blockquote>
      <p>[Sandeep]: May be we can implement this in two ways. Do we need
        this right away or we can take this as enhancement.<br>
      </p>
      <p>1. Set dtuart in bbclass similar to XEN_CMDLINE_APPEND<br>
        or<br>
        2. We may need to use u-boot hush shell if condition method. <br>
      </p>
      <blockquote type="cite" cite="mid:CADkTA4NyLmdUTMKFAF6sxKc0_RX83guy5k7Lmkf2ztwBOGxG3Q@mail.gmail.com">
        <div class="gmail_quote gmail_quote_container">
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
        <div dir="ltr" class="gmail_signature">- Thou shalt not follow
          the NULL pointer, for chaos and madness await thee at its end<br>
          - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
          <br>
        </div>
      </blockquote>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#9099): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/9099">https://lists.yoctoproject.org/g/meta-virtualization/message/9099</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/110006801/3619217">https://lists.yoctoproject.org/mt/110006801/3619217</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:sandeep.gundlupet-raju@amd.com">sandeep.gundlupet-raju@amd.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------tW3gpMXihCTEcWsea00O4FCR--

