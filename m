Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E275C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 13:53:01 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.45652.1674136374207749388
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 05:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UkGRptM6;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id s26so975615ioa.11
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 05:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h3Gryc0Oy/fke+tAhjJ7K/Nb8jHBc+epR3Bieq5MMYI=;
        b=UkGRptM6MsqDhmj61JTOG0ydDLLgbkNt62tugmMONCODQxaLwUVzh8ZlkAz736Odx5
         zRV6+fZTSR7dd+WGjE14KJYnlLxJdphRnqwirvNNLCs1hKh3wRtrFMieHbtrqWI2Ft82
         Ayo5w/QXW9M/6HArErrcbjb0IQH7YCTgytJsFFFftrW28pG5kDoH7T4WZQ5efDyh3k7J
         gos4ASY524E1iMtEbUV4hm8LoV7O85Zr0OhteOhFHHLLSpmXqzWLSt3eZksSbVn8CA84
         9a5IcGvmUkkszUKbtpvLSgdWGn+F2gePcWkfWOonxF0ddUBSkSrhtRHlhpUbseSm2VIi
         Stpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3Gryc0Oy/fke+tAhjJ7K/Nb8jHBc+epR3Bieq5MMYI=;
        b=hXRBz22K7L3+cjA6hYPMA4HkkSeBUsTAZykf9ukxPR4YCXOe9G63S/JTbzGqYxtbY4
         pj6exa0k5SED7b0/uwf3Bf9/dRrYWEPMgykMdeCivtgO/ZcnYOAhKNH128ufRy11QVG6
         6e+RmBYm1QwcTI581DVvafJUZBfMiXEuYOjpkOJnVDyZkhXnhgdFPorfEcATAHKtGnXh
         eg7lxzO53V4QcehSLG9lm1HcT7ten74bJ3h1ka0kBvcn9PfWyvMhTKQUUjOcR2Nzd4LM
         2OAnsbD2WGIaqa+698/e3wO1nnFkl9EacWP6os1vVSkZsf3TnhkqSBWzIg9fFuPUJyYA
         6nig==
X-Gm-Message-State: AFqh2kp6q5NbZorV7qfK4dE87IAhwlR5ee/j1lx1VL4mzCa5cKy7WIIi
	PdSNH1BIHcB+11isvz0ciHVJctXHqjyjL2lMsNU=
X-Google-Smtp-Source: AMrXdXuFg8VUN7qkLDdkekZplYT8Hd/QploGHjBGChhl4mKFeAcLq8Ub6Jn3jY7SM68du/ER0MoPNCY49bZ3npXgOJA=
X-Received: by 2002:a6b:640e:0:b0:704:d937:a458 with SMTP id
 t14-20020a6b640e000000b00704d937a458mr462159iog.98.1674136373560; Thu, 19 Jan
 2023 05:52:53 -0800 (PST)
MIME-Version: 1.0
References: <20230119142202.594f36c9@booty>
In-Reply-To: <20230119142202.594f36c9@booty>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 Jan 2023 08:52:42 -0500
Message-ID: <CADkTA4OtoQAJuz5adeCWXYQCQrW3mtXz7ZSQw2m-O8yAFBzkDA@mail.gmail.com>
Subject: Re: xen-4.17 build failure (av_permissions.h: No such file or directory)
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 13:53:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7820

On Thu, Jan 19, 2023 at 8:22 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hello Bruce,
>
> we had this failure on the xen recipe during an AB meta-virt build:
>
> | In file included from xsm/flask/ss/services.c:46:
> | ./xsm/flask/include/avc.h:18:10: fatal error: av_permissions.h: No
> such file or directory |    18 | #include "av_permissions.h"
> |       |          ^~~~~~~~~~~~~~~~~~
>
> See:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1168/steps/17/logs/stdio
>
> According to Alex's analysis it appears to be a race condition in the
> xen makefile.
>
> Could you check that?

We'll have a look!

Outside of doing a lot of builds, i don't suppose there's a specific
way to reproduce the issue ?

Bruce

>
> Best regards,
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

