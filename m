Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.4043.1604439067322374365
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 13:31:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pwZBQOL9;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id bl9so8691435qvb.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Nov 2020 13:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=tHJX15bivAC7vWTyFRqYFfTYJK/axGIBXlgtUgY7lr8=;
        b=pwZBQOL92LtHLXrsH+dqeXlUThX1QVSB/ObGImdfVwFhdsMh/0pIbtfCP15jDPg6Xm
         VDgdK++Rn5dQJ600Oi5v4hcz5HdAFbYEGF9dAnOQvIi0p4K3lJ7qF8T0uHw1LtAZ6IUW
         xFLG3JmRPf6rvPgYtxeEBmqdbPgW0o3cWUrPoCxoBgZmfLIuIkfKXCJbKl34sC8MGbTj
         ZiPzgekP5JCLwh5AywkatRz3sFC4TK94bSZaSRqlRYpfW/4MmgqLEv6D4sUe1mcWQ/wy
         EK7LUk2ND3auar3v2wG62YwHfUimVrdbHey7wQnErhSYfuFVT0NihLNK0RTfHQoXD+mq
         sv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tHJX15bivAC7vWTyFRqYFfTYJK/axGIBXlgtUgY7lr8=;
        b=JcXeFmibwkzIc5U6u4yGZAwD05mAmiEls/DCLGgBubJr9NM1maEHDI4BDOQ2KaRAqI
         Ap5Gv+fXHB5/+9MrdNixXuKDdd7RJs3AcvnSao821TmhTUSpNYdQcbabwMLFcA0aUlsB
         HL0+SKyvdkr/QCqN6HceggR0tdGVtb+BTLqTDSf55zIRWN92BHDNpO/9SRmzX/9LLWDP
         TlGAjB/3gzIIqseeALgiNKu+GCAjtkELdzfznYgVtPgKd3esdL4SEc3HGQ5uRV/T4d+H
         qyf00sOjOMtOSC/PjcKcTqOSs45P248gjrA2TR/OzOw58Q6lqXEPWWqCYEgrLV3AjJsh
         L9uA==
X-Gm-Message-State: AOAM531kXUa6KNZ26oyevfDcJJW4U2T/+L7/2c6UBFMov1zj12m0KDG5
	N2fH996cUYJpYRltQWUB7WbvCJGz3lTD6tHF
X-Google-Smtp-Source: ABdhPJyCcA2nfzmwgv7NZGj9i4juFp85tzUZukf5mzqZ85Kcox5ErgBQdqYwExzY2pGudwFu9jWSUQ==
X-Received: by 2002:ad4:5448:: with SMTP id h8mr21979466qvt.49.1604439066429;
        Tue, 03 Nov 2020 13:31:06 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id k64sm11936914qkc.97.2020.11.03.13.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 13:31:05 -0800 (PST)
Date: Tue, 3 Nov 2020 16:31:03 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Ricardo Salveti <ricardo@foundries.io>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 1/2] python3-docker: upgrade 4.2.1 to 4.3.1
Message-ID: <20201103213102.GC40662@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201030231444.26695-2-ricardo@foundries.io>
 <20201030231444.26695-1-ricardo@foundries.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the changelog / summary .. super important to log these
things, and it made my merge that much easier.

This is now merged

Cheers,

Bruce

In message: [meta-virtualization] [PATCH 1/2] python3-docker: upgrade 4.2.1 to 4.3.1
on 30/10/2020 Ricardo Salveti wrote:

> Release notes for 4.3.1:
> - Miscellaneous
>   - Set default API version to auto
>   - Fix conversion to bytes for float
>   - Support OpenSSH identityfile option
> 
> Release notes for 4.3.0:
> - Features
>   - Add DeviceRequest type to expose host resources such as GPUs
>   - Add support for DriverOpts in EndpointConfig
>   - Disable compression by default when using container.get_archive method
> - Miscellaneous
>   - Update default API version to v1.39
>   - Update test engine version to 19.03.12
> 
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> ---
>  .../{python3-docker_4.2.1.bb => python3-docker_4.3.1.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-devtools/python/{python3-docker_4.2.1.bb => python3-docker_4.3.1.bb} (76%)
> 
> diff --git a/recipes-devtools/python/python3-docker_4.2.1.bb b/recipes-devtools/python/python3-docker_4.3.1.bb
> similarity index 76%
> rename from recipes-devtools/python/python3-docker_4.2.1.bb
> rename to recipes-devtools/python/python3-docker_4.3.1.bb
> index 32b24eb..f873ca6 100644
> --- a/recipes-devtools/python/python3-docker_4.2.1.bb
> +++ b/recipes-devtools/python/python3-docker_4.3.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/docker/docker-py"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
>  
> -SRC_URI[md5sum] = "65111a1e4a2ab83d2ba104cdb17f1326"
> -SRC_URI[sha256sum] = "380a20d38fbfaa872e96ee4d0d23ad9beb0f9ed57ff1c30653cbeb0c9c0964f2"
> +SRC_URI[md5sum] = "ce28bd52fe2e33a26394693f01199e6c"
> +SRC_URI[sha256sum] = "bad94b8dd001a8a4af19ce4becc17f41b09f228173ffe6a4e0355389eef142f2"
>  
>  DEPENDS += "${PYTHON_PN}-pip-native"
>  
> -- 
> 2.28.0
> 

> 
> 
> 


