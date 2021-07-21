Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.40.1626899530371702458
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 13:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NN9SbZga;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id nd37so5148914ejc.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jul 2021 13:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NUP27ygMyNNplWfFELJH09wKI+9ptGbLNSuLLQWAsuY=;
        b=NN9SbZgaqXNaDt7BLW0vubSVKh3cQqSVcLcCppoag3WLTNVrbJ76BZx709DXytz0Kp
         EH4dasG3YMoKNKDwaKNKQnHqVzPiMyx9Gtj+ZZbPI4LwkFhW0AmAkNhj4+TRPBWvN4Th
         NOyi3OrGNZfPpjtyf+Tm47NQHpjfr0OZXgAx471gJ/+V4l3BFep89/SyIOVJT9K3/t9g
         3Zq8f5k6XZ84PnqEIWwabEQUSQg7iH7PuP0jcSUflJAszjboiZ2zjgdkM46R00zavscQ
         jl0Hzwvxl6YaVRcbMxYC3XvwjLxzOQKxQOFUKeSTxO2ykumrZaf9CBbBIxJObQaB4oqw
         VDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NUP27ygMyNNplWfFELJH09wKI+9ptGbLNSuLLQWAsuY=;
        b=ZAC9JIYU3wfwxJmVkUe+dYlQjad5Q1Z631WbjPqnCc2hkiSzqkGwNKTcGlKdrXeLZs
         tx8x6Mn0dLeyF/knwsmkcjxphj83eLSfTNZON9uP+8HkGPak3rO2Xpar9Hho/YqjDArn
         85fr5XWPnuiLseJNV2i/CYwUSagN0mwjfM+5HKnWFb92vi1f3+krWtWMFYSt2vyQ2UWu
         pTahdfK/6sZnWYZ11CQHzIrqunLPDpFgEBjgBQVjGWIIUvphT88SnrzDt0CYOG+xPBZs
         F0iD81zPxVEOjwgvBCa7OUSo+GlYs/Zfj8/nPyFOcTSZY36LzOHX0+sxjwjGlGaIRHlZ
         P+gw==
X-Gm-Message-State: AOAM532NNyCdvgIBK+/bCUYVS5gl93Z/OiKGB6Agv1MzoYwDagj8mfdw
	VL5jqhMkzMU1PucT30GqRwxsyTHvYEEVKBosH20=
X-Google-Smtp-Source: ABdhPJwtCflpOxgo6VwCC14FQn+Fr+uyDp8i1ddQIFl/jlXwnLl5H0hHPteTTPa0H3sOh7CZEic2hEUqmHdqW4nq6iM=
X-Received: by 2002:a17:906:d783:: with SMTP id pj3mr19730303ejb.298.1626899528920;
 Wed, 21 Jul 2021 13:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210721202955.137761-1-fib@cisco.com>
In-Reply-To: <20210721202955.137761-1-fib@cisco.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 21 Jul 2021 16:31:57 -0400
Message-ID: <CADkTA4M_d3nrJWxo7rNJjPgZMus1jz_t2-y_qrTp3A4AnNL1QQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] python3: unbreak python3-native when virtualization is in DISTRO_FEATURES
To: Ruslan Babayev <fib@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

You need to elaborate much more in this commit message. We need to
document what exactly were the symptoms, in what sort of build things
weren't working, and how this fixes it.

Cheers,

Bruce

On Wed, Jul 21, 2021 at 4:30 PM Ruslan Babayev <fib@cisco.com> wrote:
>
> Signed-off-by: Ruslan Babayev <fib@cisco.com>
> ---
>  recipes-devtools/python/python3_virtualization.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/python/python3_virtualization.inc b/recipes-devtools/python/python3_virtualization.inc
> index 55301c7..481db58 100644
> --- a/recipes-devtools/python/python3_virtualization.inc
> +++ b/recipes-devtools/python/python3_virtualization.inc
> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>
>  DEPENDS += " ncurses"
>
> -do_compile_prepend() {
> +do_compile_prepend_class-target() {
>         export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
>  }
>
> --
> 2.26.2.Cisco
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
