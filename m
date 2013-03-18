Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FC9BE0129D
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Mar 2013 20:33:32 -0700 (PDT)
Received: by mail-lb0-f180.google.com with SMTP id q12so4215500lbc.39
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Mar 2013 20:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=9DcY2u/mUJeGFUlxWdO5Cnol9QiqO9bBMFE4YBbUORs=;
	b=gikHcYo5qBvIZw3AjpLItf8pQiGQpiMctft46x+5mX39wvG3qtrcfUPr1jw+BJfOz3
	aE/uLZLoKO48dfRNF4icjA99+MqK59iZtCniqR3CqWX/UmccB+twpFtqPxy+BkEfYQHL
	8n5jd5KYQpLeBEuEVeFSGQNsR6vbt3CDbfRrJgCY8sco6qw7FT4mI0dUxZ5NWVp5FK0+
	EfAByJNH84gsrwLAbCpra2aouBtt8/ns9LTTn7SaiNFTjqOhOPjhjZKdZOXIuwg3zk+4
	LBUU04urq+PtkGxwH7O2nNkqyMBmSkfXV7e3cY30zy7k/BpU6HBrI8Jl95QO2qGEx4ui
	HD4Q==
MIME-Version: 1.0
X-Received: by 10.152.110.167 with SMTP id ib7mr5552665lab.22.1363577610560;
	Sun, 17 Mar 2013 20:33:30 -0700 (PDT)
Received: by 10.112.61.3 with HTTP; Sun, 17 Mar 2013 20:33:30 -0700 (PDT)
In-Reply-To: <B5012D5F6E2BBC4DBF16B3E6037A5B732EB3B5@039-SN1MPN1-003.039d.mgd.msft.net>
References: <1363152493-25261-1-git-send-email-hong-hua.yin@freescale.com>
	<CADkTA4N1wugSgFowPCCyjtcMVeGSrVOHO+CqUwO8KuuKutZ2nw@mail.gmail.com>
	<CADkTA4NSqeasAR7Q4nK_4pVp1uYfF67=zCSZVLJFQECzCn48xA@mail.gmail.com>
	<B5012D5F6E2BBC4DBF16B3E6037A5B732EB3B5@039-SN1MPN1-003.039d.mgd.msft.net>
Date: Sun, 17 Mar 2013 23:33:30 -0400
Message-ID: <CADkTA4OZYOZfVxGEDJCi22Fk26YnVvWZRwerkSoXr6i5T8GnGw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yin Olivia-R63875 <r63875@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: upgrade to 1.0.3
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 03:33:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Mar 17, 2013 at 10:49 PM, Yin Olivia-R63875
<r63875@freescale.com> wrote:
> Hi Bruce,
>
> I can't find any example tests you required.
>
> I just ran on FSL PowerPC platforms with QEMU/LXC cases and most domain functions worked well.
>


Meaning: start, stop, destroy, migrate for VMs ? And similar tests
with LXC containers ?

As we get more people using layers and projects associated with the
Yocto project, we need
to generate a set of baseline / sanity tests so we can ensure that
updates don't cause
regressions.

This is a minor version bump, so I've staged it here, but if you have
any READMEs,
scripts or tests steps for this functionality, capturing it in the
layer for reference would
help everyone out.

I plan to pull together my own similar docs and contribute them to the effort.

Cheers,

Bruce

>
> Best Regards,
> Olivia
>
>
>
> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> Sent: Friday, March 15, 2013 10:39 PM
> To: Yin Olivia-R63875
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH] libvirt: upgrade to 1.0.3
>
> On Wed, Mar 13, 2013 at 6:11 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> On Wed, Mar 13, 2013 at 12:28 AM, Olivia Yin <hong-hua.yin@freescale.com> wrote:
>>> Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
>>
>> Can you quickly summarize what testing was done with libvirt ? Just so
>> we can get a feel for the arches that have been covered, and what
>> functionality has been exercised.
>>
>> Since this patch removes the 1.0 version, we won't have a fallback in
>> tree if things break.
>
> ping. There are a few outstanding questions on this. No rush, but I didn't want anyone to think we were ignoring or had dropped this series.
>
> Cheers,
>
> Bruce
>
>>
>> Cheers,
>>
>> Bruce
>>
>>> ---
>>>  .../libvirt/{libvirt_1.0.0.bb => libvirt_1.0.3.bb} |    4 ++--
>>>  1 files changed, 2 insertions(+), 2 deletions(-)  rename
>>> recipes-extended/libvirt/{libvirt_1.0.0.bb => libvirt_1.0.3.bb} (97%)
>>>
>>> diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb
>>> b/recipes-extended/libvirt/libvirt_1.0.3.bb
>>> similarity index 97%
>>> rename from recipes-extended/libvirt/libvirt_1.0.0.bb
>>> rename to recipes-extended/libvirt/libvirt_1.0.3.bb
>>> index 90d7dbb..372e874 100644
>>> --- a/recipes-extended/libvirt/libvirt_1.0.0.bb
>>> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
>>> @@ -22,8 +22,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
>>>         file://libvirtd.sh \
>>>         file://libvirtd.conf"
>>>
>>> -SRC_URI[md5sum] = "7c8b006de7338e30866bb56738803b21"
>>> -SRC_URI[sha256sum] = "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
>>> +SRC_URI[md5sum] = "3d9f85d586c9aa3d819b626622f3fc97"
>>> +SRC_URI[sha256sum] = "f64f4acd7cdcfc6ab5e803195ed58b949f262b54e3659d8c37b33f0fec112757"
>>>
>>>  inherit autotools gettext update-rc.d
>>>
>>> --
>>> 1.6.4
>>>
>>>
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

