Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92827EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 13:57:00 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.40119.1688997410579363395
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Jul 2023 06:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jpTrymoi;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-c5c8d00ced3so5378844276.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Jul 2023 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688997410; x=1691589410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRUR12YOPhyOc6d/Vz/U4n2QdHhvFP7sA4z0NTX11Z4=;
        b=jpTrymoiappncqyiwBrzlDnxj+JpoRkA7gITW6rPzuvYQGVdGlsgUt3xUYPqbp8EyR
         U/MDOsjiuO6Q5eqSCoTTuv7/GX4wMMXfVW/MkI4zJiW972tBJUgsGvaAGvYhiv5yuMq/
         UEkMlu0kjMK2TjmNn4eE1K2h54rWLOIzNKZnKI4XBT3fwT9OSCXY6k5bGDeUER0IP+g+
         pqtdZapLnseiF+Diy+UAHtwX4jODFHpVYGXQxE0R6c3ON+yvXXwihQEomO33MKqVjrVR
         NaZJgx28mQE66tdISSKd8hJzu2VicHfwUPH7YREPCnINdnqVqrvZiKNlYhe98etdbPA5
         4nnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688997410; x=1691589410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRUR12YOPhyOc6d/Vz/U4n2QdHhvFP7sA4z0NTX11Z4=;
        b=K3V8YfwJMQ9jbQV/9bpEOw5HEfVqWSYb/7096Ahe8/LwMmMxO11fjUSk9v7Uz+Tpa1
         jJmmlnHCWEPbMCL5gMEDBjGFNHTkCDLlGNj8ksLK90IAJZfz6UIi+I+aSGetqXf3oGiP
         xZNtcGgN+V5s0gEPv/z7w5Q7f0j5oGf8m0D9LRtcV2g2PZEG7PdbG53MeUlz1ditT8bw
         9qi7g+XNxBcoQKHcFw9WW6GkIG+Q7Y8K4132HDc6LqDM3ZIoIeWju0+2mXmg5plq1guN
         1szfL7VvGz6Myg73KZ333GzOacelWnkYpsbGMB8QXzvFtOQtj7StZ/g0m+IX37896GAo
         A9CQ==
X-Gm-Message-State: ABy/qLZwu7UkJPUjzlpySmFmR0M5jtgDNEONfQKqcWQeuysLlkgQaGu8
	hxmLjkQEY2rmjzXEeLP8kx7tdjO/P2vtQ0loY88=
X-Google-Smtp-Source: APBJJlEI6RqOUUgfhXN1uQlOGUgnM2wUOwpB59jcwMyRtKtVIniZrADlnHPstkhgJRBOaF0CfxYNhH4rBW/wjCTkoXc=
X-Received: by 2002:a25:c708:0:b0:c5d:f2af:5a28 with SMTP id
 w8-20020a25c708000000b00c5df2af5a28mr11438337ybe.18.1688997409624; Mon, 10
 Jul 2023 06:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcK=CMxS_n1kQcDTMO0DwXPVe=CcyfHDZqifOm9mjvO+X_KyA@mail.gmail.com>
In-Reply-To: <CAOcK=CMxS_n1kQcDTMO0DwXPVe=CcyfHDZqifOm9mjvO+X_KyA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jul 2023 09:56:38 -0400
Message-ID: <CADkTA4MNwL8dtUTyqc0haqLD3LPvocykPE9PpNnN8yQtfm2F-g@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone] docker-compose: missing dependency
To: Markus Rathgeb <maggu2810@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Jul 2023 13:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8125

On Mon, Jul 10, 2023 at 7:37=E2=80=AFAM Markus Rathgeb <maggu2810@gmail.com=
> wrote:
>
> Hello,
> I am using your layer in a custom distribution.
> I am using the kirkstone branch.
>
> I added python3-docker-compose to my image.
> The following recipe is used: meta-virtualization/recipes-containers/dock=
er-compose/python3-docker-compose_1.29.2.bb
>
> If I use the docker-compose command on my target machine the following er=
ror is shown:
>
> # docker-compose
> Traceback (most recent call last):
>   File "/usr/bin/docker-compose", line 5, in <module>
>     from compose.cli.main import main
>   File "/usr/lib/python3.10/site-packages/compose/cli/main.py", line 9, i=
n <module>
>     from distutils.spawn import find_executable
> ModuleNotFoundError: No module named 'distutils'
>
> After adding "python3-distutils" to my image explicit the error is gone.
>
> I assume the recipe "python3-docker-compose_1.29.2.bb" misses a RDEPEND f=
or "python3-distutils".
>

If you check the mailing list archives, we had a discussion about this
same thing in the
thread: [meta-virtualization] Docker Compose issue regarding the
deprecation of Python3 distutils on Kirkstone

And yes, there is a missing rdepends, but since distutils is
depreciated, it is left as-is as an early
warning that users should migrate to the newer docker-compose using go.

If you do need the python3 version, then you can ensure you are
explicitly adding that package to
your image, or attempt to patch it to use setuputils (and send that
one to the list!).

Bruce

> Best regards,
> Markus
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8124): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8124
> Mute This Topic: https://lists.yoctoproject.org/mt/100055714/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

