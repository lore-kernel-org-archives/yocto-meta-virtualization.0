Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.2664.1633055414518601292
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 19:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nKOSL2d2;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id 72so7833727qkk.7
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Sep 2021 19:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o8cq8v9SZiazphK7xULfZKUgGUPNDBlYvc52hqAmgLk=;
        b=nKOSL2d2dQ5nmQPQss/xnLXGs1Jw76Fygh1mPFjKplg8yA5Istj8QCGC76ogguDAeP
         pefpekgx7kQ/taU8C/YIX79FGD+91GC50vf1Fedsik+XNWXKBM/ZTffQsBpAnIJKli2w
         C5NxtmOKWMciSlIZHlV1mSmEuQCOy+pwOcx8RJzFxY5gYNblU4Gj2BD/sgbdtKvblplK
         Gk6uU69o9wFMfktdszUelqwNzTtmWAIN5odPavfKYdWPq/QGH3l5DWWY0qy6B80atnC6
         NZEClv9QNZKxOEH+e+fdGC2bZrdtPoYjwedHrk35VHNjFFthWDxH8sD7oXgxkR1V66/W
         n+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o8cq8v9SZiazphK7xULfZKUgGUPNDBlYvc52hqAmgLk=;
        b=p6aGpJsAlr9h1kCCjvEpRcXcA4myDk8yUUGBDcj3dvqot1tIv4YzNEFX0ETRZjVBHj
         KWLAZaCyK7Xnajh7v8Ww8HT5S8a3U7fbnZAJmUuhVueT2hNrpwRP2QL2gEl85RC0oXGt
         3tpKubgZp3LS8PGKSxZJwLsEKXkZAUyWebjsWFzBh5/fGCtMdKMMSwNz5pJWZE/Wafaf
         V6K/2eW7ecELv8yLK85IChnRj7DgrJ2ElNhqnuLzNiP5as8I0xOv0YGVTJfWx97PR2AE
         L+u1Y4ddhtmyW0t2AZqV2ME1paBoQQFM0FbSQiwBH5pxoF0X3qmdA/toJJHBmKyIlebG
         1KeA==
X-Gm-Message-State: AOAM533FM/qowInT/D6lK3VTebvstXavc2VnS3ZsIO2H6EXGYaUzidTJ
	t0O/EaEgjpL9RXqoXTX7UrIlyQutqCVhFw==
X-Google-Smtp-Source: ABdhPJzb45qoWt0DISbZP+Mt09mwTUPIXHyL4WyoCnxthrN9bYXzwxcjaUgCYJrsm+xyf9y7cyKjwA==
X-Received: by 2002:a37:6841:: with SMTP id d62mr7887389qkc.107.1633055413490;
        Thu, 30 Sep 2021 19:30:13 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id x18sm2350825qkx.94.2021.09.30.19.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 19:30:13 -0700 (PDT)
Date: Thu, 30 Sep 2021 22:30:11 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: kai <kai.kang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] kubernetes: update sed expression
Message-ID: <20211001023008.GA11771@gmail.com>
References: <20210926094115.14844-1-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210926094115.14844-1-kai.kang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


In message: [meta-virtualization] [PATCH] kubernetes: update sed expression
on 26/09/2021 kai wrote:

> From: Kai Kang <kai.kang@windriver.com>
> 
> It misses a backslash in sed expression and causes warning when
> run do_compile:

Since this wasn't actually doing anything, we could likely drop it now.
I remember adding it, and without it, we'd have build issues .. so the
fact that it was building without it being properly done is a good
sign.

That being said, since we are far along in the dev cycle, I'd rather
not experiment with dropping it completely, so I've merged and pushed
the change.

Bruce

> 
> | sed: -e expression #1, char 35: Unmatched ) or \)
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index e165ebe..1ba52b6 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -50,7 +50,7 @@ do_compile() {
>  	export CGO_CFLAGS="${BUILD_CFLAGS}"
>  	# as of go 1.15.5, there are some flags the CGO doesn't like. Rather than
>  	# clearing them all, we sed away the ones we don't want.
> -	export CGO_LDFLAGS="$(echo ${BUILD_LDFLAGS} | sed 's/-Wl,-O1//g' | sed 's/-Wl,--dynamic-linker.*?( \|$\)//g')"
> +	export CGO_LDFLAGS="$(echo ${BUILD_LDFLAGS} | sed 's/-Wl,-O1//g' | sed 's/-Wl,--dynamic-linker.*?\( \|$\)//g')"
>  	export CC="${BUILD_CC}"
>  	export LD="${BUILD_LD}"
>  
> -- 
> 2.17.1
> 

> 
> 
> 

