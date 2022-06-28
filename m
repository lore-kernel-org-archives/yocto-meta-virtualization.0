Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9463DC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 03:39:42 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web12.51446.1656387576006476564
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 20:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dusrbudl;
 spf=pass (domain: gmail.com, ip: 209.85.219.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id z1so1023378qvp.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 20:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=Q/ukOeYbacyZ7StNYljJrJePLq2DiKgWQVILG39nf7c=;
        b=dusrbudlW2Zsf+zFynmbEiLByfg6EsWUelFOhgAxd5OAd4HLxqw4l0qnupuPXrA9H5
         dpTadJNW2ViCO2yVYRv7mPZqgcXhVj2nXAAfa8YEvTVndPvekhUEkAZLk4GKqjV1AM47
         +YfHAet+y8BsHInoy0EN7kfQ2om4Sj7Md6wZhb710Dh+W3C5FH1Y3CTw3QlZySHuPxBY
         uLEAjs7q9pXE6ebJCQPNF1/78KmF8Qh2IlSaJrHQlKYGMhyr3xhJvR3suChJp4iTLqMC
         g2l4UuJM1e8ANuvNq98gyGrimOkrWUqQDUZvYt/WAASx+it94/8FEiGUg/UW1f3fPAmZ
         ie4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q/ukOeYbacyZ7StNYljJrJePLq2DiKgWQVILG39nf7c=;
        b=C8JmaZd5mlQaJ2HyVdHO/7TYu/ob3/sM/dQ06ofh3Y1MnlGwWYKh3j2dl6nDO9HZOG
         Xqe/Mg1jR5ZocRd1/8bdLgmrLN+ovQUXO6nkvjO28y5vPS8/q4sHDWVzVpoNum+9c2ld
         6BD3NOkYVVSvKTWY66hhdlZvCSrGtaiOdJAker0uChvs9elBimeNEKjh2LF6Wr0Rx0bM
         tD9zUCFc6P6xgEBE80EOB1yIIWyFTzR8xHS7zivllocgx59q0Wkm7ib+gIvf5b7ofLZA
         4I4Gh/wgk6JW+RzBcMGQ5HTRFvydPD5mV7qtCRXJQkJl1Qvp7tHRg4cI5XrnNF8Kl7/0
         McuA==
X-Gm-Message-State: AJIora8BOtK3BJEN9zDpK7voJflvSBj4R6ayLDOQu7I7nfdNdYHHWJ46
	RygaSiqoUFdYDWiC7Su9dTfuizMHfWEeIg==
X-Google-Smtp-Source: 
 AGRyM1t8FPD2mBXWoHq9TA+9IkcOzHNqCOyeklXVh/5LCjTswSNaJ7eHkXGWHUD27a0EwmZ28Wg6cQ==
X-Received: by 2002:a0c:9ccd:0:b0:470:7f96:8e93 with SMTP id
 j13-20020a0c9ccd000000b004707f968e93mr2067943qvf.64.1656387574918;
        Mon, 27 Jun 2022 20:39:34 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 s10-20020a05620a0bca00b006af0ce13499sm7952751qki.115.2022.06.27.20.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 20:39:34 -0700 (PDT)
Date: Mon, 27 Jun 2022 23:39:32 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master|kirkstone][PATCH 1/2] cloud-init:
 add rdpends for netifaces and charset-normalizer
Message-ID: <20220628033929.GA9737@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621165510.324992-1-jpuhlman@mvista.com>
 <20220621220011.778623-2-jpuhlman@mvista.com>
 <20220621220011.778623-1-jpuhlman@mvista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jun 2022 03:39:42 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7397

Thanks Jeremy,

All three patches have been merged to master and kirskstone.

Bruce

In message: [meta-virtualization][master|kirkstone][PATCH 1/2] cloud-init: add rdpends for netifaces and charset-normalizer
on 21/06/2022 Jeremy Puhlman wrote:

> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  recipes-extended/cloud-init/cloud-init_21.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
> index c6e64b3..9c2dae7 100644
> --- a/recipes-extended/cloud-init/cloud-init_21.4.bb
> +++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
> @@ -56,6 +56,8 @@ RDEPENDS:${PN} = "python3 \
>                    python3-jsonschema \
>                    python3-pyyaml \
>                    python3-oauthlib \
> +                  python3-netifaces \
> +                  python3-charset-normalizer \
>                    bash \
>                   "
>  
> -- 
> 2.35.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7393): https://lists.yoctoproject.org/g/meta-virtualization/message/7393
> Mute This Topic: https://lists.yoctoproject.org/mt/91910328/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][master|kirkstone][PATCH 2/2] cloud-init: install sysvinit initscripts
on 21/06/2022 Jeremy Puhlman wrote:

> The redhat versions work with out modification.
> 
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  recipes-extended/cloud-init/cloud-init_21.4.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
> index 9c2dae7..5cb6227 100644
> --- a/recipes-extended/cloud-init/cloud-init_21.4.bb
> +++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
> @@ -19,6 +19,11 @@ DISTUTILS_INSTALL_ARGS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'syste
>  do_install:append() {
>      ln -s ${libdir}/${BPN}/uncloud-init ${D}${sysconfdir}/cloud/uncloud-init
>      ln -s ${libdir}/${BPN}/write-ssh-key-fingerprints ${D}${sysconfdir}/cloud/write-ssh-key-fingerprints
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> +       install -m 755 -d ${D}${sysconfdir}/init.d/
> +       install -m 755 ${S}/sysvinit/redhat/* ${D}${sysconfdir}/init.d/
> +    fi
> +
>  }
>  
>  inherit pkgconfig
> -- 
> 2.35.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7394): https://lists.yoctoproject.org/g/meta-virtualization/message/7394
> Mute This Topic: https://lists.yoctoproject.org/mt/91910329/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][master|kirkstone][PATCH] cloud-init: add depend on udev in sysvinit case.
on 21/06/2022 Jeremy Puhlman wrote:

> Just as with systemd, the build needs the dev manager installed
> as a dependancy
> 
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  recipes-extended/cloud-init/cloud-init_21.4.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
> index f549db9..c6e64b3 100644
> --- a/recipes-extended/cloud-init/cloud-init_21.4.bb
> +++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
> @@ -26,8 +26,9 @@ inherit setuptools3_legacy
>  inherit update-rc.d
>  inherit systemd
>  
> -# setup.py calls "pkg-config systemd --variable=systemdsystemunitdir" and needs to find our systemd
> +# setup.py calls "pkg-config systemd --variable=systemdsystemunitdir" and needs to find our dev manager
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'udev', '', d)}"
>  
>  inherit python3native
>  
> -- 
> 2.35.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7392): https://lists.yoctoproject.org/g/meta-virtualization/message/7392
> Mute This Topic: https://lists.yoctoproject.org/mt/91904265/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



