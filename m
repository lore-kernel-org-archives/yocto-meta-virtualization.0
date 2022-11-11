Return-Path: <ml@calgera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A85C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 11:10:03 +0000 (UTC)
Received: from t4v1.calgera.eu (t4v1.calgera.eu [80.208.226.141])
 by mx.groups.io with SMTP id smtpd.web10.4265.1668164992470852581
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Nov 2022 03:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@calgera.com header.s=mail header.b=nAlkXPG/;
 spf=pass (domain: calgera.com, ip: 80.208.226.141, mailfrom: ml@calgera.com)
Message-ID: <b10d2c16-441b-ff99-688d-a240429492a2@calgera.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=calgera.com; s=mail;
	t=1668164989; bh=Qu7QlOuJpYoIQ2Nyf2v/6672ac7R1NN0z49v11kbArY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nAlkXPG/CZ2SIBZhMdiJpbuiNBc36U1x0/azHJTR3Q4MgL5bG0BfhZwhtbYLgT2HD
	 Ye38UcJC+drjMjMXaDE3X2+jTuibzv7HKc/af7BwVTb7fYg1F3QpEobRCIYE+atqK/
	 x6kIJmx9s3sH6KTLR8197NKLNLKP+y+3LK4FhbalCDUFqjvfNoOvpXz2WslZD0Nnjc
	 wfWt0F9jn+YFdp4HM9o0tHkFxJEUw1Itc/1AVUDo5K1b1LkJYV9jRT3I+Gdj01U8js
	 M5GeKdvv1fkv0EvDT+JMnK3iDtw+4ck0WzA5bg+cJzSDq3xglK9WNYixtTFuNakI/M
	 ucvqQ1kSUaiaw==
Date: Fri, 11 Nov 2022 11:09:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-virtualization] packagegroups and unnecessary
 builds/fetches
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <5ea5178b-7229-72cf-9fa8-d7fccc83ee51@calgera.com>
 <CADkTA4Op1EC-U7VmAp7uaEt0v4_GvBkwTYnxM-RqR-AUuBw+Gw@mail.gmail.com>
From: Renato Caldas <ml@calgera.com>
In-Reply-To: <CADkTA4Op1EC-U7VmAp7uaEt0v4_GvBkwTYnxM-RqR-AUuBw+Gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Nov 2022 11:10:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7682



On 10/11/22 21:42, Bruce Ashfield wrote:
> On Thu, Nov 10, 2022 at 2:25 PM Renato Caldas via
> lists.yoctoproject.org <ml=calgera.com@lists.yoctoproject.org> wrote:
>>
>> Hello,
>>
>> I'm adding "packagegroup-k8s-host" to my image, and noticed the "k3s"
>> package also being built.
>>
>> Investigating further, it seems that by bundling kubernetes and k3s in
>> the same .bb file causes both packages to be built. The same probably
>> applies to the "packagegroups" in packagegroup-container.bb, all get built.
>>
>> In both cases, the norm I guess is for people to just want one of the
>> alternatives (kubernetes vs k3s; lxc vs podman vs docker).
>>
>> Would it make sense to split the packagegroups into individual recipes?
>> I'd be happy to submit a patch.
> 
> The grouping is intentional, and yes, so is the extra building. The
> individual package groups in that .bb are just packages, and when you
> bitbake a recipe, all of the packages are built whether they are
> installed or not.
> 
> That packagegroup has primarily been used to drive the build testing
> and package repository construction steps of sanity testing.

I see, thanks.

> They could be split more, but at that point, we aren't much ahead of
> just the individual recipes with their inherent depends/rdepends.

No argument there in what concerns lxc, podman, docker, or containerd.

In the kubernetes case, however, perhaps splitting out packagegroup-oci 
would be useful. It's a non-trivial list of packages that could be 
useful for an end-user.

Given what you said above, I would just replace packagegroup-k8s-host 
with packagegroup-oci + containerd + kubernetes.

> I have some pending work to split things up more in the container
> definitions cri, cni, etc, etc, but I haven't had enough time to
> complete that yet.

Sure, no worries. And thank you for the explanation.

Cheers,
   Renato

> 
> Bruce
> 
>>
>> Cheers,
>>     Renato
>>
>>
>>
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7681): https://lists.yoctoproject.org/g/meta-virtualization/message/7681
> Mute This Topic: https://lists.yoctoproject.org/mt/94943666/3618453
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [ml@calgera.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

