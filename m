Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.10416.1584150854718956882
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Mar 2020 18:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rqZ204Ue;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id f198so16121165qke.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Mar 2020 18:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=IY/Ywpp4EgdI3r/NPl/Q82+30Fz4ny798rmf3QNxzJE=;
        b=rqZ204UeCDpSIaoMSTW3tFwTjSOKKpJwxcvs5fXduLM1DN5VRzS+5hPN7wTxGQA5Kf
         XU9qXTo9cYrx/ch96tNX5wWflaWGI+QWIrXGVqFFVH9QsgUg+Q59J2I2YbQdprOanXRJ
         tf9V0y8C5JR1nWFefD+umD4+Spo7dGZP5Mu31VriPyY3fxGjlFGOEHG8JB/L89IU6mq0
         6F+WHPJLQMIfGqji8fBU5riexMXn+dlAXiDKo3ODKJF89bZTGeUdHg5k+nOjQwT4i0Ds
         /jJsz3Iin1//75ASuqg3PQPsm4IPvUefG8Dl3unCTsVIhVvuo54j9p2YS3g6Rb5AkG+i
         6fGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IY/Ywpp4EgdI3r/NPl/Q82+30Fz4ny798rmf3QNxzJE=;
        b=i7dm9ykHCpdrnjISK9vF08k+F6tWxsYKWiA/VdkEZrmWrkfwBe1ULFRkSeoPv980ce
         E7LIs+CeXWBO7sz2nEr3UpM3E8L9qBx3ZAfsS8uP3HGaZ4OPl6j35TVaS9EXnAT9ywzV
         gbRDDixcNENY1SwaJszTaIqMJbobknXKTJI2UWnCs0LMpLNyAbXAvYRjt/dGIax8jY8h
         7Dg2ts7HWeP0QOD+qrkckIt34VtmDNU5g8+s8LXqNwJKb7PRsdy1Csbdh3xUoIaAe6yO
         Wl7j/CNV6+3mu+Rd2L3vjSrCrVBlAnAD05kilFQ6XoS/ZKg8sw3Am4IBaxbJ4PHBJVuS
         uFWQ==
X-Gm-Message-State: ANhLgQ2dyqY/oHmheA5R3tWUZBd8vRLHafe14M6WOZ4kw0yKdDxwUOaQ
	HseEmhRY62bLeW6yPCeLui8=
X-Google-Smtp-Source: ADFU+vtOUs6Ut24VUtNRaiRVAKBlSCDgiJ2pYkqQDjO3KOk6Qnu5jw1ocQTTsr8Y+BJNSc7MJvFTjQ==
X-Received: by 2002:a37:4b97:: with SMTP id y145mr8707218qka.167.1584150853734;
        Fri, 13 Mar 2020 18:54:13 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id b13sm5606399qkk.95.2020.03.13.18.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 18:54:13 -0700 (PDT)
Date: Fri, 13 Mar 2020 21:54:11 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@lists.yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-virtualization][PATCH 1/3] conmon: bump to version 2.0.11
Message-ID: <20200314015410.GB61675@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200311231504.3535-2-stefan@agner.ch>
 <20200311231504.3535-3-stefan@agner.ch>
 <20200311231504.3535-1-stefan@agner.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH 1/3] conmon: bump to version 2.0.11
on 11/03/2020 Stefan Agner wrote:

> From: Stefan Agner <stefan.agner@toradex.com>
> 
> Bump to latest version 2.0.11 of conmon.
> 
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/conmon/{conmon_2.0.9.bb => conmon_2.0.11.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename recipes-containers/conmon/{conmon_2.0.9.bb => conmon_2.0.11.bb} (93%)
> 
> diff --git a/recipes-containers/conmon/conmon_2.0.9.bb b/recipes-containers/conmon/conmon_2.0.11.bb
> similarity index 93%
> rename from recipes-containers/conmon/conmon_2.0.9.bb
> rename to recipes-containers/conmon/conmon_2.0.11.bb
> index af7847b..a5bd527 100644
> --- a/recipes-containers/conmon/conmon_2.0.9.bb
> +++ b/recipes-containers/conmon/conmon_2.0.11.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61af0b6932ea7b12fb9142721043bc77"
>  
>  DEPENDS = "glib-2.0"
>  
> -SRCREV = "60b42f20f222df9da07a01ee444327348b9f54ee"
> +SRCREV = "ff9d97a08d7a4b58267ac03719786e4e7258cecf"
>  SRC_URI = "\
>      git://github.com/containers/conmon.git \
>  "
> -- 
> 2.17.1
> 

> 


