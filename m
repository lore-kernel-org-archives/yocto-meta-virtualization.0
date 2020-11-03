Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.4088.1604439272830831507
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 13:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qaD4DsU0;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6EFC938C086B
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Nov 2020 13:34:32 -0800 (PST)
Received: by mail-qk1-f196.google.com with SMTP id z6so16734421qkz.4
        for <meta-virtualization@yoctoproject.org>; Tue, 03 Nov 2020 13:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SPpVmw0MCBJpbDF+5AUkjG5wLHrzsQwdAFS5IOWLGgE=;
        b=qaD4DsU0DkPNV0nBJgT0Zv3e61Gh8hibTIS1trs+EbxHFaGJ9Oll00hnYoDk/D0J13
         Cqt1/S4PHXy5JXDsGXGeRnzZ6nUMrHFe9Vj3WnyiTekzrmyhDAYS/UM0irugxuroMsHW
         lHJL95jwdHdxGQ2cXClrsUsqBhydaLu0BSc4wfMGLQ+S0GZ7gIFdUUDUYBWmmF3r4hvH
         MIvghxWNbk9pmZ74qcuBS/euew6rdcb/GXeX8u+yJ9oGnW1xntGB1jJZ0uTasG2zhoNX
         JTlOb+H+Kb9bada/Jn6uK0azr5qccd/RY7QrVc8ukd7bvvr7Afjehv0RU7vNFo3hLUDR
         NDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SPpVmw0MCBJpbDF+5AUkjG5wLHrzsQwdAFS5IOWLGgE=;
        b=lMxdek6OZXNj0lGA5ZW/zGWAPidJk4k3P9gSYY64RyIuvC5AH1NBLBsj5mDxhwoxkk
         qzhnN+0swcF+IqBAgo16mLwu5lwh+29DexT6sKS3Dkn4kbK1k4wkcN3pzQtAIMDJtxbN
         3wcGKzAgEQdaSveFhLXGlcZI81nprQW7UFSDzOt320iEHgOmEhsNjEyvZr1x5f96vyqT
         oZNpAaHt8586fwzcCaeXLgAjeYX9/DItgOi0at1eoaxwq+TEyOZHnBKZp8SfqiKbqp/r
         umBfXVtTT+WyVoWddZzLp4v9qKYhdle/s8pyR9AOcL73iwnkz8EOZcl5QkONbZfUlDuC
         180w==
X-Gm-Message-State: AOAM531DT1kderKrBAf6thlsheZHUcYCet5LjiR+g69hyaIbwHioqq2x
	irLhOBsEhtUJsflEf1tF68c=
X-Google-Smtp-Source: ABdhPJyA/yFz5YEnuHQYMq2jAo+4yj/rjpmPSDOmk0s5ABaFqI8LTVjxQOfbmsisDz/sGFYc+JORIg==
X-Received: by 2002:a05:620a:201b:: with SMTP id c27mr21609831qka.279.1604439271524;
        Tue, 03 Nov 2020 13:34:31 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id j16sm19353qkg.26.2020.11.03.13.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 13:34:31 -0800 (PST)
Date: Tue, 3 Nov 2020 16:34:28 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-flake8: upgrade 3.8.3 -> 3.8.4
Message-ID: <20201103213428.GC40946@gmail.com>
References: <1604388553-74387-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1604388553-74387-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-flake8: upgrade 3.8.3 -> 3.8.4
on 03/11/2020 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../{python3-flake8_3.8.3.bb => python3-flake8_3.8.4.bb}     | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python3-flake8_3.8.3.bb => python3-flake8_3.8.4.bb} (72%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb b/meta-openstack/recipes-devtools/python/python3-flake8_3.8.4.bb
> similarity index 72%
> rename from meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb
> rename to meta-openstack/recipes-devtools/python/python3-flake8_3.8.4.bb
> index 9385c80..cc860c4 100644
> --- a/meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-flake8_3.8.4.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=75b26781f1adf1aa310bda6098937878"
>  
> -SRC_URI[md5sum] = "b11380b47468c3dc7323396d4b8c1746"
> -SRC_URI[sha256sum] = "f04b9fcbac03b0a3e58c0ab3a0ecc462e023a9faf046d57794184028123aa208"
> +SRC_URI[md5sum] = "6ab0ad6630b6917fafabded7f80344b4"
> +SRC_URI[sha256sum] = "aadae8761ec651813c24be05c6f7b4680857ef6afaae4651a4eccaef97ce6c3b"
>  
>  inherit setuptools3 pypi
>  
> @@ -14,4 +14,5 @@ RDEPENDS_${PN} += "python3-prettytable \
>              python3-pyparsing \
>              python3-mccabe \
>              python3-pep8 \
> +            python3-logging \
>              python3-pyflakes"
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 

