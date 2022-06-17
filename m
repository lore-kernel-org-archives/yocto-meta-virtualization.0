Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083B9C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 14:34:11 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web10.31101.1655476436125171909
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jun 2022 07:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CJwMNy+5;
 spf=pass (domain: gmail.com, ip: 209.85.221.169,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id n203so2075724vke.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jun 2022 07:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l4enDQQLJvTTxj0JGRs40HtWHijhteS04N4ruqg+mUE=;
        b=CJwMNy+5YZY5+FSthqqtft1yY+83F0jIBlUBJZeKi0Ny84smLmFJ/4ATGsV/kUsn5G
         LvZLKfSjqfL6IqPm10XPvilk1/mEm0Lc3Bw5GLP4b0mmuzlNd96L9cBh2mKwo/skPtM5
         vYPfpucIuscPARyl7s7wRAF0qBTiykrxtsuJ9/alY82O/QuzpCS6w9uVOSKl4HXxvGsb
         FwzSQCi7541lFCkaosXqdJP4aso82knCKEAMWA5TjOUSH8mFVrEy3gaz7zQYxQgvTqdz
         d0kXzbp5yUE5HCncxlX/KPDZgWL5k1cv2i2BCcAOkFawC15uhHgcV8OdYInCcpH1u8Xk
         OINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l4enDQQLJvTTxj0JGRs40HtWHijhteS04N4ruqg+mUE=;
        b=5t04dqfwBDH76aWShlTvlI2sQqWc++mPyZCpAnbHEyodRe3s6H2l4G6FG8ETvVHbe9
         ihCQ2j5WOFMtl4PS+eI8sIzCZDxyOkaT3LAnXoSo56YicwODFjKECadMzqiw3+Z1K7x4
         wjkK+nLrgoNwnDfQC3N74ETdyjYfLSG6X6UxZEarLoLnFKvx7TBACpPwmDoeQzoOz8Ra
         IoqKY0OT0E05Temqrg77hPtiH6s5eeOY3kxXbyQrhJ7Hs+yaL0PaS/O+JduqKV9vOxSq
         jVYrahH3jY1WGdZcQv0HPZ2+h9wsTR4aoyJgeFEOkV7exX6RhsjViGf3R3i4Sz4i7Bpw
         AJ+Q==
X-Gm-Message-State: AJIora8xT5+hl5Mn94VWlBWsTdsOmJPAwbrD2lYd231ecYbEEXkR4uSB
	s5rCaeb3AzBeCuM7rBkd05SJ/1V3VfUP/kH9GeM=
X-Google-Smtp-Source: 
 AGRyM1vTuqdVsBksM6BY7mKUQve76TcUVN+RVYzHl9+VF+NNs3CJGossHyPUfbJKAz+/et8s4+L+G3rN9zRdWBrLcq0=
X-Received: by 2002:a1f:20d4:0:b0:365:15b8:25e7 with SMTP id
 g203-20020a1f20d4000000b0036515b825e7mr4666555vkg.1.1655476435253; Fri, 17
 Jun 2022 07:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220609095748.176486-1-michal.orzel@arm.com>
 <20220609095748.176486-3-michal.orzel@arm.com>
 <63C89F72-E463-4C2B-8026-B959173F5754@arm.com>
In-Reply-To: <63C89F72-E463-4C2B-8026-B959173F5754@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 17 Jun 2022 07:33:44 -0700
Message-ID: 
 <CACMJ4Gb7hDRnm3w3GRexD3R6ubjo3zrTYnPpAm-_vR_XBUotGw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] xen: Disable highmem on qemuarm
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Michal Orzel <Michal.Orzel@arm.com>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jun 2022 14:34:11 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7388

On Thu, Jun 9, 2022 at 3:01 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Michal,
>
> > On 9 Jun 2022, at 10:57, Michal Orzel via lists.yoctoproject.org <michal.orzel=arm.com@lists.yoctoproject.org> wrote:
> >
> > By default, highmem option is enabled for machine types later than
> > virt-2.12. This allows qemu to place devices and RAM in physical
> > address space above 32-bits. This can cause issues as according to the
> > documentation Xen supports up to 12GiB of physical address space.
> > Recently the issue was observed using runqemu, that was causing Linux
> > running on top of Xen to stall when trying to access ECAM space placed
> > by qemu at 256GiB mark. Even though this issue is most probably related
> > to QEMU and not Xen (the investigation showed that it can map ECAM
> > space correctly), it is best to avoid such issues by disabling highmem
> > on qemuarm.
> >
> > Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

>
> Also tested on kirkstone and dom0 boots fine and pci is working.

Thanks,

Christopher

>
> Thanks a lot
> Cheers
> Bertrand
>
> > ---
> > classes/qemuboot-xen-defaults.bbclass | 6 ++++--
> > 1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen-defaults.bbclass
> > index f1550cc..460cbe6 100644
> > --- a/classes/qemuboot-xen-defaults.bbclass
> > +++ b/classes/qemuboot-xen-defaults.bbclass
> > @@ -23,8 +23,10 @@ QB_DEFAULT_KERNEL:qemuarm = "xen-${MACHINE}"
> >
> > # 64-bit Arm: gic version 3
> > QB_MACHINE:qemuarm64 = "-machine virt,gic-version=3 -machine virtualization=true"
> > -# 32-bit Arm
> > -QB_MACHINE:qemuarm = "-machine virt -machine virtualization=true"
> > +# 32-bit Arm: highmem=off
> > +# Disable highmem so that qemu does not use highmem IO regions that end up
> > +# being placed at the 256GiB mark (e.g. ECAM space) and can cause issues in Xen.
> > +QB_MACHINE:qemuarm = "-machine virt,highmem=off -machine virtualization=true"
> >
> > # Increase the default qemu memory allocation to allow for the hypervisor.
> > # Use a weak assignment to allow for change of default and override elsewhere.
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7352): https://lists.yoctoproject.org/g/meta-virtualization/message/7352
> > Mute This Topic: https://lists.yoctoproject.org/mt/91642064/3619089
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bertrand.marquis@arm.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

