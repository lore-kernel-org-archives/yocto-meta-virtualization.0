Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.20121.1627912459991500231
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 06:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=hPvcLHK9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id t68so16589292qkf.8
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Aug 2021 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KEaxW7rsXFny/YvFwoCdhDpt5qj59/ierSycqPPbMZo=;
        b=hPvcLHK9bKpA8wzfPWvHdw6n9CkTkAtoBMJ7kfNPJwLkbBRXdPpnznv1/bM86SWsmd
         ULq8jDrFsqJSi1FtqYlAITaS0y0tZ64C2clBre67WEXDMwUQtWAHUg9C5knwhPIU1R+F
         b5gj8dt8ESEutZ9ovhjR/z2pbMJzYfd29SvisZBfHg0wmJoPwGozix7I7lGdF8qlz3dQ
         CEp05hqrGqCKa/GelhdJFs3ZnKQJAbzlYbEXA0ukvqsF9rY5RAitOogyegfSSBpcF030
         Ci8PJ2tBH8lUaerWIpPA9DkU8Cvbjzx5e/TVXi7st8JslNhMRqHaBqAb0QxSgulp3+43
         dUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KEaxW7rsXFny/YvFwoCdhDpt5qj59/ierSycqPPbMZo=;
        b=kYRqXd1Ix6a9+Bp8ggaNQQu+DMjlmY5k0h5KQ6nvfi5qUq+abUttsDxNd5zCKOGA3x
         Ux6TCxZxiUrcX18oua1b20L5nbxMUQHESiMueORK466baOOEtuH50vo0rwqbOzRj34uh
         jeiriGVPZUYMOui9VcLc9bT7+9hpnOrNA1fl+pHqipmATHaTiyLgA0K+FoStYPLBOJ0J
         KEdYWXm2zh09YdBsAEI5nmKKGLWO1Ea2/NE/qGcFqqeFO8exO0DGIrfwnnIfrw9xBUqA
         cVuuIM7TT073AzUtD1mg3tqGmU/dwUyJIDO0fXat3QyCBevn8a9CNy2uc5SenBnL3Ppd
         U67Q==
X-Gm-Message-State: AOAM5336v0DGyQQk0G37P6tguM+r5QH9QlNJbOMcXneXVYrTlO0UrMF4
	h7YbBLkCwGQHDAJR46+J0pWiJfNkYje/f1ny2evldQ==
X-Google-Smtp-Source: ABdhPJxxaS+O9aNZTY0zxMCjIXDUZ8ZNIo6+giJuz3YlnnkiCeDbxGyTGNIH/eOQFZsHUaJhkv1QKKZ3nxCeDDgykFY=
X-Received: by 2002:a05:620a:c86:: with SMTP id q6mr15475626qki.278.1627912459003;
 Mon, 02 Aug 2021 06:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAPoiz9zH=UK1Aj=o6rWVmF4De58hjXyZ4QBpb8N5Lus898x6Uw@mail.gmail.com>
 <CACMJ4GZ_fvUV_Z9z5+m5CE1Vj4xXVtD8PW0L9qUHwJ=CmwC7=Q@mail.gmail.com>
In-Reply-To: <CACMJ4GZ_fvUV_Z9z5+m5CE1Vj4xXVtD8PW0L9qUHwJ=CmwC7=Q@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Mon, 2 Aug 2021 09:54:08 -0400
Message-ID: <CAPoiz9xJ_VwufXeyB4osrp0iQeDrB=twBwDMiB35SoZTwM78Qg@mail.gmail.com>
Subject: Re: [meta-virtualization] Build break with patch for "qemuboot, xen-image-minimal: enable runqemu for qemuarm64 Xen images"
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark@starlab.io>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 1, 2021 at 9:03 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Sun, Aug 1, 2021 at 8:36 AM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > I'm building xen-image-minimal for gem5-arm64 machine (in the meta-arm
> > layer) and the recent patch to add qemuarm64 support is breaking my
> > builds.  The patch in question is:
> >
> > 19347a7c4e4c qemuboot, xen-image-minimal: enable runqemu for qemuarm64
> > Xen images
> >
> > You can see an example of the breakage here:
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/1468242014
>
> Hi Jon
>
> I'm sorry that my patch caused trouble and thanks for sending your
> report. I now understand the issue.

It happens, and I appreciate your rapid response (on a Sunday!).  This
is the reason why we have our nightly Gitlab CI runs :)

>
> > The problematic line is
> > diff --git a/recipes-extended/images/xen-image-minimal.bb
> > b/recipes-extended/images/xen-image-minimal.bb
> > index 6733801cca5f..ca6d26836c42 100644
> > --- a/recipes-extended/images/xen-image-minimal.bb
> > +++ b/recipes-extended/images/xen-image-minimal.bb
> > @@ -31,7 +31,7 @@ XEN_PCIBACK_MODULE_x86-64 = "kernel-module-xen-pciback"
> >
> >  LICENSE = "MIT"
> >
> > -inherit core-image
> > +inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb
> >
> > Reverting this line "fixes" my problem.
>
> Would you be able to try applying this patch instead? I believe it
> will resolve the issue.
>
> diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.bbclass
> index 08f9b02..2d37e91 100644
> --- a/classes/qemuboot-xen-dtb.bbclass
> +++ b/classes/qemuboot-xen-dtb.bbclass
> @@ -176,7 +176,7 @@ do_write_xen_qemuboot_dtb() {
>      # Not all architectures qemuboot with a device tree binary, so check
>      # to see if one is needed. This allows this bbclass file to be used
>      # in the same image recipe for multiple architectures.
> -    if [ -n "${QB_DTB}" ] ; then
> +    if [ -n "${QB_DTB}" ] && [ -n "${QB_SYSTEM_NAME}" ] ; then
>          generate_xen_qemuboot_dtb
>      fi
>  }

This does indeed allow it to compile without issue.  Please push this
as soon as possible.

>
> > It seems odd to add qemu
> > stuff for machines that don't need it.  Is it right to add qemu stuff
> > to an image.bb?
>
> I believe that it is reasonable to do so as it enables support for
> testing the image (or images derived from it) even if the intended
> final target is non-qemu hardware. I have been working on using this
> qemu support to enable the OpenEmbedded QA framework to launch a Xen
> image and execute standard and Xen-specific OEQA test cases within it,
> eg. via: bitbake -c testimage xen-image-minimal
> It should be a valuable capability for images that are built even for
> non-qemu machine targets. You can also see within this layer that the
> xvisor image recipe similarly chooses to include qemu-specific items.

Poor wording on my part.  I'm not saying QEMU has no value in testing,
I was trying to say that I don't see similar things in other layers
that use qemu (lazily looking at poky as my example).  This could very
well be the right way of doing it, and I'm just ignorant of it.

All of that being said, I am interested in what you are doing here.  I
think running CI on qemu xen arm64 as part of our development process
could be very beneficial.  In our current setup, we're running
testimage on qemu machines.  Do you have anything similar planned for
this machine?

Thanks,
Jon

>
> thanks,
>
> Christopher
