Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.2191.1593139621709771481
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Jun 2020 19:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j92DyTw3;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id f18so7606656qkh.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Jun 2020 19:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=tD04Le9rcr6GNA+5CQhdmx7ET5RIgHze7bswi/hUgbY=;
        b=j92DyTw3jaLxEylvAbnWcrpZ2f0wuQtAgY512fLraYXOn0pr+IpTyq3Dd/ekcwcqGo
         He4b/+dnazcfQzyJUtfey+Ylfjht1DThwdnslGRoqXPoSU1HYpEP8i55l942pnj4Nj4X
         8QBVn6fnpnDhetV0Def+pwSmwsIvqmVJqG7m6wlgSO9Y1FY93yKkpIvV/gtwbKdHOr7V
         dVntchCnTxDkitrxdKaTogY0xca2CF/YExVqZsvII2djeyZa98JDFpaQ69ZdotB0IcQ+
         IhMbtMYa+peooTnNEZv3WZ+kmWy7Dwe33mIh6G7eG+aiNorJDGjUZ+3WKc3EnIhB1h3q
         hgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tD04Le9rcr6GNA+5CQhdmx7ET5RIgHze7bswi/hUgbY=;
        b=uaxwmt2yMBB77LEK4QTay9opM244cjzdgnJo1L4QgCuArO9JLODX7KZuctZTd0zhVD
         RxUa9mJQD4E7D1e4zh1UgK7VlBI3njFd18bDCQO0Y5mHM5xfStFfgMJa1uQDcN4NRRgM
         53b37PBS8dRIAZ8TvaOzIwJMm7CFQOCPKY/I4u+RR3L5h26q7tGclKEqhSsEnw2zi/DJ
         f5bqlKnME5vmQqMddyKdzG7TQ2Rz6UInF0hrkW4xR/Q/jkppkCXZP9H3XF8Z2mFXRGLE
         Mmo9PXiTQgt3RE9KJkFOWHEAPFg00hWVaQgfNyVKfgFG/pQwFLRyr0zqojJ3voY5jNcm
         oMUw==
X-Gm-Message-State: AOAM532gaf/QQsdTl747OKX8lFGyot9R0NyWWgTolyK9eJLi3AgLg2n3
	ha+QDkM77w2h7O8JwAwt3kQ=
X-Google-Smtp-Source: ABdhPJwgWPjO69B8wA+UWYyLwAzulrYoOWA2e67v4e+sFzq59ppllBianwmfHa3wBVaEf4SvMUBg8A==
X-Received: by 2002:a37:68ce:: with SMTP id d197mr776057qkc.85.1593139620759;
        Thu, 25 Jun 2020 19:47:00 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id q32sm8484176qte.31.2020.06.25.19.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 19:47:00 -0700 (PDT)
Date: Thu, 25 Jun 2020 22:46:58 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Ming Liu <ming.liu@toradex.com>
Subject: Re: [meta-virtualization][PATCH] python3-flask-cors: inherit pypi
Message-ID: <20200626024655.GA59008@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200623084555.15456-1-liu.ming50@gmail.com>
 <20200623084725.6278-1-liu.ming50@gmail.com>
 <20200623084814.25045-1-liu.ming50@gmail.com>
 <20200623084845.27422-1-liu.ming50@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] python3-flask-cors: inherit pypi
on 23/06/2020 Ming Liu wrote:

> From: Ming Liu <ming.liu@toradex.com>
> 
> Drop SRCNAME/SRC_URI/S, change to inherit pypi.
> 
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> ---
>  recipes-devtools/python/python3-flask-cors_3.0.8.bb | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-devtools/python/python3-flask-cors_3.0.8.bb b/recipes-devtools/python/python3-flask-cors_3.0.8.bb
> index 5d3c41f..aac7152 100644
> --- a/recipes-devtools/python/python3-flask-cors_3.0.8.bb
> +++ b/recipes-devtools/python/python3-flask-cors_3.0.8.bb
> @@ -9,13 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=118fecaa576ab51c1520f95e98db61ce"
>  
>  DEPENDS += "python3-six python3-flask"
>  
> -SRCNAME = "Flask-Cors"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/F/Flask-Cors/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "Flask-Cors"
>  
>  SRC_URI[md5sum] = "551cc4c0305a171d28caa2b3bc838867"
>  SRC_URI[sha256sum] = "72170423eb4612f0847318afff8c247b38bd516b7737adfc10d1c2cdbb382d16"
>  
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools3
> +inherit pypi setuptools3
> -- 
> 2.27.0
> 

> 


