Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.5338.1620356893599299377
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 May 2021 20:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pPV4Xd8H;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id w3so11334878ejc.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 May 2021 20:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0HjbjKEYl0YYDVmJ/IJwkm9as7LA1etvhyzbw9dkwzE=;
        b=pPV4Xd8HzP+5Z98fliZgNyQHsWmgZm4cq7+YwwmOEQuj5FCyUlYSsEMgNum4E/rvfO
         1BifAksNKGExwuron9KQ8Yi6KURLgPY0Quq2H7cAYPajBh7ErBV/Wz3aTyyMMwMaHGa9
         yCqPu/U0U8BqwaVloWAtRPFcK5otMVGURIVUTk8wwNUWKRkag/jjAelF9EzX42GzShg/
         osJ/GCdNpBWcDD2i46vFR1sF8F8iRF2MivnjKw5i/Emi5czpWAMHARi7VB+sp0V8imSJ
         ++AZFDfOdfVv+zDWl0U3/qdBJBzcdIdWs7QmelB3xb4c3TTXLwpkZenHgAVpcpHpFtAX
         jFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0HjbjKEYl0YYDVmJ/IJwkm9as7LA1etvhyzbw9dkwzE=;
        b=gFpipLXeQikB8LdJwO/9x1H18tE0hNMsHRfVwaBvJx75z/9E0k3WaD01ApZKCWxZgV
         DkaOozxdmf9CQGsUuIYakOBNPRJGzesb9pBXcBn+EI4S/o6fgRocfiwJBv0u0ZNfaAKY
         3H60ZE7kk9VO8cSBlsVrACvnPXcUor0a1BalX+CosydiVucrbfHHknSJul3qYHge2/bE
         CDqKImPyOb13SgUpTLDqpbzanS+TaKp1+LydFOz0sRxMZXdbtcoPp2jsRGcBy8gK72ha
         PRUu31rkhVX/dI9mgmzaZBR19ZO9sYJEFFUlo3lTksigQyx6/vS54OXi8gAVs5tM+bzj
         bXlA==
X-Gm-Message-State: AOAM5320IzMT583cvNh9mVShkyi/moN5afCGKiRs/ls6V3FvjxMDNf4F
	C0vlr8hLl/iuNPqbpPpJfyS9vcxicD2ikX33ajo=
X-Google-Smtp-Source: ABdhPJzYUjlZBwPuA5oehQpjug1nUPc6Ew7ORCnfchwjjmsjLk0GFSkBlpr6j1INtGYrwTMMJwp7yf7BIWdflHQNdEY=
X-Received: by 2002:a17:907:3d8f:: with SMTP id he15mr7588078ejc.22.1620356891802;
 Thu, 06 May 2021 20:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210503134041.2962422-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210503134041.2962422-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 6 May 2021 23:08:00 -0400
Message-ID: <CADkTA4N_oGkK25k=H1SJ13idCpy8ti3WZV1L7WS47yTswC+igQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] runc-opencontainers: use bfd even with ld-is-gold
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is on master-next now.

From the follow ups, I assume that this is still needed. Once I get a
bit of soak and runtime testing done on some other queued changes,
this will be part of my next push.

Bruce

On Mon, May 3, 2021 at 9:40 AM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> * just a work around for internal error in binutils-2.36 gold:
>   http://errors.yoctoproject.org/Errors/Details/580099/
>   CGO_ENABLED=3D1 x86_64-oe-linux-go build -trimpath  -tags "seccomp sec=
comp                       netgo osusergo" -ldflags "-w -extldflags -static=
 -X main.gitCommit=3D"fce58ab2d5c488bc573d02712db476a6daa9a60c-dirty" -X ma=
in.version=3D1.0.0-rc93+dev " -o runc .
>   TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0-rc93=
+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../=
../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld: internal error in=
 format_file_lineno, at ../../gold/dwarf_reader.cc:2278
>   collect2: error: ld returned 1 exit status
>
> * it fails like this only together with gcc-11, with gcc-10.3 it
>   builds fine even with gold
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/runc/runc-opencontainers_git.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipe=
s-containers/runc/runc-opencontainers_git.bb
> index f3ff9a8..51ba7c9 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -8,3 +8,10 @@ SRC_URI =3D " \
>  RUNC_VERSION =3D "1.0.0-rc93"
>
>  CVE_PRODUCT =3D "runc"
> +
> +# use BFD when ld-is-gold is used to work around:
> +# http://errors.yoctoproject.org/Errors/Details/580099/
> +# CGO_ENABLED=3D1 x86_64-oe-linux-go build -trimpath  -tags "seccomp se=
ccomp                       netgo osusergo" -ldflags "-w -extldflags -stati=
c -X main.gitCommit=3D"fce58ab2d5c488bc573d02712db476a6daa9a60c-dirty" -X m=
ain.version=3D1.0.0-rc93+dev " -o runc .
> +# TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0-rc9=
3+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/..=
/../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld: internal error i=
n format_file_lineno, at ../../gold/dwarf_reader.cc:2278
> +# collect2: error: ld returned 1 exit status
> +LDFLAGS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold=
', ' -fuse-ld=3Dbfd ', '', d)}"
> --
> 2.30.2
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
