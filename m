Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E26C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 13:30:55 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web08.31804.1652103049969640125
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 06:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jlSgHCqY;
 spf=pass (domain: gmail.com, ip: 209.85.128.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-2f7bb893309so144117907b3.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 06:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Gwy/Bg+hnVxM1rfRiejdT6wvPy1Ln35D/yfvl3SulN8=;
        b=jlSgHCqYh1Xyum1y0kMggaupLmd1pX8wC3IWO7pdG8jZJDxy1JJwvsxf9yqXYrYpo+
         8gPszrNGsO4LBGnNNKhMA1d57w+yZA/3+PXxmFgSbAXvIiuUYDnBhz9EK92oQT2cSCAx
         hcsU2FpeK4EYOL2dhJkP9RLsExVRMCBlrQ4WIEAaEwRaWwOTjA5GpgZgy/Sas4yj6Efq
         rLtE3gf4WWpAR+VZiW7IzsolKDPD63WLUiUMdpOWgvUPvoGsIwdByJkhg86WgBRzrlRR
         SnmSw0P5WPNZZi4sSp8xdz7W6baV5AZ7TzwH7SWb5OWxGGJocuemI7ydU2+u6RbcGhfF
         8+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Gwy/Bg+hnVxM1rfRiejdT6wvPy1Ln35D/yfvl3SulN8=;
        b=SvyBlMisreFCbdyndmilrx10JzEEfKZT1DiZ8DGDrEQiinEJyvxqCa/SfTBKVP3sRj
         zTOrs3QXByCRHP17NuG/3z5/Erthu4vIXcygWxLaQxZ6lrYZmoVKOL1+76IHA5tsXYZw
         +zf6umNKydyHFvHSsIxOqLN7Nyd9dIPt0w/UqyssV7ndvr61QE0hjUbUiDNU8pe2fgIy
         i5+MVJzxvNVos35RkaYqWO+PN3YyDcq3AspydCFDgwLOlRdu8plWR+I0BqpkVadKRq+m
         jYTYEixilD2Eg/fRZl6JXgCZMdjleL/Hn5oZkuxGrgv5LxUktXIVexdIa26Sm//X1Jcb
         +EVQ==
X-Gm-Message-State: AOAM531fHvW6PCUlfBaGP+KnI+nwQM9+7fZHR5W5nBFCcN08Ebo3HALE
	Ah5pEfvk9iGlWpqpA6ayDRs6K/I57gPmeggTw2U=
X-Google-Smtp-Source: 
 ABdhPJwVXD1+kBO4gPZkRKMoqFyu0y928XjOKz++BEuRJdMZOUD1d+n4zX1E0VRm24TCasR11a+Xmmv2II5k6MQyJ6k=
X-Received: by 2002:a81:1414:0:b0:2f7:d855:1568 with SMTP id
 20-20020a811414000000b002f7d8551568mr14465895ywu.323.1652103049106; Mon, 09
 May 2022 06:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <CADkTA4OBc-C3UXRrjHkWHNYpNi7ZxX8RpiODOdoQCXdf4a7AMg@mail.gmail.com>
 <6C681FA0-E19C-4499-95DD-A0FE0B7B4EF7@arm.com>
In-Reply-To: <6C681FA0-E19C-4499-95DD-A0FE0B7B4EF7@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 May 2022 09:30:38 -0400
Message-ID: 
 <CADkTA4Pa3C+XdESD0Ynxv-8RnaWfeQMTNU7iUymNsE002Z6BoQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 0/3] Xen: improve Qemu integration
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	Doug Goldstein <cardoe@cardoe.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
	Scott Davis <scott.davis@starlab.io>, Diego Sueiro <Diego.Sueiro@arm.com>,
	Jon Mason <jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 13:30:55 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7257

On Mon, May 9, 2022 at 9:01 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Bruce,
>
> > On 9 May 2022, at 13:47, Bruce Ashfield via lists.yoctoproject.org <bru=
ce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Wed, Apr 27, 2022 at 8:06 PM Christopher Clark
> > <christopher.w.clark@gmail.com> wrote:
> >>
> >> A series of improvements to Qemu integration with the Xen recipes:
> >>
> >> - update the Qemu package dependency for the x86 Xen tools
> >> - add support for testing Arm 32-bit images with Qemu and testimage
> >> - configure a standard Xen bridged network xenbr0 for Xen images in qe=
mu
> >> to improve support for configuring guest virtual machine networking
> >>
> >> v2 coalesces these patches into a series and addresses feedback on v1
> >
> > I've gone ahead and merged all three patches of the v2 series.
> >
> > As for the qemuarm boot (with uboot or not), we can address that in
> > follow up patches, since I see that Betrand did send what he's been
> > using to the list. And I'm interested to hear if that also works for
> > Christopher.
>
> My review on the second patches was mentioning that it does not work on m=
y side so why merging that one ?
>

It worked here, and obviously it works for Christopher. So at that
point, I wouldn't hold it out of the tree.

Bruce

> I will try to test this to check if init issues are solved and come back =
to you
>
> Cheers
> Bertrand
>
>
> >
> > Bruce
> >
> >
> >>
> >> Christopher Clark (3):
> >> xen, xen-tools: add recommendation for Qemu for non-hvm x86
> >> qemuboot, xen-image-minimal: enable runqemu for qemuarm Xen images
> >> xen images, qemuboot: configure xenbr0 bridge for runqemu, testimage
> >>
> >> classes/qemuboot-testimage-network.bbclass | 36 +++++-
> >> classes/qemuboot-xen-defaults.bbclass | 26 +++-
> >> classes/qemuboot-xen-u-boot.bbclass | 128 +++++++++++++++++++
> >> conf/distro/include/meta-virt-xen.inc | 1 +
> >> recipes-extended/images/xen-image-minimal.bb | 8 +-
> >> recipes-extended/xen/xen-tools.inc | 9 +-
> >> recipes-extended/xen/xen.inc | 6 +-
> >> 7 files changed, 197 insertions(+), 17 deletions(-)
> >> create mode 100644 classes/qemuboot-xen-u-boot.bbclass
> >>
> >> --
> >> 2.25.1
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7255): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/7255
> > Mute This Topic: https://lists.yoctoproject.org/mt/90743681/3619089
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bertrand.marquis@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

