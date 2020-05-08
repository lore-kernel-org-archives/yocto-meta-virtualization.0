Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.2663.1588967760584228837
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 May 2020 12:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hulFyfzD;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id l18so1495864qtp.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 08 May 2020 12:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ScEWeUuXM7SKTukUmdRE2GtGUXQ2PGatC3asFiQOwNo=;
        b=hulFyfzDJVo3+znhmgQyymFgwumYgXGZBPVaD8G/5DkkGvAQ4daFx6/8IGaPSzThjn
         kBWjr0nnmNo8cXTSt2CbPrg3tosaD1bOEe+H3gzWYckzZ43X0LnJy5b0SyhWFmLfAgCu
         X6nyGk0Z3Y6M7Va76zZCL4j6qFwwe0/+WPeqXiBQJvmSBSaHT3n8D81/jzO3JNaKwV+S
         EaVzkqVkgi8yhhBuNGZKFJrCjcAbKhZKdDLatHi2E7LTBupmsThvOqFDPWiMLhahA8iB
         UZXxZZFcS4K1bqncefUaJmUStj4rrYwEx4dW6OMdHozXUh9VLGl1gLbdOz3Vd49WBnGw
         MxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ScEWeUuXM7SKTukUmdRE2GtGUXQ2PGatC3asFiQOwNo=;
        b=BeY6uF1m1xy/MKkA9bvG6vPFuRDoJGsk9stYhNvismn5A8PS5IY3J9dpscwcoC6lIS
         KzB8dwYs2L71tDoQvTxweKWW9hEeXByoF+NRLmXt+W16pXIO6klVZ8zVyyPA2YqUeG+p
         bDDX/rN7/B9O5qBXL0aBEM4TEAHR09O6gF8/PNkdi9ofGUAvk82Rca3J3jGFNc7Hj6IL
         ehSjStNIbYIz7TErzZ3nWo1G/zg5ga+EY0LLp/RFBNsTZi5xTCoGT0ue4czYodE86RaH
         Ta/yOMz8WHsAYtx+peZYmLKZlq/df7y1wzHMaLZINBSqFhU6NWXPATYvVpgS9QoDVCfl
         WRlg==
X-Gm-Message-State: AGi0PuY52IvHfbMc/OqVqUpuG7lgbhXgRqveiGDv1LBOfuxjbq+U6mGI
	BTe9QBFA/LJVmTqVNoy6uE4=
X-Google-Smtp-Source: APiQypJuShUzAtXSS0wPTyowPvz8TCC/6FChR224kxOYYKw+iggIjkR7YDxkZeo04WaEKqtjzx1N3g==
X-Received: by 2002:ac8:568b:: with SMTP id h11mr4790125qta.197.1588967759692;
        Fri, 08 May 2020 12:55:59 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 132sm1966818qkj.117.2020.05.08.12.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 12:55:59 -0700 (PDT)
Date: Fri, 8 May 2020 15:55:57 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Liu Haitao <haitao.liu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master,zeus][PATCH v2] go-pty: change the source address
Message-ID: <20200508195556.GA12940@gmail.com>
References: <1588817607-223768-1-git-send-email-haitao.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1588817607-223768-1-git-send-email-haitao.liu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][master,zeus][PATCH v2] go-pty: change the source address
on 07/05/2020 Liu Haitao wrote:

> The go-pty module has moved to https://github.com/creack/pty.

v2 is merged to master/dunfell/zeus

Bruce

> 
> Signed-off-by: Prashant Chikhalkar <prashant.chikhalkar@windriver.com>
> Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> ---
>  recipes-devtools/go/go-pty_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-devtools/go/go-pty_git.bb b/recipes-devtools/go/go-pty_git.bb
> index bc94b31..02cef69 100644
> --- a/recipes-devtools/go/go-pty_git.bb
> +++ b/recipes-devtools/go/go-pty_git.bb
> @@ -1,12 +1,12 @@
>  DESCRIPTION = "PTY interface for Go"
> -HOMEPAGE = "https://github.com/kr/pty"
> +HOMEPAGE = "https://github.com/creack/pty"
>  SECTION = "devel/go"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://License;md5=93958070863d769117fa33b129020050"
>  
>  SRCNAME = "pty"
>  
> -PKG_NAME = "github.com/kr/${SRCNAME}"
> +PKG_NAME = "github.com/creack/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>  
>  SRCREV = "05017fcccf23c823bfdea560dcc958a136e54fb7"
> -- 
> 2.17.0
> 
