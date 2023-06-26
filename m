Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B84AEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 22:50:48 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.6394.1687819842705559162
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 15:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jPBZj1ri;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-634a3682c25so30352466d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 15:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687819842; x=1690411842;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKISJNjKKShedm4/bjRnh+IN0R+RAmexLMN10H6iVFE=;
        b=jPBZj1ricDIx096hmmdZq2Lk0eo0WQq0465HdMb5TiIm55qoQoe2YYGhbzpZl8VqRF
         2Oc3IT7n+h4SIALeYHne/1ndLs5bKaeTtX5Q+c0j6y7B4cMl5QkG0GsHOus7JvNwAsSY
         WNG0m7+j4o7VNLrbwuiq7a+iq1vXplWOE/VO+fAi7lD/IvjWciAYdK40ce9PLlulhHlQ
         wl4H1ePwzybWZNkSjdzAE97JfGtJ2TyCeGvEoPp8oU0jn4nVQAfW2c28D8jNtgw3LGGa
         qPpn818TJL0xbG1Ir5lIbXjgj59atu5Ek0DCgBFnE3tsvNoZBM32DeFBgrgKRX3SZFu3
         aExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687819842; x=1690411842;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKISJNjKKShedm4/bjRnh+IN0R+RAmexLMN10H6iVFE=;
        b=YfP0/M68eC+thulliXzsw0sJi9396RlK/PgUKdpaLgT66DtDKhwBsg2SY3X9inyzsX
         U7sC5L7gsjNELr4U9/+1HQk/o0zEXHCtysmsnY1vf5s3ZTt+yqYArojO8aLN3NVI2sPC
         2lqMsSbRYzwt3MOlMKxm26XxiETRXpTgA6ao2SgXBcdPkVPsznUBZtBnwmuXApKSXO2b
         iEhlBBjUNnyuol1cJilfC2p29Q5HwCNOjojmSpgmitCrYz54qp0Dssb0+kveLb4IsTkd
         6qJsQiLcM1n94DUAt0S3xVp89oWCODm4rXXWNFDvtqg/VSBHiS8aJoj3KcB8FQiecHJ+
         t05Q==
X-Gm-Message-State: AC+VfDy/cj0I9NmbJVjS2gyv/3q68fHihnHXZMN9bRwswTCyQuIclTI7
	ZLrR75JsD019V1i56d3+dcM=
X-Google-Smtp-Source: ACHHUZ7azWILjcbZzI9lK/o0nABr69xHLnZujxQTr4O24gTMME504hQYRuh9/JtBgjm6WTjooUVSlw==
X-Received: by 2002:ad4:4ead:0:b0:626:29d4:9a26 with SMTP id ed13-20020ad44ead000000b0062629d49a26mr31932397qvb.37.1687819841670;
        Mon, 26 Jun 2023 15:50:41 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id q11-20020ad4402b000000b00631ecb1052esm3657390qvp.74.2023.06.26.15.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 15:50:41 -0700 (PDT)
Date: Mon, 26 Jun 2023 18:50:39 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [mickledore][PATCH] Revert "yq: Redefine do_compile"
Message-ID: <ZJoWP4TRjMLbxi2l@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626122610.2729201-1-Martin.Jansa@gmail.com>
 <20230626162711.3354372-1-Martin.Jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 22:50:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8111

both mickledore patches are merged.

Bruce

In message: [mickledore][PATCH] Revert "yq: Redefine do_compile"
on 26/06/2023 Martin Jansa wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> This reverts commit 49a6827cbdb6e00d3af5e5c4a4479c47573a4533.
> 
> The workaround is no longer needed, as oe-core has upgraded go to
> a version that has fixed the issue.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-devtools/yq/yq_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
> index bd474a7..45f2f97 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -50,7 +50,7 @@ GO_IMPORT = "github.com/mikefarah/yq"
>  
>  inherit go ptest
>  
> -do_compile() {
> +do_compile:prepend() {
>      # arrange for some of the golang built ins to be found
>      (
>  	cd ${WORKDIR}/build/src/
> @@ -60,7 +60,6 @@ do_compile() {
>      # arrange for the fetched dependencies to be found
>      export GOPATH="${GOPATH}:${WORKDIR}/build/vendor/"
>      export GO111MODULE=off
> -    ${GO} install ${GOBUILDFLAGS} `go_list_packages`
>  }
>  
>  do_install:append() {
> -- 
> 2.41.0
> 

In message: [mickledore][PATCH] libvmi: add dependency on autoconf-archive-native
on 26/06/2023 Martin Jansa wrote:

> * since https://git.openembedded.org/openembedded-core/commit/?id=571132415ea7fe2d91c62948f2b6aa553eafa83d
>   this doesn't get autoconf-archive-native dependency and fails with:
>   http://errors.yoctoproject.org/Errors/Details/708195/
> 
>   ./configure: line 14424: syntax error near unexpected token `-fno-strict-overflow,'
>   ./configure: line 14424: `  AX_CHECK_COMPILE_FLAG(-fno-strict-overflow, HARDEN_CFLAGS="$HARDEN_CFLAGS -fno-strict-overflow", , -Werror )'
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-extended/libvmi/libvmi_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/libvmi/libvmi_git.bb
> index 6338b80..25d7d40 100644
> --- a/recipes-extended/libvmi/libvmi_git.bb
> +++ b/recipes-extended/libvmi/libvmi_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
>  SECTION = "console/tools"
>  PV = "0.14.0+git${SRCPV}"
>  
> -DEPENDS = "libvirt libcheck bison fuse bison-native flex-native"
> +DEPENDS = "libvirt libcheck bison fuse bison-native flex-native autoconf-archive-native"
>  
>  SRC_URI = "git://github.com/libvmi/libvmi.git;branch=master;protocol=https \
>             file://0001-Build-vbd-only-when-xen-is-enabled.patch \
> -- 
> 2.41.0
> 


