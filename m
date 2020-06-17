Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.2032.1592353851761160783
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 17:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aulokXdu;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id fc4so253616qvb.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jun 2020 17:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g3nEcwwoVjohernP/CYqZODka00YOYfu64ZDvrIbyi4=;
        b=aulokXduAXCDuf+SVKF+RIyIUKdq7our/7ePwPVJw3LoBSxvcExr8z4iOhvQzmFQbo
         B6y/Ei+B4qsq8d61Tr8CDUlfkdSSEe46RSugpCDb1Moq6L4OCqEVTeZiFuV0fBKsJQOs
         SeCGPiL/39sDEsqq7DzyhnPQdt4nEadKU6zgPcJZfuz0ALFtm1uz9IW7cuQY7KZXa81p
         gjQX6GhDOfcFrsldprrimBU4O8/6tnql62jkEqqeCo2lQq5oNBvuTyGl2HsGaLvATMRI
         OraLW0xsN6N8AAT+8pnsmb68qhXeu27NqRJE1WmtWxoGi9TxUtIRBwoTJyiHFuEJfDyI
         ykaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g3nEcwwoVjohernP/CYqZODka00YOYfu64ZDvrIbyi4=;
        b=CpFtrttXV+v+7xaKhPoD64K/2ndTcAZaiwXsmDfz1NCvmwI/0WVQc4Wo6y+ZejKuqv
         w1+lABvErJ1u9Zw08d57Thhu34LRnIcoqosNVR3SOtekruMczAZILRhMUz0yO1mWIjun
         sYOQGU5rwQqBvJ21pM7nsaGeUpt85wZVh9NpPoFDzBNEq8CWO3tT2Ju7/EegmFvCohez
         A3OxL1qLbt0t4hnIzX0HmXqBfLrjkHQcXB77PocpZYZbYTHD7LJc9T0qe0+JXk+c91kt
         yn0ws171F6FWw7KhUtm5HeYMBMSGqXy8odpBY6NqoGgSA+LpwYmcREK+wxVndPFrfu3S
         riCA==
X-Gm-Message-State: AOAM533vdfuhv6CjjwJ/9xDNrmQBWsow0usR6sAmPyDAe0he8kC5ZpfS
	QdLB5hKCJOY3vnDUt6TrsDc=
X-Google-Smtp-Source: ABdhPJxZ4OF2hluoRyBmkYn0+gT/Cb46t+qz7zSNLfgctbIdp/E8OTKkO2U7+8toVaVYFxQRarBmiQ==
X-Received: by 2002:ad4:4b25:: with SMTP id s5mr5024798qvw.212.1592353850900;
        Tue, 16 Jun 2020 17:30:50 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id u25sm17189860qtc.11.2020.06.16.17.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 17:30:50 -0700 (PDT)
Date: Tue, 16 Jun 2020 20:30:48 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-dockerpty: add the missing rdepends
Message-ID: <20200617003047.GB5020@gmail.com>
References: <20200610054338.3566915-1-mingli.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200610054338.3566915-1-mingli.yu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-dockerpty: add the missing rdepends
on 10/06/2020 Yu, Mingli wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Add the missing rdepends to fix below error:
>  # python3
>  [snip]
>  >>> import dockerpty
>  [snip]
>  ModuleNotFoundError: No module named 'ssl'
>  ModuleNotFoundError: No module named 'fcntl'
>  ModuleNotFoundError: No module named 'six'
>  ModuleNotFoundError: No module named 'tty'
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-devtools/python/python3-dockerpty_0.4.1.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/recipes-devtools/python/python3-dockerpty_0.4.1.bb b/recipes-devtools/python/python3-dockerpty_0.4.1.bb
> index 31a864a..cde2d12 100644
> --- a/recipes-devtools/python/python3-dockerpty_0.4.1.bb
> +++ b/recipes-devtools/python/python3-dockerpty_0.4.1.bb
> @@ -7,3 +7,10 @@ inherit pypi setuptools3
>  
>  SRC_URI[md5sum] = "028bacb34536f3ee6a2ccd668c27e8e4"
>  SRC_URI[sha256sum] = "69a9d69d573a0daa31bcd1c0774eeed5c15c295fe719c61aca550ed1393156ce"
> +
> +RDEPENDS_${PN} += "\
> +  ${PYTHON_PN}-fcntl \
> +  ${PYTHON_PN}-io \
> +  ${PYTHON_PN}-six \
> +  ${PYTHON_PN}-terminal \
> +"
> -- 
> 2.24.1
> 

> 

