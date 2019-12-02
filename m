Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.3.1575259674292692904
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Dec 2019 20:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RM9zAZww;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id z3so313386qvn.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 01 Dec 2019 20:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7p13u7DYXr7XqfR8E40pz7RubOD/BEMdcZB//YQKatw=;
        b=RM9zAZww1frk2ou1RzZV+W2SXAVVyQtQjBiYbqHIBciEPEMOqSMwu/1JK33tcn+xWm
         nHI7BGLsTD83LqRKnr8sjKwuKyvGJ6emMPAuSj0Kj1EL5fJSB1KBColfWHpFVA14vXt7
         0pS6KT9Cb//cLhA97tFoxyCwj1gQ9WtpxSkZ6Q8BP06rKIExvlRg4XRJWZxdH8yYMyhj
         9eRsGU2GOnyVTsy3Z+ME9JGmkQca5EZB1aEPXFJtbp6J091GcgczFTlrCeDXZ4LqxC0F
         3fTDpuOjNlEmFMC9nEpZ2BZidJMkUsWc7sB7yeCLglA3+eqtCd+sXpGR8GoYk53oV33U
         pHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7p13u7DYXr7XqfR8E40pz7RubOD/BEMdcZB//YQKatw=;
        b=aE9J27hWrZi5zKrNEsJQeLmflxITNYGFlAKBSqd7yfsEVbEy/A7gOcnT/XdYWWHrAJ
         Z1cujxrgGuxGic1caEV/bTlM9E8s32SI6caU39UROGtSdxJtOhmLTXW7ya6OEzVrVaMG
         pwRdA499r75DQvu3L2dZR5/kRxak4VM0ICduD13idjTM1EY23jF0UAJLK903UZjO7dPp
         bkKt8I49JzthOBusvWKWQbsiwXW78LhnAU/eDztoQIC9z4Ek9mwjfCkXqrJMLF+X9dL4
         1ZelD7VSkFOQkBtPcGS7n36c/T+I6JiGRqnmEyODmuJlq/VqQ9c8eR7c1FU96ps/LKoh
         dcQg==
X-Gm-Message-State: APjAAAU0fQLWY9yJcvGqXABGZQeW2Ipx4L0B/o+/TQ+iB+eQQrXUZHWW
	bEqdlz7zb23R4jq0cQd/SiuxsafiV0Q=
X-Google-Smtp-Source: APXvYqwnrWd+JK7socyWYiKvLyTn08BXL+eJWSL87/Wvwjmu6BtY/FOEXshhIaXLw1jZEyo0AVVIuw==
X-Received: by 2002:a05:6214:15cf:: with SMTP id p15mr1663408qvz.140.1575259673026;
        Sun, 01 Dec 2019 20:07:53 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id b3sm15273953qtr.86.2019.12.01.20.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 20:07:52 -0800 (PST)
Date: Sun, 1 Dec 2019 23:07:50 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH V2] cri-o: workaround failure since go upgraded to 1.13
Message-ID: <20191202040747.GA27299@gmail.com>
References: <20191201082034.38965-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20191201082034.38965-1-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH V2] cri-o: workaround failure since go upgraded to 1.13
on 01/12/2019 Hongxu Jia wrote:

> Since go was upgraded to 1.13, there is a failure:
> ...
> | src/vendor/golang.org/x/net/http2/frame.go:17:2: use of vendored package not allowed
> | ../../../recipe-sysroot/usr/lib64/go/src/net/http/h2_bundle.go:49:2: use of vendored package not allowed
> ...
> 
> Refer upstream suggestion [1]:
> `or copying your vendor contents into GOPATH/src rather than
> mapping them in to GOPATH/src/vendor.'
> 
> [1] https://github.com/golang/go/issues/34068

v2 is merged.

Bruce

> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 8d754ec..4fee385 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -109,6 +109,9 @@ do_compile() {
>  	# fixes the bin/crio build of oe_runmake binaries below
>  	ln -sf ../../../../cmd/crio ${S}/src/import/src/github.com/cri-o/cri-o/cmd/
>  
> +	# workaround `use of vendored package not allowed' failure
> +	mv ${S}/src/import/vendor/golang.org  ${S}/src/import/
> +
>  	cd ${S}/src/import
>  
>  	if [ "${CRIO_BUILD_CROSS}" = "1" ]; then
> -- 
> 2.21.0
> 
