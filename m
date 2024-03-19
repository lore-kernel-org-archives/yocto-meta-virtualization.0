Return-Path: <ts@ferncast.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E205AC6FD1F
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 16:28:50 +0000 (UTC)
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de [80.67.18.44])
 by mx.groups.io with SMTP id smtpd.web10.20396.1710865727353117679
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 09:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: ferncast.de, ip: 80.67.18.44, mailfrom: ts@ferncast.de)
Received: from [84.44.156.224] (helo=[192.168.178.67])
	by smtprelay02.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.97.1)
	(envelope-from <ts@ferncast.de>)
	id 1rmcKR-000000006Xk-02td
	for meta-virtualization@lists.yoctoproject.org;
	Tue, 19 Mar 2024 17:28:43 +0100
Message-ID: <ac6c54a6-f9e6-4c4e-8da7-f74785b87f5c@ferncast.de>
Date: Tue, 19 Mar 2024 17:28:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] Update runc-opencontainers to 1.1.12
 since old versions have a severe security issue
Content-Language: en-US, de-DE
To: meta-virtualization@lists.yoctoproject.org
References: <20240319155432.2263227-1-ts@ferncast.de>
 <CADkTA4NL6jet8oUsi9gWUYB6hg0ZuVOJxBqKB30--haOQoZ6Ew@mail.gmail.com>
From: Thomas Schlien <ts@ferncast.de>
In-Reply-To: <CADkTA4NL6jet8oUsi9gWUYB6hg0ZuVOJxBqKB30--haOQoZ6Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Df-Sender: dHNAZmVybmNhc3QuZGU=
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Mar 2024 16:28:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8648

Hi,

I had a look at master-next and it only contains version 1.1.11, but not 
1.1.12 with the CVE patches.

Best regards,
Thomas

On 19.03.24 16:58, Bruce Ashfield wrote:
> master-next is already updated to that version.
>
> The stack is ongoing release testing, but I do expect to push master shortly.
>
> Bruce
>
> On Tue, Mar 19, 2024 at 11:54 AM Thomas Schlien <ts@ferncast.de> wrote:
>> CVE-2024-21626 https://github.com/opencontainers/runc/security/advisories/GHSA-xr7r-f8xq-vfvv
>> ---
>>   recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
>> index 61e7cfa6..88964276 100644
>> --- a/recipes-containers/runc/runc-opencontainers_git.bb
>> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
>> @@ -1,11 +1,11 @@
>>   include runc.inc
>>
>> -SRCREV = "f3446b1e5fe75bf419c808d8705c899ab4968b6e"
>> +SRCREV = "51d5e94601ceffbbd85688df1c928ecccbfa4685"
>>   SRC_URI = " \
>>       git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
>>       file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>>       "
>> -RUNC_VERSION = "1.1.10"
>> +RUNC_VERSION = "1.1.12"
>>
>>   CVE_PRODUCT = "runc"
>>
>> --
>> 2.40.1
>>
>>
>>
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8647): https://lists.yoctoproject.org/g/meta-virtualization/message/8647
> Mute This Topic: https://lists.yoctoproject.org/mt/105026590/8357607
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [ts@ferncast.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Dr.-Ing. Thomas Schlien
Ferncast GmbH
Gallierstr. 41a, 52074 Aachen
Germany

Phone: +49 241 99034567
Web:   www.ferncast.de
--
CEO: Detlef Wiese
Court of Registration: Amtsgericht Aachen
Commercial Register: HRB 22350


