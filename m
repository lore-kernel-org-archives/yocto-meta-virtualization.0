Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.453.1636642388673992498
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 06:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZYiMwDE2;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id f4so25111907edx.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Nov 2021 06:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Uwuqp2RSS7QbnxD8KAxnB3Oh20vLUG1TEZpVk5u5jIU=;
        b=ZYiMwDE2sCpdd+i+SX+7iLXPZswkDJCNPmeg8fSTNA0RIUg31je2a+mhETj93zeV6A
         TWXi1gOkXmo3SIWNAz6ZmgD8Z1Ay+ijg5A37Wsdm/RLJfo3X8Bc6Nz8g7O35C/efKfj1
         n94L8TFUIdAQYLYrbZ/hUM9AL3OcAvHnfPcCYhFAIXpvBfXQtIGOHULHrjdO9T+iWza5
         oF0pJQArehZoDu0q4YidHq3Bb7Xd406E3M1NhQDFEVziNa35xUFvXr5jRMg/C+jIlQFF
         dRgSrAdE6zV1PGH0291FSSRe6G3J2nDzmz0CwnMuEkvhRn5k5+50vYmJV4/YW4eiKVDR
         SM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Uwuqp2RSS7QbnxD8KAxnB3Oh20vLUG1TEZpVk5u5jIU=;
        b=wexRi0iO2W5wVMa0lqVbZvZ9Lc1vzo4q8BCO+/+NYb7DcCitatxjwV4YQf1/9YWTPt
         tfwp9Yzuv94pyO8f6Wb5jJJafKjw1iikWy1bUx74SMFWBD3fJHzxpYlxOyM0lM5NzWEV
         AUNXjTs2Y+hUCZZCjJHnI9c+bDl3lbKMEzzbnvATdOOnEeqSutw++523oNuFvQPaI6gb
         mWkMECYtVja5vboeq8v57fdD9bgE7EbLu3WzQBByM05cjrqhx9B55PdT/6UcbGZFoxkF
         lp0nKml+jdeKH48dQBpzxGAL3HTX8GIDsZkZzZeZ+KyGpxHYbiXYjXXxGrMDW14WB49W
         G91g==
X-Gm-Message-State: AOAM5321R1TffZ4FiaWmjtrjmV8Pml4teV2T8hYkRhfy9S/zCtAetKZq
	DQFIdJAp77tsEFzSuCt50olvzPdlrWICojRlJHs=
X-Google-Smtp-Source: ABdhPJw6ceZuCN2SJODWXC3Zl9oy8bLy5qVTJuwyiqi1Dc5lqbe7RK5p/nJX81d1OsL5RC7AKreAkv3iakBk+HLqU4g=
X-Received: by 2002:aa7:cd09:: with SMTP id b9mr4622004edw.4.1636642386936;
 Thu, 11 Nov 2021 06:53:06 -0800 (PST)
MIME-Version: 1.0
References: <CO1PR08MB7016339CB7AA08CE6D133344F08F9@CO1PR08MB7016.namprd08.prod.outlook.com>
In-Reply-To: <CO1PR08MB7016339CB7AA08CE6D133344F08F9@CO1PR08MB7016.namprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 11 Nov 2021 09:52:55 -0500
Message-ID: <CADkTA4NLB7k+oF0K1YeXuGchi8UJHsHQtEdmKvvZcN1jNxoQnA@mail.gmail.com>
Subject: Re: [meta-virtualization] Building xen-image-minimal for RPi4 Compute Module
To: Patrick Godwin <pbg.dev@outlook.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the slow reply,

On Fri, Nov 5, 2021 at 11:45 PM Patrick Godwin <pbg.dev@outlook.com> wrote:
>
> I'm in the process of building xen-image-minimal for my Raspberry Pi 4 Co=
mpute Module and am hitting some issues when running the image on physical =
hardware. Upon inspecting the boot partition of the sd-card, I noticed that=
 the image only contained the dtb for the Raspberry Pi 4B; this makes sense=
 when I look at xen-raspberrypi4-64.inc:
>

Not sure if you've sorted this out yet.

We do have reference images that booted on the RPI, but I can't say that I'=
ve
been testing them myself. I'm hoping that my reply will catch the attention=
 of
those that do have the h/w and they can comment in more detail.

>     # Override the meta-raspberrypi default kernel preference
>     PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
>     KERNEL_DEVICETREE ?=3D "broadcom/bcm2711-rpi-4-b.dtb"
>
> Compared with the device tree blobs declared in meta-raspberrypi's raspbe=
rrypi4-64.conf:
>
>     RPI_KERNEL_DEVICETREE =3D " \
>         broadcom/bcm2711-rpi-4-b.dtb \
>         broadcom/bcm2711-rpi-400.dtb \
>         broadcom/bcm2711-rpi-cm4.dtb \
>     "
>
> Looking into it further, it seems that the device tree listing in the ker=
nel used in the xen-image-minimal build doesn't contain the newer firmware =
blobs contained in meta-raspberrypi, which causes devices like ethernet to =
fail to start up when the image finally boots.
>

There's a different level of support on the h/w between linux-yocto and the
'vendor' rpi tree. We use linux-yocto for the core enablement because the
branches are stable/not rebased and have a cadence we can predict (all
mentioned things are breakages we've hit before!).

That being said, you can change the kernel provider to the linux-rpi, and
the rest of the meta-virt settings, etc, are still applicable and should wo=
rk.

> I've tried adding the bcm2711-rpi-cm4 firmware blob to the SD card manual=
ly, but that causes u-boot to fail with the error "Bad Linux ARM64 Image Ma=
gic!" after the Boot Xen step in output. I also tried manually replacing th=
e bootfiles written by the xen sd card image with the latest blobs from met=
a-raspberrypi's packages, but once the OS boots I find that xen is no longe=
r running, making me suspect I screwed up the configuration somewhere.
>

It could be a kernel configuration issue between the two images, if
the Xen packages are on the image, but nothing is running. Can you
interact with the Xen support via the xen cli at all ? Just to get a
better error message ?

> Is this something I can trivially fix? Is there a way for me to override =
the device tree selection used by the minimal xen image in my local.conf? O=
r do I need to investigate patching one of the meta-virtualization recipes?

Anything that needs changing, should be overridable via variable or
through bbappends, so hopefully no patching is required.

Bruce

>
> (Apologies if I've used any of the wrong lingo/terms here; still new to R=
asPi/Yocto/Xen :D)
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
