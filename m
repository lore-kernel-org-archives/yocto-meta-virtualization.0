Return-Path: <joakim.roubert@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65D8C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 12:14:24 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.68342.1680524055925645874
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 03 Apr 2023 05:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=LjgIh0tS;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680524056;
  x=1712060056;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Fi6x03BQaonqEioJMTs1WoWh2aPCR69WynHhWnGVKWI=;
  b=LjgIh0tSye+DkjRbhYaCNnQVBi8mHIyZ32p5VAnfELN4XPujMprSUQj2
   cNTd3Q5HBkE4yrFQsO8kNxezjspzwZP42wCjwVR4FBKzs0MKcMkEN3yg0
   /MYlSw/FymUMqR8iPQtZEIEZn28zI4y6esKgzfl+SBe27xKkSdX+4g380
   9dMz5Py3+Wd9PT4wqtI9VGyMpnNUZXLIi9PtCBH5M7IAsQ9tDV1BqQmmo
   gRi2cc23xDtWX/xxZjUlPtH0HhBskC/y37NV3jEj4Q5UuNCBtQ79s5KI2
   3TtZ1RfvlNjyHflLmFaSc2YBQ0GxV8t7h1hNbEKpRWu1ADywCqghKkP+m
   A==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhecHMD7KB6fROQJaj6hCTYhNKrwTWymf/FBYI+Ay9H08t/JVzpzh1vRS+6q6j/dEWwdh+v8y0wzJPYL2heO56mEnrzSgu8HreBWQMsks1091M2UbFFRv36kieU519k8RUbA5whtdtu86q0pBrpGI0KTvltUIhrT2Z//jRijnnfTNWu4CGASKKgad195gqiwqwd4YDNH13Gl0wdz/iwvaRKfiMJENnsyXjughCNYntssqcMkRTOKs0daNZrcoCxvogEWzpsrvH/FE2xkMtdJbjnvUuHUNnOoV2yTQUFH7WBUvap7SIGDsMNqWHHt68hDijpcApWKB0bfttltgjjkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fi6x03BQaonqEioJMTs1WoWh2aPCR69WynHhWnGVKWI=;
 b=YbX97RiqfzbIzdjTh1r6X9ubP3P0U+XfBrrSGpqWYNq8kRwR11McfkIAd9uoMKnJ+ck7zC7ZLlp/oAezIUrwn9IvOTokwXbTY4HspqOrBkksRBTMbWfDJnj6zpAi3I1/g2BxgvsilItx6p6yhf9IpgdhAo1PgkiYlGtfsgjlodAPt7wxKGUItnlJWl+L9/K5k2M4UANnjIxbNSDQcpXlblV0mijKg6bVHbUk+MHGH1bKz64wyelEcnHylrRvcKiFar6XCD9q9tIxes+Y/keiEpmyk+dEYncu2BWwcupDU2+fNvYznqSrHYo5STVvm5q2ZFZA3930Dh8aCcQZuBfbgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fi6x03BQaonqEioJMTs1WoWh2aPCR69WynHhWnGVKWI=;
 b=LVYV/CHxfiS9HmoCw/z5rweAVfb/HGvllX0h+yzJ7Jl2Hit6iqO1zLQrJRcnEZdb7tHok0LxrjNP31Nh2VzAbAdG6RTHKc2Fp0kTHkwLgaP8ugKDRzbGpUBkoNUOzMnZkYwOuhTkI0F7k1Dr393CN2AWjG90KQibLNp4vwasXYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Message-ID: <f7554d51-74e9-092f-9785-07da178b97a7@axis.com>
Date: Mon, 3 Apr 2023 14:14:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-virtualization][PATCH] upx: Bump to v3.99
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>
References: <20230329141847.337386-1-joakimr@axis.com>
 <CANPvuRnL62+UmHEBMkiSqadLD5HnoX=kiDkep-pXoxcox+KXgg@mail.gmail.com>
 <566ccb86-0063-832e-580a-c619bbd4d378@axis.com>
 <CADkTA4PeAmongW4DbbnaDfsJqFp8W2TiixdunzRYTL1VRNmHTQ@mail.gmail.com>
