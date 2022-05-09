Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC436C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 15:58:56 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web08.114.1652111928897754900
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 08:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aYfe2b/T;
 spf=pass (domain: gmail.com, ip: 209.85.217.43,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id d22so11590778vsf.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eD4EgFJhlxcjpjrohmo/bv5CuP0JigXj8vqsPPEbPhE=;
        b=aYfe2b/TfX+Nj6sgW5eHAYvkYbPR4pDlmnnDxKPMzrRZfDDIcxk6SOUfwDwnoYJwna
         VHmdoFzPgyiO6GLtMQKfL4v9CuFg1aFNHDUI056NPGw1A0zXpuVGsxlGkT2FE7rX7mfW
         eNnE9EJYqKGBEiEfxdRiWPhYcQZC/ANBvTymjB97u6v346+ejYHkcGXpp6bVwlnPFJCe
         M7ZyzncSchJ+k1jHlKeYFDiPHRXBfxPBox/pQAS9F5b5EBCKKaezOkRYevy5F/xT5YB8
         F8tNlbCIWcyEAYvfdgoALVblonUfiz1assjnkJpWg6XNfwxEauDd3aZWnn3PAyX74A5u
         0rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eD4EgFJhlxcjpjrohmo/bv5CuP0JigXj8vqsPPEbPhE=;
        b=crbsMRMl+qHVLi6igInm2ZUHzmG/8ycZ1K84xEPfOTR0dlxPc/a9hp3dvTivMP20bB
         +3t/2+EvBYhPcpjn9S4RMUw0Hr3ZK5pI0YdwDTsHdzqXefBCOiLyCI7bg4Y0lGxnC/fE
         isQOfjXWwb/KDJvM+Vczw+fPQl0xk7gBA3PAatRzrE1Umat52jpT4uHZOXfQ5gA2REhc
         4sRixuMcN+/3kCrebk75gC5vttS81Sh5n70qsLzudYb1QZ0TGb0KQ1LVGTphkESLHCZQ
         cJ3y9GzicwZCFpI0T2d6D7v4KQtuql1ESUcYOtEjl1Xm+tvc7xPvPxfuXnIntUlBk1Wt
         4whg==
X-Gm-Message-State: AOAM530xtMiUIBKyKE6xy6e45ShHXDINdknexLbJvQdHkF9GRgbqj07P
	4/Cb81Wk+uDyDUUh12cm6Qbubg9qzeGbcgMASSA=
X-Google-Smtp-Source: 
 ABdhPJyEbFTqAl7R1EKDiZ47WO/feJTUdd03ZjxZvzg0xvKJpypE2BdQavZJEdWyr9QgU4GHzIQzaz8WIWAsytavRiw=
X-Received: by 2002:a67:cb0d:0:b0:32c:cb36:9a04 with SMTP id
 b13-20020a67cb0d000000b0032ccb369a04mr8865873vsl.40.1652111927977; Mon, 09
 May 2022 08:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <CADkTA4OBc-C3UXRrjHkWHNYpNi7ZxX8RpiODOdoQCXdf4a7AMg@mail.gmail.com>
 <6C681FA0-E19C-4499-95DD-A0FE0B7B4EF7@arm.com>
 <CADkTA4Pa3C+XdESD0Ynxv-8RnaWfeQMTNU7iUymNsE002Z6BoQ@mail.gmail.com>
 <0EE9D5E6-5FE9-4E32-8D04-B552236E31DE@arm.com>
 <CADkTA4OR779FnG=F06qEzqZ7v0KVUs7iyHCTziuXU9Z6EKnR-g@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OR779FnG=F06qEzqZ7v0KVUs7iyHCTziuXU9Z6EKnR-g@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 9 May 2022 08:58:37 -0700
Message-ID: 
 <CACMJ4GYdrKrip8wP1BL12t6oK9y-dx4O10PT+amw9yRa_c8YiA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 0/3] Xen: improve Qemu integration
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
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
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 15:58:56 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7262

On Mon, May 9, 2022 at 8:53 AM Bruce Ashfield <bruce.ashfield@gmail.com> wr=
ote:
>
> On Mon, May 9, 2022 at 9:58 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
> >
> >
> >
> > > On 9 May 2022, at 14:30, Bruce Ashfield via lists.yoctoproject.org <b=
ruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >
> > > On Mon, May 9, 2022 at 9:01 AM Bertrand Marquis
> > > <Bertrand.Marquis@arm.com> wrote:
> > >>
> > >> Hi Bruce,
> > >>
> > >>> On 9 May 2022, at 13:47, Bruce Ashfield via lists.yoctoproject.org =
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >>>
> > >>> On Wed, Apr 27, 2022 at 8:06 PM Christopher Clark
> > >>> <christopher.w.clark@gmail.com> wrote:
> > >>>>
> > >>>> A series of improvements to Qemu integration with the Xen recipes:
> > >>>>
> > >>>> - update the Qemu package dependency for the x86 Xen tools
> > >>>> - add support for testing Arm 32-bit images with Qemu and testimag=
e
> > >>>> - configure a standard Xen bridged network xenbr0 for Xen images i=
n qemu
> > >>>> to improve support for configuring guest virtual machine networkin=
g
> > >>>>
> > >>>> v2 coalesces these patches into a series and addresses feedback on=
 v1
