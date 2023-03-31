Return-Path: <joakim.roubert@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05002C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 08:07:47 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.49538.1680250056498145806
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 01:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=LSLo3NSV;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680250057;
  x=1711786057;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+aikt/uRcliz3dzmVTPBN4es1hAU0tVkpVG4R5JyVeQ=;
  b=LSLo3NSVt1FmD+VuqxQyTYx3GH1SOyBgUPrjYO0c9/RVM19RtBtPbhhh
   dWXPXH6iPra6SThdXL33aMKNs4M0GTqCuB2iRcuYeWsf05t9M0OKHnHcL
   VzVllNTj9tXDRbqdVHTlLqEEpwbY8di8iTveLFvrbYGgrz+6WsrSE12Ui
   SIkzUQLlCS4Qc96pySH3khuWt/hV1b8OupOs10Vot2BetXda/imWzxklz
   /C8xhmZKEYgqW6MhA7J0Xr0DseE8Crxs2rY0IiHLB1aOpk7s0YIRP2dne
   8GM+4pVrbX62f7QJS/lBGiQvPnyMx4MqmutTbZiBa0G4Oa9ONNtbOPWDp
   w==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AND0/el+bm5oKOv5JOvg/KTwvTCSyJVZdvuF2OpAcZNo1LKZ//sHqgLxI05dksxISysGWOOTikmjvdAVQB2ukxN/sv8jVCKEyy4CdqB3CpMa30gxCz14Xo/WnQ9ZhsLpoUho31h9ULUUvEqFZ/31tleJ5Cs1V3C6nOi2Pm33Wp0T7EHcN4xBZV57+WN3gEgKEPWqjK5Vx/3N1M4HqnY6G97gQlA6I4bb1oi5q751UpHSzeDfRHq4s1AdmuA3KztXh2FodGKeQIE0coNOvLo52YunW/RcPCdiAzsptoTtbwVQlMuK72s/bBpQQkS2tOm9Il1s13pgwww9vjCnnuwvGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aikt/uRcliz3dzmVTPBN4es1hAU0tVkpVG4R5JyVeQ=;
 b=GLj9ZJPR+GjC8ssa0zhH4JcG3obq+h9De7ZfCHDhSZhJ8nZ4MkyqfKG44FDn6MCRuPmHtRPAlTW4PDiDSPG/1sXXGLDL/aRFxVoNLOMy68GT/lwKevGiTvuLbjrltDP0Kj+EYdXdOoXaxyl7gP9p0ttJHyqavCYDBLR3offK8XRuyDtdMinuC4w3vJjsONaNYCkMTVm+MWGrFOY3fbWtDwCZorYn6+XvUfRt/aRBIOfvMYZ193jlsGocOl/LXdWSSlbBZGrTjJvMTbio4Z8Hp/yw4zKbfe3hkGkTsBpcjzv7o4S3D0Iv9Gggv82ZRXGASPOf3wMAWxUZCfx6Hycffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aikt/uRcliz3dzmVTPBN4es1hAU0tVkpVG4R5JyVeQ=;
 b=Tfz7jBLFo6qXnqWWzNnuccbbC5vJJ3ZqLOxeWMU7xjQsbO7va6dxRwZi+v7N8/PTthWL/NQj7M1Rb8chuLYwLo7qKfUTHQGnnPaY99Il9UF/NciX8iUEaSci65RH+9qG/oBjkSxSBeB6W4IEz2hiLpsWm7Dk71vfyhowKD6o3Vg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Message-ID: <566ccb86-0063-832e-580a-c619bbd4d378@axis.com>
Date: Fri, 31 Mar 2023 10:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-virtualization][PATCH] upx: Bump to v3.99
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>, Joakim Roubert
	<joakimr@axis.com>
References: <20230329141847.337386-1-joakimr@axis.com>
 <CANPvuRnL62+UmHEBMkiSqadLD5HnoX=kiDkep-pXoxcox+KXgg@mail.gmail.com>
