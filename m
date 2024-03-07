Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689A9C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 14:18:40 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.24275.1709821119688693082
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Mar 2024 06:18:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PSQ+EkLZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5e4b775e1d6so686558a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Mar 2024 06:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709821119; x=1710425919; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTmToxzLc1zu0l3Oo0XsmU6J4U7ymkCRW1NQkJgJnLY=;
        b=PSQ+EkLZvWaFPaV6eRAvxxg07WOgGXBHX/mSTzhSe6R8nz6rXbeAiCZoj6clAg87Wa
         TxSjGeWz99NsFOvko8RH1GC0Ht3yxpmKX6/Z9ovW1DZJzVDfF9ZUxSw+DWyUvbkK2GZ9
         mZg0QU7zJ9vGyk0D2aY96VmzqiWV3Te21h53P/YMXqxWRPs+yE3yf2Kn4DZwkDnIGMwp
         lrrubaQ+prIw9WdSaw4UIhAxP6pKmbsHw3bM1gEmRBQRH0NXHiM1xGvWGDLAFMJC1oWl
         HuQYxYiM0qdDHfgLiGiq4mL8Sd7gsid5vQtIggPev0H+Stm2Fohq6E1UJ11HJWtalpdy
         iHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821119; x=1710425919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTmToxzLc1zu0l3Oo0XsmU6J4U7ymkCRW1NQkJgJnLY=;
        b=tFtz3dsApjsrsg6KTsos7faSjEdJ77WxG9Nis5RnFdiuKFos2jZR+iV8uSzT2xUP2y
         SHZLdTOTwhHZ841pbp5HfxnjSeW3a1uapkAAchaPd9XQRQkoZ7v4AFygMEdYxL0woxJ4
         Z2qJXmlZytjhvsgMbEkG6Ufn5Z5zebfdxVwqj6Zs6gMhNT3GYPiRW7/ZVma+8j26tlpK
         wQD7tQRZF+07dw/To6rylemVIzEh3xtPsZfClo7ODbfQXFc0cTOqs/cz91De8JuUnACM
         sPma0kvRhzqtTRTvPeuuHMC/kGUojg1+bTakF3SdDpOjMVE6ekKAt6EdXa0sgDR0246x
         URCQ==
X-Gm-Message-State: AOJu0YyCWxs247LqireV1FGszoReKfCHDket5ZQWF9u1Mrf8OmW0fllk
	J1MtsTVTi5+cDVCq3dSuFtSf/pPlGzKWK0QOxyeevotlP9CZzUVjJJ1087zlarzdBCTQGBn95p/
	0H7xUCENw10fzBbt40qpjGyRtcqs=
X-Google-Smtp-Source: AGHT+IF8kogdHGCdUlMwxyON6FyS2mBQMmAlFM+WX5HYlTAEq0NipGMezZ9buXHNif4ujJWqslrc91XN7Pa3efWgIPI=
X-Received: by 2002:a17:90a:4a08:b0:29b:43e1:7a2c with SMTP id
 e8-20020a17090a4a0800b0029b43e17a2cmr2327145pjh.16.1709821118881; Thu, 07 Mar
 2024 06:18:38 -0800 (PST)
MIME-Version: 1.0
References: <20240306023958.3779337-1-xiangyu.chen@eng.windriver.com>
 <CADkTA4PtcSfQhx3hUSVVCwnxiT+HBogVfUaiY+GH++vCop6fMA@mail.gmail.com> <cb140940-68fd-463c-aa73-2c77a758ef65@eng.windriver.com>
In-Reply-To: <cb140940-68fd-463c-aa73-2c77a758ef65@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 7 Mar 2024 09:18:27 -0500
Message-ID: <CADkTA4OZYw1zX-nSnsyn98zOQiOQSd=yDZcAb2et_6PGkSfM8g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] kernel/cfg: add CONFIG_CGROUP_BPF to
 docker config
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Mar 2024 14:18:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8609

On Thu, Mar 7, 2024 at 1:20=E2=80=AFAM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
>
> On 3/7/24 04:22, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Tue, Mar 5, 2024 at 9:00=E2=80=AFPM Xiangyu Chen
> > <xiangyu.chen@eng.windriver.com> wrote:
> >> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>
> >> Add CONFIG_CGROUP_BPF to ensure docker can be started under cgroup v2,
> >> otherwise it would report the following error:
> >>
> >>       Error: for ... error setting cgroup config for procHooks process=
:
> >>       bpf_prog_query(BPF_CGROUP_DEVICE) failed: invalid argument: unkn=
own
> >>
> >> Cgroup v2 device controller has no interface files and is implemented =
on top
> >> of cgroup BPF. To control access to device files, a user may create bp=
f programs
> >> of type BPF_PROG_TYPE_CGROUP_DEVICE and attach them to cgroups with
> >> BPF_CGROUP_DEVICE flag.
> > related to this, check out my latest push to master-next. I've not take=
n tweaks
> > to the fragments in meta-virt lately, as I really want to get rid of
> > the duplicate
> > fragments between the main kernel-cache and the layer.
> >
> > So I finally took the time to do the sync and removal in meta-virt.
> >
> > See what you get when building against meta-virt with that change, and
> > then we can do this same change in the kernel-cache and bump the
> > yocto-cfg-fragments SRCREV in meta-virt.
>
> Hi Bruce,
>
>
> I have synced the meta-virt on master-next branch, tested with the
> docker package.
>
> No error happens during building and running(with cgroup1).
>
> For cgroup2, docker needs CONFIG_CGROUP_BPF option, it has already
> exists in features/bpf/bpf.cfg, but we might not
>
> need to turn on all BPF features, so can we move CONFIG_CGROUP_BPF to
> feature features/cgroup/cgroup.cfg or duplicate it
>
> in to cfg/docker.cfg?

This is exactly the feedback I was looking for! Thanks for running the test=
s.

I agree that we don't want all those BPF options on every time that docker
support is required.

I'd suggest that duplicating it in the docker.cfg is the right thing to do.

If you want to send a patch for that to the kernel-cache, I'll merge it and
bump the SRCREVs.

If nothing breaks in the next three weeks of testing of that change, I inte=
nd
to go to the single source of fragments for the LTS release. If something
does break, I'll make sure to get the options into the fragments in the lay=
er.

Bruce

>
>
> Thanks
>
>
> Br,
>
> Xiangyu
>
> >
> > Bruce
> >
> >> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> >> ---
> >>   recipes-kernel/linux/linux-yocto/docker.cfg | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/recipes-kernel/linux/linux-yocto/docker.cfg b/recipes-ker=
nel/linux/linux-yocto/docker.cfg
> >> index eeeaa242..4d8d7e04 100644
> >> --- a/recipes-kernel/linux/linux-yocto/docker.cfg
> >> +++ b/recipes-kernel/linux/linux-yocto/docker.cfg
> >> @@ -11,3 +11,5 @@ CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
> >>   CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
> >>
> >>   CONFIG_OVERLAY_FS=3Dy
> >> +
> >> +CONFIG_CGROUP_BPF=3Dy
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8608): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8608
> Mute This Topic: https://lists.yoctoproject.org/mt/104758931/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

