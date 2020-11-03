Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web09.3583.1604365116406237245
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 16:58:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=THxR5QqN;
 spf=pass (domain: gmail.com, ip: 209.85.167.193, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f193.google.com with SMTP id j7so16653657oie.12
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Nov 2020 16:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r4IVqqEI5pfKzRLln1CaPWDQ6wP81Rt9EmkaR26xbTw=;
        b=THxR5QqNmC5XNeeS0dff1o3PDF+EthNavMMPzW+y4F4/6O3O25AV0SdhBdxbbY/KZb
         VjTkwVIVzbwzYQnWJlvJvvng+A3Ob/eo5cXtKqG5IoB+p/w+RDcO8jCtY6txp2PgAbHZ
         HqdJjTaebS5Cx+zV8qAIaNjNkclErse1bQmAKU3AOIopX7eSQwJk/aEtcn0K5sz5KpSf
         RPnMTg7j8mZu7zvlw5MT5BaN2Fo8ai0Ta1krFpMOtSbqo6hPvz+A2Gj6h+ySftTnRKTz
         7I2x1ONrgztzTEmp46XeSX8AQ6aQgfhN70qE5yxAsEHTxn3TtNr8YwxjWwN7tsaAUG8R
         3tvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r4IVqqEI5pfKzRLln1CaPWDQ6wP81Rt9EmkaR26xbTw=;
        b=JVFZkVqMVWp13zVPhWAzkHJGkNJpEeJMWhhsBkyKinM1G/Q9dazU5ckGq9h1ypZNvZ
         fnu6muqifirdUdNu/ztHMACZgwMVh9ugzFifzKf68Uq2kC0fgNkGuZsQriDfQRuMC7wc
         Drs4ztwk/S1+ay/zBrzvOpnoJwY5VuYQhtsUM8sV8DfoaN24vk3Ubl8p7qsOdkIGk4g2
         IU66f2UAZTU25gSCYxEY+fozQ6jrwEovF4A0FzY2ELbeWzdvTL6Fjhs68HYAn/rB5YeK
         6c6VlY1PhOdI6Xz4lv7wWpeFQ5kiKsh6aOSKsPrbhl5bJARL2KpcZDbQbvW5ptK466Yx
         gTkA==
X-Gm-Message-State: AOAM532QEp57ijdrBhwqd1IV+9lWW7oDizL/epeyYGbT/mw18mhuwV2f
	A6F5qxuHNKFhrN/WsFXLkLpecCsy0Ln8rWvKosc=
X-Google-Smtp-Source: ABdhPJzBv2IFNsP5L0LcrjtO8XSCQ5lShTrK7dlM87D4WPOTyEOjloT/sr3BLRq7dHjBkw7m/TO/G6QjaxsvvsAcxKA=
X-Received: by 2002:aca:d941:: with SMTP id q62mr528101oig.33.1604365115715;
 Mon, 02 Nov 2020 16:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20201102081357.4975-1-diego.sueiro@arm.com>
In-Reply-To: <20201102081357.4975-1-diego.sueiro@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Mon, 2 Nov 2020 16:58:23 -0800
Message-ID: <CACMJ4GZmT9Vgf4n8KKdy8YmATw+5dwiVNo-5o+7dUR46spY1-Q@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2 2/2] xen: extend SYSROOT_DIRS to include installed binaries
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>, 
	Doug Goldstein <cardoe@gentoo.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 2, 2020 at 12:14 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> If a recipe DEPENDS on xen we should include its binaries in the sysroot.
> The do_install task also ships files to /boot and /usr/lib64. Hence, extend
> SYSROOT_DIRS to include these paths.
>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

> ---
> Changes in v2:
>    - Updated commit subject and message
>
>  recipes-extended/xen/xen-hypervisor.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
> index 6a75d16..916bd3c 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -55,6 +55,8 @@ do_compile() {
>  do_install() {
>      oe_runmake DESTDIR="${D}" install-xen
>  }
> +# The do_install also ships files in /boot and /usr/lib64
> +SYSROOT_DIRS += "/boot ${exec_prefix}/lib64"
>
>  do_deploy() {
>      install -d ${DEPLOYDIR}
> --
> 2.17.1
>
