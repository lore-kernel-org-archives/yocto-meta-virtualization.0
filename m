Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB0EC433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 16:45:47 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.43.1652114739658877757
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 09:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MghvxPZQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id r11so26001103ybg.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 09:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k3J+5z4R4jf6z/vze1nr/ZLkiAPxmZAHd+EuNDeyBPo=;
        b=MghvxPZQ8F3KpJ0jb1v4wEjyHlfJVS3mh5ZcZ8l++OVSw4DTRYQnCMfZkQQsPEAAu/
         1TaLH6iKdJuP09E9vosdqRWAgx5EB94p2MxyR4SvHCZr+Amu/Nyjrr8SS7PUXkZAd9Lv
         ch1r1p3euMj/uJZjwer6eOoIay8WK2judwuUhNgbgSNYHxZMh0ssXJ31uIMjgnoToD8n
         9jCQJZF/6wnZunXrOn2t13qWon1he0mJRbKshgAoRteQMUq3GkppESGHliCPCeDSxD/N
         4EKQVSAO3U4nKRt1tQPaVIZiNpHhqqJmVyplVMftBAlYFCJLNhOjkFnU9UPr0Z1zdByM
         W80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k3J+5z4R4jf6z/vze1nr/ZLkiAPxmZAHd+EuNDeyBPo=;
        b=rS529qKDkYeKfwwUFnCok8bsfD+2lkX6OJ/BV2tQ8SiynwzKklxzVmpmhfc6mTZjgf
         YngccSbpcDC1LitlO1clObHTgOZN0IZUROeNYG08LYRw1S4xRrk2xcOBjXi5DgjocZb9
         9LuueHKaHRpOXwKc7JNqXH+ORJGj9vCtGML5TVwidc7cCsz4+6/VpQmJalw6B/PpRpFI
         b9MBzfJpVxS6beBnc0VGjZhgn9Y3JgScU5z/GrqSdu9jyL8YoClV0knku6R0MAnIuUz5
         rm9qhjPHDxNUlBGR1EWjEIaXTGViRX/G9SFwQhNRrkziIl4xqESpmyOKEZhGsn9XE8Hk
         Sqpw==
X-Gm-Message-State: AOAM532q3RZ3bk51/flbD5esdqt24x6WBK6tFcjyrZxAd2guSp9QZkAa
	vA8BulAiJtsxUd/yYw+DxSYU8r0OagOvyyCu6Uk=
X-Google-Smtp-Source: 
 ABdhPJzcjNPQXrGitPjFVm4komRKCBjddea5Cam0/a5Mf+0wKG8jA+jRFzjEPdowUh6luBxDHaY1sLNBsW2/VXa6DSU=
X-Received: by 2002:a25:3795:0:b0:648:fa25:5268 with SMTP id
 e143-20020a253795000000b00648fa255268mr15257066yba.153.1652114738765; Mon, 09
 May 2022 09:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <CADkTA4OBc-C3UXRrjHkWHNYpNi7ZxX8RpiODOdoQCXdf4a7AMg@mail.gmail.com>
 <6C681FA0-E19C-4499-95DD-A0FE0B7B4EF7@arm.com>
 <CADkTA4Pa3C+XdESD0Ynxv-8RnaWfeQMTNU7iUymNsE002Z6BoQ@mail.gmail.com>
 <0EE9D5E6-5FE9-4E32-8D04-B552236E31DE@arm.com>
 <CADkTA4OR779FnG=F06qEzqZ7v0KVUs7iyHCTziuXU9Z6EKnR-g@mail.gmail.com>
 <CB3D7DB1-6D77-4ED3-89F3-B48F8B881F05@arm.com>
In-Reply-To: <CB3D7DB1-6D77-4ED3-89F3-B48F8B881F05@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 May 2022 12:45:27 -0400
Message-ID: 
 <CADkTA4MEGSPYC96GQ7HsHL72SaLa6N9mMU5SPg4XeLRynTS_tA@mail.gmail.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 16:45:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7263

On Mon, May 9, 2022 at 11:57 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Bruce
>
> > On 9 May 2022, at 16:53, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
> >
> > On Mon, May 9, 2022 at 9:58 AM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >>
> >>
> >>> On 9 May 2022, at 14:30, Bruce Ashfield via lists.yoctoproject.org <b=
ruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>>
> >>> On Mon, May 9, 2022 at 9:01 AM Bertrand Marquis
> >>> <Bertrand.Marquis@arm.com> wrote:
> >>>>
> >>>> Hi Bruce,
> >>>>
> >>>>> On 9 May 2022, at 13:47, Bruce Ashfield via lists.yoctoproject.org =
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>>>>
> >>>>> On Wed, Apr 27, 2022 at 8:06 PM Christopher Clark
> >>>>> <christopher.w.clark@gmail.com> wrote:
> >>>>>>
> >>>>>> A series of improvements to Qemu integration with the Xen recipes:
> >>>>>>
> >>>>>> - update the Qemu package dependency for the x86 Xen tools
> >>>>>> - add support for testing Arm 32-bit images with Qemu and testimag=
e
> >>>>>> - configure a standard Xen bridged network xenbr0 for Xen images i=
n qemu
> >>>>>> to improve support for configuring guest virtual machine networkin=
g
> >>>>>>
> >>>>>> v2 coalesces these patches into a series and addresses feedback on=
 v1
