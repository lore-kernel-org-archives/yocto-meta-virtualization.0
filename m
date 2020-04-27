Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.1163.1587952090834225788
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Apr 2020 18:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LaWZrBIO;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id s30so13113089qth.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Apr 2020 18:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qL3ue7kgfBMA3gOtl5YheU47GQXZWeqQMz9vToqQCQo=;
        b=LaWZrBIOVOT/3RwakLMNK9RfqpbKkSVtakTN6ykQYl0gOEls+ULonVM6Bd6PgPobaF
         v3F8uWuBk7c6mXPuIrmmMY36z8WxO2E/7RyXiO2EReKu9tkWTUlbxYMw4dyIE31v7pWp
         C5Q14oYhQZ7n+pdScg0qCEeHuCJBoVg6swwI2Gk0up7ktGYGmV9dtB0d6LKnaEseKKT+
         9zbL6CaMW8BAbvxeKtoUJMtjdFVCyGXE3m5UGfqTWJ8fT5umRmxeICv2CL4MOpXJGFwR
         sNYD661WjomSs/Fhuhqiv+3Vj5NvrWnldKOWYZFDk4owDsfCoIjvJ8eFlHZBc6kwYjIK
         Jk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qL3ue7kgfBMA3gOtl5YheU47GQXZWeqQMz9vToqQCQo=;
        b=QcU7mXJYiH5sxyWsRNYTNe3eUigN7XtbKrfIJbK/0V3JJK9kSqVnohL8jjL1pI9X0J
         6NkamSXwW+rSOfg89ndd6u5Ywdzp6jE68SuSPNSke/cZKwHFzGzxXAXwde7wTRXGoerA
         9VQhN1VoltAfOdTyma2bOXsdFN97WtuPi32wyh4XxKzUYCDJWt39ISuWu7WfBCBYFzxs
         t8rDFT4SQrQzyOD3UOA3g3ouhKbKfu9WEDfq2bEbgpZ+UgAJObgTIWtTqs1oaRM/VDRe
         nG9IS00giCvOjJYlS7zTxr0axk3sqvQr65oOAWXuq3rEQwq0y88aaH2fc2q5qoxhtO9l
         2n8w==
X-Gm-Message-State: AGi0PuYuy2KR74LFzqSpuQgYMTcEKjpbLH1HfHhIdGtmtZ9PxYL4WJ6X
	qiC/hGoJhiLhwkTcnKvW9uc=
X-Google-Smtp-Source: APiQypKg7+LdmPfWNAy4VNnUCEQfv3tdIon/2fTrxoUWuXU5PD7AN2moj1zdVskSg1XTiTs8YvXh6A==
X-Received: by 2002:aed:221c:: with SMTP id n28mr20421549qtc.235.1587952089844;
        Sun, 26 Apr 2020 18:48:09 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id r128sm8867482qke.95.2020.04.26.18.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 18:48:09 -0700 (PDT)
Date: Sun, 26 Apr 2020 21:48:07 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH v2] lxc: Upgrade to 4.0.2
Message-ID: <20200427014804.GA19175@gmail.com>
References: <1587460875-189890-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1587460875-189890-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

v2 is merged.

Bruce

In message: [meta-virtualization] [PATCH v2] lxc: Upgrade to 4.0.2
on 21/04/2020 Yu, Mingli wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-containers/lxc/{lxc_4.0.1.bb => lxc_4.0.2.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-containers/lxc/{lxc_4.0.1.bb => lxc_4.0.2.bb} (97%)
> 
> diff --git a/recipes-containers/lxc/lxc_4.0.1.bb b/recipes-containers/lxc/lxc_4.0.2.bb
> similarity index 97%
> rename from recipes-containers/lxc/lxc_4.0.1.bb
> rename to recipes-containers/lxc/lxc_4.0.2.bb
> index bfe003c..bc7f88b 100644
> --- a/recipes-containers/lxc/lxc_4.0.1.bb
> +++ b/recipes-containers/lxc/lxc_4.0.2.bb
> @@ -51,8 +51,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>  	file://lxc-net \
>  	"
>  
> -SRC_URI[md5sum] = "5f19f13eafdde24c75ba459fc6c28156"
> -SRC_URI[sha256sum] = "70bbaac1df097f32ee5493a5e67a52365f7cdda28529f40197d6160bbec4139d"
> +SRC_URI[md5sum] = "cc62e734c900f39d770f0de51c868aac"
> +SRC_URI[sha256sum] = "ca336dcdf303fea5ff231d89a9b6278b061c4cffb14f0db0a71a15bdd95a5cb0"
>  
>  S = "${WORKDIR}/${BPN}-${PV}"
>  
> -- 
> 2.7.4
> 

> 

