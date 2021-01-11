Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web08.29200.1610338492489330102
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 10 Jan 2021 20:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S1xOJB1+;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id z5so16488186iob.11
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 10 Jan 2021 20:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=r5BtBpNwHz5DYzvprWUI3bspedQ6KypZgu/kVM/ggAI=;
        b=S1xOJB1++oz9sYalpPQryyO1IGqsO7HGpfIMww4MnJRFz10ZtWoFQkf5yxQ+jBycMc
         EP12FXtR7spvWli0sy6oWL2sXHPA9+yibS/7DZ30Lw0DeVs7n09r2IYTLBBjoNcEkBeW
         2khUr5yuT2/3jMnzGKx4M5nIhqxV4AABY0UmE8yddGuisfQvF0vCXrkcbyTJ2H1XHSat
         +3Jo+Lry0ROb5qCJa/1PUBfcpBwZDN5mtHFSAtUtowetNgue5v9r2ABS5INooLhRbbfw
         QlrgZ38A7YPPfuYzJT6UmWDtIJIKZ0LvdVE5VkTqOYmpm4DwnEk1LWFGyCP3aFEvmHke
         viGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=r5BtBpNwHz5DYzvprWUI3bspedQ6KypZgu/kVM/ggAI=;
        b=oC7Tlw2ZI0/kYsvUOBOfKNWRctoxShOyea3USUx+pm5bdbZ+oLW4xbGqCIEm4ko7BE
         IUCBAcXWdIvwtVx7puZsrMrIztiap2P+/iJhGxWSmhxDT3G7TMBcP8nkm9cu5BRySama
         pXWIMbjTNjbdjEwP2Q+7pHv3k5MHfalU40+LetWPMmhcI77BtCzkZBndubRQorTGweeY
         7vD1CVM4SNp6acfXDXKFKbwOSLSUAbXpi0uH5i7XavALzW+WutG0azHjTqCeRX5hAknK
         SJYwaoXpHLXmX/mFNyoUGrTn4b/KgZwZMKxdU8Cih+2vsoFi5oaVWmKh7GtvursuEtg3
         pFpw==
X-Gm-Message-State: AOAM530gjkACyUQJOAziExd16W1PudYxkL0AH6FGFTBOdSLd4NeYHXn6
	xSz43U4jhZp99I6jk0HNBs0=
X-Google-Smtp-Source: ABdhPJzgmfgjvkUgtxMMDaxGyF8EpVoQW9M/v7mRKuwBJl0KYKKZpRyG/+fd1zf5G9q6EaotTI4gBw==
X-Received: by 2002:a02:c8c7:: with SMTP id q7mr13104776jao.7.1610338491689;
        Sun, 10 Jan 2021 20:14:51 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id l15sm6169759ilk.88.2021.01.10.20.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 20:14:51 -0800 (PST)
Date: Sun, 10 Jan 2021 23:14:49 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] ipaddress.git.bb: update SRC_URI to avoid redirection
Message-ID: <20210111041446.GA26888@gmail.com>
MIME-Version: 1.0
In-Reply-To: <dda5b1a0-5373-6910-3e74-bb9e559b2086@crashcourse.ca>
 <d2964417-6959-4a5b-fd2d-59a28685f07e@crashcourse.ca>
 <4c4fcf3-f4c8-2a14-48d4-4034ce869c0@crashcourse.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Sorry for the delay, I was tied up working on k3s in meta-virt and fell
behind a bit.

These are now merged.

Bruce

In message: [meta-virtualization] [PATCH] ipaddress.git.bb: update SRC_URI to avoid redirection
on 27/12/2020 Robert P. J. Day wrote:

> 
> Current SRC_URI just takes fetcher to new location.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/meta-openstack/recipes-devtools/ruby/ipaddress_git.bb b/meta-openstack/recipes-devtools/ruby/ipaddress_git.bb
> index 116bcf5f..017c6c73 100644
> --- a/meta-openstack/recipes-devtools/ruby/ipaddress_git.bb
> +++ b/meta-openstack/recipes-devtools/ruby/ipaddress_git.bb
> @@ -20,7 +20,7 @@ SRCREV = "96aaf68210d644157bd57a6ec3e38c49f38bfc34"
>  S = "${WORKDIR}/git"
> 
>  SRC_URI = " \
> -    git://github.com/bluemonk/ipaddress.git \
> +    git://github.com/ipaddress-gem/ipaddress.git \
>      "
> 
>  inherit ruby
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
> 
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================

> 
> 
> 