> >>>>>
> >>>>> I've gone ahead and merged all three patches of the v2 series.
> >>>>>
> >>>>> As for the qemuarm boot (with uboot or not), we can address that in
> >>>>> follow up patches, since I see that Betrand did send what he's been
> >>>>> using to the list. And I'm interested to hear if that also works fo=
r
> >>>>> Christopher.
> >>>>
> >>>> My review on the second patches was mentioning that it does not work=
 on my side so why merging that one ?
> >>>>
> >>>
> >>> It worked here, and obviously it works for Christopher. So at that
> >>> point, I wouldn't hold it out of the tree.
> >>
> >> Could you at least explain me what I did wrong.
> >>
> >> As said qemu is blocked waiting for a dhcp/tftp to answer in uboot.
> >> Why do you guys have something starting a tftp server and I do not ?
> >> Is it something that might happen to somebody else ?
> >
> > I used a setup that I have for kubernetes testing that does have a
> > bootp/dhcp server available, so that could be the difference. But it
> > is best to get Christopher's setup, as that is the reference he's
> > using in his maintainer cycles.
>
> If there are some external dependencies, this would kind of odd to
> have this as default if we can have something working out of the box.
>
> >
> > Note: I only merged this to master, not kirkstone. But without this
> > patch only patch 1/3 from Christopher went to kirkstone, so there is
> > possibly more work required there as well.
>
> Ok
>
> >
> > So we can debug the setup in master, and not worry about it hurting
> > the release, but if we don't get an answer from Christopher, or
> > otherwise get it working in the next few days, I'll revert in master
> > as well.
>
> I am debugging while kernel log and init log are not seen for dom0.
> Dom0 bootargs are wrong and I am digging to find out why.
>
> >
> > I didn't see any replies to your qemuarm patch, but I'm doing a rebase
> > to master, and will test to see if it can co-exist or just be the
> > default behaviour.
>
> Yep it needs a proper review.

And of course, I just tried a boot on a different builder and it failed.

So I went ahead and reverted the change, and left it as the old status
(which does boot for me).

We can revisit the two approaches from a clean slate.

Bruce

>
> Cheers
> Bertrand
>
> >
> > Bruce
> >
> >
> > Bruce
> >
> >
> >>
> >> Cheers
> >> Bertrand
> >>
> >>>
> >>> Bruce
> >>>
> >>>> I will try to test this to check if init issues are solved and come =
back to you
> >>>>
> >>>> Cheers
> >>>> Bertrand
> >>>>
> >>>>
> >>>>>
> >>>>> Bruce
> >>>>>
> >>>>>
> >>>>>>
> >>>>>> Christopher Clark (3):
> >>>>>> xen, xen-tools: add recommendation for Qemu for non-hvm x86
> >>>>>> qemuboot, xen-image-minimal: enable runqemu for qemuarm Xen images
> >>>>>> xen images, qemuboot: configure xenbr0 bridge for runqemu, testima=
ge
> >>>>>>
> >>>>>> classes/qemuboot-testimage-network.bbclass | 36 +++++-
> >>>>>> classes/qemuboot-xen-defaults.bbclass | 26 +++-
> >>>>>> classes/qemuboot-xen-u-boot.bbclass | 128 +++++++++++++++++++
> >>>>>> conf/distro/include/meta-virt-xen.inc | 1 +
> >>>>>> recipes-extended/images/xen-image-minimal.bb | 8 +-
> >>>>>> recipes-extended/xen/xen-tools.inc | 9 +-
> >>>>>> recipes-extended/xen/xen.inc | 6 +-
> >>>>>> 7 files changed, 197 insertions(+), 17 deletions(-)
> >>>>>> create mode 100644 classes/qemuboot-xen-u-boot.bbclass
> >>>>>>
> >>>>>> --
> >>>>>> 2.25.1
> >>>>>>
> >>>>>
> >>>>>
> >>>>> --
> >>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> >>>>> thee at its end
> >>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>
> >>>>>
> >>>>
> >>>> IMPORTANT NOTICE: The contents of this email and any attachments are=
 confidential and may also be privileged. If you are not the intended recip=
ient, please notify the sender immediately and do not disclose the contents=
 to any other person, use it for any purpose, or store or copy the informat=
ion in any medium. Thank you.
> >>>
> >>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#7257): https://lists.yoctoproject.org/g/meta-virt=
ualization/message/7257
> >>> Mute This Topic: https://lists.yoctoproject.org/mt/90743681/3619089
> >>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/uns=
ub [bertrand.marquis@arm.com]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >> IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
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

