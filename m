Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C40C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 15:13:47 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.44343.1676992420705909481
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 07:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JpPZqS8v;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id w23so4610654qtn.6
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Feb 2023 07:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pvnl+XEpe4pZKnU0v/aAAg2q+94eJT5k/kiIB8mXrKs=;
        b=JpPZqS8vdHoRNRvb59hGZMXIgqoDOR1eaAZFbn4ywo+ug6AaXfVRywzurCTbHN8Qku
         H/P3eMtUwc9FCHWQeDBy06UKrBGlrhSzwVEMqHgP8wP1sD7pm2jDGbY1pj8ERAl6Ehv1
         tGp+onk/FGKOjyKmZdmwdjE3NvG3g2UnOpSdOW0spHhTXddBz2i/5efB8X+KOKsAgcsr
         UU+MohnhQSOdQBXzzunnjsBirSUcdpSwbwA4nURIBtogtKoneYj7Lu3B44oWNvA9ZByU
         9ysJ8DLNWrg0RgW0Brs9iBzy7jCg45x2FReDrcGWJLztmPis2pYTSF9e7E1j+vrh+4m9
         pkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvnl+XEpe4pZKnU0v/aAAg2q+94eJT5k/kiIB8mXrKs=;
        b=RFqPm81k9bJBhdCoUP36pf7jOju2v2KyrhOc9euFU/ZWkapoFpPHTcxSWj5LQpXUgZ
         R9Wu4oNtF3Q+Fpj/nQVKJO6fSVq3dxp6+XoX909Kvy0mR4bNwewvdMPfmWfa9ycapu9x
         GNEIjc2Rqm64Cj1WQBhiwwUkqQ4IafPjcOKvV6H5heK6zVufRh3xISbnGkrg9nvcnRFm
         wsjvkWNn1hJTPVtcH59C6rsmgNGdoJmaUCxivDQQ5T6TO+VGGNxeBOshzjclC6fKJP4e
         y0tTkwzWsJ1Pvsvwd5uIsJ+VjTAMpRnFSMKmZrfXIxqa2PvtTHWyrJrBYZp0F7quFxe8
         cY1A==
X-Gm-Message-State: AO0yUKVuSeZ9Oi3FljDmyl+GlH7kRmXw3TJ2d4HMo8iKdwRsRppAsd5q
	UyeNdZPOsl8BMSJWxQxbNZE=
X-Google-Smtp-Source: AK7set8yzW6WaGqQ9s1TapiDxH4gNCVN0DxhrDqzhSrPevWC6sn2sfPZdF9VCfNDrxffobtZaxdzug==
X-Received: by 2002:a05:622a:54e:b0:3bf:a061:6cb1 with SMTP id m14-20020a05622a054e00b003bfa0616cb1mr5565737qtx.46.1676992419688;
        Tue, 21 Feb 2023 07:13:39 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id a17-20020ac80011000000b003b868cdc689sm1015996qtg.5.2023.02.21.07.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:13:39 -0800 (PST)
Date: Tue, 21 Feb 2023 10:13:37 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master-next][PATCH 2/3]
 container-host-config: provide /etc/containers/policy.json
Message-ID: <Y/TfoRtVsvnB8Hbg@gmail.com>
References: <20230220045423.84802-1-Qi.Chen@windriver.com>
 <20230220045423.84802-2-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220045423.84802-2-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Feb 2023 15:13:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7886

Good catch, I had meant to include this in the configuration
package and forgot.

This is now staged on master-next.

Bruce

In message: [meta-virtualization][master-next][PATCH 2/3] container-host-config: provide /etc/containers/policy.json
on 19/02/2023 Chen Qi wrote:

> The /etc/containers/policy.json[1] file is used to specify verification
> policy. For now, we can see it's used by both cri-o and skopeo. To avoid
> conflict, we use container-host-config to provide this file and make both
> skopeo and cri-o depend on it.
> 
> [1] https://github.com/containers/image/blob/main/docs/containers-policy.json.5.md
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../container-host-config/container-host-config.bb         | 2 ++
>  .../container-host-config/policy.json                      | 7 +++++++
>  recipes-containers/cri-o/cri-o_git.bb                      | 1 +
>  recipes-containers/skopeo/skopeo_git.bb                    | 1 -
>  4 files changed, 10 insertions(+), 1 deletion(-)
>  create mode 100755 recipes-containers/container-host-config/container-host-config/policy.json
> 
> diff --git a/recipes-containers/container-host-config/container-host-config.bb b/recipes-containers/container-host-config/container-host-config.bb
> index c762dea..c2f17bf 100644
> --- a/recipes-containers/container-host-config/container-host-config.bb
> +++ b/recipes-containers/container-host-config/container-host-config.bb
> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
>  SRC_URI = " \
>      file://storage.conf \
>      file://registries.conf \
> +    file://policy.json \
>  "
>  
>  do_install() {
> @@ -15,4 +16,5 @@ do_install() {
>  
>  	install ${WORKDIR}/storage.conf ${D}/${sysconfdir}/containers/storage.conf
>  	install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
> +	install ${WORKDIR}/policy.json ${D}/${sysconfdir}/containers/policy.json
>  }
> diff --git a/recipes-containers/container-host-config/container-host-config/policy.json b/recipes-containers/container-host-config/container-host-config/policy.json
> new file mode 100755
> index 0000000..bb26e57
> --- /dev/null
> +++ b/recipes-containers/container-host-config/container-host-config/policy.json
> @@ -0,0 +1,7 @@
> +{
> +    "default": [
> +        {
> +            "type": "insecureAcceptAnything"
> +        }
> +    ]
> +}
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 9467cf1..2ae3303 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -57,6 +57,7 @@ inherit systemd
>  inherit go
>  inherit goarch
>  inherit pkgconfig
> +inherit container-host
>  
>  EXTRA_OEMAKE="BUILDTAGS=''"
>  
> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> index 66168ca..4d062ed 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -82,7 +82,6 @@ do_install() {
>  	install -d ${D}/${sysconfdir}/containers
>  
>  	install ${S}/src/import/bin/skopeo ${D}/${sbindir}/
> -	install ${S}/src/import/default-policy.json ${D}/${sysconfdir}/containers/policy.json
>  }
>  
>  do_install:append:class-native() {
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7883): https://lists.yoctoproject.org/g/meta-virtualization/message/7883
> Mute This Topic: https://lists.yoctoproject.org/mt/97080776/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


