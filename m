Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.29203.1591620674239077861
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 05:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cGGnJxqc;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id m32so8146792ede.8
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Jun 2020 05:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RuCpdhVUJoiRjP+y5XBBj31JhUua8YMJHfHdCcFHd9o=;
        b=cGGnJxqc/pEbGuinjzaZYyqBLkA11Q2D3jRPBo1DIHo4lp18tfYEEsCBh0gE6j71Nh
         4JT14Y8vKKQ4kZF6SmjlyTnL+2+JB3Zmm+QgjzNZ5TUKlmP1JCPIO+zvblbKee4yKeCz
         /T/GnyOg1XljMWX/fyXceY5A8waio1GfdE0vhHu7Rxk70s59kCo7LFyJO1xWQsXVzY9b
         QpHAcNwNkCvWhDqRSyl3nGMkq1Yi7O/DL7lQbIcQ7tTMXAA0Ug14Z5syxMmXNre3jHr0
         im9IzRXvBnGIRZycXKC/YUvFbGymCBRTQPErBfLzflXav0RHPHjCJjMixNqHijdQY283
         50jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RuCpdhVUJoiRjP+y5XBBj31JhUua8YMJHfHdCcFHd9o=;
        b=FMcUxY8W9x3azEBHHEifpOZ/02iJursWsGnkhJUdb9YAk+GgeioX64I8tXjun0vrGH
         KqMJqT+qnzNO1rNH3Kpw3ZPuGqelwzk5ua0zjHu1W6xA4L6r5PhN6Bc/fLAS231UqjtW
         /yT3ioe1GNpOKi/RCvXS7w6ikWWDIrkdKniMasXXjl9900fqE2e10L1sqzIRsPo15pQQ
         tJkQPaZAYFtJJNg1r/x7LHRFvj5VyD5zFMhBylbstn15TwxtDcM/TeT3cD3MiYw0hZwK
         PqwqLWIrBe1NYBF3q6bh1ylVEMZav42njamSaO5pVO1u5if0z3PyNrg6WZlNO+NQ0PRh
         0NeA==
X-Gm-Message-State: AOAM533RFmKfQ/6jVwF4jsJCSh7WMPz7ZrtY5E6WXXlh3txeR6sL82GY
	J6N0qqlajeBgK4h8kHbztCvNoF3bP8NXIGpDO+w=
X-Google-Smtp-Source: ABdhPJzLPDsrbCobXCC7y++1kydU+2O65nQ2T5+psUlqsKUsGXInhDFabzYXptbTvgH8Lb8gBuE5ILKZXT/JwucS66g=
X-Received: by 2002:a50:c181:: with SMTP id m1mr1928675edf.27.1591620672496;
 Mon, 08 Jun 2020 05:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200608034208.112106-1-Qi.Chen@windriver.com>
