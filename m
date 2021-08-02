Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.1216.1627926638675193286
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 10:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R4vTYLWs;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id w6so25041042oiv.11
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Aug 2021 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4HwLM2FFujtIrwviPcYV77dp+mdJanbv9aEAuRzlguk=;
        b=R4vTYLWs4HDmkGy+ooxlwvE4ecesPYjIUfUkFzVA+aibnoIsC4h+6h0aSlFiHt4XF7
         ZpYe/JdpK8P80xmbllrqfo9gLLMrEIHYENJgS4t5YQVU6SDRv4wQUCtMQmFmwUu2cjS0
         srdaIGwWrYQxmsxjtb7fKxb68U574E0Zg39c1VGNTNY1QXfG8mzKYN8lnFmNFaGAj7V3
         oMSxT0Aaj+ZjxMqsS/c4QELGHmyJsWtfi15G9aRuDkLZlyfriNYY7nWL85vjBQWsRPc/
         okN3dBiNWio5iDN9fz0J5LK275pCmYLflpp45wFRaNKM7ObxF7q2iwNKDz2qkOqJYzf+
         Bsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4HwLM2FFujtIrwviPcYV77dp+mdJanbv9aEAuRzlguk=;
        b=jLG3xmYLZ7CrnUanX9vy7HN228d+C4p7Uz3uGcKJ0u0QxgBcLlraWVge7hiulnI5Q+
         Yucy3IeYEqyB81Qrd44oGk1BKSgSYo2hbM1n1ixixEWw4JIfIgeQ/UuzHaOfwGqNw1KO
         wAbLj6zjFm9/A4f1hhH0K0C2qSb5L7NK56Woxf1N8ORkhDfH3kNY8Supax+3SvL2U9ZA
         CaITB7K2XlRhXOPbO1QjCEr61G2CBAgFT5UTbL51XFYKJjHU5i9pCH8j8hMrL2lmnXw2
         QymOY9X057LB59Ep+CnNisQ53e5R33CpQI9lVRhWg+8fmkE/oadq3KO+Qjmx/n5UQevl
         66cw==
X-Gm-Message-State: AOAM532RvVEP3mZMH57iAsaBbpzDTe8dFShSope9HzHDrKFXVWErmB8p
	ICqYBeUPScNuUMnmS/DLvBiR+dxnPMBCs/jEdbs=
X-Google-Smtp-Source: ABdhPJxv1OzMd+5k9pAAyeDdRzWTVCrLLYVp2menYHuKe0X+GY1amekawuTKiM1vdJ/BsFpQWnc3ReA/fTVsW+JjbpQ=
X-Received: by 2002:a05:6808:1494:: with SMTP id e20mr102884oiw.122.1627926637871;
 Mon, 02 Aug 2021 10:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAPoiz9zH=UK1Aj=o6rWVmF4De58hjXyZ4QBpb8N5Lus898x6Uw@mail.gmail.com>
 <CACMJ4GZ_fvUV_Z9z5+m5CE1Vj4xXVtD8PW0L9qUHwJ=CmwC7=Q@mail.gmail.com> <CAPoiz9xJ_VwufXeyB4osrp0iQeDrB=twBwDMiB35SoZTwM78Qg@mail.gmail.com>
