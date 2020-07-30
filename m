Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3166.1596138471956803215
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 12:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uTM7XoeD;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C305E01F51; Thu, 30 Jul 2020 12:47:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBAADE01F0B
	for <meta-virtualization@yoctoproject.org>; Thu, 30 Jul 2020 12:47:41 -0700 (PDT)
Received: by mail-qt1-f194.google.com with SMTP id v22so15359292qtq.8
        for <meta-virtualization@yoctoproject.org>; Thu, 30 Jul 2020 12:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=2+8xxnJvnnGH5XimY5XXaAnmX8UkgiL0xmLwtSA/HQo=;
        b=uTM7XoeDlgjoq3uQfYzQFAR04/Q5z0962IKfd7TrfuVc5XJ1RfmEglKakv02vOA9My
         emnH0wTzY6olqySU+sAqYJxU0bVgqDY0tQANqV13X+pjTd96QF8uzHsGWp5GzyT4kd3K
         NDa9Swc5QIaDUw4xB5mzcXuA2UprcDdarD9TnmPIzcsEIJfnrDqtVHZZFNQo5Yj2IjoD
         dorlVac8bmzq8Bs0oK2dRuvEo6CAHSKHur+AI1HuG0XoriXZ3DJtiYDxFTMdszKJiHir
         y19EQVkbflES2d2Km/D0y+m7rymXengNQlKCYB9AZJdt6O7Y5/ML1XRK7rpplUhS3nYH
         VjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2+8xxnJvnnGH5XimY5XXaAnmX8UkgiL0xmLwtSA/HQo=;
        b=mst2puewu29kdu7Pgyhk9DZKlUSY7mK2s7ILJjD7kMnkHrSQWi/Q+YDHglIv79gJVg
         j+29iMb5fEfPDEJ3eN8ZCv/IL1JtmvG2dATA1Fj20d6CBKtqKLGIzZWt/vQnqrTZo/hh
         M0i+0YiOPdQQ2S/3LYe9gN8qba+wTP05f8lJwiZHTPe2HCQojfCFIsM/n925/kkPwmd5
         ahQ85h6R8ODUenDcVF7Kq+mFCCjleJJb4GWDLD3CY5y05oCSk04D3R6lCofE1ry11eEk
         aX8KD0YMy6JLunx572LWsw+WDLw9I0yviNNh6eb8At6YR7SYHfsemLbYdQ5QJjVZJ4Cx
         na1Q==
X-Gm-Message-State: AOAM531rQqFA86oYs1OH/siPrI5gRJLq4WrQk2Q3hnYSt1DCQIpQn9p2
	C/MYf5QBjKwYS2HDReNFJw8=
X-Google-Smtp-Source: ABdhPJx0iFdfigeeBVXOXtj5Kd1cce4MSLe5hfXB8yHHogcD/gQ7tn3t228k0sg+EBgNkWd7O8jJpQ==
X-Received: by 2002:ac8:2fa8:: with SMTP id l37mr304314qta.366.1596138461021;
        Thu, 30 Jul 2020 12:47:41 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 22sm5006458qkg.24.2020.07.30.12.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:47:40 -0700 (PDT)
Date: Thu, 30 Jul 2020 15:47:38 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-zake: upgrade 0.2.1 -> 0.2.2
Message-ID: <20200730194737.GC28981@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1595899203-25666-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1595899203-25666-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization] [PATCH] python3-zake: upgrade 0.2.1 -> 0.2.2
on 28/07/2020 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-zake_0.2.1.bb               | 21 -------------------
>  .../python/python3-zake_0.2.2.bb              | 18 ++++++++++++++++
>  2 files changed, 18 insertions(+), 21 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-zake_0.2.2.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb b/meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb
> deleted file mode 100644
> index 68cb67b..0000000
> --- a/meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "A python package that works to provide a nice set of testing utilities for the kazoo library."
> -HOMEPAGE = "https://github.com/yahoo/Zake"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=33573af7505a94ff3d122a7920b2c735"
> -
> -SRC_URI[md5sum] = "bd8db293a78c22171ecfdd54f4d65c63"
> -SRC_URI[sha256sum] = "2e5bcb215e366e682fd05dd1df4f2e6affceefa5d3781c2987a21fd597659a21"
> -
> -inherit setuptools3 pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -        python-kazoo \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python3-zake_0.2.2.bb b/meta-openstack/recipes-devtools/python/python3-zake_0.2.2.bb
> new file mode 100644
> index 0000000..700bf85
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-zake_0.2.2.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "A python package that works to provide a nice set of testing utilities for the kazoo library."
> +HOMEPAGE = "https://github.com/yahoo/Zake"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=14e79e6983dbd678bbe0ff17229d8fc1"
> +
> +SRC_URI[md5sum] = "076dcb58f5cb8b50f575fc0ca7e810b9"
> +SRC_URI[sha256sum] = "5a50859931c4f666d318b74d1c407a6150dd5194e4c5812d071a5c7c7cefe4e6"
> +
> +inherit setuptools3 pypi
> +
> +DEPENDS += " \
> +        python3-pip \
> +        "
> +
> +RDEPENDS_${PN} += " \
> +        python3-kazoo \
> +        "
> -- 
> 2.25.1
> 
> 
> 

> 


