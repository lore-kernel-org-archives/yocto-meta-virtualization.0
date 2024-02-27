Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264F0C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 13:58:41 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.12750.1709042318332568684
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 05:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gZ1JwukZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so3519290276.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 05:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709042317; x=1709647117; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8cJHDve+688tmVdYlg/GSB9FhBtyNqkZcSzghzbP8E=;
        b=gZ1JwukZw0XlPqWNpWKDqZW62w7NHV6eAiVOMKgyQiHvzirLunvKoaA3kLRhPPqv0T
         7oqcQcfbh+hKUEAu5zr11VOhX9t89LNHYRRCQTtP9cS3KFPE6WUPcGaz9wzMe+ji3I8E
         X0Lqno9F8HRGXp29KeCr7vGFoJd+PCw8fams1RiGDeLgyDouVaU6UIFveUPJshJHqOJB
         1Xe3vzxzoiN8JYy6xeFzoVkqoG6yHxT6Y1MYG5BNCiyeah8CYRWXk0x1yvZgehbL01Is
         jzi/NU7IolH8t7dqLstkjRvZxt+pWFdNXdMJl1e61t9G88AjANUe9H1qkGg63fT0niBN
         WUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709042317; x=1709647117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8cJHDve+688tmVdYlg/GSB9FhBtyNqkZcSzghzbP8E=;
        b=jNoqZTCnE8/4eSj9NqONKb/Hh1IMmgNGyP9zEuvly0GjUYZIzd+mc4IhdIfSr8we50
         yoBRDGZW4vUyaP+zwGRwnV1ORVthHytJbdFfAUAGH317pa56NLSnChU8TylWMF7MR+44
         IswQYQ5tZHe4b6rVBtPY2AsS0UC4e8ay9KX8wB8Wg/9rI48eSrRbA2J8bjqK/TOQYJMs
         aCXZBcgey92Bl5qt/9gZgbPTC/JmO7N8EmASm/y0HamdKRkdN/MtFwX3TVuW8uBpU33/
         Y1B/m+B2IcekcbkCKX14puxPWUISWPtDDrws//kt1P8qBeF350ipGZXiFYvgIYWLiUsy
         DbFQ==
X-Gm-Message-State: AOJu0Yy2WsOeX2ZdfdogIvfQaexGKb+jGIi46JrsEN7NQc3Hacn1VOy6
	MLHrpVz80h9uSEhU95iMZcIplIptL2pmS+eslzXneUrB+RV87yTo5v20LL2hbbddw5BQ5w4VNT9
	iN/6Rm7fzAMMO9bzc7d0zCtz2sLltjxt6
X-Google-Smtp-Source: AGHT+IEl+0Gdx6qNWS/fbqtPAg0vASNoFFiI6XVNwcM/sAt7XeyR3b1w/jYvAiltasnApHrtby4eUdAVbaiGnueJY1A=
X-Received: by 2002:a25:d6d6:0:b0:dc6:daa4:e808 with SMTP id
 n205-20020a25d6d6000000b00dc6daa4e808mr1391865ybg.12.1709042317043; Tue, 27
 Feb 2024 05:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20240227051211.3390256-1-Qi.Chen@windriver.com> <20240227051211.3390256-2-Qi.Chen@windriver.com>
In-Reply-To: <20240227051211.3390256-2-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2024 08:58:25 -0500
Message-ID: <CADkTA4PXRyw9eccmOgjQUp+SRvoe5Jx_T5GbMcuT=AnmoN-PVw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/4] crun: remove unneeded deps
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 13:58:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8591

At one point, they definitely were required, but I can't find any trace
of them being needed anymore either.

I'll queue this shortly.

Bruce

On Tue, Feb 27, 2024 at 12:12=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> These two deps do not affect the build result and are not used,
> remove them.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/crun/crun_git.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/cru=
n/crun_git.bb
> index 77126a1c..7a6c4797 100644
> --- a/recipes-containers/crun/crun_git.bb
> +++ b/recipes-containers/crun/crun_git.bb
> @@ -30,7 +30,6 @@ DEPENDS =3D "yajl libcap go-md2man-native m4-native"
>  # TODO: is there a packageconfig to turn this off ?
>  DEPENDS +=3D "libseccomp"
>  DEPENDS +=3D "systemd"
> -DEPENDS +=3D "oci-image-spec oci-runtime-spec"
>  DEPENDS:append:libc-musl =3D " argp-standalone"
>
>  do_configure:prepend () {
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8584): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8584
> Mute This Topic: https://lists.yoctoproject.org/mt/104598178/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

