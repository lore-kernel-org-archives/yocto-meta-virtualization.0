Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.10544.1599270974000286399
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Sep 2020 18:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ihK3hwWs;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 4251B38C0109
	for <meta-virtualization@yoctoproject.org>; Fri,  4 Sep 2020 18:56:13 -0700 (PDT)
Received: by mail-pj1-f65.google.com with SMTP id np15so5774849pjb.0
        for <meta-virtualization@yoctoproject.org>; Fri, 04 Sep 2020 18:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=WX36/eArOC+B+sJn0d9ysQXALAqIhRopjJM78i06my8=;
        b=ihK3hwWsHptGRpK5LIBYzLU0TT3p4iYg234W9E6hCebJxXeXRTGFmmDnZoTX8JZHmB
         oApUgjr4A2Lrl+CZg/buk7zFrnz1xbs4oe/A3hPHSF6Cqt47ZBQIZrn3At6MkvB/wFr0
         OINJz7bm/s3AYj04XHFNDnrDGkUbDVVBiuEC9Nz6QUom5fNNvD1ojmULj+7F4ps4jPc+
         LAGehyPUAoKOG0xHUdXEM7DsaegqGS44a+v1LUOSILpvXNzru80dgEsHTv2K0aggICuv
         yu9N3n8Upd+twc0a0y4Ncc23SRdEBDZBXwuXAnBYWc1XJHVIg4+zjy1xW/BiZd8eml8h
         d15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WX36/eArOC+B+sJn0d9ysQXALAqIhRopjJM78i06my8=;
        b=ZFYth1Z78cpYYnW9nED8Rnpyshnu8cOvussnmUpLDpgKqQuMXoHYtU+pfrdE2Ad++C
         hLYPb0gTT69SmwhcoILSTv8xHFh+8tqq4lMD7bu/37q7+w4WePPnMBZpU2x7cCNFzTDP
         vSiM3gnHLJ42GCcGht5Q2hbOnIGNSf/XGTXWrnt7Nm5Inkjffp64Wt67+qsE21Vh6xB6
         Laad2jCrV8frXSCF2FdEG01r4bsaBbz03nORzarcEBAgYGTWWyohwgk73tHT49XpvBZP
         YyxKZr0z5paaqolDuIF5bbyuPVGhRyT6QIuKPURoaaK2DfAFu7lCJS5IRT3JWtfRz8Kw
         wW+g==
X-Gm-Message-State: AOAM533oyf4dMYnRbYBMcRrmkcoCSCmQqn1QCjNTlbBYvgVZhdOjwLa2
	HbI4EgelYf/CChNTmNOgWGhduKdiOcNk5g==
X-Google-Smtp-Source: ABdhPJyp1C6hDqxhQ8AJjnqJgpSaZauzQSiQDV+AYkwXPW3x/G0IRUEn/SkURZVGROqpRVfsch3tbQ==
X-Received: by 2002:a05:6214:d43:: with SMTP id 3mr8553707qvr.47.1599078822972;
        Wed, 02 Sep 2020 13:33:42 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f3sm395262qth.56.2020.09.02.13.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 13:33:42 -0700 (PDT)
Date: Wed, 2 Sep 2020 16:33:39 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 2/2] python3-cursive: Change to python3
Message-ID: <20200902203338.GB18324@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1598925465-78006-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1598925465-78006-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1598930638-79311-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH 2/2] python3-cursive: Change to python3
on 01/09/2020 zangrc wrote:

> Because python2 is no longer maintained, bb file is changed to python3
> version.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-cursive_git.bb              | 37 -------------------
>  .../python/python3-cursive_0.2.2.bb           | 31 ++++++++++++++++
>  2 files changed, 31 insertions(+), 37 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-cursive_git.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-cursive_0.2.2.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-cursive_git.bb b/meta-openstack/recipes-devtools/python/python-cursive_git.bb
> deleted file mode 100644
> index ce82998..0000000
> --- a/meta-openstack/recipes-devtools/python/python-cursive_git.bb
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -DESCRIPTION = "Library for validation of digital signatures."
> -HOMEPAGE = "https://github.com/openstack/cursive"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> -
> -SRC_URI = "\
> -	git://git.openstack.org/openstack/cursive.git;branch=master \
> -	"
> -
> -PV="0.2.0+git${SRCPV}"
> -SRCREV="ad25a4016c56eeceb85764c7ac4501def2b5445a"
> -S = "${WORKDIR}/git"
> -
> -inherit setuptools3
> -
> -DEPENDS += " \
> -        python-pbr \
> -        "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        python-pbr \
> -        python-lxml \
> -        python-cryptography \
> -        python-netifaces \
> -        python-six \
> -        python-oslo.serialization \
> -        python-oslo.utils \
> -        python-oslo.i18n \
> -        python-oslo.log \
> -        python-castellan \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python3-cursive_0.2.2.bb b/meta-openstack/recipes-devtools/python/python3-cursive_0.2.2.bb
> new file mode 100644
> index 0000000..770acdc
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-cursive_0.2.2.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "Library for validation of digital signatures."
> +HOMEPAGE = "https://github.com/openstack/cursive"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> +
> +inherit setuptools3 pypi
> +
> +SRC_URI[sha256sum] = "fbdc2b088bf0b9a69b1897d726e6027e8fba8f21f0a881344f70e7a407d9abda"
> +
> +DEPENDS += " \
> +        python3-pbr \
> +        "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python3-pbr-native \
> +        "
> +
> +RDEPENDS_${PN} += " \
> +        python3-pbr \
> +        python3-lxml \
> +        python3-cryptography \
> +        python3-netifaces \
> +        python3-six \
> +        python3-oslo.serialization \
> +        python3-oslo.utils \
> +        python3-oslo.i18n \
> +        python3-oslo.log \
> +        python3-castellan \
> +        "
> -- 
> 2.25.1
> 
> 
> 

> 


