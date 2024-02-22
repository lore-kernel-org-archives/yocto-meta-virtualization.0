Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA84C54791
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 17:10:39 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.18462.1708621835272832075
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 09:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L/dA9rkZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so4761938a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 09:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708621835; x=1709226635; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8K8gqImilNK6UgGDMWObNm/P3yPWOpwxdAOTUMifaA=;
        b=L/dA9rkZ49GHEZyFGryqMLkqJfECrM9SnMjBrQ7sSgoQKDnNx9oeKALy89QLfIDHSt
         2nEPNajj6GqKezWekZqpoajxYo7GFg9vJXlAx7gD0dbCAHRQqHT+b75lk5FnIqO+w3JM
         axtuEH6XaleXuPTP1GbSA0cJAzZre+lZm8WlJTH13/+KOGRsfVaNMy/VdQO/chrJVIkj
         5gf1b7FArQpHGot+6XhRtceK1h8q3a+I/A2xjBS97m1Ha6TggOl7rp6p6XJNk88Kiz3C
         yoSKiweke3FcG7HZ3Nue+8oS8YDgx66blyeApJoiOURve7YkbiupfSFLQ9sRuuSu/3Mo
         tIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708621835; x=1709226635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8K8gqImilNK6UgGDMWObNm/P3yPWOpwxdAOTUMifaA=;
        b=Ab+b9B2FlhGfRC3AwOrSAu4PsADp0G7Azgs7Oqe8gseydg0nWHzTGYuEJCNZpkfEhI
         nNc0F+W7LV469b7qj7ifmG2rL4H91PQWYvfE8cmgk+rXxLWJlc3u0xgIDz7gsTvbVwus
         8F9/rkT9GRroNiaMz4qJFWyIrM0+sdohhLBzHcXUZk3HplsAZrpSCKr4ldumFElRyYE2
         UVJk5ebM5TDqXDz2JSUMvDbYiPfGIPUmJ68Ia/x4Io/5ilq+IyPkb1IUH4o9pCOPsUL3
         /yfVeSFv6kDiPUqMX9Ua/EESV0j/sF0Pn5NwOd9s4LZ5fmEBaHjcNFy2JDEu0bbuFERP
         /9dA==
X-Gm-Message-State: AOJu0YyU19sPQk1bpr6MP6UnGBtkmndBHdydTuQxYAHJeucCgZrULhc8
	g4SCSH0RBMhMh1VgoUpPfVZVP7yy9HbFJZEr4vw7g8CIt9OIV/1uXQa7yCyKtHlPcl+OheAzUtm
	55QWjZ3PExbO5BTXM570P/Hvylmk=
X-Google-Smtp-Source: AGHT+IFH0B0MxvGXAWkc2VD/f3xeDelb8UPYdUc14ut9f3rrhXt0xhxU9dPolXvR7s/rKg/6P9A2S9t0A+oB8X7CNXw=
X-Received: by 2002:a17:90b:f0a:b0:299:ecd0:483b with SMTP id
 br10-20020a17090b0f0a00b00299ecd0483bmr7962283pjb.10.1708621834036; Thu, 22
 Feb 2024 09:10:34 -0800 (PST)
MIME-Version: 1.0
References: <20240222162019.3154833-1-fathi.boudra@linaro.org>
In-Reply-To: <20240222162019.3154833-1-fathi.boudra@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Feb 2024 12:10:22 -0500
Message-ID: <CADkTA4Ovz6SpRXopnfUxq8cMFXzCoG=hLZ3cA5vG3VNx=Pneww@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-yocto: include: relax the
 versioned linux-yocto_*_virtualization.inc
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 17:10:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8573

Unfortunately, no. I've already rejected similar patches in the past.

The specific versioning is intentional and is going to stay. It tracks
what is supported and tested in a given branch.

If someone needs to deviate from what I'm marking as tested, they can
carry a file in their layers.

Bruce

On Thu, Feb 22, 2024 at 11:20=E2=80=AFAM Fathi Boudra <fathi.boudra@linaro.=
org> wrote:
>
> The include content hasn't changed since February 2020 and has been only
> renamed since to be tightly coupled with oe-core linux-yocto kernel
> version.
> It's causing unecessary breakage for layers tracking meta-virtualization
> master branch layer (for CI purpose for example) and haven't updated to
> latest kernel.
> This commit relax the strict versioning requirement and allows the users
> to have a bit more time to fix thier layers.
> e.g. layers still using 6.5 kernel and haven't migrated to 6.6 are
> unblocked.
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  ..._6.6_virtualization.inc =3D> linux-yocto_6.%_virtualization.inc} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-kernel/linux/{linux-yocto_6.6_virtualization.inc =3D> lin=
ux-yocto_6.%_virtualization.inc} (100%)
>
> diff --git a/recipes-kernel/linux/linux-yocto_6.6_virtualization.inc b/re=
cipes-kernel/linux/linux-yocto_6.%_virtualization.inc
> similarity index 100%
> rename from recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
> rename to recipes-kernel/linux/linux-yocto_6.%_virtualization.inc
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8572): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8572
> Mute This Topic: https://lists.yoctoproject.org/mt/104511325/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

