Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A31EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 19:06:58 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.4721.1689102411269501276
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Jul 2023 12:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=b5eAyHvr;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-403af7dfa3aso22087051cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Jul 2023 12:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689102410; x=1691694410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+yj7TG8gd2oS0pkslr/hlejCozFq9PBjbGzHvE1Muzg=;
        b=b5eAyHvr/rftIOTEKysQhmEQ9897/5y11CojmJ3LG5K5hR6HQfBAEd2/wBtC+MGN/2
         +WD+m2geD86FPZmQMQyvI/3AShth4q5qCnjON/kaxTv6iaPCT9prT0G3/IPDP5qm3jxZ
         AyFA1wQmE3wkeOrN0WjOdt00joXzSyPKM0P74akps/6Nt/UOoeXo2BaN7n0sJDcTdIYF
         g6o2dIPhIysLEhHeRFO6aEFbMCF9TWuUY9VOvB2gbSYLmHkUqleiZUPh6YQE7jxSB1BF
         LjMvECjwXdPqmI+siTHqI8EOW+gUaCk2GWc6tYRh5IyE+aJsHysML5wRFDwVD8cFU0Ur
         hRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689102410; x=1691694410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yj7TG8gd2oS0pkslr/hlejCozFq9PBjbGzHvE1Muzg=;
        b=L24Jw7H6vtM2OD7VZKQkV5pT1C9SVo0lgAIGcuJopovzd8HTIpbfPc7C1ldDVCW4gc
         64GJzCfsxIAHYJ8FxyulrZ4TKfHBcpF25Tgr0hmD/zF0jJ3MpXts3KA6/6hrPuKQQibX
         DNL7SXUqK5/gYZr5AOU0+zu4EYPK0+LO9lZqywvvCY6IiWa8fsUlgt0Po9cJo/IZdk0f
         +ntIWJr2G/xDa7HI/W96v9NkALcvYl3qDT7zo1yuBnromVcs2PHbl77e6KgxYtMjNt5f
         OBNH4EZ8+0Yz2ld+C1A1k/qYlHE+PhTQr0plnoEsAz1ismWU/VAWc8WchPzhsTNpc0B0
         MTgA==
X-Gm-Message-State: ABy/qLb7CkSPkJIo8Em41n7bkkKPIBoXUZgQ7W216v6gzF4nVGPpbYfj
	nZop26msPywo2zDSXn0A7yo=
X-Google-Smtp-Source: APBJJlFcnHTPG6taWiARN1SPw6Ixy0a7KjwdJ7Ivok7z4v498aGt649ZDCN6lHcDALdvUtOfCDeG4g==
X-Received: by 2002:a05:622a:2d5:b0:403:ad38:8b52 with SMTP id a21-20020a05622a02d500b00403ad388b52mr11387100qtx.44.1689102410295;
        Tue, 11 Jul 2023 12:06:50 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id x13-20020ac8538d000000b00403ad47c895sm1406540qtp.22.2023.07.11.12.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 12:06:50 -0700 (PDT)
Date: Tue, 11 Jul 2023 19:06:48 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Chen Qi <Qi.Chen@windriver.com>
Subject: Re: [mickledore][PATCH] cni: fix textrel QA issue
Message-ID: <ZK2oSGXaRX8roo9F@gmail.com>
References: <20230707084424.2476021-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707084424.2476021-1-Martin.Jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Jul 2023 19:06:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8126

In message: [mickledore][PATCH] cni: fix textrel QA issue
on 07/07/2023 Martin Jansa wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> When building cni, we get textrel QA issue like below:
> 
>   cni: ELF binary /usr/libexec/cni/macvlan has relocations in .text
> 
> The problem could be solved by adding '-buildmode=pie' to ${GO}.
> 
> In go.bbclass, this flag is added to GOBUILDFLAGS conditionally,
> that is, if the arch is not mips nor riscv32, this '-buildmode=pie'
> is added to GOBUILDFLAGS. So make use of that.

merged.

Bruce

> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-networking/cni/cni_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
> index 35aea39..06cef81 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -38,10 +38,10 @@ do_compile() {
>  	export GO111MODULE=off
>  
>  	cd ${B}/src/github.com/containernetworking/cni/libcni
> -	${GO} build -trimpath
> +	${GO} build ${GOBUILDFLAGS}
>  
>  	cd ${B}/src/github.com/containernetworking/cni/cnitool
> -	${GO} build -trimpath
> +	${GO} build ${GOBUILDFLAGS}
>  
>  	cd ${B}/src/github.com/containernetworking/plugins
>  	PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
> @@ -49,7 +49,7 @@ do_compile() {
>  	for p in $PLUGINS; do
>  	    plugin="$(basename "$p")"
>  	    echo "building: $p"
> -	    ${GO} build -trimpath -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
> +	    ${GO} build ${GOBUILDFLAGS} -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
>  	done
>  }
>  
> -- 
> 2.41.0
> 

