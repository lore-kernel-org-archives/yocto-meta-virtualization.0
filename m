Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7ABC02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:45:52 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.44])
 by mx.groups.io with SMTP id smtpd.web11.3877.1737143147821054581
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 11:45:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=2/Ka56xG;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.44, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUEBQWX3BEGNrLRbmjiVMfPpPq23ur4ZdStGhwPMLtCHn84HhBKSn++WoWgREs5sL4hC/vv45fGCdMKYi3b/Wd7VRySF19ro2jSL2Mi3wbaOxW/Oxy7WJiP/iniQq7/b+n+6nFBPRxywsLAYT4T+GhqsC2wyDGPUAj9H+ZDT9DDu9sLg88wjJ2HORcdY8G8VIpI2Li3fopzfeXL7kQQoOnhwD62MA9TKJ7KZmkGy8OHcKN2O1M47ZTgzUPEAHyJ/u2KVDf88z2SpCTpG8bqsViPeOAvDUY2DCXDLB8NAM0r7F09RV+SS0zJGonvLVGdYuv3IMC7gM2NK2s/fxFMziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWIxCbbzqRHWIehCgJS/cusQrQ6FYTIDXdDcIoyk9Fw=;
 b=qiY2bV1ksI3mB1/fkT4WiL7+1maK563U2l89clfcOp9aTyl5nxH2A5SI68WqXZIrY9rmFeXO4Q/i82+Ez4q6XXd2MKJhx02YhDuJzNGtgja5QnwxbCFOFGVQtoT14Bdzx/Z87AnOIzALoPW749FjGZg4P2eoTvsi0Vnf02o/GoX4KxjplPAPZWva+qFyNyJUki9537HGTg11LUyRQ2Tzlny8s4CvD5fq0VR6gCNcB9IuWNcVPGYOLqexV98J+mHixgUqWo/MaSK0fzlfrJyYMuaJEUCFtdDJoQ7qHu8MyqZ0+swBHt6+Knyi7mjEaETQMGf1mUz07OdEqzv/+ol4jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWIxCbbzqRHWIehCgJS/cusQrQ6FYTIDXdDcIoyk9Fw=;
 b=2/Ka56xGf0xpeHVWNrGi4a4W5xc3jci24hFkJGBZS72GtSuUiaqpoiM2YN6L/3sZQoWdhI7s663wsNAG78pq7KdMPiJXei+Ql0QzWHoU01FZAwjJ7+t7vb+fckXXwNTOY6SkvYI3osHnzxIJGt8UBZ+lHcymQh2UTb3MV0rZQ+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by DS0PR12MB8367.namprd12.prod.outlook.com (2603:10b6:8:fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Fri, 17 Jan
 2025 19:45:45 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%4]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 19:45:45 +0000
Content-Type: multipart/alternative;
 boundary="------------N606lQ7xCDUZmIyU88Z9aNpA"
Message-ID: <f5c2e56b-1601-4de5-a9d6-29b6f1fafac8@amd.com>
Date: Fri, 17 Jan 2025 12:45:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][styhead][PATCH v5 2/5]
 xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, mark.hatle@kernel.crashing.org
References: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
 <20241209145442.3291634-3-sandeep.gundlupet-raju@amd.com>
 <CACMJ4GZRusBUrxF-zRywgQhMfT+U_1-FR4yENn7bkZu27zfzgA@mail.gmail.com>
 <CADkTA4NyLmdUTMKFAF6sxKc0_RX83guy5k7Lmkf2ztwBOGxG3Q@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CADkTA4NyLmdUTMKFAF6sxKc0_RX83guy5k7Lmkf2ztwBOGxG3Q@mail.gmail.com>
