Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.5476.1594758311138734134
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 13:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XdQPPI6t;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACC16E01E87; Tue, 14 Jul 2020 13:25:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,URIBL_RED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.218.67 listed in list.dnswl.org]
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65449E01E85
	for <meta-virtualization@yoctoproject.org>; Tue, 14 Jul 2020 13:25:08 -0700 (PDT)
Received: by mail-ej1-f67.google.com with SMTP id ga4so24294397ejb.11
        for <meta-virtualization@yoctoproject.org>; Tue, 14 Jul 2020 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KrNMDJr4veY31qjp1NSyZEUzQu6UpAjWDo97FczM+DQ=;
        b=XdQPPI6tkQV5uphaDkfKfUYmMJTXiUcODA0wXYpwXlcsNDzc7K6LU/z0ro28N0A3ZN
         EQ0Hh+KzJAr5QSUIJe913hG7CmiQW6eza81oAVSUurSN5vU3QJE1MBxcAZRmMht+71mU
         P66cOZluGbpRvldBdCT53B9q7Gg7dQSWkvUYpuyu5MIykfaUh1sqKlQEIeo6Px2BgkPA
         QfQSHBtFlkfBBnYqp1j5vcmvF8fTv+B6m3WvM32xHy6A0n3EUFbF53yvw+qT3/lLcKOF
         FixNSr3Ly0dJbwnrBLsqBmHpJNqtX5LdXHb1Rq1YDOZ7iayVS0V31NeU6tnfhe3FgtjA
         EpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KrNMDJr4veY31qjp1NSyZEUzQu6UpAjWDo97FczM+DQ=;
        b=iQR2GYvo4QXjTjbDoHZSOYEeTpMF9DYfpx4CNN3/VzAPE37VIHOL90vNYEOAmHsyIH
         SAX2R19QLfJaFBpuebXMoJ1Yj5hYYnhReOlwiLpK7O88jLjbtB8SPFiqybBupR8ZaXAd
         bOZCr2yx+ve4nln/LGBTzCspsAO0wNHCW6iqiTuJ9TZ2gE4BV1fYsrEOHVMRYYCVUZ8g
         Ws/ZOwhuyXPWMcZpPa4FLm3GTg6IJxFLKuDV/cdeq9ML3IuRqJ62sHLuQ8Kv3f7Hz+Wn
         i7aKuMZjnwKnqVaLBTCeOn0OiclLw7fLfQiYRX0YB9fkQOp+GM8FH3KK2KEW39AvxT9v
         dlEg==
X-Gm-Message-State: AOAM530LwuUzL9i5/XORTjpGK+kWr7n21pFE1PrDrBEV8hcehszPC6Wh
	EdW7p/ZYqx5TAUulMVj1YhXTSqoUfUqFLLiXSwE=
X-Google-Smtp-Source: ABdhPJxi8KMa4VrS8LCWGPTnGVZwfV4weBNDhroirzQ3MnkcFHgerdL6VjzMtcXTxDpdzUwoOn8EYzD90zpGccVaFyg=
X-Received: by 2002:a17:907:9495:: with SMTP id dm21mr6135238ejc.357.1594758307851;
 Tue, 14 Jul 2020 13:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <1594731800-3845-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1594731800-3845-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 14 Jul 2020 16:24:56 -0400
Message-ID: <CADkTA4MRqQtMz4BJWodk5MOsmVF3JzZQmQDQtk_LaDCWrhTE_A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python3-oslo.config: Change python to python3
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Jul 13, 2020 at 9:03 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-oslo.config_git.bb          | 37 -------------------
>  .../python/python3-oslo.config_8.2.0.bb       | 26 +++++++++++++
>  2 files changed, 26 insertions(+), 37 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
> deleted file mode 100644
> index 6a0498c..0000000
> --- a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -DESCRIPTION = "API supporting parsing command line arguments and .ini style configuration files."
> -HOMEPAGE = "https://pypi.python.org/pypi/oslo.config/4.11.1"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
> -
> -PV = "4.11.1+git${SRCPV}"
> -SRCREV = "fb0738974824af6e1bc7d9fdf32a7c1d3ebf65fb"
> -
> -SRCNAME = "oslo.config"
> -SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit setuptools3 rmargparse
> -
> -DEPENDS += " \
> -        python-pbr \
> -        python-pip \
> -        "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -    python-pbr \
> -    python-netaddr \
> -    python-six \
> -    python-stevedore \
> -    python-debtcollector \
> -    python-oslo.i18n \
> -    python-rfc3986 \
> -    python-pyyaml \
> -    "
> -
> diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb b/meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb
> new file mode 100644
> index 0000000..6898a1f
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "API supporting parsing command line arguments and .ini style configuration files."
> +HOMEPAGE = "https://pypi.python.org/pypi/oslo.config/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
> +
> +SRC_URI[sha256sum] = "116ff3a7b98b0309b083af7906d99f8c6bea67df5ee03a85e2ac02700dd75d30"
> +
> +inherit setuptools3 pypi
> +
> +DEPENDS += " \
> +        python3-pbr \
> +        python3-pbr-native \
> +        python3-pip \
> +        "
> +
> +RDEPENDS_${PN} += " \
> +    python3-requests \
> +    python3-netaddr \
> +    python3-stevedore \
> +    python3-debtcollector \
> +    python3-oslo.i18n \
> +    python3-rfc3986 \
> +    python3-pyyaml \
> +    "
> +
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
