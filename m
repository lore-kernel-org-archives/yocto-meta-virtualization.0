Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web08.3426.1603855589589458513
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 20:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FWKQCrwI;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id b18so3383775qkc.9
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Oct 2020 20:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5vRDw3OE14G2UjSVNplufRZcWut4LwTwnGZ4keUt6O8=;
        b=FWKQCrwIDIO4ey5u6geY2sNn/Qzadd1XgOv4vjHb9IBzbCKB6BGcB26EiGiEI0mFXq
         6/pHtxaJirLVsdW6iNwCX0uujOr7J2O2kYLqPi3l7egmV4HR7axgH/X7qR+5ukE7alKA
         QbuOiLht/8J766/UYkSOQBys1NMNir0c57t0b32KOeE6ib8cEFMqDxNJ7wwAkkeG2HCF
         fkNas4TCKrK+JpWVdPROK8oKZdXYLzVnpd/EgFCEl3sc23vBNBc066pmYvxWtiqjI5c9
         H09QjKrtmGywsOCTgwgFv/ZTSE9O23/njd2byPGitpooLnhLqY6o0UW2eDkYHHLiEwHD
         5iQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5vRDw3OE14G2UjSVNplufRZcWut4LwTwnGZ4keUt6O8=;
        b=uWOi12nZ8gRtyMK1KwoVf3XN265JesOy/2CSb06wy7S8OTyL1c7qK4LxYZdN3m7oE0
         33JGldgDSFTjHyqPYsFIe6CKRyBB9CHZn+gk7S9qqaPUYLByn5kasxFiGv300ckatQ8x
         4UpvAC3PFTUjaEDpWsfmJMfJH8nAV/WJJvpDkDu2xfHdQpOWermQhg+XoOFg6tHsidIK
         tfbYnu/JyhrwcAst6IgFyqNdJw5fyqepjRwhGmCVWmJLmYDR4FllvLh1IPHX/7Z6Tlie
         145YatXNL2jfehe3G6dfn037BAWmE+GOjZe7jHdsLSzJl0NsriEgVFqbgI6nO2EmQpE0
         o5lQ==
X-Gm-Message-State: AOAM533mdkyQoo/fzVh3YisfVO8pFWoyNfM6v51+qvCjYwveogc+EYYj
	sUhioSz9P8PPk74FzXT+zzXADUn6P3T5gPtg
X-Google-Smtp-Source: ABdhPJyAEj5QSTt55DgvOPyxFbV7LaU4Su86ceD01HzY1sR8oo/O1tL7udKTAFmSiOW+qDGDchXpVw==
X-Received: by 2002:ae9:e509:: with SMTP id w9mr5290598qkf.311.1603855588706;
        Tue, 27 Oct 2020 20:26:28 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id w7sm2257686qte.83.2020.10.27.20.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 20:26:28 -0700 (PDT)
Date: Tue, 27 Oct 2020 23:26:26 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] glusterfs: use /run instead of /var/run in systemd service file
Message-ID: <20201028032625.GA46280@gmail.com>
References: <20201019081206.10239-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20201019081206.10239-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][m-c-s][PATCH] glusterfs: use /run instead of /var/run in systemd service file
on 19/10/2020 Chen Qi wrote:

> /var/run has been deprecated by systemd, so use /run instead,
> as suggested by systemd.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/glusterfs/files/glusterd.service | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-extended/glusterfs/files/glusterd.service b/recipes-extended/glusterfs/files/glusterd.service
> index 4835c820..2219f582 100644
> --- a/recipes-extended/glusterfs/files/glusterd.service
> +++ b/recipes-extended/glusterfs/files/glusterd.service
> @@ -4,9 +4,9 @@ After=syslog.target network.target
>  
>  [Service]
>  Type=forking
> -PIDFile=@localstatedir@/run/glusterd.pid
> +PIDFile=/run/glusterd.pid
>  ExecStartPre=@base_bindir@/mkdir -p @localstatedir@/log/glusterfs
> -ExecStart=@SBINDIR@/glusterd -p @localstatedir@/run/glusterd.pid
> +ExecStart=@SBINDIR@/glusterd -p /run/glusterd.pid
>  
>  [Install]
>  WantedBy=multi-user.target
> -- 
> 2.17.1
> 

> 
> 
> 