In-Reply-To: <20200608034208.112106-1-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 8 Jun 2020 08:51:01 -0400
Message-ID: <CADkTA4NRgWpEiWKp6HyosJPgBMMs01n_=Zo_isLdraEa3DAuEA@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] meta-openstack: be compatible with dunfell
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hmm.  I already did a patch for this, it looks like I forgot to push it :(

Bruce

On Sun, Jun 7, 2020 at 11:42 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-openstack-aio-deploy/conf/layer.conf             | 2 +-
>  meta-openstack-compute-deploy/conf/layer.conf         | 2 +-
>  meta-openstack-compute-test-config/conf/layer.conf    | 2 +-
>  meta-openstack-controller-deploy/conf/layer.conf      | 2 +-
>  meta-openstack-controller-test-config/conf/layer.conf | 2 +-
>  meta-openstack-qemu/conf/layer.conf                   | 2 +-
>  meta-openstack-swift-deploy/conf/layer.conf           | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta-openstack-aio-deploy/conf/layer.conf b/meta-openstack-aio-deploy/conf/layer.conf
> index f3d2c5f2..c8bdaff5 100644
> --- a/meta-openstack-aio-deploy/conf/layer.conf
> +++ b/meta-openstack-aio-deploy/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "openstack-aio-deploy-layer"
>  BBFILE_PATTERN_openstack-aio-deploy-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-aio-deploy-layer = "6"
> -LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "thud warrior zeus dunfell"
>
>  LAYERDEPENDS_openstack-aio-deploy-layer = " \
>         core \
> diff --git a/meta-openstack-compute-deploy/conf/layer.conf b/meta-openstack-compute-deploy/conf/layer.conf
> index e25cf3e0..3d700330 100644
> --- a/meta-openstack-compute-deploy/conf/layer.conf
> +++ b/meta-openstack-compute-deploy/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "openstack-compute-deploy-layer"
>  BBFILE_PATTERN_openstack-compute-deploy-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-compute-deploy-layer = "6"
> -LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "thud warrior zeus dunfell"
>
>  LAYERDEPENDS_openstack-compute-deploy-layer = " \
>         core \
> diff --git a/meta-openstack-compute-test-config/conf/layer.conf b/meta-openstack-compute-test-config/conf/layer.conf
> index dfa5f31b..b082d609 100644
> --- a/meta-openstack-compute-test-config/conf/layer.conf
> +++ b/meta-openstack-compute-test-config/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-compute-test-config-layer"
>  BBFILE_PATTERN_openstack-compute-test-config-layer := "^${LAYERDIR}/"
>  # We want this layer to have higher priority than any other meta-openstack layers
>  BBFILE_PRIORITY_openstack-compute-test-config-layer = "100"
> -LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "thud warrior zeus dunfell"
>
>  LAYERDEPENDS_openstack-compute-test-config-layer = " \
>         openstack-compute-deploy-layer \
> diff --git a/meta-openstack-controller-deploy/conf/layer.conf b/meta-openstack-controller-deploy/conf/layer.conf
> index e8be8321..e9786313 100644
> --- a/meta-openstack-controller-deploy/conf/layer.conf
> +++ b/meta-openstack-controller-deploy/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "openstack-controller-deploy-layer"
>  BBFILE_PATTERN_openstack-controller-deploy-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-controller-deploy-layer = "6"
> -LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "thud warrior zeus dunfell"
>
>  LAYERDEPENDS_openstack-controller-deploy-layer = " \
>         core \
> diff --git a/meta-openstack-controller-test-config/conf/layer.conf b/meta-openstack-controller-test-config/conf/layer.conf
> index b81f21e0..695767d1 100644
> --- a/meta-openstack-controller-test-config/conf/layer.conf
> +++ b/meta-openstack-controller-test-config/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-controller-test-config-layer"
>  BBFILE_PATTERN_openstack-controller-test-config-layer := "^${LAYERDIR}/"
>  # We want this layer to have higher priority than any other meta-openstack layers
>  BBFILE_PRIORITY_openstack-controller-test-config-layer = "100"
> -LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "thud warrior zeus dunfell"
>
>  LAYERDEPENDS_openstack-controller-test-config-layer = " \
>         openstack-controller-deploy-layer \
> diff --git a/meta-openstack-qemu/conf/layer.conf b/meta-openstack-qemu/conf/layer.conf
> index 98a35b40..8f6378d9 100644
> --- a/meta-openstack-qemu/conf/layer.conf
> +++ b/meta-openstack-qemu/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "openstack-qemu-layer"
>  BBFILE_PATTERN_openstack-qemu-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-qemu-layer = "6"
> -LAYERSERIES_COMPAT_openstack-qemu-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_openstack-qemu-layer = "thud warrior zeus dunfell"
>
>  LAYERDEPENDS_openstack-qemu-layer = " \
>         core \
> diff --git a/meta-openstack-swift-deploy/conf/layer.conf b/meta-openstack-swift-deploy/conf/layer.conf
> index e9675e28..e48aa601 100644
> --- a/meta-openstack-swift-deploy/conf/layer.conf
> +++ b/meta-openstack-swift-deploy/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "openstack-swift-deploy-layer"
>  BBFILE_PATTERN_openstack-swift-deploy-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-swift-deploy-layer = "6"
> -LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "thud warrior zeus"
> +LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "thud warrior zeus dunfell"
>
>  LAYERDEPENDS_openstack-swift-deploy-layer = " \
>         core \
> --
> 2.21.0
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
