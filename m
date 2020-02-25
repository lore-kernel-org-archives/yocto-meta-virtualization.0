Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.4407.1582638079470853305
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 05:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q3vYdHxK;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id e10so16250021edv.9
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Feb 2020 05:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g98dY2QTlgbRnOj0ohycp7LoMSGlaPbur/7cDZ+eoCk=;
        b=Q3vYdHxKWYs6mb9majNbxtvuqzkuR0Wp1zFUo0BUZaLi2qBhAbmV2bq4zV5BDlcQJH
         PfhPBlyIOnbQpe3BjXLJut447osWdTzCNSPfTEh6xkJC4z95ZTt/GqOpzjie4Xk8i2oz
         YXaekyCkgOzS9c3LOFJ93tLfBFvm44jjdC0DHaqt7qgP428a3UJPcY11cka3GZ8hleX1
         k8cECuXXD6TkLa1IC6TsCC7G0AuTfX+AUjOVztgkaD7wwmYwLTnD+v8fQSJoTKEOdJuW
         2sWhd68mubdn/i2yqcbn4/6NZZgQUAVMtjdLHhYwJqeLC+PxTUw3Scn7CFwCCjpTNOk2
         yURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g98dY2QTlgbRnOj0ohycp7LoMSGlaPbur/7cDZ+eoCk=;
        b=dG9K1Ur0YtH/kL3jZX3+HPGBLXYScvp78AvYfVg2Jl3zNgbAQY5OdCgBYYK0yW9niu
         yBA/fiEMc4Yt0y0TbxzbT/M6eq4dvr8Pb9SB96cU7/69IaFxGyvnegU/oXZTu2Vg1maK
         DVFxNrkuwrd8JCk0X2nEn6BD8oj2Aubqs3iiJSHBlHc9EDSDbwhkERUmakck20p5walr
         GkiIfPYr1RVv0kW6fFnzq81Q4U1AIlNRfgJQS4B+7Fsl5/3yffELTDl4uk3fcEWz3ufU
         vc8LA5skQqY76sq3c910XopF623q2pA3wLGHTHE+cdLBIEX6fH0wHmAoMZC7FjyM4RUy
         1F5g==
X-Gm-Message-State: APjAAAUVDMAVWqGyttAIcHaLDkXKQPCnkE2ed8RdniexmNEgTH5HKrTy
	PCWC6Cll0NKbyXSPOqOBbh34C2i6epJA6ufBe0k=
X-Google-Smtp-Source: APXvYqx+ITrQx8zgJCcFEB65SNUVDoflQSNGVuYiQiKQMdIPnoE9jx7vVV1ijevSUc6lVNxJ0T7J9hEtPjfHDcD5qNE=
X-Received: by 2002:aa7:c616:: with SMTP id h22mr48703631edq.352.1582638077859;
 Tue, 25 Feb 2020 05:41:17 -0800 (PST)
MIME-Version: 1.0
References: <1582613221-56653-1-git-send-email-chee.yang.lee@intel.com>
 <CADkTA4M6PKA4wJ5vrOYis+q7Tvw+xAbQG7TMyim-Xz_+PZywfg@mail.gmail.com> <ae3d8cc2be9723b354a29cebdd8548f7e629254a.camel@linuxfoundation.org>
In-Reply-To: <ae3d8cc2be9723b354a29cebdd8548f7e629254a.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 25 Feb 2020 08:41:06 -0500
Message-ID: <CADkTA4MnfaXA+ZxfYge0PXS0auP5ohJokP4YKiEF_8sMCg5iuQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] linux: add bbappend for generic cases
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Lee Chee Yang <chee.yang.lee@intel.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 25, 2020 at 8:37 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-02-25 at 08:33 -0500, Bruce Ashfield wrote:
> > On Tue, Feb 25, 2020 at 1:47 AM Lee Chee Yang <
> > chee.yang.lee@intel.com> wrote:
> > > From: Chee Yang Lee <chee.yang.lee@intel.com>
> > >
> > > add generic .bbappend for linux kernel recipe to allow
> > > all linux kernel recipe with name "linux-%" to enjoy the
> > > kernel config from virtualization layer.
> >
> > The generic bbappend makes sense, but having them completely
> > unversioned is an issue. Having them completely generic gives us no
> > way to adjust the names as they change over time (and they do) and
> > can
> > give the false impression that they've been tested or are valid for
> > any version.
> >
> > Last I checked, the % wildcard means "until the end", so we can't do
> > linux-%_<version>.bbappend
> >
> > I've always had the LINUX_VERSION variable in linux-yocto for cases
> > like this, so I'm wondering if not only can we check the distro
> > feature, but can we also check the version before doing the kernel
> > feature addition ?
> >
> > I've cc'd Richard, in case he sees this and can offer a suggestion.
> >
> > I'll think on this more, since I'd rather collapse all the
> > linux-yocto* bbappends, into a single bbappend that works like this,
> > so not only can it be used by other kernels, I can actually test it
> > :D
>
> There are a few options. You could for example probably do something
> like:
>
> include ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux-yocto-${LINUX_VERSION}_virtualization.inc', '', d)}
>
> (note include instead of require)

Indeed!

I'll try and pull something together for this, since I do want that
version variable to come into play, otherwise, we are looking at nasty
runtime debug versus an easier to diagnose build/config time thing.

Thanks Richard,

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