X-ClientProxiedBy: CH5P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::17) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|DS0PR12MB8367:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c27e5a-f96e-4de2-bd0c-08dd372f88e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RFYzbkNYcm1nZW5mMXNTTG1DbjA4bzVldHVSYlB2WGZHZFZYMWtBTjc0V1c1?=
 =?utf-8?B?ZDBlVFQ4KzdUdWpSSncvTExrUldRa3dwMlhMbk94OG43NVZadzlHbTJLUjN1?=
 =?utf-8?B?UUpEWmtuZ3k1Wkxld25kM0ZEZGtZWWRRVlI5a25TdjFoc1RTRTExL0tQZ0sz?=
 =?utf-8?B?a1IzeitPeDJ1RTNSc3FhaXFVVTdPTHF3WlRZZkI5VlpuNEFqVjhRTUtwUWZX?=
 =?utf-8?B?OWRNcjJnb2JKSHl1eHFOT29CUms1UnlpRXdKY2cxTklxSkZOd0U1ZnpSeVN3?=
 =?utf-8?B?OXRFSmdiZ08zNnUyK1VqYlBkeGxCa0JJa014Y2dGcWFocVhBbjU0VE9IMU9U?=
 =?utf-8?B?d1AwbkRhZEJRbWFqUVV4OXl3eGNkeUt0eFFId0Z3V0xNMVFMLzVhS2oyeEo1?=
 =?utf-8?B?M1dNaysvVWs4T2xKMGcwOWdyQjlUYlRDaytsdmFRcGpScU83T0RScHp0Q2tl?=
 =?utf-8?B?R2pYaHRHL1RQMFVROHlJQnFUV093dlBnemVoV1IvSG9vT2ZzUTBPMXpFVndj?=
 =?utf-8?B?c3NFblVFditQbkdWdWtOQ3ZETGJmZU5xeXlCb3lPOFZSSGd1UzJocjBQanJC?=
 =?utf-8?B?cXpETld2ZVZQcGJJdlU1NU94ejNHWUVHZHh6SENEV0ZHcDY4K0hsR2RRLzFB?=
 =?utf-8?B?VHVLMXMzRXJDeHdtaTBwcktHdjJIRnhnYmpIYlQ5UWc3WmNIZ1Q0VHN3MEpY?=
 =?utf-8?B?aHNsN1l3Yk1CM01lZkdISzdIZlBHdFJLWjcyNjVGWFh2WFVKb04wdzhqUkNB?=
 =?utf-8?B?ZWRLWEtKb2xPd2w3eiszVVd3bzZ4NkZCSEIxRXplUWtobUFmNkJsQlVpOHpN?=
 =?utf-8?B?WHpyRjFkalVXdEdxYjZjdnlxRkoxOFNOM0x5R1ArOFZkczlRaytQNTRTNXRY?=
 =?utf-8?B?MUtsR3NHK2dWT2MxU2ZzOG9MVlVhNkFGc1ZMcy9MTElKczdNOWNTcCtKS09q?=
 =?utf-8?B?YXc0NVlNSUgzV0k5VThGWVl1YmtPN3dZUy9VS2tDeDRRR2Mrc1dNSWFJNGdt?=
 =?utf-8?B?T1RNV2xCYUVjMjJia0ZiRHp4Q0Z6cHk1d3Bqd1BKV1BDVm1Md29IdG80aG5Y?=
 =?utf-8?B?YUxWZHZydVhxME1WSjNYL0xQV0tIajUxTXpydDZQZzQ4Z0RuUDlPa0NMU2NT?=
 =?utf-8?B?YmhQVjQwaVpqd1BQZmxFOXJza0VZM1hmUm1GYnQrL2FzTlllbkJ4NGxuKzdF?=
 =?utf-8?B?QzJ4aFFJeVF3cTNwb2dQOGYxS0xhcjhNLzRlMFUxUDc5Q3VTRnZ0Q3RndmpL?=
 =?utf-8?B?NFlqNDIzR29jc1RlVGtkbzdaUm9lRXpHNlRmU1VKVEF1c3F4UVNZbndCdTNj?=
 =?utf-8?B?Q2tKbFhKaldrZDBLNjZydGcvaFFQTUY3RlFWdFplRnVGRU5iYmxpWmxubTF6?=
 =?utf-8?B?RDJReUNSVklUN2RlL0YvNG5relN4UDdXNnczWmFRMWMzZ0RPYzBRaFlJK1Vs?=
 =?utf-8?B?M3JXQUU4SWRpZkVJSWp2WGNEVjRoL3kxejFjZWk2UDVoUDA4R2k4MnFlTGJa?=
 =?utf-8?B?SDVENDRNaVNRcHdCQVpYb3AvVVdyQllkMXJtQVZHa0RjMldqZGEvOHhSSTFs?=
 =?utf-8?B?dlAybldlSDBSZEx4ZWVoazhLK1p0dWJxZXFhUEFIclIxU0xScEJGVW1paU8y?=
 =?utf-8?B?SHoxdVlvc2xJVnhCL1lFYU04dkVCV29mYVk5M1FsNTJpM0I5VCtxd1NxdFBz?=
 =?utf-8?B?RkV6dkpXd3o3TWZlc0gxWFhKdjRvNDdDVW5PNmVCa25VcVZjRGFpTVhob3Mw?=
 =?utf-8?Q?hs0mdJD1wKlgNcsEBd7QFXunrexT8A/q3maCysf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eWRaM3JPUjFjOHlJWHBlVHgrMXVHSDlwRFlUZHdBd0N5M2oyYkxvaU9kUzBu?=
 =?utf-8?B?aG95bXZaTnFCMSsrSjZFTW1HNjBsakpiWjJtOEhYekMxc3lXM3NvTGI3V3M3?=
 =?utf-8?B?YnhGeUNwNnpJWmJyaXVUdjFNbFZmV2EwMkNLQWxjaElMdGw4K0grb0tJVE5h?=
 =?utf-8?B?VWFKM0tuMkZqYWdDQW5MbkM4NkZYODlGa3RWWHlDVldPREo5bXdoY1E5NU9l?=
 =?utf-8?B?OUI2OWliWllyZXhWaFpRak80c2hQWmZ1QWF5S2VlMVNRQUcwZnBxK2dKQjk1?=
 =?utf-8?B?Z1pjalFZRDR2MjZYRlRmb1VRVmJtdStwb1UxajBsTUlXUmNPMzRyK1VXV0to?=
 =?utf-8?B?aGZ6K2c4RFYyTlRLaTZ5a3pibUdONGQ5NFpEQ09BdjRqa1ZyWkpvMmpNY3Ni?=
 =?utf-8?B?UnR6ZmxKN09JU3JIR21jd1NRRU90cEtpYjFTaC91MW9Well0c0xabWxjcVh5?=
 =?utf-8?B?eEFmU210QzZoRWhjU2hmL210cEZiQlF6YVJJeU5pcVRENTBsaWd2dXo4aWZa?=
 =?utf-8?B?S0VuYzczYkRQTWd5UVVBbjdtQzNaVFhGYkVjdUE2cEI2WHFhRllwNkRFNXJz?=
 =?utf-8?B?TTM3cHdwenphZjcyTzJHcFdoYW5iaDF3aVhHcDRnN2JPanM5VUVsZlh4ZUVa?=
 =?utf-8?B?dStWdzVGNEh0eXB4Sk9aNW9PZk9SNGFmTEE3ZG5FYll2NWV6K0E5VWhsSmpI?=
 =?utf-8?B?Um1hZit6QkxWY1ZXNTRuRW1yazJqUi9BNisxcExid09UaGsxdlJtTFE1RDBz?=
 =?utf-8?B?anFzZTVBRkl2bjJ5UzRCckNUazNzOE5NcVZTNUlJdW90V2J1dExneGFYd1dz?=
 =?utf-8?B?ZmFha3BNMzROdVg4cUZMNEI0Q2YyZUpUenZVbzVURS9pb0lzbVNJOE9GaUpJ?=
 =?utf-8?B?MlJpaldBSjcwcmNEQ2tObUU2U291bU5iNDJPMzBGMmM0OGF3MFBpN0x5OTJM?=
 =?utf-8?B?cjdvZlhjNEgzTHNiRENZNTZEVXUzOGdXUjlUekhpdzB2aHlGQ0h2QkhZc2lN?=
 =?utf-8?B?R2sySEdmMWIvaE1tVkl3aWdlSmpqUGU3dnA2Ync2cy9SMXNEMTJ1c3BEdThx?=
 =?utf-8?B?MTlUdjFaTjZXNTh4a0pFRjdnTHZGR2VSZWg5Qm9OMWxjUituMkNOc2V2NGJm?=
 =?utf-8?B?QUdMQVBIMzh3SGdZVEJ3RnQ5ZFFGYkFkVllNRUFJTW5jZHRSbmQwR3hOWU8w?=
 =?utf-8?B?Vmdib3I1T0djOUNKMktUemxMbnVTZ3NtZXFQSzdWZU4zNGNpeE11eWltbnMz?=
 =?utf-8?B?alcrRlZzWFZ6YVFnSmN5bVkrZUVGUXV5bWl0b1IwVUludUJIb3FYWW11ZGpH?=
 =?utf-8?B?bzdlaFZSOEdJVjFuMk1jWUlMUkJmQXh1Q2tJWHFnTkJpN1BNZkt3VzN3YVRM?=
 =?utf-8?B?bFBtK28xeTdLK3Y2STN5OUtZQmRYZ25FRGZkWGtvWlc3K1RUbUwxTFFPMm5M?=
 =?utf-8?B?R3JnNzkzWWNTbmNDRmRhYmN0QTZsTk1kb1RtdHZTVWRQQlJVU1prT0RieDVT?=
 =?utf-8?B?OVcvRjZXdTZ3S2MydkZvRWxJTXpnTEJDa2RuMndDSU42dXlMK1FFMTFaaEdE?=
 =?utf-8?B?RlR1UEF0MURBNENKV1BqYUlObFZMdWx5cWx4Z3BnNVFjUmpKV1ovQkJoSjlB?=
 =?utf-8?B?T0c0QlNZOWpWdWpxSmZxYWtodktIL2d6di9DMGJPWTVEWlJWSmdMcHp5dlVy?=
 =?utf-8?B?VkpXZTc1ZUZjQy9ETkM2YjJmYWVSVEs1MEZMS2FpQjRFd3Mra0RvZ0RBRDZ2?=
 =?utf-8?B?SHFMOFRRM005bWZWN09UQWRFanFqeTJvRkxNTkJSekE5Tm9xd0sxUFBYRTEx?=
 =?utf-8?B?RVQwOFRrNVRuei9GdnhSRFFheVhablFNRW1HRmZORnhTNWI3b0YzbDJaQzB1?=
 =?utf-8?B?dW9MTHFpZk1OQlhLR2ZVUS9kYSt2M3d1ZDg3dWJPVzRJejA4b1MwdWdwZ0ly?=
 =?utf-8?B?NTJuOXVKUjA2c1IyOHg1bFhIa21zcmxPWVNZM1hqK1llazNkTm9mWFBRKzFD?=
 =?utf-8?B?bGI0OHVtNUxtbmZMZHM1MUgrWHpjaFRkNzJZeTZxWFppSmc1TVhmQVV1ZWtV?=
 =?utf-8?B?aFoxVm1lTk1kUTZZZjBKMTR5T0tGM1dLYytSeUllZ29TZ0VZQXZuZ1BlT0tl?=
 =?utf-8?Q?BM7sQvffF+ZD+3G7atad8W+dC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c27e5a-f96e-4de2-bd0c-08dd372f88e8
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 19:45:45.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hO/BI/7BOw27SDE3cXGCfzqkDE0IA/g14Y3Pwn3dfFB86eSD4XoOu9EmEFrqlA2lKl3Zy3HFnfpDMVzbWxcN4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8367
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jan 2025 19:45:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9099

