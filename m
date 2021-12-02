Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.4172.1638417932507000345
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 20:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cI4CZ+58;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id p19so26277453qtw.12
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 20:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ep3rCP/T8iH4funhAvxVOTfh4GB27fjRELH0mmKxAwY=;
        b=cI4CZ+58YVvLXtVSZCQimq4f1ye+rBdUIzheIRsD4R2k1FDCy9jYx5HFh0ZUaJjOoO
         KAbxCdVW3JfoigV0i2phc6OX9cZYuXWJJ4Dw9sojEH6+gSjcjT3F7G/xtiLmPHGx67lq
         SKLz8NvBQ9L7xQFXCiVUZr+PBIEVlyY0IknPS28W4Z+OkhQSROQcAyzHIRm7xJ33Bi1d
         fkHakpt/rxupIlwN8LyPsPahjiDu/xfVHPLwGT/3VQ4H5+s7uT621hUnOBPhC6JRy72D
         VTMoPEYUGkgjhuas1SmpyK//rrq3DuN+JrqET8LxG61qiIJFt3HlXd7Yrs6lwJy5ADiJ
         ryTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ep3rCP/T8iH4funhAvxVOTfh4GB27fjRELH0mmKxAwY=;
        b=Z39Vw58u5jFj/g0mv3KNBmTJKR4590KH9ZtrAdzMCHhR8Nb0X9bQ3I21RIHIBloK6P
         W2crIpVA9+t6FGGJzyHUSlXnqRTbwXOB3mx3cxm1DaG1HcNlTS3vVhAy5DL9ptZxZPA6
         I9/56qXVAyXchRIdhi0I2EVZ92zfpNhKd9DUr6nhvNhr5t4Nst8fqhpx/4jhUVl41rsZ
         IdO9wfcfpKGLCJGHfZcpbqFmO0c6L7FpwKCysJNy3kfxmXJvrn6BObaY/EApYWLzZS4P
         MyM889fbvBJqFocwsvKFegaY8EBDY+suilzjNJw1N06OH+NQvPZbrzA4brO4PgMoCObu
         UDgg==
X-Gm-Message-State: AOAM533kOEYo8gY+DpuEQYoIwj0Y/8+4NmoRkNFGZehg4Ujnx8UGX01o
	PNqoHB96zSi+EXhV1xwS4tU=
X-Google-Smtp-Source: ABdhPJz0LNftCduk89xWgQQN1kb3Z7zBy7ajqyL+Avnam6gr0rDbjXSnl7qYHDd4kpQboxD8BgRzDg==
X-Received: by 2002:a05:622a:164e:: with SMTP id y14mr11571961qtj.647.1638417931574;
        Wed, 01 Dec 2021 20:05:31 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id z16sm850106qki.25.2021.12.01.20.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 20:05:31 -0800 (PST)
Date: Wed, 1 Dec 2021 23:05:29 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][hardknott][PATCH 01/13] uxen: update guest tools to 4.1.8
Message-ID: <20211202040528.GB17427@gmail.com>
References: <20211201164136.33802-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211201164136.33802-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

all 13 are merged to hardknott.

Bruce

In message: [meta-virtualization][hardknott][PATCH 01/13] uxen: update guest tools to 4.1.8
on 01/12/2021 Martin Jansa wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  ...xen-guest-tools_4.1.7.bb => uxen-guest-tools_4.1.8.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename recipes-extended/uxen/{uxen-guest-tools_4.1.7.bb => uxen-guest-tools_4.1.8.bb} (63%)
> 
> diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
> similarity index 63%
> rename from recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> rename to recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
> index 4dcfe51..2ca0cb1 100644
> --- a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> +++ b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
> @@ -6,17 +6,17 @@ LICENSE = "GPLv2"
>  COMPATIBLE_HOST = '(x86_64.*).*-linux'
>  
>  SRC_URI = " \
> -    https://www.bromium.com/wp-content/uploads/2019/06/uxen-vmsupport-linux-${PV}.zip;name=uxen \
> +    https://www.bromium.com/wp-content/uploads/2019/11/uxen-${PV}.zip;name=uxen \
>      https://www.bromium.com/wp-content/uploads/2019/11/Bromium-4.1.8-Open-Source-Software.pdf;name=license \
>      file://fix-Makefile-for-OE-kernel-build.patch \
>      "
>  
> -SRC_URI[uxen.sha384sum] = "d9d7a1fa5c44ac77eea3d8d4756f9e07fc02acfe12606325ff0bb8a60c07abc3e9ddb80c2039797fb2122d750219722f"
> +SRC_URI[uxen.sha384sum] = "be2233bc6506a23350d76c03ac28ea7ea381e1dc6ed5ce996e8ac71e6a3316fcaa2ed070c622618bd226f43a4d6db5d4"
>  SRC_URI[license.sha384sum] = "92e48c614df3094cb52321d4c4e01f6df5526d46aee5c6fa36c43ee23d4c33f03baa1fc5f6f29efafff636b6d13bc92c"
>  
>  # The software license is GPLv2: please see page 199 of the pdf document
> -LIC_FILES_CHKSUM = "file://../Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df6ffa417b36f870a9997650049"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df6ffa417b36f870a9997650049"
>  
> -S = "${WORKDIR}/uxen-vmsupport-linux-${PV}"
> +S = "${WORKDIR}/uxen-${PV}-72a4af9/vm-support/linux"
>  
>  inherit module dos2unix
> -- 
> 2.32.0
> 
