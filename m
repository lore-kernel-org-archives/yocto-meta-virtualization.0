Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.51986.1600050160386773562
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 13 Sep 2020 19:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R9RlSnCr;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 98FD738C1192
	for <meta-virtualization@yoctoproject.org>; Sun, 13 Sep 2020 19:22:39 -0700 (PDT)
Received: by mail-qk1-f194.google.com with SMTP id g72so15533762qke.8
        for <meta-virtualization@yoctoproject.org>; Sun, 13 Sep 2020 19:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=2byRU9HFUv9icnq8qOffXj1vgbSjrR/yvyJBQIaPpzQ=;
        b=R9RlSnCrAhyVrJkT8rmD2KJFjcj40e3VEIdSl7En/lwNjW3gnfrLe7lPMXDSH5jsqQ
         kEy7x4UaON4sqrSn2j5+BmaQWYYVjcJ9VW68SN3jxP016vfbYKO+iCkAeXmsgLKVh/je
         q11NkQtvF1o6p+KRmAsCzZlKYdi/HUJxq06cYxK5qjv+CK+4+QrmAwOBooFAA/ZnWjVN
         IwPo2QNUr3/lF9qQeJpkTcYsuRvSZlPP4blLkmLKJ/5J22XTJHoK3oYx1fmNtr5pSv3r
         p7ZsdDPuC3wA4tBdhyFSCNwgHD7wAUQLJKJpTfLbmFpZ4TUeq27Grw3L6ImWcYan31M7
         O2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2byRU9HFUv9icnq8qOffXj1vgbSjrR/yvyJBQIaPpzQ=;
        b=hsJQgTmWoqH8hGBtf5lWLUEky5ORxqntaq+4wkCLR+UIxCQ83HgpD4Q4ig9LtdXtq1
         poGkmvEe2WQ55m3bq5g9DzG1hjlSunIcophktDJpMxrn366h1qrxw/z4lt7BJM682tLR
         ++sviSoS1scjqVRCa005eC37BQCjnHd4w79ClXT0LueZ1yDdI7pSCpEfS6UmRUp9t59/
         wetEvguQQWeJBi3T2Dh4CSekaauegdK0SAhs8JK4nLlRqzzE4opaSnEbsQaHWKMtc834
         fekiZ+iOqYXKJvE1e/6AIQ40qEFpbCa9JQZs8Aca1fOJ90oGPHV0Trs14MfeQnhSDYNj
         l6gQ==
X-Gm-Message-State: AOAM532ps8BT++M76PgMaoSn8U+IkquMxSHLiuSf7Onn8R0lUNp+OyNr
	wLAn5uq76oNglkmiFu8ABWU=
X-Google-Smtp-Source: ABdhPJwa57/gXyql/a9Ism9T5rvT4PHvFmUWYJIm2QwDuFe0HoSU8Mt3Ip/OD8PZgl+2H9eYWnadrQ==
X-Received: by 2002:a37:c40b:: with SMTP id d11mr10616193qki.188.1600050158672;
        Sun, 13 Sep 2020 19:22:38 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id i7sm13010637qkb.131.2020.09.13.19.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 19:22:38 -0700 (PDT)
Date: Sun, 13 Sep 2020 22:22:36 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-google-api-python-client: Remove the recipe
Message-ID: <20200914022235.GB5940@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1599585700-88354-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1599585700-88354-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1599585700-88354-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization] [PATCH] python-google-api-python-client: Remove the recipe
on 09/09/2020 zangrc wrote:

> Since python2 is no longer maintained, the recipe of python2 is removed.
> The version of python3 is located at:
> meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python-google-api-python-client_1.6.6.bb     | 16 ----------------
>  1 file changed, 16 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-google-api-python-client_1.6.6.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-google-api-python-client_1.6.6.bb b/meta-openstack/recipes-devtools/python/python-google-api-python-client_1.6.6.bb
> deleted file mode 100644
> index 8aec8ce..0000000
> --- a/meta-openstack/recipes-devtools/python/python-google-api-python-client_1.6.6.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY = "Client library for accessing the Plus, Moderator, and many other Google APIs."
> -AUTHOR = "Google Inc."
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
> -
> -inherit setuptools3 pypi
> -
> -SRC_URI[md5sum] = "3059dce9c0308852e177c7d99d3f9ac2"
> -SRC_URI[sha256sum] = "ec72991f95201996a4edcea44a079cae0292798086beaadb054d91921632fe1b"
> -
> -RDEPENDS_${PN} += " \
> -        python-httplib2 \
> -        python-oauth2client \
> -        python-six \
> -        python-uritemplate \
> -        "
> -- 
> 2.25.1
> 
> 
> 

> 


