Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.8328.1593489539244111397
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 20:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RB7/C8K4;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id h23so14662374qtr.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Jun 2020 20:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=oaANqglouiWocQSVUWjYO7rn7tiX4+0g8W11zzyw8Cc=;
        b=RB7/C8K4jSvqB4UWZijAU7kdJfv5A8UWEoyngtYfam9oU71KtAUkAo7yyVth1JSkXa
         b/xb8oKorY1YNQINBgS7ErzJ85n4DHX+r4agwxPk8vK/3ULJv+ozniLXAPoPS9ol69WP
         aKIq/SCix6UKKsP9cjBUWO7MOZwzuiwpf3SxbFFG7W0k3Poayrbqs/c166aYo/uc6LeD
         hUJMIYQ6TWSK8nlGKxTlsF3e4478uUCruE3nP8mvOrOz2ZIBZJOUiu75zPMEv0t51qcj
         srWYqCYux6OQFTugbsUzm4ZaI+DCfQnKHb3z5mlEYWvnTkAPflXie9vJavfOCrLIHhDa
         bGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oaANqglouiWocQSVUWjYO7rn7tiX4+0g8W11zzyw8Cc=;
        b=sN4rqweF0fU4CpzH4DfMsvIigLSFxb0KPVGRyuQ8sGT3UF3Yjnr2eOOVZQ9bxAD/vD
         6TQrPLJy1uGWt+s2188TQfDjMWF7Ea4hZ9UtbqD4Mf0bGBxFFVGIRW9Sg2Xnx+CoFVbU
         MBwGmMKGqJ6lhaEarOETKfvGrSa/B7FrIwVsNBpp96mkO91xJ+jkVZiSIAvC+0yqNFqQ
         j9PzN6/L3MyJWXimXoP4HqLL8R8Q1WVLxaRZJnsRcmHhkLqWCsAwfjUwwdNReblqlSKt
         QdsQ4oEP49J+8xyHptN7c/uo4sD/t8g4uB2/jj8QR4bQ8cxuB/I2eAUPMHc/QJyJs0jh
         cIeg==
X-Gm-Message-State: AOAM531ZChsBRjc934c4lszVXGpXpOoXPOwY7KbplCv7kuoALa4L/cTM
	UX7BFDJR008tqH/+ZIGMXKhjMKA9b6UdVQ==
X-Google-Smtp-Source: ABdhPJw6QFAMtsk2IXvhLXKND23VTpb3asGgfBtGeOE9mngqHUdM0LxgX17+cL0DaEWX7r5BzcORkg==
X-Received: by 2002:ac8:441a:: with SMTP id j26mr18947534qtn.191.1593489538105;
        Mon, 29 Jun 2020 20:58:58 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id j198sm2059879qke.71.2020.06.29.20.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:58:57 -0700 (PDT)
Date: Tue, 30 Jun 2020 03:58:55 +0000
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][meta-cloud-services][PATCH] python3-flake8: Change python to python3
Message-ID: <20200630035852.GA8891@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1593320522-14645-3-git-send-email-wangmy@cn.fujitsu.com>
 <1593320522-14645-4-git-send-email-wangmy@cn.fujitsu.com>
 <1593320522-14645-2-git-send-email-wangmy@cn.fujitsu.com>
 <1593320522-14645-1-git-send-email-wangmy@cn.fujitsu.com>
 <1593320546-14682-1-git-send-email-wangmy@cn.fujitsu.com>
 <1593401871-17345-2-git-send-email-wangmy@cn.fujitsu.com>
 <1593401871-17345-3-git-send-email-wangmy@cn.fujitsu.com>
 <1593401871-17345-4-git-send-email-wangmy@cn.fujitsu.com>
 <1593401871-17345-5-git-send-email-wangmy@cn.fujitsu.com>
 <1593401871-17345-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

thanks for the updates. Most appreciated.

These are now merged.

Bruce


In message: [meta-virtualization][meta-cloud-services][PATCH] python3-flake8: Change python to python3
on 29/06/2020 Wang Mingyu wrote:

> upgrade 2.4.0 -> 3.8.3
> 
> -License-Update: Copyright year updated to 2016.
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../python/python-flake8_2.4.0.bb               | 17 -----------------
>  .../python/python3-flake8_3.8.3.bb              | 17 +++++++++++++++++
>  2 files changed, 17 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb b/meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb
> deleted file mode 100644
> index f476c42..0000000
> --- a/meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DESCRIPTION = "The modular source code checker: pep8, pyflakes and co"
> -HOMEPAGE = "https://github.com/dreamhost/cliff"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=7a76e57e683629e1ac2a49406169c2a3"
> -
> -SRC_URI[md5sum] = "d413935bb21026c18aca82654114502f"
> -SRC_URI[sha256sum] = "d26a9d0252da9f831b8277b824961bb10b1f9d79f4752d32e4814b7bcd1e089b"
> -
> -inherit setuptools3 pypi
> -
> -RDEPENDS_${PN} += "python-prettytable \
> -            python-cmd2 \
> -            python-pyparsing \
> -            python-mccabe \
> -            python-pep8 \
> -            python-pyflakes"
> diff --git a/meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb b/meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb
> new file mode 100644
> index 0000000..9385c80
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "The modular source code checker: pep8, pyflakes and co"
> +HOMEPAGE = "https://github.com/dreamhost/cliff"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=75b26781f1adf1aa310bda6098937878"
> +
> +SRC_URI[md5sum] = "b11380b47468c3dc7323396d4b8c1746"
> +SRC_URI[sha256sum] = "f04b9fcbac03b0a3e58c0ab3a0ecc462e023a9faf046d57794184028123aa208"
> +
> +inherit setuptools3 pypi
> +
> +RDEPENDS_${PN} += "python3-prettytable \
> +            python3-cmd2 \
> +            python3-pyparsing \
> +            python3-mccabe \
> +            python3-pep8 \
> +            python3-pyflakes"
> -- 
> 2.17.1
> 
> 
> 

> 


