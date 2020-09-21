Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.52330.1600724097424681580
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 14:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wfjc/2uX;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	by mail.yoctoproject.org (Postfix) with ESMTPS id AD7AE38C12EB
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 14:34:56 -0700 (PDT)
Received: by mail-qk1-f194.google.com with SMTP id o16so16857363qkj.10
        for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 14:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=7DQiYJiB8EDogYppzcRLu0uj4DPVKl5pznKlaPFffG4=;
        b=Wfjc/2uXpnxMCLnV9XXBqBOfNrKKQCsZA9zFqzkfOdIoIJOEaX9JXzxMPY63MEvDiq
         /pBHAe8IF5lQLxCz8RFFQ+dg9W355oEyhrdZFDr6trKZM00c8f2UBx0cvvOpsUGXGibh
         MTev8iLh6yaUJ0Hy8Cgo5w3eCxoDAD7bQVzU9kG7stari0ZVFY3o2bnn9rLNGkhazOn0
         q6b3t13m0OC3T/mV3Z0v1klyC8CL5NouZUj4Rq6pQKHv9XVUZAjHp4Sk0tllIwdnaweO
         CbTbeMDfVZpdoxwudvE0RHQS/FBiK8fpZTPWMb+weYJ+dCx2oAbLEwymKB1vndabJsqW
         6MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7DQiYJiB8EDogYppzcRLu0uj4DPVKl5pznKlaPFffG4=;
        b=I1qYdm4MsIuMEHRB4lMjgDmCRbSTyPXXOO7/sOSRz7jNJ/Z4gfjNl0rz/XF/uuURXe
         3a4gsdQ79J63Vs4kO0rWLHN4x6IOcn4gKBfxtjw7eEMQ4LlOGYfyB8SIBtguE0o+g6W1
         OxKYH1FJhnBexbAWqn+6tgw+UgqA1CziU4aysgX5doosJRnxiQsMzJKOL1MYUZccviVW
         X8ygVcypchE223AR351bKR5DO9SxPjFC9x4RQo6J+p0TDbYGYrwLNttgUN9X2YIYpniY
         OGAVRrHzR/WxIOsZ8zLH+oiAJveV/iMO3DXC6R9S47LwwzeSkaBWBKcXiVDpEeu1Bjac
         KP+w==
X-Gm-Message-State: AOAM532PDUEVJ6Zfq5dz83ZxnKgpx4+wXyIXEHJIURBivl9GJiQdLBR8
	Lxb0RkYvjlfyVKQ07iu/GbU=
X-Google-Smtp-Source: ABdhPJyF722vU0i3FxfNd+GqJyUKxTXmZY5NB7wArPrtoxYr7qpPbWnLa/VMXKAGZ9gp70WaL4sB8Q==
X-Received: by 2002:a05:620a:25d:: with SMTP id q29mr1791737qkn.419.1600724095392;
        Mon, 21 Sep 2020 14:34:55 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id b9sm10429670qta.39.2020.09.21.14.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 14:34:54 -0700 (PDT)
Date: Mon, 21 Sep 2020 17:34:52 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-xstatic-jasmine: upgrade 2.4.1.1 -> 2.4.1.2
Message-ID: <20200921213449.GA47504@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1600463957-30892-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600463969-30949-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600463993-31018-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600464006-31108-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600464029-31205-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600464038-31262-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600464055-31349-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600464065-31406-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600464076-31466-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600464088-31520-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600464104-31619-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600464114-31678-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600464123-31735-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1600695773-84716-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


merged.

Bruce


In message: [meta-virtualization] [PATCH] python3-xstatic-jasmine: upgrade 2.4.1.1 -> 2.4.1.2
on 21/09/2020 zangrc wrote:

> Consolidate inc and bb files into a single bb file.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python3-xstatic-jasmine_2.4.1.1.bb               | 2 --
>  ...tatic-jasmine.inc => python3-xstatic-jasmine_2.4.1.2.bb} | 6 +++---
>  2 files changed, 3 insertions(+), 5 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.1.bb
>  rename meta-openstack/recipes-devtools/python/{python-xstatic-jasmine.inc => python3-xstatic-jasmine_2.4.1.2.bb} (72%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.1.bb
> deleted file mode 100644
> index 86eb7e2..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-xstatic-jasmine.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jasmine.inc b/meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.2.bb
> similarity index 72%
> rename from meta-openstack/recipes-devtools/python/python-xstatic-jasmine.inc
> rename to meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.2.bb
> index cdfb223..7e1638b 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-jasmine.inc
> +++ b/meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.2.bb
> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>  
>  PYPI_PACKAGE = "XStatic-Jasmine"
>  
> -SRC_URI[md5sum] = "9378ce965dfcb4ddb64855cc717d4ec8"
> -SRC_URI[sha256sum] = "d1e8bf3c0e1cf683cc2c0aad95f197e9e51ea747fb91291445223a2b7dbc4740"
> +SRC_URI[md5sum] = "736937d16fd655d1f6f2096b97d8255b"
> +SRC_URI[sha256sum] = "bf921be423c254a5cebc2156a7fd66d8210cefd251fc2fa51f792a153bf9e82b"
>  
> -inherit pypi
> +inherit setuptools3 pypi
>  
>  # DEPENDS_default: python-pip
>  
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


