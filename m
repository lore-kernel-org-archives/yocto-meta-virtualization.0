Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69405C83F11
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 13:28:23 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.27061.1693142893065858288
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Aug 2023 06:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=k0GQgbUD;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-76da819edc7so143168685a.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693142892; x=1693747692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ct7iWvZIZRkNKmwXt2m0HZkHDXgOJO26rI7yjlpys/Y=;
        b=k0GQgbUDcfvc870NberbgFuJGtuN9bfgTmffhPMBYpxZZd5n3A7smLyUIDyRg2nPjs
         tyYkuzUZSUey++Joy9YDZ2KBDHvx1ngiXmyKjUSyPtny/gCm3QClngAct3qv2TWRys6P
         vtFa+BpClZwQuKCgE/qNPQCNDvsDeR5SPueoqQXnG7eSiCziDW6VZu81qtJe1LH2IsLk
         orqZ+EL1hdhTAAME6ole8KWX9X63S8UTfP8IEOewjIVS2zokPOrv68sW093YXj1Vj479
         fXacPQEYtvpf7VBuLuLcamTo/VsVCkDSX/cos0/SEVyVbQBJWizVJCoLGugf2PN6eO8s
         MERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142892; x=1693747692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ct7iWvZIZRkNKmwXt2m0HZkHDXgOJO26rI7yjlpys/Y=;
        b=BuIx2RxWV8B43UhRrcZQdkeIVXbt0GtcqXHR2Fgs/i8fkTAOVxrKJz0bxQcGWukrfG
         fRNQdSSvSk2FguFr5x7CuluRoND9fyTyLztRcEIS2sK3/XwOZ4Ct34XzJJiuzcwTjJRV
         ejoLRcLvpNEgtKUQzwUdN2nPHx02GjZ5Eu4mRV6nMJGqPxDfhY8VnTZmqjttvNRkZ2j2
         /1mBsv3vCH147pVYlMe/HI593I3CaIu6sWGp82laIiZPfO/HQzN60Q+Lexkg1oQAfZ2d
         X0AxMamajqygVhi7N6tobbBKOTTtLMgkhkKQ4SIzOLuE5QIMu2miOE9a9GC0ctnVr63X
         yPMg==
X-Gm-Message-State: AOJu0YwLZQRyl3CpSTjLUSfeeoCs1r+HMyO9oSaPpc7CuH3e0hfetaf0
	DGtPOht7Loj43AQgjGXnX7M=
X-Google-Smtp-Source: AGHT+IH+r8ackrssT+tTLfIEkKNC8avalv75oLfsKTVvuqMsPXvkOnY7Hi7gNa/hQlzoZsQJsZuaVA==
X-Received: by 2002:a05:620a:4084:b0:76c:e83d:2fb9 with SMTP id f4-20020a05620a408400b0076ce83d2fb9mr31272521qko.12.1693142892113;
        Sun, 27 Aug 2023 06:28:12 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t11-20020a0ce2cb000000b0064c9f754794sm1920058qvl.86.2023.08.27.06.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:28:07 -0700 (PDT)
Date: Sun, 27 Aug 2023 13:28:05 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCHv2] libvirt: update from fuse2 to
 fuse3
Message-ID: <ZOtPZfZHPxgUd45t@gmail.com>
References: <20230824081002.6730-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824081002.6730-1-f_l_k@t-online.de>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 13:28:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8239



In message: [meta-virtualization][PATCHv2] libvirt: update from fuse2 to fuse3
on 24/08/2023 Markus Volk wrote:

> Using fuse2 and fuse3 in the same environment can be problematic. Most
> projects I know of now support fuse3. ostree, flatpak, xdg-desktop-portal
> and some other recipes in meta-openembedded are configured to use fuse3 and
> libvirt is also able to do so.
> 
> This commit switches libvirt to fuse3 to reduce the number of recipes that still use
> the old version.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  recipes-extended/libvirt/libvirt_9.2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb b/recipes-extended/libvirt/libvirt_9.2.0.bb
> index 5e70470..9b5b2de 100644
> --- a/recipes-extended/libvirt/libvirt_9.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_9.2.0.bb
> @@ -156,7 +156,7 @@ PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux,"
>  PACKAGECONFIG[python] = ",,python3,"
>  PACKAGECONFIG[sasl] = "-Dsasl=enabled,-Dsasl=disabled,cyrus-sasl,cyrus-sasl"
>  PACKAGECONFIG[numactl] = "-Dnumactl=enabled,-Dnumactl=disabled,numactl,"
> -PACKAGECONFIG[fuse] = "-Dfuse=enabled,-Dfuse=disabled,fuse,"
> +PACKAGECONFIG[fuse] = "-Dfuse=enabled,-Dfuse=disabled,fuse3,"
>  PACKAGECONFIG[audit] = "-Daudit=enabled,-Daudit=disabled,audit,"
>  PACKAGECONFIG[libcap-ng] = "-Dcapng=enabled,-Dcapng=disabled,libcap-ng,"
>  PACKAGECONFIG[wireshark] = "-Dwireshark_dissector=enabled,-Dwireshark_dissector=disabled,wireshark libwsutil,"
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8226): https://lists.yoctoproject.org/g/meta-virtualization/message/8226
> Mute This Topic: https://lists.yoctoproject.org/mt/100931588/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


