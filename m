Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120D0C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 15:54:07 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web12.46.1652111638090849815
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 08:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fh8txQ8y;
 spf=pass (domain: gmail.com, ip: 209.85.128.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2f83983782fso149780897b3.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 08:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=N8/n2uZxITX1OufQO+YHIHWTulv2WstmO+23givVVmw=;
        b=Fh8txQ8yoOAiNFN7ujHDdcG6aGN2E69VfMB45QgipsgOsif9fwGsSB+ZMIT7ReF/6V
         HLO10LJhJ9s4EQcN83oTXkUmenZTOSdGB3RgZN2cnXTRcvl+Skyl7RXdKE9vUFOVX4hu
         7FUMmklvcPsDk5ouIQgE3Qzdem9ATpL88OgUXs6GxqOFU0NQwopLqAy2teIt8XCvJJi0
         urZ3uYdc79lFHsxnBtBrOsfctFEqAlITz1n2wTLXKmeNDwYnRMSDcJFom5CKdoZY4n2j
         1ZpYyRIKAH7vEONbxMf9Vw3Sp2jXKWzwaf267d0woynHAyaliF5uMF4SdFKD/RF1UXA5
         vD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=N8/n2uZxITX1OufQO+YHIHWTulv2WstmO+23givVVmw=;
        b=ZM8z5YPCyhhUL1fhiQDa2CkLojJzyNJrGFZjP5+ttJdI6EEyaVkTdGZEs4iEzdWglf
         Zna/hi0BKcqTV0CfVFMVmuxloN0Z41PeC2NZSI//M6wbkUWsHXPdvwGh0M9WeEn7oQ7o
         vUDWOqyBzoXm8SB2U533TyHb/gzRsXBBIWXORzBT+Sgoz6Dtero7kLC9eA5H9ZY6/wbl
         5qOY3lXHnovSiml6kzpU/3RnawdAw1JPBwqjjV9F0EaRLHCekT5aOXgkF6dLKrogtAi/
         EbAZIHRU0Y0e6qyzWC1RNMh+Q7BuPJ8z7xdNLHw8vCExGsR8BLkgxSdrktv604TRrR2c
         HrOA==
X-Gm-Message-State: AOAM532cZldYGT97fj8UKxy/xGl6uWFba16WftTGBEmhvMFjp1HvW0/z
	2cB6gC0mCABXMqvE6g7587FE00jiiIRxsUipPVg=
X-Google-Smtp-Source: 
 ABdhPJyJueK8rWNfvrf0WE89NXc9Lg4th8M/E1pZ5KjwIoArxEmkxR7vhk4YOqE+Uk2GLPd6P+PdzMbI+HZZObg/Orw=
X-Received: by 2002:a81:1414:0:b0:2f7:d855:1568 with SMTP id
 20-20020a811414000000b002f7d8551568mr15102441ywu.323.1652111637237; Mon, 09
 May 2022 08:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <CADkTA4OBc-C3UXRrjHkWHNYpNi7ZxX8RpiODOdoQCXdf4a7AMg@mail.gmail.com>
 <6C681FA0-E19C-4499-95DD-A0FE0B7B4EF7@arm.com>
 <CADkTA4Pa3C+XdESD0Ynxv-8RnaWfeQMTNU7iUymNsE002Z6BoQ@mail.gmail.com>
 <0EE9D5E6-5FE9-4E32-8D04-B552236E31DE@arm.com>
In-Reply-To: <0EE9D5E6-5FE9-4E32-8D04-B552236E31DE@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 May 2022 11:53:46 -0400
Message-ID: 
 <CADkTA4OR779FnG=F06qEzqZ7v0KVUs7iyHCTziuXU9Z6EKnR-g@mail.gmail.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 15:54:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7260

On Mon, May 9, 2022 at 9:58 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
>
>
> > On 9 May 2022, at 14:30, Bruce Ashfield via lists.yoctoproject.org <bru=
ce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Mon, May 9, 2022 at 9:01 AM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Bruce,
> >>
> >>> On 9 May 2022, at 13:47, Bruce Ashfield via lists.yoctoproject.org <b=
ruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>>
> >>> On Wed, Apr 27, 2022 at 8:06 PM Christopher Clark
> >>> <christopher.w.clark@gmail.com> wrote:
> >>>>
> >>>> A series of improvements to Qemu integration with the Xen recipes:
> >>>>
> >>>> - update the Qemu package dependency for the x86 Xen tools
> >>>> - add support for testing Arm 32-bit images with Qemu and testimage
> >>>> - configure a standard Xen bridged network xenbr0 for Xen images in =
qemu
> >>>> to improve support for configuring guest virtual machine networking
> >>>>
> >>>> v2 coalesces these patches into a series and addresses feedback on v=
1
> >>>
> >>> I've gone ahead and merged all three patches of the v2 series.
> >>>
> >>> As for the qemuarm boot (with uboot or not), we can address that in
> >>> follow up patches, since I see that Betrand did send what he's been
> >>> using to the list. And I'm interested to hear if that also works for
> >>> Christopher.
> >>
> >> My review on the second patches was mentioning that it does not work o=
n my side so why merging that one ?
> >>
> >
> > It worked here, and obviously it works for Christopher. So at that
> > point, I wouldn't hold it out of the tree.
>
> Could you at least explain me what I did wrong.
>
> As said qemu is blocked waiting for a dhcp/tftp to answer in uboot.
> Why do you guys have something starting a tftp server and I do not ?
> Is it something that might happen to somebody else ?

I used a setup that I have for kubernetes testing that does have a
bootp/dhcp server available, so that could be the difference. But it
is best to get Christopher's setup, as that is the reference he's
using in his maintainer cycles.

Note: I only merged this to master, not kirkstone.  But without this
patch only patch 1/3 from Christopher went to kirkstone, so there is
possibly more work required there as well.

So we can debug the setup in master, and not worry about it hurting
the release, but if we don't get an answer from Christopher, or
otherwise get it working in the next few days, I'll revert in master
as well.

I didn't see any replies to your qemuarm patch, but I'm doing a rebase
to master, and will test to see if it can co-exist or just be the
default behaviour.

Bruce


Bruce


>
> Cheers
> Bertrand
>
> >
> > Bruce
> >
> >> I will try to test this to check if init issues are solved and come ba=
ck to you
> >>
> >> Cheers
> >> Bertrand
> >>
> >>
> >>>
> >>> Bruce
> >>>
> >>>
> >>>>
> >>>> Christopher Clark (3):
> >>>> xen, xen-tools: add recommendation for Qemu for non-hvm x86
> >>>> qemuboot, xen-image-minimal: enable runqemu for qemuarm Xen images
> >>>> xen images, qemuboot: configure xenbr0 bridge for runqemu, testimage
> >>>>
> >>>> classes/qemuboot-testimage-network.bbclass | 36 +++++-
> >>>> classes/qemuboot-xen-defaults.bbclass | 26 +++-
> >>>> classes/qemuboot-xen-u-boot.bbclass | 128 +++++++++++++++++++
> >>>> conf/distro/include/meta-virt-xen.inc | 1 +
> >>>> recipes-extended/images/xen-image-minimal.bb | 8 +-
> >>>> recipes-extended/xen/xen-tools.inc | 9 +-
> >>>> recipes-extended/xen/xen.inc | 6 +-
> >>>> 7 files changed, 197 insertions(+), 17 deletions(-)
> >>>> create mode 100644 classes/qemuboot-xen-u-boot.bbclass
> >>>>
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
> >>>
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
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7257): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/7257
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



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

