Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A76C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 15:58:51 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.19603.1710863920624283034
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 08:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jtr9Rp5y;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5d4a1e66750so3490382a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Mar 2024 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710863920; x=1711468720; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FKZdSp8QAqmB/XrHvXjVCipu5eBTUCB6vJdgFsb/5g=;
        b=jtr9Rp5y3Cr1dpd/Q9ym/N0WNXPGnMcUi1K/o6jSh1hrTctp9B/CWFbb8YRBd4I3TA
         RWvDuks8ffJd+rvzGxKKmu+Lb6VWvPdnFAQnHS4nbJ0rOvAru4Gh8KmJoEvs5ZhXsCZ4
         SE8c5us/BTdF2zz1Dao+hcluNehoWSHz0dTx7S0hha2dLke6OyWMO8/A6bMEIwRy0242
         TAlc+elanyIJY6xsxQMoVqgcnXqgyEzha0saAR/juR3rLLE55ij3DAAcfna2WEILTctp
         L5Ufc5oYGxSGMX+fpork5jwO6hsgKGvdlCA9e1gjHtqS6ki2rXxjHbfUBwBwGCZ0lE94
         PYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710863920; x=1711468720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FKZdSp8QAqmB/XrHvXjVCipu5eBTUCB6vJdgFsb/5g=;
        b=dReNrWp7fVONB1igtwdHpPaOEBnjm8bKgUEG0mfud7idI3m/KE/6KyvbXvVqADov5G
         OB3sdAnKJzXfjldd/RLmtwGFvF+a4VWOSiAyKztwdGzOrdPDcVJ1K9WDgq4qQ9cu4Us3
         RjTQeYHXhXLmbCMzurfjbG6xaeCk6Kk8i0weigkkOLUHDc6zn9BBmn5jVM9TsC5hXK+q
         ETAA0pRerg2OGNJ+O5uGHF4aJK86Ku0/t0iVIgJRlnAKm/hn7ngLt5PZYexSgwFNhSzI
         QFs1TthBmGLtqg4aOxMDbtLIZ7U25YLdBucbUeIN5m3nMfbqZeY2mvJFoJrifiQiEgXQ
         S7WQ==
X-Gm-Message-State: AOJu0YyzUY+eFrGE1Po9vx/Y5JqtYj5Lh3aVoRkqLyKV/uqyqrN5dttI
	qe1sjcZ4a25bYRGv5gSOc4O2tLesKTgDEQxQg5OLoZbxhqbqsOkKVl7++tra/fciJWAA6sy4cyL
	WNs3PQ+/Er7YTSRFGBYz18dTFJf0=
X-Google-Smtp-Source: AGHT+IFr+F1nYAll2su5w62f6KTGmV8kc2f74OWZD59rAJbZQ7PC/kvbSN9IgwZBq/wKIOgGadxS6b4tYBdac8k3FsY=
X-Received: by 2002:a05:6a20:2d11:b0:1a0:f096:502d with SMTP id
 g17-20020a056a202d1100b001a0f096502dmr3553287pzl.22.1710863919925; Tue, 19
 Mar 2024 08:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240319155432.2263227-1-ts@ferncast.de>
In-Reply-To: <20240319155432.2263227-1-ts@ferncast.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Mar 2024 11:58:27 -0400
Message-ID: <CADkTA4NL6jet8oUsi9gWUYB6hg0ZuVOJxBqKB30--haOQoZ6Ew@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] Update runc-opencontainers to 1.1.12
 since old versions have a severe security issue
To: Thomas Schlien <ts@ferncast.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Mar 2024 15:58:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8647

master-next is already updated to that version.

The stack is ongoing release testing, but I do expect to push master shortl=
y.

Bruce

On Tue, Mar 19, 2024 at 11:54=E2=80=AFAM Thomas Schlien <ts@ferncast.de> wr=
ote:
>
> CVE-2024-21626 https://github.com/opencontainers/runc/security/advisories=
/GHSA-xr7r-f8xq-vfvv
> ---
>  recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes=
-containers/runc/runc-opencontainers_git.bb
> index 61e7cfa6..88964276 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -1,11 +1,11 @@
>  include runc.inc
>
> -SRCREV =3D "f3446b1e5fe75bf419c808d8705c899ab4968b6e"
> +SRCREV =3D "51d5e94601ceffbbd85688df1c928ecccbfa4685"
>  SRC_URI =3D " \
>      git://github.com/opencontainers/runc;branch=3Drelease-1.1;protocol=
=3Dhttps \
>      file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.pat=
ch \
>      "
> -RUNC_VERSION =3D "1.1.10"
> +RUNC_VERSION =3D "1.1.12"
>
>  CVE_PRODUCT =3D "runc"
>
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8646): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8646
> Mute This Topic: https://lists.yoctoproject.org/mt/105026590/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

