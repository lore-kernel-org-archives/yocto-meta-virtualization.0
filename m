Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.27139.1620615912935982517
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 May 2021 20:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gfqRfqXg;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	by mail.yoctoproject.org (Postfix) with ESMTPS id C92DF38C056B
	for <meta-virtualization@yoctoproject.org>; Mon, 10 May 2021 03:05:11 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id t4so22326721ejo.0
        for <meta-virtualization@yoctoproject.org>; Sun, 09 May 2021 20:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8mr0biHKF1TxcEN0DD6BZ6WV1hVTe3IwUjNnBo4ujFE=;
        b=gfqRfqXgwv/X3kTmg8InRJlSDJKx87iJie5d8DPEE/iXEnAaEx/qQmUKva9S1z5+5I
         v9d8/iPOXwAkkigCfl+I+PnC/YdJAGOeCh5CljfYas85vgJO1BH09LpELTMiWO1YmCoJ
         8JsSOT8XIEzj6XdS7izbtEBSz8cXimGBvbFR+h9XAN9w0CnLw1Pg/Cd7vm4Dy4kEgiVW
         DybpgdS9C1H6KqI2lP7RPJBkPcdkbXwGqO3EdtCUpKnPYHVpjiVjfvBB3IlOxPGntXu8
         7WIo01UEc/v26AjofWGhqhFYvPRkCkWcoaT0qvS23Z6LwWPJMDtOI9PRxeecbA6ruO5p
         PbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8mr0biHKF1TxcEN0DD6BZ6WV1hVTe3IwUjNnBo4ujFE=;
        b=SZu7/E1h5ELmTObCyTkO9OjSefjppnviAs5TQigSNTDgOxGstH8/EgssbjOO9j1oW8
         gZfU6yeQ+ruD2pt64sJs3as2BFE3Nijo9yq6GghvlYfgSMmJdHkl1yvXsT3NHd++JexH
         HXrqr3LR1Stz3+fo8KhXfRduoGMVKx3oFZdQaevjje5WLqxk9mKWrjGmKTnwfdGdBOwJ
         D+mB60fu6CQIPSe/sW2E2SASkj0hKTUFVRAdvFXzNzD7uL90Cg6yYMIUsDxfykhjn+wV
         cGXKyVStACMi0La1xiK8Bj/KSPEWpu3nRywf+tkQ0KLUB3M0NpMKp0zcWBbPn/V4StV+
         Qe1g==
X-Gm-Message-State: AOAM532a8v/s7zSm9mBJ6+i1l8ufMy9h528JySA+afpuqsqbXB2LJ5IR
	oktnraG7DUiNZ2MNvJKMf9+BY1ZIWJ7qmFtmEloTc3t7Mgs=
X-Google-Smtp-Source: ABdhPJx96S460+5BwqL1DGkmE7TFd2NhPHGCEwFXmv8OW8KJ++q6iMG7BK6pgmKGqIH7Wi2zaU/s3su6IrDq0URRRTw=
X-Received: by 2002:a17:906:11d4:: with SMTP id o20mr23436071eja.247.1620615910291;
 Sun, 09 May 2021 20:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <1620615389-72870-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1620615389-72870-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 9 May 2021 23:04:59 -0400
Message-ID: <CADkTA4PUxyb=FjZ9TLVMRMn5T_mMpuomAH-Pe0Psj9QEeqssLA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] initrd: bump busybox to 1.33.1 to match oe-core
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 9, 2021 at 10:56 PM zhengruoqin <zhengrq.fnst@fujitsu.com> wrote:
>
>     OE core has updated busybox, so we bump to match.
>

Neither oe-core or poky master or master-next have 1.33.1 as the version yet.

I realize you just sent the upgrade to oe-core, but having already
sent this here, makes no sense.

I have tests that will pickup when it merges to master, and I'll bump
the version then. I'm dropping this for now, and will revisit when I
see the version land in master.

Cheers,

Bruce





> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../{busybox-initrd_1.33.0.bb => busybox-initrd_1.33.1.bb}        | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-core/busybox/{busybox-initrd_1.33.0.bb => busybox-initrd_1.33.1.bb} (100%)
>
> diff --git a/recipes-core/busybox/busybox-initrd_1.33.0.bb b/recipes-core/busybox/busybox-initrd_1.33.1.bb
> similarity index 100%
> rename from recipes-core/busybox/busybox-initrd_1.33.0.bb
> rename to recipes-core/busybox/busybox-initrd_1.33.1.bb
> --
> 2.25.1
>
>
> 
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
