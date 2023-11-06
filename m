Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BC3C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 13:41:50 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.54633.1699278106644595802
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 05:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WnJsNoDZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7a66b5f7ea7so172498839f.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Nov 2023 05:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699278106; x=1699882906; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVMoLp3cuLGTMvDGfjbz8hDNKzcuvgzOkCe8i5URhfs=;
        b=WnJsNoDZJhSkV8QrfBSxnhTOLTrrBtlp/EYqQQEGaS4/ZjJVzg3TeshFFqA/J6nfcQ
         FZEVqaKTKJchnIZRFcYo6/WwjSL3G24/N5QKI/NQJOiAPhpGzIR7zYn7yt62da3bDHYH
         HKCXZDJ8DdkyxDzUW6ODGI7r7EUwNiD1fNkVE+4aCM0tSbRzgvO4ndxLxMCwZzMiC+B8
         CZ8qXW5x1puHnj/4/AY0WA46S+1vcU5X6OGgzS+zmuj9cxChvrJG/2J1SHmIgMMNPK4m
         ZfAVjsG9CjbmWOMNQGc1aIWdEHmLrkxVrJ1H5dL8iBG8Woh1Zuw4uL9yFEsk/ax+htKK
         CssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699278106; x=1699882906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVMoLp3cuLGTMvDGfjbz8hDNKzcuvgzOkCe8i5URhfs=;
        b=udgl/tbPh4oP9D85AFNGOsfHXCtQGkmDQVJeAE5YKDOdpCYauToXOkOmZIV+aiQmk1
         xkMOhKIn5ABTnPhvWCRgpfWAaN7F+a3u/hNghkt7QEzktSzqL/HFUVtKKWPjesntViQY
         Tyic4pudIcdaWyoiOKAA7l2HqArJJCQK4mPepuFR6ixrjwaY2BdtT9FclgWemNeerrSw
         r1h6culYKsqpLHEDtZotewU8JALDkgBTOEx8M9FSnNhlJxhSeVcaS4PMfUffpGBa6a9e
         TUO6JwP789eh//kLGWubIa0Td4wutzs+m7gX7udqWwalmneXfgSAhV4rhm4tke1SVMy1
         A+ng==
X-Gm-Message-State: AOJu0YwzqAp2EKKeU/d6+sIjaxhy1bPsIHnI3YSnd5dGjvdk6lwX4mK0
	6TykrDsqJCT+lEK03tDOPK0KMmr5rPN0+QyoETo=
X-Google-Smtp-Source: AGHT+IFhHxtvHTnQyC5TZLQW6EgO4WYk0dNajyXKMu6Te7YXtiOTvw5Y9dXrMYqUQAMcxvd5x/yOjYfZPiy6LV92hn8=
X-Received: by 2002:a05:6602:2e8f:b0:792:7f26:dc95 with SMTP id
 m15-20020a0566022e8f00b007927f26dc95mr40575066iow.14.1699278105648; Mon, 06
 Nov 2023 05:41:45 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4ORrENvzkPYG_1EnDca-BQjhm4L3nj9e+ZfNer4wcd0Yw@mail.gmail.com>
 <20231106092058.1209687-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20231106092058.1209687-1-alexander.sverdlin@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Nov 2023 08:41:34 -0500
Message-ID: <CADkTA4P7wycHJ-M0ZwvqX7O1AEDWh+t8aJs0PWaSm=TuVVcEzw@mail.gmail.com>
Subject: Re: [PATCH RFC] kernel: allow KERNEL_META_TYPE redefinition
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org, adrian.freihofer@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Nov 2023 13:41:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8425

On Mon, Nov 6, 2023 at 4:21=E2=80=AFAM A. Sverdlin
<alexander.sverdlin@siemens.com> wrote:
>
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> There are use cases for type=3Dkmeta in kernel-yocto.bbclass-derived SRC_=
URI
> which do not point to git://git.yoctoproject.org/yocto-kernel-cache but t=
o
> file:// local storage containing just some .scc files. It's not obvious
> that they shall pull in the whole automatic kernel configuration of
> meta-virtualization. Make this behaviour configurable by allowing
> KERNEL_META_TYPE to be defined in local.conf or distro config.

This is an ok temporary solution, but I'd only merge something like
this with a bbwarning also being emitted at the same time.

As I keep looking at it, there's very little in the .inc file that isn't
controlled by a distro feature, so there's only small tweaks needed
to make sure that only fragments and kernel features that are
quite well targeted are enabled.

Having the kernel-cache as a dependency is not much to ask,
combined with the ability to use them to configure kernels
properly and audit the results.

The hours (more like weeks and months) spent debugging runtime
issues due to incorrectly configured kernels has been huge over
the lifetime of meta-virtualization. Asking for a few fragments to
be downloaded (which can be mirrored) is minor in the scope of
things.

Which is why if a kernel type that can merge fragments, but yet
is disabling the feature specification, the layer should emit a
warning. I'd then have another variable which inhibits the warning
message. Since that is something I can ask about in bug reports
and until the warning message is re-enabled, the reporter is on
their own.

Cheers,

Bruce

> ---
>  recipes-kernel/linux/linux-%.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-kernel/linux/linux-%.bbappend b/recipes-kernel/linux=
/linux-%.bbappend
> index 5f31578..c2fc91c 100644
> --- a/recipes-kernel/linux/linux-%.bbappend
> +++ b/recipes-kernel/linux/linux-%.bbappend
> @@ -5,6 +5,6 @@ LINUX_MAJOR =3D "${@(d.getVar('LINUX_VERSION') or "x.y").=
split('.')[0]}"
>  LINUX_MINOR =3D "${@(d.getVar('LINUX_VERSION') or "x.y").split('.')[1]}"
>
>
> -KERNEL_META_TYPE =3D "${@'yocto' if d.getVar('SRC_URI').find('type=3Dkme=
ta') > 0 else 'none'}"
> +KERNEL_META_TYPE ?=3D "${@'yocto' if d.getVar('SRC_URI').find('type=3Dkm=
eta') > 0 else 'none'}"
>
>  include ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux=
-${KERNEL_META_TYPE}_${LINUX_MAJOR}.${LINUX_MINOR}_virtualization.inc', '',=
 d)}
> --
> 2.41.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

