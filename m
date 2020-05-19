Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.328.1589923178748806215
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 May 2020 14:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kbJ2mTQ/;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id o19so871410qtr.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 May 2020 14:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YnLqBPVKJF61Kt2+QDRcwIzS3QBs6dTK6WmgO80AMTM=;
        b=kbJ2mTQ/zMcXMDspGqvECCQaMzgWXhz/NfMwO+WSD0fdHWK9UM+L4vylAOy0PYJAI3
         rSQVQYwiidTS3xNUT1OXzCK+z78VfVe37+vPo14XK3d6MbABNGc1YjuXk3/TlsO3k07K
         HjvXVJLaKWNOmHfo60V1FE8+9Uw69YPNw/QoVz+3FfVloJPPB/o31JNDr04qrxKUjOwj
         otLsi5/xTARr6bcOo8PoyiB3qn7X9lxrbO/J8r+sVwtr6SxdErev0TZquumiqNcZ/H2J
         biowrBZ/ulbuvKvCj84LSZbWlukQvBhi31uRFY4S4iMLDP2VuicwDbW8GCctKTuIE4uT
         FPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YnLqBPVKJF61Kt2+QDRcwIzS3QBs6dTK6WmgO80AMTM=;
        b=s+Bgj3R8wxjppY835RGQ+NLoc5k1t3Vp2jjICd1SP0l0yOJ7hiUzaJjsxJAP2AVUCZ
         91SZwweFe5XBcr05607BoLOCfBquItIKZkpaj/H765Y33lNnDhYZc9z6yP5BcG60fkHj
         kP/YRVQlebUSiEPp9wlCd7zDhs7YqUH8TDRK99cqBOIPvPzy0urNsIEqYmoFE9bmX+O/
         vOvhjNP5jtfsn8TLNyj2oTVsQEJI+oikKiV1JgmedgT4ijIHy3ZCuQYduHa6RQ8G960Q
         KrBZBGlcmfkL+lLi3lTi8BcRBs165W/E856FICigiPaPRBESH4S7g1ONjH9z97gn+4kE
         nFRg==
X-Gm-Message-State: AOAM5312xF4YUlevkvw7JjeiJQivOszbfGEFrQqSpv2UJbMYSQLrUqT6
	bAIO1RFnXzqiwZJpHQYc68k=
X-Google-Smtp-Source: ABdhPJzkuzVEoNR7sLJ6MVQsy6RVvn+UxMeo228bSH5aAj57mrW5cDdQLEhwXCByXm+JcWiJMAhIzw==
X-Received: by 2002:aed:2e82:: with SMTP id k2mr2085409qtd.225.1589923177896;
        Tue, 19 May 2020 14:19:37 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id a189sm650449qkd.52.2020.05.19.14.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 14:19:36 -0700 (PDT)
Date: Tue, 19 May 2020 17:19:34 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: hongxu <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] lxc: fix compile failure on gcc10
Message-ID: <20200519211933.GB22460@gmail.com>
References: <20200519075534.46799-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200519075534.46799-1-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization][PATCH] lxc: fix compile failure on gcc10
on 19/05/2020 hongxu wrote:

> Since oe-core is upgrading gcc to 10.1, there is
> a compile failure
> ...
> |../../../lxc-4.0.2/src/lxc/cgroups/cgfsng.c:2100:10: error: writing
> 1 byte into a region of size 0 [-Werror=stringop-overflow=]
> | 2100 |   *slash = '\0';
> ...
> 
> Add gcc option `-Werror=stringop-overflow' to workaround the issue
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-containers/lxc/lxc_4.0.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/lxc/lxc_4.0.2.bb b/recipes-containers/lxc/lxc_4.0.2.bb
> index 441cf96..d0ead81 100644
> --- a/recipes-containers/lxc/lxc_4.0.2.bb
> +++ b/recipes-containers/lxc/lxc_4.0.2.bb
> @@ -67,7 +67,7 @@ ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>  
>  EXTRA_OECONF += "--enable-log-src-basename"
>  
> -CFLAGS_append = " -Wno-error=deprecated-declarations"
> +CFLAGS_append = " -Wno-error=deprecated-declarations -Wno-error=stringop-overflow"
>  
>  PACKAGECONFIG ??= "templates \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
> -- 
> 2.21.0
> 

> 

