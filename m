Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.11831.1631881617887337047
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Sep 2021 05:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=otQexVG1;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id g21so29402601edw.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Sep 2021 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dkRwrKHLC5kMeJov5D+V9X1cke6siYma0UKyACGx5wg=;
        b=otQexVG1tQ7n7fwxngXobk6gBQh8OQu1H2nAexF+3I7rcpgelwsG1KTB+wiKAotxW+
         lCzHyMjDrsIcYPPf0MwAnRYUexP+0/Te2WoO0qQxuSLPFhrWy0FdopGFv+qhN+caEILj
         WyyFsdaU5ONakObo8rcFbTZeGbH7pw4XajVTwDnGskkJO+fneaF1CElraCQ+lTWkXe5E
         4wfgRL7GnI8xipFBBq9LrA/5lSVXqj+vbfJPSVcGFkr45J8WnC1bfjGYHa4Ovh0WExTj
         a49+vFQyioQ7SjoF8VFoErijhBi4wSfR8maTvtT7JFIbE+P/rFsnk2YVY6ztHWrt2r+8
         Mwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dkRwrKHLC5kMeJov5D+V9X1cke6siYma0UKyACGx5wg=;
        b=YxxVhM17vV3sEdxzBrvZDoB8hQcZTCrUJa72yZHM5Nn9QZ6NWJVSdZCnxGZ181HqQ6
         6AwIMVEjHlqVawNBwU3Zei2Yg3B8Xdl4JX203eNbbzWymRmJK6Y42HNADJH+O9nn8CdJ
         FzuI2LOKDv85+MSq/JqhHoVxDjzpl1kDkllFQNLVOk4kghGJqLW0NBmtVKQ6b4rtiy69
         Skd1HozoUfAJ4mQ4VAPvH17czES08wObcDMs2MHiF2tS7fUq0mHkKgC/boPermD24Tn0
         sBPsKP/SuQ7XhqEYTAUlpgA+kNhMKQhqv/fvmY5oCeEddriQH14MLWeXYNRKng3Lf2ZB
         4ufQ==
X-Gm-Message-State: AOAM5316Ku9A4W1VQPD55ht1NAMT7HeD9JsSlQzF9GZo9v1b7tYjU0Lf
	mNZbYEhtwV94kMKDh4a8zQkcjO+F8PehHGugQq8=
X-Google-Smtp-Source: ABdhPJz94UmKo82pqRdEgDWhxfVjc49y+nyra8OFhtbCfY2SrrCYCA3lYo3Ke/RUU6mYuIltQE/y3liobsNZ6CXKw6c=
X-Received: by 2002:a50:9347:: with SMTP id n7mr11875637eda.249.1631881615931;
 Fri, 17 Sep 2021 05:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210917074838.90843-1-kai.kang@windriver.com>
In-Reply-To: <20210917074838.90843-1-kai.kang@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 17 Sep 2021 08:26:44 -0400
Message-ID: <CADkTA4NaH5w_qXu4W+PoBOf6kej4Ts4ZkuAn3ivq4hjkPbRaXg@mail.gmail.com>
Subject: Re: [meta-virtualization] [meta-cloud-services][PATCH] libibverbs: add back from meta-virtualization
To: kai <kai.kang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 17, 2021 at 3:48 AM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> libibverbs has been removed from meta-virtualization but it is still required
> by librdmacm and glusterfs. So add it back from meta-virtualization.

My bad, I can revert the drop in meta-virtualization to keep the churn
to a minimum.

We should look into replacing this recipe with rdma-core (which was on
my list, but I didn't want to do that replacement this late in the
cycle).

As is obvious from the page:
http://www.openfabrics.org/downloads/verbs/, there won't be any more
releases of this package, and we are going to eventually run into
trouble maintaining it.

Bruce

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../libibverbs/libibverbs_1.2.1.bb            | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 recipes-extended/libibverbs/libibverbs_1.2.1.bb
>
> diff --git a/recipes-extended/libibverbs/libibverbs_1.2.1.bb b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> new file mode 100644
> index 00000000..90c424ec
> --- /dev/null
> +++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "Support InfiniBand verbs"
> +DESCRIPTION = "Libibverbs is a library that allows userspace processes to use InfiniBand/RDMA 'verbs' directly."
> +HOMEPAGE = "http://www.openfabrics.org/downloads/verbs/"
> +SECTION = "libs/devel"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7c557f27dd795ba77cc419dddc656b51"
> +
> +# Official repo is at git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git
> +SRC_URI = "https://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "1544ebb89d861ce84057ab43dfcd22a0"
> +SRC_URI[sha256sum] = "c352a7f24e9a9d30ea74faa35d1b721d78d770506a0c03732e3132b7c85ac330"
> +
> +inherit autotools
> +
> +DEPENDS = "libnl pkgconfig-native"
> +PACKAGES += "${PN}-utils"
> +FILES:${PN} = "${sysconfdir} ${libdir}/*.so.*"
> +FILES:${PN}-utils = "${bindir}"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind,"
> +
> +do_install:append() {
> +        mkdir -p ${D}${sysconfdir}/libibverbs.d
> +        rm -f ${D}${libdir}/libibverbs.la
> +}
> +
> +PROVIDES = "virtual/libibverbs"
> +RPROVIDES:${PN} = "virtual-libibverbs"
> +
> +COMPATIBLE_HOST:mipsarch = "none"
> +COMPATIBLE_HOST:arm = "none"
> --
> 2.33.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
