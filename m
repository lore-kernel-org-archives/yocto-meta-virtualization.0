Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.3499.1603855627356548515
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 20:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=egG+TjTG;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9F69238C1433
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 20:27:06 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id bl9so1774192qvb.10
        for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 20:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=PUHQpFtl/SrtQxA4J5Z5iMsR7iBypuLvRoLIoO5S7uE=;
        b=egG+TjTGz6kI6YjVXGYa+agSwKb90ATPr0mYeVo/cGbPVGQJssJBuRAFucnmZDJIhU
         EewFx1wLNJUQ/P46kJaP19odN6BIJnI3xND3R1zW7DwFPJdMRRfBclsCTmK2E28UUC/z
         ODy18taWQ3p7UmwlA3pcmrMOJk4i1vfWBkOdH9Anzu1/t5q/mzfJeka0L3qLZ1Mpwg0e
         +A4JoSAVuMasPRHw/l73BgIPCcdc7gD50NXOSzzBe1G7I1RpoO7smBoxFxw+sM/Kxqkp
         +eaVNH875iwQ1956JHYy5o9KodzhXPVPUhqWmvG/zer6ZLmy0fXDvx2D99XpbfxJjlKg
         jXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PUHQpFtl/SrtQxA4J5Z5iMsR7iBypuLvRoLIoO5S7uE=;
        b=FusCtRTewGSK5fc6w37FqVCYab0zXQjcOJilfiqBS4g4hr/HJC2jdST2eORRUu3tG5
         n0JbFX3TQi0CeAOwjNvCGJL+pf3FLykF+CXEH2kpfLJgHRIURioPFDyncVmlaJ8iAJXr
         L0Iz++RmMZlC7EEoMq6T3mbomxqZ/fKDWjfDYoIbpWlHNgBTnXhkJcNmP9h4EMamPwVG
         Kw7ULZQtxivP1anrDUMyE+N7/74LbvQlH1zDPFw+tcD2wthc3mzkCaxVNZH4gBQrXuB4
         5CbmWDfNwhpv0YxhRQ20ufH4bQl6jn/4FskuBUfb5HUhh3/4NNKthnncyJh3WFva18je
         6qzg==
X-Gm-Message-State: AOAM530mC1Uw+U/uLPpqgw4YVkOcZOQmYZ1vBqhf4Dwe+EHOV7C5NVaS
	Xfpw7GCOmrjLA30e2NJ40sN9wk67ZJxTuEwr
X-Google-Smtp-Source: ABdhPJzy2H12c2dGFd67YuMsXHaBohQVD4MJTGDS3II9ErHu0m1QkI/puWjznJxTOWd4FXGMGjOsLg==
X-Received: by 2002:a05:6214:1351:: with SMTP id b17mr5717517qvw.11.1603855625619;
        Tue, 27 Oct 2020 20:27:05 -0700 (PDT)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id s17sm2145879qta.26.2020.10.27.20.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 20:27:04 -0700 (PDT)
Date: Tue, 27 Oct 2020 23:27:03 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-xstatic-spin: change to python3
Message-ID: <20201028032702.GB46280@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1603164562-37683-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1603164575-37740-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1603164586-37810-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1603164600-37872-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH] python3-xstatic-spin: change to python3
on 20/10/2020 zangrc wrote:

> Because python2 is no longer maintained, bb file is changed to python3 version.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...ic-spin_1.2.5.2.bb => python3-xstatic-spin_1.2.5.3.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-xstatic-spin_1.2.5.2.bb => python3-xstatic-spin_1.2.5.3.bb} (58%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-spin_1.2.5.2.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-spin_1.2.5.3.bb
> similarity index 58%
> rename from meta-openstack/recipes-devtools/python/python-xstatic-spin_1.2.5.2.bb
> rename to meta-openstack/recipes-devtools/python/python3-xstatic-spin_1.2.5.3.bb
> index 4060bd9..66bd986 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-spin_1.2.5.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-xstatic-spin_1.2.5.3.bb
> @@ -2,19 +2,19 @@ DESCRIPTION = "Spin JavaScript library packaged for setuptools3"
>  HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Spin"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=322c2399a1682aaec2f4e5fff4be5726"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=45c30e2aa7df682a626f8e3629b8f7ee"
>  
>  PYPI_PACKAGE = "XStatic-Spin"
>  
> -SRC_URI[md5sum] = "df83f80fd0b11545b64497112996e49e"
> -SRC_URI[sha256sum] = "7f46ef0e45e047019ba6eda22c432fb96f681b97bbe7f1749aa9209e07727192"
> +SRC_URI[md5sum] = "d0cad2593c74eec38dbeed5161eab462"
> +SRC_URI[sha256sum] = "06e889cf3318f08ce74ef888b45d9f1e09017bb8e6d519a299c10a9e6b542642"
>  
>  inherit setuptools3 pypi
>  
>  # DEPENDS_default: python-pip
>  
>  DEPENDS += " \
> -        python-pip \
> +        python3-pip \
>          "
>  
>  # RDEPENDS_default: 
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


