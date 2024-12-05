Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927D3E7716E
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 20:44:25 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.45])
 by mx.groups.io with SMTP id smtpd.web10.22312.1733431459010418499
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 12:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=XN6JG9lq;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.45, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpzVhyEga4O71Os2fK2yegBML9k1R2X/YLoVURz+rcqSAfHuVvCq7DFsYmWJPGMXGKuOS+jAh5DlR5WBSSMUgnbjo6u2Kk5HtcTJ2LEPViom2JzGeei25pTrFZj9agftuoFGDy97jA5BuWdtBDpLEjax4Slhj10yGIlkR5USJEd0SsEI8OYZITI2FbQBSOwFWFu+kB1SOiWg86bT/kvYp5yIVv0xP5rnymCVdlG6dixIrKp5b3jT/bfSq4xd7UJRYS0GCFEN/WNUULmbtwP3iTF+Zo/ICmFJ2qxNanq/WOlJPuwne4xJMCu/O2it4QKf7vVLUogrOXsprdH/fPGKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1JRsgzP24O1r89cCrV2XDkeYUi+uw2Z+I7WED4fujo=;
 b=by0B7DpxQWlgvh8SJOFscWv20iAJte3pvbS2h508IIpyl3FQREAtD7Phv2iKkZb1tHrNxDBf1dFg3VQZk+kxMZSOVlzDwKVGMU+9lMWJ3/1LgNMuKpaVhOKAh6A1KGKYz97k7gmr9U/Lbv2MV42RNJ8FIQ4/cjS8uLhQSzQhoURwKTMysplQ9vQxX+Lr8fEEpDD+AVC8FHXchfT3+68QYt9m9hiL3iau1y2icoVF/yWlMJXuLZgSFPmXh78xbkVbowzbHVEQnhpm/CbvzqmOAKu2zhzo27dI8F5sYTxZa4RWm11DjzadqV1v+Xf8gycBiLcjUFzogA95SNgZYxEWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1JRsgzP24O1r89cCrV2XDkeYUi+uw2Z+I7WED4fujo=;
 b=XN6JG9lqsn3D4PR+3Z2Rq6o4uq56xfjGDf0E7mqFy4hUhADkQMmIWhq2opcCcuu83dA3uk+8MCq/N2uPGO6ik20I8UCceoPrbjrLaZIzvclRJhEamieyzPZcfwhoN7HWVbO6oZRqeK0Lh3ENTWS6B+0uQE9Yg09Bi/N5Sy447e8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Thu, 5 Dec
 2024 20:44:15 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 20:44:15 +0000
Content-Type: multipart/alternative;
 boundary="------------n7T5IARMDp3YVddVql0cllcv"
Message-ID: <08b70593-78cf-4b1d-8bdd-f7f9503d18e8@amd.com>
Date: Thu, 5 Dec 2024 13:44:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][scarthgap][styhead][PATCH v4 0/6]
 Add bbclass for xen launch config variables
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 meta-virtualization@lists.yoctoproject.org, mark.hatle@kernel.crashing.org
References: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
 <aa7326cf-be86-4d68-83dc-925907007b1a@amd.com>
 <CADkTA4PWP4xjFh7fWpWFae3Q9Bc4NWb+ENRxK7hJsKcGB6WYxg@mail.gmail.com>
 <44c32fcb-4e93-47b7-80e0-c48355e84ec5@amd.com>
 <CACMJ4GYnwxR3TP_ERF77H9_u3=znGc_fPehjOhBLxR-4fj_AVA@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CACMJ4GYnwxR3TP_ERF77H9_u3=znGc_fPehjOhBLxR-4fj_AVA@mail.gmail.com>
