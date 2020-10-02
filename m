Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web11.7966.1601618369226499344
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 22:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FYTI/Yfn;
 spf=pass (domain: gmail.com, ip: 209.85.167.194, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f194.google.com with SMTP id n2so243126oij.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Oct 2020 22:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vjQYuOxLksGWo50tXqCBoSEhfdWX69Zf+zxBYgT0Fg4=;
        b=FYTI/Yfne3tFbGc0wuT6l7qm5oAkJ5un+mmbjFOskCMrFuvvvPqK5u+QE9qRH1j7fx
         31gZtXlPappRdythjIH9bOPoLGLLkZ1xD51k2MFqFP+BleFrqNl3Np8tlAOmlIwUovdQ
         0Ly32NKqyYnxiGmAuC0InUvjy0q6gzjQn9qd1urRrTewOy7xw/zbspexkMvF8uNcfXLa
         cDmkXcc0rJ8OABkG8ZoHkfMR9FD+HWbb7eZVmgJMiNvhZGHWt51ok4hP20xFpB4ulQ/y
         DQkrHbuX8B0mQn8p8+XGHjoG4pIuzIcstbfboeWghHs0B91xMNvSGEEx0SicNx6WgFpN
         jAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vjQYuOxLksGWo50tXqCBoSEhfdWX69Zf+zxBYgT0Fg4=;
        b=BEe+yyUJlhQVUwMS6pVdXFHbSRh97+720ayP2Fe2RJIRvNUae2jf3HuBjtwkcwLcBY
         MtNZ2ZAh6ztNkDxpf7NlCyQQfYz+zk+wu9gwiugxa15NOVGUDTXiFVmxZmRMGNlDT97d
         dWw+iqceQNdRBXV2v5Ger5t3D2TNUsx4GnP/tEVV2WSDUNG8R5VcQS1TVaS+roDeq3J8
         HIwYsyvbkMwXBJpkIQzE1zV651SZiF3SkvPcctkkRDdL7cZ6qomIubBIkcBk0P4VnlWN
         krskUOX00eI4drVoncCxjN3RnAfkb35KKlGV/mOcnI04xNSq4IEnwxXz0Dz7YgX/qW/d
         /uHg==
X-Gm-Message-State: AOAM532H+h9SuJeNudSXMFWsFV+6bTVk4Uga7YheDyqIAVY/RpwqCcUa
	KseRTBux2+x/a8iB/cVBH3+ajhfabJIHSmPpAmI=
X-Google-Smtp-Source: ABdhPJzrHUdphWExbhz7RWoB1fGvaoyMcXk23VWW36w30qY6tbtNfTUC0k4xIv4yHYI/9tALTi2pqlFULGdRdCgNVK8=
X-Received: by 2002:a05:6808:b03:: with SMTP id s3mr380662oij.28.1601618368508;
 Thu, 01 Oct 2020 22:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200922194539.51933-1-bruce.ashfield@gmail.com>
 <20200922194539.51933-2-bruce.ashfield@gmail.com> <CADkTA4PCTO_iUFDAc1udvt_WwbbqZJ6bfCsUk9RhDTKXegKspg@mail.gmail.com>
In-Reply-To: <CADkTA4PCTO_iUFDAc1udvt_WwbbqZJ6bfCsUk9RhDTKXegKspg@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 1 Oct 2020 22:59:18 -0700
Message-ID: <CACMJ4Gb5SUoMZ0k8EEbvOkHKOhBLkaftpYwo609S6pDkLgghXw@mail.gmail.com>
Subject: Re: [PATCH 2/7] xen: make kernel modules an override possible variable
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 22, 2020 at 12:49 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> Christopher:
>
> I pushed an earlier Xen commit by mistake (make QB assignments weak),
> but I wanted to bring this one to your attention.
>
> I've been fixing the support for Xen on some Xilinx SOCs and these are
> my commits to do so.
>
> There's a new dynamic layer for xilinx, and just the one Xen tweak to
> adjust to some kernel details (when not using linux-yocto).
>
> Let me know if you think it'll cause problems for you .. the default
> isn't changed, but you never know what you miss when mucking with this
> stuff.

Bruce - sorry I missed this message earlier. I should have time to
take a look at these next week. I can see that they're already in, so
can follow up if needed.

Christopher

>
> Bruce
>
> On Tue, Sep 22, 2020 at 3:45 PM <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@xilinx.com>
> >
> > Sometimes Xen is built with different mixes of kernel modules and
> > built-in values. If we put our expected/default modules in a
> > variable, they can be overriden by a different kernel provider
> > as required
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  recipes-extended/images/xen-image-minimal.bb | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> > index 1b45397..6733801 100644
> > --- a/recipes-extended/images/xen-image-minimal.bb
> > +++ b/recipes-extended/images/xen-image-minimal.bb
> > @@ -2,16 +2,16 @@ DESCRIPTION = "A minimal xen image"
> >
> >  INITRD_IMAGE = "core-image-minimal-initramfs"
> >
> > +XEN_KERNEL_MODULES ?= "kernel-module-xen-blkback kernel-module-xen-gntalloc \
> > +                       kernel-module-xen-gntdev kernel-module-xen-netback kernel-module-xen-wdt \
> > +                       ${@bb.utils.contains('MACHINE_FEATURES', 'pci', "${XEN_PCIBACK_MODULE}", '', d)} \
> > +                       ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
> > +                      "
> > +
> >  IMAGE_INSTALL += " \
> >      packagegroup-core-boot \
> >      packagegroup-core-ssh-openssh \
> > -    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
> > -    kernel-module-xen-blkback \
> > -    kernel-module-xen-gntalloc \
> > -    kernel-module-xen-gntdev \
> > -    kernel-module-xen-netback \
> > -    ${@bb.utils.contains('MACHINE_FEATURES', 'pci', "${XEN_PCIBACK_MODULE}", '', d)} \
> > -    kernel-module-xen-wdt \
> > +    ${XEN_KERNEL_MODULES} \
> >      xen-tools \
> >      qemu \
> >      "
> > --
> > 2.19.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
