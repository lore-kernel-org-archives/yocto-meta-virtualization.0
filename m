Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.1708.1626835903338351831
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 19:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yf3omSEJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id bm6so864329qkb.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Jul 2021 19:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=nzXhz4OhpX+xeEr+s7ZynKnwimaXnwJG4VkSm5mZHSE=;
        b=Yf3omSEJMvLTJzTzWHrFi6iXx4GEtN4X60zUTjYohEU+D4OI3r7A016qL7rn8L6ORI
         SxEbiHvkIQKHzSP1L0L1tp0YrRoH9QEzkTgJc6V9BGz53R4GsRf6AGn2irX6nRo9wqwe
         CxCTA1KMvcjJrIpM4U5MD3yHabxv99aF38qkSGbe0JbqunF0AQ1aW6hnYTxRSUJobSG8
         9GTUK6Nsn64EqGPsuJ86ozVyLdk0rWlGYiRwr+D3VWNbaU3tq0pRHvQvYmCyhKOoPXs2
         XS9fPM+nkMQwXLYFEcu1SM+YDs1vpGa/cBXdnoziJ+JvYU2gfImlZYQH6iIOr8CbpEca
         OBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nzXhz4OhpX+xeEr+s7ZynKnwimaXnwJG4VkSm5mZHSE=;
        b=o4voxr/7jThCPKp/8ODJEXUDFskt6TNbhLl8xw1X/B4FoKj52PhmaeapSLXjJR3xvw
         8uD0KzfBPegUL4wsPEblCWVVuAXQlK/9mICw+ScdXmKcWOOEDcafzN/GeQ6SU4ZfiJOs
         zAIJpFeakdYxYfemnnu0f7HuWruOPhAXFpLE7YBVP+0FJPsDfnw4EMk0eyBiiWUtZQgs
         Umpx+iyr6UIvmvUkjNz7VXAKlcY7L7N2pCaBJ+GzzmRleDG3XxPuqgauCXNQqThgZCpm
         4pY44weQXibsyP+ViAETorHk5u10i9tfF38+GcXJyI/nmIcx8fSoUMU9AD/1staPNWnN
         hu9g==
X-Gm-Message-State: AOAM531p+3/wEQXgS9FI0nKCFh7LzHsr/Gkf8WeyjuQBwNVJJNsl/QmT
	I/LVvzpTJSsI+IR/1H12gyg=
X-Google-Smtp-Source: ABdhPJw1JxYapuF9+vWqbeFAB2Xfu42qKoOU+LOuKYEpmjC2m6MReakmjZ3z5Ev2iiJqbM21TJTuyA==
X-Received: by 2002:a37:6701:: with SMTP id b1mr32828839qkc.260.1626835902500;
        Tue, 20 Jul 2021 19:51:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id f15sm6714394qtv.60.2021.07.20.19.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 19:51:42 -0700 (PDT)
Date: Tue, 20 Jul 2021 22:51:40 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/3] docker: Fix for sysvinit
Message-ID: <20210721025138.GA44485@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210716154148.18909-3-leon.anavi@konsulko.com>
 <20210716154148.18909-2-leon.anavi@konsulko.com>
 <20210716154148.18909-1-leon.anavi@konsulko.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


merged!

Bruce

In message: [meta-virtualization][PATCH 1/3] docker: Fix for sysvinit
on 16/07/2021 Leon Anavi wrote:

> Fix for rare legacy systems which still use simultaneously both
> sysvinit and systemd in DISTRO_FEATURES. This fix avoids issues
> during do_rootfs with postinstall scriptlets of ['docker-ce'].
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  recipes-containers/docker/docker.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
> index cd4d27b..610da56 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -120,7 +120,8 @@ do_install() {
>  		# replaces one copied from above with one that uses the local registry for a mirror
>  		install -m 644 ${S}/src/import/contrib/init/systemd/docker.service ${D}/${systemd_unitdir}/system
>  		rm -f ${D}/${systemd_unitdir}/system/docker.service.rpm
> -	else
> +	fi
> +	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
>  		install -d ${D}${sysconfdir}/init.d
>  		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
>  	fi
> -- 
> 2.17.1
> 

> 
> 
> 


