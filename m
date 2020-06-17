Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.395.1592413454022065254
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 10:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C5346lB1;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id y6so2575621edi.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Jun 2020 10:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OQbJKT4QOQ7SjJIbcbRDKAGaIDtDU5XG5NVeyZ5c/eM=;
        b=C5346lB1NQ86taZlTRzqcfv8B5PqX5ro2al7c+lpFX6liMvjZLChouGBFS771VnJ1r
         UfJpCuK/n+8tccAToSZJZVY1pza/au6jR6S9iV/fUNvhtpE0Gn6eI4/ayeVrVJP870aP
         VzCGGpkS3R0M3WN/iKOeA+qpL1v7+r3ENEfr5nY+y1KXJiQbcdxN7xtOZ1A5+zAaX022
         jITD2O5bS3jFIyPxRPBhM2yWpPFezZqpzKMLdS/4OLFWDNEh9aXDEm2pqzU6gXaDOOlv
         9JLJ10B0XG5aDtaoDWlUFoXBhFNIWOkq2kU0AqeGoDuvQzg77+AooUVJ73+d4J7o8nQx
         58FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OQbJKT4QOQ7SjJIbcbRDKAGaIDtDU5XG5NVeyZ5c/eM=;
        b=eud91SaewKNUo/un7AhNq50bTKk1Y7cYV5t0vhesn5fKFPuOtOWA1pYhheCDFUG/Su
         pVVw6ROOkSPshnrP5a7WrzJLGeHkDJxKssKT28/AQc2xMyqoMwODHpdGmGeG9iFwyWdf
         bLuv4eDvIcoJIcP49E9fK6DXGDE+XzJyLG+q0s80usg96jbkEqJB3/4wRoJG5gwRNA9q
         P4peJv9tBuSXMBOE8+s8aUe52Yl7Y+XJS0H99IumZ7DiT/0oQCoH6/4PEmByvU6jDT6O
         6pXeeihr+ZelLXr9GZNCRzeXcgfWtOzgRWs2NU+LguyxDmT8sJ0fw5JeiqWSsDme7Y3a
         ck7Q==
X-Gm-Message-State: AOAM5337E4mPIYAaJ6nrhRqHO8jIvzUYJpMxnivboJ6iHfWlK70W61hw
	pKOVeDD3sX6ThgfN0mupM5OJ8Zw7V+PXj9kYkBWdpN3BuTe4ig==
X-Google-Smtp-Source: ABdhPJw8kmllY06VTPIQ7ukfvw3/ckUHIeyM/wyJ2W4ifCPa/mFuDyVi0YUaSW5A/EAqsE5BOFX6Gp0zZTDs/0a6or8=
X-Received: by 2002:a50:c181:: with SMTP id m1mr132704edf.27.1592413452539;
 Wed, 17 Jun 2020 10:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <1hYs.1592408760508374105.4D7p@lists.yoctoproject.org>
In-Reply-To: <1hYs.1592408760508374105.4D7p@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 17 Jun 2020 13:04:00 -0400
Message-ID: <CADkTA4MgfnnHgHFbnF9fTb64X1VsV4s6LDQwS65Yv8tb3GHJEg@mail.gmail.com>
Subject: Re: [meta-virtualization] [ Linux 5.4 ] Input file "cfg/virtio.scc" does not exist
To: Ashishx88 <ashish.emailaddress@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 17, 2020 at 11:46 AM Ashishx88
<ashish.emailaddress@gmail.com> wrote:
>
> Hi All ,
>
> Good Evening .
> I have been working with poky for some time & started with virtualization shortly.
> and hence seeked some inputs to understand the layer .
>
> - I am trying to compile linux for version 5.4 with virtualization ( dunfell branch )
>   The error being reported is " ERROR. input file "cfg/virtio.scc" does not exist "
>
> - Evaluating further , i was able to check that error was due to  "linux-yocto_virtualization.inc"
>    which had KERNEL_FEATURES_append = " cfg/virtio.scc"
>
> Can member please provide any input or let me know if i have mis-understood any aspect
> of meta-virtualization
>
> a) Why we have  linux-yocto_5.4_virtualization.inc specifically only for linux-5.4 only.
>     I was assuming to have similar file for linux-4.19 also , which is not there in layer ?

Because we only match the active kernels in oe-core. That's 5.4. You
must use the older branches to get older kernels.

> [ linux-yocto_5.4_virtualization.inc ] =>  [linux-yocto_virtualization.inc] => [KERNEL_FEATURES_append = " cfg/virtio.scc" ]=> [error  "cfg/virtio.scc" ]
>
> b) Looking for the file , i found the required file at http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/cfg
>     But now , i am not sure where is the "cfg"  folder where i can store the file as per KERNEL_FEATURES_append = " cfg/virtio.scc"

You must use the kernel-cache for those fragments, that's the design
of KERNEL_FEATURES. It looks at the centralized fragment repository.
If you are providing something in your own layer, or using your own
kernel recipe, you must have a fragment of that name, in that
directory structure.

I've just recently explained this in detail in:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13927

Cheers,

Bruce

>
> Can team members please provide any debugging info or let me know if i am missing something completely here.
>
> Thanks ,
> Ashish
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
