Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.2743.1588734311745943198
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 May 2020 20:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iBYVJRZQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id w2so695155edx.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 05 May 2020 20:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=JRmh+YTA7+SvBjMOU0ldISE7xcbM5i9AUgigjfBKZAo=;
        b=iBYVJRZQIb7UdCxn70pzw5goQjpISRwNf/9063qtgKrMsOavz8kpl3klbjUyL0S50G
         pOSTx0XQL0b65Z4rU8mLKslxIyYcdllEn/WiF/ip6xBAaXQdIoHzpCvlmMZqqMpcK965
         BeK5DBj3ES9qAI0UTu9C8U9asH5TntXe0Ya6h2RHMLOjhvrpbi0CGOdtBe196Dye8v2q
         yzND7Isr4YYaxUZs8l52hXg5EBpjxy9JzFAUyQBtP4KLGwmRgnbX5cTJHWwtq0IZ/MQG
         coqju6DB0GNWBtHNbP4RZQ/Ix2pUFV71EtTJVOEiR1D2WOYh8QEJ4ZLsNpKpijLIAE7x
         o0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=JRmh+YTA7+SvBjMOU0ldISE7xcbM5i9AUgigjfBKZAo=;
        b=JGESnXo3St884b9WkEB595Z56otNSXjYwPd0JvDEaNwSlLVlv7URJZfIs/F+jg7lpt
         I9MMwix4hqWwlMZPz/Qibs/RLPojVeFomqMm09zkPFJq0LN8onZq616qi5zSF7niYlsT
         jduxDb2GQTLkJRRdyVI5FtPSD+eQcKLP18xyR5KXaGy22HwZ1izXn0iBnBN+VPGtkZtW
         3MoxJk4VkqrG+29+73AXO5Ocbx6O+cfh4FkdzbJQQghC+RnNg2h7rY6LD38HNsauCc4v
         OwHahCc/O+cPUF2O//idBGnSTcm25Bcu/kFw3x8QC12ada2MsksDE8KbHZ9lqNZWSRDz
         cZYg==
X-Gm-Message-State: AGi0PuZv9R6RDLk3nNtuAGroOvfFWen2me4jxRl9+1g7tD9YJOpz6sQh
	3/4Bdc+0cLNXPaDQ6Ww4HQ8fMY56ieyO1HJPS2nTa5hl
X-Google-Smtp-Source: APiQypIY4KmVjcV87lgJ3GHJY0Kw0apzyGlQZx+kkEAbUcWDTzKDCdyXU2m/BQTrlnyS9ksXXgZpx7wn5NEgLy+E8zk=
X-Received: by 2002:aa7:cb0f:: with SMTP id s15mr5089827edt.164.1588734309710;
 Tue, 05 May 2020 20:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200505213222.23902-1-ricardo@foundries.io>
In-Reply-To: <20200505213222.23902-1-ricardo@foundries.io>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 5 May 2020 23:04:58 -0400
Message-ID: <CADkTA4PEYXTqPBvKnYAMrGbsjNR5pKwBtV92zdEsegO8-KdBdw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python3-docker-compose: update to 1.25.5
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, May 5, 2020 at 5:32 PM Ricardo Salveti <ricardo@foundries.io> wrote:
>
> Main change is support for the compose format version 3.8.
>
> Relevant git changes between versions:
> - 41d229eb Fix v3.8 schema support for binaries
> - 15bb3eeb add warning when max_replicas_per_node limits scale
> - 5d34f12f set min engine version needed for v38 schema support
> - 82873d2b update api version for 3.8
> - fe832661 Add v3.8 schema support

Looks good.

I hope people are noticing how well this commit log is written and how
easy it made my part of the process :D

I tested it with some local docker uprevs here, and have pushed this
part, since it didn't cause issues with my pending work.

Cheers,

Bruce

>
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> ---
>  ...ker-compose_1.25.4.bb => python3-docker-compose_1.25.5.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-containers/docker-compose/{python3-docker-compose_1.25.4.bb => python3-docker-compose_1.25.5.bb} (87%)
>
> diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb b/recipes-containers/docker-compose/python3-docker-compose_1.25.5.bb
> similarity index 87%
> rename from recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb
> rename to recipes-containers/docker-compose/python3-docker-compose_1.25.5.bb
> index 2dcad1e..dece5da 100644
> --- a/recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb
> +++ b/recipes-containers/docker-compose/python3-docker-compose_1.25.5.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
>
>  inherit pypi setuptools3
>
> -SRC_URI[md5sum] = "893fbb804a9057d6c470b5312407e0d1"
> -SRC_URI[sha256sum] = "fabae2bee4abfa7bdd09125b6bbdcdda81f946c7b16e3ccc6bb2d821ef6488f3"
> +SRC_URI[md5sum] = "a6f296957148e4c61b28fb324c27c966"
> +SRC_URI[sha256sum] = "7a2eb6d8173fdf408e505e6f7d497ac0b777388719542be9e49a0efd477a50c6"
>
>  SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch \
>              file://0001-setup.py-import-fastentrypoints.patch \
> --
> 2.26.2
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
