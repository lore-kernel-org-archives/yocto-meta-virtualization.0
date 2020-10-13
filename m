Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.10638.1602591676686429347
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 05:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qYDxQfxM;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id md26so27932223ejb.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 13 Oct 2020 05:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b8/EeUQsTMza8HnZ0cy+F56/VcXBhn19ft1fHS0Po2E=;
        b=qYDxQfxMEH7h/v22/ivZh/BjH0CJRgtYANMWEyjMyEdaeW9naok2pu/rozND+tNb1s
         hfUmYKRLw/RDCUEumsXWxlWnFh+TmU2QSf1BnrmmLFM1aqRZQhEh6izbKgBTGxOdFRE7
         Hjj4Ux4NifnaKCz+2XHi7Gkb7QrfGm22zBz8yOtJICLgD7IWB2YBCcbsYidgJDJlK0ya
         XFWr7K4ga5hXncHt2so9Kepyo2SCz2oM089SpjY4EKZPF9Du2l5UPO0UPZqTqa2e51el
         sXJ49XMpNWAajSCW8VfnVEbQFRBdgREr7PCaMYz/JKBlxYmCmF5ZvjI3qF9QJsNv7H91
         5hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b8/EeUQsTMza8HnZ0cy+F56/VcXBhn19ft1fHS0Po2E=;
        b=m12YzeYI2vXEewkEMfepZSqV6uv6Hx46aVF/Gp3AVu5qCpcWOyz/hrIFOHUG9Xlv1F
         Q3NVIhyJWtnb8ZRKQFunNixuo46dZ5MyN/twn+j4HiX0x+hpUK99xDEy+71T2pTzSzou
         mW96PHNNNXZbGlCp4JvqShkBB9MPSYiHpRtYd2NYOUOr+sYht1ML7qIbMLtCv5pEU67N
         nVKSd8jNdsqIqyxGnXHYA2uWn+PLYZUCnTfqWNt9rvRgJM/47Hl1QjjRVM7bmTS0wteY
         0Qiy1FO5pwK/C+G7ko8E0a4Mn/1QQt6P5iSbPDV1jzWqx0/fcv2IX5fb+7V97dBweRjr
         Wxiw==
X-Gm-Message-State: AOAM532M3jLi0axRF3BGYwzArinGIKJ5V7EUboquMewRqI4UB2McuGos
	fnoYIi312SqdDUbZjoDhLwFlnNAmj0x5E0XwWYM=
X-Google-Smtp-Source: ABdhPJzYPrHNEwJCnq4dlWLhPkN4cV5STjlzQiiKVc+YQFbZGXFVTECFSiklvvzkDVtxiB/AEQpjhksYanFJHVl+zZA=
X-Received: by 2002:a17:906:a859:: with SMTP id dx25mr32850348ejb.459.1602591674985;
 Tue, 13 Oct 2020 05:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <819670c7-f09b-0407-9529-ae9bf5416c3e@3mdeb.com>
In-Reply-To: <819670c7-f09b-0407-9529-ae9bf5416c3e@3mdeb.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 13 Oct 2020 08:21:04 -0400
Message-ID: <CADkTA4PtX4yT0cUK1p0=eKcVyy2-Ohub-Y1wfdyNTkaDES6E+Q@mail.gmail.com>
Subject: Re: [meta-virtualization] balena Engine recipe
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2020 at 5:13 AM Maciej Pijanowski
<maciej.pijanowski@3mdeb.com> wrote:
>
> Hello,
>
> I have created a recipe [1] for the balena Engine [2].
> It is mostly based on the original recipe from meta balena [3].
> But the original recipe was tied to the balenaOS. I have removed the
> balenaOS specific parts and moved the recipe to the separate layer,
> which was also suggested by the balenaOS devs. Now I'm wondering
> whether it would make sense to include the recipe into the
> meta-virtualization
> layer. Any opinions on that?

It would fit well alongside all of the other container engines that we
have in meta-virt. Although we already have a docker-moby recipe, this
is different enough that the overlap wouldn't cause concerns.

Since the balena folks sound ok with it, no concerns on that front either.

If you submit it as a patch to the list, I (and the list) can review
it via email (since it'll be easier for me to review and provide
feedback that way).

Cheers,

Bruce

>
> [1]
> https://github.com/3mdeb/meta-balena-engine/tree/master/recipes-containers/balena-engine
> [2] https://www.balena.io/engine/
> [3]
> https://github.com/balena-os/meta-balena/blob/master/meta-balena-common/recipes-containers/balena/balena_git.bb
> [4] https://forums.balena.io/t/balenaengine-yocto-layer/48311/2
>
> --
> Maciej Pijanowski
> Embedded Systems Engineer
> GPG: 9963C36AAC3B2B46
> https://3mdeb.com | @3mdeb_com
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