From: Joakim Roubert <joakim.roubert@axis.com>
In-Reply-To: <CADkTA4PeAmongW4DbbnaDfsJqFp8W2TiixdunzRYTL1VRNmHTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0102.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::23) To AS2PR02MB9389.eurprd02.prod.outlook.com
 (2603:10a6:20b:59f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR02MB9389:EE_|AS4PR02MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de10a94-df2f-486c-89ed-08db343ceef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sFcVe60ZkKi9zyAe0XVAgqqTjaEZtpWvmeJPV1aTBa7D90O7BLz3PIs7tPoL6mRJpQ67lB8nFHC6qcxU1pdS0HtNqb1jKpuONPO3rR8rkwFLm9rgkhR+3EIjrntScBtJjJxWYITDj4J+vfwZi/9v96FyU1ut8QURebWDJLyL9vKN7LFcFGrzMlbzHwJ7Vs4udz1rg8OPVALeAV21QFohWfNYWXTdNwI9hSFurfBehaZi1OHzRyLdZ9RCIh0vtNPI0a84Reonrz6NGJasPGCh7edY0JWNlD4Erm2Karo5HZIQ4QE5qS2+iYWUJYCPZ32fxrNd4fFjPBXK1DYO6HJwsXaS4QcDFOY8TeiQm5QzVuo1FJqbW9YXZB+YNtYKTEeVZhCExYrKZgFr3nYYG9ScX8ulHggMqduQ8S5vqGFRhXcI4WKmpd+V+PSk6XOlq8tkOyEC4M8+ihMfdRTMgVPJnsAteyHAKgKbYpDySzBfBdHqXN3ICWYfbUknxn9R1sbYm+cNTMts3No8g88GQdd1kgVmZC4qrI8cslmG9pzO2CMP+G6gGoq20GXHCqMkskKxcpLVtTL0tTkk/mBmyPMhfgIyPNa8ghUsLJOlL5WW4v6GOy7g96qDBrd3KH8OuHV67uTYJYLGsYfY6zg0TDIg35oongZCBYEWANCESkCSia8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR02MB9389.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(316002)(44832011)(66556008)(6916009)(8676002)(66476007)(41300700001)(4326008)(31686004)(66946007)(5660300002)(38100700002)(8936002)(478600001)(31696002)(86362001)(2906002)(6486002)(15974865002)(53546011)(26005)(6512007)(6506007)(186003)(66574015)(36756003)(83380400001)(2616005)(43740500002)(45980500001)(18886075002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHc1YjJqREplYTNqLzhuTDFUcm0xdG1Ub1VibGtkUXJJNkRPUUVSNTBwT1ls?=
 =?utf-8?B?WEg2UjcrREV3a00yNWhhNHpqVEprOVAxVDRweGNWdlZtMmJQdzF3QXREdVJC?=
 =?utf-8?B?dktYSEtET05oQ2d4WTBxOHUzZGEvMjAycHptZkNxOXY5K1VpTGFXR2JXZWRq?=
 =?utf-8?B?U3ZVd0FZWlJhVlV4QXhFVWk0VlJpNG56a1FJZis1emxqa2NaTlVNdjlMYjJ5?=
 =?utf-8?B?NTRTbS8yYjVMRlBQenl5UmprZHhiU3Y2VDJRQnZHMHgyRE1hMjFDTDdqUk1F?=
 =?utf-8?B?SFF2MmFLZDNCbWpzYjBtT3hwVEd4TVpxcmRVMjhrR2hCaGxlYkpQVmV0WEJr?=
 =?utf-8?B?dm1rWFRjK1VlcnhvRW5MTjlaaFpmVUpCYW5KbVNHK1ZLdnNGcHpsZ0lsQW1z?=
 =?utf-8?B?MlFVZXpCYWM4ZTRnLzk5MkN5MFV3QUFlYW9aRCt0M0pKMWF5bFR5NnZtZ2lj?=
 =?utf-8?B?bVdpNWEvZFRwZEJUazcraDFCcU5IY1Z6UlM1YXB0eEJGNUdIanRodGhmSGtr?=
 =?utf-8?B?LzNndkF3bEVXUDBrRm5NZ0pSVlRqR29CU3NHYllHK1VJN21OaVBFTDRxb0xM?=
 =?utf-8?B?VnFXazFyNFB0OVB3R2ptMUFNOW5tcXlwcWY2S1JwMXpEeXdhZ0lsZ2hUWnUw?=
 =?utf-8?B?TmlqcjRXZkd2MDZuTHFZSXdvQktlMDkvczVsMzA0YlJjR3hBbGZCbEo0WGNK?=
 =?utf-8?B?Q2l6S2RsWUFRQ0lmTWNmOTlTOWhnZVJtM1ArakhWZjQzNXAxeWh6Q3NEaXA2?=
 =?utf-8?B?K0xGekZWbDZ4Yk1ZWnJxd1dIZmQyTjNPdCtWMytpd2hOb0s0VGh5MzdxWjFS?=
 =?utf-8?B?TGJmZ05IWjVLOVVVVGFpd3RXaW1vRGZNYlBaN3J5ZzV1eGtSeGN6OUZLK3ph?=
 =?utf-8?B?KzlRR2ZiTUtvRmxRV3BJTzVxU3dQYzkzZFNLSVF4aTVMaTlqcGEzcDJWUVV2?=
 =?utf-8?B?VUpUakZkd1hnazlRc21XRGNUeGJsbFpUQ1BXSUdrTFFFQjN0dnJmbG5VZmJl?=
 =?utf-8?B?MmV2VjczOUhtaHRwWmExS2xjQnllK1gvRHl5R3JyeUFtdUsyZklwcjRGdkVp?=
 =?utf-8?B?SkdmTHpGT1QyaW1wOFNuUnR0eVpwVXNxMHREQTZ2Mnc3eDhWaFlxNFF0eHFl?=
 =?utf-8?B?OTQzSWNnWFhzcmFhRnlPK254V1hKVU5EOW9mZVNBcCtybEhMQURSTk9kaVpa?=
 =?utf-8?B?N05kNjc3SkQyZmpvckg3VDBORGdUQnF2ek5GTmRtV2hHekNKaGpYbmtna25o?=
 =?utf-8?B?aEU4akxzblZsNnAxelk1R0JEUUZHSVV2VktReXRCMWFPeDg0NFRPVnhsSXdk?=
 =?utf-8?B?SkRSamZDUVJrWktHKzZ0bm9XenhUV1QzZzQwWTJXbTNrZzFJb0pyT0s1Rngr?=
 =?utf-8?B?ZEU1MXhtbFQ1YjN0UzYzNmlMUm9TY0oxMzRTOHZpS0VmeFVHVXhQcHZTUGIw?=
 =?utf-8?B?NEg4L29JUUtHLzRldUdHV2F3a29BcnE0Y2JBdTljcWlEQVNOdVhtUXBUK0pQ?=
 =?utf-8?B?UndZa1NiUENVZmcxVi9kWlpidk13dmFZMlU5QWNSWVo5cHBoVTVvMFZjbDho?=
 =?utf-8?B?WVVDTU5sYTE3MWlPQkROUHQ1dWU2dzc1bE14VUZRSFpkekFrRjk2S1lzcm5a?=
 =?utf-8?B?TGswUll2TElZSDhmSlk4N2FIelJLem9MMnZBanVGcjZGQitlZENubVlWTDhS?=
 =?utf-8?B?ZGV6R3hIYXNtQTdiL2cvRWlkMDBYYnhFcE9BSzUwd2NIb2Jwc3ZaUllpb0xS?=
 =?utf-8?B?dUJJWkxJVFo1ckhJUmhZZkdSQmp4d1hORkQ4dVNqdEJHUVh4ektiSC96aUpU?=
 =?utf-8?B?SkhveXF1MGVVbXF0MmVYdHp2OWIyRzRFZ0FxdUhRb0E0bUs3S09henI2N1cx?=
 =?utf-8?B?Y09EVzVmWXQ0WFQzUlBpZUhPYzhrZ0RZeUNLdnJKNkhXbFNxNHIwcHlyR0dM?=
 =?utf-8?B?cFRjQ2YzN1dJU2dMdnJOaGhwY04zaFVxKzkvRFhIUkFJcmQ2RWY5TEF0bVRj?=
 =?utf-8?B?ZmpaT1JUd0ZpMWl4WTlyZUw3M09QaUFNdkJpM0t1eUZVTUhlYkQ1YjE5MDhU?=
 =?utf-8?B?bGdkV0wydzBZTjFzWFVpa0YwcWdhRnp6ZDdpSVJHdjRyQjJQVzBQTVcwQklp?=
 =?utf-8?Q?5Pxy/Jt6VQsbRJrWeDWBeadVQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de10a94-df2f-486c-89ed-08db343ceef8
X-MS-Exchange-CrossTenant-AuthSource: AS2PR02MB9389.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 12:14:11.7048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxlOz1s2I5rbWVgdFJopvblhhxZ4j3OVGhaW+nvD+0A2pb0hA6g63KWSWN1DVMFEv4i5SycA29i54w/5L9tBsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8574
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 03 Apr 2023 12:14:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7979

On 2023-03-31 15:59, Bruce Ashfield wrote:
> 
> The submodules shouldn't be changing when you check out the same tag.
> 
> i.e. git submodule status
> 
> Should always return the same commit IDs when you check out the same
> tag, since those hashes are recorded in the git repository.

That makes total sense, but I can't really wrap my head around this:
If I (manually) clone the upx repo and the run

git submodule update --init --recursive

the commit IDs that get checked out for the submodules are not found by 
bitbake. Same thing if I manually clone the submodule and try to check 
out that commit ID, it is not valid.

git log

for the checked out submodule will give output like this (from doctest):

===============
commit a2b8de69f610dfdc91e915af735138fe8654ff6c (HEAD)
Author: upx-vendor-bot <none@none>
Date:   Tue Sep 13 17:09:52 2022 +0000

     Automatically created from git devel branch 0c77f0f027af
===============

So I'm wondering what is happening with that bot.

BR,

/Joakim
-- 
Joakim Roubert
Senior Engineer

Axis Communications AB
Emdalavägen 14, SE-223 69 Lund, Sweden
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
Fax: +46 46 13 61 30, www.axis.com


