Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE361C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 19:30:43 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.1592.1648063843282495091
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 12:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=SO6rqRNQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id k125so1932750qkf.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 12:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ol3g7s2SjdILeYy+3v8odLiZUw3I/aL4mmPyIhVKQbQ=;
        b=SO6rqRNQEbbSvT4vW/9O6BOdLtQnizZkoCrg4Urv5rK1q/V75JKh+GP4Y7yZyfN+Yc
         /YO3iXQEtiZt4+bmo4wpe5jP37pX7LlhgDW1xF9tcdcjQTz74hd2ka1sQJnuBk8e+mYE
         PDbFK/NGVSTI6q50LgsiMsUAq8kSxYvFOe0N9L9GUB6N3oHguwHeaQqMUI5ma8wJ6C++
         Wdmf7dp2Y6uzi+MFtqtZHxnnmICYBu+uxO+AG5DV/ZdGjppKuHd31sVmwPAiSL3zy0cO
         9VfKJuSGUh19YJ8p8cQ/WP1ZCueCIpuFwpRDi2931XfjLrQndqiXzc85zuDBhED94spR
         VdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ol3g7s2SjdILeYy+3v8odLiZUw3I/aL4mmPyIhVKQbQ=;
        b=6DE92KkjOj+it8/rhzK+agtNHXAPCzKmrPg/m6eIDu56xA0Td0OtNfHT5xq2mQWpq/
         YSdrYyCddplNw9iv5Ha1P9SU1nQbNq0DnXEPjj5ZIAUde9dXqCi05SMPGZG9Tvqmh5iZ
         9T5YAx95cyddZ09LihoYm42S6MKUgLnQDW4HIBFTvYc5xxRpZc8+cHEFlRTi3ptW8QIm
         Db45i5rvZrseZd+Mk2ZzynHnU0TseqNQwVSBW757yGYcbk8ek8UwAPDZR1lxoY8VNrwt
         clDqnGo1PsUVycG7vy0SDWupRR24afkbClbEahWn9C+Jjby9yNpJOWDFCIJfUHKzioke
         6KSQ==
X-Gm-Message-State: AOAM533C/rOP6NasttCs6s3odHO7IEl/E7wEHCqXoQL8xayQxgTcFLoh
	TK4HfcJhpkZm6HfjYzaWxsI1NqG0R9Oj0zC/RTH4RQ==
X-Google-Smtp-Source: 
 ABdhPJzKi9lDOumwgc3GxR30YPxtbYsmhMz7Geyy80fIcpR7UeJCUz+fUtug/Fys4mlwthXdJmb76mtj/Vx4crfFqoU=
X-Received: by 2002:a05:620a:4007:b0:67f:65fe:974b with SMTP id
 h7-20020a05620a400700b0067f65fe974bmr1082184qko.560.1648063842169; Wed, 23
 Mar 2022 12:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220323173336.1284452-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220323173336.1284452-1-richard.purdie@linuxfoundation.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 23 Mar 2022 15:30:31 -0400
Message-ID: 
 <CAPoiz9w++T9T4Tq7VB-b54QfyGj2CC67TZwDY8dCUzBPN2kWzg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] python3-sphinx: Drop as newer recipe
 merged to OE-Core
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Mar 2022 19:30:43 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7110

Good fix.  Please pull this in, as it is causing autobuilder errors
See https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/601/steps/23/logs/stdio

Thanks,
Jon

On Wed, Mar 23, 2022 at 1:33 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> A newer version of this was merged to OE-Core and there shouldn't be a hard
> version dependency in meta-virtualization so this can be droped from here.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  recipes-devtools/python/python3-sphinx_4.2.0.bb | 11 -----------
>  1 file changed, 11 deletions(-)
>  delete mode 100644 recipes-devtools/python/python3-sphinx_4.2.0.bb
>
> diff --git a/recipes-devtools/python/python3-sphinx_4.2.0.bb b/recipes-devtools/python/python3-sphinx_4.2.0.bb
> deleted file mode 100644
> index 01f36ea..0000000
> --- a/recipes-devtools/python/python3-sphinx_4.2.0.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -DESCRIPTION = "Python documentation generator"
> -HOMEPAGE = "http://sphinx-doc.org/"
> -SECTION = "devel/python"
> -LICENSE = "BSD-2-Clause & BSD-3-Clause & MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=82cc7d23060a75a07b820eaaf75abecf"
> -
> -PYPI_PACKAGE = "Sphinx"
> -
> -SRC_URI[sha256sum] = "94078db9184491e15bce0a56d9186e0aec95f16ac20b12d00e06d4e36f1058a6"
> -
> -inherit setuptools3 pypi
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7109): https://lists.yoctoproject.org/g/meta-virtualization/message/7109
> Mute This Topic: https://lists.yoctoproject.org/mt/89981297/3616920
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>