Content-Language: en-US
From: Joakim Roubert <joakim.roubert@axis.com>
In-Reply-To: <CANPvuRnL62+UmHEBMkiSqadLD5HnoX=kiDkep-pXoxcox+KXgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0003.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::14) To AS2PR02MB9389.eurprd02.prod.outlook.com
 (2603:10a6:20b:59f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR02MB9389:EE_|DB9PR02MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: cefb12bf-cc8c-4589-4cbb-08db31bef9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w2Vbo4q6hD6LVCVvA22+KsFVFM42jfgFWyHhv0uLhn7Q9D9nakqRxbxe1mdW5sS00qFi9rdzgU3pGMPNJg5WizHtnnr9eXqL55jIMJ+kogi9gJVEjiXDsZ98bvwHvoxkpJM1Jh4BTwpQ4UMgJEir02IrE1rYgnu4FuJkxgh1cVX5nE08QkPLDMU7YvysJjqwgnHz0eEOQtFECggnl0x5bg999v23Qp/58fNsKmWAtMJCbsRnYr4fQo3ROW69IqPezRVqg1kbNhCj9M3yuuYZwWidt1G1bOtu2asJTV/tHG1NXgy5ajGnKUm+7+VWgrdJBSripqWMzgC3LfBzONPg9MD9BCBlvS229yAtTvtH9sT5v4Awf+tIEQRamVtU5WhWfQGGgkJfr97JDARGBpJiniPt9AHG7xyBrxwa1ozeWv6OKqyK5Ro3vd242nWKdAVVgoQIVuegBqpXiESUNBGW89guCJh9QrZM0pYJzwGGQErspGGmkBbFXcCXzdPJzAL6P1m0SXznDgsM78zDe4Utzd5WAxa68DRm8ZK6tr/CBKSs8Hkehco1sU8qsjRJyN8UHyt/78lT9aC/4da0dS+L/iNCpHh0SgkMTOi/DnO6ntqQ/fQhLBkYujss6uWSzj23QxhVv5bd+HWujnJHwxWcJoqKWYKxEkLHhHBpjuCAn7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR02MB9389.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(6506007)(186003)(107886003)(6512007)(53546011)(83380400001)(26005)(66574015)(41300700001)(2616005)(66476007)(316002)(66946007)(6486002)(4326008)(6916009)(966005)(8676002)(38100700002)(2906002)(15974865002)(36756003)(86362001)(31696002)(5660300002)(66556008)(4744005)(8936002)(44832011)(478600001)(31686004)(45980500001)(43740500002)(18886075002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTVEN1duUkdjRmxDd2FvckxKMkNQQ1RiT3pyNmd2Sy81am9FelYzUGFoeEpG?=
 =?utf-8?B?d0dGVkNndjVJN0V2Wjd3UUQwbU94NWUxR3dSMUFtY0VQbkNkQXZVMlJ5c2lx?=
 =?utf-8?B?M25GclJsNDZKN2xkV1Z6ekJESGdIV1NWM1NGQndGVUdzWVBySXR1Q3VMbVNG?=
 =?utf-8?B?Z3dPSUt4SXdONUd5ZEs2dFVpWGlJalluZWpaZHRFSGZmU0xObmxUb2ZjSXpq?=
 =?utf-8?B?NkdlcTM2dVpDSk02TXZQR05MazlnV0hBcW5KZmNycE5LYVQ2blNYS3l4NWtE?=
 =?utf-8?B?WVJOR0hwandqR2hTVHV2b1RTME8xVlhVbTBvb3N3eXRSU0xJQ09FU3ZZdWtY?=
 =?utf-8?B?K1RHVHZNZm1oSHhNUHBZdGtpTVRRS1o3M0crdEJEUlB0MitQeTdmWktocjVl?=
 =?utf-8?B?eGFBRGxycHFpZGszSVFiL0hoRFBuUjBHd290RDZWZkhzUktHRThUUWgrNXBo?=
 =?utf-8?B?ZUcyRmsxYko0ckM0dnJxcmRYaHRpSk14V2xwUzA5RGtoN2IrNy93SDVFekt3?=
 =?utf-8?B?RTJ2RUZuVmVQUkRWRUlrdjdGKytXUGtGNmlUeDkxM1NIbWFRUWxDVU1qNml3?=
 =?utf-8?B?N25SN2lYc2NpWVBaQzFoaEZGZm1lOUphY0pMTkVodEJMR1YwakxjWElSbHVw?=
 =?utf-8?B?ZU9sRS9uaXpEQ2lwQXB5RXJkVjN0ZlBDbGRxbFg1eGRiV1RQRnJMVER4RHdq?=
 =?utf-8?B?a294bHV6QzVKaFp2aFFrQjJNaWtDRUFQM0YyMzN0NGFmSHVSNlB3OVhmQkYr?=
 =?utf-8?B?V2VhdVRURHY1d2FqWUxoU2VpWkZHck9MVEQ5MzhhbUJrMHh1dEJXbEpvdVVI?=
 =?utf-8?B?aWJvcHQyQzRHN2ZINzM3aXJJVFFmdWtsUklzTzJXVVVmNjNlV084eWtsRTAv?=
 =?utf-8?B?VTUvSVRpQk8xemJ1dU1HcS8vZW5VS1crbFoxQ2FoTE5HRnJkcnpFeHpFeW1u?=
 =?utf-8?B?dW5vZElpZGFXRGVSMmV6c0VEcCtKcU1HWTRLbUlHOXlRbGtsYXRaMDQxNlBl?=
 =?utf-8?B?QnF2NnpCanVJMit5eVNtMVJMSW5GeUN6MXIwMmgyRmxTT3NBRkNPeHJ6YVFj?=
 =?utf-8?B?TkFBNlhNMTg5Wk8wU05oM3pzTElMcXlmeUhlNGpxTWdKYUY1N2E0RWJBWGVG?=
 =?utf-8?B?cmZNa29RZEpZR20wNUtpTjVRMHNSVUVXY3dWMXc5cGhpMGJvTDRFejdJdk8v?=
 =?utf-8?B?M3FoMGxickJWbmxnRnYxREg3a3VIZ3NtNEJPQTVNQnRlT1hZRWhWei9HQ2x6?=
 =?utf-8?B?UnNTV1hSd3BKYW9jMkpKMEdLWkhqWC9TR1MwUVhQaHRzSlp0a3p6N0lEYnFL?=
 =?utf-8?B?MWJJQkJTSDF3YkZ5N1BsYUt3UzlYb2NTSXhMZUt3b3VwUHplOVdJeHgzODdS?=
 =?utf-8?B?UTZiSVMwSGdUUUpVTXVmS2NKTGNOK3JJTG1VZFVOQUx6MG1rVDY0L3FrV2VZ?=
 =?utf-8?B?Ri9tM3d4OS9xcUoraWdyNWhLNE9ldzhYYXNOSjMzMjN6WWl1Y2s1SUxSV1Z0?=
 =?utf-8?B?dXl1U21aazZ0aUlJMHkybEpudWoxbHJTRDBoTDd0RFhnR3NXaE9IaWcramNp?=
 =?utf-8?B?TTZoNXh2cHFiNGdHeEl0V0hRWklUcUUzZGFHYzFYTUJlZUc0cHJsdG9jbDVG?=
 =?utf-8?B?YzNwdkQ3OUhaekgwYzUydVVydlB0U1M0UmhTVzViWStvVDdybThmeU1xang2?=
 =?utf-8?B?WWtUSU9CSXd5QStaQ0s0Ky9vRGNFMlMwYmtLWnRMSm1GWlpHc2NGdlpsQTlw?=
 =?utf-8?B?eExVQVcvMGw3ZWN0OGkxcGFhcHFUc3dIb3hJaHdhdDJmN2dqYlJQa0dTc1BJ?=
 =?utf-8?B?K3FZL0MxZzZxTzQ3V3czZ1VXR2QwTkZlQVpHbDhXT2tmZDJnK2V4bk9nYlJz?=
 =?utf-8?B?UmFNSlJDSnY4N2xLYTdzUDhrNmpLckZJVlBKdEFQVzI1ajRQdmJWMU9sZEVy?=
 =?utf-8?B?cGFRZ0x6VTJncDlGdDdMRUVid1NlWHBTTVVjMFRCR3R3c1dZWTZLclpvUlI2?=
 =?utf-8?B?bjloUW50ZFBxeEpWdERCc3lKRFBwbUxraERCUEhEb1VkbiswTHh5VHNML3lv?=
 =?utf-8?B?U052dHc2L0FialBwRlVVOHlsTGd2Y2g1bEZRc2Z1RlNFVEFoUndKWnlvamxs?=
 =?utf-8?Q?CK/s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cefb12bf-cc8c-4589-4cbb-08db31bef9f7
X-MS-Exchange-CrossTenant-AuthSource: AS2PR02MB9389.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 08:07:31.1966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7/x7KthGLuHEN8K3x6FgR1HnA+YHqJU+fVOBYc8bmZ3ZTuuhmehlyJTX3J6VAGxNHw30Xh/FR0BodJD9mEpxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6793
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 31 Mar 2023 08:07:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7974

On 2023-03-29 19:18, Jose Quaresma wrote:
> 
> The AUTOREV will break the reproducibility of this package.

How should we do here? If I checkout the tag v3.99 in for the UPX repo 
and carry out the update submodules, I will end up with a different 
commit ID for the submodules every time. How can we pinpoint one that 
sticks and actually is the one that corresponds to the v3.99?

https://github.com/upx/upx/blob/devel/.gitmodules#L9

Or should we just go with the single commit (with the commit message 
"Automatically created from git devel branch 4cbdb055db52") in upx-vendor?

I believe that is what we had with v3.96, but now those commits seem to 
have vanished from the git repos so 3.96 fails to download the sources.

BR,

/Joakim
-- 
Joakim Roubert
Senior Engineer

Axis Communications AB
Emdalavägen 14, SE-223 69 Lund, Sweden
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
Fax: +46 46 13 61 30, www.axis.com


