Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.961.1591390082934641552
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 13:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iIBUmXc0;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id q13so8484785edi.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Jun 2020 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VMDQlrPIeSmiXTN85wmz9WgZc43EIXOjyQlXVmByh+Q=;
        b=iIBUmXc0GCIcpXQkAN/jLbOesGlxVPxS9nnZCN0HwctmnvCyWPe5plDywJXcwo5a1R
         mejxxJZndsCS1xxOIhU13w3xU5dbWa+61VOmqh+giSSzRc7uxBrOs+Sgp+2+u5ju3MYu
         +JyS0H0OwPz99K3+VtmLLbZe51KPCLyJGf5RlBMvEr/SlyL09L2BzmWg0zXLeYvlzQ2z
         QuQ55XQ9IpqIIk3sSJoqGyhpQh/A6mI2fs0oT4eNMz9iyLhOsB0dy60ue5/uA6uxnr4L
         AWrYJBRyc6Sm0j/t2XzellSmayqxzIDspdNTyrW3uoa5fzSBUujlZGvhzg5szPTDuHQ4
         MKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VMDQlrPIeSmiXTN85wmz9WgZc43EIXOjyQlXVmByh+Q=;
        b=FPiRwpnawBtR5NN+afjlRNV9EsW4ReAgX2HdtUEZ3A+kLPxKD3Qk2aHJas/4jMgKWr
         E1ijIahDdubLCLOFLmPXOYaEJA5nOVvMsZrLcH6SoiGyuOkOIfiZRBHX5LBe0C9TXKEQ
         0JSbU/MtCBmi0IFkOBY/6rHfrAR9u6XwhD+ery/1Onirx+Mvgx0Wj4jt1KeGoMVny7ZE
         KOpnejNhO4698kCA2SL+dUY/buMPcO63pfQKAxSjHC6lPoUjoinQkL3ysay9/N8SHh8p
         gOQwAOs1P+u7Ps/bCYYyxuNiKFv3TtXytyMRPkE2TA5oexnSFDzBP9Kt36XFtkQgD+y3
         q/lg==
X-Gm-Message-State: AOAM530Bohgv2TfhngES98Ss/8PJF61pEoNWcNRpT1MuWx/Wf56IEZaC
	iS8rpB4AxJ7naz9/HIo9MHdvythEv6dtmYLQ1fs=
X-Google-Smtp-Source: ABdhPJxy94rncv1bMUmbJJAJ7xSfgn27K1KUGcEoFi1iAOBGVw5Ur4/vG+51T9oDgF/7TzxzHdmaoLXjNw9tAMfHloA=
X-Received: by 2002:aa7:de08:: with SMTP id h8mr10768146edv.164.1591390081391;
 Fri, 05 Jun 2020 13:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 5 Jun 2020 16:47:50 -0400
Message-ID: <CADkTA4Mv+9tXTyYk-FjdWT2yUWZkshbx83K4MvBH1ZDv+vjz3w@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Cc: Corey Minyard <cminyard@mvista.com>, Christopher Clark <christopher.w.clark@gmail.com>, 
	Siddhartha V <Siddhuvgowda.18695@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 5, 2020 at 3:55 PM Stewart Hildebrand
<stewart.hildebrand@dornerworks.com> wrote:
>
> + Corey
>
> On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
> >On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
> >> On Thursday, June 4, 2020 5:13 PM, Christopher Clark wrote:
> >> > Hello Siddhartha,
> >> >
> >> > I am also interested in running Xen on the Raspberry Pi 4. I hope to have time next week to be able to look into it.
> >> >
> >> > Christopher
> >> >
> >> >
> >> >> On Jun 4, 2020, at 5:05 AM, Siddhartha V wrote:
> >> >>
> >> >> Hello dear meta-virtualization team,
> >> >> I am building the xen minimal image using yocto warrior ("bitbake xen-image-minimal") by giving the target machine as
> >"raspberrypi4".
> >>
> >> Corey Minyard created a layer for Xen on Raspberry Pi 4 here https://github.com/MontaVista-OpenSourceTechnology/meta-
> >raspberrypi-xen
> >>
> >
> >Someone needs to lean on them to get patches submitted to meta-virt.
>
> Corey: you are hereby encouraged to submit patches to meta-virtualization.

I'm sure they aren't all appropriate, but perhaps some are. I didn't
check out the layer in any detail or form an opinion on what does or
doesn't make sense. Heck, maybe none of them are appropriate or
general enough for meta-virt.

>
> >Having a layer like that, with fixes missing from meta-virt, makes no sense.
> >
> >Bruce
>
> meta-virtualization seems to be using Xen 4.12 at the moment.
>
> Corey's meta-raspberrypi-xen layer uses Xen 4.13. The Xen patches are based on Xen 4.13. Between Xen 4.12 and 4.13 there are a few additional patches that are required for running on Raspberry Pi 4.
>
> Would you rather uprev meta-virtualization to Xen 4.13, or backport the patches and identify additional backports required for running Xen 4.12 on Raspberry Pi 4?

If someone is going to the trouble of uprev'ing Xen in other layers
rather than meta-virt, we are happy to take the uprev's in the main
layer.

Bruce

>
> Stew
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
