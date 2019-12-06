Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.8532.1575659229089701544
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Dec 2019 11:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kCg/GXol;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id c2so283514qvp.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Dec 2019 11:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H2XOxHc1mu4WhtghvdQ9p6t/vnot9drBUvYKQAH9jqM=;
        b=kCg/GXolG/pbGFByp5H8xDvaVj1VKORemBUKOb6ft38SJXCiqZzRQXTFOmhzJ8rfqZ
         Rtu8webgi5+xhb9tNfnf6lH7BLW3wJH18hDIegLjrxbwfc2ZLxuy8XkeGwo+EGHrNBqz
         oWnWdb0ndwLb6qNDV0ynaqhwpOGmgPRv3WjnIUaQfWscQU18TKxBxjSjVr0qkrxOcVFS
         UDERKTwiWEfLRD1C3fX4r4yE0PQ/gsWqVGxJZawAsQwbwiYbEtJ8AFT6sidT1Eu4WxA7
         fKbrOv8xyjHMbQjKK3j+dTm/vI5IUz6vBy/raNvj8U3A0ZIN3PKJcgya7z7kyk9/+BBl
         a4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H2XOxHc1mu4WhtghvdQ9p6t/vnot9drBUvYKQAH9jqM=;
        b=ELrVo+S8PytdmS7c0gzXpRWZgR+6WlzQYKEQtwqNR6lIR+ZVFjmtviM0G06nuBZviO
         zxJ62dZd07JmaOfRv96NNziwyW+/dyY42tahsPe5WHXxzsMFgBwDdrMIq3Cbz2JAMDwM
         AipjxVsr57MgciBKcuu76ceFnFGXYYrhqf5OgK30cHIMHCQ3kL5M2ZtQatTIgeVabM0t
         eHDWpKuMBCjN2XHqODj6oh6LyJ1vbBO27ymN4ppManYeAj0gYsLM15kOUwaeoErfEhQu
         +LTuM4EoTWdwa5LKvBLz6QU6HL3SGfzzZjg51jVPGzzBey+rTCGwEguWGWbJs3EoLrsf
         uGOA==
X-Gm-Message-State: APjAAAX3Vuo7bE62ClWFtEDn8OcYOFZri8DuhaHOmaqDMyIigRml6A85
	kuL49JGQ/PM5LUqH18gvJjM=
X-Google-Smtp-Source: APXvYqz8eeEWQ1hGlvkY3pTEs77bcUOe8w97EjGDU4macb9H9iVUy4QULDRggS8yxmcm5LOzFhT3vQ==
X-Received: by 2002:a0c:b620:: with SMTP id f32mr14145487qve.186.1575659227892;
        Fri, 06 Dec 2019 11:07:07 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id j68sm1335305qkc.34.2019.12.06.11.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 11:07:07 -0800 (PST)
Date: Fri, 6 Dec 2019 14:07:05 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] cni: never uses module support since go was upgraded to 1.13
Message-ID: <20191206190701.GA37280@gmail.com>
References: <20191202084949.21918-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20191202084949.21918-1-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH] cni: never uses module support since go was upgraded to 1.13
on 02/12/2019 Hongxu Jia wrote:

> Since go was upgraded to 1.13, it support for Go modules by default [1],
> but for cni recipe, it uses GOPATH mode which supports offline build

This patch doesn't look like it is against meta-virt master .. we don't
have a cni.inc file.

Can you refresh the patch and resend ?

Bruce

> 
> [1] https://golang.org/cmd/go/#hdr-Module_support
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-networking/cni/cni.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-networking/cni/cni.inc b/recipes-networking/cni/cni.inc
> index 6590b27..7e5af04 100644
> --- a/recipes-networking/cni/cni.inc
> +++ b/recipes-networking/cni/cni.inc
> @@ -45,6 +45,7 @@ do_compile() {
>  	ln -sf ../../../../cnitool ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
>  	ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/github.com/containernetworking/plugins
>  
> +	export GO111MODULE="off"
>  	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
>  	export CGO_ENABLED="1"
>  
> -- 
> 2.21.0
> 
