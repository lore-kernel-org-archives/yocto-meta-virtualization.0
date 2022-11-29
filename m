Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C469AC4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 04:28:34 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.140929.1669696107016132676
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Nov 2022 20:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SJNoY7R+;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id q21so9228891iod.4
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Nov 2022 20:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1mghLYygCJaQv0+dKdoxkiEb1hJL+UeNj6VILt6OeJc=;
        b=SJNoY7R+GDQrITh4VOYGxNckDUAv5eVZoY69+CmZ7lh5Npj7FYO4XBYW2EdrcJ6s1b
         gvMTJDaf0Ad8NLt3suYhOleNAaJevyZbqPdt+Zlb+SKVlFZewYKoGO28psgTVyJCpPyi
         NMnXXoFLVXK8FQtqnJ7u71xTrmiLfajwYXBQdeAv6/pAGDt9/Rn3I3u0aEJbBJyceucV
         m+WTQsETnvqhh38jNdJ1qJWRrxyx7ORkJe28musoTfYbJh7/7op1equx3SlY/6bRjjPy
         iH7C+fMclNoqHE4Dp+5atNTD+T44JQAMVlrHIG59hFh+GCdpaEzcpDJxaBBJcSAZCSv8
         tvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mghLYygCJaQv0+dKdoxkiEb1hJL+UeNj6VILt6OeJc=;
        b=kcrexjUTXNINfpyVRZaWq1HmzJ7oMSURopnLLPEV6dYS2anXa3PzI9/SIFLDvQ2/cl
         dCImVIQBWva5JXGMaoyP3o4Zy7nKVMzUjotpUzRyrNSZfjtCYR+glzQJy3uRmii15t9s
         YqPCnYwAr3ONi19Xup5J/TMHTkJ3ANsnSdyVbLDSu4FEHpSXFtZHrmXosbgh070j4LOy
         jbuUNqxHjvu0pdU2Tik+J2IU0GQa5zSRmntrTA4YNuzB+zGyS66vMQ7U9PUAe6wX7n6Z
         SFT1AWrVjPxkJY0noz4rHXQ3hKT8yZAyMJc9xR0dEHVyXOCTmcH0fvmlrwZBnVWntSCe
         WHpA==
X-Gm-Message-State: ANoB5plhn5o9Sg8Ka5gpTlFJgcob3tuwXzIcplVRETG72TPlP67WjmLK
	Ra+99JfRI+8opr3++tPOIXqzLdCCymyijx8JM/M=
X-Google-Smtp-Source: AA0mqf4Npcnb6s5PlFVqY9mLEw5tnGyqUQk8YcVDJB4qvZAeNKtdlcWZeUK4nrnXLGQkL9PU73r/PB0DTEHfiJx8RrU=
X-Received: by 2002:a05:6602:180b:b0:6de:ef1:845 with SMTP id
 t11-20020a056602180b00b006de0ef10845mr14934778ioh.98.1669696106327; Mon, 28
 Nov 2022 20:28:26 -0800 (PST)
MIME-Version: 1.0
References: <49b1aa12228d4e7ea8d0a3784c72bfd935f75042.camel@gmail.com>
In-Reply-To: <49b1aa12228d4e7ea8d0a3784c72bfd935f75042.camel@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 28 Nov 2022 23:28:15 -0500
Message-ID: <CADkTA4OVZsthXHcG3NwV-LXCs20M1zMUJmg-YqnVqZmn_GKvEQ@mail.gmail.com>
Subject: Re: [meta-virtualization] docker 20.10.21 from master-next
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Nov 2022 04:28:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7703

On Mon, Nov 28, 2022 at 4:46 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Hi Bruce
>
> Three comments regarding the docker 20.10.21 recipes on master-next:
>
>  * Could the DEPENDS be reduced to the follwoing list? I guess all
>    other dependencies (the go stuff) are taken from  the vendor folder
>    anyway. It's at least working for me like that:
>
>    DEPENDS = " \
>       libtool-native \
>       libtool \
>    "

There are some usecases that are using unvendored builds (even if
docker is currently using a vendor/ directory). They aren't commonly
tested, but I know they exist, so for now, I'll leave those in place.

They are mainly just extra build time, or are you seeing a build
failure and/or something installed on the rootfs.

>
>  * The CVE_PRODUCT should probably be changed to:
>
>    CVE_PRODUCT = "mobyproject:moby"
>
>    With docker e.g. CVE-2022-36109 is not reported by cve_check but
>    with mobyproject:moby it works as expected.

I didn't add the CVE_PRODUCT part of the recipe, so let me dig into
that a bit more. It definitely used to need to be 'docker', but I'll
try and pinpoint where that changed.

I'd rather it be an addition, than a replacement (as long as I can
convince myself we won't mask any CVEs by leaving 'docker' in place).

>    Im not 100% sure if mobyproject:moby covers also CVEs in libnetwork
>    and the cli which are separate repositories.

It probably doesn't, since they are quite separate (but maybe the CVE
tracking takes into account the subproject hashes associated with a
release). But that is a general problem with all unvendored or multi
repository go applications .. tracking CVEs is challenging.

But just adding the projects to CVE_PRODUCT probably isn't enough,
unless we individually version the components. I haven't looked at how
the tools work, but I'll put it on my TODO list to have a closer look.

>  * The default PACKAGECONFIG could consider the seccomp DISTRO_FEATURE:
>    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '',)}

This was in place before seccomp moved to OE Core, and yes, large
parts of meta-virt need seccomp now, so this isn't a big deal.

>
> Of course I can send you a patch but I guess you would prefer to
> quickly do it on your own since you already started with the update and
> you usually reject patches against your current work in progress. Hope
> this is helpful. Otherwise let me know.

Yes, I am in the middle of getting things updated, in fact, I have
some more bumps coming up in addition to what is in master-next, I ran
into some system level issues (again) and have been sorting through
them.

This approach works fine, and I'll take care of stacking some patches.

Bruce

>
> Thank you and regards,
> Adrian
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7700): https://lists.yoctoproject.org/g/meta-virtualization/message/7700
> Mute This Topic: https://lists.yoctoproject.org/mt/95321879/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

