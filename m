Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA59C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 19:11:08 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.476.1716923460302143845
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 May 2024 12:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B/a1OKyY;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-43fdb990b3aso4690081cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 May 2024 12:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716923459; x=1717528259; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c3lW2duBDwzNO/NzyOTgIaL6z0wMmu6bzrGHDvBGj/E=;
        b=B/a1OKyY4qC+YQP+O5uly5fNh+c+srO2tTmeEX2M+JHfiFT/sKXSghnoCBWaTnZ6RX
         vszCyyI/PQTOSmmg5M0U69OCcXmqyiYFZNXhdJgoot9XzjnCWneEK1PgpajLu5yqiSbb
         Ci//wRf01QKVZ7btws66NSpnVXlJty+5CbqynKx5AsCuz9e7Vy5/OqNiPPM8zn7mtsGB
         uJknNQtP9Vkg7DzAglhJH+WPl7EUtq8eYnXQJSLekfpSUJkivPVTme3PI2UBBj9xzpnR
         OIr18zW7DzjQVOVG3h4UBgGCiTbmcsYwgNdzQfxkakc8JnHp1nOwGPUUgYnlRWtdw53M
         bASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923459; x=1717528259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3lW2duBDwzNO/NzyOTgIaL6z0wMmu6bzrGHDvBGj/E=;
        b=FvnZjHI0xLuypx5m2m5hPXopyt3xT1+QLJ2W14VhOdJAEcqWr0gTLK16mwt0PwXJY+
         NaRiLHJBNcdI/oUeTc7YHO4BXsYW7ffNu7yRXMuznUq8jfQ4TfqK4jBNiHUx17bY4wZj
         W9hvCY7Tj8hbiH+JFbqBWwF4GXrflltUeXLuwfya2t/lxvOMgjSxbb3RkESlGXqwWUF9
         nw1Ct7pobW7GBM8OfA1vrbe+yvFL17bEavuxN6LH3uaJJ8JqmDdazBTV5mJKjpVZig7a
         1RkcutdKdchzPLGT/opD7pd2YLR4uneq7zjc6owM8cQFPts4ksXvPUzoFd8+t1Gb0YCx
         5GAg==
X-Gm-Message-State: AOJu0Yz7u1R0qpLq7zdwZ+/3051WjcfJ+RXOXKt6CbMuvZdT17m1wBxI
	1pTuxZEJgcrQYeuiEogkgFBMGuCLuAL5/UvtLWVxeK6EPNcVtUQp
X-Google-Smtp-Source: AGHT+IHRiVE1tcDr4xoY4xOCrJ7eFr4EMGbMGLT1MPVjlMf8D8G01uvyeDHNbI8IWLRfYkFKfJwUIA==
X-Received: by 2002:a05:6214:3b82:b0:6ad:7f8a:ea82 with SMTP id 6a1803df08f44-6ad7f8af245mr65482146d6.38.1716923459134;
        Tue, 28 May 2024 12:10:59 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac162ef7f5sm47049016d6.85.2024.05.28.12.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:10:58 -0700 (PDT)
Date: Tue, 28 May 2024 19:10:56 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [kirkstone][PATCH] kubernetes: fix
 do_patch failure
Message-ID: <ZlYsQMyrx2EeYera@gmail.com>
References: <20240517062021.116829-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517062021.116829-1-martin.jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 May 2024 19:11:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8771

merged.

Bruce

In message: [meta-virtualization] [kirkstone][PATCH] kubernetes: fix do_patch failure
on 17/05/2024 Martin Jansa via lists.yoctoproject.org wrote:

> * introduced in:
>   https://lists.yoctoproject.org/g/meta-virtualization/message/8715
> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 78d1cd2a..f374892a 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -35,7 +35,7 @@ SRC_URI:append = " \
>             file://cni-containerd-net.conflist \
>             file://k8s-init \
>             file://99-kubernetes.conf \
> -           file://CVE-2024-3177.patch \
> +           file://CVE-2024-3177.patch;patchdir=src/import \
>            "
>  
>  DEPENDS += "rsync-native \
> -- 
> 2.45.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8730): https://lists.yoctoproject.org/g/meta-virtualization/message/8730
> Mute This Topic: https://lists.yoctoproject.org/mt/106149214/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


