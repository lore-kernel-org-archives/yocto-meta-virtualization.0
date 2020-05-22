Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.6066.1590113568648675599
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 May 2020 19:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BggY/DpU;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id s21so11265448ejd.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 May 2020 19:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=59z1GyqIhmCT80SNPf23CIy1+JeUVFNSPu2Lr9W2L/k=;
        b=BggY/DpUaYEBcQw+rewhmlMpqRu0KgXfl42oMCSWnY+2+4Jsq0DC23n4K0cr7ztlPf
         WDevtL4ZzwCEhVULODt+HJO4OVafCHrCcdZixI1rGAqXmXzsGtf6wLafjz6fNL6AQz8F
         BGizbQXmTQEp8V6pKvF77Ef+GhF1azyulnYzjhwPxXRoRRl5H7yVf4HklSui/MzwoU1v
         nPSA5DLzM7H73hH/cghl+4/i04kpBFhoFoYgAD0lRGUilEDoXxmjrkw6oxTlDTb4T2a+
         0iwZ7e+zqFUkq/vN0H5J8dDuw9MWj/NK/HVV+UumIrl+Sz1tH7EJp36BYgiKj6+2ZiAx
         +klQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=59z1GyqIhmCT80SNPf23CIy1+JeUVFNSPu2Lr9W2L/k=;
        b=QtJxhhAAZ+O3kPxqxLSr3N8bpFZiUPOq9ldTRWUVuxoQ0ZCbwLUp98VYxuIQvfgucX
         9p4sDoQjTm8A6rtw0NadHn3ixVcnZvdDKr0UkEjnDzUy1Q/ecjGyywB4iQjcWliVNwmc
         vm7bd7WUmy5xCh7TtqUTylNh0M+oMvVdfOylal2rtvFaexB9yyl3aSddoHyVQRhN6Cwq
         2j+y8vbtne1jZfmO+tqMcdLEtWKt7r5y6VEVYCE/Lq3p4a8Wq4G+vKLErrIkl3KGn2Gg
         bIx9XINJaYqKx3Rip/piLmwK+yPo+sKmIRXQRO308hSx5ZRosbDVrvV5sR5//zWNBBOU
         JPaA==
X-Gm-Message-State: AOAM532askyfdlPY5rQV/udMq0axvb/LCi+JOBSraa0sztmyD5Wmww1C
	Bt3xiiFJHqvYirSGFqS3oCWNTtiY6Y3V54ziQQU6s2pU
X-Google-Smtp-Source: ABdhPJw8BSvoVQQuEXNdq2ttdYaFXRnB2HrJIy4XNIeEPwvfv24ofM2Gdg1Kftn7hsSmhibTScLiyp/3gMerXmJO54A=
X-Received: by 2002:a17:906:8514:: with SMTP id i20mr5864673ejx.298.1590113567240;
 Thu, 21 May 2020 19:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200520013157.118150-1-hongxu.jia@windriver.com>
In-Reply-To: <20200520013157.118150-1-hongxu.jia@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 21 May 2020 22:12:36 -0400
Message-ID: <CADkTA4PuHjQ=h40K8fRbdu0KpG8Fm=YbNY+8iiPreErpHciwpQ@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] glusterfs: fix failure on gcc10
To: hongxu <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged.

bruce

On Tue, May 19, 2020 at 9:32 PM hongxu <hongxu.jia@windriver.com> wrote:
>
> Since oe-core upgraded gcc to 10.1, there is a failure
> ...
> |../../../../../glusterfs-6.1/rpc/rpc-transport/socket/src/socket.c:4302:24:
> error: implicit declaration of function 'EC_KEY_new_by_curve_name'
> [-Werror=implicit-function-declaration]
> | 4302 |                 ecdh = EC_KEY_new_by_curve_name(nid);
> ...
> Add option -Wno-error=implicit-function-declaration  to workaround
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-extended/glusterfs/glusterfs.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
> index a5677840..c209baa6 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -34,7 +34,7 @@ DEPENDS += "bison-native flex-native python3-native fuse libaio libtirpc libxml2
>
>  # rpc now comes from libtirpc instead of glibc
>  #
> -CFLAGS += "-I${STAGING_INCDIR}/tirpc"
> +CFLAGS += "-I${STAGING_INCDIR}/tirpc -Wno-error=implicit-function-declaration"
>  LDFLAGS += " -ltirpc"
>
>  EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
> --
> 2.21.0
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
