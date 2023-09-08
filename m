Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3EDEEB56D
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 20:05:50 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.3291.1694203546628859304
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 13:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PHTlaNK/;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-34e15f33a72so8037355ab.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Sep 2023 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694203546; x=1694808346; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNOa9FbWf3A7yfnIII16nG3sp7hMlxZMfQY045KToFI=;
        b=PHTlaNK/thJUOrL/dzfxp7EXHDw+lBAI7JA1Whho+6k20XhV+OPhzXocBwxn4UJ4T8
         VdX3oNTImXfHsgDPkPsHVRPMXAf/d+BuLyG1GZ0btPOopXKUIrlYi4fr2aV0r2O2T3DF
         mVqJaiexie9Cv7EMf41r57PED5Ft9H4boSLrIeUTlscdJZxFoWpKo+DkCj+Nn19/46Ie
         1FX0OvRDLV0MEfbzWo3A0h1GlXK1KS1g2qiyhj8vr2vHpWxl2+snxifs1JluwrVxtVwX
         E4gchTI+hxjXyPFpbekqUgkNPOGMAiDXd0jT/5ydgp3O2dz4dbUX2wXlDq1gwt5ux9BI
         6mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694203546; x=1694808346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNOa9FbWf3A7yfnIII16nG3sp7hMlxZMfQY045KToFI=;
        b=RoXEmeOY6eGvNEuhL2G7kopRJ7z6vZwrM/9O42yxaJfizRfS9EGYkcdxEXQe70FEJJ
         mB/0K+gUojzfJW+AXNNfSKlGdvVD8G4nsMUobbwcsvQk9i86Idujl7lHGoIInmBihZ1M
         Xl7SuPty89iYUr1tYvufaCSZSuygOemBuzcL+0KqO4hRRBf+hqB3wJF6F2oH1wRHTtw0
         KVxDbyRFjwyMu2+KxvBJ+kwDOW81+GFQ0uUPV6l4jKABpV7ZNjZ/VgWYZvYL6InmjKTk
         QR4SaaKv5zOR/FCdLD+rX5Qw0aq43ChlaEO55vzZW9kvJHQf2zM7i85KIbnZmNU4qgj5
         6Mmg==
X-Gm-Message-State: AOJu0YxInHA/ycXvBKi1kwcjU8YmVmqks28KvGLPf4Ar4fOv8zN/0b39
	W1DEvJ8/zidrm+R18uVrhkL4FBf/r2zzr8GRz3j0w1dCG9s=
X-Google-Smtp-Source: AGHT+IGP0P5Ss3ZW8RsCeXaWm20pURCHaqL/+draxGl7mcuEYm/ZPjZm0pI/8D8XPy1sXJN08z83UQ/OlgT6C/olTNA=
X-Received: by 2002:a05:6e02:d54:b0:346:6afb:c9f5 with SMTP id
 h20-20020a056e020d5400b003466afbc9f5mr3410062ilj.1.1694203545810; Fri, 08 Sep
 2023 13:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230907061114.35142-1-Qi.Chen@windriver.com>
In-Reply-To: <20230907061114.35142-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Sep 2023 16:05:34 -0400
Message-ID: <CADkTA4PNg4m+6caqKs4mpwa2j0FM7n0F2JhRZaWLMf2hnSHZXQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-compose: fix installation
 location for multilib
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Sep 2023 20:05:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8289

merged to master-next.

Bruce

On Thu, Sep 7, 2023 at 2:11=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> In case of multilib, the location is /usr/lib64/docker/cli-plugins,
> which cannot be recognized by docker. We should use nonarch_libdir
> instead.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/docker-compose/docker-compose_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/re=
cipes-containers/docker-compose/docker-compose_git.bb
> index 5777eeba..ab85a103 100644
> --- a/recipes-containers/docker-compose/docker-compose_git.bb
> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> @@ -66,14 +66,14 @@ do_install() {
>          #install -m 755 "${S}/src/import/bin/docker-compose" "${D}${BIN_=
PREFIX}/bin"
>
>         # commonly installed to: /usr/lib/docker/cli-plugins/
> -       install -d "${D}${libdir}/docker/cli-plugins/"
> -       install -m 755 "${S}/src/import/bin/docker-compose" "${D}${libdir=
}/docker/cli-plugins/"
> +       install -d "${D}${nonarch_libdir}/docker/cli-plugins/"
> +       install -m 755 "${S}/src/import/bin/docker-compose" "${D}${nonarc=
h_libdir}/docker/cli-plugins/"
>
>  }
>
>  RDEPENDS:${PN} +=3D " docker"
>
> -FILES:${PN} +=3D " ${libdir}/docker/cli-plugins/"
> +FILES:${PN} +=3D " ${nonarch_libdir}/docker/cli-plugins/"
>
>  INHIBIT_PACKAGE_STRIP =3D "1"
>  INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8282): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8282
> Mute This Topic: https://lists.yoctoproject.org/mt/101209753/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