--------------N606lQ7xCDUZmIyU88Z9aNpA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bruce,

Sorry I apologize, I missed this email not sure how.

On 1/17/2025 12:14 PM, Bruce Ashfield wrote:
> FYI: I was waiting on answers to these questions, and a possible v3 
> before merging.
>
> Bruce
>
> On Tue, Jan 7, 2025 at 10:33 AM Christopher Clark 
> <christopher.w.clark@gmail.com> wrote:
>
>     On Mon, Dec 9, 2024 at 2:54 PM Sandeep Gundlupet Raju via
>     lists.yoctoproject.org <http://lists.yoctoproject.org>
>     <sandeep.gundlupet-raju=amd.com@lists.yoctoproject.org> wrote:
>
>         Inherit xen-launch-config bbclass to use common xen launch config
>         variables for xen-rpi-u-boot-scr recipe.
>
>
>     There is a functional change in this commit that would be
>     appropriate to mention in the commit message:
>     it introduces the use of KERNEL_IMAGETYPE to identify the dom0
>     linux kernel file whereas it was previously assumed to be 'Image'.
>
>     I think this is an improvement, though I'm not able to test it at
>     the moment.
>
[Sandeep]: Yes we can take this as enhancement.
>
>
>
>         Signed-off-by: Sandeep Gundlupet Raju
>         <sandeep.gundlupet-raju@amd.com>
>         ---
>          .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>         <http://boot.cmd.xen.in>       | 10 +++++-----
>          .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
>         <http://xen-rpi-u-boot-scr.bb>       | 13 ++++++++-----
>          2 files changed, 13 insertions(+), 10 deletions(-)
>
>         diff --git
>         a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>         <http://boot.cmd.xen.in>
>         b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>         <http://boot.cmd.xen.in>
>         index 98742200..b0ed0dc8 100644
>         ---
>         a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>         <http://boot.cmd.xen.in>
>         +++
>         b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>         <http://boot.cmd.xen.in>
>         @@ -5,13 +5,13 @@ fdt addr ${fdt_addr}
>          fdt get value bootargs /chosen bootargs
>
>          # Set module load addresses
>         -setenv xen_loadaddr     "0x00200000"
>         -setenv kernel_loadaddr  "0x00400000"
>         +setenv xen_loadaddr     "@@XEN_LOAD_ADDRESS@@"
>         +setenv kernel_loadaddr  "@@KERNEL_LOAD_ADDRESS@@"
>
>          # Add some space to the fdt so we can edit it
>          fdt resize 0x1000
>          echo Add boot arguments for Xen
>         -fdt set /chosen xen,xen-bootargs "console=dtuart
>         dtuart=/soc/serial@7e215040 dom0_mem='@@RPI_DOM0_MEM@@'
>         @@RPI_DEBUG_XEN_ARGS@@"
>         +fdt set /chosen xen,xen-bootargs "console=dtuart
>         dtuart=@@XEN_SERIAL_CONSOLES@@ dom0_mem=@@DOM0_MEM@@
>         @@XEN_CMDLINE_APPEND@@"
>
>
>     Is there a way to ensure that if XEN_SERIAL_CONSOLES is unset that
>     the dtuart= argument is not passed, and likewise for DOM0_MEM and
>     the dom0_mem= argument?
>
[Sandeep]: May be we can implement this in two ways. Do we need this 
right away or we can take this as enhancement.

