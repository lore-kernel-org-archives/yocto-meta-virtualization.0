Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.29586.1610339138555201130
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 10 Jan 2021 20:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u9c218in;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 85E8238C06CD
	for <meta-virtualization@yoctoproject.org>; Mon, 11 Jan 2021 04:25:37 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id w18so16548076iot.0
        for <meta-virtualization@yoctoproject.org>; Sun, 10 Jan 2021 20:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=ClVgpilUVCM2/Vo5N4qyuM6ulpR5Y60F6P3c0SkyzF8=;
        b=u9c218inNA0a55d2X3IM1l7wzMdkdHk7QNll0rquJLv9y03U/GiSq47R6J9U9MVdRY
         HmxK5kGmO/acOQDMMgVaN391mE+ZBEFMz5HkxV+8IDzE34Yj4I64y/0c9lQHqriJtwTc
         MnpmVd0ioUa1t3a3ThjmdzBiZ+zceNWNtaYING73x0fpTCEM8v61L6NPMMX98cAHg8X1
         EiOUtcl7AguSw4Dt3nWqb85Cq43FsxncZREW9UawIgabSYNFZWEvpjYIi7/F4d5GuGRy
         4YR3sOODHdyvd5DrP8A8vAyf8mrpNYkt0KO6hNXQFGEmO/Efun9jLgVBcyJ7k/2MZg6h
         +YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ClVgpilUVCM2/Vo5N4qyuM6ulpR5Y60F6P3c0SkyzF8=;
        b=EZ6EFC8k/Vp40eFSXEelOWYmSTE2dheRq+jjKYn9D5Et8g62XhepcEYJuUj4YCKv49
         HK0xKgViDd63T7CdkUvzQ02FJG0izP4NXW4danTVclupyrYYOLdJv++cYeGeOcskbw/P
         Sy6zDGZ4AlmNBfjt2HGQMjL77FQk91hYjocAUjIfN9L31CKukUd0eWqHpanOehx1ckyb
         r3PgnyvtjlP8dbkfxak9h48+RUdpZyw+VG5kpLeEEVIhEIme8/zSVEKofEMJvegp/F+9
         C4CQMppxPTfOeFb0K0t0lvElz6hllm6YyIYoo4/BLfhiSHilaJCRwzPIB6hwwnInqbNr
         I7hQ==
X-Gm-Message-State: AOAM531YUGoHfFWlz8Rsu0bKDUuYxvOgus/XT4VTzoxhlkyRHSQ4fW1h
	Fkhm9SEw3LOCjrwEDFIng2Oab88AWVFE4w==
X-Google-Smtp-Source: ABdhPJxZPl791L2JpYS5Faw8scb1hCAv5wwYHfzeGpi1igYduR/xaEqQDIpmLvbJsNQplvUele8jng==
X-Received: by 2002:a02:c804:: with SMTP id p4mr12999494jao.110.1610339136675;
        Sun, 10 Jan 2021 20:25:36 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id w2sm8516626ioa.46.2021.01.10.20.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 20:25:36 -0800 (PST)
Date: Sun, 10 Jan 2021 23:25:34 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Daniel Dragomir <Daniel.Dragomir@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [thud] [PATCH] lxc: Fix postinstall script for read-only rootfs
Message-ID: <20210111042533.GA27243@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210107035337.33793-2-Daniel.Dragomir@windriver.com>
 <20210107035337.33793-3-Daniel.Dragomir@windriver.com>
 <20210107035337.33793-1-Daniel.Dragomir@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged to all branches.

I honestly can't remember why we ever had those as on-target, so I'm good
with the change.

If someone has a problem, I'm sure I'll hear about it :D

Bruce


In message: [meta-virtualization] [thud] [PATCH] lxc: Fix postinstall script for read-only rootfs
on 07/01/2021 Daniel Dragomir wrote:

> Ensure postinstall script for lxc-networking package can run at
> build time for a read-only rootfs (with sysvinit).
> 
> Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
> ---
>  recipes-containers/lxc/lxc_3.1.0.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-containers/lxc/lxc_3.1.0.bb b/recipes-containers/lxc/lxc_3.1.0.bb
> index 977583f..235a429 100644
> --- a/recipes-containers/lxc/lxc_3.1.0.bb
> +++ b/recipes-containers/lxc/lxc_3.1.0.bb
> @@ -167,9 +167,9 @@ pkg_postinst_${PN}() {
>  	fi
>  }
>  
> -pkg_postinst_ontarget_${PN}-networking() {
> +pkg_postinst_${PN}-networking() {
>  if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> -cat >> /etc/network/interfaces << EOF
> +cat >> $D/etc/network/interfaces << EOF
>  
>  auto lxcbr0
>  iface lxcbr0 inet dhcp
> @@ -178,7 +178,7 @@ iface lxcbr0 inet dhcp
>  	bridge_maxwait 0
>  EOF
>  
> -cat<<EOF>/etc/network/if-pre-up.d/lxcbr0
> +cat<<EOF>$D/etc/network/if-pre-up.d/lxcbr0
>  #! /bin/sh
>  
>  if test "x\$IFACE" = xlxcbr0 ; then
> @@ -191,6 +191,6 @@ if test "x\$IFACE" = xlxcbr0 ; then
>          fi
>  fi
>  EOF
> -chmod 755 /etc/network/if-pre-up.d/lxcbr0
> +chmod 755 $D/etc/network/if-pre-up.d/lxcbr0
>  fi
>  }
> -- 
> 2.17.1
> 

> 
> 
> 


