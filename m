Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3008.1578518420250049793
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jan 2020 13:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B17N2mUD;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC692E014C8; Wed,  8 Jan 2020 13:20:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,RCVD_IN_DNSWL_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB90EE01405
	for <meta-virtualization@yoctoproject.org>; Wed,  8 Jan 2020 13:20:17 -0800 (PST)
Received: by mail-qk1-f196.google.com with SMTP id a203so4075875qkc.3
        for <meta-virtualization@yoctoproject.org>; Wed, 08 Jan 2020 13:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3l1x612zOkBTHx83tPtDBdsn5UjSTv5NJ3JTEFIbSkI=;
        b=B17N2mUD879OOoj/p36D3+HN2FpdxKWnsmVT4mXfvjhDllaHa9MOHo5FcpwZNWc+bC
         /hamjw13sOV4u6Gwt9hvzb2NNpo1TWtZpMu6XbQSr6ybpdKxpCDtYJ5/CU4xCFf8ZQWC
         DxbmslTcq70G/LIDET5jlJz5OfqZnmsyqwLK2f76qX9yzqWCetYUnyfkZrsaNSV/+YD6
         kTtt0am3xcq67ldpVRnnN3rA7WtFc0mj8nlVSs2ymL5iGm6O5WRT5xXY40iLZ+YuJnuN
         ZNRrhCSCFKWwHWrSRxyRf9DgtnHbG16F4o0bHyM52xNM0igYv42BSXGEmZAgGiA/ThLX
         CwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3l1x612zOkBTHx83tPtDBdsn5UjSTv5NJ3JTEFIbSkI=;
        b=VZV1lt3gnTK1Gkvzac+Aof2NywU7J1t7ea18DqiXfIQgydk91qFDO5nGyHm/VHQvsq
         QGJTjxKv06yqpg5RKsQxuY2INl2E4HGUlPrpjbaX2mfhTIO4p987qJ8VGa49MbqCM6j1
         bAbT7SPFHzR+BQR45OnBKtRR57ODXJSwc8MG3cDjCDUZEVgpyk/oKCk7TMtwECouoRbi
         z4O0lK/T0UBtLqIEIRUmggoMvG/1EPEIYrkooBFfDaWBgRO4SdBxSwrE+vjA06BI7zEJ
         iaDMISQjS65gE6gpQgSSM4DrQpgZJp2C0pcXyyPa0lrlMg41gYOWcdZQ9oyjE79jNsaj
         QkLA==
X-Gm-Message-State: APjAAAXpBS9tR4z5+uRRdwX0oWlTe+XhE868oxXSQ2UI6aQ8lLiStDap
	t+NmaW1td5HLJHk4lLagqaA=
X-Google-Smtp-Source: APXvYqx+XpvLortDUkKxm90pM1VWN/OUW1ApjQ7zuQBnlNgOboNM4PqycwGdv4jl9ObStP7MZesJzA==
X-Received: by 2002:a37:8ac4:: with SMTP id m187mr6290075qkd.277.1578518417232;
        Wed, 08 Jan 2020 13:20:17 -0800 (PST)
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id k29sm2132112qtu.54.2020.01.08.13.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 13:20:16 -0800 (PST)
Date: Wed, 8 Jan 2020 16:20:14 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] docker: remove docker.service.rpm
Message-ID: <20200108212011.GA12328@gmail.com>
References: <20200103012143.33707-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200103012143.33707-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization][PATCH] docker: remove docker.service.rpm
on 03/01/2020 Chen Qi wrote:

> This file is useless and misleading. Remove it.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/docker/docker-ce_git.bb | 1 +
>  recipes-containers/docker/docker-moby.bb   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> index 817795f..8b8136d 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -107,6 +107,7 @@ do_install() {
>  		install -m 644 ${S}/src/import/components/engine/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system
>  		# replaces one copied from above with one that uses the local registry for a mirror
>  		install -m 644 ${S}/src/import/components/engine/contrib/init/systemd/docker.service ${D}/${systemd_unitdir}/system
> +		rm -f ${D}/${systemd_unitdir}/system/docker.service.rpm
>  	else
>  		install -d ${D}${sysconfdir}/init.d
>  		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
> diff --git a/recipes-containers/docker/docker-moby.bb b/recipes-containers/docker/docker-moby.bb
> index 0936fdf..0e1f4e2 100644
> --- a/recipes-containers/docker/docker-moby.bb
> +++ b/recipes-containers/docker/docker-moby.bb
> @@ -126,6 +126,7 @@ do_install() {
>  		install -m 644 ${S}/src/import/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system
>  		# replaces one copied from above with one that uses the local registry for a mirror
>  		install -m 644 ${S}/src/import/contrib/init/systemd/docker.service ${D}/${systemd_unitdir}/system
> +		rm -f ${D}/${systemd_unitdir}/system/docker.service.rpm
>  	else
>  		install -d ${D}${sysconfdir}/init.d
>  		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
> -- 
> 2.17.1
> 

> 

