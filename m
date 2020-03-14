Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.10411.1584150839663155429
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Mar 2020 18:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fxMbYNr7;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id t13so9368166qtn.13
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Mar 2020 18:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=IY/Ywpp4EgdI3r/NPl/Q82+30Fz4ny798rmf3QNxzJE=;
        b=fxMbYNr7cIOCorcCuGGskdFUFhCwBU+xZBLS1HfcJwefMVztpqwMP8KkoXmZVdwWxz
         lifHi1a7lhde5E/DFBEl2MEkYRMPgY7iVf/l38VGlyPOaOyQQSyH72ljBNzwPQmUYrhO
         ZqajquExxB4zDELLqJ3dWlA8B6PfznZKVLtJwjaQahtrdy3KsLBsDzSTGTru6NPATESP
         d6gHj52lscWfWe2F7Rn3R219KNKFbfi168/JEl7EL9TeU1WLNYQJhBGbmTQLSTz8dtvz
         NnRl+sdaT13lWDaeAnlsF95gfHEOKuRc+7YQYAl9E/5OfQ4SSK08fhj2gGxPMhYtMCK9
         nAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IY/Ywpp4EgdI3r/NPl/Q82+30Fz4ny798rmf3QNxzJE=;
        b=N7US+pc4/kSV1QR/841v7cm9RTco1x2mo2DK6ZZBzyzBM08WcZrktddPqjjVpS8TbI
         h5WGmy5zP7ZtVJ4bmjp1qBF1NClpTd7UOtD7tQssB3IeBftXdEnaXMig1m6ZzLRRC9kz
         piZBAlExS+I6Q86YSJ39yw0WosnlFtzGtROlmy4HKtJ+/93OgLz/iZSmfGoca0nMcDFE
         2T5xK21wikm4gcc88J2FgISisjENalaCFrI/mLyoJA2IRCWd2awDBOoKx+nQlDNHLuTS
         QNOBfBNhXnpPlQkPGfMhcAvZ1CDyWUvaTZ1038qxZ7Nl4MI80gD8z81DVKTqSnCL6k/N
         4DzA==
X-Gm-Message-State: ANhLgQ1w+Xgn4hzQAIbl+4zgE7E/fOEAMud98UhgOdM4PchtlmFbRBtb
	5WIty4SHUeTd10cwruUUrUw=
X-Google-Smtp-Source: ADFU+vuHrIYsbSqzRtn+gSraJU79S1srYaL9C291G3v3SRGpENjJBfF87ldmaMQcKXt/NsvFJ2f7wg==
X-Received: by 2002:ac8:1968:: with SMTP id g37mr7998736qtk.322.1584150838564;
        Fri, 13 Mar 2020 18:53:58 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id j17sm31669575qth.27.2020.03.13.18.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 18:53:58 -0700 (PDT)
Date: Fri, 13 Mar 2020 21:53:56 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@lists.yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-virtualization][PATCH 1/3] conmon: bump to version 2.0.11
Message-ID: <20200314015353.GA61675@gmail.com>
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


