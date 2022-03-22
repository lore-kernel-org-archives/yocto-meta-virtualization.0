Return-Path: <pauloasherring@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA98C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 12:39:08 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.9325.1647952747576883665
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 05:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HvU5I5T6;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: pauloasherring@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id e16so15354880lfc.13
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 05:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ADrVorfzl0PfGz6UAC5jWz3Oexfdz0JxZG/TEGX5ffQ=;
        b=HvU5I5T6UIiPT92cS8s+fNebC6MDURxjB4B0ka9TEkLHdK1RNuSLMYlzRRgqxBcoQp
         d/r4WYdH82M2fcPBZKPPmXajVrZI8kWluROoDTyX+GvokNqt8wQX+8afUIHl1JdCuGjF
         CQqW+jgXmTv3JDF/qdmG4D6lLc+VknlhTKqZzAONOBvoV+iHnPY6FHjRFJIfETMtzo6e
         nrwLyiiWAmpIjnWv7+ANLHj/0W8mgYJXbel/3B4Xh9Rhunfx4iJAy6h755hiI7CO94Iv
         EIoE80sG0uVb+gpltW0JzI2D8lVr/kfLEAX2QNsLtlkwsC9Ayf9gQDyw537h3eIL9KrS
         6Uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ADrVorfzl0PfGz6UAC5jWz3Oexfdz0JxZG/TEGX5ffQ=;
        b=nlN71JzVTetmlzTSlP1FIi0nl82eK69UCfjI1AlxC/tndDQ8U7WNsPAFbuNhV7VgMW
         UvmA3IJxSFhpSOO1VZyWG6P5CeA27t3471DxohLWZrIlxWwSb4XGGDKgV6Wcr0qhTory
         yAwmVkOQdFjvGM0oKihG0TjP7Chk76ZDCU29bSj0i4IY+iWbt0bUydKe1g1mKgtYNTfy
         4/szvYdP2bWbS1yymxvYF6DXUn7H2GLrhuVFE8ktIjVDO3b66BeSij/MEU7JEFYv0BIb
         8/I1nSdaNQRnFC0+bbahMsPKr/scNVAklmzgLC7JKX3owAd49L6LJkcP6QsXFw88lY/l
         2qDA==
X-Gm-Message-State: AOAM533BcCUyUwHh0CNDxfQrR9HHso7HC+ocloDcr7kzKjm6EUgLeH01
	+3t6MaQ1VsKeKEo71ugO9F7gAEJoJu51aDlFXhM=
X-Google-Smtp-Source: 
 ABdhPJzGeSwrPWQw69nAy9k4F8iP2dpZ83L2Ru0mQBpV1sRC0Yu1X8RYaX+1fn9zs1hYA09zCHIgRb1hV2F0elMkJKA=
X-Received: by 2002:a05:6512:2243:b0:448:6830:ee82 with SMTP id
 i3-20020a056512224300b004486830ee82mr17556099lfu.262.1647952745660; Tue, 22
 Mar 2022 05:39:05 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
 <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
 <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
In-Reply-To: <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
From: Paulo Sherring <pauloasherring@gmail.com>
Date: Tue, 22 Mar 2022 12:38:54 +0000
Message-ID: 
 <CAG9RwPL2adysD-Wyu7eN2jmo85b-Ufx6TWoSe82dJ-XQRr02EQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Mar 2022 12:39:08 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7098

Hello Bertrand,

On Tue, Mar 22, 2022 at 12:28 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Paulo,
>
> Please always keep the mailing list in as me asking the questions does not mean I will necessarily be the one working on this.
>
Oops, my mistake, sorry.

> Please see some questions here after.
>
> > On 22 Mar 2022, at 12:03, Paulo Sherring <pauloasherring@gmail.com> wrote:
> >
> > Hello Bertrand,
> >
> > On Tue, Mar 22, 2022 at 10:44 AM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Paulo,
> >>
> >>> On 22 Mar 2022, at 11:33, Paulo Sherring via lists.yoctoproject.org <pauloasherring=gmail.com@lists.yoctoproject.org> wrote:
> >>>
> >>> Hello all,
> >>> I am a bit new to meta-virtualization and to the Xen project And to
> >>> virtualizations, so please bear with me :)
> >>> I've been trying to make use of the xen project, currently targeting
> >>> qemu (and later on, rpi4). After messing around, I was able to boot
> >>> dom0 and a domU.
> >>> But, I had to add the xen-gntdev to the `modules-load.d,` because
> >>> `xenstored` was failing to start, due to some missing connection,
> >>> probably brought up by xen-gntdev module.
> >>>
> >>> As I am new to all this, I was just wondering if this is by design, or
> >>> this is an issue (and therefore, I should/could submit a patch).
> >>
> >> No problem at all and thanks a lot for the feedback.
> >> This should not happen and should be fixed.
> >>
> >> Could you tell us what you are building (which image) and what parameters did you set in your local.conf ?
> >>
> >
> > - Baseline is hardknott.
>
> Any reason not to use honester ?
>
The main reason was that hardknott is tagged as a stable release and
it already includes xen 4.14 or latest (it is actually pulling 4.16),
which I wanted/will need for RPi4 support.

> The rest of the configuration sounds about right.
> I will check why gntdev is not in.
>
> > - Target image is xen-minimal-image (for the host)
> > - On local.conf, I have
> >
> > require xen-host.conf
> > and the contents of such file is https://paste.debian.net/1235220/
> >
> > (Also below, just in case the link expires:)
> >
> > Thanks for the prompt answer.
> > Kind regards, Paulo.
> >
> > ## Machine Definitions:
> > MACHINE = "qemuarm64"
> >
> > ## Generate ext4 rootfs for manual handling:
> > IMAGE_FSTYPES:append = " ext4"
> >
> > ## Virtualization:
> > DISTRO_FEATURES:append = " virtualization xen"
> > IMAGE_INSTALL:append = " xen xen-tools"
> >
> > ## Kernel stuff:
> > IMAGE_INSTALL:append = " kernel-modules"
> >
> > # Extra Packages:
> > EXTRA_IMAGE_FEATURES = "debug-tweaks"
> > EXTRA_IMAGE_FEATURES:append = " tools-sdk"
> > EXTRA_IMAGE_FEATURES:append = " tools-debug"
> > EXTRA_IMAGE_FEATURES:append = " eclipse-debug"
> > IMAGE_INSTALL:append = " nano findutils tree openssh"
> >
> >
> > ## Wayland stuff
> > DISTRO_FEATURES:remove = " x11"
> > DISTRO_FEATURES:append = " opengl wayland pam"
> >
> > ## Systemd stuff
> > DISTRO_FEATURES:append = " systemd pam "
> > VIRTUAL-RUNTIME_init_manager = "systemd"
> > DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
> > VIRTUAL-RUNTIME_initscripts = " systemd-compat-units"
> >
> > ## Connman:
> > IMAGE_INSTALL:append = " connman \
> >    connman-client \
> >    connman-static-ip \
> >    "
> >
> > EXTRA_IMAGEDEPENDS += "u-boot"
> > UBOOT_ELF = "u-boot"
> >
> >
> > IMAGE_INSTALL:append = " lvm2 bridge-utils"
> >
> > ## Extra space for fitting VMs:
> > IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
> >
> >
>
> Cheers
> Bertrand
>
Thanks and kind regards, Paulo.