X-ClientProxiedBy: CH0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:610:e6::9) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|CH3PR12MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 245c4db0-0cab-4b04-0db3-08dd156d9531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NzMrVDZaVklYTEF3RU5CbFRMbld5U1pFWnNYb3pzUEJsVFc4NlorN1ZwR3l5?=
 =?utf-8?B?T0luVFFGSWxmcUtFQmswT1M0SDFNeUFzbkV6b09qdjQ1TVkvdnFUUU1SODlt?=
 =?utf-8?B?QTN0bCt6UFN3SkI0SkFOL1hUeVJacUs0R0J5T252UnVlSDljRDJWREFoRXM3?=
 =?utf-8?B?U1FLRXJZSG92am9hdHJaNnR2b3FZbzFVejdEOWJRMGttSnp1UWI0N1JyK1hj?=
 =?utf-8?B?QU9sczBzdVd6cmFuV1VFdzlKRkhqcytEU0FUT2FkRFREMFU4VGxpaFB1RTNy?=
 =?utf-8?B?NHY5WmE4K0hXbGthR1VVSGM1bll1RlVSUmF5MEh4Nk53bUJSZG9sa0tDUmc1?=
 =?utf-8?B?S0ZkTFVuZDJaaFAxQlY2VE4wbTNDN0hSbzVHaHJaR3pvTVpKMUxkQTlINUc2?=
 =?utf-8?B?MGUrV3J1eXAzVVlEUGorclpqYnNtSjJHbE56WVo5eUd0V0RQT3UwaEVHK0hh?=
 =?utf-8?B?cVZkNFVGRjdCeWxIY0VCTU9TSEtqSE1LTWwwd1pocjcvQTNsbUl3TldVQk54?=
 =?utf-8?B?ZUw4NENvMGNVQlkvUi85SjRteEVBTERnYUtzbVdJNWFIMUJPVldPa0tWOUYz?=
 =?utf-8?B?K3FOMWxRYXZLbVJ4M0V4M0I0RkRxOUdLUjBqRjdqSUJ6REpwbUhTbFRrNXZ6?=
 =?utf-8?B?WGxJZmwyTngzMEFQWVZvNEYvYnoxK1N3VnJ3QnlVUnBBUURjbGliVitxUy85?=
 =?utf-8?B?bW9VNlg1eFgxaTE1Ui9HeEFCVlpidjd0OHY5UlFNbXloMHUrMXI2Skt0cWJa?=
 =?utf-8?B?MWV5WW1KZU9Ydno1cHRGS2czVVdxLy9BM241U2EwRnU4T0o0M0I5dnNSUjVa?=
 =?utf-8?B?cGVMeXZZaU8wSGVuOHV6OWpOR3dUbnR0cldYejBEcythd1VCMkRURVNsRGRa?=
 =?utf-8?B?a2Nmc3FpMWZmdndHa2lDTVF5cis3Rlo5NzNCdGhxbDBjRWZtalpUdGt0WENz?=
 =?utf-8?B?ZFE2V3FwbGt5VjhuZzJaVm42MGRneXdsdEQyQ2dEcHlOT1J6MFFLN204VUxT?=
 =?utf-8?B?dmJvNFBGOTc2RmJUdURVUVRwSGliWUtVOUhNeWR0WlR4emhuSXJPZkE3b3Ny?=
 =?utf-8?B?MEpGUnNlMlFRYTk3K2E4YkZCc3REOTJzV1ZQeXNVb1lHZzlidTJOVW1KRzdv?=
 =?utf-8?B?d0ptU043VUkzbVpXVDZ4UkhSUm5CenpsZGxmM29nRzNoSG4zbk1RdXhYZWFw?=
 =?utf-8?B?N0lHT2hDWitkcXpHNTBUMUNVbVFNdk5tRzVFeWxraUQyNUtaOFRSMDB2Q05O?=
 =?utf-8?B?bG9sS3R6RXhxQzZWRTQySmh6bEhDenllcm9aREpTd2hXU1hIY25nOVRlSFoy?=
 =?utf-8?B?T040enFPYWdYb1ZNcGo4Z3IxSkk1OTVYK2ZUVWVFSnNiVjhTVGY4emdSK2pY?=
 =?utf-8?B?OVJ1OXFGdFhwYXVPNmxGK2I0dGRVU2NCSkwxazNFdWUvamlpeU1sbzFRTlcv?=
 =?utf-8?B?bi84SG1tQ0w2TGtWbW1LeUVWK2RlTTEvK3dVR1lXSUVMUS9UdWlGTjlYTEpW?=
 =?utf-8?B?S003bWJ1aVRwU0hVa1ZXTkYyT1o5RUg5OTFJNEl5MUFQa2lxMGpDWVFzZmgz?=
 =?utf-8?B?Z3dEVG5aYUdzOVhaM0U2L0V2d1UyNFpGMXBRazVxakhSZFFQTllYVjhyTE1G?=
 =?utf-8?B?angrMkFNdHdaYXdBZ2ZIQzNvMzBuVnJiWXpDQUFQSit3VXFPV24zcjdpZnVx?=
 =?utf-8?B?Rjhpb3N0TkxBd0pVYWtrdWRsM3RMWmhNbEZaKzVCRm9LVlBBbzRRWk9kSGdG?=
 =?utf-8?B?NWtkVTZFdmpyRHhSRGZPRkgrSlpOZnJML1RqUDlncElZdkhGbnZuUTBrV2tm?=
 =?utf-8?B?dmVVaFc0V0N5Vi9SQ3VTUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b29ML2l0bnNveEw1Wnhjc1JSWnNudWhpc1FQTFpHa2o2dzF6dWF1d0VqQ1lU?=
 =?utf-8?B?Z3BFandLYlliSnZqWlRiZ3lKcXFGK2FxSEdJTjNwZUdzaFViM2hLR3o0bU9T?=
 =?utf-8?B?RkZEdWdra0hENlByWWY3RXRGbzRNNDBDUlEyL29yQnVBaER0dFF1QTl4UXBy?=
 =?utf-8?B?TGxFa1JvdVBZektaQzlpaXJLN0MxTlZMa25lZ1l3MGJoK2hWRVB1dzNZRHpW?=
 =?utf-8?B?dkk4dXJIRUZtS0hmd0FVU1d6VzZZSXNHa2YrZEpNWGlCWTVkNGxBWnY5V1U4?=
 =?utf-8?B?VWRSMnFGZkVaUW5jQy9PMm9sRWVFQW85ZC9GdGh2UjV3U3c0ZThrTFlja21J?=
 =?utf-8?B?bUVGd2lUWUZYdlZnSEZiMElBcW1xMzV2ZmkwWFV5emlXT0JXdWNwVjV5TmVr?=
 =?utf-8?B?djRSREFTQS9MSFNlR29xYUtJcnBSa3hGZmZvVTJoM2IwOHRGdUN1ajk0akg2?=
 =?utf-8?B?WWxKNUdWMnhKc0NmQy9oUnU5Y29aRExaODdSL0hYRGZ1elY3RUZxVVlMT1F6?=
 =?utf-8?B?QytVRHZZenZEVldMa0RPUVVwemJaWnBBdFFERmJvVXovR24yNWV3N3IrNm5w?=
 =?utf-8?B?dGIxcTBDMjZtSXNIV1RSOGo1ZjE1ZkVpTFZ4MHU5aFd4QUQ2dlVsT0FtZnhB?=
 =?utf-8?B?SVJrMlhmRkY5Uk43UWIrUEFPSTdpSHNvTDhhSWYwT1U4Y24rZDFZNkl5Zndv?=
 =?utf-8?B?LzdhdUdpa1lJd2V6bjJvTittSmg1NjZkelJ2NFRiaHRWT095aDM5N2ZuNkQ0?=
 =?utf-8?B?UzlwZVg4c0tIWjVmeDNmeUtsWEYyTno5T091Wkk4UjlrM05vYkJ6NkcwSWJI?=
 =?utf-8?B?YlF6SlNMMHhUN2xlZmFERTQwQXhaajhBdEJnY1JRSThyMkwyNlo4cGNsL1Va?=
 =?utf-8?B?dkdVZHdPY2JzMFAyUVNkTzd6dnhYYjVuMWFoMFJoRTh1QkN1UGNxTFJWTlJz?=
 =?utf-8?B?dGpoT2lwSXpkdG5UQzkrcG0vbWpTWHVyY1graWpJK3M3TnBndVJmNkJzQjFm?=
 =?utf-8?B?UEROV3RzSStPN2RJbjNmbkE4anJLMGpnZ2NlYTJMM3ZJRkE5S2UreEZNcmM1?=
 =?utf-8?B?V3NOelZXamJ1RzdhTWZNdWFpbFhlNnMxMVptWENEQjFLTmx3MTZxSXhaZFFr?=
 =?utf-8?B?VGpuTWxCNVV4d3duUkRPbWZLcDl6N0lLZTVGbUV3bEJEWE9aTDdqR3RwRGYr?=
 =?utf-8?B?aXdTQTdqaC81cU52WUl3NEV1NnBXc21DMUZYQ2ZvME1mVXZxUFE5b1lPMkt6?=
 =?utf-8?B?ODVxOU9YeXFaN01TaW1TdTFtTEppeU83MENzWFFmdEw0K2RvNlNXOVdCL3ZW?=
 =?utf-8?B?UW5XOS90VEZiUG5YUlFUaVEweWtpWkZsQnhTcEF6Yko4aHoyZlkrUlRlNGRt?=
 =?utf-8?B?RmZtaXV1WGJ3aUl2OEdoT3ZiZjRkcUtya2F6N2w2emh2bHBsY3BZRS9KcHJI?=
 =?utf-8?B?UG5hL2NYWVpCOGMyOVVOT0FWR2dWeHA5cDFOZkJKTEtBSnV5UnR3QWxKNHJ6?=
 =?utf-8?B?ajR3N3FFVDAxZTMwdEl3RThKRmJjQ0VMSm00a2VjR3BQbExzTEpZd3NLNGFn?=
 =?utf-8?B?WkVubWVsYm9lUGNGa1Z5aW1Nb3BjNUhVUERuVGcxQ0Y3SHE3RE5ieFJUbnll?=
 =?utf-8?B?WDJyd3h6bXdqRjB5ZkdzdHFGYTRLaFFvTlUzQUh5cXhDWDM2NmRuUFA0ZmVS?=
 =?utf-8?B?bTFtUDU4MkdhdkswQThiRC9Gc2hValUvOEV5a1M3UlpvakJEWmVhTHYyNWlO?=
 =?utf-8?B?LzBhdUpkcDBKWHdsZDFTS1h1dDhSWVVPVDdWMFNzcDVOaWx3K0NIRWxkQlh6?=
 =?utf-8?B?MklmWC9JdnhvSzNEU0dCRXdOMHlicG5VaGNyZWYvZGtDc3d4N2JnbGlZcUJR?=
 =?utf-8?B?N0VKNHRIY2pBc0xpekhFRzF4YVJPRzZhd1lQWmlIUFgrdG14b2NRSWJXZjJ2?=
 =?utf-8?B?bXY1VCt6clVQU0R4VkcwNDJEekdaQk5xYW9TSkE3RzFMWjU5ejNCSkkwdnZ5?=
 =?utf-8?B?Rm1XU0t6ZUt0RGQvclRXOTE0MG1ic1RwbDNySm1zZUFZRG5COXZITjhsOFdH?=
 =?utf-8?B?bTVCblpvVTJPQ0VXY3UzNUkwRy9uRDlmVGZzUTRYQVcyc1ZFUVVDYUFNMjRj?=
 =?utf-8?Q?sUPA+9aEwX2WRpMwZiIpmb2gC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245c4db0-0cab-4b04-0db3-08dd156d9531
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 20:44:15.6764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18OmjIEhigq5G7tPpFHVivEDeEI8MZQsAPLrPltehcLsT0zYVl1GsMNNbA6teHTu68K9DUyQitbR5ycdlqfhLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Dec 2024 20:44:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9042

