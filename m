Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2410.1574715928147985858
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 13:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uv4NXae9;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFD3DE00E5C; Mon, 25 Nov 2019 13:05:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,RCVD_IN_DNSWL_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  2.8 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.219.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEB45E00DAE
	for <meta-virtualization@yoctoproject.org>; Mon, 25 Nov 2019 13:05:26 -0800 (PST)
Received: by mail-qv1-f66.google.com with SMTP id x14so6400983qvu.0
        for <meta-virtualization@yoctoproject.org>; Mon, 25 Nov 2019 13:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dhntXM2ugLMlN1Yr/yoMrJgyvT43W96DNQ3CxOQfV/0=;
        b=uv4NXae9cqHugHDHWEE9RzSwcNK8wCK/BubCf5G6KxJM991G2/7ZSBXc/JCOxHGRRk
         /HJSqt7UARfuWKJhrciMzQeXbS5P4G2L98Boae3TCXeqJkbMlaYjj6Sa9NOJ5/l3oJdn
         985rdIYjYYtRXmc1OkUhfm000cSH/mDIL/BZfezjqWj6VBaICaOXkgT+OGw/5ZQDAXHT
         xNNeYPgYBw1EDcQ8/HDhf8YKn0ET5BbvFedUqa2LJOmyw5huHeDukNuqDVPMwZRZLdpf
         IE500ykT+wOUFCzgxZxZhoaQaudlSHFHoKjAQr6zs55vuvtRw94u4qHTlBIBPxVVVYaj
         vy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dhntXM2ugLMlN1Yr/yoMrJgyvT43W96DNQ3CxOQfV/0=;
        b=kXRQVCBylUbi4TYhCZLWcoM2zt0sGg7tOoIq8e1mLWo70wt7tRteITRSA11fcoz3XK
         qou3GS35HpA4T7r2j3fgrLe7jHAf+F/7gbT17SrEIwLG0hKcA9Io2KVPccCsv9fb6pr0
         t5uSAlQ0VGbqdcMXt3Ct7taLScv6qUlM0tEJzpwHywoy3nVwELhcMjVn5ipiGwKZIGJe
         7WrShw+b2LozBQ70pB51Y1fAjSrYNL8/ggi1E/QLMplLPn0EHokleDJy/pWcF1EZejDF
         c1JeAlgp2hxZ0RNLVAe8RxsP+abJjcSEkzn3nrM/Fr5NjhWYUybs58NnlAgmnQMZ7tLo
         BteA==
X-Gm-Message-State: APjAAAWFXXFm+J3ynrQsd9tSxn3L4d9YVGsTt3ERqDACPSYDi/JcN4i8
	7aaHo4KH2GQhZkZxaTrYKzs=
X-Google-Smtp-Source: APXvYqwYMo6RxAw/kxJ2ZSWmSvo+B2NbZlChcuGwJZ0w9WgwqMTB5KiXEXi3ns6E4P0AnLU82FZycA==
X-Received: by 2002:a05:6214:5c8:: with SMTP id t8mr13596777qvz.231.1574715925874;
        Mon, 25 Nov 2019 13:05:25 -0800 (PST)
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id p78sm3954344qke.131.2019.11.25.13.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 13:05:25 -0800 (PST)
Date: Mon, 25 Nov 2019 16:05:23 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] cri-o: Disable for all mips machines
Message-ID: <20191125210523.GC27677@gmail.com>
References: <1574664958-32698-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1574664958-32698-1-git-send-email-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


In message: [meta-virtualization][PATCH] cri-o: Disable for all mips machines
on 25/11/2019 Hongxu Jia wrote:

> Since commit [a092153 containerd: Disable for all mips machines] applied,
> and the cri-o runtime depends `virtual/containerd', it should do the same
> thing to disable for all mips machines


merged.

Bruce

> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 34276f4..8d754ec 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -164,3 +164,4 @@ INSANE_SKIP_${PN} += "ldflags already-stripped"
>  
>  deltask compile_ptest_base
>  
> +COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
> -- 
> 2.7.4
> 
