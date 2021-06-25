Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.2213.1624589364683930639
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Jun 2021 19:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CKAF0wyv;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id ot9so11735914ejb.8
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Jun 2021 19:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yz/1FlHQtdDNUdN8mM4cLlTRU5dA9gG26Va4rmPBUVE=;
        b=CKAF0wyv0lQNDtdg0aYTCVg9qeWy8TXqQh/DROgW9EDPgO9oxK3ccE6NUfQvXvXWbm
         4wcQ9qNvjq0eNXhD3WqNIkkrBgjSh7VkGoSUb9B9DHoXYhrHv5tv/txSY8jlEN2lwbe2
         QQ11SgIBTChGzy4mIe5FamitO47rUgt/zYQxQm+rRK+24XyuvYSn9IYbeYDncK+oiqMp
         IrtKDdEpKCIeVSDq5zf1ceFuMzdyizkfqHMgeU8fjG/592nDUVuhWIbyYPTI53RKiJvE
         qOReqWl/ySVArqzgNzkZJR/Z0JbURrgmX+bWbBbctb/SiKLfLEEpyqwPV2io88eEVOut
         nu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yz/1FlHQtdDNUdN8mM4cLlTRU5dA9gG26Va4rmPBUVE=;
        b=bFk7sE4ZrdHbUQkwRX/tYI3hX9PgYYD+lDBstxyUvOfQlTMCFjFFNCsP3BkkA1hdnl
         owC0COJ3BXOUFb75epCVEraSpW7DDoOEOXR4lTEqzLa+crqY6DE85Pl/c0VwbLgvYm4I
         PP3/KdkbcX3nxIkhlffTLJpyGhX5wJ7puAADChjhjJd2FVzA2ID2n4dK+jEprZCcEdXU
         h+J8wvNDTEn28TdJ50P4juztD6n36tn275N/IcIh7qK7vdjISjNtN/Y7ZfFHwZfR0wFp
         Tdz4uZPRqT5v209n4SsGwhepOPX/FoHltpMLwCHUYpHQDymCS07Ur3tBUjGANvryYZL1
         9eWw==
X-Gm-Message-State: AOAM533UYrTawtLtGREKfvB3N5ooGYstez/QUGUdfcun9kwC0wzvIKo9
	sdwTEBtgT3P7zSzNQSyVXyMaYKPQqPhSac8lzNI=
X-Google-Smtp-Source: ABdhPJxAyzb5R+vboixnb6Z8KrpG8JD0dKEaz0l7vWU3KTB/aC8FiH1ncApHjAy031/oTMK+e9wydxjtsLZSo7E0jyY=
X-Received: by 2002:a17:906:c211:: with SMTP id d17mr8361885ejz.247.1624589363082;
 Thu, 24 Jun 2021 19:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
 <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com> <CA+chaQfm5Q4dX8xE42N2GfPKZwWwZa3pR4ttH=jwX34PXkLz1Q@mail.gmail.com>
In-Reply-To: <CA+chaQfm5Q4dX8xE42N2GfPKZwWwZa3pR4ttH=jwX34PXkLz1Q@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 24 Jun 2021 22:49:12 -0400
Message-ID: <CADkTA4P7gGBGTBdVLTFdSGiX5DDoHZc7ymmrcre+ifPA=vG7fA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Diego Sueiro <diego.sueiro@arm.com>, meta-virtualization@lists.yoctoproject.org, 
	nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 24, 2021 at 5:01 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> This change is correct, libseccomp still requires seccomp in DISTRO_FEATURES, so anything depending on it should have the same restriction.
>

Right, I understand how/why it works like this .. but it is super
clunky when we can't just depend on something that is now in core,
without needing to sprinkle distro checks everywhere.

As the list of recipes gets larger with that check, it really isn't an
optional distro feature for using meta virt at all, and it would be
nice if we could just do the check once and be done with it.

Bruce

> seccomp is now in default DISTRO_FEATURES, but not through BACKFILL feature, so many existing DISTROs didn't get it automatically added and requiring it is the right way to automatically skip such recipes.
>
> On Thu, Jun 24, 2021 at 12:45 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>
>> What branch are you working with ?
>>
>> Now that seccomp is in core, we no longer have those restrictions, so
>> I assume this is on an older branch ?
>>
>> Bruce
>>
>> On Thu, Jun 24, 2021 at 3:00 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
>> >
>> > The libseccomp package is only available if seccomp is in DISTRO_FEATURES.
>> >
>> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
>> > ---
>> >  recipes-containers/podman/podman_git.bb | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
>> > index 9dcb21c..351f38b 100644
>> > --- a/recipes-containers/podman/podman_git.bb
>> > +++ b/recipes-containers/podman/podman_git.bb
>> > @@ -6,6 +6,9 @@ DESCRIPTION = "Podman is a daemonless container engine for developing, \
>> >      `alias docker=podman`. \
>> >      "
>> >
>> > +inherit features_check
>> > +REQUIRED_DISTRO_FEATURES ?= "seccomp"
>> > +
>> >  DEPENDS = " \
>> >      go-metalinter-native \
>> >      go-md2man-native \
>> > --
>> > 2.17.1
>> >
>> >
>> >
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> 
>>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
