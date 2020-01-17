Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web09.2265.1579225737829319906
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jan 2020 17:48:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VsM9edLA;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id 9so17114549lfq.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Jan 2020 17:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6e/6pg2dqCNxErHkxmSOFWLumyv3f7TYx1izV5OtVbQ=;
        b=VsM9edLAcn/5vxZiBbPHFhsi24wV4OM9IxcA5QdSyb4eX6aspoqUrJutUT9DRObtSS
         F5gyEiWIL5GdUnBbqysqgh8YionmhAKP1ks9//halqNNMVj42QYikrNrAMC5FB5O+ENA
         t/i16LTiP081j9Q67vFxKPC8joY6S5zlcp9bvJ9O0Nlkn347QanolFc0+t1Aid9kwa7q
         UcIAFVS0MlEf2D927U75PKldjhF+TwybBvPu/lIH1PfhQiXG5Vfm5aO/sqEQOr3vGSjf
         Ltwf8pqC6eQ2SKMn1+HSndeDOfhmmWiDUc3/bv2ViOHG91K8KT48rVeB9+htCpWFaNfQ
         HzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6e/6pg2dqCNxErHkxmSOFWLumyv3f7TYx1izV5OtVbQ=;
        b=mkyhikGACVZZvl4bGpBwMYTFEhUTmBkRZVieEv8IZEpNcOEoNXjNT5z45kruTP64V5
         IJ0AOQ6Ccbgrklajz4zyNsC2GgFa9Lm0nRs/MMwubJPm1l8uZiSHVlH0WohjSjMXZvcu
         4YcudlVOGVavJYJzizpf47YYZfweAshfC6FTuun2uMkv234t4zubVCcgWJba5ttDO//s
         ZUIiTynL0iSjgkaGcMS2ZKYB+NjdATiO51j29/6Bgyh5RyI7sniJPDfzJSI/FH//DKTg
         E3H3oDjZFHwF6J4E03koAlp1UZSSgB+P0OAY6+8F4mHFRGZP9scdZrCY+GaX2lcmd2Ag
         WEPg==
X-Gm-Message-State: APjAAAVmoMZdo8LqfxtoMMetiLdMxMdhRIEMlMmB0NXsfGsgltqdmhmt
	smxy3FTIg5rXVSH4mNtsoXCLiAn98LE4ZhtY+2w=
X-Google-Smtp-Source: APXvYqyLp8IytLCi40ciW9Mul/WW+4kgpx7+G/tM440okmmwDGkY3hMAQgUuooTd9SSSGvszLIE0StDFDh8SoUpEwOo=
X-Received: by 2002:ac2:489b:: with SMTP id x27mr4062580lfc.130.1579225736065;
 Thu, 16 Jan 2020 17:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20200113154742.15509-1-brendank310@gmail.com> <20200113154742.15509-4-brendank310@gmail.com>
In-Reply-To: <20200113154742.15509-4-brendank310@gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 16 Jan 2020 17:48:44 -0800
Message-ID: <CACMJ4Gb=PZjGpRDYOCsMu0h=TZaoA-+GbHqpcDkEejzUD3t8Rw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 3/3] xen: upgrade to 4.13.0
To: Brendan Kerrigan <brendank310@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Brendan Kerrigan <kerriganb@ainfosec.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 13, 2020 at 8:17 AM Brendan Kerrigan <brendank310@gmail.com> wrote:
>
> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>

This patch is good; it will just need a respin when the first patch in
the series is updated.

A minor change, given that this adds an updated LIC_FILES_CHKSUM to
the versioned Xen recipe file:
I think that the LIC_FILES_CHKSUM line should be removed from xen.inc
and one added to xen_git.bb, since it is a version-dependent value
now.

With that change: Reviewed-by: Christopher Clark
<christopher.clark6@baesystems.com>

thanks

Christopher

> ---
>  ...01-python-pygrub-pass-DISTUTILS-xen.4.13.patch} |  3 +++
>  recipes-extended/xen/xen_4.12.0.bb                 | 12 ------------
>  recipes-extended/xen/xen_4.13.0.bb                 | 14 ++++++++++++++
>  3 files changed, 17 insertions(+), 12 deletions(-)
>  rename recipes-extended/xen/files/{0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch => 0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch} (96%)
>  delete mode 100644 recipes-extended/xen/xen_4.12.0.bb
>  create mode 100644 recipes-extended/xen/xen_4.13.0.bb
>
> diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch
> similarity index 96%
> rename from recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
> rename to recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch
> index 6504d86..630fe05 100644
> --- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
> +++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch
> @@ -13,6 +13,9 @@ Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>  Forward-ported to Xen 4.12.0
>  Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>
> +Forward-ported to Xen 4.13.0
> +Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> +
>  diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
>  index 3063c49..513314b 100644
>  --- a/tools/pygrub/Makefile
> diff --git a/recipes-extended/xen/xen_4.12.0.bb b/recipes-extended/xen/xen_4.12.0.bb
> deleted file mode 100644
> index 246be7a..0000000
> --- a/recipes-extended/xen/xen_4.12.0.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> -require xen.inc
> -
> -SRC_URI = " \
> -    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
> -    file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
> -    "
> -
> -SRC_URI[md5sum] = "7d24d4541e3025421e02384cabc3528b"
> -SRC_URI[sha256sum] = "6e5455e4a58dcb2339bfcd2a89842728068b530aa62501843793f7cf743c4d64"
> -
> -S = "${WORKDIR}/xen-${PV}"
> diff --git a/recipes-extended/xen/xen_4.13.0.bb b/recipes-extended/xen/xen_4.13.0.bb
> new file mode 100644
> index 0000000..856b3df
> --- /dev/null
> +++ b/recipes-extended/xen/xen_4.13.0.bb
> @@ -0,0 +1,14 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +require xen.inc
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4295d895d4b5ce9d070263d52f030e49"
> +
> +SRC_URI = " \
> +    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
> +    file://0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch \
> +    "
> +
> +SRC_URI[md5sum] = "d3b13c4c785601be2f104eaddd7c6a00"
> +SRC_URI[sha256sum] = "c69ae21b2ddeaf25532a81a448fcc6a218bc56f93c8907b2d416b2d4339c0afe"
> +
> +S = "${WORKDIR}/xen-${PV}"
> --
> 2.20.1
>
> 
