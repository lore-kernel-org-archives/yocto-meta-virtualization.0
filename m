Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.19982.1627912540961010934
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 06:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=IjE2tWnB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id w10so11668279qtj.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Aug 2021 06:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ITL5fkSyqbLT6SHw8Lf+YY0XK5GWEgoRluqXPDjsJzo=;
        b=IjE2tWnBqyPR5FOeRBs/7DKMbyVKx6lArnO6a3M5PCTXr2sN4vVqOKcb7mRSEYs/HM
         VYy6FP9fan9OOkY3qHARCBpkhjt2HLUsmBPlTmsr7pABTBzTib9KRNWkBMqSNtxiBcfP
         VX1N/0I4J327x2MchEkytmfijHSGpRA4+kRO+bgYPxxXFghGct7IAmdfEUsEvXZyBwFN
         vHakDCVb8qnW7CVpcfk7bAJnFlRUGjfni6TKJsgXYRAsYRZy0IGXhecpkvUUbL3yrGd9
         ISuchPRy3Z/t7692wizQndTtgJgp7ilxhMRqtjMCsGOCLQ2CEIZgNBt5RUHrT3esZnVX
         rJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ITL5fkSyqbLT6SHw8Lf+YY0XK5GWEgoRluqXPDjsJzo=;
        b=mZPO39G28QzdfEiQqKKNkPPuzMKi8QUvApd3wo02YYKYE5on4uCA2qcCUxn1I750LX
         N9sla1vvfEwMYgQpFUKXmkAGx6ehXEfu4X703VZBVnVwoRmTq0aPq9LHnP06jj18g/Sl
         Oi0bMgQgmt97jGxFZ1T6D0sErmMPM/jZVNP/o3CmFGA/ksCSHYj6e3T9/sKbfzfq4ZfN
         AHx8CSdI0bqo2Lftj80C9M+IrcqLl9ABoDckywWQrW/729YsJMEJfNWKk1A6i1J8YMNj
         LTnn0q8XzfNphFEv2xc17P5vWWKBFDCFka4+8UOaSA2XIJ0w6r16vFAGppQwKYgLM/NI
         59Xg==
X-Gm-Message-State: AOAM530KVlZWJmBfZAhnqh4XrZj/y2Cvt1QBsfThxti+9sGikW+C9yq/
	+nXfrGL/QUKHV/m7MzdcUAMDaEXX30P5Az+B0uePAQ==
X-Google-Smtp-Source: ABdhPJzah1UU4Q/eZ+lPTKj/wkfWWxzev2qUO1wEQ9BJEYqkR9vL7ONMqCQYh2xIk1gnFiIHpeD04IWH1U695OEpKlA=
X-Received: by 2002:ac8:6a06:: with SMTP id t6mr14469089qtr.378.1627912540155;
 Mon, 02 Aug 2021 06:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210802012656.40174-1-christopher.w.clark@gmail.com> <20210802034857.GC16820@gmail.com>
In-Reply-To: <20210802034857.GC16820@gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Mon, 2 Aug 2021 09:55:29 -0400
Message-ID: <CAPoiz9zOfbm3FLACTGLLyj4BdD0HyRSf464J7iNKTDJnhL2_FA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen-image-minimal: fix aarch64 build for non-qemuboot-enabled machines
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org, cardoe@gentoo.org, 
	Christopher Clark <christopher.clark@starlab.io>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 1, 2021 at 11:49 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> Looks good to me.
>
> I'll wait to hear from Jon that it fixes his problem before merging.

Fix confirmed.  Feel free to add
Reported-and-tested-by: Jon Mason <jdmason@kudzu.us>

:)

>
> Cheers,
>
> Bruce
>
> In message: [meta-virtualization][PATCH] xen-image-minimal: fix aarch64 build for non-qemuboot-enabled machines
> on 01/08/2021 Christopher Clark wrote:
> > The qemuboot device tree generation task in qemuboot-xen-dtb.bbclass
> > requires the QB_SYSTEM_NAME variable to be set to identify the Qemu
> > binary to use. Skip the task if it is not set.
> >
> > Reported-by: Jon Mason <jdmason@kudzu.us>
> > Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> > ---
> >  classes/qemuboot-xen-dtb.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
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
> > --
> > 2.25.1
> >
