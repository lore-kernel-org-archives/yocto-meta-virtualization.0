Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF4BC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 12:52:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5760.1642596753416684699
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 04:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 492C6ED1;
	Wed, 19 Jan 2022 04:52:32 -0800 (PST)
Received: from [10.57.84.91] (unknown [10.57.84.91])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 706793F73D;
	Wed, 19 Jan 2022 04:52:31 -0800 (PST)
Subject: Re: [meta-virtualization] [PATCH] python3-dtc: fix packaging by using
 setuptools
To: bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org,
 Ross Burton <ross@burtonini.com>
References: <20220117125827.464599-1-ross.burton@arm.com>
 <16CB123A6CD49E87.30851@lists.yoctoproject.org>
 <CADkTA4MR63ejM49VXLaBz_AeK60Xk0kEJ8E1dQ7CPSTAvOkQVg@mail.gmail.com>
 <CAAnfSTtTQNQmY5DZSeZ=KRQ=F5-BGkdK=OswPHfyG7OAxJnuMQ@mail.gmail.com>
 <CADkTA4NKiE208nqVhX2pbZvdvr5QREBKYZGrd3-DXz9h+HsMhg@mail.gmail.com>
From: Peter Hoyes <Peter.Hoyes@arm.com>
Message-ID: <9cca0486-323f-4882-6cd2-cbed79524b04@arm.com>
Date: Wed, 19 Jan 2022 12:52:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CADkTA4NKiE208nqVhX2pbZvdvr5QREBKYZGrd3-DXz9h+HsMhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 12:52:34 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7025

On 18/01/2022 13:52, Bruce Ashfield via lists.yoctoproject.org wrote:
> On Tue, Jan 18, 2022 at 6:18 AM Ross Burton <ross@burtonini.com> wrote:
>> On Mon, 17 Jan 2022 at 18:07, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>> Your change + my update are now queued:
>>>
>>> https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=ed4bd1de0d2e040c303a8497ac0cd961aa8b8a7b
>>>
>>> If you have any cycles for test build, that would be great .. since
>>> somehow my own build didn't notice the empty package, so I can't say I
>>> fully trust it.
>> SETUPTOOLS_SETUP_PATH defaults to S, so you can remove the assignment entirely.
>>
> done. And pushed to master.
>
> Bruce
>
>> Ross
>
Hi Bruce,

I am now seeing the following failure on our build when attempting to 
use python3-dtc:

usr/lib/python3.10/site-packages/_libfdt.cpython-310-x86_64-linux-gnu.so: 
undefined symbol: fdt_overlay_target_offset

I think this is because the updated SRCREV includes 45f3d1a which 
requires libfdt to export the symbol above, but poky/dtc is still on an 
older revision. Maybe its necessary to roll back the SRCREV patch until 
poky updates?

Cheers,

Peter


