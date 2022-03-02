Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE67C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 20:49:37 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.2951.1646254176789669199
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 12:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GLr1vTR+;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id bt3so2858056qtb.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 12:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uYQ7vTmlXgiAEIBGEB0+SVdwvF8FNMWxNggXXwoopVw=;
        b=GLr1vTR+YaskNZCTG6uroAlmDw3G1XiTDt/duWEDfrYgW5Z/b0jovi5mJNYoS7hQ29
         rzwfjmEGfmWMng3w9/kgoWCVkzBILUOac3N8vNckHayvEMr2oyGPoji0QbISgpkIn5I5
         OcosefjWC2DUqmmcuzuBsPzGXX66WQ6xnQ7At8URjMwiVf07Ok6q/xzpNuNfhPjxD08l
         gacjU2v/RNnDvbRAPQPYZTrApSH1iTKoV/sfmJGcc9KnqiZW64tmgRG8f0eUKprdPGBD
         jIbCvpuD7nhl1tXeorJvc9SW4iF1oxIJMpXwV+A2bztmD7t9qU8+I0g72hS4UB9LvuE4
         hprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uYQ7vTmlXgiAEIBGEB0+SVdwvF8FNMWxNggXXwoopVw=;
        b=IF15lAzV8GKIEvHJqoa8Los915h/EJFnumPAZ30Vdljd9yO4o1zJ4To8gcknIDtp89
         ApWuOFN8I2D0IrWTPU/ShisTqmN0iPUTFThR8V1xhKFOTzGPdRet2Zrbs0jQnF/+2pJV
         V22eMFH6/52vGYquVRIeow2SWaKFnUxwQAwOKiKfPJs745n7Y4sBA18v54EY1KC1A3em
         XqCfjJQDCpbVNLDkUfaSDi0NOIxpFzYkveAk33/O3ZOey1QnqQALBk5j8ozsMfFBhaoa
         BhbLYBV7volheqketFuQtOyz3CQoRENSfFzyicOrsC9l6TBfVRu0uzvOi9UnoVlo34fZ
         4bkA==
X-Gm-Message-State: AOAM533BZyBRYJKks4V2BcZeb7sddCP9RjFIzE9pFoAifObdQnmnq75H
	ciS6+nsUwm+WSylLzFqn1AbuTwSeyp2TRw==
X-Google-Smtp-Source: 
 ABdhPJwdVjkFCazxN+beo7QUa12r15kVhB0qlWtXlVaOrUDzituBMa7jnTV/v/KyHZxAYzsMKMzj8g==
X-Received: by 2002:a05:622a:1206:b0:2de:4af7:2dbb with SMTP id
 y6-20020a05622a120600b002de4af72dbbmr25387863qtx.140.1646254175789;
        Wed, 02 Mar 2022 12:49:35 -0800 (PST)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 f13-20020ac87f0d000000b002dce143f369sm41993qtk.53.2022.03.02.12.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:49:35 -0800 (PST)
Date: Wed, 2 Mar 2022 15:49:33 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] glusterfs: switch from
 distutils3 to setuptools3
Message-ID: <20220302204930.GA52030@gmail.com>
References: <20220228204144.4184386-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228204144.4184386-1-jpuhlman@mvista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Mar 2022 20:49:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7074

merged.

Bruce

In message: [meta-virtualization][m-c-s][PATCH] glusterfs: switch from distutils3 to setuptools3
on 28/02/2022 Jeremy Puhlman wrote:

> ---
>  recipes-extended/glusterfs/glusterfs.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
> index 646b521f..5c960bca 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://COPYING-GPLV2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING-LGPLV3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
>                      file://contrib/fuse-util/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  
> -inherit autotools pkgconfig distutils3-base update-rc.d systemd
> +inherit autotools pkgconfig setuptools3-base update-rc.d systemd
>  inherit python3-dir
>  
>  DEPENDS += "bison-native flex-native python3-native fuse libaio libtirpc libxml2 ncurses \
> -- 
> 2.24.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7068): https://lists.yoctoproject.org/g/meta-virtualization/message/7068
> Mute This Topic: https://lists.yoctoproject.org/mt/89460716/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


