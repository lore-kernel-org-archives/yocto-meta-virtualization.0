Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.3353.1608588994142225361
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Dec 2020 14:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=seOYh3r7;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	by mail.yoctoproject.org (Postfix) with ESMTPS id EA99838C156D
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Dec 2020 22:16:33 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id b64so10246696qkc.12
        for <meta-virtualization@yoctoproject.org>; Mon, 21 Dec 2020 14:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=dhEqo3+7hhucL0W/a0SCO7QoeU1fjk452EqNGQhmI+A=;
        b=seOYh3r78SXb8ZEtM3Lrc1XwWUstsIeCsozhUiXL7JNoMUCG7b7ZDSVGiJC3c9wkHE
         RFVfAZHfgaAQdr8OZAqO5oFRnux/NCylTWHv072cySBXUa8knnADA+fyDX9G57kgRz4H
         rtvBcN9VOEn+prB6q0AgQf/PhT4Kj6p6BpTWjgIVonXfO6QyOVnupi79wRj+TP07nJn1
         0zkMcsdg1iGYU1WiKrpDMjPbXy943LmpGwtlAjEGQFyGAyl9RKqdH/ESVUh7JIFTptL1
         iPMTtufAb0WC9gNk6Hjvui/Q/tIkoh/zDHpznLRRAeOXDa4VaYG7aCBlLt13PGGM5IHZ
         YrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dhEqo3+7hhucL0W/a0SCO7QoeU1fjk452EqNGQhmI+A=;
        b=JlFlfvEf8gwesGKpjzZ/VRZuOtZ7FS+9rbg3fdGYT+IsQTy/Sl4C2vS83+T2FqGAm3
         eDIELBLEyYq/noACGqUaxFTHTfOqlmkMk+1eFYBHeVNCX/rbBJyMzDeveTsHQknDlQt8
         1mpTBx76pSEMg5W3V3FryYKxk816WG1L+pgT7drIig+lMrimjOt3qIM31vVLfwJQtLjf
         FICWZD0L92PSUF0R6M0k7JjYUhkQcC05SdGNgxKoJVCm1RJkltF2HL9sAe4UhfUTL8N2
         qo1yZ9dMOOrNFY5iUoD5xwm5yyKEdshywY0r4iRev9KPcoWceXBVEbyp6p+HQT6yzLiQ
         M5Rg==
X-Gm-Message-State: AOAM5304Ygh8EMWOAVQF/nRaWt4EpuXhNxDH1/r/jlJLAekWDtLNiffu
	iZtED2Gg//qHvQ3yP6thdPtHJb3OyQFANw==
X-Google-Smtp-Source: ABdhPJyKcT404D/PoyjDBJs2FRCmj8ySp/QLz+RSoxMnaJIqlmPGLq5C9yDnqUUINCspri/esSYAGA==
X-Received: by 2002:ae9:ddc7:: with SMTP id r190mr19143601qkf.102.1608588992897;
        Mon, 21 Dec 2020 14:16:32 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id w8sm12270979qts.50.2020.12.21.14.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 14:16:32 -0800 (PST)
Date: Mon, 21 Dec 2020 17:16:30 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 7/7] python3-osprofiler: upgrade 2.9.0 -> 3.4.0
Message-ID: <20201221221629.GB22844@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1608016848-55637-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1608016875-55674-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1608016895-55720-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1608016902-55756-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1608016926-55793-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1608016934-55829-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1608016956-55876-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH 7/7] python3-osprofiler: upgrade 2.9.0 -> 3.4.0
on 15/12/2020 zhengruoqin wrote:

> Because python2 is no longer maintained, bb file is changed to python3 version.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-osprofiler_2.9.0.bb         | 35 -------------------
>  .../python/python3-osprofiler_3.4.0.bb        | 35 +++++++++++++++++++
>  2 files changed, 35 insertions(+), 35 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-osprofiler_3.4.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb b/meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb
> deleted file mode 100644
> index e6fe8656..00000000
> --- a/meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -DESCRIPTION = "OpenStack Profiler Library"
> -HOMEPAGE = "http://www.openstack.org/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
> -
> -SRC_URI[md5sum] = "75f190b00ac248b3d547b67a480801db"
> -SRC_URI[sha256sum] = "6915cbf8ac390dc3e125340b0ff368dd53f5889e3d053f9122dd83ba0dd366f7"
> -
> -inherit setuptools3 pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        python-pbr \
> -        "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -        python-pbr \
> -        python-six \
> -        python-oslo.messaging \
> -        python-oslo.log \
> -        python-oslo.utils \
> -        python-webob \
> -        python-requests \
> -        python-netaddr \
> -        python-oslo.concurrency \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python3-osprofiler_3.4.0.bb b/meta-openstack/recipes-devtools/python/python3-osprofiler_3.4.0.bb
> new file mode 100644
> index 00000000..5d7939b6
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-osprofiler_3.4.0.bb
> @@ -0,0 +1,35 @@
> +DESCRIPTION = "OpenStack Profiler Library"
> +HOMEPAGE = "http://www.openstack.org/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
> +
> +SRC_URI[md5sum] = "691c4d2cc77e60eeaa30edd7bf087481"
> +SRC_URI[sha256sum] = "f7fe387f4dd681bbf92b9fbe857cc90e89cfe96d44522a2727540902310a9ed6"
> +
> +inherit setuptools3 pypi
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        python3-pip \
> +        python3-pbr \
> +        "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python3-pbr-native \
> +        "
> +
> +# RDEPENDS_default: 
> +RDEPENDS_${PN} += " \
> +        python3-pbr \
> +        python3-six \
> +        python3-oslo.messaging \
> +        python3-oslo.log \
> +        python3-oslo.utils \
> +        python3-webob \
> +        python3-requests \
> +        python3-netaddr \
> +        python3-oslo.concurrency \
> +        "
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