--------------n7T5IARMDp3YVddVql0cllcv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/4/2024 2:17 PM, Christopher Clark wrote:
>
>
> On Wed, Dec 4, 2024 at 7:24 PM Gundlupet Raju, Sandeep 
> <sandeep.gundlupet-raju@amd.com> wrote:
>
>     On 12/4/2024 11:35 AM, Bruce Ashfield wrote:
>>     On Wed, Dec 4, 2024 at 1:07 PM Gundlupet Raju, Sandeep
>>     <sandeep.gundlupet-raju@amd.com> wrote:
>>
>>         Hi Bruce, Chris,
>>
>>         Do you have any more comments on patches? If there are no
>>         comments can
>>         we get this patches merged?
>>
>>
>>     I haven't reviewed them yet and probably won't until next week.
>>
>>     Generally speaking it isn't wise to attempt to rush a merge, in
>>     particular when it has been 5 days with an extended weekend in
>>     the middle.
>     Ok sounds good.
>
>
> I do have a general comment on the series that I would like to see 
> improved: as posted, it isn't bisectable and my view is that it should 
> be made to be.
>
> Patch 3 introduces a file defining variables that are already defined 
> elsewhere, and then patch 4 removes them from their previous 
> definition site. Since these are not combined into a single patch, the 
> layer is temporarily broken, when patch 3 is applied, and then fixed 
> as patch 4 is added, and there are lasting consequences for consumers 
> of the layer for this class of breakage.
[Sandeep]: Chris sorry about that looks like my scripts didn't generate 
the patches with right branch settings. I will take a look. Bruce will 
you accept new bbclass patch for scarthgap release?
>
> A simple negative consequence is that it adds complexity to the work 
> of managing other branches where commits are selected from the primary 
> development branch: the second commit must _always_ be taken whenever 
> the first is - that's not a terribly unusual constraint when working 
> with series of patches though, and many patches make more sense in 
> groups. This is not the primary issue.
>
> A more serious and expensive consequence is that it blocks the ability 
> to use bisection to hunt difficult bugs in the system. If testing 
> indicates that a defect is introduced somewhere between two distant 
> commits to the layer, an efficient way to identify which commit 
> introduces the fault is to iteratively bisect between the two points 
> on the branch, and test a build at each - if it the fault is not 
> present, retain the patches applied and bisect the remaining ones to 
> apply more, and if not, drop the most recently applied set and bisect 
> it to apply fewer of them, and then retest. Iterating this way to 
> quickly find a single problematic commit is a deterministic process 
> and often automatable - see "git bisect" - but that depends on each 
> commit on the branch being viable, and not introducing intermittent 
> breakage along the way - if that constraint isn't satisfied then the 
> build or testing process is frustrated and the process of steering the 
> iterative bisection becomes more difficult, often requiring informed 
> engineering expertise rather than simple automation, and so much slower.
>
> Builds are expensive, testing is expensive and engineering time is 
> expensive, so doing the work to support bisection when patch series 
> are developed and merged is a valuable contribution to support the 
> engineering environments that consume the layer, improving their 
> efficiency and assisting the development of better quality software 
> and systems.
[Sandeep]: I totally understand on merge and build time.
>
> Christopher
--------------n7T5IARMDp3YVddVql0cllcv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/4/2024 2:17 PM, Christopher Clark
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CACMJ4GYnwxR3TP_ERF77H9_u3=znGc_fPehjOhBLxR-4fj_AVA@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Wed, Dec 4, 2024 at
            7:24 PM Gundlupet Raju, Sandeep &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;
            wrote:</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <div>On 12/4/2024 11:35 AM, Bruce Ashfield wrote:</div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div dir="ltr" class="gmail_attr">On Wed, Dec 4,
                      2024 at 1:07 PM Gundlupet Raju, Sandeep &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi
                      Bruce, Chris,<br>
                      <br>
                      Do you have any more comments on patches? If there
                      are no comments can <br>
                      we get this patches merged?<br>
                    </blockquote>
                    <div><br>
                    </div>
                    <div>
                      <div style="font-size:small">I haven't reviewed
                        them yet and probably won't until next week.</div>
                      <div style="font-size:small"><br>
                      </div>
                      <div style="font-size:small">Generally speaking it
                        isn't wise to attempt to rush a merge, in
                        particular when it has been 5 days with an
                        extended weekend in the middle.</div>
                    </div>
                  </div>
                </div>
              </blockquote>
              Ok sounds good.<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>I do have a general comment on the series that I would
            like to see improved: as posted, it isn't bisectable and my
            view is that it should be made to be.</div>
          <div><br>
          </div>
          <div>Patch 3 introduces a file defining variables that are
            already defined elsewhere, and then patch 4 removes them
            from their previous definition site. Since these are not
            combined into a single patch, the layer is temporarily
            broken, when patch 3 is applied, and then fixed as patch 4
            is added, and there are lasting consequences for consumers
            of the layer for this class of breakage.</div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: Chris sorry about that looks like my scripts didn't
    generate the patches with right branch settings. I will take a look.
    Bruce will you accept new bbclass patch for scarthgap release?<br>
    <blockquote type="cite" cite="mid:CACMJ4GYnwxR3TP_ERF77H9_u3=znGc_fPehjOhBLxR-4fj_AVA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <div><br>
          </div>
          <div>A simple negative consequence is that it adds complexity
            to the work of managing other branches where commits are
            selected from the primary development branch: the second
            commit must _always_ be taken whenever the first is - that's
            not a terribly unusual constraint when working with series
            of patches though, and many patches make more sense in
            groups. This is not the primary issue.</div>
          <div><br>
          </div>
          <div>A more serious and expensive consequence is that it
            blocks the ability to use bisection to hunt difficult bugs
            in the system. If testing indicates that a defect is
            introduced somewhere between two distant commits to the
            layer, an efficient way to identify which commit introduces
            the fault is to iteratively bisect between the two points on
            the branch, and test a build at each - if it the fault is
            not present, retain the patches applied and bisect the
            remaining ones to apply more, and if not, drop the most
            recently applied set and bisect it to apply fewer of them,
            and then retest. Iterating this way to quickly find a single
            problematic commit is a deterministic process and often
            automatable - see &quot;git&nbsp;bisect&quot; - but that depends on each
            commit on the branch being viable, and not introducing
            intermittent breakage along the way - if that constraint
            isn't satisfied then the build or testing process is
            frustrated and the process of steering the iterative
            bisection becomes more difficult, often requiring informed
            engineering expertise rather than simple automation, and so
            much slower.</div>
          <div><br>
          </div>
          <div>Builds are expensive, testing is expensive and
            engineering time is expensive, so doing the work to support
            bisection when patch series are developed and merged is a
            valuable contribution to support the engineering
            environments that consume the layer, improving their
            efficiency and assisting the development&nbsp;of better quality
            software and systems.</div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: I totally understand on merge and build time.<br>
    <blockquote type="cite" cite="mid:CACMJ4GYnwxR3TP_ERF77H9_u3=znGc_fPehjOhBLxR-4fj_AVA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <div><br>
          </div>
          <div>Christopher</div>
          <div>&nbsp;</div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------n7T5IARMDp3YVddVql0cllcv--