1. Set dtuart in bbclass similar to XEN_CMDLINE_APPEND
or
2. We may need to use u-boot hush shell if condition method.

>     Christopher
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
--------------N606lQ7xCDUZmIyU88Z9aNpA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
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
              <div>it introduces the use of KERNEL_IMAGETYPE to identify
                the dom0 linux kernel file whereas it was previously
                assumed to be 'Image'.</div>
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
                dtuart=/soc/serial@7e215040 dom0_mem='@@RPI_DOM0_MEM@@'
                @@RPI_DEBUG_XEN_ARGS@@&quot;<br>
                +fdt set /chosen xen,xen-bootargs &quot;console=dtuart
                dtuart=@@XEN_SERIAL_CONSOLES@@ dom0_mem=@@DOM0_MEM@@
                @@XEN_CMDLINE_APPEND@@&quot;<br>
              </blockquote>
              <div><br>
              </div>
              <div>Is there a way to ensure that if XEN_SERIAL_CONSOLES
                is unset that the dtuart= argument is not passed, and
                likewise for DOM0_MEM and the dom0_mem= argument?</div>
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
      <div dir="ltr" class="gmail_signature">- Thou shalt not follow the
        NULL pointer, for chaos and madness await thee at its end<br>
        - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
        <br>
      </div>
    </blockquote>
  </body>
</html>

--------------N606lQ7xCDUZmIyU88Z9aNpA--

