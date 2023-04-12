Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C25C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 17:07:59 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.49736.1681319270100030525
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 10:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Bj6B/vcM;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id m16so1173702qvx.9
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 10:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681319269; x=1683911269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mexy+qzlC85Rkt8ALEY7JfWt54MVJJWH1EJJvQ0e/4=;
        b=Bj6B/vcMzpWsEnk7t4YkdrWbf9yoJxuzWaFvKAA7Vm+8zWA1V5pi7JBKSnmcMqohwg
         0PJ5sfnEHdkOrG7xXs+Jkz2wH2fFEKsMUIWNuIaVc8dNM5qRgJqSAfn6bSrs2Jk+0V05
         Llch8SjCYHZzaFQpp8XjtFZE9+f/sxLBpRltG9EmnyYjfk1Pn6E+mvy+mPxzPhwTuVPa
         mJCnJvkxocDsLWSmFT0Wp8Ka2EUdK/YjG96LB5tOe9j2XaWYkcvutxwl6ndOJxDFopMm
         UU7D5yy2JwFbndvb29Tc6xy1Vam8FBmP9h3erGIk1jBCjQ3SZUsimt3zwIQIAGbuadmT
         gWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681319269; x=1683911269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mexy+qzlC85Rkt8ALEY7JfWt54MVJJWH1EJJvQ0e/4=;
        b=LPr1jvqGTov2xcJyOI/RL2q0eIh83MygZDNUCP/ZmzPfsgV835uAiUy0hhdjxyB0CE
         15j/I4drFntM6DVnLXcEGEPRfVHHw20s9x9D10xiPUGalUkiedyhmIAuW9h/pLjNCN8Y
         0l/vIFWTTNcMGhgqNQ7C8dVcGzt9GomCwx7CugX/4ldHAtbuBLpFA51zqdpxf1VuWsXV
         xygCkD1JbPmHcwCVGufm4JQE8rCyZF/TwXXc4HNTrkGOk4WDS9JZ4ktxSHJKyY9o7iSI
         DDeGW7dh/fWFknhGcsy5B5Hsdy5m3badsimjbCwkShYDi74KEIhuEUwiIJKh371qqm4Q
         2xgg==
X-Gm-Message-State: AAQBX9ei3YlzF3XBo15Hv2oWipCxtZFZEvKSIpTWM8mQPOGYxXUdbZMW
	CZOOT6dU4M0wPcCPCx7mdW0=
X-Google-Smtp-Source: AKy350ZJizPRv/Dz/XFs16v4IdckJ/bY12N4WmJpTBCbyuLrhORDS3Pq2Ml3ytP3vcVEHEZS7ijo1Q==
X-Received: by 2002:a05:6214:c6f:b0:5a2:abf1:7d33 with SMTP id t15-20020a0562140c6f00b005a2abf17d33mr23863509qvj.50.1681319269063;
        Wed, 12 Apr 2023 10:07:49 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id ld9-20020a056214418900b005eab96abc9esm2640281qvb.140.2023.04.12.10.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 10:07:48 -0700 (PDT)
Date: Wed, 12 Apr 2023 13:07:46 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] aardvark-dns, netavark: add seccomp
 to REQUIRED_DISTRO_FEATURES
Message-ID: <ZDblYipYLFksz31D@gmail.com>
References: <20230401233800.3053681-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230401233800.3053681-1-Martin.Jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 17:07:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7987

staged on master-next.

Bruce

In message: [meta-virtualization][PATCH] aardvark-dns, netavark: add seccomp to REQUIRED_DISTRO_FEATURES
on 02/04/2023 Martin Jansa wrote:

> * because of runtime dependency on slirp4netns
> 
> * fixes:
> ERROR: Nothing RPROVIDES 'slirp4netns' (but meta-virtualization/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb RDEPENDS on or otherwise requires it)
> slirp4netns was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)
> NOTE: Runtime target 'slirp4netns' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['slirp4netns']
> NOTE: Runtime target 'aardvark-dns' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['aardvark-dns', 'slirp4netns']
> NOTE: Runtime target 'netavark-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['netavark-dev', 'aardvark-dns', 'slirp4netns']
> NOTE: Runtime target 'netavark' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['netavark', 'aardvark-dns', 'slirp4netns']
> NOTE: Runtime target 'aardvark-dns-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['aardvark-dns-dev', 'slirp4netns']
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/aardvark-dns/aardvark-dns.inc | 4 ++++
>  recipes-containers/netavark/netavark.inc         | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/recipes-containers/aardvark-dns/aardvark-dns.inc b/recipes-containers/aardvark-dns/aardvark-dns.inc
> index 70c94dd..8c74439 100644
> --- a/recipes-containers/aardvark-dns/aardvark-dns.inc
> +++ b/recipes-containers/aardvark-dns/aardvark-dns.inc
> @@ -16,6 +16,10 @@ do_install_ptest () {
>  	cp -r ${S}/test ${D}${PTEST_PATH}
>  }
>  
> +# Rdepends on slirp4netns
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES ?= "seccomp"
> +
>  RDEPENDS:${PN}-ptest += " \
>      bats \
>      bash \
> diff --git a/recipes-containers/netavark/netavark.inc b/recipes-containers/netavark/netavark.inc
> index 1127adb..c15bbea 100644
> --- a/recipes-containers/netavark/netavark.inc
> +++ b/recipes-containers/netavark/netavark.inc
> @@ -8,6 +8,9 @@ PACKAGECONFIG ?= "aardvark-dns"
>  # netavark will be functional without it.
>  PACKAGECONFIG[aardvark-dns]= " , , , aardvark-dns"
>  
> +# Rdepends on aardvark-dns which rdepends on slirp4netns
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES ?= "seccomp"
>  
>  SRC_URI += " \
>      file://run-ptest \
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7978): https://lists.yoctoproject.org/g/meta-virtualization/message/7978
> Mute This Topic: https://lists.yoctoproject.org/mt/98005671/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