> > >>>
> > >>> I've gone ahead and merged all three patches of the v2 series.
> > >>>
> > >>> As for the qemuarm boot (with uboot or not), we can address that in
> > >>> follow up patches, since I see that Betrand did send what he's been
> > >>> using to the list. And I'm interested to hear if that also works fo=
r
> > >>> Christopher.
> > >>
> > >> My review on the second patches was mentioning that it does not work=
 on my side so why merging that one ?
> > >>
> > >
> > > It worked here, and obviously it works for Christopher. So at that
> > > point, I wouldn't hold it out of the tree.
> >
> > Could you at least explain me what I did wrong.
> >
> > As said qemu is blocked waiting for a dhcp/tftp to answer in uboot.
> > Why do you guys have something starting a tftp server and I do not ?
> > Is it something that might happen to somebody else ?
>
> I used a setup that I have for kubernetes testing that does have a
> bootp/dhcp server available, so that could be the difference. But it
> is best to get Christopher's setup, as that is the reference he's
> using in his maintainer cycles.
>
> Note: I only merged this to master, not kirkstone.  But without this
> patch only patch 1/3 from Christopher went to kirkstone, so there is
> possibly more work required there as well.
>
> So we can debug the setup in master, and not worry about it hurting
> the release, but if we don't get an answer from Christopher, or
> otherwise get it working in the next few days, I'll revert in master
> as well.
>
> I didn't see any replies to your qemuarm patch, but I'm doing a rebase
> to master, and will test to see if it can co-exist or just be the
> default behaviour.

Hello

Just to let you know that I am following this and making my way
through some testing. I am not sure what is causing the issues that
Bertrand is encountering but I would like to ensure that they are
resolved.

Christopher


>
> Bruce
>
>
> Bruce
>
>
> >
> > Cheers
> > Bertrand
> >
> > >
> > > Bruce
> > >
> > >> I will try to test this to check if init issues are solved and come =
back to you
> > >>
> > >> Cheers
> > >> Bertrand
> > >>
> > >>
> > >>>
> > >>> Bruce
> > >>>
> > >>>
> > >>>>
> > >>>> Christopher Clark (3):
> > >>>> xen, xen-tools: add recommendation for Qemu for non-hvm x86
> > >>>> qemuboot, xen-image-minimal: enable runqemu for qemuarm Xen images
> > >>>> xen images, qemuboot: configure xenbr0 bridge for runqemu, testima=
ge
> > >>>>
> > >>>> classes/qemuboot-testimage-network.bbclass | 36 +++++-
> > >>>> classes/qemuboot-xen-defaults.bbclass | 26 +++-
> > >>>> classes/qemuboot-xen-u-boot.bbclass | 128 +++++++++++++++++++
> > >>>> conf/distro/include/meta-virt-xen.inc | 1 +
> > >>>> recipes-extended/images/xen-image-minimal.bb | 8 +-
> > >>>> recipes-extended/xen/xen-tools.inc | 9 +-
> > >>>> recipes-extended/xen/xen.inc | 6 +-
> > >>>> 7 files changed, 197 insertions(+), 17 deletions(-)
> > >>>> create mode 100644 classes/qemuboot-xen-u-boot.bbclass
> > >>>>
> > >>>> --
> > >>>> 2.25.1
> > >>>>
> > >>>
> > >>>
> > >>> --
> > >>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> > >>> thee at its end
> > >>> - "Use the force Harry" - Gandalf, Star Trek II
> > >>>
> > >>>
> > >>
> > >> IMPORTANT NOTICE: The contents of this email and any attachments are=
 confidential and may also be privileged. If you are not the intended recip=
ient, please notify the sender immediately and do not disclose the contents=
 to any other person, use it for any purpose, or store or copy the informat=
ion in any medium. Thank you.
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#7257): https://lists.yoctoproject.org/g/meta-virt=
ualization/message/7257
> > > Mute This Topic: https://lists.yoctoproject.org/mt/90743681/3619089
> > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/uns=
ub [bertrand.marquis@arm.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

