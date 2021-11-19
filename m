Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.8897.1637328548308606536
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 05:29:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hey4QkLV;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id x15so42804413edv.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Nov 2021 05:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mvvj6BRp/Up+CTfypG7LIGIfbK9jj7tO3VThOTbW9fA=;
        b=Hey4QkLVrBgcfO+P9Q9OcEIprJRh0t6bnyrro8aWrLnq0Lw7QPQmi2Y8x2+Tl9Adt/
         8NFrEmAh/fHoLPJ6BTtnCXY3ZwhZ0h4F/zysnhvF8eKArpOfjCYJtL9AWRkpI8qulIlw
         gXT3FH1niJf2GtarpIqtzHSO8NmFGpZOUtU97Jogujj8LkvAgBNBQgDMrwLV+Xau3SgO
         n1DTClwm+HrWp72P/MBRTDtdIapnvPkRmHpAOZJMROsZtBabs1skTHGacJTjLi+TLQ6k
         4JkHf7gie6ppcN6FROuL3F4jttwEp0xggUsGedemqQKuqplsU4YYVuLCRTxHuhfC4Ssn
         kv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mvvj6BRp/Up+CTfypG7LIGIfbK9jj7tO3VThOTbW9fA=;
        b=wmKv6xJCjtJM04Es6gU4JlHgqrdkv+6ycHwgyT4hBAq061GvZaxgaSAOLalc3we5KY
         18NALNghZ/lDQo/+64uhCbJVgTskTH/eJoDk6nf0DaEijU8hN9CD/ZxUmcaeOwKI7gmX
         53hYoIXLqEzyhmDDE4w5gXWXI5vw8vB3sLYlPTNsuhkF7vHVFSWYD/FbYMKgEGoULeR/
         +fCZWQW9GrFWTInefwEWotxSj6pii90v2N4Duuclo/aLp0U+yqTIqxNw70lJZbZBJdCF
         LxiIqSo5wXZxAmc5rF/RhtLUOa2/mAFtNjLlRGjlJ8i4bw7STOrgAGyk4ZgQLZl5e2xh
         gAkw==
X-Gm-Message-State: AOAM532liy39sz+iSlLj374Ie0p6dvGLMpQUhZMUAiQpnnUw3pVDUknX
	YU1jnS399sw3OuF+BPGpH61l1ouGpGY/CIwQ43k=
X-Google-Smtp-Source: ABdhPJxthvqMTs1HAottxSQ0UFuqyGzgEYIPGq4GSYfOzufwKQlRtpfmzr6yY+glb8VHgzeNQmwlrSSQIwtKQ8FrWFY=
X-Received: by 2002:a17:906:4fc4:: with SMTP id i4mr8323882ejw.81.1637328546641;
 Fri, 19 Nov 2021 05:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20211119072841.20701-1-kai.kang@windriver.com>
In-Reply-To: <20211119072841.20701-1-kai.kang@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 19 Nov 2021 08:28:55 -0500
Message-ID: <CADkTA4NAUG-nOW9s9yiLSiYstJsD+0yFSR7B+C+adSh-ML=8OA@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] openstack-image-aio: fix warning of operator remove combined with +=
To: kai <kai.kang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, Nov 19, 2021 at 2:29 AM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Fix warning of openstack-image-aio:
>
> | WARNING: /path/to/meta-openstack/recipes-extended/images/openstack-image-aio.bb:
> |   IMAGE_ROOTFS_EXTRA_SPACE:append += is not a recommended operator combination,
> |   please replace it.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-openstack/recipes-extended/images/openstack-image-aio.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-extended/images/openstack-image-aio.bb b/meta-openstack/recipes-extended/images/openstack-image-aio.bb
> index 858c8e99..f01d0ed5 100644
> --- a/meta-openstack/recipes-extended/images/openstack-image-aio.bb
> +++ b/meta-openstack/recipes-extended/images/openstack-image-aio.bb
> @@ -27,7 +27,7 @@ inherit identity
>  inherit monitor
>
>  # check for 5G of free space, so we use 5G as a starting point.
> -IMAGE_ROOTFS_EXTRA_SPACE:append += "+ 5000000"
> +IMAGE_ROOTFS_EXTRA_SPACE += "+ 5000000"
>
>  POST_KEYSTONE_SETUP_COMMAND = "/etc/keystone/hybrid-backend-setup"
>
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
