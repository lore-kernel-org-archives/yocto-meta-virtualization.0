Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.11264.1621430514878204583
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 May 2021 06:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hAudMPTB;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id i7so2110883ejc.5
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 May 2021 06:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aiWKwgolzK1Bkn7tF7IpIJCw8a+KHfwMlhh653LZkVo=;
        b=hAudMPTBDbpLEnSB/n3KuyIu4KMkmJzSoNjLp+51sKEKTp3Id7q5NKZCBPqXc2ijqB
         UOFA12aOq2IUGnGVyK56SFtYvImwSoHQ+x2uI/h5hmvvt7bWwRynzSlXJHmgSZuqjQio
         9Mx/2IhHqcvLZNEWdoBMrTYxLZOZZfOOZC6lXo7szWK7u1U04GHDNG9WEG/YtUKKRWuy
         SvR7hLK8rYYq7z7eSDjcVe+7Pb+2+fweWRcPpMVCbhyCCexvMLArJ5P6SUPOYMrqjDQU
         PDIk+Zqnn7fc1+ctQCW5VRpsJw/XWzBrhhw/q0CuE1wN+QqVX1cilsJtyn0yqQ+y6WQn
         PPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aiWKwgolzK1Bkn7tF7IpIJCw8a+KHfwMlhh653LZkVo=;
        b=jJE99TkO3u9c0DTRoGuMQuPqZnVjaAUfzLb2/p9mMCAHtqTIL302qPhshz3o62KPGw
         am9RPwdAH0sgPO1n2hmX8EAQRMN7xvXE/KXT5gNQXHhX16JWttnysn4GFabbn1zlDyVj
         LILbWPCpjVs2FDV2Zt1Rquo4pIU+Wg0daodmSwUSufzjlrN1Fh+3T/jiGDUwyLm5MxBK
         0C7E/ga4Vrf+21mPQ68+OVMDyWKKxM9Q4uBw7RjpSwb8CeKbGp65CS07qcBVeD1Xy8YH
         G6egInlDvrYW8gn0wS4DM5SP/XSq0JkPPEd+ywPGNbdpgMnl56666MxDNzd3V+7JIfAA
         K33w==
X-Gm-Message-State: AOAM531u3Akyh/Xa6yK91wKBt9T3307wj7AZSXocAoFwyNzAoY7BAqbP
	il7jsjRsNFKewclY6R+D/eGljMwSO33xZiQKhmQ=
X-Google-Smtp-Source: ABdhPJwlj8vGvWUzzDQzckZ+xIYHqrWLR50WUNhI2r6oLg26q8+qlSjhZKN7yEz96XnST6NWLDfqdHQwRjZwcbpWJJE=
X-Received: by 2002:a17:906:5fca:: with SMTP id k10mr12796887ejv.357.1621430513300;
 Wed, 19 May 2021 06:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210519114740.152144-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210519114740.152144-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 19 May 2021 09:21:42 -0400
Message-ID: <CADkTA4OdQZkTfOFDXx8gMgS9XjgwDMePB=dE1oX1kZBd31g_3w@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvirt: fix do_install with usrmerge
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, May 19, 2021 at 7:47 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * meson build uses these paths:
>   ./src/meson.build:    systemd_unit_dir = prefix / 'lib' / 'systemd' / 'system'
>   ./tools/meson.build:    install_dir: prefix / 'lib' / 'systemd' / 'system',
>
>   with usrmerge it fails with:
>   sed: can't read TOPDIR/tmp-glibc/work/core2-64-oe-linux/libvirt/7.2.0-r0/image//usr/lib/systemd/system/libvirtd.service: No such file or directory
>   because systemd_unitdir and systemd_system_unitdir are different
>   with and without usrmerge in DISTRO_FEATURES:
>
>   env.libvirt-without-usrmerge:export systemd_unitdir="/lib/systemd"
>   env.libvirt-with-usrmerge:export systemd_unitdir="/usr/lib/systemd"
>
>   env.libvirt-without-usrmerge:export systemd_system_unitdir="/lib/systemd/system"
>   env.libvirt-with-usrmerge:export systemd_system_unitdir="/usr/lib/systemd/system"
>

Thanks for the fixups,

I need to get CI to include usrmerge so I can pick these up faster (I
just added it to the ever growing TODO).

I've queued this and will fire off my own non-usrmerge tests and push
once it passes.

Bruce

> * set -Dinit_script to none when systemd isn't used instead of
>   deleting the files in do_install_append
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/libvirt/libvirt_7.2.0.bb | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
> index b569953..19662a7 100644
> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
> @@ -65,7 +65,7 @@ FILES_${PN}-libvirtd = " \
>         ${sysconfdir}/libvirt/libvirtd.conf \
>          /usr/lib/sysctl.d/60-libvirtd.conf \
>         ${sbindir}/libvirtd \
> -       ${systemd_unitdir}/system/* \
> +       ${systemd_system_unitdir} \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
>         ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', '${sysconfdir}/pki/libvirt/* ${sysconfdir}/pki/CA/*', '', d)} \
>          "
> @@ -199,17 +199,21 @@ do_install_append() {
>         fi
>
>         if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> -            mkdir -p ${D}/lib
> -            mv ${D}/usr/lib/systemd ${D}/lib
> +            if [ "${systemd_system_unitdir}" != "${prefix}/lib/systemd/system" ] ; then
> +                # ./src/meson.build:    systemd_unit_dir = prefix / 'lib' / 'systemd' / 'system'
> +                # ./tools/meson.build:    install_dir: prefix / 'lib' / 'systemd' / 'system',
> +                mkdir -p ${D}${systemd_system_unitdir}
> +                mv ${D}${prefix}/lib/systemd/system/* ${D}${systemd_system_unitdir}
> +                rmdir ${D}${prefix}/lib/systemd/system ${D}${prefix}/lib/systemd
> +            fi
> +
>             # This variable is used by libvirtd.service to start libvirtd in the right mode
>             sed -i '/#LIBVIRTD_ARGS="--listen"/a LIBVIRTD_ARGS="--listen --daemon"' ${D}/${sysconfdir}/sysconfig/libvirtd
>
>             # We can't use 'notify' when we don't support 'sd_notify' dbus capabilities.
>             sed -i -e 's/Type=notify/Type=forking/' \
>                    -e '/Type=forking/a PIDFile=/run/libvirtd.pid' \
> -                  ${D}/${systemd_unitdir}/system/libvirtd.service
> -       else
> -           rm -rf ${D}/usr/lib/systemd
> +                  ${D}/${systemd_system_unitdir}/libvirtd.service
>         fi
>
>         # The /run/libvirt directories created by the Makefile are
> @@ -302,7 +306,7 @@ do_install_append() {
>  }
>
>  EXTRA_OEMESON += " \
> -    -Dinit_script=systemd \
> +    -Dinit_script=${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','none', d)} \
>      -Drunstatedir=/run \
>      -Dtests=enabled \
>      "
> --
> 2.30.2
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
