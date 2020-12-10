Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.21004.1607633901843770284
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 12:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F2zB/dtU;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	by mail.yoctoproject.org (Postfix) with ESMTPS id F3A9138C13A4
	for <meta-virtualization@yoctoproject.org>; Thu, 10 Dec 2020 20:58:20 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id z11so6354380qkj.7
        for <meta-virtualization@yoctoproject.org>; Thu, 10 Dec 2020 12:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=2Gx8Rtafqtej8+6EI868xykNW7qpuGBQzDfo6LYq0DY=;
        b=F2zB/dtUz+ZdnmjZsXdveyvIg5j1OSa48LLMvR6z4srj/TvCowQmApxTV9CL+NlE+y
         JQC1WzcZS++H9jjwY3xIV/bun7akflCC4CQW0lpuW5uBZx4KOXgWzJ4Xs7PVDC7UgqOJ
         twJ3n5Mbhxz8rBP94aRT6n0Nfc7X+mLYQnLlAxlXlGEQmJafDHcpoeVIrzFRceM08Tgp
         L02147IEaM+12Vgquf1nsRhX5MkDRjMXutJAlWLyg9OpYD6jIEMTgLE4228RoCZClSE4
         /t48NPLyqpRVQSslI7nk/ifQt7F8tUoFmiVdmifqm27rlZ5CUkHY3uFpMl9FQGNxn62x
         jZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2Gx8Rtafqtej8+6EI868xykNW7qpuGBQzDfo6LYq0DY=;
        b=FBz3AJ4jKsIcntIsx/UsCKNkDygo4oxaLP+7GkWBcsox4fL9zQnpABJir1L5uCtJBj
         JFvvIpxI1zm1GZdPnjaXVwAus9cD2sMt37NYWZzlynpsWj7RPs9uGc3KmuGKuAh2grvC
         Z4LgHcPq4CPyu+V0PP9KRf7BZ6UokPN4Csj1JW5oFjuZ/zGcW8cqx0ASrHULrFkanqvq
         NC1jHPi4CM1LYF4j0S8mkoG0wUAmbzR7sjMR378diESQc5QY0cd2xIFtNsNgAB3nfYEw
         OzU1+/IjRrbAoOzr3R2D1Ml1mpHRUhSuAArTk6vRxzWx+Z/mb44KtHqR0HT07i1ePkAn
         pL/Q==
X-Gm-Message-State: AOAM5320zsqHwM5OZEyTdnKfTRJjpQT7U83kbnKtviYC37+fZdoyr5uc
	B1FzNEKsIyDF4ZNBLInudnE=
X-Google-Smtp-Source: ABdhPJya54ujPk6E7plAMrP2Mgjc5erHtMOTBAzvXkJdez64oV0O93L9DP50hxZ7JGKz6bulBJke4A==
X-Received: by 2002:a05:620a:22ab:: with SMTP id p11mr11551758qkh.237.1607633899734;
        Thu, 10 Dec 2020 12:58:19 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id h25sm250380qkh.122.2020.12.10.12.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 12:58:19 -0800 (PST)
Date: Thu, 10 Dec 2020 15:58:17 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-oslo.config: upgrade 8.2.0 -> 8.4.0
Message-ID: <20201210205814.GA4078@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1607403076-8810-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1607403067-8740-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1607403086-8877-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1607403218-8956-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-oslo.config: upgrade 8.2.0 -> 8.4.0
on 08/12/2020 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...ython3-oslo.config_8.2.0.bb => python3-oslo.config_8.4.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-openstack/recipes-devtools/python/{python3-oslo.config_8.2.0.bb => python3-oslo.config_8.4.0.bb} (87%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb b/meta-openstack/recipes-devtools/python/python3-oslo.config_8.4.0.bb
> similarity index 87%
> rename from meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-oslo.config_8.4.0.bb
> index 6898a1f0..3b89b51a 100644
> --- a/meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-oslo.config_8.4.0.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
>  
> -SRC_URI[sha256sum] = "116ff3a7b98b0309b083af7906d99f8c6bea67df5ee03a85e2ac02700dd75d30"
> +SRC_URI[sha256sum] = "537d62c581de2227aebfc4c71ee6fb455b853be920e0b30b65ebbe8d8128725c"
>  
>  inherit setuptools3 pypi
>  
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


