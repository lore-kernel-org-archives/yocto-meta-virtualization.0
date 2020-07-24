Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.379.1595610631956844940
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Jul 2020 10:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X6OwNEWQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id a21so10681822ejj.10
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Jul 2020 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xe8GRVpM1nc+54hQueh3leVDG4eXkc6R868yps5U2eU=;
        b=X6OwNEWQdgmAhChi1eIYkVl2bMIibn9GGNrCDdEvBOaP2NsjngdhbrCtihxL8rd9I9
         UyqqK5Ijt/BgOp7TqpkEwslBaFlJGSfn+t11s+bDRphzXFz6KQ5v4LxG1K7Sx448Edn4
         m2AFhw2jE2sVjhHKG4kIi+b2/UERnaegZbURWALUhHYXPcITD3BUbAsUvc+QoCnBixJo
         Hkqna+ZA6SZA3DKcD635olH6u8e1yPOXU/tc7sgAaFU+90bRce6uYCK+fWA/GtPHBLx/
         zoP4B1F65mnyj7fGFHeSRHQmQU86NiTRRqWwKS22f2Kdfnru/JmpExBryGNUUx27fTAR
         oTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xe8GRVpM1nc+54hQueh3leVDG4eXkc6R868yps5U2eU=;
        b=SLp97Y3TmDxNsuamMYpS64gK0CTDZzQLFdxhJ6RgXk2i2UtAebToi1hlLCvOXebJPF
         XXEdposvX1MVzNscdhfZ9PzuO575yfkx8ovUc30l2hGsFXa+TgG2h1St0yUlbTm8AMVZ
         0MonF1UrzKoS+2V0TyK+VcbWpf9Z8wuI0WCbnvvU2eoRU6SMWgw8+Ch8l6CFJCHIKVz6
         /SF65iwPqpyt94cf6lieJrk0d63SYCxdMqv84DL+pPrbc8wqLpQ4vd08bw47xxkpZ4TW
         XhS74H6OXymbO/7Idzr+mb0IkeWkbTGkhEq2VegKmUkpmRljhHyMT6l7VO4+AQt2A48M
         g/Pg==
X-Gm-Message-State: AOAM533KTjCmEdgMqYlh0bfUpIVG7hkNIJwg/vVsCr1EjXlKREL2hgbP
	+veZWa57pUNsdBTs91CTLtXy1iYNF29NUfdzH8E=
X-Google-Smtp-Source: ABdhPJzTcJK2lZ9JuKmKgQECvDFYnyJxW2e0wxgjQTLQ2B44IYp5Vb/Rj+lLB2pJNLGmF0DqNViiBpUG3h2sesxHHt4=
X-Received: by 2002:a17:906:1414:: with SMTP id p20mr9890751ejc.247.1595610630385;
 Fri, 24 Jul 2020 10:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <1595515597-112052-1-git-send-email-diego.sueiro@arm.com> <CACMJ4Gb+VrL714otAe1RB_yyx_-qeTos8bJeSgOo=zL9=GtOyA@mail.gmail.com>
In-Reply-To: <CACMJ4Gb+VrL714otAe1RB_yyx_-qeTos8bJeSgOo=zL9=GtOyA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 24 Jul 2020 13:10:19 -0400
Message-ID: <CADkTA4Oa6oOYuG6dnoh3HPEQPkGuz_EyAd8w020WZHkHcUN4+w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] qemu: Remove duplicated xen PACKAGECONFIG
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Diego Sueiro <diego.sueiro@arm.com>, meta-virtualization@lists.yoctoproject.org, 
	nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 23, 2020 at 2:42 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Thu, Jul 23, 2020 at 7:47 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
> >
> > The "meta/recipes-devtools/qemu/qemu.inc" already sets the PACKAGECONFIG[xen].
>
> This is correct and this section of the qemu append here can be
> removed now, since both openembedded-core and poky have been updated
> and contain this version of the logic in their qemu recipes.
>
> Thanks, Diego.
>
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Reviewed-by: Christopher Clark <christopher.clark6@baesystems.com>
>

Thanks for the review.

This is now merged.

Bruce

> Christopher
>
> > ---
> >  recipes-devtools/qemu/qemu_%.bbappend | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/recipes-devtools/qemu/qemu_%.bbappend b/recipes-devtools/qemu/qemu_%.bbappend
> > index 998a401..5cca9e1 100644
> > --- a/recipes-devtools/qemu/qemu_%.bbappend
> > +++ b/recipes-devtools/qemu/qemu_%.bbappend
> > @@ -1,3 +1 @@
> > -PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen-tools,xen-tools-libxenstore xen-tools-libxenctrl xen-tools-libxenguest"
> > -
> >  require ${@bb.utils.contains('DISTRO_FEATURES', 'vmsep', '${BPN}-package-split.inc', '', d)}
> > --
> > 2.7.4
> >
> >
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
