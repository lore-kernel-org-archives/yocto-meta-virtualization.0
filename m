Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.4016.1620961742818899739
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 May 2021 20:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hRSsA+25;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id f1so10925782edt.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 May 2021 20:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=axlC/8JwmNp1MqMmm57mVIn5YjhUF6XdRwZerP5rbXA=;
        b=hRSsA+25lgYLvhOvRC4xedeIBciMkLnkPTC2L7F2rDT8Z+8F2sDh/xwxQl53cQfXG7
         MtO41CMB9u1Hw3C4U4DZJapTjCQoKF1e/p6paFDWvikgCWaEmrRurvhHwBZXDJJSUV0d
         RlDUh6lW/aEmxlcYIBrhhgkkv7ar84RvJJQl9xe/849raaWh+u14Yk0RCBjVVDzW2Ny4
         X4U9l2rGDjYnSh5L4IHZH0dkY4NIVYUtl7DIOilY383jTs+XhQJUfL4kzJZhf824CN9A
         1oyZCeRDhf37ideeguaCZAfpThaggg3Pc6lH1MVbaaIHFxtYWr/gdwklV1wnoAt6E4Fo
         sCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=axlC/8JwmNp1MqMmm57mVIn5YjhUF6XdRwZerP5rbXA=;
        b=OU5tfIA3tKthhj6A13Llsdbr7VdpAQkqDn69B6WTIDr+i96Gyt+22ghVp6I1AvdkHt
         nB35jiN/zMz5kUfj8YX1sZJ7oXcWd7SdqSozEkXXIhEx1eTNju3Ofd7OgY/keNAAC9OF
         kmGJUfkCRGr/JkpWNr/6tWrmu/+CP2KTkBox2irb6pAk/XvAzZWPr3RENk0wAnSdfxGp
         ltVTkUipezPYfjkrRAVnPbMPyHO5SxMTRGaFbUlIZYcNDAZ/fbS4/nq8UlSZ4tAojdl3
         mXoily+aMGRJZSpAH1TV+QQchNbQ/zhZ+xQpXpGIaBmSn4kQ803pkPPhRdtqU4q9mIqH
         s+Qg==
X-Gm-Message-State: AOAM532tVAwGGSDY5kMdX9vIHX5XxjgtXVlBGySd/IsCGVPhOIpQdYIr
	X23oCF2wtObSnrqNZBgdc05dHOaikpQS6slZx2Q=
X-Google-Smtp-Source: ABdhPJxCSWzTUz40e+grIWhgCijtEcl3OtgNmBvPR/o5wNSRiQiTXEy3uRYBA9+u86ykdmW2N2nNP23kqCsu1szf3qA=
X-Received: by 2002:a05:6402:268c:: with SMTP id w12mr55522891edd.234.1620961741135;
 Thu, 13 May 2021 20:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210513105212.1446927-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210513105212.1446927-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 13 May 2021 23:08:50 -0400
Message-ID: <CADkTA4MirjyDNy-+oV1zrJf5H1XeWsNFqszC4ViY6cW9qK5wRQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] Revert "runc-opencontainers: use bfd even with ld-is-gold"
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged.

Bruce

On Thu, May 13, 2021 at 6:52 AM Martin Jansa <Martin.Jansa@gmail.com> wrot=
e:
>
> This reverts commit dda5ae36b44c61e61439341ea3153e6be5cb015e.
>
> binutils gold linker was fixed with:
> https://git.openembedded.org/openembedded-core/commit/?id=3Dd07d4d739ae1=
7787017f771dd2068fda0e836722
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/runc/runc-opencontainers_git.bb | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipe=
s-containers/runc/runc-opencontainers_git.bb
> index 51ba7c9..f3ff9a8 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -8,10 +8,3 @@ SRC_URI =3D " \
>  RUNC_VERSION =3D "1.0.0-rc93"
>
>  CVE_PRODUCT =3D "runc"
> -
> -# use BFD when ld-is-gold is used to work around:
> -# http://errors.yoctoproject.org/Errors/Details/580099/
> -# CGO_ENABLED=3D1 x86_64-oe-linux-go build -trimpath  -tags "seccomp se=
ccomp                       netgo osusergo" -ldflags "-w -extldflags -stati=
c -X main.gitCommit=3D"fce58ab2d5c488bc573d02712db476a6daa9a60c-dirty" -X m=
ain.version=3D1.0.0-rc93+dev " -o runc .
> -# TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0-rc9=
3+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/..=
/../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld: internal error i=
n format_file_lineno, at ../../gold/dwarf_reader.cc:2278
> -# collect2: error: ld returned 1 exit status
> -LDFLAGS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold=
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
