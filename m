Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F31C77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 15:49:20 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.53810.1684338552967461084
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 May 2023 08:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XbtPTumU;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-61b58779b93so8534456d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 May 2023 08:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684338552; x=1686930552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U9M2cq8kdyBsCqiakfeDbUaDR/ctS6GhfXH/2pVplcQ=;
        b=XbtPTumUiCTHYHc9JsktjAvgPFfJSHzGHEqUoyQmKu5ALmv7wNdzufwoGmOJIi6oyi
         /pe8ALfIYA1lMUKgb9EycZ+4ZoHWGRw04msAj0aJi2PutSI9ChlCKcWYFAYT+DIirb0t
         1MjWFfAGOd73QdoCUjrgJdItnCTWW+7YhWq9lh5uPlYi2zQb7FFEuMb6jJI1Ki7uZAsl
         IPfcsziqDDJc5jnRyg8N7ZAe4hoTG6PEoE/bdZMiIOER4KyF5zE4npmoaWKv2jc2TO46
         IYm7Qc+2xfMXMJkDTi7C/D7CLu+qTW5JaxX/mxdSP7ij/0Yn0rglWLqcm8wu5RN+G6qS
         KPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684338552; x=1686930552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9M2cq8kdyBsCqiakfeDbUaDR/ctS6GhfXH/2pVplcQ=;
        b=DUWSCUJNFCxua76sjVrdWjqpp2OAORvii+o2MbfdwSknLU0Y45AhUBYxpRswfg7vJ2
         Sa9a25bvbOp71jEseF1PYpbWzSeB+LIBb3Ns39IXLbF1GR1TCIteKmxbtM8YBOkAJO7q
         JekwEOP2fbN1WeKlohT4CBgOR4vg4t30KjKjj5FCRb/nLasR3fxBlEH41uXm3BlC3bzO
         20JOOq5rIlb10D3UiUMHgP+YKimkxaTabvjWeZWiOCPJwLmk6dZ80W0WH2/iPFdExJ5H
         g9isk9Z7zZIkRp2ONelcMpzsMxGaSuniXqUTvBYRSG96n7Q9DKfzZNew8HuoiK31ifTA
         5Ekg==
X-Gm-Message-State: AC+VfDyh8/0V8V3mAooUKAP0UmKHBp6/vPmC/wKlw9ZIkBOpDWKeih+G
	PRPQlc7RtryOPiHy111ZpTQ=
X-Google-Smtp-Source: ACHHUZ6m20Ze1KwMo7Eta9Orr1yaG67N+/qxHHKmdWda6oEnRGvEYV8KUCv5EleKtcB2ioMpcDVqYw==
X-Received: by 2002:a05:6214:490:b0:622:7b7f:ed45 with SMTP id pt16-20020a056214049000b006227b7fed45mr94528qvb.46.1684338551623;
        Wed, 17 May 2023 08:49:11 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id fh16-20020a0562141a1000b006215d0bdf37sm4896793qvb.16.2023.05.17.08.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 08:49:11 -0700 (PDT)
Date: Wed, 17 May 2023 11:49:09 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] yq: Redefine do_compile
Message-ID: <ZGT3dZ3rr1sKbw98@gmail.com>
References: <20230512050404.1105546-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512050404.1105546-1-mingli.yu@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 May 2023 15:49:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8061

In message: [meta-virtualization] [PATCH] yq: Redefine do_compile
on 12/05/2023 Yu, Mingli wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> This reverts commit 9b87b12885243c8cbba933e218c325416ec4d19d
> which states the linkshared issue is resolved. Actually the
> issue still exists as build fails on qemuarm64 and we still
> need the fix [1]. So add the fix [1] back and it's also better
> define its own do_compile and not let the do_compile logic
> in go.bbclass affect the build.

More yq and linkshared fun!

This is now merged to master and mickledore.

Bruce

> 
> [1] https://git.yoctoproject.org/meta-virtualization/commit/?id=d2a630ce6cf67a145f218012fbf02e4d0d9648df
> ---
>  recipes-devtools/yq/yq_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
> index 45f2f970..bd474a79 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -50,7 +50,7 @@ GO_IMPORT = "github.com/mikefarah/yq"
>  
>  inherit go ptest
>  
> -do_compile:prepend() {
> +do_compile() {
>      # arrange for some of the golang built ins to be found
>      (
>  	cd ${WORKDIR}/build/src/
> @@ -60,6 +60,7 @@ do_compile:prepend() {
>      # arrange for the fetched dependencies to be found
>      export GOPATH="${GOPATH}:${WORKDIR}/build/vendor/"
>      export GO111MODULE=off
> +    ${GO} install ${GOBUILDFLAGS} `go_list_packages`
>  }
>  
>  do_install:append() {
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8049): https://lists.yoctoproject.org/g/meta-virtualization/message/8049
> Mute This Topic: https://lists.yoctoproject.org/mt/98843722/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


