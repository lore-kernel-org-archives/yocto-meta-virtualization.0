Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8386AC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 00:58:19 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.113.1699318690410618746
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 16:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MhxiHaNq;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7a66b5f7ea7so195297839f.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Nov 2023 16:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699318689; x=1699923489; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEfcNoRyZHwCosn+ioH8VuaPXLrMf2MXAS0FtW83ylk=;
        b=MhxiHaNq6tuyCtNMclCo4A35yxIyAkrdgUf7HbGzR7IEx3JzBuZFT0slXCPmlk3C7l
         L0o+eMcb5HzaKkw23T48hc+ebYgPc9GrSAhB2Bc08/3Ep+ldhxRRG3oKNxE/13nTH1Rz
         JC9Jsrmw+bMox9A2U/H2unTa2jnMMsEC03xnMs66T8UVmHlt2KiMLzNz7RHMW4fy5Qi+
         g7TP9XYRTfJTtcdKTdfLYQj8Y1e9LXlsliLQegx/BECnCsYIIkPKQlOwM4buqKoqknlw
         qSfj1IKQlVSuIVYwWjHU6RgM8e5TUiOG+D8TGhwUECfI/iFbNQis7ruMi18e6klXwh6F
         UQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699318689; x=1699923489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEfcNoRyZHwCosn+ioH8VuaPXLrMf2MXAS0FtW83ylk=;
        b=wyT5ctwlwM8e9rnjBgrBhg8xuAtRKyOlsgIJ8vWvN7HguEcd6hEaB98jlKGOG2J4oZ
         mhg9XsmsmPmdnciS36VJEzi7buyKDOx0df1+tL0feWWf9Ssem0goQ6I2QRASV2UrZyGU
         BHGUtNKCUz8Z4fb5KLohllTEZ3VNvNWq423IQ2W1gNQyyhy1kLjrI++7LAiflxGZGx9v
         Tfy5CQ4soCuHrAVEYexdOG7M9YYBTfGUA9DgQIjdsgGdguyRVARYKs23gzzM6ETu+Rgd
         J8gq//qQG1qNCPEu+8mN/+Du3aH00rlKrIlLi7AmoeMsoFTRDTiKb5NDAK0+nrl0hR4g
         43kQ==
X-Gm-Message-State: AOJu0YzFHDNAk5/xUYx80XZ/EH+BJt2q+GNfFwijk+nkZTAZyUiltMDA
	K7A9OJ/NCjUUcH9isq2w81fXikHEbwHQPNo9k0Y=
X-Google-Smtp-Source: AGHT+IEi/hOlVoELG5vadaVNfQJkhqWp+Rw08O/qrJKbfZHjhkkY1PM9Ddzbow6UjGXOjf2rU9CtoVeLzCpUhxgGTHc=
X-Received: by 2002:a05:6602:1492:b0:7a6:a166:dcac with SMTP id
 a18-20020a056602149200b007a6a166dcacmr36524430iow.20.1699318689481; Mon, 06
 Nov 2023 16:58:09 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4ORrENvzkPYG_1EnDca-BQjhm4L3nj9e+ZfNer4wcd0Yw@mail.gmail.com>
 <20231106092058.1209687-1-alexander.sverdlin@siemens.com> <17950C6F5A95F7ED.26468@lists.yoctoproject.org>
In-Reply-To: <17950C6F5A95F7ED.26468@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Nov 2023 19:57:58 -0500
Message-ID: <CADkTA4P3NK9JQvsOX5729Le=NGLwG7LqGUVxq1KFn90RMMxfXQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH RFC] kernel: allow KERNEL_META_TYPE redefinition
To: bruce.ashfield@gmail.com
Cc: "A. Sverdlin" <alexander.sverdlin@siemens.com>, 
	meta-virtualization@lists.yoctoproject.org, adrian.freihofer@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 00:58:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8428

On Mon, Nov 6, 2023 at 8:41=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Mon, Nov 6, 2023 at 4:21=E2=80=AFAM A. Sverdlin
> <alexander.sverdlin@siemens.com> wrote:
> >
> > From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> >
> > There are use cases for type=3Dkmeta in kernel-yocto.bbclass-derived SR=
C_URI
> > which do not point to git://git.yoctoproject.org/yocto-kernel-cache but=
 to
> > file:// local storage containing just some .scc files. It's not obvious
> > that they shall pull in the whole automatic kernel configuration of
> > meta-virtualization. Make this behaviour configurable by allowing
> > KERNEL_META_TYPE to be defined in local.conf or distro config.
>
> This is an ok temporary solution, but I'd only merge something like
> this with a bbwarning also being emitted at the same time.
>
> As I keep looking at it, there's very little in the .inc file that isn't
> controlled by a distro feature, so there's only small tweaks needed
> to make sure that only fragments and kernel features that are
> quite well targeted are enabled.
>
> Having the kernel-cache as a dependency is not much to ask,
> combined with the ability to use them to configure kernels
> properly and audit the results.
>
> The hours (more like weeks and months) spent debugging runtime
> issues due to incorrectly configured kernels has been huge over
> the lifetime of meta-virtualization. Asking for a few fragments to
> be downloaded (which can be mirrored) is minor in the scope of
> things.
>
> Which is why if a kernel type that can merge fragments, but yet
> is disabling the feature specification, the layer should emit a
> warning. I'd then have another variable which inhibits the warning
> message. Since that is something I can ask about in bug reports
> and until the warning message is re-enabled, the reporter is on
> their own.

My solution is now in master-next:

https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&id=
=3D45c2297a916516e5fc7b82dab46c4719590813b7

Bruce

>
> Cheers,
>
> Bruce
>
> > ---
> >  recipes-kernel/linux/linux-%.bbappend | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-kernel/linux/linux-%.bbappend b/recipes-kernel/lin=
ux/linux-%.bbappend
> > index 5f31578..c2fc91c 100644
> > --- a/recipes-kernel/linux/linux-%.bbappend
> > +++ b/recipes-kernel/linux/linux-%.bbappend
> > @@ -5,6 +5,6 @@ LINUX_MAJOR =3D "${@(d.getVar('LINUX_VERSION') or "x.y"=
).split('.')[0]}"
> >  LINUX_MINOR =3D "${@(d.getVar('LINUX_VERSION') or "x.y").split('.')[1]=
}"
> >
> >
> > -KERNEL_META_TYPE =3D "${@'yocto' if d.getVar('SRC_URI').find('type=3Dk=
meta') > 0 else 'none'}"
> > +KERNEL_META_TYPE ?=3D "${@'yocto' if d.getVar('SRC_URI').find('type=3D=
kmeta') > 0 else 'none'}"
> >
> >  include ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'lin=
ux-${KERNEL_META_TYPE}_${LINUX_MAJOR}.${LINUX_MINOR}_virtualization.inc', '=
', d)}
> > --
> > 2.41.0
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8425): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8425
> Mute This Topic: https://lists.yoctoproject.org/mt/102416724/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/6=
693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

