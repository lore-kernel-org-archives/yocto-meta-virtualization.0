Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.4365.1604439201873985936
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 13:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VFNznObC;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	by mail.yoctoproject.org (Postfix) with ESMTPS id D30EA38C086B
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Nov 2020 13:33:20 -0800 (PST)
Received: by mail-qv1-f47.google.com with SMTP id bl9so8695599qvb.10
        for <meta-virtualization@yoctoproject.org>; Tue, 03 Nov 2020 13:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=78c+Fp/HmdTTvKWgojVrqYYjtrnsJSdz3Rokm+Ysfws=;
        b=VFNznObCJvOAio/AbmXIY5dMn+dt7UjhYa8mhwlqxkJN3ZXEfvVtdbfNQaEbF1cDE/
         XDiXlVKIABo+efDSGRPrpso0cu/kuxT0yJ2bG/Y9FYX5NuWjJ/MbpMe0fXacFFN6j4J7
         mh+72EgQgeXuGRplD92+yLgH0Gj4CEYtTxfb2q71Mdb6fWJA+353pcMByA019tkUuwut
         hepE+yVlagkAGmEbxap+E2cbjpdguIi6qjBVLFWEA/lYFq0nFiCfU9rVx4X8HHYXDfFt
         /OdstWABhJ/Mhwzej5ncWF/0JobmDr15/LuMNWjuOEPFyWwrsQ/CT0qcs1JwtqK3CJ/l
         jyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=78c+Fp/HmdTTvKWgojVrqYYjtrnsJSdz3Rokm+Ysfws=;
        b=a0N2wLmuwutvAOZbROQ6xCJbg7JHNtznFOvDtTprKqT8krI9XbI6CL8INKQUADBbgH
         otlrdNeDfgwhiluQ6EcwpTRQCjFC9M+VVAnF/W032B1WQinOft6JNAHxkuKgQS3trYCI
         9aCGNrZV6cMf03xBVIWB7lynXV2wfcgoyKBCtmCN3jgK81g4mZtGTPpHgBySjRAhIIFs
         LZu0DHaMrg4r+E7o/rCOW2hI0/zj/5Vurnnnc0iq8xlO0FEDDRnMvBy9n/o3NoASvQdC
         vFp+S9kLcf8huqfqQRUxFJ5ZoVkc3Fwl+4FnH+A2P6LlhrWNDJKryDVqX6EyH/ImP+7S
         cK/g==
X-Gm-Message-State: AOAM5309BFuBbXeeAY1rKFIBRgSWulvMJ2P9hI6xKlj3gjZhN2Vrn5hB
	k5dxklPuWJNpHtrNtKYGsh4=
X-Google-Smtp-Source: ABdhPJzwBNWJiOKV/UpZg9gcep/AIkXwXkq6GU+L8G0hjdBa7W2G9UatVS8VD1fi5s3nXnofDuC7Fw==
X-Received: by 2002:a0c:90e6:: with SMTP id p93mr129178qvp.47.1604439199774;
        Tue, 03 Nov 2020 13:33:19 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id p77sm5551qke.39.2020.11.03.13.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 13:33:19 -0800 (PST)
Date: Tue, 3 Nov 2020 16:33:17 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-pysnmp: upgrade 4.2.5 -> 4.4.12
Message-ID: <20201103213314.GA40946@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1603775033-49249-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1603775050-49324-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1603775092-49376-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1603775102-49438-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-pysnmp: upgrade 4.2.5 -> 4.4.12
on 27/10/2020 zangrc wrote:

> -License-Update: Renamed to LICENSE.rst and Copyright year updated to 2019.
> 
> Consolidate inc and bb files into a single bb file.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-pysnmp.inc      | 14 --------------
>  .../python/python3-pysnmp_4.2.5.bb                 |  2 --
>  .../python/python3-pysnmp_4.4.12.bb                | 14 ++++++++++++++
>  3 files changed, 14 insertions(+), 16 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pysnmp.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-pysnmp_4.4.12.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pysnmp.inc b/meta-openstack/recipes-devtools/python/python-pysnmp.inc
> deleted file mode 100644
> index 1a9ca0f..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pysnmp.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION = "A pure-Python SNMPv1/v2c/v3 library"
> -HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ae098273b2cf8b4af164ac20e32bddf7"
> -
> -SRC_URI[md5sum] = "1f75d3e392a050e84348904fc1be3212"
> -SRC_URI[sha256sum] = "c46e65d99a604f690b3d5800e2f6e26e1ed9a3c7f7e17e7b4b4d897150f7077f"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-pycrypto \
> -                   ${PYTHON_PN}-pyasn1 \
> -"
> diff --git a/meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb b/meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb
> deleted file mode 100644
> index b31eb5a..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-pysnmp.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/python3-pysnmp_4.4.12.bb b/meta-openstack/recipes-devtools/python/python3-pysnmp_4.4.12.bb
> new file mode 100644
> index 0000000..06ea97a
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-pysnmp_4.4.12.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "A pure-Python SNMPv1/v2c/v3 library"
> +HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b15d29f500f748d1c2a15709769090a8"
> +
> +SRC_URI[md5sum] = "2222880259daf6e2cb322e938c818276"
> +SRC_URI[sha256sum] = "0c3dbef2f958caca96071fe5c19de43e9c1b0484ab02a0cf08b190bcee768ba9"
> +
> +inherit setuptools3 pypi
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-pycrypto \
> +                   ${PYTHON_PN}-pyasn1 \
> +"
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


