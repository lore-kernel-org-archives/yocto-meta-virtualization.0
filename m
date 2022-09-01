Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D5FECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 18:55:09 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web12.16416.1662058505044698323
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 11:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 281It1EE002030;
	Thu, 1 Sep 2022 13:55:02 -0500
Message-ID: <667d5321-8952-7154-4d9c-943599bce10c@kernel.crashing.org>
Date: Thu, 1 Sep 2022 13:55:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [meta-virtualization][kirkstone][master][PATCH] meta-xilinx xen
 bbappend: Rename
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
References: <20220901144751.3895401-1-mark.hatle@kernel.crashing.org>
 <A6FC080D-B739-4E70-A40C-E9713BF0C9F6@arm.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <A6FC080D-B739-4E70-A40C-E9713BF0C9F6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Sep 2022 18:55:09 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7592

I'm not sure why it was implemented as two different files.  But moving to a 
single generic % should be fine as well.

On 9/1/22 10:31 AM, Bertrand Marquis wrote:
> Hi Mark,
> 
>> On 1 Sep 2022, at 15:47, Mark Hatle via lists.yoctoproject.org <mark.hatle=kernel.crashing.org@lists.yoctoproject.org> wrote:
>>
>> Xen is no longer on 4.14, rename to 4.% to avoid having to regularly update it.
> 
> There is also a bbappend for git version, might be a good solution to just have a xen_%.bbappend and remove both 4.14 and git bbappend.
> 
> Cheers
> Bertrand
> 
> 
>>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>> .../recipes-extended/xen/{xen_4.14.bbappend => xen_4.%.bbappend}  | 0
>> 1 file changed, 0 insertions(+), 0 deletions(-)
>> rename dynamic-layers/xilinx/recipes-extended/xen/{xen_4.14.bbappend => xen_4.%.bbappend} (100%)
>>
>> diff --git a/dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend b/dynamic-layers/xilinx/recipes-extended/xen/xen_4.%.bbappend
>> similarity index 100%
>> rename from dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend
>> rename to dynamic-layers/xilinx/recipes-extended/xen/xen_4.%.bbappend
>> -- 
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7589): https://lists.yoctoproject.org/g/meta-virtualization/message/7589
>> Mute This Topic: https://lists.yoctoproject.org/mt/93397059/3619089
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bertrand.marquis@arm.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

