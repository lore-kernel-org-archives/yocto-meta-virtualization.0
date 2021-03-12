Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.8174.1615555532505085430
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 05:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YwwWImx/;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id p8so53315455ejb.10
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Mar 2021 05:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=90Tdke8U9n3dU9fudUl6lURTV+iClrihzYKmM9o94aM=;
        b=YwwWImx/Mx9JJJJJOjOJtmWrAHxSlvYo8G79lTZfrGUYytv9qs8mUdsxxML6aWnP02
         a4FQJhHC25YpyCUhZvxoC1GQQXFvp36JGBLQD+vPrqc6iAZbNXtwbG6DNsqX4DOYcAWG
         W87oga/wqujILiTWb/ggJwSpQifxQzz+Jj4pUhDupwAT8Sj2pCAjJ3CLKbgjriI8z3T2
         mt1ft994bd7p4SI0XNvBduaYHGFxXEMuhfmOg+dcmrd7UA9S1Sr5WvSMEgCnLClGdbM3
         js/dS//8PHf7PSDi6pqtvmAZXq2ZiHLmgIZJGFxAM9oK42y8od4NXEEUNg2qUfnwk2Ov
         v/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=90Tdke8U9n3dU9fudUl6lURTV+iClrihzYKmM9o94aM=;
        b=Q+h+HGqrc0KqgeIEDHYn5dcmqQ1s70YdJmR+hsDLFEcG37nGN7N+hvUZNh08lFRFUb
         6IzV/VOUzYyOQVdu0NCHi7u58m8MC7rJGLDFr1VLnXMghnbf/cJz2P/93uPFic5lVB5j
         c0fnDBmdKPpi2QdXvknZYL114+PfsGLoN2pLJQl4au9Z3TqmzeMBYDDKLk2msHZoWU0p
         77rTn6gvykYGIUF6CQ8sXTux5Pd6ZxZbXdm5mh+gYN7cZEum+39C+Rei3eD0SSiPXTUl
         pMq+b7nmCTeuo36ngJT/Pf/Kd4WNpeVfa4RcvdZZsH1QJ422kWatMLTB1rQujXhAMaY7
         cZUQ==
X-Gm-Message-State: AOAM530+v1m+7ztQbrsS3yghthZJJqileY3pl4D38F6kppuvuxy90Bpx
	tZMpAY0FTauGLraBwuWx+TXNFqFE85yfDV4fu40=
X-Google-Smtp-Source: ABdhPJz8b5XUPAAITW0emPiVQBaCt4qKQuK7opMTu1YCMm34nh56TUEPOTiBdxix2xsqJXWP+ZZphkKNakA7p172+YE=
X-Received: by 2002:a17:906:11d1:: with SMTP id o17mr8563634eja.517.1615555530765;
 Fri, 12 Mar 2021 05:25:30 -0800 (PST)
MIME-Version: 1.0
References: <166B8AE5719DF3F0.31346@lists.yoctoproject.org> <BYAPR11MB307762AF44B13DE8A7313B63F76F9@BYAPR11MB3077.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB307762AF44B13DE8A7313B63F76F9@BYAPR11MB3077.namprd11.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 12 Mar 2021 08:25:19 -0500
Message-ID: <CADkTA4OeZdPMiUNH_L--9gbs3c=PBcHf1E4du=AyvzF_G1vyLw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] lxc: Fix download URL from SRC_URI
To: Daniel Dragomir <Daniel.Dragomir@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 12, 2021 at 3:39 AM Daniel Dragomir
<Daniel.Dragomir@windriver.com> wrote:
>
> Sorry Bruce! Now I saw there is a similar patch sent on mailing list. Please ignore this one.
> Still... I don't see the other patch merged upstream on master.

No worries! It definitely showed that people are in fact using the old
branches regularly :D

> And I have this error on dunfell and thud branches too. Can you backport this change untill thud?
>

I just pushed master/gatesgarth/dunfell, and can also do some
cherry-picks to the older branches now.

Bruce

> Thanks!
> Daniel
> ________________________________
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org> on behalf of Daniel Dragomir <Daniel.Dragomir@windriver.com>
> Sent: Friday, March 12, 2021 12:22 PM
> To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org>
> Subject: [meta-virtualization][PATCH] lxc: Fix download URL from SRC_URI
>
> Download URL from linuxcontainers.org for lxc has changed.
>
> URL transformed to HTTPS due to an HSTS policy
> --2021-03-12 09:53:23--  https://linuxcontainers.org/downloads/lxc-4.0.6.tar.gz
> Resolving linuxcontainers.org (linuxcontainers.org)... 170.39.196.167, 2602:fd23:8:1::8
> Connecting to linuxcontainers.org (linuxcontainers.org)|170.39.196.167|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2021-03-12 09:53:24 ERROR 404: Not Found.
>
> Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
> ---
>  recipes-containers/lxc/lxc_4.0.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lxc/lxc_4.0.6.bb
> index ddff9af..b422909 100644
> --- a/recipes-containers/lxc/lxc_4.0.6.bb
> +++ b/recipes-containers/lxc/lxc_4.0.6.bb
> @@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
>
>  RDEPENDS_${PN}-networking += "iptables"
>
> -SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
> +SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
>          file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
>          file://run-ptest \
>          file://lxc-fix-B-S.patch \
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
