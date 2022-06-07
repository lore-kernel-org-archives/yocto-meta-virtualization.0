Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EB1C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 14:01:41 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.12890.1654610498833216461
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 07:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QmZiBR6T;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id o68so13243064qkf.13
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 07:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GC0ASFmlWw+vNEwf9SKMp4Q51cq+wnc6JkGrYldOzDo=;
        b=QmZiBR6TOgZqb7O5H3mUI2BYbV9LsBu/OM4pSFqPTcsSK0mO8wiWqhc0nY/MZi7PrQ
         oV7FFJW9eQcaXJoOBeYy+3jOMtMAveCrcMB1quFl6c4md1EJajW3vtgIM4GrPUqxLxYu
         NYRmvEK0FR9PYCxOzDyOdrsFmSadk9qdouwM+/1TZ4Ct9H6O6EIjSPU1ero2ri7dtr/u
         kAQNM0/aaJn2VSBESOxmgjRapgE8KfUuTUaBUrP2F1vzQBU5Fj8SmRFRvmAd/sBymj5e
         yrxdZ9j4vQzTKtPF5NLfScqE8GGITkiANEwNr8EsiL9CYYapo/xu9UAzJ47enTy0wwxq
         ojHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GC0ASFmlWw+vNEwf9SKMp4Q51cq+wnc6JkGrYldOzDo=;
        b=DXcS0p1pwssxZbagOGMrHfORz4D27nLnWrf+o8rY6l565lVYj+6bTNzMHjT7fTrdwm
         /80B4dQmI5nJSUBEmMEya9gKndGOsAaX0fmDJpMlPXdgDN/Xvj8hKk9VVJvWouWHLHwX
         rlCl9jJ1jfA29xZ/PM7j1q3UmAg48fTa6qDfYjvzSG7OHFOv0DIxACA7oLibEAZFuiBg
         yxBswBflSl8tvIJw1/vTeojN0hOhVqBTtWWsIbUJN0AnIJXV+QJmqgwAxtgmKzqR7ahy
         4bUdPpKQtZwjd9RT+8Mrs5R8Iw6pjixxCk39pHDhG/Fx307LTYoIwyE9kY5qNIaS0eAU
         cENA==
X-Gm-Message-State: AOAM5313mluJble+IEeGLUZuOdD/lrJFI0wNa9oNeQ1fRJtcsLtFfUjf
	IMfW5msEJxmm9ejmQcJjQ+UCp2K7VpgXLA==
X-Google-Smtp-Source: 
 ABdhPJxo7v6Zq8hFuOdqBgGpEzA6EO7PLqjvenavwY2ejWahXy3qK1+/nzkNw6aJoYOvpT3zEY9IfQ==
X-Received: by 2002:a37:e110:0:b0:6a6:80f0:5192 with SMTP id
 c16-20020a37e110000000b006a680f05192mr17201034qkm.706.1654610497624;
        Tue, 07 Jun 2022 07:01:37 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 n64-20020a37bd43000000b006a60190ed0fsm13287723qkf.74.2022.06.07.07.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 07:01:37 -0700 (PDT)
Date: Tue, 7 Jun 2022 10:01:35 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] criu: fix QA issue about shebang
 too long
Message-ID: <20220607140133.GA54262@gmail.com>
References: <20220526035519.63646-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526035519.63646-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jun 2022 14:01:41 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7338

merged (to master and kirkstone)

Bruce

In message: [meta-virtualization][PATCH] criu: fix QA issue about shebang too long
on 25/05/2022 Chen Qi wrote:

> There's a QA issue about criu complaining the shebang
> of crit script is too long. We should replace it with
> '#!/usr/bin/env python3'.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index 4b616ccf..77a12abf 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -81,7 +81,7 @@ do_install () {
>      # scripts. 'crit' is one of those scripts. The "executable" or "e" option to the
>      # setup call should fix it, but it is being ignored. So to avoid getting our native
>      # intepreter replaced in the script, we'll do an explicit update ourselves.
> -    sed -i 's%^\#\!.*%\#\!/usr/bin/env python3%g' ${D}/usr/bin/crit
> +    sed -i 's%^\#\!.*%\#\!/usr/bin/env python3%' ${D}/usr/bin/crit ${D}${libdir}/python3*/site-packages/crit-0.0.1-py3*.egg/EGG-INFO/scripts/crit
>  }
>  
>  FILES:${PN} += "${systemd_unitdir}/ \
> -- 
> 2.36.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7325): https://lists.yoctoproject.org/g/meta-virtualization/message/7325
> Mute This Topic: https://lists.yoctoproject.org/mt/91348088/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


