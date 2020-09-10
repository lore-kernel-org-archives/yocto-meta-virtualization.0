Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.10135.1599696164495666771
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Sep 2020 17:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P89iwfT5;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6030F38C1423
	for <meta-virtualization@yoctoproject.org>; Wed,  9 Sep 2020 17:02:44 -0700 (PDT)
Received: by mail-ej1-f66.google.com with SMTP id z23so6008096ejr.13
        for <meta-virtualization@yoctoproject.org>; Wed, 09 Sep 2020 17:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/yONwd48uC+o9qogZhWqVyvd9wBMSaRjgoFkDC43SCM=;
        b=P89iwfT5bi1+MkIuF69bUwvsKlArMiHNeZ4tjyxfxrVpeLYsfDkpm1QjDpe+7MG4bR
         n2mHhAhwAR2lkEiMY3+uidmRyL7jLOLGAE/Mfd6uzJz7msKOu2ePdMN/9gTXL+7yWcjo
         8s3zi5p2dnBBGyU7paDPO0KsfoGGr5PRgE1DT/L3DMxydzpnKX+ntmNeV1N+iMMaIi/Y
         GdOZKVFrttJKu1cfeq3bS8yDVyAuFk0aza38Zobx56yqos3WKimzwRT25X4mEbNzVKO0
         XlVDEwEk/5fCuU35Ns8YVmXhPy5fdxu4elpprmmAtT6hNxONUhqciAyyvZ5vOUkBQgZV
         EBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/yONwd48uC+o9qogZhWqVyvd9wBMSaRjgoFkDC43SCM=;
        b=N7BC2MZY3AtHuxTBvBNmnFCAbIaS9rTs52m/Wudvg//tNVmO+uLhR8733bm5+vu582
         lRCuRrq+r2KFphwFDMYp3/umzdDklpPr6uRpiyuVVMt2Sz4iit+AG94b1IKgzg97K16I
         LReazjKLdR+Kg1O7QMc3VJZ48uMLPXn+vYVBiK4ldrg5Qu/BFAMy+gUvid8wzYaTxUXN
         o2TUGO3kpyCNGxSAtjneSJjUTITPRYxtRP3BmyBTejQd+Xa9NCJNTL0fAkcAK9A5/eRD
         PJG9jHoxmnZ3vo/6OXN6rE1MxHlqlTeJNIAFxNdok5tDQWfs69qvJcLOdeSScnr+m/U+
         6cpQ==
X-Gm-Message-State: AOAM532gLHRunP62v5KlXyWHFXi//2pOukolGrGyPlh/v+xM23CMarX/
	l7Euiu5W2KeMWjTSCOYryqlY1/pIZXceFgjpFow=
X-Google-Smtp-Source: ABdhPJwQpw2lNE9w3hN0laAW7eEM9DD72HILOSiqGDsvOfNM3H3V9frbwcIMZ8DyeoyrGXVaJnHW2MDUxcF5nr6wDNQ=
X-Received: by 2002:a17:906:19c7:: with SMTP id h7mr6041997ejd.517.1599696162964;
 Wed, 09 Sep 2020 17:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200909220248.17026-1-joe.slater@windriver.com>
In-Reply-To: <20200909220248.17026-1-joe.slater@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 9 Sep 2020 20:02:32 -0400
Message-ID: <CADkTA4PcUcYvC2ZG0scMOvOZcPCLzdt9VQECwZiHO_V61chNeQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [meta-virt][PATCH 1/1] container-base: rename recipe
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

Except that this breaks existing users.

We'll leave this as-is.

Bruce

On Wed, Sep 9, 2020 at 6:03 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Change to container-base-image since the convention is to
> have "image" in image recipe names.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-extended/images/{container-base.bb => contain-base-image.bb} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-extended/images/{container-base.bb => contain-base-image.bb} (100%)
>
> diff --git a/recipes-extended/images/container-base.bb b/recipes-extended/images/contain-base-image.bb
> similarity index 100%
> rename from recipes-extended/images/container-base.bb
> rename to recipes-extended/images/contain-base-image.bb
> --
> 2.7.4
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
