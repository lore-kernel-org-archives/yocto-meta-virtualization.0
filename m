Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.7515.1575872744982557558
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Dec 2019 22:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xB96Pg5X017196
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 8 Dec 2019 22:25:42 -0800
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0; Sun, 8 Dec
 2019 22:25:41 -0800
Subject: Re: [meta-virtualization][PATCH 2/2] layer.conf: use go 1.12 version
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20191206011454.37368-1-Qi.Chen@windriver.com>
 <20191206011454.37368-2-Qi.Chen@windriver.com>
 <15DDCE650BD0CB8E.11732@lists.yoctoproject.org>
 <CADkTA4O=_c0U4h822Dy2uPgYhytfis93w9ecAoD3Qj=BSfLm7Q@mail.gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <05e08017-22b3-5f6b-9913-88026135e260@windriver.com>
Date: Mon, 9 Dec 2019 14:41:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4O=_c0U4h822Dy2uPgYhytfis93w9ecAoD3Qj=BSfLm7Q@mail.gmail.com>
X-Originating-IP: [128.224.162.184]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2019 02:58 AM, Bruce Ashfield wrote:
> On Fri, Dec 6, 2019 at 9:26 AM Bruce Ashfield via
> Lists.Yoctoproject.Org
> <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>> On Thu, Dec 5, 2019 at 8:15 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>>> kubernetes could not be built correctly with go 1.13.
>>> Use 1.12 version in layer.conf.
>> We unfortunately can't set the version of GO like this, since it would
>> impact someone that simply includes meta-virt in their layers.
>>
>> I see two options for this:
>>
>>   - create a k8s distro feature and only set the go version when it is
>> enabled .. or we re-use the virtualization distro feature (which is a
>> better idea)
>>   - put the preferred GO version into the meta-virt .inc file that is
>> included when virtualization is in distro features
>>
>> Although, I recall someone saying that the .inc wasn't working
>> properly and isn't actually triggering .. I found the email from Mark
>> hatle that describes the problem. If you check the list archives for
>> the subject:  "[meta-virtualization] conf/layer.conf is broken".
>> You'll find a description of the problem.
>>
>> The fix for that, is to make the .inc work like the one in meta-cube:
>> https://github.com/WindRiver-OpenSourceLabs/meta-overc/blob/wr-10.19-20190121/meta-cube/conf/layer.conf
>>
>> The .inc is the best solution, and this is a good opportunity to fix
>> it (it hasn't been working correctly for some time now). I'll try and
>> make those changes today, and follow up later with the results.
> FYI: I fixed the conditional include and pushed the commit to master
> [conf: fix meta-virt version / config include], so we can now use the
> .inc to set the go version.
>
> Bruce

Thanks! I'll send out V2.

Regards,
Chen Qi

>> Bruce
>>
>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   conf/layer.conf | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/conf/layer.conf b/conf/layer.conf
>>> index dfca6da..2d008bb 100644
>>> --- a/conf/layer.conf
>>> +++ b/conf/layer.conf
>>> @@ -41,3 +41,7 @@ PREFERRED_PROVIDER_virtual/docker ?= "docker-ce"
>>>   INHERIT += "sanity-meta-virt"
>>>
>>>   require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'meta-virt-default-versions.inc', '', d)}
>>> +
>>> +# Use go 1.12 to avoid k8s build failure.
>>> +# Remove this after https://github.com/kubernetes/kubernetes/issues/82531 is resolved and k8s is updated to a working version.
>>> +GOVERSION = "1.12%"
>>> --
>>> 2.17.1
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>>
>>> View/Reply Online (#4829): https://lists.yoctoproject.org/g/meta-virtualization/message/4829
>>> Mute This Topic: https://lists.yoctoproject.org/mt/67394161/1050810
>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>>
>> View/Reply Online (#4831): https://lists.yoctoproject.org/g/meta-virtualization/message/4831
>> Mute This Topic: https://lists.yoctoproject.org/mt/67394161/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>
>

