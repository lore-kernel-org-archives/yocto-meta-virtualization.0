Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.4114.1618801451025305838
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 18 Apr 2021 20:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F/BGJH1k;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A335C38C05B5
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Apr 2021 03:04:10 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id u8so25068403qtq.12
        for <meta-virtualization@yoctoproject.org>; Sun, 18 Apr 2021 20:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RYnPh4pj89cGLXa/yApNq4PGyX+BrVKtvTqEisg6X1A=;
        b=F/BGJH1k6n5Ioog2Xo5+TBMorhtZz0pyRFKYyevVu/m9d7qjKVFniG+ztDmi+SHVvR
         pWWrgS3l06ylno5FwX2mmOXOvDCbmxrvTGciHI1npbvfVPdjLcySrQRzdmKE3vFKilP8
         zpwDZDgpDL1LhAptR1rxhAHoOYJJLmqIh03Y5meHf6iJQSWlvKpyZacsRtehXiPrYxLV
         NBDvolsZeQr3YGFTfp5kW3n4EmfDDC5IfgDguppok2ymgmT05kwXgKiMwUbM/pRjNnKq
         Kzro7sP/OxpFPbGFO6lXKvXzR5FFjbPXM7Fvl/pcFdkp4nqZpCAjKTymFqtcQ1/uYKP6
         VpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RYnPh4pj89cGLXa/yApNq4PGyX+BrVKtvTqEisg6X1A=;
        b=lllrtDnsyoCCAYxSlQdeMObOdxXyPHkQemtrh4vjTlxs/uKgmTdrLPkyXxyVyOwHP3
         aRigIyhZHjfJ1G/B7GK1hFABXbbiU19qRy7DgIhbcVBodO51TOipnLspnMKPoN6hUrdw
         E8rSaF0i/RYzGvLQdD0fQXeGOMZo4qSs+veOrf25G2q9lAxs8pr1lvRe/W24yOak1s/r
         cV/HfVU/RIS2PWkcolN5I9q/eNUqrvDjONd9xEbpXqVog11C0b9MZzk7AkAapDrsVtUE
         9+ZAwyKGUCdfeySGjEeCNlEKo+hcvVQiullzPgZ8pqbpUV/6cm9Qc1OB1MLxeiIp7S9l
         6Usw==
X-Gm-Message-State: AOAM533Wwer5nIWYAtcpPlipRf8K9WVnjD2m57St0htzIl3JMCDVIewC
	ADD4tZ/JFNol/clgTSqHkUU=
X-Google-Smtp-Source: ABdhPJy9Z0QJFqe6cKKB47PofJu4ImCaSAY2rIAC3OF0oUfynUY9z9LJA8WeX/SSyKKPAn3WOKJxLw==
X-Received: by 2002:ac8:6f49:: with SMTP id n9mr9866944qtv.375.1618801449820;
        Sun, 18 Apr 2021 20:04:09 -0700 (PDT)
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j15sm8586784qtl.88.2021.04.18.20.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 20:04:09 -0700 (PDT)
Date: Sun, 18 Apr 2021 23:04:07 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] novnc: upgrade 0.4 -> 1.2.0
Message-ID: <20210419030405.GA55205@gmail.com>
References: <1618537264-7180-1-git-send-email-zangrc.fnst@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1618537264-7180-1-git-send-email-zangrc.fnst@fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] novnc: upgrade 0.4 -> 1.2.0
on 16/04/2021 zangrc wrote:

> Refer to Fedora's style and upgrade to the latest version.
> 
> -License-Update: Copyright year updated to 2019.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>  .../recipes-extended/novnc/novnc_git.bb       | 51 ++++++-------------
>  1 file changed, 16 insertions(+), 35 deletions(-)
> 
> diff --git a/meta-openstack/recipes-extended/novnc/novnc_git.bb b/meta-openstack/recipes-extended/novnc/novnc_git.bb
> index 7099d85..07a9153 100644
> --- a/meta-openstack/recipes-extended/novnc/novnc_git.bb
> +++ b/meta-openstack/recipes-extended/novnc/novnc_git.bb
> @@ -1,52 +1,33 @@
>  DESCRIPTION = "HTML5 VNC client"
>  HOMEPAGE = "https://github.com/kanaka/noVNC"
>  SECTION = "web"
> -
> -PR = "r0"
> -
>  LICENSE = "MPL-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ac06308a999996ffc2d24d81b3a39f1b"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b428e7772bf00c07fb7b863b80358adf"
>  
> -SRCREV = "8f12ca7a5a64144fe548cada332d5d19ef26a1fe"
> -PV = "0.4+git${SRCPV}"
> +SRCREV = "9142f8f0f7b4a53447f5cfec3a797cbf0d6204a9"
> +PV = "1.2.0+git${SRCPV}"
>  
>  SRC_URI = "git://github.com/kanaka/noVNC.git"
>  
>  S = "${WORKDIR}/git"
>  
> -RDEPENDS_${PN} += "python-numpy"
> -RDEPENDS_${PN} += "python-novnc"
> -RDEPENDS_${PN} += "python-websockify"
> -
>  do_compile() {
>      :
>  }
>  
> +RDEPENDS_${PN} += " \
> +	bash \
> +"
> +
>  do_install() {
> -    install -m 755 -d ${D}${bindir}/novnc
> -    install -m 755 -d ${D}${datadir}/novnc/include
> -
> -    install -m 644 ${S}/vnc.html ${D}${datadir}/novnc
> -    install -m 644 ${S}/vnc_auto.html ${D}${datadir}/novnc
> -    install -m 644 ${S}/images/favicon.ico ${D}${datadir}/novnc
> -    install -m 644 ${S}/include/base64.js ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/des.js ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/display.js ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/input.js ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/logo.js ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/base.css ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/blue.css ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/black.css ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/playback.js ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/rfb.js ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/ui.js ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/util.js ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/websock.js ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/webutil.js ${D}${datadir}/novnc/include
> -    install -m 644 ${S}/include/jsunzip.js ${D}${datadir}/novnc/include
> -
> -    sed -i -e 's:#!/usr/bin/env bash:#!/bin/sh:' ${S}/utils/launch.sh	
> -
> -    install -m 755 ${S}/utils/launch.sh ${D}${bindir}/novnc-launch.sh
> +    install -m 755 -d ${D}${datadir}/novnc
> +   
> +    cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/novnc
> +    
> +    install -m 444 ${S}/vnc.html ${D}${datadir}/novnc/index.html
> +    install -m 444 ${S}/vnc_lite.html ${D}${datadir}/novnc/vnc_auto.html
> +
> +    install -m 755 -d ${D}${bindir}
> +    install -m 644 ${S}/utils/launch.sh ${D}${bindir}/novnc_server
>  }
>  
> -- 
> 2.25.1
> 

> 
> 
> 

