Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.1355.1583179638729007505
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Mar 2020 12:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WRCJuoLK;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id g19so1269568eds.11
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Mar 2020 12:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=44JoHTM8ZLAYUJQP5JgCmVrAhPJA298tWcAxuBPsq5M=;
        b=WRCJuoLKtS7s3EMOAkiSiFq8gifahfFvjYHAp1StcD5MBQtQ922gz15zRBInHI1sIw
         6ewVnMBboXQYbC4xQjAt81s1gJIoUadZK3A5jueJABX2Zzzpm0M31NIhJvmtC11ccUP1
         EhrDh+yqHPtil6aTuCiGw0E1VKBnX6jNVu7KO8XBTyEvr16wNaGSwBP4XBYZ/2rSNWqR
         x+ekDlEQt8SIko/XBsMJuUNYERLRfCPadhZX9lLT8sSykddsVABQES49Y7CzQG8LbevP
         cY1t/9wVvYwMzWyKcvScZ/ro9vMXe8huk7K6LFkK5Pl7kfPqBcZQvYLIOieOtSq/pePM
         H4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=44JoHTM8ZLAYUJQP5JgCmVrAhPJA298tWcAxuBPsq5M=;
        b=puiY5QB1YsrLqc9NezbA4F4JzBTbdECpreF1XsKu3FQHVw3M9qeulaGvMH13DwiU8m
         9YnsTXo1hqWT++EhZPJ2OACiQEYf8LVjeFElVdrfAbBPrZCNYR6QMDHf6k5EN3I2QsS6
         2OpKhRaqbT2/JZE56Sg4/7UcvDzWSdqDaOnJoz6+D+zqAbwS/q+3f7Bx4eJS6ePe8cHP
         iFmtPZAhR6B+jjAcI1maXuYi4DEOOVdzNhaFf7xvn4yiKbqV//Jv9yNxbAchLK0/isZR
         Dix7NLLPBQGx78u2tHlFZExWIf14oEItYvHq9FyDnfOLYiOdQPfDdJxL7HjdRazqK3S5
         Crnw==
X-Gm-Message-State: ANhLgQ3FXJyobKDfVrcXInkoA5/SFZ19Dr2X7hyjv7KLAWpcYVO+IfPh
	4qiSyvfXFcaj2piqbeaN7srqNUrH5RkrP2S0qbUaWrzy
X-Google-Smtp-Source: ADFU+vv4wt+/BLGNoVmndbJQTUo7xvdFUWs5qRUnOyC1czmQ9yWm0VD4XPb2nBYVibmUtOoOYcSldvngHX6UDE46zcs=
X-Received: by 2002:a05:6402:1769:: with SMTP id da9mr971568edb.164.1583179637176;
 Mon, 02 Mar 2020 12:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20200302143238.28949-1-norbert.kaminski@3mdeb.com>
In-Reply-To: <20200302143238.28949-1-norbert.kaminski@3mdeb.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 2 Mar 2020 15:07:06 -0500
Message-ID: <CADkTA4OaQp5MSi=38r_9iySmtXQGV-KwUdNQK1vJduShoMLWig@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] dev86: update SRC_URI and associated checksums
To: Norbert Kaminski <norbert.kaminski@3mdeb.com>
Cc: meta-virtualization@lists.yoctoproject.org, piotr.krol@3mdeb.com, 
	Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged

Bruce

On Mon, Mar 2, 2020 at 9:33 AM Norbert Kaminski
<norbert.kaminski@3mdeb.com> wrote:
>
> From: Piotr Kr=C3=B3l <piotr.krol@3mdeb.com>
>
> SRC_URI no longer works, server return 503. Replace server with github
> address.
>
> Signed-off-by: Piotr Kr=C3=B3l <piotr.krol@3mdeb.com>
> ---
>  recipes-extended/dev86/dev86_0.16.20.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-extended/dev86/dev86_0.16.20.bb b/recipes-extended/=
dev86/dev86_0.16.20.bb
> index 38dbf8d..d93e487 100644
> --- a/recipes-extended/dev86/dev86_0.16.20.bb
> +++ b/recipes-extended/dev86/dev86_0.16.20.bb
> @@ -5,10 +5,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842=
c2336e835926c2166c28b"
>  SECTION =3D "console/tools"
>  PR=3D"r0"
>
> -SRC_URI=3D"http://v3.sk/~lkundrak/dev86/archive/Dev86src-${PV}.tar.gz"
> +SRC_URI=3D"https://github.com/lkundrak/dev86/archive/v${PV}.tar.gz"
>
> -SRC_URI[md5sum] =3D "567cf460d132f9d8775dd95f9208e49a"
> -SRC_URI[sha256sum] =3D "61817a378c8c8ba65f36c6792d457a305dc4eedae8cdc8b=
6233bf2bb28e5fe8d"
> +SRC_URI[md5sum] =3D "288af53f256300777efc91d97c082fda"
> +SRC_URI[sha256sum] =3D "533f2a0d2ed61223040f27e5cd007a11d969aaf34f6b709=
ece122b1e6fc50580"
>
>  S =3D "${WORKDIR}/dev86-${PV}"
>
> --
> 2.17.1
>
>=20



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