In-Reply-To: <CAPoiz9xJ_VwufXeyB4osrp0iQeDrB=twBwDMiB35SoZTwM78Qg@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Mon, 2 Aug 2021 10:50:26 -0700
Message-ID: <CACMJ4Ga=89gH7NyrW_5=QAFJShdCTjFj3-_35+BfuBCOiq7pHA@mail.gmail.com>
Subject: Re: [meta-virtualization] Build break with patch for "qemuboot, xen-image-minimal: enable runqemu for qemuarm64 Xen images"
To: Jon Mason <jdmason@kudzu.us>
Cc: Christopher Clark <christopher.clark@starlab.io>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 2, 2021 at 6:54 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Sun, Aug 1, 2021 at 9:03 PM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> >
> > On Sun, Aug 1, 2021 at 8:36 AM Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > I'm building xen-image-minimal for gem5-arm64 machine (in the meta-arm
> > > layer) and the recent patch to add qemuarm64 support is breaking my
> > > builds.  The patch in question is:
> > >
> > > 19347a7c4e4c qemuboot, xen-image-minimal: enable runqemu for qemuarm64
> > > Xen images
> > >
> > > You can see an example of the breakage here:
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/1468242014
> >
> > Hi Jon
> >
> > I'm sorry that my patch caused trouble and thanks for sending your
> > report. I now understand the issue.
>
> It happens, and I appreciate your rapid response (on a Sunday!).  This
> is the reason why we have our nightly Gitlab CI runs :)
>
> >
> > > The problematic line is
> > > diff --git a/recipes-extended/images/xen-image-minimal.bb
> > > b/recipes-extended/images/xen-image-minimal.bb
> > > index 6733801cca5f..ca6d26836c42 100644
> > > --- a/recipes-extended/images/xen-image-minimal.bb
> > > +++ b/recipes-extended/images/xen-image-minimal.bb
> > > @@ -31,7 +31,7 @@ XEN_PCIBACK_MODULE_x86-64 = "kernel-module-xen-pciback"
> > >
> > >  LICENSE = "MIT"
> > >
> > > -inherit core-image
> > > +inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb
> > >
> > > Reverting this line "fixes" my problem.
> >
> > Would you be able to try applying this patch instead? I believe it
> > will resolve the issue.
> >
> > diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.bbclass
> > index 08f9b02..2d37e91 100644
> > --- a/classes/qemuboot-xen-dtb.bbclass
> > +++ b/classes/qemuboot-xen-dtb.bbclass
> > @@ -176,7 +176,7 @@ do_write_xen_qemuboot_dtb() {
> >      # Not all architectures qemuboot with a device tree binary, so check
> >      # to see if one is needed. This allows this bbclass file to be used
> >      # in the same image recipe for multiple architectures.
> > -    if [ -n "${QB_DTB}" ] ; then
> > +    if [ -n "${QB_DTB}" ] && [ -n "${QB_SYSTEM_NAME}" ] ; then
> >          generate_xen_qemuboot_dtb
> >      fi
> >  }
>
> This does indeed allow it to compile without issue.  Please push this
> as soon as possible.

Excellent, thanks!

>
> >
> > > It seems odd to add qemu
> > > stuff for machines that don't need it.  Is it right to add qemu stuff
> > > to an image.bb?
> >
> > I believe that it is reasonable to do so as it enables support for
> > testing the image (or images derived from it) even if the intended
> > final target is non-qemu hardware. I have been working on using this
> > qemu support to enable the OpenEmbedded QA framework to launch a Xen
> > image and execute standard and Xen-specific OEQA test cases within it,
> > eg. via: bitbake -c testimage xen-image-minimal
> > It should be a valuable capability for images that are built even for
> > non-qemu machine targets. You can also see within this layer that the
> > xvisor image recipe similarly chooses to include qemu-specific items.
>
> Poor wording on my part.  I'm not saying QEMU has no value in testing,
> I was trying to say that I don't see similar things in other layers
> that use qemu (lazily looking at poky as my example).  This could very
> well be the right way of doing it, and I'm just ignorant of it.

I think the default OE qemu settings are OK for most images so no
adjustments are needed, but those that include a hypervisor, or at
least a type-1 hypervisor, may require some tuning of the settings to
enable a successful boot. It gets even more complicated for Xen since
the x86 and Arm platform boot configurations are currently rather
different.

> All of that being said, I am interested in what you are doing here.  I
> think running CI on qemu xen arm64 as part of our development process
> could be very beneficial.  In our current setup, we're running
> testimage on qemu machines.  Do you have anything similar planned for
> this machine?

I've recently added recipes for the Xen Test Framework to
meta-virtualization as preparation towards enabling that to run in CI
with OEQA (ie. testimage). XTF is currently only for x86 platforms but
I am aware of development efforts to enable running XTF on Arm too, so
it should be useful to you when that lands. I have been working on the
integration needed for XTF to run as an OEQA test case and I do have a
working early version, but doing that work has surfaced some
challenges with the Xen toolstack that I need to resolve first, so
that's my current focus.

I'm very happy to hear that you're already running CI on the Xen
recipes and image - please do report any issues that you find.

best,

Christopher

>
> Thanks,
> Jon
>
> >
> > thanks,
> >
> > Christopher
