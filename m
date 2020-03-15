Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.44585.1584288977012613714
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Mar 2020 09:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ekOihkCs;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id a20so18903076edj.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Mar 2020 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tsQ6AaXQZDm5Qp/oepGrJlJKc1r5ueD4NkqDnMTIMWc=;
        b=ekOihkCslJvzAG4ITx6Axo3wi1kHglH72Fe4V7gH9dWccXUy/AxEsqzCS3xetOJtD4
         VjTvrlwlqyM3TpmL09m6QdEaxyVariw0PMzaFlidzjg14R7tTbCjB3+m1wyzCeH3wK9a
         1ivEPd3VQckygLR5rZmYzne0JpbdG/VIA8bwAZPgHlMNxgtWUA812qX/ZbMA4/LuLV4j
         z9UM2VVB2re1UVU+IzWv+jmIkiu51lf692utyrzZTHj8naWrRKvOUEbMS+BZvU+Awuwc
         NTmF5QjPBwela09biFnUxJUmZMN2RP5QUuFVGsValCgLTzgfCeFxcDLtmlAUixYsJu4N
         nKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tsQ6AaXQZDm5Qp/oepGrJlJKc1r5ueD4NkqDnMTIMWc=;
        b=KrEO8/2zbseKSNvQ27DXxbM1Ierof7b3LTnFLKZSSoTycsZDA3CzsADeCCuDsS/dxk
         19UwIDzUXCW2e2025g0zjfDlJQPt7Ou6zoaKcWeagkguzTTyHPldS4q9Tbit3reK7NUi
         TLst3Ay1WxuQY/8rZyWVIkaVNqGdDkIiA0IOQuSkAW7uHyQfb+df37Z9XY6JEvb1CW44
         O+UHYaySIT9KkL0O4RB78eZyIeoI6/Bsuvi5kN88SOlRgNVixG5/46ThRW94GzDm/c06
         PZema4GZlNBp4+hRVwpctT68ZgC0elpmDz/FgtGmkXT13Bi8Zk/s1Sf5C+MssLne+FZr
         kbbw==
X-Gm-Message-State: ANhLgQ2Kaf3tXRjw4m7x7y3FSsROYMKghISx2T9aOa/FNGocngM2Qv1n
	uEoH8xDxJ7mNrIIGLGReDKVfknDGMtCYq7VS+Oc=
X-Google-Smtp-Source: ADFU+vsPSIypqEHwvGt9piSk8/j9/0BWOQLIn/S9yRxAFydHG9wnqh5A7USh8YBSt4SHQte8MvG0CF2tjjhSTHc2Rk8=
X-Received: by 2002:a05:6402:38f:: with SMTP id o15mr21798361edv.365.1584288975531;
 Sun, 15 Mar 2020 09:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200315122008.22161-1-liu.ming50@gmail.com>
In-Reply-To: <20200315122008.22161-1-liu.ming50@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 15 Mar 2020 12:16:04 -0400
Message-ID: <CADkTA4Nh3f_aF9AHT+b2SkjCMneY8L0SODUQP1roy3ij-vU2QQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] runx: drop distro_features_check
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Ming Liu <ming.liu@toradex.com>
Content-Type: text/plain; charset="UTF-8"

There are more pending runx change, I won't merge this either, until
I've completed a full round of testing.

Cheers,

Bruce

On Sun, Mar 15, 2020 at 8:19 AM Ming Liu <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <ming.liu@toradex.com>
>
> distro_features_check bbclass is deprecated, inherit features_check
> instead.
>
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> ---
>  recipes-core/runx/runx_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/recipes-core/runx/runx_git.bb b/recipes-core/runx/runx_git.bb
> index 36fede6..9517d89 100644
> --- a/recipes-core/runx/runx_git.bb
> +++ b/recipes-core/runx/runx_git.bb
> @@ -18,10 +18,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=945fc9aa694796a6337395cc291ddd8c"
>  S = "${WORKDIR}/git"
>  PV = "0.1-git${SRCREV_runx}"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "vmsep"
>
> -
>  # TODO: for if we need a go shim
>  # GO_IMPORT = "import"
>  # inherit go
> --
> 2.25.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
