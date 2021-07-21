Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.1719.1626835843427689474
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 19:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=itPDgnW6;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id go30so973319ejc.8
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Jul 2021 19:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vgmTNJbQdwsypAH6io7kPrURd4I8HUKMuhoMrLPJigA=;
        b=itPDgnW65upozhiCil+wesaw05ccimS9L9UI5TNbC5iIPJ0uFnSjahmpIXKNV3P8RW
         bmRzV3Vh5TOdPolj0VtjJKJaeqEYup9OrZmZDW26q/NcDnR01KHUvXIQrOhQuV9qhXjb
         0+5/RtZtjcoO/V1hTceQp+vrRKJNhqglclHWwEsRjFon4mHZTjwi6AwDnAyYfWIC49UJ
         UXT+oOMajlJTmy4u5LIfYGJeVFtoCWZWzEU7OnEUtWBnmAaUxF2c+yl5I57n/8SrkFHZ
         YTxlTDtyk2mBd6HCuRhUg+vEjPiktKmrsWQ7e+gBDWExjmSJ50O0rox32Ok/03vdNzOC
         fv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vgmTNJbQdwsypAH6io7kPrURd4I8HUKMuhoMrLPJigA=;
        b=KopAm1HLwFPjn3NSlUuIqxh6z7+7TgC7faPMtAEF5yfUsI8k0X/t7V6mFU5g5oW31Y
         wIvtFTQYfJ0QnsdoaMd9Tud9C3IJkHolvs+C1jBIDaiRV1BupN2ms3HGCRfcZUN2MMVk
         KGEYCZBjX7BlFOIZKEWsL//ridQF7Z0iikhDFNa6C8mrbgHoNB1ThRSnQ+ZAPGcqdY4D
         2kR17Ewk+dL7hSNOYrJahcVIXalB1qMaEaTUllbtxp/fpvBC8edhaWTw7ePm/Myb0rJr
         IvnIbtgyC4OTnJfP3+GWkaVV/gK2z08heIE5NVB0GwDZC3Nw9l4c6Al/4o7lc/8VgYaJ
         RsNw==
X-Gm-Message-State: AOAM530hPRmj4i+zrc3xIguGD9g6JBAjGutZV7DU7sAN+L/NFhvG8eT6
	yTk3gSSs4ukhSrFRWmTvw/bSEci+P6CuoAf5YU4=
X-Google-Smtp-Source: ABdhPJwG8gxNyWFOCG4Mm9kGtUGW4OuW5opNy7I4cyUa6jQLknDm5ONpwK9HeAIdf9xZqrplJ0LP4bGV9WSEecr3Kp4=
X-Received: by 2002:a17:906:4b46:: with SMTP id j6mr36367779ejv.247.1626835841877;
 Tue, 20 Jul 2021 19:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210708044300.127016-1-christopher.w.clark@gmail.com> <1691BF505C93703B.29316@lists.yoctoproject.org>
In-Reply-To: <1691BF505C93703B.29316@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 20 Jul 2021 22:50:30 -0400
Message-ID: <CADkTA4M0k4Tdc9DdfPo8HUj4mY1DQQdRkVkfS0E-Z7hGyLjLng@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/2] Xen: qemuboot device tree support (Arm 64-bit)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.clark@starlab.io>, Doug Goldstein <cardoe@gentoo.org>, 
	Diego Sueiro <diego.sueiro@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	andrew.cooper3@citrix.com, Daniel Smith <dpsmith@apertussolutions.com>, 
	Rich Persaud <persaur@gmail.com>, scott.davis@starlab.io, adam.schwalm@starlab.io
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 14, 2021 at 3:34 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Thu, Jul 8, 2021 at 12:43 AM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> >
> > This series introduces tools and class structure in the layer for
> > enabling testing Xen system images with Qemu, booting with a device tree
> > that describes the target system.
> >
> > A device tree is required for launching Xen systems on Arm platforms and
> > is part of the Hyperlaunch design for Xen.
> >   https://wiki.xenproject.org/wiki/Hyperlaunch
> >
> > This series adds a recipe for Lopper, a device tree tool, and its
> > dependencies. It provides a class that implements a bitbake task to
> > generate a device tree for qemuboot, and a set of defaults to enable
> > 'runqemu xen-image-minimal nographic slirp' to boot images compiled for
> > Arm 64-bit machines.
>
> This looks great, and something that I've been looking for as well.
>
> I just need to carve out a bit more time to take it for a spin, but I
> don't see any issues with the changes. (I've reviewed the new recipes,
> etc, and nothing major jumped out).

I finally got a chance to look at things in more detail .. and it
looks like a nice step forward.

I had some minor comments. If you can't get to them, or they aren't
valid .. let me know, and I'd have no issue merging this as-is and we
can fixup later as required.

Bruce

>
> Bruce
>
> >
> > Christopher Clark (2):
> >   lopper, python-dtc: add new recipes for device tree tools
> >   qemuboot, xen-image-minimal: enable runqemu for qemuarm64 Xen images
> >
> >  classes/qemuboot-xen-defaults.bbclass        |  29 +++
> >  classes/qemuboot-xen-dtb.bbclass             | 209 +++++++++++++++++++
> >  conf/distro/include/meta-virt-xen.inc        |   3 +
> >  recipes-extended/images/xen-image-minimal.bb |   6 +-
> >  recipes-kernel/dtc/python3-dtc_1.6.1.bb      |  26 +++
> >  recipes-kernel/lopper/lopper.bb              |  45 ++++
> >  6 files changed, 316 insertions(+), 2 deletions(-)
> >  create mode 100644 classes/qemuboot-xen-defaults.bbclass
> >  create mode 100644 classes/qemuboot-xen-dtb.bbclass
> >  create mode 100644 recipes-kernel/dtc/python3-dtc_1.6.1.bb
> >  create mode 100644 recipes-kernel/lopper/lopper.bb
> >
> > --
> > 2.25.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
